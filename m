Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 357FB393194
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 16:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133540.248879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmHRq-0000nR-Ff; Thu, 27 May 2021 14:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133540.248879; Thu, 27 May 2021 14:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmHRq-0000lQ-B8; Thu, 27 May 2021 14:57:22 +0000
Received: by outflank-mailman (input) for mailman id 133540;
 Thu, 27 May 2021 14:57:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmHRp-0000l0-DE
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 14:57:21 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0638399-f3d0-4ae1-8ede-6f49afdf1a75;
 Thu, 27 May 2021 14:57:20 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BBAAC1FD2E;
 Thu, 27 May 2021 14:57:19 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 9AAF611A98;
 Thu, 27 May 2021 14:57:19 +0000 (UTC)
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
X-Inumbo-ID: e0638399-f3d0-4ae1-8ede-6f49afdf1a75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622127439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UVxxdyQjpZSI02rN+RmLnbxOL0hPk4E5s0ox/k9JMP0=;
	b=VeegR4AuuhMM/cYbgg9FqFPw/F6sVMSBKtQZz5/kaHJBqyR3GFenGlcdHYciSiDErvXvhw
	pKQoeQfG1Ph90UbyR+EvItfiL4C8LelEC2q/csvj5hc9PIoVTs23XKJuMc5HrrDCLnJ7Vw
	PqdvtV+5jLOA43EygDui3tYFb81PDk0=
Subject: Re: [PATCH v2 01/12] x86: introduce ioremap_wc()
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
 <20abac99-609c-f4f6-1242-c79919f4c317@suse.com>
 <b8035805-4f44-18ce-f4cb-4ce1d3c594fc@xen.org>
 <d7019879-037b-7945-4a8a-5a8252e5922a@suse.com>
 <7d32ff1c-315c-f2da-bc1b-06fb2233fe55@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e24036b4-a40c-4b1e-7aaa-11007a6878b9@suse.com>
Date: Thu, 27 May 2021 16:57:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <7d32ff1c-315c-f2da-bc1b-06fb2233fe55@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.05.2021 15:30, Julien Grall wrote:
> On 27/05/2021 14:09, Jan Beulich wrote:
>> On 27.05.2021 14:48, Julien Grall wrote:
>>> On 27/05/2021 13:30, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/mm.c
>>>> +++ b/xen/arch/x86/mm.c
>>>> @@ -5881,6 +5881,20 @@ void __iomem *ioremap(paddr_t pa, size_t
>>>>        return (void __force __iomem *)va;
>>>>    }
>>>>    
>>>> +void __iomem *__init ioremap_wc(paddr_t pa, size_t len)
>>>> +{
>>>> +    mfn_t mfn = _mfn(PFN_DOWN(pa));
>>>> +    unsigned int offs = pa & (PAGE_SIZE - 1);
>>>> +    unsigned int nr = PFN_UP(offs + len);
>>>> +    void *va;
>>>> +
>>>> +    WARN_ON(page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL));
>>>> +
>>>> +    va = __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR_WC, VMAP_DEFAULT);
>>>> +
>>>> +    return (void __force __iomem *)(va + offs);
>>>> +}
>>>
>>> Arm is already providing ioremap_wc() which is a wrapper to
>>> ioremap_attr().
>>
>> I did notice this, yes.
>>
>>> Can this be moved to the common code to avoid duplication?
>>
>> If by "this" you mean ioremap_attr(), then I wasn't convinced we want
>> a function of this name on x86.
> 
> I am open to other name.

My remark wasn't so much about the name, but about there being a
"more capable" backing function for a number of wrappers.

>> In particular you may note that
>> x86'es ioremap() is sort of the equivalent of Arm's ioremap_nocache(),
>> but is different from the new ioremap_wc() by more than just the
>> different PTE attributes.
> That's because ioremap() will not vmap() the first MB, am I correct? If 
> so, I am not sure why you want to do that in ioremap() but not 
> ioremap_wc(). Wouldn't this result access the memory with mismatched 
> attributes?

UC and WC aren't really conflicting cache attributes - they both
fall in the "uncachable" category. In fact I have a TBD in the
post-commit-message area regarding this very aspect of possibly
reusing the low 1Mb mapping.

>> Plus I'd need to clean up Arm's lack of __iomem if I wanted to fold
>> things. 
> 
> __iomem is NOP on Xen. So while the annotation may not be consistently 
> used, I don't see the clean-up a requirement to consolidate the code...
> 
>> Or wait - it's declaration and definition which are out of
>> sync there, i.e. a pre-existing issue.
> 
> We don't usually add __init on both the declaration and definition. So 
> why would it be necessary to add __iomem in both cases?

__init is an attribute that is meaningful only for functions and
only on their definitions (because it controls what section the
code gets emitted to by the compiler, while it is of no interest
at all to any caller of the function, as far as the compiler is
concerned). __iomem, otoh, is a modifier for pointer types, so
doesn't apply to the function as a whole but to its return types.
Such types (when they're not NOP) need to be consistent between
declaration and definition. You can try this with an about
arbitrary (but valid) __attribute__(()) of your choice and with a
not overly old compiler - you should see it complain about such
inconsistencies.

Jan

