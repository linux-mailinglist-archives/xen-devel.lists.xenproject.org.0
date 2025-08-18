Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1466EB2A339
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 15:07:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086079.1444314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unzZt-0000iZ-Pg; Mon, 18 Aug 2025 13:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086079.1444314; Mon, 18 Aug 2025 13:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unzZt-0000gX-MR; Mon, 18 Aug 2025 13:07:09 +0000
Received: by outflank-mailman (input) for mailman id 1086079;
 Mon, 18 Aug 2025 13:07:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1unzZr-0000gR-Op
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 13:07:07 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3de5f22e-7c34-11f0-a32a-13f23c93f187;
 Mon, 18 Aug 2025 15:07:06 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afcb731caaaso576463066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 06:07:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72cfesm787988066b.46.2025.08.18.06.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 06:07:05 -0700 (PDT)
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
X-Inumbo-ID: 3de5f22e-7c34-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755522426; x=1756127226; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yIGAesZuFJCgpAO1KkMfSp7LXfd2M3wMtq3dQBbIKUE=;
        b=PKhcXt1czbh2bHo/fjg5hhiOM7IkBD+90rBxaN+mpEQQCAscPexjhdIUUnkZMPU/Cc
         P4+G6B4tc5uYBBk9p5wthVIBL1D9ATk9w+Nh9rYQNqLBvPFF5xCQ3+ZbLv6FzIpwFE5c
         EXc5J1vYKCK7hDhbXQxSDmiL3Gyenfiy/bIq4DOxQkPO7RSXpLj/cJPSvkQWHZKPdx7U
         wn3a7fxMaUjvMMfzK8JEhxaSroB7lSc2VmVcyvFjA2Gps7gU0TF//LP/f1Zs6ZCzX+RF
         ww/fQDrsfXvaeOJ3JmxcOsuBn6q7wAZb8Xj2uAZt1A1Gx8FvTiyQldQ/VNge98WJiLXA
         BKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755522426; x=1756127226;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIGAesZuFJCgpAO1KkMfSp7LXfd2M3wMtq3dQBbIKUE=;
        b=T2ZAnK3mnTeheidC663V04RLT/4RHLFSrkz1UBKckdFMs7As9TSX+q16R1VwTmMCDw
         ppB91pvzOtyeNTO1VEgOmG1cSND0PqVGxd7dw/aaAvcsrFYTLdZUUnxXdhMZ4z/URF+o
         rdlLb6JV9ZBo2Woh3WM86Mr4zhwTfj6v3bSP4TBmpQFpYM5KTV+kagScfwhDcIxUw3RZ
         EtzrkqEGEUmk4b4ToOOzi7yy/a8DwTsTLPsGBVIq+0kgUzVjePaeJUUOtaF3zOJrKUbI
         pZfPheiEAyFaKUEiuFHAuqG0wKvm9pMr7Sqrtdiz9p7uPbO9ij9b1SYQn5u5QBjFH/4j
         eATQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgSXL1GvVZIArhj7lUimrEgGckhRb7IBWhqplwxVMX8iZ9i852CnfmmxBYHhUURtoxniLukxWD174=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybdiRoiIo8PFHQf88a+xzPXuRRWzHzrydWxRtnMRywxvUGw8vY
	W3qgC7yzMVjYr/sL9Janpw5Sj7MBt5qj2fEUv0ZanVyAqw8ej3I7rWPxJjBDRZTy0Q==
X-Gm-Gg: ASbGnct2LSuIhGIaUrnsRp156uD6ZdUu6TRBVIYqPPehxTn9kNBDKiaJpKzvUSidoLN
	y2v91MrSBPP0Nm70zJ9aETtHxMhiuOZXea5BAeu5KbQFHdj2+yPYXRD8TuSmfFZrxQ0n9dV50QS
	NzABTdA4b1im8OJTUy/g4mVj4bm8lO8rIKo3D+aQCduwcfjovO7FvzxhYdAsRBjemJSm82DLthq
	EGZDoz9cMgpdRpHAyp9jBz8sWW3XPDdUQBMyW52b+2E9AtsyZfleH30U8oM95ET4fYxjeIgDeId
	cR5Qhu1f+VF2CCwA8xR4Gp4mROQKaXQd0w8PhDTUvfJoBlNNKvcmxvPXR2j6VJ+Ucr/m6IK3Pdl
	QUe146M4gusYfyHyCjYK/m6kKi8UyeQLz33BhDUUlzmxIPW4WoTqe2dmI8xlC7oR978cCkQNrjF
	jYggpcJcWeMvxMRp3ViQ==
X-Google-Smtp-Source: AGHT+IEziThFRdZCfz05bviPzuufeE2dhFJZO/TyZOmUflmBzTkfluRmlzBW0scFIltWkQww/CuZMw==
X-Received: by 2002:a17:907:7faa:b0:ae3:6655:410f with SMTP id a640c23a62f3a-afcdc20625emr1117531266b.7.1755522426181;
        Mon, 18 Aug 2025 06:07:06 -0700 (PDT)
Message-ID: <f1693582-ff30-47a2-8be5-2fbe9c812594@suse.com>
Date: Mon, 18 Aug 2025 15:07:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/16] x86/msr: Split out tsc.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250815204117.3312742-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2025 22:41, Andrew Cooper wrote:
> The TSC functionality is only related to MSRs by write_tsc(), and this really
> does not want to be available as widely as is currently is.
> 
> asm/time.h shouldn't be including asm/msr.h, but this turns out to be
> sufficiently tangled that I've chosen to break it out into it's own patch.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with one nit:

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/tsc.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef X86_TSC_H
> +#define X86_TSC_H
> +
> +#include <asm/alternative.h>
> +
> +static inline uint64_t rdtsc(void)
> +{
> +    uint64_t low, high;
> +
> +    asm volatile ( "rdtsc" : "=a" (low), "=d" (high) );
> +
> +    return (high << 32) | low;
> +}
> +
> +static inline uint64_t rdtsc_ordered(void)
> +{
> +    uint64_t low, high, aux;
> +
> +    /*
> +     * The RDTSC instruction is not serializing.  Make it dispatch serializing
> +     * for the purposes here by issuing LFENCE (or MFENCE if necessary) ahead
> +     * of it.
> +     *
> +     * RDTSCP, otoh, "does wait until all previous instructions have executed
> +     * and all previous loads are globally visible" (SDM) / "forces all older
> +     * instructions to retire before reading the timestamp counter" (APM).
> +     */
> +    alternative_io_2("lfence; rdtsc",
> +                     "mfence; rdtsc", X86_FEATURE_MFENCE_RDTSC,
> +                     "rdtscp",        X86_FEATURE_RDTSCP,
> +                     ASM_OUTPUT2("=a" (low), "=d" (high), "=c" (aux)),
> +                     /* no inputs */);
> +
> +    return (high << 32) | low;
> +}
> +
> +#define __write_tsc(val) wrmsrl(MSR_IA32_TSC, val)
> +#define write_tsc(val) ({                                       \
> +    /* Reliable TSCs are in lockstep across all CPUs. We should \
> +     * never write to them. */                                  \

This comment may want to become a proper Xen-style one while being moved.

Jan

