Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A1BB0873C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 09:44:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046324.1416649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucJIF-0000xn-Ip; Thu, 17 Jul 2025 07:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046324.1416649; Thu, 17 Jul 2025 07:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucJIF-0000vc-G2; Thu, 17 Jul 2025 07:44:39 +0000
Received: by outflank-mailman (input) for mailman id 1046324;
 Thu, 17 Jul 2025 07:44:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucJIE-0000vU-BJ
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 07:44:38 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2b8f16b-62e1-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 09:44:36 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so487296f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 00:44:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f1b360sm15425779b3a.78.2025.07.17.00.44.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 00:44:34 -0700 (PDT)
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
X-Inumbo-ID: e2b8f16b-62e1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752738275; x=1753343075; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bsUO2g2XFJnGiCCuGrBy37R2kcehKGK9YjIiUSnmVsQ=;
        b=XlcKxyx0M6V1fdQXpQ1wxae2pLrD+nryCYNTqGgthId+vUG01clO4wB26FCWrOTOTo
         LJSL0GCkHE6aLgNR2LrRL8jkGfM7/Ler+JZYeyHsTp8hhb8SSDxwpSHsekGz3L0ZQ7wZ
         aRztTqpvxoB38mrHHwwMXrZY1dKKeA7O0beBd+70h0JsqCJA/tFfaX0WZKWAIPyw3OFa
         45qq8nYeX2ldWtRmF/XwoktqO3vX5Q9TmnZF/ifOtvtFXwKsVlPJr6JjZfV29RwEGwOB
         TFvNxjv0c8dUEyMlWAiOAizcAuOP8ygQ98rkeR24B3yyUluUnGaq3ekspmZssEYAwIq8
         f0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752738275; x=1753343075;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsUO2g2XFJnGiCCuGrBy37R2kcehKGK9YjIiUSnmVsQ=;
        b=QHN8LvNocamtS1sUDiAxXj17ojHe2qG97asYPErt1jzK1KbxficIq6XLr0zNAJlibG
         kqPjduxEeYGUKgxDOTJaK759t/V2TFZijVFHnjyPeiTWS+y+hR1jhzBN5t2OSDdmOKtK
         hdBaoMR7WiwT5K+ANUQEy1xqfoOcm3RT2ZsR6I8ZechkG6+vaJKRNilG+st4ZZsFG93L
         LBlnVKD5iZ2GxnolrjO5QnEzEsqgU40SgZx8xZCCOqoXEnOcG82nLzJ1K00Os+reNyHo
         j+nio31+S6FSOfruDtaG82Q53f7DJp/kgJU8jDhupU59YJDrV5xfYYiw1yl8SPCLFMPZ
         ZW8A==
X-Forwarded-Encrypted: i=1; AJvYcCVLYD1KgamcS/krqw/vvn4HLZNeJWFTfO7txnr0sMWECOi/vIoO6d+C/LLKCcXZ0/KXAyLXBTl8sOo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTwERL+qQ/+iOAk6wmt0kbppui84XqF6Hq1Bqfs8MmCg8cBVob
	wRqtG+4A9wKhfMC+7X792vp+TkLwE74Sj237S6PZFC3rMAI+YQpPQ9vyHo2+N6HFpg==
X-Gm-Gg: ASbGnctRfxC9SMyuTCgI9AwqYIF/ZSFNUp2w/nlqqIFlaBAA2ey33e8Rkil+NwlYgHb
	FOuPEjuC4xulb3y6jvrYN2FKtYw01gQxJ8gtZnhJctg85w5ViYknLLE5pM+fHI5YCjUGr2dIe1j
	+Rj3xfoPuCWH8ChkKvl7G4OyEcVyHO1PDttxD3NQjMuyqOXKPVtqE4tjcI8wCFoRjfLNIsIccuW
	+U5IHDD9EsGnqFdu43ZYbZJdB+Q5BPu5V2+uH87ijOdRCrkiqeTjsP2qHjMmQYjCCCvky6Vs7Ah
	3Nxu/4RXIyrD85xPAYNZKj79/UQoT+MGluYC9sB4uVFLBlas9SBYgZBLfyopBaw2+SIxyLkOSd0
	MOFT8+JIbNKbkJTVTTcy1gLWfNLWRI9WejXBBxliE9C1hDroCpnutB5FgOppl8nYTVBhmEagWpA
	e/1EMaLbw=
X-Google-Smtp-Source: AGHT+IHyuiHPFcxSPREPYfRUVlwy8kW+FTtaJH/RQhnF7ZCDEw78zs49m6ZJ3snLs0/hpD+q9S4g0g==
X-Received: by 2002:adf:e186:0:b0:3a4:e4ee:4c7b with SMTP id ffacd0b85a97d-3b60dd4f53emr5294266f8f.15.1752738275404;
        Thu, 17 Jul 2025 00:44:35 -0700 (PDT)
Message-ID: <28c6ab0f-3699-4fbf-9a2e-205c6452ddb2@suse.com>
Date: Thu, 17 Jul 2025 09:44:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] x86: Convert users of INTEL_FAM6_MODEL() to
 X86_MATCH_VFM()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
 <20250716173132.2213891-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250716173132.2213891-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.07.2025 19:31, Andrew Cooper wrote:
> This replaces raw model numbers (and comments in some cases) with names.  For
> probe_mwait_errata(), merge the comments with the table to make it easier to
> see which erratum is which, and drop a stray "Problem" in LNL030.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> There isn't an obvious helper in Linux to use which can avoid the data
> parameter; Linux doesn't really do lists like this which are *just* a VFM
> match with nothing else.
> 
> Either way, I've opted for a few extra NULLs than a proliferation of
> X86_MATCH_*() helpers.

+1

> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -583,7 +583,6 @@ bool errata_c6_workaround(void)
>  
>      if ( unlikely(fix_needed == -1) )
>      {
> -#define INTEL_FAM6_MODEL(m) { X86_VENDOR_INTEL, 6, m, X86_FEATURE_ALWAYS }
>          /*
>           * Errata AAJ72: EOI Transaction May Not be Sent if Software Enters
>           * Core C6 During an Interrupt Service Routine"
> @@ -594,12 +593,12 @@ bool errata_c6_workaround(void)
>           * there is an EOI pending.
>           */
>          static const struct x86_cpu_id eoi_errata[] = {
> -            INTEL_FAM6_MODEL(0x1a),
> -            INTEL_FAM6_MODEL(0x1e),
> -            INTEL_FAM6_MODEL(0x1f),
> -            INTEL_FAM6_MODEL(0x25),
> -            INTEL_FAM6_MODEL(0x2c),
> -            INTEL_FAM6_MODEL(0x2f),
> +            X86_MATCH_VFM(INTEL_NEHALEM_EP,   NULL),
> +            X86_MATCH_VFM(INTEL_NEHALEM,      NULL),
> +            X86_MATCH_VFM(INTEL_NEHALEM_G,    NULL),
> +            X86_MATCH_VFM(INTEL_WESTMERE,     NULL),
> +            X86_MATCH_VFM(INTEL_WESTMERE_EP,  NULL),
> +            X86_MATCH_VFM(INTEL_WESTMERE_EX,  NULL),
>              { }
>          };

Along the lines of a comment further down, maybe make explicit that Nehalem-EX
is intentionally omitted here (assuming that's not in fact an oversight)?

> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -382,16 +382,12 @@ static void cf_check early_init_intel(struct cpuinfo_x86 *c)
>   */
>  static void probe_c3_errata(const struct cpuinfo_x86 *c)
>  {
> -#define INTEL_FAM6_MODEL(m) { X86_VENDOR_INTEL, 6, m, X86_FEATURE_ALWAYS }
>      static const struct x86_cpu_id models[] = {
> -        /* Nehalem */
> -        INTEL_FAM6_MODEL(0x1a),
> -        INTEL_FAM6_MODEL(0x1e),
> -        INTEL_FAM6_MODEL(0x1f),
> -        INTEL_FAM6_MODEL(0x2e),
> -        /* Westmere (note Westmere-EX is not affected) */
> -        INTEL_FAM6_MODEL(0x2c),
> -        INTEL_FAM6_MODEL(0x25),
> +        X86_MATCH_VFM(INTEL_NEHALEM_EP,   NULL),
> +        X86_MATCH_VFM(INTEL_NEHALEM,      NULL),
> +        X86_MATCH_VFM(INTEL_NEHALEM_G,    NULL),
> +        X86_MATCH_VFM(INTEL_WESTMERE,     NULL),
> +        X86_MATCH_VFM(INTEL_WESTMERE_EP,  NULL),
>          { }
>      };

You lost NEHALEM_EX here. For Westmere-EX I think the comment (part) would
better be retained, to clarify that this isn't an oversight.

Jan

