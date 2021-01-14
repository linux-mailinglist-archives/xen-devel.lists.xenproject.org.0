Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CE22F69FB
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 19:54:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67496.120529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l07km-00036S-OG; Thu, 14 Jan 2021 18:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67496.120529; Thu, 14 Jan 2021 18:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l07km-000363-LB; Thu, 14 Jan 2021 18:53:52 +0000
Received: by outflank-mailman (input) for mailman id 67496;
 Thu, 14 Jan 2021 18:53:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l07kl-00035x-6w
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 18:53:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l07kk-0002FH-MO; Thu, 14 Jan 2021 18:53:50 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l07kk-0003ix-FB; Thu, 14 Jan 2021 18:53:50 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=TFDnVg8BkjpAq/kUe3mJu+qtZiTxkB4YY3FLvanCY40=; b=COMN2ano6yvZWgFaZUcbryCxGL
	SkrJ7qSrpLQcoSsJi2DNyJzypqb0FubIMMwUm3E8UI/Haq9bHwq8o4TbDZWOMyDlfQF4zeqLrC2gm
	Z6z+Sg/uwICyklnMzXDWpuQLWtx9Melvtdm/X+o9keloq0SL6/UHBo6xC3KneuwqlRcA=;
Subject: Re: [PATCH for-4.15 4/4] xen/iommu: x86: Don't leak the IOMMU
 page-tables
To: Jan Beulich <jbeulich@suse.com>
Cc: hongyxia@amazon.co.uk, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20201222154338.9459-1-julien@xen.org>
 <20201222154338.9459-5-julien@xen.org>
 <beb22b59-701e-462c-5080-e99033079204@suse.com>
 <d62f8851-b417-b22a-4527-c2c43b536446@xen.org>
 <e897e1bf-9c17-f8a9-274a-673ff7f1a009@suse.com>
 <0ff629b1-25e6-6ce4-43ab-d50af52ecb8c@xen.org>
 <a22f7364-518f-ea5f-3b87-5c0462cfc193@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b6d69d54-70cc-15a3-5d06-51b0417f959b@xen.org>
Date: Thu, 14 Jan 2021 18:53:48 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <a22f7364-518f-ea5f-3b87-5c0462cfc193@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/12/2020 16:35, Jan Beulich wrote:
> On 23.12.2020 17:19, Julien Grall wrote:
>> On 23/12/2020 16:15, Jan Beulich wrote:
>>> On 23.12.2020 17:07, Julien Grall wrote:
>>>> I think I prefer the small race introduced (the pages will still be
>>>> freed) over this solution.
>>>
>>> The "will still be freed" is because of the 2nd round of freeing
>>> you add in an earlier patch? I'd prefer to avoid the race to in
>>> turn avoid that 2nd round of freeing.
>>
>> The "2nd round" of freeing is necessary at least for the domain creation
>> failure case (it would be the 1rst round).
>>
>> If we can avoid IOMMU page-table allocation in the domain creation path,
>> then yes I agree that we want to avoid that "2nd round". Otherwise, I
>> think it is best to take advantage of it.
> 
> Well, I'm not really certain either way here. If it's really just
> VMX'es APIC access page that's the problem here, custom cleanup
> of this "fallout" from VMX code would certainly be an option.

 From my testing, it looks like the VMX APIC page is the only entry 
added while the domain is created.

> Furthermore I consider it wrong to insert this page in the IOMMU
> page tables in the first place. This page overlaps with the MSI
> special address range, and hence accesses will be dealt with by
> interrupt remapping machinery (if enabled). If interrupt
> remapping is disabled, this page should be no different for I/O
> purposes than all other pages in this window - they shouldn't
> be mapped at all.

That's a fair point. I will have a look to see if I can avoid the IOMMU 
mapping for the VMX APIC page.

> Perhaps, along the lines of epte_get_entry_emt(), ept_set_entry()
> should gain an is_special_page() check to prevent propagation to
> the IOMMU for such pages (we can't do anything about them in
> shared-page-table setups)? See also the (PV related) comment in
> cleanup_page_mappings(), a few lines ahead of a respective use of
> is_special_page(),

There seems to be a mismatch between what the comment says and the code 
adding the page in the IOMMU for PV domain.

AFAICT, the IOMMU mapping will be added via _get_page_type():

         /* Special pages should not be accessible from devices. */
         struct domain *d = page_get_owner(page);

         if ( d && unlikely(need_iommu_pt_sync(d)) && is_pv_domain(d) )
         {
             mfn_t mfn = page_to_mfn(page);

             if ( (x & PGT_type_mask) == PGT_writable_page )
                 rc = iommu_legacy_unmap(d, _dfn(mfn_x(mfn)),
                                         1ul << PAGE_ORDER_4K);
             else
                 rc = iommu_legacy_map(d, _dfn(mfn_x(mfn)), mfn,
                                       1ul << PAGE_ORDER_4K,
                                       IOMMUF_readable | IOMMUF_writable);
         }

In this snippet, "special page" is interpreted as a page with no owner. 
However is_special_page() will return true when PGC_extra is set and the 
flag implies there is an owner (see assign_pages()).

So it looks like to me, any pages with PGC_extra would end up to have a 
mapping in the IOMMU pages-tables if they are writable.

This statement also seems to apply for xenheap pages shared with a 
domain (e.g grant-table).

Did I miss anything?

Cheers,

-- 
Julien Grall

