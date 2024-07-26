Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD93093CEE8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 09:36:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765289.1175886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXFUy-0006rb-5v; Fri, 26 Jul 2024 07:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765289.1175886; Fri, 26 Jul 2024 07:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXFUy-0006pU-2R; Fri, 26 Jul 2024 07:36:20 +0000
Received: by outflank-mailman (input) for mailman id 765289;
 Fri, 26 Jul 2024 07:36:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bo/X=O2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sXFUw-0006pO-Q7
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 07:36:18 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bea84b1c-4b21-11ef-bbff-fd08da9f4363;
 Fri, 26 Jul 2024 09:36:17 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so131673366b.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 00:36:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad4ae4dsm143833966b.136.2024.07.26.00.36.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jul 2024 00:36:16 -0700 (PDT)
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
X-Inumbo-ID: bea84b1c-4b21-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721979377; x=1722584177; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L+XrnBvO28HTfSsxjfwSjzdC3/Q1fvXAJzgvBQwjoVo=;
        b=ZXjDBGl47crZuIgtdICKNYPN9QMOmrWapbkHMJniwbKzvl1FyFgHj3EmO609LDo5t9
         1m5bmV2zcvDy1hdp2X9nCo6ZCwux04CcH2gViTlqAvid86qIXU2nm3O4XZFI0iGgCnmU
         fCMXdPXGXkKM6yki2m2nbhIzcQy7XPr+utwH99W9SCWbqL5HVywuYr8z7LoItMOgrf7c
         sbe8Cu6ctPwB+UJhq4oBXn3BSQcIo7m9YKB1OrcsBVoIBzh92r+TnLp1GwkNvqjhluoE
         /duiazzqnsTITvnR4q5txRDOJyAS6uYVLwER6OQsB+z1NyinIE6iJyh1zJY6rYBjBU54
         8x/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721979377; x=1722584177;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+XrnBvO28HTfSsxjfwSjzdC3/Q1fvXAJzgvBQwjoVo=;
        b=XEXIgTcVgEibZb0DOj1vt1iP6bf5r70DonEG1jww8ol3BsJe+xusoIvoUfJffwxnDu
         29z6tFFit7w8CbdF3RnSYMR8T0GTGz79jQNJKqmjzNOxhd1BRa9cvB8LnM4IsOAnHFET
         dw6YcZ2qTL0iH6EadcHHIW4xCr6zITE0LH1/ORNkRTKmU5o7kH7A2yUT+vV2Gn4c5FgK
         u6saIC5afl2AKRg+sS+vXd+C67+fgRBlFvXJKL8Wq8OT7dskxeFy0x3Rx+l0eL7BVZGU
         pQbvXkKC74AHCAmpOOS9TlI4U8nFnmckRdX4ryjB0l4yptWUJ6fYNzTXs9g8oVaJaZ8M
         c7YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbErhkELS30S1FhLUh9u5VQ/sp2tPOaXc+cALC1Ag+OEVPt2pv6rT3fpePvLFV4OBuc1LVLGFRFzeH1lbvx993PjpRHIlQ5o75BltgK6Q=
X-Gm-Message-State: AOJu0YxkX2A7GbI1Y59CuJmhK8c3qvskuAGQP99+PzpXMq/FiVy0ftox
	O8r7zM3LaTgTTJdZ/lLJzsYonXxM/GawFqUNgJVmxg+OpKO3/x4tLq0fIKNZJg==
X-Google-Smtp-Source: AGHT+IGK/+/23iKUCeJ8vXJmxDP0nlOKhORICd/yFNN2GR9i/P8iOQiIHQouoR0bjfdVXUVSkmUxcQ==
X-Received: by 2002:a17:906:d54f:b0:a7a:ac5f:bc01 with SMTP id a640c23a62f3a-a7ac4b624b5mr447943466b.0.1721979377167;
        Fri, 26 Jul 2024 00:36:17 -0700 (PDT)
Message-ID: <0f6b446a-0dda-4e59-807b-c0c0bcdf78bf@suse.com>
Date: Fri, 26 Jul 2024 09:36:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/altcall: further refine clang workaround
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
References: <20240725105634.16825-1-roger.pau@citrix.com>
 <9ecd3a39-55bf-4a49-9f45-1e0abfad353a@suse.com> <ZqJnPvL1ilDDzM9V@macbook>
 <a638b0e1-07a3-495c-b3b9-e450a50f9429@suse.com> <ZqNQwM3U8S5q-kg5@macbook>
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
In-Reply-To: <ZqNQwM3U8S5q-kg5@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.07.2024 09:31, Roger Pau Monné wrote:
> On Thu, Jul 25, 2024 at 05:00:22PM +0200, Jan Beulich wrote:
>> On 25.07.2024 16:54, Roger Pau Monné wrote:
>>> On Thu, Jul 25, 2024 at 03:18:29PM +0200, Jan Beulich wrote:
>>>> On 25.07.2024 12:56, Roger Pau Monne wrote:
>>>>> --- a/xen/arch/x86/include/asm/alternative.h
>>>>> +++ b/xen/arch/x86/include/asm/alternative.h
>>>>> @@ -184,11 +184,11 @@ extern void alternative_branches(void);
>>>>>   * https://github.com/llvm/llvm-project/issues/82598
>>>>>   */
>>>>>  #define ALT_CALL_ARG(arg, n)                                            \
>>>>> -    register union {                                                    \
>>>>> -        typeof(arg) e[sizeof(long) / sizeof(arg)];                      \
>>>>> -        unsigned long r;                                                \
>>>>> +    register struct {                                                   \
>>>>> +        typeof(arg) e;                                                  \
>>>>> +        char pad[sizeof(void *) - sizeof(arg)];                         \
>>>>
>>>> One thing that occurred to me only after our discussion, and I then forgot
>>>> to mention this before you would send a patch: What if sizeof(void *) ==
>>>> sizeof(arg)? Zero-sized arrays are explicitly something we're trying to
>>>> get rid of.
>>>
>>> I wondered about this, but I though it was only [] that we were trying
>>> to get rid of, not [0].
>>
>> Sadly (here) it's actually the other way around, aiui.
> 
> The only other option I have in mind is using an oversized array on
> the union, like:
> 
> #define ALT_CALL_ARG(arg, n)                                            \
>     union {                                                             \
>         typeof(arg) e[(sizeof(long) + sizeof(arg) - 1) / sizeof(arg)];  \
>         unsigned long r;                                                \
>     } a ## n ## __  = {                                                 \
>         .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
>     };                                                                  \
>     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) =      \
>         a ## n ## __.r

Yet that's likely awful code-gen wise? For the time being, can we perhaps
just tighten the BUILD_BUG_ON(), as iirc Alejandro had suggested?

Jan

