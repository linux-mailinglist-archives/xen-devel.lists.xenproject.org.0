Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8254B907544
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 16:36:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740022.1147019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHlYD-0006P5-RV; Thu, 13 Jun 2024 14:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740022.1147019; Thu, 13 Jun 2024 14:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHlYD-0006N0-Oi; Thu, 13 Jun 2024 14:35:41 +0000
Received: by outflank-mailman (input) for mailman id 740022;
 Thu, 13 Jun 2024 14:35:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g45b=NP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sHlYD-0006Mu-6E
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 14:35:41 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34fe97a8-2992-11ef-90a3-e314d9c70b13;
 Thu, 13 Jun 2024 16:35:40 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52c4b92c09bso1725139e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 07:35:40 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2825b43sm215269e87.12.2024.06.13.07.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 07:35:39 -0700 (PDT)
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
X-Inumbo-ID: 34fe97a8-2992-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718289340; x=1718894140; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9yiTskAtNCA9fyCqx4OEuFLI4DcW6IWPjT6NF2UIsco=;
        b=KYLsbDx+4BFNMSlUNL5Fr2F+whWbMw+WVUtIoO6WKQY2W9O2XhyXAAFHs0wyQBqUrm
         1M9ttm5OL8XocgW8dBNenUs9lSvOSw/JOF0tBkOlk7OxUGJgGhTIKlRq9V4RZHyZPOtH
         6afjEpx6633anwDw9xbXdww4u7PgEu95e9nxyKGOWUBSwKn3b3ScqLV/Xa1E+N7Rlk0o
         BFa23gHmlx2+S3Y/k88HGO/YDXBEWmg6SCYl+bbj8JAqNonUd2TTaWp3xucJYw2HBsGi
         1CBPDVR2vxkdezsFoAW703o9robozkJroNF3bRqck3fxriQ7NzusNgaYFqMQ879nclSN
         bsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718289340; x=1718894140;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9yiTskAtNCA9fyCqx4OEuFLI4DcW6IWPjT6NF2UIsco=;
        b=mIRfwWCjZsNiGEu32WMmRYiZyhIt6WZQm0SbBrhD+MKuo+fOYIxujsz+LeXdOrI9eo
         rPhxbbvhGuWcd+P+6DIl8KEsY5K9ZGmnYw/jox+UXZKkophr5MkcVK1LTbXy27dELomz
         L+0kYwWFJxkCmUnYAZIqigeWUtY7ZVk1rwGvs8QuChqXyxOIdy0Z+LWZPaHRiAQU2aSv
         /YbOZ86fujDF0QCU5MBNyti6Ro/LUclfypOwZ9nheT3hu4qhAhFES1sw3oQtmkDpoDTN
         pJLg9pU9PpUsjkPwLTZj8DRDVZO7RcuzcVlsHqaltnYq9Rfp1ocng3L2i+ZTz4xM6wP/
         WlBA==
X-Forwarded-Encrypted: i=1; AJvYcCUC7DVAVWT+qSrvD+n/vQS5VzoPKS2S1Jm4dEvsC3/jZkBUcjIJSQJcJ9gqJYC13yc9QhRZ0WT/GQVjsKSJOQwRokOlx9e2YwkcaI/WRsc=
X-Gm-Message-State: AOJu0Yz0EPCxUaPcWnlFztVW/LRRiwE6hkLuyqGXDxbkGss6rPvYgsSb
	+8n0Q0DLwnpfAPOVmZOJyifkwP16MHjWbaHIaxS4/Z29yKBgnOeu
X-Google-Smtp-Source: AGHT+IHCysbjE5hkGzIy6B7zMaSqwZWTRetzl6lngZ9l8PkcgV1+FzHBVM/9tPsW5MOdE1sV6IpTpw==
X-Received: by 2002:ac2:58c3:0:b0:52c:8984:6b63 with SMTP id 2adb3069b0e04-52c9a3c6c49mr3304092e87.26.1718289339421;
        Thu, 13 Jun 2024 07:35:39 -0700 (PDT)
Message-ID: <840d78dc1b27de61a0aa9931eb26ae896194fd0a.camel@gmail.com>
Subject: Re: [PATCH for 4.19?] x86/Intel: unlock CPUID earlier for the BSP
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>
Date: Thu, 13 Jun 2024 16:35:38 +0200
In-Reply-To: <82277592-ea96-47c8-a991-7afd97d7a7bc@suse.com>
References: <82277592-ea96-47c8-a991-7afd97d7a7bc@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-06-13 at 10:19 +0200, Jan Beulich wrote:
> Intel CPUs have a MSR bit to limit CPUID enumeration to leaf two. If
> this bit is set by the BIOS then CPUID evaluation does not work when
> data from any leaf greater than two is needed; early_cpu_init() in
> particular wants to collect leaf 7 data.
>=20
> Cure this by unlocking CPUID right before evaluating anything which
> depends on the maximum CPUID leaf being greater than two.
>=20
> Inspired by (and description cloned from) Linux commit 0c2f6d04619e
> ("x86/topology/intel: Unlock CPUID before evaluating anything").
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii
> ---
> While I couldn't spot anything, it kind of feels as if I'm
> overlooking
> further places where we might be inspecting in particular leaf 7 yet
> earlier.
>=20
> No Fixes: tag(s), as imo it would be too many that would want
> enumerating.
>=20
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -336,7 +336,8 @@ void __init early_cpu_init(bool verbose)
> =C2=A0
> =C2=A0	c->x86_vendor =3D x86_cpuid_lookup_vendor(ebx, ecx, edx);
> =C2=A0	switch (c->x86_vendor) {
> -	case X86_VENDOR_INTEL:=C2=A0=C2=A0=C2=A0 actual_cpu =3D intel_cpu_dev;=
=C2=A0=C2=A0=C2=A0
> break;
> +	case X86_VENDOR_INTEL:=C2=A0=C2=A0=C2=A0 intel_unlock_cpuid_leaves(c);
> +				=C2=A0 actual_cpu =3D intel_cpu_dev;=C2=A0=C2=A0=C2=A0
> break;
> =C2=A0	case X86_VENDOR_AMD:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 actual_cpu =3D =
amd_cpu_dev;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> break;
> =C2=A0	case X86_VENDOR_CENTAUR:=C2=A0 actual_cpu =3D centaur_cpu_dev;=C2=
=A0
> break;
> =C2=A0	case X86_VENDOR_SHANGHAI: actual_cpu =3D shanghai_cpu_dev;
> break;
> --- a/xen/arch/x86/cpu/cpu.h
> +++ b/xen/arch/x86/cpu/cpu.h
> @@ -24,3 +24,5 @@ void amd_init_lfence(struct cpuinfo_x86
> =C2=A0void amd_init_ssbd(const struct cpuinfo_x86 *c);
> =C2=A0void amd_init_spectral_chicken(void);
> =C2=A0void detect_zen2_null_seg_behaviour(void);
> +
> +void intel_unlock_cpuid_leaves(struct cpuinfo_x86 *c);
> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -303,10 +303,24 @@ static void __init noinline intel_init_l
> =C2=A0		ctxt_switch_masking =3D intel_ctxt_switch_masking;
> =C2=A0}
> =C2=A0
> -static void cf_check early_init_intel(struct cpuinfo_x86 *c)
> +/* Unmask CPUID levels if masked. */
> +void intel_unlock_cpuid_leaves(struct cpuinfo_x86 *c)
> =C2=A0{
> -	u64 misc_enable, disable;
> +	uint64_t misc_enable, disable;
> +
> +	rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
> +
> +	disable =3D misc_enable & MSR_IA32_MISC_ENABLE_LIMIT_CPUID;
> +	if (disable) {
> +		wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable &
> ~disable);
> +		bootsym(trampoline_misc_enable_off) |=3D disable;
> +		c->cpuid_level =3D cpuid_eax(0);
> +		printk(KERN_INFO "revised cpuid level: %u\n", c-
> >cpuid_level);
> +	}
> +}
> =C2=A0
> +static void cf_check early_init_intel(struct cpuinfo_x86 *c)
> +{
> =C2=A0	/* Netburst reports 64 bytes clflush size, but does IO in
> 128 bytes */
> =C2=A0	if (c->x86 =3D=3D 15 && c->x86_cache_alignment =3D=3D 64)
> =C2=A0		c->x86_cache_alignment =3D 128;
> @@ -315,16 +329,7 @@ static void cf_check early_init_intel(st
> =C2=A0	=C2=A0=C2=A0=C2=A0 bootsym(trampoline_misc_enable_off) &
> MSR_IA32_MISC_ENABLE_XD_DISABLE)
> =C2=A0		printk(KERN_INFO "re-enabled NX (Execute Disable)
> protection\n");
> =C2=A0
> -	/* Unmask CPUID levels and NX if masked: */
> -	rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
> -
> -	disable =3D misc_enable & MSR_IA32_MISC_ENABLE_LIMIT_CPUID;
> -	if (disable) {
> -		wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable &
> ~disable);
> -		bootsym(trampoline_misc_enable_off) |=3D disable;
> -		printk(KERN_INFO "revised cpuid level: %d\n",
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpuid_eax(0));
> -	}
> +	intel_unlock_cpuid_leaves(c);
> =C2=A0
> =C2=A0	/* CPUID workaround for Intel 0F33/0F34 CPU */
> =C2=A0	if (boot_cpu_data.x86 =3D=3D 0xF && boot_cpu_data.x86_model =3D=3D=
 3
> &&


