Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B13F94CECD
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 12:38:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774650.1185102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scMzZ-0007uG-6V; Fri, 09 Aug 2024 10:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774650.1185102; Fri, 09 Aug 2024 10:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scMzZ-0007s8-3P; Fri, 09 Aug 2024 10:37:05 +0000
Received: by outflank-mailman (input) for mailman id 774650;
 Fri, 09 Aug 2024 10:37:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dBfy=PI=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1scMzX-0007s2-VT
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 10:37:04 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fedac24-563b-11ef-8776-851b0ebba9a2;
 Fri, 09 Aug 2024 12:37:01 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so194631466b.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2024 03:37:01 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9d8a4b1sm832735766b.151.2024.08.09.03.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Aug 2024 03:37:00 -0700 (PDT)
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
X-Inumbo-ID: 4fedac24-563b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723199821; x=1723804621; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOJZysuO7YX6C+HiR3FdpKHjYZKOT3NccPJkp3Z5Ok0=;
        b=C6Wm6Cvx7q6VXrrTw1kuek6p6ncxkgzCfZndy1S9ueGJy84y6ub71WAnQFBSfSN1vG
         wlMxTU4RSedE9p6CRqi0LyZfNGRUzd0i8DuILxxPB+15C1ZPA99JRgGJ0BtUE5iraXrO
         6LAJmfafNY8MKkosbtsAYzl+ouB5ghcrd7hl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723199821; x=1723804621;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rOJZysuO7YX6C+HiR3FdpKHjYZKOT3NccPJkp3Z5Ok0=;
        b=WRCyAvEzj/GEDTT7VmvHUb5urgoz8yWDbFKn+UkMM8HKG6BjswlDnoBENWX3PJ16Yp
         e8FUrXS8ocpix4Xoc/WCNZcjpqo/6mo3lVuskctvCYMW2RZ3ZyjA06XFJTq0nnBkW2F8
         Pz+lZRzgWPkG/y2/+bBIMkYFL5kyzy9rXutwEVM87g9/hUwU3sTcFJ0hF3HT5F9ivaUG
         ChaCWh2TBYywVTKGxqaBvhe7oPh+8fNcyO14H689VJAqENS/I0gzFaJr60PR7/AJ8O2P
         kvrr3YNqMK2g5qzhMDE5PEYT7sTF9E9RpIVCNyvcGHpMbt6FWMI5Ae/JCCHdx9l4EGYU
         LyEg==
X-Forwarded-Encrypted: i=1; AJvYcCV/IOB/FJ4WlXd0+Aj20SbUHgo+UdWTKfAQcEIDg5ghZmrFyjUMOdrHbfRvlMRyB//iJoeEus0Ez5E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZc9HTiXOKensm8vAMP91Db2cseQFSJXk3+SNQHOWTDDRo5Zdn
	fX3aBIpivq5aO5WYf1+hAmkwvRrPH9qdC5y8f290D1yMB/xOo06hsduILEG8mzM=
X-Google-Smtp-Source: AGHT+IGlimiv/HRU8LRFYMwY+vsN7xzqrqZgXQdlTIFvxZayrah58MkyG10eu9tHKoECnicAqiHaFg==
X-Received: by 2002:a17:907:e6a4:b0:a7a:929f:c0cb with SMTP id a640c23a62f3a-a80aa5eb16amr85493866b.38.1723199820960;
        Fri, 09 Aug 2024 03:37:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Aug 2024 11:36:58 +0100
Message-Id: <D3BBCS1WZ3FI.KYTC0BZLDUM9@cloud.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1 1/2] x86/intel: optional build of intel.c
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Sergiy Kibrik" <Sergiy_Kibrik@epam.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <cover.1723196909.git.Sergiy_Kibrik@epam.com>
 <25e80b9271607da56abf9d4193e4d91b3d00bd9c.1723196909.git.Sergiy_Kibrik@epam.com>
In-Reply-To: <25e80b9271607da56abf9d4193e4d91b3d00bd9c.1723196909.git.Sergiy_Kibrik@epam.com>

On Fri Aug 9, 2024 at 11:09 AM BST, Sergiy Kibrik wrote:
> With specific config option INTEL in place and most of the code that depe=
nds
> on intel.c now can be optionally enabled/disabled it's now possible to pu=
t
> the whole intel.c under INTEL option as well. This will allow for a Xen b=
uild
> without Intel CPU support.
>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
>  xen/arch/x86/cpu/Makefile            | 6 +++---
>  xen/arch/x86/cpu/common.c            | 4 +++-
>  xen/arch/x86/include/asm/processor.h | 7 ++++---
>  3 files changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/xen/arch/x86/cpu/Makefile b/xen/arch/x86/cpu/Makefile
> index eafce5f204..020c86bda3 100644
> --- a/xen/arch/x86/cpu/Makefile
> +++ b/xen/arch/x86/cpu/Makefile
> @@ -6,10 +6,10 @@ obj-y +=3D amd.o
>  obj-y +=3D centaur.o
>  obj-y +=3D common.o
>  obj-y +=3D hygon.o
> -obj-y +=3D intel.o
> -obj-y +=3D intel_cacheinfo.o
> +obj-$(CONFIG_INTEL) +=3D intel.o
> +obj-$(CONFIG_INTEL) +=3D intel_cacheinfo.o
>  obj-y +=3D mwait-idle.o
> -obj-y +=3D shanghai.o
> +obj-$(CONFIG_INTEL) +=3D shanghai.o

Why pick this one too? It's based on VIA IP, aiui.

>  obj-y +=3D vpmu.o
>  obj-$(CONFIG_AMD) +=3D vpmu_amd.o
>  obj-$(CONFIG_INTEL) +=3D vpmu_intel.o
> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
> index ff4cd22897..50ce13f81c 100644
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -336,11 +336,13 @@ void __init early_cpu_init(bool verbose)
> =20
>  	c->x86_vendor =3D x86_cpuid_lookup_vendor(ebx, ecx, edx);
>  	switch (c->x86_vendor) {
> +#ifdef CONFIG_INTEL
>  	case X86_VENDOR_INTEL:    intel_unlock_cpuid_leaves(c);
>  				  actual_cpu =3D intel_cpu_dev;    break;
> +	case X86_VENDOR_SHANGHAI: actual_cpu =3D shanghai_cpu_dev; break;
> +#endif
>  	case X86_VENDOR_AMD:      actual_cpu =3D amd_cpu_dev;      break;
>  	case X86_VENDOR_CENTAUR:  actual_cpu =3D centaur_cpu_dev;  break;
> -	case X86_VENDOR_SHANGHAI: actual_cpu =3D shanghai_cpu_dev; break;
>  	case X86_VENDOR_HYGON:    actual_cpu =3D hygon_cpu_dev;    break;
>  	default:
>  		actual_cpu =3D default_cpu;
> diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/=
asm/processor.h
> index 66463f6a6d..a88d45252b 100644
> --- a/xen/arch/x86/include/asm/processor.h
> +++ b/xen/arch/x86/include/asm/processor.h
> @@ -507,15 +507,16 @@ static inline uint8_t get_cpu_family(uint32_t raw, =
uint8_t *model,
>  extern int8_t opt_tsx;
>  extern bool rtm_disabled;
>  void tsx_init(void);
> +void update_mcu_opt_ctrl(void);
> +void set_in_mcu_opt_ctrl(uint32_t mask, uint32_t val);
>  #else
>  #define opt_tsx      0     /* explicitly indicate TSX is off */
>  #define rtm_disabled false /* RTM was not force-disabled */
>  static inline void tsx_init(void) {}
> +static inline void update_mcu_opt_ctrl(void) {}
> +static inline void set_in_mcu_opt_ctrl(uint32_t mask, uint32_t val) {}
>  #endif
> =20
> -void update_mcu_opt_ctrl(void);
> -void set_in_mcu_opt_ctrl(uint32_t mask, uint32_t val);
> -
>  enum ap_boot_method {
>      AP_BOOT_NORMAL,
>      AP_BOOT_SKINIT,


Cheers,
Alejandro

