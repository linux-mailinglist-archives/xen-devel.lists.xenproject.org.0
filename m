Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA8F94D0E4
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 15:14:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774764.1185192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scPR0-0003T6-3V; Fri, 09 Aug 2024 13:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774764.1185192; Fri, 09 Aug 2024 13:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scPR0-0003Rc-0T; Fri, 09 Aug 2024 13:13:34 +0000
Received: by outflank-mailman (input) for mailman id 774764;
 Fri, 09 Aug 2024 13:13:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TQMG=PI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1scPQy-0003RV-DT
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 13:13:32 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c869b8d-5651-11ef-bc04-fd08da9f4363;
 Fri, 09 Aug 2024 15:13:31 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7a83a968ddso194139466b.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2024 06:13:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ecabb2sm836093566b.214.2024.08.09.06.13.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Aug 2024 06:13:30 -0700 (PDT)
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
X-Inumbo-ID: 2c869b8d-5651-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723209210; x=1723814010; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XxlrMOcF3nn7vyFJCGx+Qnh7eje7Ah/PfAv/9leMuqo=;
        b=g25H2iwqGE2i/atbaxjbuLnKLWF1lOYqQzBGH3xsM9UEp0/6qVQ2QB0wyLLR46bcM9
         QSGH4JGQPLLgc0EriuiWynDTrSQq5ijZHQg2nP3VSismJB041o/RfW1gmGPHQVipKjfe
         G27kUAu1z6YlT4x5dycDrlqazIORqxLK46EOSw+2NbyCyA/4CZyupm349qnEu8oELLEQ
         efD1bFUCr0an7ucLhAPwgKRSB12Y1uu58XV9XMOd6owj6LqTTc++lri9F8oYpkWdBgbz
         +ya4fuMmHkpf5E/+AJohammdHHCD4JRkz7oOWB5Cdw3Q10FrV0SCLeUdS6WYD5vwcr+h
         pAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723209210; x=1723814010;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxlrMOcF3nn7vyFJCGx+Qnh7eje7Ah/PfAv/9leMuqo=;
        b=eC55IyOZI5vjmPwnJ07IgOg9QBm0pDvnC8ZYlAxyxqKCdKwhIdjSAFaS1SgxwyHwar
         /Q0YFfY02bFVBItJgV/1U/yrmII8okEKnUnkEGh4z/Slv9yV8Sm/1A4vaG7zzwap4MPP
         WjYMriZr5bgPUQjkF5k4Q3+u1+pOdnZ759z44ZKDTzWla0uChdDaqxefIOt2YOwzwGty
         vpmQ/XD8mnON3Oy6p2IBUVd/7CXdhL4d5+Lhjl6Mnz6brZQhGquW8/e2SboBC6GkI5Ug
         3vYA/ZgWjNeA1SvIUFydSDl2Wo7z/Zod7QFxPn8zd7IiuTY31B8/H4tuNQiHa5sF7Y8b
         p26A==
X-Forwarded-Encrypted: i=1; AJvYcCXlvnE4Z2Wx6sfvc4FPKvH8dEVxUAdyrz2mSs5cyQdL4rx6QFUw79tvNIYRgfwikhWvlDsgWTT07w9FvN1Ezpqyu4VSPsb+u5s4IYTOfB8=
X-Gm-Message-State: AOJu0Yw21OtCUUJ+ncUle/vBi4M4ygkdlhSr/tyU+SJSR1Y0MNCvDfWJ
	WI9YOelct6rrDBKjCijq+xko2c96TmsxafvLnWvb58OZo8HcH0jgTJwmaOiCWQ==
X-Google-Smtp-Source: AGHT+IHaWDwQyjRBGpzmuATkdSOmYfcglLN4Etrw4VsjR6c/JfIFp7bDHk1a2wL1JoXUtKiFTkhcqg==
X-Received: by 2002:a17:907:f715:b0:a7d:a29e:5c41 with SMTP id a640c23a62f3a-a80aa5ebb2emr120804466b.40.1723209210536;
        Fri, 09 Aug 2024 06:13:30 -0700 (PDT)
Message-ID: <b866c321-03b4-4e98-a5e0-8d2ad40f3f02@suse.com>
Date: Fri, 9 Aug 2024 15:13:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen: Remove -Wdeclaration-after-statement
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240809130418.10431-1-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20240809130418.10431-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.08.2024 15:04, Alejandro Vallejo wrote:
> This warning only makes sense when developing using a compiler with C99
> support on a codebase meant to be built with C89 compilers too, and
> that's no longer the case (nor should it be, as it's been 25 years since
> C99 came out already).
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> Yes, I'm opening this can of worms. I'd like to hear others people's
> thoughts on this and whether this is something MISRA has views on. If
> there's an ulterior non-obvious reason besides stylistic preference I
> think it should be documented somewhere, but I haven't seen such an
> explanation.
> 
> IMO, the presence of this warning causes several undesirable effects:
> 
>   1. Small functions are hampered by the preclusion of check+declare
>      patterns that improve readability via concision. e.g: Consider a
>      silly example like:
> 
>      /* with warning */                     /* without warning */
>      void foo(uint8_t *p)                   void foo(uint8_t *p)
>      {                                      {
>          uint8_t  tmp1;                         if ( !p )
>          uint16_t tmp2;                             return;
>          uint32_t tmp3;
>                                                 uint8_t  tmp1 = OFFSET1 + *p;
>          if ( !p )                              uint16_t tmp2 = OFFSET2 + *p;
>              return;                            uint32_t tmp3 = OFFSET3 + *p;
> 
>          tmp1 = OFFSET1 + *p;                   /* Lots of uses of `tmpX` */
>          tmp2 = OFFSET2 + *p;               }
>          tmp2 = OFFSET2 + *p;
> 
>          /* Lots of uses of tmpX */
>      }
> 
>   2. Promotes scope-creep. On small functions it doesn't matter much,
>      but on bigger ones to prevent declaring halfway through the body
>      needlessly increases variable scope to the full scope in which they
>      are defined rather than the subscope of point-of-declaration to
>      end-of-current-scope. In cases in which they can be trivially
>      defined at that point, it also means they can be trivially misused
>      before they are meant to. i.e: On the example in (1) assume the
>      conditional in "with warning" is actually a large switch statement.
> 
>   3. It facilitates a disconnect between time-of-declaration and
>      time-of-use that lead very easily to "use-before-init" bugs.
>      While a modern compiler can alleviate the most egregious cases of
>      this, there's cases it simply cannot cover. A conditional
>      initialization on anything with external linkage combined with a
>      conditional use on something else with external linkage will squash
>      the warning of using an uninitialised variable. Things are worse
>      where the variable in question is preinitialised to something
>      credible (e.g: a pointer to NULL), as then that can be misused
>      between its declaration and its original point of intended use.

Right, these are the aspects that would improve. The potential downside is
that you no longer have a fixed place (set of places) where to look for
which variables are actually in scope. For people having worked with C89
(and not e.g. C++) for a very long time, mixing of declarations and
statements may be irritating. In fact, having used C++ quite a lot in the
(meanwhile distant) past, I have developed a mental C mode and a mental
C++ one - when in the former I expect declarations at the start of scopes,
while when in the latter I know to expect them everywhere.

All in all - I'm afraid I'm split on this.

Jan

