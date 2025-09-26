Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2DFBA2908
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 08:47:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131081.1470301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v22EM-0007G3-H9; Fri, 26 Sep 2025 06:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131081.1470301; Fri, 26 Sep 2025 06:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v22EM-0007Eb-E4; Fri, 26 Sep 2025 06:46:58 +0000
Received: by outflank-mailman (input) for mailman id 1131081;
 Fri, 26 Sep 2025 06:46:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v22EL-0007ET-2t
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 06:46:57 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97ae0b64-9aa4-11f0-9d14-b5c5bf9af7f9;
 Fri, 26 Sep 2025 08:46:56 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-62fc2d92d34so3135402a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 23:46:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b35446f79besm308240266b.69.2025.09.25.23.46.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 23:46:55 -0700 (PDT)
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
X-Inumbo-ID: 97ae0b64-9aa4-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758869215; x=1759474015; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/0QTzDwEw+SBDEP5K1nabRP6P6t/vMtgLq8U1uG7AYk=;
        b=T5V4UT9MbuQLEgQrfYFooRU98uh+6aQCFqqyktEI4J40InMCu15Tw40afQz7zeqCM1
         xDtmvzOea3Q1kLcwIh0kBFely9wT/JUm2+kZ0a0HObpjn7BqOW2kNAWlF1JHQgvOrOyo
         l5Yz7kIEPpctjyk2Vxs53Jsrejj9HYUs8dxLZsWF8jRELW/PoZ/Lb3mpTbKEYWLAt+p5
         rj+Q/phQLQeQnygTlCsrKqYRp1nTo9DgWhl6RPQ9YIGu+fOjIo0hAXX1UaYnA1d6nJAG
         FxjzWglwcOVnc3lCpBze4VJai4dmuORi8Lt5T/75L3NkRMNImHsFOpPRh33vt2LxTiyN
         Dipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758869215; x=1759474015;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0QTzDwEw+SBDEP5K1nabRP6P6t/vMtgLq8U1uG7AYk=;
        b=NjtVwTmNMg274wFw1vw7LrqF7NS7Oexe1EXHEcnU8CXzNn/C1tfG6WgCC0qAbhDZSB
         s66YUvi8wgR3mmccFcOH/slj7BvnKYwRUL7XdIOIKbj+Nd4sa4YMP1oo0udNPTTXvYhf
         2C/ctrR+WrU8uqL3qA5+Bts/A9u8RFS6HejKaSSNRDQ5SuM5yq0j5GcUjBXm6b6Xc/Y5
         OPnUi3fSpXQszPdDyVIZWOh+vm+q18jRaisdcfUDnXlkgtcL7ODY6f0AK+vIxrMJe6MU
         RVZptOmSox5qx0BXmSIb1//W6ftvDWr5apa+tbH2DMRGRzXD/QbDQ10zf0COeBtmViJT
         6jHg==
X-Forwarded-Encrypted: i=1; AJvYcCXBZ2/uX8w0ybDrt1Y4lS7T+CXGY7mObOzKt4iSP+rIFGgtB8S6Pz3Ql5nFKSn0E6enooE4dkFp6kc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx2y/cT8r4S++MdhYbNYXBl49JBlKqHvdnCBxItFp7MPzWozMxM
	I3d83slCVJ+0bKE8RUdni+XTeyOW4h+ZTsguAQefziRu+I/rNUFiNwcwFTmCTrXExw==
X-Gm-Gg: ASbGnctjdBB4aZsMTFEE3s+yLRTb36Ko8b6o0DMsxEdxAN91vgFHmmYMPX7+8Y08ugg
	NGvHVMfLp8lF7MOdPMlVVH/NzacCnW+klMkYUSwEY/QDYfV6MEchC/wN+Ucan9m20cajIK8AnLr
	Jq4WblW/1MhU1NfQtfVKsURzRiJ5HrGV/VMrm5kSe0nyXN4aW9/z0Fowb5Xr83Qb1SUfH77L1RA
	zNbNMtnRjxZybtPTydMD6QdfwqyBWZwT+6JrW5ZcURoFwl4N8huRfbc9k3ORNUqyaBHac61Qmw6
	AcKO2ghcaXDYtqr70uc+SiPa/eno2Q27cF3iiVgdnerec3XxD5eUMQRdq6lYbN4Nrxh1kwdJbS3
	3SIxrVT/If8LN14gSO0pz2tI4XpoVIRwwBWDIKvJQ7zt6lJdadBD2kZzjE6n2aRwFMLcEqe6v+X
	wqhLkr2nU=
X-Google-Smtp-Source: AGHT+IFnrsQvRnNcb3k/xSEObDzxEt7O4Gca9AEOoa54u/4818ahjOwryXalAzt92wD+zaBG6ebWTQ==
X-Received: by 2002:a17:906:4fcd:b0:b2c:dc13:89e4 with SMTP id a640c23a62f3a-b34ba147a90mr687172966b.9.1758869215383;
        Thu, 25 Sep 2025 23:46:55 -0700 (PDT)
Message-ID: <eff9d532-1908-4584-aed0-25b1d0d2ca50@suse.com>
Date: Fri, 26 Sep 2025 08:46:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: consider conversion from UL or (void*) to
 function pointer as safe
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b0f269822312a442e87ab02c8deff028b6b040a9.1758787340.git.dmytro_prokopchuk1@epam.com>
 <ae0ecbfc-cee0-4035-ba03-e9f9ba2661e4@suse.com>
 <d3b71d3f-77fd-4763-bd01-bc6212cd80f1@epam.com>
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
In-Reply-To: <d3b71d3f-77fd-4763-bd01-bc6212cd80f1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.09.2025 20:37, Dmytro Prokopchuk1 wrote:
> On 9/25/25 16:25, Jan Beulich wrote:
>> On 25.09.2025 10:04, Dmytro Prokopchuk1 wrote:
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -366,11 +366,22 @@ Deviations related to MISRA C:2012 Rules:
>>>        - Tagged as `safe` for ECLAIR.
>>>   
>>>      * - R11.1
>>> -     - The conversion from a function pointer to unsigned long or (void \*) does
>>> +     - The conversion from a function pointer to unsigned long or '(void *)' does
>>>          not lose any information, provided that the target type has enough bits
>>>          to store it.
>>>        - Tagged as `safe` for ECLAIR.
>>>   
>>> +   * - R11.1
>>> +     - The conversion from unsigned long or '(void *)' to a function pointer is
>>> +       safe because it relies on both ABI definitions and compiler implementations
>>> +       supported by Xen which define consistent and compatible representations
>>> +       (i.e., having the same size and memory layout) for '(void *)', unsigned
>>> +       long, and function pointers, enabling safe conversions between these types
>>> +       without data loss or corruption. The compile-time assertions (BUILD_BUG_ON
>>> +       macro) is integrated into 'xen/common/version.c' to confirm conversions
>>> +       compatibility across all target platforms.
>>
>> As you use (and mean) plural, s/is/are/ ? I also think the "The" at the start
>> of the sentence wants dropping.
> Ok.
> 
>>
>> Further, why this very dissimilar wording compared to what's said about
>> conversions _from_ function pointer types?
> Do you mean the following wording should be placed instead (to be 
> similar with previous one)?
> 
> "Conversions from unsigned long or (void *) to a function pointer do not 
> lose any information, provided that the source type has enough bits to 
> restore it."
> 
> And wording about "ABI, compiler..." should be only in commit message?

Perhaps.

>> And then ...
>>
>>> --- a/xen/common/version.c
>>> +++ b/xen/common/version.c
>>> @@ -217,6 +217,17 @@ void __init xen_build_init(void)
>>>   #endif /* CONFIG_X86 */
>>>   }
>>>   #endif /* BUILD_ID */
>>> +
>>> +static void __init __maybe_unused build_assertions(void)
>>> +{
>>> +    /*
>>> +     * To confirm conversion compatibility between unsigned long, (void *)
>>> +     * and function pointers for all supported architectures.
>>> +     */
>>> +    BUILD_BUG_ON(sizeof(unsigned long) != sizeof(void (*)(void)));
>>> +    BUILD_BUG_ON(sizeof(void *) != sizeof(void (*)(void)));
>>> +}
>>
>> ... I'm unconvinced checking merely the sizes is sufficient. On architectures
>> involving function descriptors (e.g. ia64) converting in this direction is
>> safe only if earlier on the value was obtained as the result of a conversion
>> in the opposite direction (and all of this within a single component, which
>> of course is guaranteed for Xen).
> As I know mainline Xen doesn't support IA-64 currently (this support was 
> dropped).
> Why we still need to mention about IA-64 here?

Because I needed to use an example I know. Aiui there are other architectures
which use function descriptors (or alike).

> Anyway...
> Yes, this deviation wouldn't work with architectures where the 
> representation of a function involves more than just its address (e.g. 
> IA-64). If not proved that such conversion is symmetric.
> 
> Probably, additional guard may be added below to exclude such 
> architectures (e.g. IA-64):
> 
> static void __init __maybe_unused build_assertions(void)
> {
> #if defined (__IA64__) || defined (__ia64__)
> #error "Conversions to function pointer isn't safe -  architecture uses 
> function descriptors."
> #endif

Well, no, I didn't mean to ask that you add dead code.

>      BUILD_BUG_ON(sizeof(unsigned long) != sizeof(void (*)(void)));
>      BUILD_BUG_ON(sizeof(void *) != sizeof(void (*)(void)));
> }
> 
> But if someone really will try to run Xen on such platform, the build 
> will fail.
> 
> Or just mention explicitly that other architectures (e.g., IA-64) might 
> not be safe for such conversions?

My main point really is that once again I wonder how convincing such an
argument would be to assessors, when it's clearly not generic (yet being
worded and the checking coded as if it was).

Jan

