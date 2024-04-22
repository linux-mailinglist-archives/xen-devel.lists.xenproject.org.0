Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C668E8AD055
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 17:10:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710012.1109075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryvIl-0006z8-64; Mon, 22 Apr 2024 15:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710012.1109075; Mon, 22 Apr 2024 15:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryvIl-0006x5-3O; Mon, 22 Apr 2024 15:09:51 +0000
Received: by outflank-mailman (input) for mailman id 710012;
 Mon, 22 Apr 2024 15:09:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jl0+=L3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ryvIj-0006wz-Kg
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 15:09:49 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c3d6ce0-00ba-11ef-909a-e314d9c70b13;
 Mon, 22 Apr 2024 17:09:48 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-418e4cd2196so33616485e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 08:09:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q2-20020adfab02000000b00349d8717feasm12308801wrc.56.2024.04.22.08.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 08:09:47 -0700 (PDT)
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
X-Inumbo-ID: 5c3d6ce0-00ba-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713798588; x=1714403388; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/JzYtD/WWunljRiZRCZkwTpKN3o+dfu8XahAyYIabw8=;
        b=GpvJlcYUk1bwasSDc/vVcuq4SEVsa7qsN7ITvK3pCk2DVAVAQYr3xReap+ThXmqiOP
         ujGvDlrxLZPwYKQnk9XaEPrTsrb82dEHZlC8N5EQkDdH4+Qh3i/IOAebSk7afo4LoDJi
         fbzNR1AB95dPA7Rek66AzLaPdgCicdrcbIVi0Xy4ujbRS9scmfrWKr22ObGWHKmq4dH5
         JDHUunjHvslVrBjTI7KYSoyQvoFQoZu7sB4EsPGH72Z6JmVW8TG2kIBUiwp1nTbFJJ8b
         RCJabdsq8F/+4e+EgsH41Bug5xFeMnmDfJtocYFkGga5scHGt+guScsNDcpJs+BOrSXn
         hXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713798588; x=1714403388;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/JzYtD/WWunljRiZRCZkwTpKN3o+dfu8XahAyYIabw8=;
        b=PadJXyphjQIac6W3IebtaFUXABBVGLXDobiQreX4QT7aEeVO1TqAFiLNUB1cY8qcVe
         M1MESoYlV+ewvA7RdLAosfgZn4hxvSbCip+wf4UkHFniRg0LJj/VmlAeM7N65I6lJer2
         SsXjkFDovtTscVqpNFkOzQtWDPag8iHJBajAxyPflNL8f1HXi4cyhBMrtppW/l3GdCmY
         p0qZYupntMWDln0n0ZayGKAfH4ByV53T5voiJN6wKDvPp2EbG5s0RjkYSdqdkRTTXkBj
         4YFK1qwxi0JHvLa5qGRRUdk7gs3QFXiKf4l9RiRkGOqynugUsOq0/1TEdY4kJdaHNivr
         dgGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkFklJTHIgaLZxIwGrklGvjNf2NLu6lk34OINe7624iBRioCf8fMwjkEovk22/+AXpH4Xu9FI6uV3m8zdB6151h6gcZJDeJK7Wt6YxLZs=
X-Gm-Message-State: AOJu0YywJ+7TS2u1BEGmwEDqekyfOBNilA9E5gyikqDSZ/ihAX3X6Uht
	Dzuo7F116syHQiD+aJ4A1J5HUfKkn2bjkt+ulr6L9QJcCXcRiLZMU7onPUyokQ==
X-Google-Smtp-Source: AGHT+IGx8v1Qlq/4Zn4LvSMcPOZV4flxTnJx1pT3lPZUMFP+Cgx4EPWxnRv3OgkILBv60F3Q0Z5hmg==
X-Received: by 2002:a05:600c:358a:b0:414:8abb:a96b with SMTP id p10-20020a05600c358a00b004148abba96bmr6872747wmq.34.1713798587832;
        Mon, 22 Apr 2024 08:09:47 -0700 (PDT)
Message-ID: <f5518331-3e4b-4f82-b91c-330ed397ae16@suse.com>
Date: Mon, 22 Apr 2024 17:09:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpuid-policy: Add AMD SVM CPUID leaf to featureset
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@cloud.com>, xen-devel@lists.xenproject.org
References: <20240417132237.2946862-1-george.dunlap@cloud.com>
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
In-Reply-To: <20240417132237.2946862-1-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2024 15:22, George Dunlap wrote:
> Currently, the CPUID leaf for SVM features (extd 0xa.edx) is manually
> twiddled:
> 
>  - hvm_max_policy takes host_policy and clamps it to supported
>    features (with some features unilaterally enabled because they're
>    always emulated
> 
>  - hvm_default_policy is copied from there
> 
>  - When recalculate_policy() is called for a guest, if SVM is clear,
>    then the entire leaf is zeroed out.
> 
> Move to a mode where the extended features are off by default, and
> enabled when nested_virt is enabled.
> 
> In cpufeatureset.h, define a new featureset word for the AMD SVM
> features, and declare all of the bits defined in
> x86/include/asm/hvm/svm/svm.h.  Mark the ones we currently pass
> through to the "max policy" as HAP-only and optional.
> 
> In cpu-policy.h, define FEATURESET_ead, and convert the un-named space
> in struct_cpu_policy into the appropriate union.  FIXME: Do this in a
> prerequisite patch, and change all references to p->extd.raw[0xa].

Just wondering: Did you mean to submit with this FIXME?

> Update x86_cpu_X_to_Y and Y_to_X to copy this into and out of the
> appropriate leaf.
> 
> Populate this during boot in generic_identify().
> 
> Add the new featureset definition into libxl_cpuid.c.
> 
> Update the code in calculate_hvm_max_policy() to do nothing with the
> "normal" CPUID bits, and use the feature bit to unconditionally enable
> VMCBCLEAN. FIXME Move this to a follow-up patch.
> 
> In recalculate_cpuid_policy(), enable max_fs when nested_hvm() is
> true.
> 
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
> ---
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monne <roger.pau@cloud.com>
> ---
>  tools/libs/light/libxl_cpuid.c              |  1 +
>  xen/arch/x86/cpu-policy.c                   | 19 +++++++++----------
>  xen/arch/x86/cpu/common.c                   |  2 ++
>  xen/include/public/arch-x86/cpufeatureset.h | 16 ++++++++++++++++
>  xen/include/xen/lib/x86/cpu-policy.h        | 10 +++++++++-
>  xen/lib/x86/cpuid.c                         |  4 +++-
>  6 files changed, 40 insertions(+), 12 deletions(-)

tools/misc/xen-cpuid.c also wants adjusting, I think.

I further think the dependencies (on the SVM feature at the very least)
also want recording in xen/tools/gen-cpuid.py.

> @@ -909,6 +903,14 @@ void recalculate_cpuid_policy(struct domain *d)
>              __clear_bit(X86_FEATURE_VMX, max_fs);
>              __clear_bit(X86_FEATURE_SVM, max_fs);
>          }
> +        else
> +        {
> +            /* 
> +             * Enable SVM features.  This will be empty on VMX
> +             * hosts. 
> +             */
> +            fs[FEATURESET_ead] = max_fs[FEATURESET_ead];
> +        }
>      }

I'm afraid I don't understand this part: Why would you forcefully enable
everything, no matter what the tool stack set? Considering the if() part
above, wouldn't you want to mark the features non-optional, relying on
them being cleared (via dependencies) when SVM is clear?

> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -477,6 +477,8 @@ static void generic_identify(struct cpuinfo_x86 *c)
>  		c->x86_capability[FEATURESET_e7d] = cpuid_edx(0x80000007);
>  	if (c->extended_cpuid_level >= 0x80000008)
>  		c->x86_capability[FEATURESET_e8b] = cpuid_ebx(0x80000008);
> +	if (c->extended_cpuid_level >= 0x8000000a)
> +		c->x86_capability[FEATURESET_ead] = cpuid_edx(0x8000000a);
>  	if (c->extended_cpuid_level >= 0x80000021)
>  		c->x86_capability[FEATURESET_e21a] = cpuid_eax(0x80000021);

Aiui this is needed right in this change because of calculate_host_policy()
deriving from boot_cpu_data.x86_capability. What I'd have expected in
addition (going forward: instead) is an adjustment to
x86_cpu_policy_fill_native().

> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -357,6 +357,22 @@ XEN_CPUFEATURE(RFDS_CLEAR,         16*32+28) /*!A Register File(s) cleared by VE
>  
>  /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.edx, word 17 */
>  
> +/* AMD-defined CPU features, CPUID level 0x8000000a.edx, word 18 */
> +XEN_CPUFEATURE(NPT,                 18*32+ 0) /*h  Nested page table support */
> +XEN_CPUFEATURE(LBRV,                18*32+ 1) /*h  LBR virtualization support */
> +XEN_CPUFEATURE(SVML,                18*32+ 2) /*   SVM locking MSR support */
> +XEN_CPUFEATURE(NRIPS,               18*32+ 3) /*h  Next RIP save on VMEXIT support */
> +XEN_CPUFEATURE(TSCRATEMSR,          18*32+ 4) /*   TSC ratio MSR support */
> +XEN_CPUFEATURE(VMCBCLEAN,           18*32+ 5) /*h  VMCB clean bits support */
> +XEN_CPUFEATURE(FLUSHBYASID,         18*32+ 6) /*   TLB flush by ASID support */
> +XEN_CPUFEATURE(DECODEASSISTS,       18*32+ 7) /*h  Decode assists support */
> +XEN_CPUFEATURE(PAUSEFILTER,         18*32+10) /*h  Pause intercept filter support */
> +XEN_CPUFEATURE(PAUSETHRESH,         18*32+12) /*   Pause intercept filter threshold */
> +XEN_CPUFEATURE(VLOADSAVE,           18*32+15) /*   virtual vmload/vmsave */
> +XEN_CPUFEATURE(VGIF,                18*32+16) /*   Virtual GIF */
> +XEN_CPUFEATURE(SSS,                 18*32+19) /*   NPT Supervisor Shadow Stacks */
> +XEN_CPUFEATURE(SPEC_CTRL,           18*32+20) /*   MSR_SPEC_CTRL virtualisation */

This can't be just SPEC_CTRL without causing confusion. I guess it wants to
be VIRT_SPEC_CTRL (probably confusing, too), AMD_VIRT_SPEC_CTRL,
AMD_SPEC_CTRL_VIRT, or some such.

> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -22,6 +22,7 @@
>  #define FEATURESET_7d1       15 /* 0x00000007:1.edx    */
>  #define FEATURESET_m10Al     16 /* 0x0000010a.eax      */
>  #define FEATURESET_m10Ah     17 /* 0x0000010a.edx      */
> +#define FEATURESET_ead       18 /* 0x8000000a.edx      */

Maybe better eAd here and elsewhere, to visually separate the constituent
pieces of the name? I wonder whether Andrew had any plans naming-wise here.

Jan

