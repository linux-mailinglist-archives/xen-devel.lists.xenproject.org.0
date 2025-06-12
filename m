Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30118AD6FA5
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 14:01:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012937.1391468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPgcG-0005aQ-B4; Thu, 12 Jun 2025 12:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012937.1391468; Thu, 12 Jun 2025 12:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPgcG-0005YI-8O; Thu, 12 Jun 2025 12:01:08 +0000
Received: by outflank-mailman (input) for mailman id 1012937;
 Thu, 12 Jun 2025 12:01:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPgcE-0005R6-Iq
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 12:01:06 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9cc937e-4784-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 14:01:03 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so1442610f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 05:01:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748809eb8e5sm1242714b3a.121.2025.06.12.05.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 05:01:01 -0700 (PDT)
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
X-Inumbo-ID: e9cc937e-4784-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749729663; x=1750334463; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/xI/LcuXIWsfINO5aYj3SqHmoStg174fswcrGzC6qzM=;
        b=ACF9QGp+EyVl8ntVG52nAnDkSDM6Bsl6i1jPlj+hszirIXmrpNymQhISyzEqwiWPRg
         MnDkBam6qzPvfyZCStaRDjVBli1LXUWKQcYaaO/pJSg64lPFsugjRZDPEp59u9VN4iPo
         6/OBg1UzIu3ziqyIipVdKgvSgAYcLgIME55yohm6RsjEg/t2AFO3yuVtzbggfR+xZPs+
         VuKFJnLYHI10mAIJkc7YQvyjImu6KdztlxRdLaceixWR5LAvXOh8NsR+HZjxIQPqvdCB
         v0Cilyt1sDsNq6pHBrtdnhgp7Vp9XSAb7gqMpH2dFOuIklFaUmJpsY70O2flcJR1syRI
         w/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749729663; x=1750334463;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xI/LcuXIWsfINO5aYj3SqHmoStg174fswcrGzC6qzM=;
        b=LHRKOI8JpnN6p1UIp7I206NDKROxl86TDbX6L5Fz2DZfL/ZEDJQIfUSCaV84mJhiMr
         v/Uhek2B6CoX5PYL75CPr+y8no0fr3X+beUSkY/fU+ggQfZYNN2ajcTpbfOd8BCBYnwH
         nX78ZLPGBsr28CkOJ4QO0jI5+7HIt/99T7mvMzm/yRykbObrbUrIPKUu8o2Q22f3KTwh
         U8qPyZmIGyC36awXvzzrlG1s4lnVtLg3y58rcuBarqUpqCQYH0CLwTXo++1MzAc4N21M
         e7bzZ4I+g2rLe8mD3F5XUjwKZpa5vjX3jRqGLyRiJ1GpD18fLuUvTXR3BFdqSkRy+cfy
         LGEA==
X-Forwarded-Encrypted: i=1; AJvYcCWaDXkJEJb9LAo3yFx1t+pCCkEhFCYFTghg/s5z2aVd48byWihak0OYMMLrraCwA0oJb/KdvQrPTNs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1t3T1Ym7s0Db/wfsHDQ+J35bxx79F8zxj6JVvlM1nkER5jInN
	Q5vBihQYWLJE5/NblCNr/5a0OCh7SgC5J8th67OuJBOdUYqhA4cUPR7VmBHDrTcRdYVpClPe4QQ
	z8f8=
X-Gm-Gg: ASbGnctLomAdN+U+p2M0PyjCdJTGVfOUP30CDZGET98kdFyHlizM2tvXT3vgG3w8YLj
	WEfcUcNkAIQQY0QitSP3LiLg97Nt9VbfaN3Myo7ajThtiA/gtj/wmfmB17PBlJk5g+rt7zBB8fT
	xf2BLddH8tJjHIZQ2mlwrpIMb0AXIxvzxOeT8HFc3TH3RSEfRkwa1Exver4BIt2dN3ZWed6Zl1p
	QIY/C9kLivOVomQ9TLigcKckvMagus1NyJKZDgX/3aowAEf6wNm0V+4X7/v1ncrixnNWKwAriIa
	Yye3rMDCvlfb1y7LIMmZXq+LV8A7/G9xixb99PJdlewy5Gh1i65HywnybrMjTFLOxwrhOj8xQi0
	YWTf1FTEX7LMoLi7cxNrdzMZlgv2qLrF/YSrEhsdqtuUJ1N0=
X-Google-Smtp-Source: AGHT+IFqG0iVhbLcWL+H0zd176P5nf7tr+Wy+8XVQ061661wZeGpyChVWQi2TfpkB6urTr3JiboS/g==
X-Received: by 2002:a05:6000:400d:b0:3a4:edf5:8a41 with SMTP id ffacd0b85a97d-3a5607630ccmr2679237f8f.4.1749729662339;
        Thu, 12 Jun 2025 05:01:02 -0700 (PDT)
Message-ID: <70ab97d7-8352-4252-be77-659582e1ca35@suse.com>
Date: Thu, 12 Jun 2025 14:00:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] x86/pdx: simplify calculation of domain struct
 allocation boundary
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250611171636.5674-1-roger.pau@citrix.com>
 <20250611171636.5674-2-roger.pau@citrix.com>
 <6abadf32-836f-45fb-bb3a-3afdf97e157b@suse.com>
 <aEqwDZc8u8FFW2Al@macbook.local>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <aEqwDZc8u8FFW2Al@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.06.2025 12:46, Roger Pau Monné wrote:
> On Thu, Jun 12, 2025 at 11:03:21AM +0200, Jan Beulich wrote:
>> On 11.06.2025 19:16, Roger Pau Monne wrote:
>>> @@ -498,14 +474,15 @@ struct domain *alloc_domain_struct(void)
>>>       * On systems with CONFIG_BIGMEM there's no packing, and so there's no
>>>       * such restriction.
>>>       */
>>> -#if defined(CONFIG_BIGMEM) || !defined(CONFIG_PDX_COMPRESSION)
>>> -    const unsigned int bits = IS_ENABLED(CONFIG_BIGMEM) ? 0 :
>>> -                                                          32 + PAGE_SHIFT;
>>> +#if defined(CONFIG_BIGMEM)
>>> +    const unsigned int bits = 0;
>>>  #else
>>> -    static unsigned int __read_mostly bits;
>>> +    static unsigned int __ro_after_init bits;
>>>  
>>>      if ( unlikely(!bits) )
>>> -         bits = _domain_struct_bits();
>>> +         bits = flsl(pfn_to_paddr(pdx_to_pfn(
>>> +             1UL << (sizeof(((struct page_info *)NULL)->v.inuse._domain) * 8))))
>>> +             - 1;
>>
>> While Andrew did point you at sizeof_field(), we can have this even less verbose
>> by utilizing that frame_table is of the right type and (almost) globally in scope.
>>
>> Further, why use pfn_to_paddr()?
>>
>>          bits = flsl(pdx_to_pfn(1UL << 
>>                                 (sizeof(frame_table->v.inuse._domain) * 8))) +
>>                 PAGE_SHIFT - 1;
> 
> I've introduced and used pdx_to_paddr(), which I think it's more
> natural.  We already had a paddr_to_pdx() which was missing it's
> bidirectional equivalent.  It's now:
> 
>          bits = flsl(pdx_to_paddr(1UL << (sizeof_field(struct page_info,
>                                                        v.inuse._domain) * 8)))
>                 - 1;

Textually this is better, yes. I won't insist on the other variant, while
still noting that your way there's an extra shift whereas my way there's
merely an extra add.

>> However, it further feels like this was off by one; we had similar issues over
>> time in several places. There potentially being a gap between one less than
>> the PDX used here and that very PDX, don't we need to calculate based on the
>> "one less" value here? Hmm, there being a gap means no allocation would
>> succeed for the precise value of "bits" (in the mask-compression scheme), so
>> functionally all would be fine. Yet just to avoid setting a bad precedent I
>> think we'd still be better off using
>>
>>          bits = flsl(pdx_to_pfn((1UL << 
>>                                  (sizeof(frame_table->v.inuse._domain) * 8)) -
>>                                 1)) + PAGE_SHIFT;
>>
>> If one would log the value of bits, the result would then also be less
>> confusing in (at least) the mask-compression scheme.
> 
> 
> Is the above correct tough?
> 
> Take for example the hypothetical case where pdx_to_pfn() returns
> 0x10.

Hmm, yes - while impossible in the mask-compression scheme, it is in
principle possible with other schemes (like the offset one).

>  Then flsl() will return 5 (let's leave the PAGE_SHIFT
> adjustment out for the example here).  The allocation bit width would
> be off-by-one, because allocating using a bit width of 5 would also
> allow 0x11 to be allocated, and that won't be correct.
> 
> I think we need to get the bit width of the next pdx (so the
> non-inclusive end of the range), and then subtract 1 from it,
> otherwise the allocation bit width is possibly off-by-one.

I think you're right, and I can't really see how to (easily) get the more
precise value for the mask-compression scheme then. I would therefore
like to ask that you attach a comment clarifying the slight oddity.

Jan

