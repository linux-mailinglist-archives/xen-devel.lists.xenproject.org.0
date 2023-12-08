Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2FC80A6EB
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 16:10:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650667.1016374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBcTz-00011q-AW; Fri, 08 Dec 2023 15:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650667.1016374; Fri, 08 Dec 2023 15:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBcTz-0000yx-7H; Fri, 08 Dec 2023 15:09:39 +0000
Received: by outflank-mailman (input) for mailman id 650667;
 Fri, 08 Dec 2023 15:09:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rBcTx-0000yp-KV
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 15:09:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBcTx-0000vo-36; Fri, 08 Dec 2023 15:09:37 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.23.116]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBcTw-0008RD-T6; Fri, 08 Dec 2023 15:09:37 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=K63/xIogE4iZbjBh2h6zoWCyyEbPi+TyQhckMRPBQgQ=; b=bCqGVCrjDuffGtOMNw7hV/vhGM
	fhPL9cOEoXsDE2xBLdhxKE/OO4jIDGSgvkkfmevtXaji/07TsS8KTnma7p8Qf18TGkzLn6qgDBFPe
	t25mps3Ipcm9XaSCoN/d88lWm0xvpq0cGK43rEK8G9AylH9n0bDsyNdmoTvrPfRVbrog=;
Message-ID: <b9892005-ab12-454a-9788-02571e868e67@xen.org>
Date: Fri, 8 Dec 2023 15:09:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/11] xen/arm: introduce allocate_domheap_memory and
 guest_physmap_memory
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, Penny Zheng <Penny.Zheng@arm.com>,
 xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231206090623.1932275-1-Penny.Zheng@arm.com>
 <20231206090623.1932275-5-Penny.Zheng@arm.com>
 <992ba724-8dfa-4285-8e92-16dfb870e4ed@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <992ba724-8dfa-4285-8e92-16dfb870e4ed@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/12/2023 09:38, Michal Orzel wrote:
> Hi Penny,
> 
> On 06/12/2023 10:06, Penny Zheng wrote:
>>
>>
>> We split the code of allocate_bank_memory into two parts,
>> allocate_domheap_memory and guest_physmap_memory.
>>
>> One is about allocating guest RAM from heap, which could be re-used later for
>> allocating static shared memory from heap when host address is not provided.
>> The other is building up guest P2M mapping.
>>
>> We also define a set of MACRO helpers to access common fields in data
>> structure of "meminfo" type, e.g. "struct meminfo" is one of them, and
>> later new "struct shm_meminfo" is also one of them.
>> This kind of structures must have the following characteristics:
>> - an array of "struct membank"
>> - a member called "nr_banks" indicating current array size
>> - a field indicating the maximum array size
>> When introducing a new data structure, according callbacks with function type
>> "retrieve_fn" shall be defined for using MACRO helpers.
>> This commit defines callback "retrieve_meminfo" for data structure
>> "struct meminfo".
> This patch introduces quite a bit of complexity with all these helpers, so adding a rationale is crucial.
> AFAIU, all of this is because we don't want to reuse struct meminfo where NR_MEM_BANKS is defined as 256,
> which is a lot more than we need for shmem. Am I right?

+1.

> 
> I would like others to share the opinion here as well.

If possible, I'd like to reduce the footprint of the shared memory. But 
this should be balanced with the complexity of the code.

Briefly looking at the patch series, we have two structures:

struct meminfo {
     unsigned int nr_banks;
     struct membank bank[NR_MEM_BANKS];
};

struct shm_meminfo {
     unsigned int nr_banks;
     struct membank bank[NR_SHM_BANKS];
     paddr_t tot_size;
};

IIUC, the logic is mostly to be able to know the maximum size of the 
array and also the number of slots already used.

So we could have the following common structure:

struct membanks {
    unsigned int nr_banks;
    unsigned int max_banks;
    struct membank *banks;
}

Then the definition for the two other structures could be:

struct meminfo {
     struct membank holders[NR_MEM_BANKS];

     struct membanks banks;
}

struct shm_meminfo {
     struct membank holders[NR_SHM_BANKS];

     struct membanks banks;

     paddr_t tot_size;
}

And then 'banks.banks' would point to the 'holders'. And 'max_banks' 
would be set to the maximum.

There might be other way to make the structure more nicer. Like (untested):

struct membanks {
     unsigned int nr_banks;
     unsigned int max_banks;
     struct membank[];
}

struct meminfo {
     struct membanks common;
     // We should ensure there are no padding
     struct membank[NR_MEM_BANKS];
}

We would then pass &meminfo.common to allocate_domainheap_memory().

With that there should be no need for extra helpers.

What do you think?

Cheers,

-- 
Julien Grall

