Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C90A18260
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 17:57:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875620.1286068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taHZC-0004BR-DK; Tue, 21 Jan 2025 16:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875620.1286068; Tue, 21 Jan 2025 16:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taHZC-00048z-AW; Tue, 21 Jan 2025 16:57:30 +0000
Received: by outflank-mailman (input) for mailman id 875620;
 Tue, 21 Jan 2025 16:57:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NioT=UN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1taHZB-0003tG-47
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 16:57:29 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbdf347a-d818-11ef-a0e4-8be0dac302b0;
 Tue, 21 Jan 2025 17:57:28 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-30167f4c1e3so53865051fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 08:57:28 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543bb6bf5b1sm15507e87.118.2025.01.21.08.57.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 08:57:27 -0800 (PST)
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
X-Inumbo-ID: cbdf347a-d818-11ef-a0e4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737478648; x=1738083448; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bTA4jnXzYEFzhmsmqQFRKNCJDj+5qOjoNV3nC5NctjY=;
        b=D9p6VP0PfLjIdHxmfeXwFLkpp8T/YA28BQrC62QRSsajB6fsFkoJ2k+Ra3Nz2UeMFM
         fDw3v0Az28EznC+82obRpu1As7SF6uuSngc7a/Tb5MjuHtLO09VlWbnNxrtu0NLMydK6
         LvHvRyluW3wiRv2ALQdQ0elkxQJh5S1MYSxzXzkK+Ec5dPHGY3lgQxdVhD4Bi/P1qWz4
         yJ7U3cBUFwBQAih8XOWCWV/o2QA2S1Zl0JTBLe1+biX40WnHTIkcbrF50UXjb2uleX/w
         tYiNJ4JuNVlOlnKPItgpGGh29AU0AafKOiytO21f2oiPQg9xU2Dr38te4LIvibK4hE4I
         VSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737478648; x=1738083448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bTA4jnXzYEFzhmsmqQFRKNCJDj+5qOjoNV3nC5NctjY=;
        b=SDPpId56fPNFqvfK/y4meCE/yH4T4Jn6yufmrXvRQAXtKKzVSHUEWXzd8kirNXoVPg
         5nEBRmDX/ZiHZfVh4o1yRlTt+BVE3CaN9mPtPlygxI2qmfGfV0fvNYgC45/MHPDvf7Lr
         H1i4VBuRsysGhATvQ6iM4hZEcelNpm85lvEPB5l2vZ96t/S+JaKgu+e0tjWACOS1EgJ9
         G7oqns6YjThtM4G4tq8dXyllOfq/UQFJgXEhCnd4VHw33EXPRH/ZYmsn0bMn3KSJpUFu
         FVKQsRoyw3Hf/q5rca0J6b++KXpkB2Tudp8dYsKa9OhzjbEJWKyI2mJi8Sr4/rP0aie/
         yVRA==
X-Forwarded-Encrypted: i=1; AJvYcCV5MHJpCt5dFabCRuvnso6YWduo4boU/Av9ZnB8Fwi2tCW73th1WuT/jbCZiy6DnKJPZMHFzPucEJE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOBgVQ76gbVDGPI5dbl2Mttq5QonxyTyw1W0eXDWS/zpI/gh48
	IFrsXEhD1DiiuYCybjVScIPk8SgbZfYPf7kag0H+69g1k7ZezGhr
X-Gm-Gg: ASbGncsH65qGZsdJr+CznEUAMC5a462od5IoejKFQoKcoOIit8ydS2x8LC3FjHG+XAG
	xpT4sDtArUu9p3i6VrBuRSH7pUD8h9jnuNZY0R5iNo97wue05C1wjLdFYgFXFfuGr58LQy8sJPz
	UmX0Wvw4d2lKNnw8zIZ3Y5Og1UJqJsWAgLb3mt+Ay8s+eYqMq3/XqrYOvYftl/uqPQxQQ575F9z
	brVirc70Spc6zZ9amFy75sV1NRG8I1WlspWIV/HoVeJnlqvfAgJ0zU1gkzYeY4H1MovixXVzN4J
	+aZhQ/U=
X-Google-Smtp-Source: AGHT+IEmqlkmLB6r+6X22LkqrvhDpJYh2ZTxsooDO9jLNU/yUB5ZwPsm0rpXL/w8Af4/5yAFgkeyAw==
X-Received: by 2002:ac2:4541:0:b0:53e:389d:8ce4 with SMTP id 2adb3069b0e04-5439c281f4fmr5546707e87.34.1737478647331;
        Tue, 21 Jan 2025 08:57:27 -0800 (PST)
Message-ID: <eb58ed74-1156-4de5-8392-a546d9afddc3@gmail.com>
Date: Tue, 21 Jan 2025 17:57:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] x86/intel: Fix PERF_GLOBAL fixup when
 virtualised
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jonathan Katz <jonathan.katz@aptar.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250121142510.358996-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250121142510.358996-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/21/25 3:25 PM, Andrew Cooper wrote:
> Logic using performance counters needs to look at
> MSR_MISC_ENABLE.PERF_AVAILABLE before touching any other resources.
>
> When virtualised under ESX, Xen dies with a #GP fault trying to read
> MSR_CORE_PERF_GLOBAL_CTRL.
>
> Factor this logic out into a separate function (it's already too squashed to
> the RHS), and insert a check of MSR_MISC_ENABLE.PERF_AVAILABLE.
>
> This also limits setting X86_FEATURE_ARCH_PERFMON, although oprofile (the only
> consumer of this flag) cross-checks too.
>
> Reported-by: Jonathan Katz <jonathan.katz@aptar.com>
> Link: https://xcp-ng.org/forum/topic/10286/nesting-xcp-ng-on-esx-8
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> Untested, but this is the same pattern used by oprofile and watchdog setup.

Probably it will make sense to wait for a response on the forum (you 
mentioned in the Link:) that the current one patch works?

~ Oleksii

>
> I've intentionally stopped using Intel style.  This file is already mixed (as
> visible even in context), and it doesn't remotely resemble it's Linux origin
> any more.
>
> For 4.20.  This regressions has already been backported.
> ---
>   xen/arch/x86/cpu/intel.c | 64 +++++++++++++++++++++++-----------------
>   1 file changed, 37 insertions(+), 27 deletions(-)
>
> diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
> index 6a7347968ba2..586ae84d806d 100644
> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -535,39 +535,49 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
>       printk("%u MHz\n", (factor * max_ratio + 50) / 100);
>   }
>   
> +static void init_intel_perf(struct cpuinfo_x86 *c)
> +{
> +    uint64_t val;
> +    unsigned int eax, ver, nr_cnt;
> +
> +    if ( c->cpuid_level <= 9 ||
> +         rdmsr_safe(MSR_IA32_MISC_ENABLE, val) ||
> +         !(val & MSR_IA32_MISC_ENABLE_PERF_AVAIL) )
> +        return;
> +
> +    eax = cpuid_eax(10);
> +    ver = eax & 0xff;
> +    nr_cnt = (eax >> 8) & 0xff;
> +
> +    if ( ver && nr_cnt > 1 && nr_cnt <= 32 )
> +    {
> +        unsigned int cnt_mask = (1UL << nr_cnt) - 1;
> +
> +        /*
> +         * On (some?) Sapphire/Emerald Rapids platforms each package-BSP
> +         * starts with all the enable bits for the general-purpose PMCs
> +         * cleared.  Adjust so counters can be enabled from EVNTSEL.
> +         */
> +        rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, val);
> +
> +        if ( (val & cnt_mask) != cnt_mask )
> +        {
> +            printk("FIRMWARE BUG: CPU%u invalid PERF_GLOBAL_CTRL: %#"PRIx64" adjusting to %#"PRIx64"\n",
> +                   smp_processor_id(), val, val | cnt_mask);
> +            wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, val | cnt_mask);
> +        }
> +    }
> +
> +    __set_bit(X86_FEATURE_ARCH_PERFMON, c->x86_capability);
> +}
> +
>   static void cf_check init_intel(struct cpuinfo_x86 *c)
>   {
>   	/* Detect the extended topology information if available */
>   	detect_extended_topology(c);
>   
>   	init_intel_cacheinfo(c);
> -	if (c->cpuid_level > 9) {
> -		unsigned eax = cpuid_eax(10);
> -		unsigned int cnt = (eax >> 8) & 0xff;
> -
> -		/* Check for version and the number of counters */
> -		if ((eax & 0xff) && (cnt > 1) && (cnt <= 32)) {
> -			uint64_t global_ctrl;
> -			unsigned int cnt_mask = (1UL << cnt) - 1;
> -
> -			/*
> -			 * On (some?) Sapphire/Emerald Rapids platforms each
> -			 * package-BSP starts with all the enable bits for the
> -			 * general-purpose PMCs cleared.  Adjust so counters
> -			 * can be enabled from EVNTSEL.
> -			 */
> -			rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, global_ctrl);
> -			if ((global_ctrl & cnt_mask) != cnt_mask) {
> -				printk("CPU%u: invalid PERF_GLOBAL_CTRL: %#"
> -				       PRIx64 " adjusting to %#" PRIx64 "\n",
> -				       smp_processor_id(), global_ctrl,
> -				       global_ctrl | cnt_mask);
> -				wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL,
> -				       global_ctrl | cnt_mask);
> -			}
> -			__set_bit(X86_FEATURE_ARCH_PERFMON, c->x86_capability);
> -		}
> -	}
> +	init_intel_perf(c);
>   
>   	if ( !cpu_has(c, X86_FEATURE_XTOPOLOGY) )
>   	{
>
> base-commit: c3f5d1bb40b57d467cb4051eafa86f5933ec9003

