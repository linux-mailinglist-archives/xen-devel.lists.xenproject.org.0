Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE71A181C2
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 17:13:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875523.1285968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taGrX-0001MQ-2I; Tue, 21 Jan 2025 16:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875523.1285968; Tue, 21 Jan 2025 16:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taGrW-0001Kg-Vn; Tue, 21 Jan 2025 16:12:22 +0000
Received: by outflank-mailman (input) for mailman id 875523;
 Tue, 21 Jan 2025 16:12:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jEc5=UN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1taGrV-0001Ka-6W
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 16:12:21 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78852ce9-d812-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 17:12:11 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ab39f84cbf1so696985766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 08:12:11 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384c57034sm766173666b.34.2025.01.21.08.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 08:12:10 -0800 (PST)
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
X-Inumbo-ID: 78852ce9-d812-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737475931; x=1738080731; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mSV15Srcq+Nl4YhU/S4lmFiS7ITihItYiuJhQd3Ib/w=;
        b=HLYZ7OmSFEVwKm6JG3OlJteNUMYFIWCWnk9FGDnBAVQiCxm+OP+6BkMNwHS2pVnS0X
         oObd9na02kPyvze75Gxa9B3g25zA42Bws8AHybnn0MMbomxzg/hhDdkpmfDGECUp2qBr
         8tEQvuvJmVJ99p04qC7cTrcjCduyNErDnW2L0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737475931; x=1738080731;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mSV15Srcq+Nl4YhU/S4lmFiS7ITihItYiuJhQd3Ib/w=;
        b=IR33Ll4SVCTseKTvXNJhrTa8qaXbfm4/9Fy7mBb/hlnHIUo5ehO2rJHgxSDJnfqCuV
         VJLRIZT38N2/wYN0BYZTpaDtf0zRjwa/WpsF3+LHxBKm3AeRLLxf6SbQkMAQeVtfJPB2
         ZDUmBdtkTgdmsUvOc6v+i0QUjvJ3lM2GLvXQ6RYn13U3rg+kB0L7Ke8+Xcy+bwMNAYbe
         4/imRCnrZMjHYCLMdrb3cMN9YIJCdaQUEM2tWc5GHiLRkZf0n2hijYQaT0AAErvJ7Yb0
         eLyu7hSiXKTGQQ/5P3NbVMkQuH9+2OWvQu/wO0Jkl4Nim6Gi7s5V9EDbh9X+PTrBj6iZ
         WpIg==
X-Gm-Message-State: AOJu0YyyKLmYjtO5So2G/liACXSJJVHPPDLhqYRC592nfbc+PARCvQRI
	Rch42UtywPm0uBJIokxb/HpMLUHGI2zSprZFSJPACci4G/wCekQaKIrm31i9mbA=
X-Gm-Gg: ASbGncuTKWA4g2L9WD2TL3rg5J+gLDeqT/fLN6dc88pWKlEpqjKMLUC+mvmlq7dxexh
	VmdNTOO9HVifi54ri7gyIJ+1vKKMXeG4rPkRh078Ro/Pd20CbLwataapVOG1bOCra9zlklPQyZu
	oSZgedjHq+GuP2BUGBauIFP5aC2pHo9ier4EEXNk+nRQB0+Mrep2kU3+UwIUL4b8YnGv6cC+GIy
	dINV7vdZYeXEJiSnGhH7R2e9LeO+X3MP64AzgYR4iL1oFTfk0o+P9Pc92TcbUr6us5FXRnDoFpy
	gBKN
X-Google-Smtp-Source: AGHT+IGTVh6WQm4fJk2laXvh16Rlqyg0azoJHf9oav0dG9alBlsqTyMIMzivO4Nh7fQv7BLxPEpT/w==
X-Received: by 2002:a17:907:d1b:b0:aae:fd36:f511 with SMTP id a640c23a62f3a-ab38b3cce8cmr1615142166b.47.1737475930757;
        Tue, 21 Jan 2025 08:12:10 -0800 (PST)
Date: Tue, 21 Jan 2025 17:12:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jonathan Katz <jonathan.katz@aptar.com>,
	Jan Beulich <JBeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.20] x86/intel: Fix PERF_GLOBAL fixup when
 virtualised
Message-ID: <Z4_HWTpXfj19-BA7@macbook.local>
References: <20250121142510.358996-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250121142510.358996-1-andrew.cooper3@citrix.com>

On Tue, Jan 21, 2025 at 02:25:10PM +0000, Andrew Cooper wrote:
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
> 
> I've intentionally stopped using Intel style.  This file is already mixed (as
> visible even in context), and it doesn't remotely resemble it's Linux origin
> any more.
> 
> For 4.20.  This regressions has already been backported.
> ---
>  xen/arch/x86/cpu/intel.c | 64 +++++++++++++++++++++++-----------------
>  1 file changed, 37 insertions(+), 27 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
> index 6a7347968ba2..586ae84d806d 100644
> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -535,39 +535,49 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
>      printk("%u MHz\n", (factor * max_ratio + 50) / 100);
>  }
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

With this chunk moved back inside the if scope, and the Fixes tag
added:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

