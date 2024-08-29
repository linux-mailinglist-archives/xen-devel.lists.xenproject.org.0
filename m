Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CEF964416
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 14:15:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785794.1195294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sje3L-0007vG-VP; Thu, 29 Aug 2024 12:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785794.1195294; Thu, 29 Aug 2024 12:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sje3L-0007tM-S3; Thu, 29 Aug 2024 12:15:03 +0000
Received: by outflank-mailman (input) for mailman id 785794;
 Thu, 29 Aug 2024 12:15:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sje3K-0007tE-Ua
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 12:15:02 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50f38c78-6600-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 14:15:01 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a86cc0d10aaso61275366b.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 05:15:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989221c24sm71490766b.196.2024.08.29.05.15.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 05:15:00 -0700 (PDT)
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
X-Inumbo-ID: 50f38c78-6600-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724933701; x=1725538501; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BIcdrVvM45vUU1dn+CBgSjmywvRTg6UZEf81hF7tbHg=;
        b=Qj7we+bXVv5XAjw3G4e81biZ775J0Tl7Z/DIGxpmSzsTocI2BfG9SWihHfrlo1sRIa
         RAhRpvy+0NM9Cg8qwIq0eltDWK0lUUReZU73olbt2qQ4DwTHyCJp4AfK0z39M/xziJ0S
         a4ooub0lifGYh6O3Q9i/QeAG2UtFHFlYZKr0Tugu/EgMT42HJvvkG5UyoMHK+PkPs83h
         v1fV6VqfXdPfTY7N33gM54eQX2WvQ8ytA9JAFt/vhkNYcLfi7Z49HNoDzeM/4LICF547
         1NHB2rASotiG3UTGdovZ6qgz2zPG96v6x3pGBzfrq1kxQ+XdRi1vqMJMJFFzNtSKIeHQ
         Nxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724933701; x=1725538501;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIcdrVvM45vUU1dn+CBgSjmywvRTg6UZEf81hF7tbHg=;
        b=i0wSjAmpdX+BANkNOcDLbFAFhd9wUpQrhy3jKGBA6VYAVcythCVBkW8E/WmnHCHPQ/
         zIeHIX1mKTsEanhs6Sg47QCbpDOvSKeEuRJFTO5w/xqS08qNmdlsKoTItn8ElMnlJr31
         56pAMa/lPgODmbuGHyc7OeFusvdDA9gFj4httRTEaHGsnwOoJn0gyVDNeGbRM6gAK6ge
         gJhndT2TKyqx15xrJX/paJuJHdshL8UY/N5jwAWCgQRea1yk70gCjxN5RLu0ZWVOIvyk
         TE7QbiXsuvL3Ue6H2CHNXCxwMVIJeHsKKaE406zzk1tbR/sR7qlrbMjhQuLVrE0OuGl4
         BWvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpKTaEWbJNunll+gp4QGTJUkymnvfwSjq6GxTzsTandvGQOpugN9wfN1LO7bL+Duvpyg4krNCRkQg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrWt1rOBWAXmIyvntpLFke3hLNA8u8eU06UTi8yR5bf40ipCsH
	oGEERxDcFJ+9X/Z+xiktFn5HMZ7YDYk7LllVcafrwcjUL5WzPbh+6NzjnJr5Ww==
X-Google-Smtp-Source: AGHT+IGNr6pWQ6URETWBryaMqp4RV7NbD2SdHTSPYjluh7GN6d1PfP/B027t624509kejEHWPREwlg==
X-Received: by 2002:a17:907:7e92:b0:a86:7c6e:2bb9 with SMTP id a640c23a62f3a-a897f7892e8mr218934266b.2.1724933700901;
        Thu, 29 Aug 2024 05:15:00 -0700 (PDT)
Message-ID: <05a08778-7c3f-416e-a7ef-12a1472d3fce@suse.com>
Date: Thu, 29 Aug 2024 14:14:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] xen/riscv: page table handling
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
 <090e617d88b279ae88f1a7859875a7e1a0c6ae73.1724256027.git.oleksii.kurochko@gmail.com>
 <c0005454-3b34-427d-8ea0-620aba632487@suse.com>
 <ed84c53454cb63082aa96befe89a89d8f234ef71.camel@gmail.com>
 <b83e7d23-2171-447f-a4e5-48563e4068a5@suse.com>
 <4418002b93a3ae101e15e390dc537c726948bcb4.camel@gmail.com>
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
In-Reply-To: <4418002b93a3ae101e15e390dc537c726948bcb4.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.08.2024 14:04, oleksii.kurochko@gmail.com wrote:
> On Thu, 2024-08-29 at 09:01 +0200, Jan Beulich wrote:
>> On 28.08.2024 18:11, oleksii.kurochko@gmail.com wrote:
>>> On Tue, 2024-08-27 at 17:00 +0200, Jan Beulich wrote:
>>>> On 21.08.2024 18:06, Oleksii Kurochko wrote:
>>>>> @@ -68,6 +111,20 @@ static inline bool pte_is_valid(pte_t p)
>>>>>      return p.pte & PTE_VALID;
>>>>>  }
>>>>>  
>>>>> +inline bool pte_is_table(const pte_t p)
>>>>> +{
>>>>> +    return ((p.pte & (PTE_VALID |
>>>>> +                      PTE_READABLE |
>>>>> +                      PTE_WRITABLE |
>>>>> +                      PTE_EXECUTABLE)) == PTE_VALID);
>>>>> +}
>>>>
>>>> In how far is the READABLE check valid here? You (imo correctly)
>>>> ...
>>
>> Oh, I wrongly picked on READABLE when it should have been the
>> WRITABLE
>> bit.
>>
>>>>> +static inline bool pte_is_mapping(const pte_t p)
>>>>> +{
>>>>> +    return (p.pte & PTE_VALID) &&
>>>>> +           (p.pte & (PTE_WRITABLE | PTE_EXECUTABLE));
>>>>> +}
>>>>
>>>> ... don't consider this bit here.
>>> pte_is_mapping() seems to me is correct as according to the RISC-V
>>> privileged spec:
>>>    4. Otherwise, the PTE is valid. If pte.r = 1 or pte.x = 1, go to
>>> step 
>>>    5. Otherwise, this PTE is a pointer to the next level of the
>>> page   
>>>    table.
>>>    5. A leaf PTE has been found. ...
>>
>> Right. And then why do you check all three of r, x, and w, when the
>> doc
>> mentions only r and x? There may be reasons, but such reasons then
>> need
>> clearly stating in a code comment, for people to understand why the
>> code
>> is not following the spec.
> So I remembered why R, W, and X are checked. There is contradictory
> information about these bits
> (https://github.com/riscv/riscv-isa-manual/blob/main/src/supervisor.adoc?plain=1#L1317C64-L1321C10
> ):
> ```
> The permission bits, R, W, and X, indicate whether the page is
> readable, writable, and executable, respectively. When all three are
> zero, the PTE is a pointer to the next level of the page table;
> otherwise, it is a leaf PTE.
> ```
> 
> However, it is also written here
> (https://github.com/riscv/riscv-isa-manual/blob/main/src/supervisor.adoc?plain=1#L1539
> ) that only pte.r and pte.x should be checked.
> 
> I can assume that the interpretation that R=W=X=0 indicates a pointer
> to the next level of the page table could come from this statement
> (https://github.com/riscv/riscv-isa-manual/blob/main/src/supervisor.adoc?plain=1#L1538
> ):
> ```
> If _pte_._v_ = 0, or if _pte_._r_ = 0 and _pte_._w_ = 1, or if any bits
> or encodings that are reserved for future standard use are set within
> _pte_, stop and raise a page-fault exception corresponding to the
> original access type.
> ```
> From this, I can assume that when pte.r = 0, pte.w should also always
> be zero; otherwise, a page-fault exception will be raised. ( but it is
> no obviously connected to if the PTE is a pointer to the next page
> table or not... ).

I don't view the information provided as contradictory, especially when
further taking the "Encoding of PTE R/W/X fields" table into account: W
set but the other two clear is "Reserved for future use."

>>>>> + * If `mfn` is valid and flags has PTE_VALID bit set then it
>>>>> means
>>>>> that
>>>>> + * inserting will be done.
>>>>> + */
>>>>
>>>> What about mfn != INVALID_MFN and PTE_VALID clear?
>>> PTE_VALID=0 will be always considered as destroying and no matter
>>> what
>>> is mfn value as in this case the removing is done in the way where
>>> mfn
>>> isn't used:
>>
>> Right, yet elsewhere you're restrictive as to MFN values valid to
>> use.
>> Not requiring INVALID_MFN here looks inconsistent to me.
> but actually if we will leave ASSERT in pt_check_entry() we will be
> sure that we are here with mfn = INVALID_MFN:
>        /* Sanity check when removing a mapping. */
>        else if ( (flags & (PTE_VALID | PTE_POPULATE)) == 0 )
>        {
>            /* We should be here with an invalid MFN. */
>            ASSERT(mfn_eq(mfn, INVALID_MFN));

Having such an assertion there is fine, but doesn't save you from getting
comments correct / complete.

>>>         memset(&pte, 0x00, sizeof(pte));
>>
>> Just to mention it: I don't think memset() is a very good way of
>> clearing
>> a PTE, even if right here it's not a live one.
> Just direct assigning would be better? 

Imo yes.

>>>>  Also note that "`mfn` is
>>>> valid" isn't the same as "mfn != INVALID_MFN". You want to be
>>>> precise
>>>> here,
>>>> to avoid confusion later on. (I say that knowing that we're still
>>>> fighting
>>>> especially shadow paging code on x86 not having those properly
>>>> separated.)
>>> If it is needed to be precise and mfn is valid isn't the same as
>>> "mfn
>>> != INVALID_MFN" only for the case of shadow paging?
>>
>> No, I used shadow paging only as an example of where we have similar
>> issues. I'd like to avoid that a new port starts out with introducing
>> more instances of that. You want to properly separate INVALID_MFN
>> from
>> "invalid MFN", where the latter means any MFN where either nothing
>> exists at all, or (see mfn_valid()) where no struct page_info exists.
> Well, now I think I understand the difference between "INVALID_MFN" and
> "invalid MFN."
> 
> Referring back to your original reply, I need to update the comment
> above pt_update():
> ```
>    ...
>      * If `mfn` is valid ( exist ) and flags has PTE_VALID bit set then it
>    means that inserting will be done.
> ```
> Would this be correct and more precise?

That depends on whether it correctly describes what the code does. If
the code continues to check against INVALID_MFN, such a description
wouldn't be correct. Also, just to re-iterate, ...

> Based on the code for mfn_valid(), the separation is currently done
> using the max_page value, which can't be initialized at the moment as
> it requires reading the device tree file to obtain the RAM end.

... mfn_valid() may return false for MMIO pages, for which it may still
be legitimate to create mappings. IMO ...

> We could use a placeholder for the RAM end (for example, a very high
> value like -1UL) and then add __mfn_valid() within pt_update().
> However, I'm not sure if this approach aligns with what you consider by
> proper separation between INVALID_MFN and "invalid MFN."

... throughout the code here you mean INVALID_MFN and never "invalid MFN".
Populating page tables is lower a layer than where you want to be
concerned with that distinction; the callers of these low level functions
will need to make the distinction where necessary.

Jan

