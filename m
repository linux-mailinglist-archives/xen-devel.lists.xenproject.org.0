Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8787B90AAC8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 12:08:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742107.1148821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ9Hb-0004rB-Nv; Mon, 17 Jun 2024 10:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742107.1148821; Mon, 17 Jun 2024 10:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ9Hb-0004pd-Kf; Mon, 17 Jun 2024 10:08:15 +0000
Received: by outflank-mailman (input) for mailman id 742107;
 Mon, 17 Jun 2024 10:08:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E9YK=NT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJ9Ha-0004pX-5U
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 10:08:14 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 812178b5-2c91-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 12:08:12 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a6f7720e6e8so127957966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 03:08:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56db6808sm496939266b.81.2024.06.17.03.08.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 03:08:11 -0700 (PDT)
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
X-Inumbo-ID: 812178b5-2c91-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718618891; x=1719223691; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sUrf39DcEODG4w8OGMJJJVPos55kiRh6t8fckRHa0Ac=;
        b=BudNOL/yfVTCYafJeLDOGdyQAoJnz4ohtkCQfj9xk4NZ2/DeMGfl06RxZ+Zz2yMfNt
         N+eFgmt5XwXc5q6NSLjLjNa+36VwQUSkRqV8/NOo7XFZ06TW4PwC0p7JAqZkG+QpTPWu
         nM8UgDN2cQjKfXJ1nNyPs+uxF3zSmGkKS3RNwNvJAWu4rSlIg+oD8zjuW999xUkCXPg9
         7x73gE/Wwd5EJx5bDM+isSnL02lfddtzpIGptXOTkpRDaXkhdoOV2Q2Gre37U7ejcFgg
         HZQpvaE3HnPAwetluVn0ha/JVihb58kBxj6dUSyxhLDQGjNWQI/HwF/YmjY98vituj2R
         CzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718618891; x=1719223691;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUrf39DcEODG4w8OGMJJJVPos55kiRh6t8fckRHa0Ac=;
        b=HS5F+IHbklbTd3nTqj71p6ThePZwm0Z2YPYdqnN1E+X/X17ZfNfbBMJG9P8TjRFEe0
         gwMJOkEMKIAYBnGczAdtCxYtYj1vLurLFHyo4Pki2U87iT8k7gJ02Tn7izH2JAsZgeC8
         dgy1SobiXBJ0A90YtsTQZKz+uEShjfOC9JBbSuyvxkU/+3wSH6/YEfm2UQKZX/PKtekl
         Ij5gF80agO2Us33KmDEVTBYCJ+sOw5AmiNJAY5mRg/On1gxj15FVIaARge7FAGRMC5+r
         nYJNbzvPIeRco5b/IKJ/iX3Rf3aaocDv0ujfVL6qAv0VSQwzNGZTZaiaZ8QZ8ZmGLLre
         JkLw==
X-Forwarded-Encrypted: i=1; AJvYcCXpXtrpnk0sIp7xSiSL+H9qLiND8IVtQwjpTzB5lSfddm55VCmFnqW6GAc0EEJLu6491tODNoLJc41PGBr5rfU9g8Hl75OWMf6KSWQziaQ=
X-Gm-Message-State: AOJu0YwpGLLw1RJT2aEa5FohHUSd9vA0D8fdBePUm5+dY2pI+Z9XTn0Q
	fTTy4lNFMyiAQO4nT1VSj7zk2fW4VkVRVZnKvZTm8uUCMXLggN0/dQwLjm2sZvlykjmJzjp4qkQ
	=
X-Google-Smtp-Source: AGHT+IEsI0rgoiyVdgUUUyeoAEm404fm7RJlZVJxQSeqVFWsDUFEoN24VR8coBrkEpHiWGaLXmmnLA==
X-Received: by 2002:a17:906:756:b0:a6f:1df1:1ef2 with SMTP id a640c23a62f3a-a6f60dc517fmr719388866b.47.1718618891542;
        Mon, 17 Jun 2024 03:08:11 -0700 (PDT)
Message-ID: <bd174018-e243-400c-845f-68b08d976d1f@suse.com>
Date: Mon, 17 Jun 2024 12:08:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] x86/xstate: Cross-check dynamic XSTATE sizes at boot
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240523111627.28896-1-andrew.cooper3@citrix.com>
 <20240523111627.28896-3-andrew.cooper3@citrix.com>
 <22e0473a-aca8-4645-a3f4-21a9d9e0ebd3@suse.com>
 <71cbc846-527d-45f0-bd0b-df3f0294e7cd@citrix.com>
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
In-Reply-To: <71cbc846-527d-45f0-bd0b-df3f0294e7cd@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.06.2024 15:56, Andrew Cooper wrote:
> On 23/05/2024 4:34 pm, Jan Beulich wrote:
>> On 23.05.2024 13:16, Andrew Cooper wrote:
>>> Right now, xstate_ctxt_size() performs a cross-check of size with CPUID in for
>>> every call.  This is expensive, being used for domain create/migrate, as well
>>> as to service certain guest CPUID instructions.
>>>
>>> Instead, arrange to check the sizes once at boot.  See the code comments for
>>> details.  Right now, it just checks hardware against the algorithm
>>> expectations.  Later patches will add further cross-checking.
>>>
>>> Introduce the missing X86_XCR0_* and X86_XSS_* constants, and a couple of
>>> missing CPUID bits.  This is to maximise coverage in the sanity check, even if
>>> we don't expect to use/virtualise some of these features any time soon.  Leave
>>> HDC and HWP alone for now.  We don't have CPUID bits from them stored nicely.
>> Since you say "the missing", ...
>>
>>> --- a/xen/arch/x86/include/asm/x86-defns.h
>>> +++ b/xen/arch/x86/include/asm/x86-defns.h
>>> @@ -77,7 +77,7 @@
>>>  #define X86_CR4_PKS        0x01000000 /* Protection Key Supervisor */
>>>  
>>>  /*
>>> - * XSTATE component flags in XCR0
>>> + * XSTATE component flags in XCR0 | MSR_XSS
>>>   */
>>>  #define X86_XCR0_FP_POS           0
>>>  #define X86_XCR0_FP               (1ULL << X86_XCR0_FP_POS)
>>> @@ -95,11 +95,34 @@
>>>  #define X86_XCR0_ZMM              (1ULL << X86_XCR0_ZMM_POS)
>>>  #define X86_XCR0_HI_ZMM_POS       7
>>>  #define X86_XCR0_HI_ZMM           (1ULL << X86_XCR0_HI_ZMM_POS)
>>> +#define X86_XSS_PROC_TRACE        (_AC(1, ULL) <<  8)
>>>  #define X86_XCR0_PKRU_POS         9
>>>  #define X86_XCR0_PKRU             (1ULL << X86_XCR0_PKRU_POS)
>>> +#define X86_XSS_PASID             (_AC(1, ULL) << 10)
>>> +#define X86_XSS_CET_U             (_AC(1, ULL) << 11)
>>> +#define X86_XSS_CET_S             (_AC(1, ULL) << 12)
>>> +#define X86_XSS_HDC               (_AC(1, ULL) << 13)
>>> +#define X86_XSS_UINTR             (_AC(1, ULL) << 14)
>>> +#define X86_XSS_LBR               (_AC(1, ULL) << 15)
>>> +#define X86_XSS_HWP               (_AC(1, ULL) << 16)
>>> +#define X86_XCR0_TILE_CFG         (_AC(1, ULL) << 17)
>>> +#define X86_XCR0_TILE_DATA        (_AC(1, ULL) << 18)
>> ... I'm wondering if you deliberately left out APX (bit 19).
> 
> It was deliberate.  APX isn't in the SDM yet, so in principle is still
> subject to change.
> 
> I've tweaked the commit message to avoid using the word 'missing'.

Thanks.

>> Since you're re-doing some of what I have long had in patches already,
>> I'd also like to ask whether the last underscores each in the two AMX
>> names really are useful in your opinion. While rebasing isn't going
>> to be difficult either way, it would be yet simpler with
>> X86_XCR0_TILECFG and X86_XCR0_TILEDATA, as I've had it in my patches
>> for over 3 years.
> 
> I'm torn here.  I don't want to deliberately make things harder for you,
> but I would really prefer that we use the more legible form...

Well, okay, so be it then.

Jan

