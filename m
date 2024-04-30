Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C818B768A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 15:03:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714870.1116227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1n7w-0004dB-Gk; Tue, 30 Apr 2024 13:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714870.1116227; Tue, 30 Apr 2024 13:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1n7w-0004av-Dz; Tue, 30 Apr 2024 13:02:32 +0000
Received: by outflank-mailman (input) for mailman id 714870;
 Tue, 30 Apr 2024 13:02:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q3to=MD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1n7v-0004ap-6a
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 13:02:31 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e65cba28-06f1-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 15:02:30 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-34da84cb755so159810f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 06:02:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s11-20020adf978b000000b0034d0a64ed0bsm5457074wrb.77.2024.04.30.06.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 06:02:28 -0700 (PDT)
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
X-Inumbo-ID: e65cba28-06f1-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714482149; x=1715086949; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=euB9gMjM4feBF+FZkD4tvkli3BxB16g2m+t0o0G2wb4=;
        b=XLoDWqakjOwDJMJ1NlKAYCy97hvi0zHQEkru9l76yHmr0cfGd1ddFAbWZIiH7Lgej7
         lRljCDiz03PGewFxb/hmci/eFFiRjzx6olGxCqu7PQcUOP9Dn6tMYO7v5y8ufwSYXJWx
         BillJrDLGG/QQ0P4J+CzbjU2tFIR1Vsg6cZlXr3JFwr5wmM3SvsHCWX2xBjfM8H95cZc
         PLVIJv/8KS7NjQHbOIdgAim/yXAnLNtIEWqnE7tcwemyu8OY8JXo/HKTayLSfpbA1SPQ
         qrYI6jU7AO46bw8z8WonbzFQL6zJr/ZkAHx9eM8jfAbGYi2pImbzDhhTUk7MKnmNXzlO
         T+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714482149; x=1715086949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=euB9gMjM4feBF+FZkD4tvkli3BxB16g2m+t0o0G2wb4=;
        b=H93MEc49eeCTLYwvQO1TVB/f6KovnKYMvAVf8PcV9ws/w46G2RAJJWUavOqnXIXvUn
         uQKlvIIn7jx+efO1FDGUwKLWOXvRUl2wz2mp/d2+wFwPwlO/pAjtm8Ew0alciaLFZwMr
         nlDWuLFuu4VsIzh/9w26INzVGGomKsAayttruLM+XkSbN6vg/4QUuYlA2B1lbY2P5pIQ
         AArY7eBIayPMnhd9Bm9uYRtAsV/yL0iKNfMRXZZCpbgSZ8g6y75G5Of+fCW5cBb/m3Oy
         IVal3MeVGlwqZzloblhexN32jv6hbyxiubEHMnieyiMP4Xm5vIBJXVHOSfpYUvJNlMni
         d0zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg1ASHq+8WAfHZOcX9IVqc+DHXSSt8+e3qkfy8YXBmfjnkT1sGQpoCwDzUXCyLYKoRntOiO6HkG7ZY2R8HC+bw/TshuOq9IZeP6WSA8cY=
X-Gm-Message-State: AOJu0YwCu44SS6itd1kI0taHwYbBZbuqXIuZpY8Tutyh2tSELn+ojbXQ
	MX990cZQApWqlDk6FYN5bq5ZKmbBFfgSkDtAt5f6psTlq/OVW8L6Oq3R4ngO+A==
X-Google-Smtp-Source: AGHT+IGLaKwLyLivLohjdsDTjTg4FSyj9q6L5HIfHpkQKgAjeGaAcQ0b9n2ZdGSrxggHxDKNJxqcIA==
X-Received: by 2002:adf:ef4b:0:b0:34a:4b8d:be5a with SMTP id c11-20020adfef4b000000b0034a4b8dbe5amr9391672wrp.69.1714482148870;
        Tue, 30 Apr 2024 06:02:28 -0700 (PDT)
Message-ID: <37a32702-1895-4023-a41e-417fae9d63d8@suse.com>
Date: Tue, 30 Apr 2024 15:02:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86/cpu-policy: Add SVM features already used by Xen
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Andrei Semenov <andrei.semenov@vates.fr>,
 Vaishali Thakkar <vaishali.thakkar@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240429151625.977884-1-andrew.cooper3@citrix.com>
 <20240429151625.977884-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240429151625.977884-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.04.2024 17:16, Andrew Cooper wrote:
> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -358,6 +358,20 @@ XEN_CPUFEATURE(RFDS_CLEAR,         16*32+28) /*!A Register File(s) cleared by VE
>  /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.edx, word 17 */
>  
>  /* AMD-defined CPU features, CPUID level 0x8000000a.edx, word 18 */
> +XEN_CPUFEATURE(NPT,                18*32+ 0) /*h  Nested PageTables */
> +XEN_CPUFEATURE(V_LBR,              18*32+ 1) /*h  Virtualised LBR */
> +XEN_CPUFEATURE(SVM_LOCK,           18*32+ 2) /*   SVM locking MSR */
> +XEN_CPUFEATURE(NRIPS,              18*32+ 3) /*h  Next-RIP saved on VMExit */
> +XEN_CPUFEATURE(V_TSC_RATE,         18*32+ 4) /*   Virtualised TSC Ratio */
> +XEN_CPUFEATURE(VMCB_CLEANBITS,     18*32+ 5) /*!  VMCB Clean-bits */

Wouldn't this better be marked !h nevertheless?

As to the name - does it need to be this long? VMCB_CLEAN would be in line
with the PM. But yeah, while CLEANBITS would be clear in the context of this
leaf, there might be whatever other "cleanbits" elsewhere, so some qualifier
is wanted, I guess. As to the V_ prefixes you use for several of the
features: Isn't there a risk of this being ambiguous towards VT-x? Maybe
they should all be SVM_*, even if ...

> +XEN_CPUFEATURE(FLUSH_BY_ASID,      18*32+ 6) /*   TLB Flush by ASID */
> +XEN_CPUFEATURE(DECODE_ASSIST,      18*32+ 7) /*h  Decode assists */
> +XEN_CPUFEATURE(PAUSE_FILTER,       18*32+10) /*h  Pause filter */
> +XEN_CPUFEATURE(PAUSE_THRESH,       18*32+12) /*   Pause filter threshold */
> +XEN_CPUFEATURE(V_LOADSAVE,         18*32+15) /*   Virtualised VMLOAD/SAVE */
> +XEN_CPUFEATURE(V_GIF,              18*32+16) /*   Virtualised GIF */

... these two at least are clearly SVM terminology and hence already
unambiguous.

> +XEN_CPUFEATURE(NPT_SSS,            18*32+19) /*   NPT Supervisor Shadow Stacks */
> +XEN_CPUFEATURE(V_SPEC_CTRL,        18*32+20) /*   Virtualised MSR_SPEC_CTRL */

Whereas this, when used somewhere in isolation, would not make clear
whether AMD's or Intel's is meant.

> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -280,6 +280,9 @@ def crunch_numbers(state):
>          # standard 3DNow in the earlier K6 processors.
>          _3DNOW: [_3DNOWEXT],
>  
> +        # The SVM bit enumerates the whole SVM leave.
> +        SVM: list(range(NPT, NPT + 32)),

Seeing this and taking it together with the somewhat confusing (to me) part
of the description of patch 1: What is it then that you try to avoid there,
when adding the dependencies here is okay, while doing so there would be
entirely impossible (short of there being identifiers)?

Jan

