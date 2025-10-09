Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD3BBC7CA2
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 09:52:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140367.1475274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6lRL-00031R-MM; Thu, 09 Oct 2025 07:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140367.1475274; Thu, 09 Oct 2025 07:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6lRL-0002zg-JI; Thu, 09 Oct 2025 07:51:55 +0000
Received: by outflank-mailman (input) for mailman id 1140367;
 Thu, 09 Oct 2025 07:51:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6lRJ-0002za-P4
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 07:51:53 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0dd1ee0-a4e4-11f0-9809-7dc792cee155;
 Thu, 09 Oct 2025 09:51:51 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso925283f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Oct 2025 00:51:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46faf4210d2sm32549975e9.1.2025.10.09.00.51.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 00:51:50 -0700 (PDT)
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
X-Inumbo-ID: d0dd1ee0-a4e4-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759996311; x=1760601111; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9lsah7bqeRTmWwDQipjs94/f6hLwWES6iK98Kkrh3HE=;
        b=J0WTimt19f4sF40/7ba2T547uCoyVoJIwKtujUIKUapNkuLehhU2ztiJek93RmaW+r
         VBSiffW+CGoOxteKGWb0YHUxunHVaXA0twMFPjQy4mDEw2uHv3yOTgIl0jsp3Vy0UJca
         Xzk4BXtIkd/QabYBPtAtQ/KG4sSFwGhB4N66jtc6rJVDrcO3mRRRNKtYMTzwsvaN2Fxm
         XAL2bMR5rP0JBwmjOgeBtcD2JwMXKu4xCxQpXtcR0yZSupuu5bBAfAmhnGJCFS4nFgvW
         dL0cNF6GpkhtZ+NYIwmtupfxWuQw9REtnf5R7yILCrvzI7TOOTQjEokRc9Y6HkcOzzoP
         9eAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759996311; x=1760601111;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9lsah7bqeRTmWwDQipjs94/f6hLwWES6iK98Kkrh3HE=;
        b=xUjRANAkONdWluDWBBgKj0geGcCNhXYW9YBpsuGGmDv5L9oogL3ixiUvg+GYOQiBP/
         6oSbeY8c9B3yiKp+UTvroNfdHJ9+leQPDqREV5yyheKOjRbk2TdYha/SnjOaYJuXT2rQ
         HTc4T9mFCi08NGJoGAEguH2dAWDo9OMx/TquBrEer1PCtyZFtjopMDWb8BZYmxRJx/ve
         Z7ynHDJeE3yHM4h6qelbMDXcrDaWBvPSZ/FeOsWv5k7nbE0eAHB0c3/IH/WcGg3z6ZUA
         zK4hA8K2bMQ7AkDS8tWEyhLySCdXHHooiD3cwMmsVPq+0Vz8aInE/UdbNRcUXlFsp4yh
         oFTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTep7Nz84yEHBqCS8y1PEaoJtBYd9jrv1paW6itGEQiJ/t9zAKERCqrsjWH59HM4cHNdlRz1e+X04=@lists.xenproject.org
X-Gm-Message-State: AOJu0YywS2xQkoQUpz8hQGEV3k9UlN1xXjkStsJZdD99sCdXLxJXJF89
	iJTgw8LCAjhH0aY3/yjFaBXUlJQp4doHeLn8idDAPxsDweLhPjljZbKnA/AwvRH55g==
X-Gm-Gg: ASbGncvcFWJqkqrgRsN0+Es2X7xICY0BHqWvr6aJMAlvPth1CiojI6/6D6fVQYbrul5
	+XsdAHATQNRhaly6dqGG3LR7uPfTct22w75C1z5ZG1BC9A5wC7MBrTQf4jKf97owlNw+P3rRsgl
	kWyrylq/7/u0Lpf6KiHQXzqRdIKcGl2TMtlqrib+Poi8kOcrCdY5We01fnh01J62wuTkjgo3aJP
	bjDBCJS9hUV9PZhHpMfOTzvikF6G+xHjKlqbQOAzvdwfzPIn4RLVKg/60sgrs8r/Up+6QRd4tvd
	1ipQF4ClUcL81i+0oU+LMztcjgRnmSmzCFoQxTxRDmRXE36/a5bpOF3pqdweodSz/B03pup248i
	P1seCDpmY0mo3FVA9xwG6HHyAKeMzF8DoEqeoD+ltl81dpGOJEToZrdtSeHHHoGXWWww0p/fP8b
	Vr2dY8ZkkSbKn1oSqTIW+Ut4YOfESO9MMBsOD/20Uwww==
X-Google-Smtp-Source: AGHT+IEkuK6REC0Y6s/V+z8l0IsrVwLnEOjUQNPcDm2BFeZeIdzPfm9VPA1AbNAEZT51Jk9sTN59Ow==
X-Received: by 2002:a05:6000:40c8:b0:410:f600:c35e with SMTP id ffacd0b85a97d-425829b0561mr5974079f8f.8.1759996310720;
        Thu, 09 Oct 2025 00:51:50 -0700 (PDT)
Message-ID: <b3a2701c-5954-4bde-a4a3-859d9a7a40e3@suse.com>
Date: Thu, 9 Oct 2025 09:51:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86: guard synthetic feature and bug enumerators
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com>
 <48dcc0e0-2772-49b9-9383-5bf69f922053@suse.com>
 <3601abf2-c556-4126-9e42-1c08803e2613@citrix.com>
 <60f4c0b0-de20-40ce-bf61-e8ec6fa54460@suse.com>
Content-Language: en-US
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
In-Reply-To: <60f4c0b0-de20-40ce-bf61-e8ec6fa54460@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.10.2025 09:45, Jan Beulich wrote:
> On 08.10.2025 19:19, Andrew Cooper wrote:
>> On 25/09/2025 11:48 am, Jan Beulich wrote:
>>> --- a/xen/arch/x86/include/asm/pdx.h
>>> +++ b/xen/arch/x86/include/asm/pdx.h
>>> @@ -13,9 +13,9 @@
>>>      asm_inline goto (                               \
>>>          ALTERNATIVE(                                \
>>>              "",                                     \
>>> -            "jmp %l0",                              \
>>> -            ALT_NOT(X86_FEATURE_PDX_COMPRESSION))   \
>>> -        : : : : label )
>>> +            "jmp %l1",                              \
>>> +            [feat])                                 \
>>> +        : : [feat] "i" (ALT_NOT(X86_FEATURE_PDX_COMPRESSION)) : : label )
>>
>> Not a bug in this change, but the pre-existing use of positional labels
>> is something I was expecting not to introduce at all seeing as we
>> started cleanly with named labels.
>>
>> The jmp wants to be:
>>
>>   "jmp %l" #label
>>
>> to cope with the fact it's a macro parameter too.
> 
> Unrelated change? I can of course do the adjustment in a separate prereq
> patch, but then it would have been nice if you had commented along these
> lines before that code actually had gone in.
> 
> That said, isn't it at least bad practice to not expose the label use to
> the compiler? To avoid using positional operands, shouldn't we rather
> name the operand, and then use "jmp %l[whatever_the_name]"? That's a
> change I could see as being justified to do right here, rather than in a
> separate patch.

Hmm, no, labels can't be named; they are their own names. I.e. what I think
we want here is "jmp %l[" #label "]".

Jan

