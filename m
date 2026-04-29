Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKyGJegY8mljnwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 16:42:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BA4496041
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 16:42:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297448.1573477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI67W-0002Ii-Di; Wed, 29 Apr 2026 14:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297448.1573477; Wed, 29 Apr 2026 14:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI67W-0002Fu-Al; Wed, 29 Apr 2026 14:42:34 +0000
Received: by outflank-mailman (input) for mailman id 1297448;
 Wed, 29 Apr 2026 14:42:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wI67V-0002Fm-Aq
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 14:42:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wI67U-007gt0-2n;
 Wed, 29 Apr 2026 14:42:32 +0000
Received: from [15.248.3.89] (helo=[10.45.29.225])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wI67U-0083hw-1o;
 Wed, 29 Apr 2026 14:42:32 +0000
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
	bh=VMjKyD+6u8SReAC3Yu69HgVoOG7voI+4oB0A2F5LIWA=; b=Zq6zWXx2A10N1WbiZ0JOdzYcvS
	H50iQ+jqBzG/+FPVPc+mdDr/F4QDa7kwZLGImYBPqQ8WCt8jXT+sNWaDeZk/rYKKSgGRX3Rl0zHx+
	G7MPVEl+YsV/vu7kx7+I/MhWc/B+QBwJ3aOlR5i9wvFqzkx4oahSo2+k4q+nPGb8/zfQ=;
Message-ID: <c43983c9-35cf-4859-9ad4-6d46b731bb15@xen.org>
Date: Wed, 29 Apr 2026 15:42:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: skip holes in physical address space when
 setting up frametable
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
References: <20260417091124.39552-1-michal.orzel@amd.com>
 <6a43af84-ca86-41f2-b58d-57be5baf49de@xen.org>
 <d023e89c-6670-4604-92db-6796d200a988@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d023e89c-6670-4604-92db-6796d200a988@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 55BA4496041
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:Luca.Fancellu@arm.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Hi Michal,

On 22/04/2026 09:25, Orzel, Michal wrote:
> 
> 
> On 22/04/2026 09:01, Julien Grall wrote:
>> Hi Michal,
>>
>> On 17/04/2026 10:11, Michal Orzel wrote:
>>> Refactor setup_frametable_mappings() into init_frametable(), modeled
>>> after x86's implementation. Instead of mapping one contiguous frametable
>>> covering ram_start to ram_end (including holes), iterate the
>>> pdx_group_valid bitmap to allocate and map frametable memory only for
>>> valid PDX groups, skipping gaps in the physical address space. At the
>>> moment we don't really take into account pdx_group_valid bitmap.
>>>
>>> This reduces memory consumption on systems with sparse RAM layouts by
>>> not allocating frametable entries for non-existent memory regions.
>>>
>>> A file-local pdx_to_page() override is needed because the generic macro
>>> in xen/include/xen/pdx.h does not account for ARM's non-zero
>>> frametable_base_pdx.
>>
>> Can you provide a bit more details? I am a bit concerned that this could
>> result to subttle bug in the future if code within mm.c is expecting the
>> original behavior. It would be preferable if the change is either for
>> everyone on Arm or the function is renamed to avoid any clash.
> The generic pdx_to_page macro does not account for offset which is something I
> mentioned in the footer and I'm willing to work on in the future.

Sorry I missed the comment in the footer. But if the function is broken, 
then why can't we implement pdx_to_page() correctly now? I understand 
that ...

  As of today,
> this macro is *unused* on Arm. It's only used by x86 in some special big mem
> related scenario. Using generic pdx_to_page on Arm would be wrong, so a future
> patch doing that would be wrong (the fact that this patch adds a local redefine
> does not change anything). Do we need a rename for a local redefine in a file
> that is only related to frametable? Maybe a comment and a TODO would be ok?

... this is not meant to be used by Arm today. But given this is used in 
the page list, it is definitely not obvious that it is broken.

The alternative is to protect/move pdx_to_page() in x86. But I don't 
know much churn this would involve.

> 
>>
>> [...]
>>
>>> +void __init init_frametable(paddr_t ram_start)
>>> +{
>>> +    unsigned int sidx, nidx, max_idx;
>>>    
>>>        /*
>>>         * The size of paddr_t should be sufficient for the complete range of
>>> @@ -26,24 +47,34 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>>>        BUILD_BUG_ON((sizeof(paddr_t) * BITS_PER_BYTE) < PADDR_BITS);
>>>        BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
>>>    
>>> -    if ( frametable_size > FRAMETABLE_SIZE )
>>> -        panic("The frametable cannot cover the physical region %#"PRIpaddr" - %#"PRIpaddr"\n",
>>> -              ps, pe);
>>> +    max_idx = DIV_ROUND_UP(max_pdx, PDX_GROUP_COUNT);
>>> +    frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ram_start));
>>>    
>>> -    frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ps));
>>> -    /* Round up to 2M or 32M boundary, as appropriate. */
>>> -    frametable_size = ROUNDUP(frametable_size, mapping_size);
>>> -    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 32<<(20-12));
>>> +    /*
>>> +     * pdx_to_page(pdx_s) in init_frametable_chunk must be page-aligned
>>> +     * for map_pages_to_xen(). Aligning to PDX_GROUP_COUNT guarantees this
>>> +     * because PDX_GROUP_COUNT * sizeof(page_info) is always a multiple of
>>> +     * PAGE_SIZE by construction.
>>> +     */
>>> +    frametable_base_pdx = ROUNDDOWN(frametable_base_pdx, PDX_GROUP_COUNT);
>>>    
>>> -    rc = map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
>>> -                          frametable_size >> PAGE_SHIFT,
>>> -                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
>>> -    if ( rc )
>>> -        panic("Unable to setup the frametable mappings.\n");
>>> +    if ( (max_pdx - frametable_base_pdx) > FRAMETABLE_NR )
>>> +        panic("Frametable too small\n");
>>> +
>>> +    for ( sidx = (frametable_base_pdx / PDX_GROUP_COUNT); ; sidx = nidx )
>>> +    {
>>> +        unsigned int eidx;
>>> +
>>> +        eidx = find_next_zero_bit(pdx_group_valid, max_idx, sidx);
>>> +        nidx = find_next_bit(pdx_group_valid, max_idx, eidx);
>>> +
>>> +        if ( nidx >= max_idx )
>>> +            break;
>>> +
>>> +        init_frametable_chunk(sidx * PDX_GROUP_COUNT, eidx * PDX_GROUP_COUNT);
>>
>> The function will do a round-up the mapping to either a 2MiB or 32MiB
>> aligned size. This means we could potentially cover the previous mapped
>> region or the next one. I can't seem to find any code to cover this
>> use-case. What did I miss?
> Hmm, I think I calculated something wrong here. Anyway, how about using 2MB
> mapping size all the time? PDX group size is 2MB,

Looking at the code, it seems to be based on SECOND_SHIFT which 
technically depends on the page granularity. Even though Xen supports 
only 4KiB, we are trying to avoid making such assumption or add least 
adding a BUILD_BUG_ON() (in this case, I would consider that 
PDX_GROUP_COUNT is always 2MiB or SECOND_SHIFT).

> in-loop chunks are multiple of
> 2MB, there is no roundup needed - zero overshoot. The last chunk may have ~2MB
> overshoot but it does not matter as there is nothing after it to conflict with.
> The downside is more TLB pressure.

I am a bit warry to modify the frametable allocation method because it 
is used fairly often in Xen. Would it be possible to hence the loop to 
detect contiguous chunk and decide the size allocation based on the chunk?

> 
> Alternatively, we could reduce the mapping size closer to boundaries (x86
> choice) but that would require a bit more work.

This would technically have the same downside as above.

Cheers,

-- 
Julien Grall


