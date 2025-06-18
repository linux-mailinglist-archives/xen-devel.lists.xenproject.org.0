Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 711DFADE478
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 09:23:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018893.1395770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRn8R-0002x1-M1; Wed, 18 Jun 2025 07:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018893.1395770; Wed, 18 Jun 2025 07:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRn8R-0002uN-Io; Wed, 18 Jun 2025 07:23:03 +0000
Received: by outflank-mailman (input) for mailman id 1018893;
 Wed, 18 Jun 2025 07:23:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uRn8Q-0002sv-9E
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 07:23:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uRn8N-007mqs-1C;
 Wed, 18 Jun 2025 07:22:59 +0000
Received: from [2a02:8012:3a1:0:64b5:81ad:1f26:5fcb]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uRn8M-009Mon-3C;
 Wed, 18 Jun 2025 07:22:59 +0000
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
	bh=8aFOdicdhZSYQpw8utsqP6kBFkP/wqBVhk2/BY88tMI=; b=OPCOmKJNTV92h5stRF2dQSJ9/8
	SuCs0Iglw+CoI3lfJVu7vv9APX/Nmt1cjPeSRM3qrjQlJPTXjhm1TX7F+CWPgcO2FNwqhKi1W+t8A
	i98MspLXqQ+vGtKVxvxzh8B0PLccasD+q0U71LfVMNaYTk0GWO4GZfdw82oN/bNvVA84=;
Message-ID: <538e4b45-74e7-4992-a9e2-7678756f7612@xen.org>
Date: Wed, 18 Jun 2025 08:22:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 6/8] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Juergen Gross <jgross@suse.com>, Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <318044ae12f13b6b297b3f5fda577a1a6cd143da.1747669845.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2505231114050.147219@ubuntu-linux-20-04-desktop>
 <04B1F737-5E6B-47C0-B2B9-74288C68E68A@arm.com>
 <50ff5d2b-bd17-4833-b497-0dda6f75964a@epam.com>
 <alpine.DEB.2.22.394.2506171625110.1780597@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2506171625110.1780597@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 18/06/2025 00:38, Stefano Stabellini wrote:
> On Thu, 12 Jun 2025, Grygorii Strashko wrote:
>> On 02.06.25 10:17, Bertrand Marquis wrote:
>>>> On the other hand, if we also want to handle the case where the SCMI
>>>> server could be on a separate co-processor, then what this code is doing
>>>> is not sufficient because we also need a dcache flush, in addition to
>>>> the DSB.
>>>>
>>>> Bertrand, can you double-check?
>>>
>>> If we want to handle a case where the memory is accessible to a coprocessor
>>> but there is no cache coherency, we need to flush the dcache definitely.
>>>
>>> Seeing the amount of data here, I do agree with Stefano that it would be a
>>> good
>>> idea to make the provision to flush the data cache in all cases. Even if the
>>> data
>>> is accessed by a secure partition or the firmware coherently, flushing in
>>> all cases
>>> would have very limited performance impact here.
>>>
>>> There is the other solution to have some kind of parameter to say if the
>>> accessor
>>> has coherent cache access but I do not think the performance impact here
>>> would
>>> justify such a complexity.
>>>
>> The SCMI shmem expected to be mapped as MT_NON_CACHEABLE in all cases.

I can't find MT_NON_CACHEABLE anywhere in Xen or Linux. My 
interpretation is that the memory attribute would be normal memory non 
cacheable. However, this doesn't add up with ...

>> The Linux does devm_ioremap() -> ioremap() ->
>> (ARM64)  __ioremap((addr), (size), __pgprot(PROT_DEVICE_nGnRE))

... this line. This is device nGnRE which is a lot more restrictive (for 
instance it doesn't allow unaligned access).

>>
>> There is also note in docs:
>> "+- shmem: shared memory for messages transfer, **Xen page aligned** with
>> mapping``p2m_mmio_direct_nc``."
>>
>> In the case of SCP - the SCMI shmem can be actually be in SRAM.
>>
>> So, are you sure cache manipulations are required here?
> 
> No, if the memory is mapped as uncacheable everywhere then the cache
> manipulations are not needed. However, we probably still need a dsb.
> 
> I understand now why they decided to use __memcpy_fromio in Linux: it is
> not MMIO but they needed a memcpy followed by DSB, so they decided to
> reuse the existing MMIO functions although the buffer is not MMIO.

 From my understanding, memcpy_fromio() is not just a mempcy() + dsb. It 
also guarantees the access will be aligned (this is not guarantee by our 
memcpy()).

Now the question is why does Linux map the region Device nGnRE but we 
are mapping non-cacheable?

Cheers,

-- 
Julien Grall


