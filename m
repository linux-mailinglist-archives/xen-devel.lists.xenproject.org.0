Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BBB392FBE
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 15:30:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133420.248713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmG5U-00031y-L8; Thu, 27 May 2021 13:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133420.248713; Thu, 27 May 2021 13:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmG5U-0002zQ-HO; Thu, 27 May 2021 13:30:12 +0000
Received: by outflank-mailman (input) for mailman id 133420;
 Thu, 27 May 2021 13:30:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lmG5S-0002zI-Ur
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 13:30:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lmG5S-0000FM-R9; Thu, 27 May 2021 13:30:10 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lmG5S-0002vw-KM; Thu, 27 May 2021 13:30:10 +0000
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
	bh=EX10sFiK/vacdc2TZCENeLUkaSzkI9mwdbhchUhK9h4=; b=40ClmA2MdSyXfB/92gxtvklrho
	M90uTXRiUnqgGhT8zSV+CLp0+UDlJ7rcx0EDCBqkshtwb6eYuhdiws/WgvsGiLFcKkqua0HDwl80N
	qpOdIGdS9bU++hKkjuD1hEtkzVntcnwpr95pwgm7rIOF5FuQlfvD1380KW3cvInkpwwU=;
Subject: Re: [PATCH v2 01/12] x86: introduce ioremap_wc()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
 <20abac99-609c-f4f6-1242-c79919f4c317@suse.com>
 <b8035805-4f44-18ce-f4cb-4ce1d3c594fc@xen.org>
 <d7019879-037b-7945-4a8a-5a8252e5922a@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7d32ff1c-315c-f2da-bc1b-06fb2233fe55@xen.org>
Date: Thu, 27 May 2021 14:30:08 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <d7019879-037b-7945-4a8a-5a8252e5922a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 27/05/2021 14:09, Jan Beulich wrote:
> On 27.05.2021 14:48, Julien Grall wrote:
>> On 27/05/2021 13:30, Jan Beulich wrote:
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -5881,6 +5881,20 @@ void __iomem *ioremap(paddr_t pa, size_t
>>>        return (void __force __iomem *)va;
>>>    }
>>>    
>>> +void __iomem *__init ioremap_wc(paddr_t pa, size_t len)
>>> +{
>>> +    mfn_t mfn = _mfn(PFN_DOWN(pa));
>>> +    unsigned int offs = pa & (PAGE_SIZE - 1);
>>> +    unsigned int nr = PFN_UP(offs + len);
>>> +    void *va;
>>> +
>>> +    WARN_ON(page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL));
>>> +
>>> +    va = __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR_WC, VMAP_DEFAULT);
>>> +
>>> +    return (void __force __iomem *)(va + offs);
>>> +}
>>
>> Arm is already providing ioremap_wc() which is a wrapper to
>> ioremap_attr().
> 
> I did notice this, yes.
> 
>> Can this be moved to the common code to avoid duplication?
> 
> If by "this" you mean ioremap_attr(), then I wasn't convinced we want
> a function of this name on x86.

I am open to other name.

> In particular you may note that
> x86'es ioremap() is sort of the equivalent of Arm's ioremap_nocache(),
> but is different from the new ioremap_wc() by more than just the
> different PTE attributes.
That's because ioremap() will not vmap() the first MB, am I correct? If 
so, I am not sure why you want to do that in ioremap() but not 
ioremap_wc(). Wouldn't this result access the memory with mismatched 
attributes?

> Also I was specifically asked to make ioremap_wc() __init; ioremap()
> cannot be, because of at least the use from pci_vtd_quirk().

I am not sure this is relevant to the conversation here. I am sure there 
are other function that would benefits to be __init in one arch but 
can't in the other. Yet, common code can be beneficials.

> 
> Plus I'd need to clean up Arm's lack of __iomem if I wanted to fold
> things. 

__iomem is NOP on Xen. So while the annotation may not be consistently 
used, I don't see the clean-up a requirement to consolidate the code...

> Or wait - it's declaration and definition which are out of
> sync there, i.e. a pre-existing issue.

We don't usually add __init on both the declaration and definition. So 
why would it be necessary to add __iomem in both cases?

Cheers,

-- 
Julien Grall

