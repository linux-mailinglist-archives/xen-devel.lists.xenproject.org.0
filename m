Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D0D4DE3EF
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 23:15:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292258.496410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVKsb-00071a-Gb; Fri, 18 Mar 2022 22:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292258.496410; Fri, 18 Mar 2022 22:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVKsb-0006zl-Dd; Fri, 18 Mar 2022 22:15:29 +0000
Received: by outflank-mailman (input) for mailman id 292258;
 Fri, 18 Mar 2022 22:15:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nVKsZ-0006zf-76
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 22:15:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nVKsY-0003YO-Vv; Fri, 18 Mar 2022 22:15:26 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nVKsY-0005qO-Q8; Fri, 18 Mar 2022 22:15:26 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=VG9MeoEG1Za4/+SOyEdFTUnTwKdvqvA00XSAY5YDMX4=; b=oP1qswEvo4bDo1DzFAsFkdsBb9
	bVPW+gEtJ87mpp9PXKJkNsNy87WKtcLPf4lrfy4UjKzVd7rYR127Fy+JBnveeRO7o0gbJS0HGYBn5
	ypUg5eQ1PPg1CpkTDP4fb4ZTwNbjzsxSVFU3oar8q6NmWDVGUfswrO5kkkdPiHTh0Flo=;
Message-ID: <926be9f9-37c7-8255-394f-e38c9396e775@xen.org>
Date: Fri, 18 Mar 2022 22:15:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
To: Hongda Deng <Hongda.Deng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-10-julien@xen.org>
 <DBAPR08MB56703D6319722AD86C10A77FE6139@DBAPR08MB5670.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 09/19] xen/arm32: mm: Check if the virtual address is
 shared before updating it
In-Reply-To: <DBAPR08MB56703D6319722AD86C10A77FE6139@DBAPR08MB5670.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/03/2022 10:44, Hongda Deng wrote:
> Hi Julien,

Hi Hongda,

>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Julien
>> Grall
>> Sent: 2022年2月21日 18:22
>> To: xen-devel@lists.xenproject.org
>> Cc: julien@xen.org; Julien Grall <jgrall@amazon.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Subject: [PATCH v3 09/19] xen/arm32: mm: Check if the virtual address is shared
>> before updating it
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Only the first 2GB of the virtual address space is shared between all
>> the page-tables on Arm32.
>>
>> There is a long outstanding TODO in xen_pt_update() stating that the
>> function can only work with shared mapping. Nobody has ever called
>> the function with private mapping, however as we add more callers
>> there is a risk to mess things up.
>>
>> Introduce a new define to mark the end of the shared mappings and use
>> it in xen_pt_update() to verify if the address is correct.
>>
>> Note that on Arm64, all the mappings are shared. Some compiler may
>> complain about an always true check, so the new define is not introduced
>> for arm64 and the code is protected with an #ifdef.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>      Changes in v2:
>>          - New patch
>> ---
>>   xen/arch/arm/include/asm/config.h |  4 ++++
>>   xen/arch/arm/mm.c                 | 11 +++++++++--
>>   2 files changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/config.h
>> b/xen/arch/arm/include/asm/config.h
>> index c7b77912013e..85d4a510ce8a 100644
>> --- a/xen/arch/arm/include/asm/config.h
>> +++ b/xen/arch/arm/include/asm/config.h
>> @@ -137,6 +137,10 @@
>>
>>   #define XENHEAP_VIRT_START     _AT(vaddr_t,0x40000000)
>>   #define XENHEAP_VIRT_END       _AT(vaddr_t,0x7fffffff)
>> +
>> +/* The first 2GB is always shared between all the page-tables. */
>> +#define SHARED_VIRT_END        _AT(vaddr_t, 0x7fffffff)
>> +
>>   #define DOMHEAP_VIRT_START     _AT(vaddr_t,0x80000000)
>>   #define DOMHEAP_VIRT_END       _AT(vaddr_t,0xffffffff)
>>
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index 24de8dcb9042..f18f65745595 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -1365,11 +1365,18 @@ static int xen_pt_update(unsigned long virt,
>>        * For arm32, page-tables are different on each CPUs. Yet, they share
>>        * some common mappings. It is assumed that only common mappings
>>        * will be modified with this function.
>> -     *
>> -     * XXX: Add a check.
>>        */
>>       const mfn_t root = virt_to_mfn(THIS_CPU_PGTABLE);
>>
>> +#ifdef SHARED_VIRT_END
>> +    if ( virt > SHARED_VIRT_END ||
>> +         (SHARED_VIRT_END - virt) < nr_mfns )
> 
> Why not convert (SHARED_VIRT_END - virt) to page number before comparation?
> I think nr_mfns is something related to page numbers, so maybe something like PAGE_SHIFT or round_pgdown is needed.

You are correct. nr_mfns should be shifted by PAGE_SHIFT. I have updated 
check to:

(SHARED_VIRT_END - virt) < pfn_to_paddr(nr_mfns)

Thanks for spotting it!

Cheers,

-- 
Julien Grall

