Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9540B3DC27
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 10:20:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104140.1455272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uszld-000467-Ot; Mon, 01 Sep 2025 08:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104140.1455272; Mon, 01 Sep 2025 08:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uszld-000436-Lk; Mon, 01 Sep 2025 08:19:57 +0000
Received: by outflank-mailman (input) for mailman id 1104140;
 Mon, 01 Sep 2025 08:19:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uszlc-000430-Q8
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 08:19:56 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70b3e366-870c-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 10:19:55 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61e930b27bcso992368a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 01:19:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc21542asm6521577a12.18.2025.09.01.01.19.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 01:19:53 -0700 (PDT)
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
X-Inumbo-ID: 70b3e366-870c-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756714794; x=1757319594; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ntv9uhtttoRB/Uk0kOrGp5s8MDYYihLI8Ig8hc7xww=;
        b=CnPE+fd6xo08I10k+2CDWol1M9iSYSVrM1srkGEBRE0tTEksETuf++7xFowmSCWcJ7
         fNKjtjMzy6qrij0/FxicjS/B1av/jSqKrT8jQjpWMZELD6ygA1fQ/VgX/FLwEAj3B8Ev
         PCQXVMp+VvWZmEl1eqrYOQXvRfd6WvZ8eIC5hG+JxS0dbTivd0HWvmGsU4+iCaMDGVFP
         PI+ydHtI8I3v8eV6oN4Gzquf70Kw/ldIPgkcHdMi5ScdwQMOzJIevKOcvIqrgdca/IeA
         9U03AYzKchqDtD8x6fpRLUeGp6I2JBsdJRf2d57OlBgAl0m3a0Wnx9JOIe4X+p1ORqd/
         Clog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756714794; x=1757319594;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ntv9uhtttoRB/Uk0kOrGp5s8MDYYihLI8Ig8hc7xww=;
        b=w6cftrebZw7YHdXO/78HFTYlbzmMorbOnx98lVwb0AagLRGkfEdbAQ93Kq9h15kprQ
         jAH74r2tWHuiGqAZTDAqX6QTKbrRLOEsVnRw90iqE5p6Ut1rfHklz/bXXd5pIeV2N77W
         R0a7oaAhVuRSAgRTiCNa1mGXWeyUN+SybVYF/30qoSJzOLbVQ+NbKiTXMfBlh8hwjP7W
         3RaNMUe9pTFG4+aDPuHSmRMzSwB+92c22emTEJEFj/9qq+qD28lHmVeAgY2vCWUvogya
         N0BwCLjfRatkyxjnW3opR0B3UBpmcUNTgNSt6cgY0YrwkuN4zs/v8D4mtDFKcEtef+LM
         j31A==
X-Forwarded-Encrypted: i=1; AJvYcCXunNJewkENAvQgoEHZq8Y0vM73gZV1pslIiiyEOcR5dhuxD0Z3bFjBcsIkmkhCbWx/JVuHBbSpVjg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZcUr8AFbTUi2jWK+YpmEdzeoWNiM5VNXYY4GQOvyEwRC1sUry
	ry5r00rJ9H3p09xWdpPKBYqFn/sZHdxTrQu54Cq2mtsnK91R6LsqkK4PcUOwaIRp+w==
X-Gm-Gg: ASbGncsfXdtDLCxHlvoJGtaAv//mHZaz/6xOEXYNDeOtjgAxt4deIZo+bgHZGQqZvJE
	KtyE11qYHERFPudPEVRwxF/TaXW1JiobqZilo+eeX1Scn4OPRGFCar3zu+LrPtmYHySLRrPJ3cK
	JEAklOO+T5N1JQ7qcuPbehYjCIn8hWk2pZZrW/JWrlpYNpGINI65f6u1fcv0xMBo+csqcppVYsc
	ICz+LH8Lc73oPha1NpA/0FcFE5nk/PcE9YlgD9TAlgZfb2S6sWiM33H4+l90hQloluICuiuPK4Y
	zSw4lPn2R3ltj+8aKEKv9yT3b+tbVP4nofZ98P2qhcROEwiRyT3/3ByyIOV4Cl351aSGbwG1q3h
	sgSW7KD7BTQgQei3nnX55eHMViEQCCmEGnuv4D9cVOAPodaSCB9a9Arx3zS3JlnzeqkKKXqf+mU
	0bgREPZ10=
X-Google-Smtp-Source: AGHT+IGo/hOvPVUkuNCT1cCLjOXwjV+SqRx3dA1ygpYVdQpy6xs9Sf71w5x/yaBvGpvt/sabV3et1A==
X-Received: by 2002:a05:6402:2110:b0:61c:d606:9ce5 with SMTP id 4fb4d7f45d1cf-61d268724d3mr6121205a12.4.1756714794317;
        Mon, 01 Sep 2025 01:19:54 -0700 (PDT)
Message-ID: <9b72e0a6-9c7a-4788-abc7-ea20fc8db0e5@suse.com>
Date: Mon, 1 Sep 2025 10:19:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/gen-cpuid: Fix debugging for cycle detection
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250829192939.1090358-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250829192939.1090358-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2025 21:29, Andrew Cooper wrote:
> Jan reports the following exception when using the cycle debugging:
> 
>   Feature IBRSB, seen [IBRSB, STIBP, INTEL_PSFD, EIBRS, IPRED_CTRL, RRSBA_CTRL, RRSBA, BHI_CTRL], to_process [SSBD]
>   Traceback (most recent call last):
>     File "/local/xen.git/xen/../xen/tools/gen-cpuid.py", line 594, in <module>
>       sys.exit(main())
>                ^^^^^^
>     File "/local/xen.git/xen/../xen/tools/gen-cpuid.py", line 588, in main
>       crunch_numbers(state)
>     File "/local/xen.git/xen/../xen/tools/gen-cpuid.py", line 366, in crunch_numbers
>       (state.names[feat], repl(seen), repl(to_process)))
>                                       ^^^^^^^^^^^^^^^^
>     File "/local/xen.git/xen/../xen/tools/gen-cpuid.py", line 364, in repl
>       return "[" + ", ".join((state.names[x] for x in l)) + "]"
>                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     File "/local/xen.git/xen/../xen/tools/gen-cpuid.py", line 364, in <genexpr>
>       return "[" + ", ".join((state.names[x] for x in l)) + "]"
>                               ~~~~~~~~~~~^^^
>   KeyError: 534
>   make[2]: *** [/local/xen.git/xen/include/xen/lib/x86/Makefile:9: cpuid-autogen.h] Error 1
> 
> This is caused by commit ce8c930851a5 ("x86/cpu-policy: MSR_ARCH_CAPS feature
> names") being rather lazy and marking dependenices on unknown features.
> 
> Introduce a helper to pick the known features in a range, and use it for
> ARCH_CAPS.
> 
> Additionally, remove trailing whitepsace from the debug print.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Fixes: ce8c930851a5 ("x86/cpu-policy: MSR_ARCH_CAPS feature names")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


