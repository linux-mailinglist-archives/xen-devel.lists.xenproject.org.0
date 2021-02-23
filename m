Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5D7322636
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 08:13:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88581.166626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lERsx-0007Va-3Q; Tue, 23 Feb 2021 07:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88581.166626; Tue, 23 Feb 2021 07:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lERsx-0007VB-0J; Tue, 23 Feb 2021 07:13:31 +0000
Received: by outflank-mailman (input) for mailman id 88581;
 Tue, 23 Feb 2021 07:13:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lERsv-0007V6-T5
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 07:13:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2831ddb7-3f68-43aa-8d38-2c5a9f4f91d2;
 Tue, 23 Feb 2021 07:13:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F0D47ACBF;
 Tue, 23 Feb 2021 07:13:27 +0000 (UTC)
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
X-Inumbo-ID: 2831ddb7-3f68-43aa-8d38-2c5a9f4f91d2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614064408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jrUHoyJwvbbMr4+3pK/5jLU2vTyFp02UgSPe3FxTo5E=;
	b=IB3tBAttR5Iqu9j+PEoBvgLiqdcD6CMvFExjLstJTW8MsVhF+JBztM8+rqYZcaXJb1AI2W
	IlGFK9G5aY9F2uh4eS+nabsj1ChCaBZhmkV0bny6hPAtHjAmho1NI+m5spY42+jW8FpWLg
	MKUTf/KvElHuW+83h1T/rtDs+21233o=
Subject: Re: [PATCH][4.15] x86: mirror compat argument translation area for
 32-bit PV
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bdedf018-b6c4-d0da-fb4b-8cf2d048c3b1@suse.com>
 <9eade40b-bd95-b850-2dec-f7def66c3c7b@citrix.com>
 <77a36366-9157-c3d3-b1f0-211f4fc39a93@suse.com>
 <60a31ec8-6844-2149-1a04-7e757d1d2dd3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <42c86cc7-c417-6089-4e44-90a96ebaede1@suse.com>
Date: Tue, 23 Feb 2021 08:13:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <60a31ec8-6844-2149-1a04-7e757d1d2dd3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.02.2021 17:47, Andrew Cooper wrote:
> On 22/02/2021 14:22, Jan Beulich wrote:
>> On 22.02.2021 15:14, Andrew Cooper wrote:
>>> On 22/02/2021 10:27, Jan Beulich wrote:
>>>> Now that we guard the entire Xen VA space against speculative abuse
>>>> through hypervisor accesses to guest memory, the argument translation
>>>> area's VA also needs to live outside this range, at least for 32-bit PV
>>>> guests. To avoid extra is_hvm_*() conditionals, use the alternative VA
>>>> uniformly.
>>>>
>>>> While this could be conditionalized upon CONFIG_PV32 &&
>>>> CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS, omitting such extra conditionals
>>>> keeps the code more legible imo.
>>>>
>>>> Fixes: 4dc181599142 ("x86/PV: harden guest memory accesses against speculative abuse")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> --- a/xen/arch/x86/mm.c
>>>> +++ b/xen/arch/x86/mm.c
>>>> @@ -1727,6 +1727,11 @@ void init_xen_l4_slots(l4_pgentry_t *l4t
>>>>                 (ROOT_PAGETABLE_FIRST_XEN_SLOT + slots -
>>>>                  l4_table_offset(XEN_VIRT_START)) * sizeof(*l4t));
>>>>      }
>>>> +
>>>> +    /* Slot 511: Per-domain mappings mirror. */
>>>> +    if ( !is_pv_64bit_domain(d) )
>>>> +        l4t[l4_table_offset(PERDOMAIN2_VIRT_START)] =
>>>> +            l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
>>> This virtual address is inside the extended directmap.
>> No. That one covers only the range excluding the last L4 slot.
>>
>>>   You're going to
>>> need to rearrange more things than just this, to make it safe.
>> I specifically picked that entry because I don't think further
>> arrangements are needed.
> 
> map_domain_page() will blindly hand this virtual address if an
> appropriate mfn is passed, because there are no suitability checks.
> 
> The error handling isn't great, but at least any attempt to use that
> pointer would fault, which is now no longer the case.
> 
> LA57 machines can have RAM or NVDIMMs in a range which will tickle this
> bug.  In fact, they can have MFNs which would wrap around 0 into guest
> space.

This latter fact would be a far worse problem than accesses through
the last L4 entry, populated or not. However, I don't really follow
your concern: There are ample cases where functions assume to be
passed sane arguments. A pretty good (imo) comparison here is with
mfn_to_page(), which also will assume a sane MFN (i.e. one with a
representable (in frame_table[]) value. If there was a bug, it
would be either the caller taking an MFN out of thin air, or us
introducing MFNs we can't cover in any of direct map, frame table,
or M2P. But afaict there is guarding against the latter (look for
the "Ignoring inaccessible memory range" loge messages in setup.c).

In any event - imo any such bug would need fixing there, rather
than being an argument against the change here.

Also, besides your objection going quite a bit too far for my taste,
I miss any form of an alternative suggestion. Do you want the mirror
range to be put below the canonical boundary? Taking in mind your
wrapping consideration, about _any_ VA would be unsuitable.

Jan

