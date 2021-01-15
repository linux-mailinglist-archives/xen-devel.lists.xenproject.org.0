Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 681D72F7799
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 12:25:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67978.121554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0NDy-0005N1-TD; Fri, 15 Jan 2021 11:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67978.121554; Fri, 15 Jan 2021 11:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0NDy-0005Mg-QD; Fri, 15 Jan 2021 11:25:02 +0000
Received: by outflank-mailman (input) for mailman id 67978;
 Fri, 15 Jan 2021 11:25:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0NDw-0005Mb-Ov
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 11:25:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6890bfb-d678-4176-aeca-c4d24e6211d1;
 Fri, 15 Jan 2021 11:24:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7264AACAC;
 Fri, 15 Jan 2021 11:24:58 +0000 (UTC)
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
X-Inumbo-ID: f6890bfb-d678-4176-aeca-c4d24e6211d1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610709898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9DvsjkL/V4eFvCvOtD0y6IelSartz9c5EHkQi4kC/pE=;
	b=qaQJAOdF5p69MLguKr/PYVjcae5aAk3nd9HCL44rPczijegYvojKq+rZo3rM/8Re8VQBgs
	OOvp6R373gqif1at9cYGkMdnj0JDIihenG4xj2SvX5/rxWsUzEDxtpSL5H5s+I9QRRAES0
	aaRFh+T/anY3JakcLqHZA7/GvQMA0q8=
Subject: Re: [PATCH for-4.15 4/4] xen/iommu: x86: Don't leak the IOMMU
 page-tables
To: Julien Grall <julien@xen.org>
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
 <b6d69d54-70cc-15a3-5d06-51b0417f959b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a6804337-436d-4572-e643-4b8fd759c010@suse.com>
Date: Fri, 15 Jan 2021 12:24:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <b6d69d54-70cc-15a3-5d06-51b0417f959b@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.01.2021 19:53, Julien Grall wrote:
> On 23/12/2020 16:35, Jan Beulich wrote:
>> On 23.12.2020 17:19, Julien Grall wrote:
>>> On 23/12/2020 16:15, Jan Beulich wrote:
>>>> On 23.12.2020 17:07, Julien Grall wrote:
>>>>> I think I prefer the small race introduced (the pages will still be
>>>>> freed) over this solution.
>>>>
>>>> The "will still be freed" is because of the 2nd round of freeing
>>>> you add in an earlier patch? I'd prefer to avoid the race to in
>>>> turn avoid that 2nd round of freeing.
>>>
>>> The "2nd round" of freeing is necessary at least for the domain creation
>>> failure case (it would be the 1rst round).
>>>
>>> If we can avoid IOMMU page-table allocation in the domain creation path,
>>> then yes I agree that we want to avoid that "2nd round". Otherwise, I
>>> think it is best to take advantage of it.
>>
>> Well, I'm not really certain either way here. If it's really just
>> VMX'es APIC access page that's the problem here, custom cleanup
>> of this "fallout" from VMX code would certainly be an option.
> 
>  From my testing, it looks like the VMX APIC page is the only entry 
> added while the domain is created.
> 
>> Furthermore I consider it wrong to insert this page in the IOMMU
>> page tables in the first place. This page overlaps with the MSI
>> special address range, and hence accesses will be dealt with by
>> interrupt remapping machinery (if enabled). If interrupt
>> remapping is disabled, this page should be no different for I/O
>> purposes than all other pages in this window - they shouldn't
>> be mapped at all.
> 
> That's a fair point. I will have a look to see if I can avoid the IOMMU 
> mapping for the VMX APIC page.
> 
>> Perhaps, along the lines of epte_get_entry_emt(), ept_set_entry()
>> should gain an is_special_page() check to prevent propagation to
>> the IOMMU for such pages (we can't do anything about them in
>> shared-page-table setups)? See also the (PV related) comment in
>> cleanup_page_mappings(), a few lines ahead of a respective use of
>> is_special_page(),
> 
> There seems to be a mismatch between what the comment says and the code 
> adding the page in the IOMMU for PV domain.
> 
> AFAICT, the IOMMU mapping will be added via _get_page_type():
> 
>          /* Special pages should not be accessible from devices. */
>          struct domain *d = page_get_owner(page);
> 
>          if ( d && unlikely(need_iommu_pt_sync(d)) && is_pv_domain(d) )
>          {
>              mfn_t mfn = page_to_mfn(page);
> 
>              if ( (x & PGT_type_mask) == PGT_writable_page )
>                  rc = iommu_legacy_unmap(d, _dfn(mfn_x(mfn)),
>                                          1ul << PAGE_ORDER_4K);
>              else
>                  rc = iommu_legacy_map(d, _dfn(mfn_x(mfn)), mfn,
>                                        1ul << PAGE_ORDER_4K,
>                                        IOMMUF_readable | IOMMUF_writable);
>          }
> 
> In this snippet, "special page" is interpreted as a page with no owner. 
> However is_special_page() will return true when PGC_extra is set and the 
> flag implies there is an owner (see assign_pages()).
> 
> So it looks like to me, any pages with PGC_extra would end up to have a 
> mapping in the IOMMU pages-tables if they are writable.
> 
> This statement also seems to apply for xenheap pages shared with a 
> domain (e.g grant-table).
> 
> Did I miss anything?

First let me point out that what you quote is not what I had
pointed you at - you refer to _get_page_type() when I suggested
to look at cleanup_page_mappings(). The important aspect for
special pages (here I mean ones having been subject to
share_xen_page_with_guest()) is that their type gets "pinned",
i.e. they'll never be subject to _get_page_type()'s
transitioning of types. As you likely will have noticed,
cleanup_page_mappings() also only gets called when the last
_general_ ref of a page got dropped, i.e. entirely unrelated
to type references.

If PGC_extra pages have a similar requirement, they may need
similar pinning of their types. (Maybe they do; didn't check.)

Jan

