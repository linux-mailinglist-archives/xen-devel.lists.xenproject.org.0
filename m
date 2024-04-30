Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4FC8B6FC1
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 12:38:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714719.1116020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1krv-00077m-CS; Tue, 30 Apr 2024 10:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714719.1116020; Tue, 30 Apr 2024 10:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1krv-000764-7p; Tue, 30 Apr 2024 10:37:51 +0000
Received: by outflank-mailman (input) for mailman id 714719;
 Tue, 30 Apr 2024 10:37:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q3to=MD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1krt-00075y-H4
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 10:37:49 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af3bbfc8-06dd-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 12:37:47 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-34c8f392172so2345034f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 03:37:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t15-20020adfa2cf000000b0034c5be9fb6dsm10904412wra.65.2024.04.30.03.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 03:37:45 -0700 (PDT)
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
X-Inumbo-ID: af3bbfc8-06dd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714473466; x=1715078266; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OuDb5OHlmllN1lOFnFs2LhxGP2PYjqgn8WRg8ZxOhUo=;
        b=T7nHnz8rz+NPbJSRHZ8tLHUyqSpfDGnLtvpzx8tfq+YzZmm0Sv+G0HE/lNbUIjUEWX
         Na+ygTgwAeJkliAgAMBfb6hhlfuuMDaiNjcH9ZmNCEAeefVBqbOj51wuuvrchsH6osST
         A9hhC5VMOUc0lBYxpHvQoMlHavh8KsxFg8CLZ3Mhs0qvqp7kv5LTA4r7K9WKnWp3gvxc
         v+njoSbN3BJJRinVv8awEsAaYHbMxDqo74dF6hs7qRmoDoJ8K5e/46ZVAuVCFGYmG2EN
         cAx395Bujpwc8sYDPOM3LzbiQOd7c+fGn14iQf6BKL9a+Ry5b6yThl5RsJajz3NxOWBN
         PA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714473466; x=1715078266;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OuDb5OHlmllN1lOFnFs2LhxGP2PYjqgn8WRg8ZxOhUo=;
        b=KnsxhXfZ5lP6mNXgzFGdWk6J7c/f53xpepl3dydF8rmpegPP8Rbk0Dk7FrvMiIaYT1
         l9kgGi8c95jzWfPmYnvDvtup1HBS+gPfIbbzZXgZokQgR2SC8pIxA8pQzRY2VMkdDgGX
         UIltFIwYTkiv3yxZ02tw4mvNh4hEIz66cUixvOIiWiKCrba48PzqpvoFA3tKWSFeB3yh
         ANkLCAWqiRG/Azo9CplJlLxMxEIxVFzEwanUbSfPtUrNkcQDAv767F93/mTUGJxzgLCm
         xs0cpShNBa5hE/hssaFrmXFesduqrPkArxffbHfqAJeZ4fn3pEE2KeWuustUzAQfpwB1
         FWPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3muLUTVBVMtq8kfBRWNdjs78wp19NEOxvyX40ZHM3NC4apEMvL3PssSobh4UFk2ZwhdMDy48Rvw6vGe1ujywWr9EZhrzaB/GiEahLJps=
X-Gm-Message-State: AOJu0YxelqkbrA7MWKF7r5A2Efwi1v8oKogFZt5yz1bwGqSYYzyvrZF1
	l8hefZinJO1KAT0d/QbqCmR3PQgAQHQOuuUkMq63Rh9u4duRsV9SKc6Sa5+vZg==
X-Google-Smtp-Source: AGHT+IHUcGx6ymAhYgSISnJ1QV9rwaqLQjx0FUQud0vjA2jqU01rvUaVco+WxtItQaph6D2mkC4l8A==
X-Received: by 2002:a5d:6c6e:0:b0:34d:414:5528 with SMTP id r14-20020a5d6c6e000000b0034d04145528mr6248215wrz.44.1714473466228;
        Tue, 30 Apr 2024 03:37:46 -0700 (PDT)
Message-ID: <78d009f4-6610-4fcf-9cdc-ee1081e6c763@suse.com>
Date: Tue, 30 Apr 2024 12:37:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] tools/xen-cpuid: switch to use cpu-policy
 defined names
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240430082901.77662-1-roger.pau@citrix.com>
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
In-Reply-To: <20240430082901.77662-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.04.2024 10:29, Roger Pau Monne wrote:
> Like it was done recently for libxl, switch to using the auto-generated feature
> names by the processing of cpufeatureset.h, this allows removing the open-coded
> feature names, and unifies the feature naming with libxl and the hypervisor.
> 
> Note that leaf names need to be kept, as the current auto-generated data
> doesn't contain the leaf names.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Late for 4.19, but I would still like it to be considered for inclusion since
> it's IMO a nice cleanup and reduces the burden of adding new feature bits into
> the policy.

I agree, but it's Oleksii's call (now Cc-ed).

> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -12,282 +12,33 @@
>  
>  #include <xen-tools/common-macros.h>
>  
> -static uint32_t nr_features;
> -
> -static const char *const str_1d[32] =
> -{
> -    [ 0] = "fpu",  [ 1] = "vme",
> -    [ 2] = "de",   [ 3] = "pse",
> -    [ 4] = "tsc",  [ 5] = "msr",
> -    [ 6] = "pae",  [ 7] = "mce",
> -    [ 8] = "cx8",  [ 9] = "apic",
> -    /* [10] */     [11] = "sysenter",
> -    [12] = "mtrr", [13] = "pge",
> -    [14] = "mca",  [15] = "cmov",
> -    [16] = "pat",  [17] = "pse36",
> -    [18] = "psn",  [19] = "clflush",
> -    /* [20] */     [21] = "ds",
> -    [22] = "acpi", [23] = "mmx",
> -    [24] = "fxsr", [25] = "sse",
> -    [26] = "sse2", [27] = "ss",
> -    [28] = "htt",  [29] = "tm",
> -    [30] = "ia64", [31] = "pbe",
> -};
> -
> -static const char *const str_1c[32] =
> -{
> -    [ 0] = "sse3",    [ 1] = "pclmulqdq",
> -    [ 2] = "dtes64",  [ 3] = "monitor",
> -    [ 4] = "ds-cpl",  [ 5] = "vmx",
> -    [ 6] = "smx",     [ 7] = "est",
> -    [ 8] = "tm2",     [ 9] = "ssse3",
> -    [10] = "cntx-id", [11] = "sdgb",
> -    [12] = "fma",     [13] = "cx16",
> -    [14] = "xtpr",    [15] = "pdcm",
> -    /* [16] */        [17] = "pcid",
> -    [18] = "dca",     [19] = "sse41",
> -    [20] = "sse42",   [21] = "x2apic",
> -    [22] = "movebe",  [23] = "popcnt",
> -    [24] = "tsc-dl",  [25] = "aesni",
> -    [26] = "xsave",   [27] = "osxsave",
> -    [28] = "avx",     [29] = "f16c",
> -    [30] = "rdrnd",   [31] = "hyper",
> -};
> -
> -static const char *const str_e1d[32] =
> -{
> -    [ 0] = "fpu",    [ 1] = "vme",
> -    [ 2] = "de",     [ 3] = "pse",
> -    [ 4] = "tsc",    [ 5] = "msr",
> -    [ 6] = "pae",    [ 7] = "mce",
> -    [ 8] = "cx8",    [ 9] = "apic",
> -    /* [10] */       [11] = "syscall",
> -    [12] = "mtrr",   [13] = "pge",
> -    [14] = "mca",    [15] = "cmov",
> -    [16] = "fcmov",  [17] = "pse36",
> -    /* [18] */       [19] = "mp",
> -    [20] = "nx",     /* [21] */
> -    [22] = "mmx+",   [23] = "mmx",
> -    [24] = "fxsr",   [25] = "fxsr+",
> -    [26] = "pg1g",   [27] = "rdtscp",
> -    /* [28] */       [29] = "lm",
> -    [30] = "3dnow+", [31] = "3dnow",
> -};
> -
> -static const char *const str_e1c[32] =
> -{
> -    [ 0] = "lahf-lm",    [ 1] = "cmp",
> -    [ 2] = "svm",        [ 3] = "extapic",
> -    [ 4] = "cr8d",       [ 5] = "lzcnt",
> -    [ 6] = "sse4a",      [ 7] = "msse",
> -    [ 8] = "3dnowpf",    [ 9] = "osvw",
> -    [10] = "ibs",        [11] = "xop",
> -    [12] = "skinit",     [13] = "wdt",
> -    /* [14] */           [15] = "lwp",
> -    [16] = "fma4",       [17] = "tce",
> -    /* [18] */           [19] = "nodeid",
> -    /* [20] */           [21] = "tbm",
> -    [22] = "topoext",    [23] = "perfctr-core",
> -    [24] = "perfctr-nb", /* [25] */
> -    [26] = "dbx",        [27] = "perftsc",
> -    [28] = "pcx-l2i",    [29] = "monitorx",
> -    [30] = "addr-msk-ext",
> -};
> -
> -static const char *const str_7b0[32] =
> -{
> -    [ 0] = "fsgsbase", [ 1] = "tsc-adj",
> -    [ 2] = "sgx",      [ 3] = "bmi1",
> -    [ 4] = "hle",      [ 5] = "avx2",
> -    [ 6] = "fdp-exn",  [ 7] = "smep",
> -    [ 8] = "bmi2",     [ 9] = "erms",
> -    [10] = "invpcid",  [11] = "rtm",
> -    [12] = "pqm",      [13] = "depfpp",
> -    [14] = "mpx",      [15] = "pqe",
> -    [16] = "avx512f",  [17] = "avx512dq",
> -    [18] = "rdseed",   [19] = "adx",
> -    [20] = "smap",     [21] = "avx512-ifma",
> -    [22] = "pcommit",  [23] = "clflushopt",
> -    [24] = "clwb",     [25] = "proc-trace",
> -    [26] = "avx512pf", [27] = "avx512er",
> -    [28] = "avx512cd", [29] = "sha",
> -    [30] = "avx512bw", [31] = "avx512vl",
> -};
> -
> -static const char *const str_Da1[32] =
> -{
> -    [ 0] = "xsaveopt", [ 1] = "xsavec",
> -    [ 2] = "xgetbv1",  [ 3] = "xsaves",
> -};
> -
> -static const char *const str_7c0[32] =
> -{
> -    [ 0] = "prefetchwt1",      [ 1] = "avx512-vbmi",
> -    [ 2] = "umip",             [ 3] = "pku",
> -    [ 4] = "ospke",            [ 5] = "waitpkg",
> -    [ 6] = "avx512-vbmi2",     [ 7] = "cet-ss",
> -    [ 8] = "gfni",             [ 9] = "vaes",
> -    [10] = "vpclmulqdq",       [11] = "avx512-vnni",
> -    [12] = "avx512-bitalg",
> -    [14] = "avx512-vpopcntdq",
> -
> -    [22] = "rdpid",
> -    /* 24 */                   [25] = "cldemote",
> -    /* 26 */                   [27] = "movdiri",
> -    [28] = "movdir64b",        [29] = "enqcmd",
> -    [30] = "sgx-lc",           [31] = "pks",
> -};
> -
> -static const char *const str_e7d[32] =
> -{
> -    /* 6 */                    [ 7] = "hw-pstate",
> -    [ 8] = "itsc",             [ 9] = "cpb",
> -    [10] = "efro",
> -};
> -
> -static const char *const str_e8b[32] =
> -{
> -    [ 0] = "clzero",
> -    [ 2] = "rstr-fp-err-ptrs",
> -
> -    /* [ 8] */                 [ 9] = "wbnoinvd",
> -
> -    [12] = "ibpb",
> -    [14] = "ibrs",             [15] = "amd-stibp",
> -    [16] = "ibrs-always",      [17] = "stibp-always",
> -    [18] = "ibrs-fast",        [19] = "ibrs-same-mode",
> -
> -    [20] = "no-lmsl",
> -    /* [22] */                 [23] = "ppin",
> -    [24] = "amd-ssbd",         [25] = "virt-ssbd",
> -    [26] = "ssb-no",
> -    [28] = "psfd",             [29] = "btc-no",
> -    [30] = "ibpb-ret",
> -};
> -
> -static const char *const str_7d0[32] =
> -{
> -    [ 2] = "avx512-4vnniw", [ 3] = "avx512-4fmaps",
> -    [ 4] = "fsrm",
> -
> -    [ 8] = "avx512-vp2intersect", [ 9] = "srbds-ctrl",
> -    [10] = "md-clear",            [11] = "rtm-always-abort",
> -    /* 12 */                [13] = "tsx-force-abort",
> -    [14] = "serialize",     [15] = "hybrid",
> -    [16] = "tsxldtrk",
> -    [18] = "pconfig",
> -    [20] = "cet-ibt",
> -    /* 22 */                [23] = "avx512-fp16",
> -
> -    [26] = "ibrsb",         [27] = "stibp",
> -    [28] = "l1d-flush",     [29] = "arch-caps",
> -    [30] = "core-caps",     [31] = "ssbd",
> -};
> -
> -static const char *const str_7a1[32] =
> -{
> -    [ 0] = "sha512",        [ 1] = "sm3",
> -    [ 2] = "sm4",
> -    [ 4] = "avx-vnni",      [ 5] = "avx512-bf16",
> -
> -    [10] = "fzrm",          [11] = "fsrs",
> -    [12] = "fsrcs",
> -
> -    /* 18 */                [19] = "wrmsrns",
> -
> -    /* 22 */                [23] = "avx-ifma",
> -};
> +#include <xen/lib/x86/cpu-policy.h>
>  
> -static const char *const str_e21a[32] =
> -{
> -    [ 0] = "no-nest-bp",    [ 1] = "fs-gs-ns",
> -    [ 2] = "lfence+",
> -    [ 6] = "nscb",
> -    [ 8] = "auto-ibrs",
> -    [10] = "amd-fsrs",      [11] = "amd-fsrc",
> -
> -    /* 16 */                [17] = "cpuid-user-dis",
> -    [18] = "epsf",          [19] = "fsrsc",
> -    [20] = "amd-prefetchi",
> -
> -    /* 26 */                [27] = "sbpb",
> -    [28] = "ibpb-brtype",   [29] = "srso-no",
> -};
> -
> -static const char *const str_7b1[32] =
> -{
> -    [ 0] = "ppin",
> -};
> -
> -static const char *const str_7c1[32] =
> -{
> -};
> -
> -static const char *const str_7d1[32] =
> -{
> -    [ 4] = "avx-vnni-int8",       [ 5] = "avx-ne-convert",
> -
> -    [10] = "avx-vnni-int16",
> -
> -    [14] = "prefetchi",
> -
> -    [18] = "cet-sss",
> -};
> -
> -static const char *const str_7d2[32] =
> -{
> -    [ 0] = "intel-psfd",    [ 1] = "ipred-ctrl",
> -    [ 2] = "rrsba-ctrl",    [ 3] = "ddp-ctrl",
> -    [ 4] = "bhi-ctrl",      [ 5] = "mcdt-no",
> -};
> -
> -static const char *const str_m10Al[32] =
> -{
> -    [ 0] = "rdcl-no",             [ 1] = "eibrs",
> -    [ 2] = "rsba",                [ 3] = "skip-l1dfl",
> -    [ 4] = "intel-ssb-no",        [ 5] = "mds-no",
> -    [ 6] = "if-pschange-mc-no",   [ 7] = "tsx-ctrl",
> -    [ 8] = "taa-no",              [ 9] = "mcu-ctrl",
> -    [10] = "misc-pkg-ctrl",       [11] = "energy-ctrl",
> -    [12] = "doitm",               [13] = "sbdr-ssdp-no",
> -    [14] = "fbsdp-no",            [15] = "psdp-no",
> -    /* 16 */                      [17] = "fb-clear",
> -    [18] = "fb-clear-ctrl",       [19] = "rrsba",
> -    [20] = "bhi-no",              [21] = "xapic-status",
> -    /* 22 */                      [23] = "ovrclk-status",
> -    [24] = "pbrsb-no",            [25] = "gds-ctrl",
> -    [26] = "gds-no",              [27] = "rfds-no",
> -    [28] = "rfds-clear",
> -};
> -
> -static const char *const str_m10Ah[32] =
> -{
> -};
> +static uint32_t nr_features;
>  
>  static const struct {
>      const char *name;
>      const char *abbr;
> -    const char *const *strs;

While how you're doing it looks all technically correct (so even without
changes I may later ack this as is), I'm still a little puzzled. I was
kind of expecting xen-cpuid.py to be extended to supply more another (set
of) #define(s) more suitable for use here. In particular, while
performance surely isn't of much concern in this tool, ...

> @@ -301,21 +52,32 @@ static const char *const fs_names[] = {
>      [XEN_SYSCTL_cpu_featureset_hvm_max] = "HVM Max",
>  };
>  
> -static void dump_leaf(uint32_t leaf, const char *const *strs)
> +static const char *find_name(unsigned int index)
>  {
> -    unsigned i;
> +    static const struct feature_name {
> +        const char *name;
> +        unsigned int bit;
> +    } feature_names[] = INIT_FEATURE_NAMES;
> +    unsigned int i;
>  
> -    if ( !strs )
> -    {
> -        printf(" ???");
> -        return;
> -    }
> +    for ( i = 0; i < ARRAY_SIZE(feature_names); i++ )
> +        if ( feature_names[i].bit == index )
> +            return feature_names[i].name;

... a linear search, repeated perhaps hundreds of times, looks still a
little odd to me.

> +static void dump_leaf(uint32_t leaf, unsigned int index)
> +{
> +    unsigned i;
>  
>      for ( i = 0; i < 32; ++i )
>          if ( leaf & (1u << i) )
>          {
> -            if ( strs[i] )
> -                printf(" %s", strs[i]);
> +            const char *name = find_name(index * 32 + i);
> +
> +            if ( name )
> +                printf(" %s", name);
>              else
>                  printf(" <%u>", i);
>          }
> @@ -326,6 +88,7 @@ static void decode_featureset(const uint32_t *features,
>                                const char *name,
>                                bool detail)
>  {
> +    static const uint32_t known_features[] = INIT_KNOWN_FEATURES;
>      unsigned int i;

So this variable exists solely to ...

> @@ -336,11 +99,14 @@ static void decode_featureset(const uint32_t *features,
>      if ( !detail )
>          return;
>  
> -    for ( i = 0; i < length && i < ARRAY_SIZE(decodes); ++i )
> +    /* Ensure leaf names stay in sync with the policy leaf count. */
> +    BUILD_BUG_ON(ARRAY_SIZE(known_features) != ARRAY_SIZE(leaf_names));

... calculate its size here. Thus relying on the compiler to not flag
such effectively unused static const variables.

> +    for ( i = 0; i < length && i < ARRAY_SIZE(leaf_names); ++i )
>      {
> -        printf("  [%02u] %-"COL_ALIGN"s", i, decodes[i].name ?: "<UNKNOWN>");
> -        if ( decodes[i].name )
> -            dump_leaf(features[i], decodes[i].strs);
> +        printf("  [%02u] %-"COL_ALIGN"s", i, leaf_names[i].name ?: "<UNKNOWN>");

I realize you merely transform what has been there, but do we really
need this fallback to "<UNKNOWN>" here and ...

> @@ -355,8 +121,8 @@ static void dump_info(xc_interface *xch, bool detail)
>      if ( !detail )
>      {
>          printf("       %"COL_ALIGN"s ", "KEY");
> -        for ( i = 0; i < ARRAY_SIZE(decodes); ++i )
> -            printf("%-8s ", decodes[i].abbr ?: "???");
> +        for ( i = 0; i < ARRAY_SIZE(leaf_names); ++i )
> +            printf("%-8s ", leaf_names[i].abbr ?: "???");

to "???" here? The table entries are all fully populated, and I don't
see why future ones wouldn't be. IOW I don't think I see what good this
is doing us, when at the same time it doesn't help readability.

Jan

