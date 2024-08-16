Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3031C954ADC
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 15:17:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778630.1188674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sewow-0000D4-LY; Fri, 16 Aug 2024 13:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778630.1188674; Fri, 16 Aug 2024 13:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sewow-0000AT-Is; Fri, 16 Aug 2024 13:16:46 +0000
Received: by outflank-mailman (input) for mailman id 778630;
 Fri, 16 Aug 2024 13:16:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J2/C=PP=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sewov-0000AI-Pp
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 13:16:45 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8176830-5bd1-11ef-8776-851b0ebba9a2;
 Fri, 16 Aug 2024 15:16:43 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a7a8caef11fso246122966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 Aug 2024 06:16:43 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383946c05sm256782566b.183.2024.08.16.06.16.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Aug 2024 06:16:42 -0700 (PDT)
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
X-Inumbo-ID: c8176830-5bd1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723814203; x=1724419003; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npjEpHkGzFsvzPRtGPIXxuZnLDrk2ZKiYkrynPx5u2c=;
        b=D0q/ZnInZzSvldvGzoEb2exc5Et4dvFtvZBYpgmyDwKWfkoLy9S2UJg/4qTyPfGdXE
         3cxpzRmgiU9rzZPMMCiDRhf7i4X1dP/6K/iiQJj1vyP+uV2qUuqT8xxYnJKqE6334pBQ
         f7/NKjKWs30ova4GCVha+6QqAd9E5IlhVnyro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723814203; x=1724419003;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=npjEpHkGzFsvzPRtGPIXxuZnLDrk2ZKiYkrynPx5u2c=;
        b=JybqTJfp3kWfXB2p5ohKugBJyDwkdQBIPnHQKsNpau5PX3307ZHpKyeeMXdXBgAyA8
         dKmPpq0u09AHtlv1hp+mW+sKY0mX5k6yH5JJBheOrzHTFvdnU2VcFc1Frqefpu55fotj
         2VdmeYTQ1dKFJSmohTsEkSkOaZcMOTQH2C0qx3AVfeSXPoreh98H/CswYmYFECiXTCah
         oH5w+VzthamBQnu6p4vuwPpTuW72hk98f1memEvJQYI1sWR1pLUTBVuW30scCBocRUQz
         j0thXIXVdr1MEWG9HqoHsUzRmwfLoPZ3b9O6RNFY63OAsS2AcN/IKA1CiDs5AuPyl7h5
         0H5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdUOaRZKqGua5bCE3FjW1B7xZFY+35uyzWWgIa+Whdn6AaC1CrMElxjiG84ZggrJFlyLpKY2X2EHS5hyScYexKcNDtQ1u80/24IlVaqoc=
X-Gm-Message-State: AOJu0YxnpZBim0+aFS/hzxufCGxCl8kX91QfrTDivW+A/LKGiGbC+qdS
	FT4EPOCdrhXvGA9P2B5Z6pZd0BxIgk3nDNXSac6IM0wKl7EnWvFKfW6eVjAFj4A=
X-Google-Smtp-Source: AGHT+IFfkgqDL9uItnTkW5omak1DW+UYMu1s9voasHJa2HSg2T7HqTA8g99fpgtGF3s/SMHAhUxx2A==
X-Received: by 2002:a17:907:e266:b0:a7d:c46b:2241 with SMTP id a640c23a62f3a-a8392950874mr242149166b.29.1723814202901;
        Fri, 16 Aug 2024 06:16:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Aug 2024 14:16:40 +0100
Message-Id: <D3HD4V65CEC4.L5Z3L6Z056H4@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [XEN PATCH v2 1/5] x86/Kconfig: introduce CENTAUR, HYGON &
 SHANGHAI config options
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Sergiy Kibrik" <Sergiy_Kibrik@epam.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <cover.1723806405.git.Sergiy_Kibrik@epam.com>
 <2a217c9602e92f92050cb4894bb9a42ee99a84ea.1723806405.git.Sergiy_Kibrik@epam.com>
In-Reply-To: <2a217c9602e92f92050cb4894bb9a42ee99a84ea.1723806405.git.Sergiy_Kibrik@epam.com>

On Fri Aug 16, 2024 at 12:10 PM BST, Sergiy Kibrik wrote:
> These options aim to represent what's currently supported by Xen, and lat=
er
> to allow tuning for specific platform(s) only.
>
> HYGON and SHANGHAI options depend on AMD and INTEL as there're build
> dependencies on support code for AMD and Intel CPUs respectively.
>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> CC: Jan Beulich <jbeulich@suse.com>
> ---
>  xen/arch/x86/Kconfig.cpu  | 29 +++++++++++++++++++++++++++++
>  xen/arch/x86/cpu/Makefile |  6 +++---
>  xen/arch/x86/cpu/common.c |  6 ++++++
>  3 files changed, 38 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/x86/Kconfig.cpu b/xen/arch/x86/Kconfig.cpu
> index 5fb18db1aa..ac8f41d464 100644
> --- a/xen/arch/x86/Kconfig.cpu
> +++ b/xen/arch/x86/Kconfig.cpu
> @@ -10,6 +10,25 @@ config AMD
>  	  May be turned off in builds targetting other vendors.  Otherwise,
>  	  must be enabled for Xen to work suitably on AMD platforms.
> =20
> +config CENTAUR
> +	bool "Support Centaur CPUs"
> +	default y
> +	help
> +	  Detection, tunings and quirks for VIA platforms.
> +
> +	  May be turned off in builds targeting other vendors. Otherwise, must
> +          be enabled for Xen to work suitably on VIA platforms.
> +
> +config HYGON
> +	bool "Support Hygon CPUs"
> +	depends on AMD
> +	default y
> +	help
> +	  Detection, tunings and quirks for Hygon platforms.
> +
> +	  May be turned off in builds targeting other vendors. Otherwise, must
> +          be enabled for Xen to work suitably on Hygon platforms.
> +
>  config INTEL
>  	bool "Support Intel CPUs"
>  	default y
> @@ -19,4 +38,14 @@ config INTEL
>  	  May be turned off in builds targetting other vendors.  Otherwise,
>  	  must be enabled for Xen to work suitably on Intel platforms.
> =20
> +config SHANGHAI
> +	bool "Support Shanghai CPUs"
> +	depends on INTEL
> +	default y
> +	help
> +	  Detection, tunings and quirks for Zhaoxin platforms.
> +
> +	  May be turned off in builds targeting other vendors. Otherwise, must
> +          be enabled for Xen to work suitably on Zhaoxin platforms.
> +
>  endmenu
> diff --git a/xen/arch/x86/cpu/Makefile b/xen/arch/x86/cpu/Makefile
> index eafce5f204..80739d0256 100644
> --- a/xen/arch/x86/cpu/Makefile
> +++ b/xen/arch/x86/cpu/Makefile
> @@ -3,13 +3,13 @@ obj-y +=3D microcode/
>  obj-y +=3D mtrr/
> =20
>  obj-y +=3D amd.o
> -obj-y +=3D centaur.o
> +obj-$(CONFIG_CENTAUR) +=3D centaur.o
>  obj-y +=3D common.o
> -obj-y +=3D hygon.o
> +obj-$(CONFIG_HYGON) +=3D hygon.o
>  obj-y +=3D intel.o
>  obj-y +=3D intel_cacheinfo.o
>  obj-y +=3D mwait-idle.o
> -obj-y +=3D shanghai.o
> +obj-$(CONFIG_SHANGHAI) +=3D shanghai.o
>  obj-y +=3D vpmu.o
>  obj-$(CONFIG_AMD) +=3D vpmu_amd.o
>  obj-$(CONFIG_INTEL) +=3D vpmu_intel.o
> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
> index ff4cd22897..dcc2753212 100644
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -339,9 +339,15 @@ void __init early_cpu_init(bool verbose)
>  	case X86_VENDOR_INTEL:    intel_unlock_cpuid_leaves(c);
>  				  actual_cpu =3D intel_cpu_dev;    break;
>  	case X86_VENDOR_AMD:      actual_cpu =3D amd_cpu_dev;      break;
> +#ifdef CONFIG_CENTAUR
>  	case X86_VENDOR_CENTAUR:  actual_cpu =3D centaur_cpu_dev;  break;
> +#endif
> +#ifdef CONFIG_SHANGHAI
>  	case X86_VENDOR_SHANGHAI: actual_cpu =3D shanghai_cpu_dev; break;
> +#endif
> +#ifdef CONFIG_HYGON
>  	case X86_VENDOR_HYGON:    actual_cpu =3D hygon_cpu_dev;    break;
> +#endif
>  	default:
>  		actual_cpu =3D default_cpu;
>  		if (!verbose)

Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Cheers,
Alejandro

