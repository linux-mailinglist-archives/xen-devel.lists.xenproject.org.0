Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DD46F48E6
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 19:07:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528762.822307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pttSM-00037B-4o; Tue, 02 May 2023 17:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528762.822307; Tue, 02 May 2023 17:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pttSM-000352-29; Tue, 02 May 2023 17:06:26 +0000
Received: by outflank-mailman (input) for mailman id 528762;
 Tue, 02 May 2023 17:06:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M8xE=AX=citrix.com=prvs=479c33cca=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pttSK-00034w-Ip
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 17:06:24 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7b4f32b-e90b-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 19:06:20 +0200 (CEST)
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
X-Inumbo-ID: a7b4f32b-e90b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683047180;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X8Ye7JviKJ6lmX7NtPkFlXMM7AfRK4M9QiNKUFj64gg=;
  b=T232EKTWhpDuxPlSfNwf0ZcsLXvPrSVSXBi2EFQOn1hPPa9eQKo9voKv
   l1lma5sDr2jGcSMcDYqi0wGVIoyNAX/Q60GkAr67Emu9R/b2b3SucmsaI
   XZeTXoIBG0H0wJR9o+M+AiZMhzU39XO4Lq3cEM8G8KBYmdgQQJcH8q3PR
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 106369293
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:AK+AwqCpXJ7xdhVW//fjw5YqxClBgxIJ4kV8jS/XYbTApDgi0mYAz
 WMXWmqPP/7eamX8eNp0O4608kIEuJPSx4Q1QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5A5ARkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw1Od8KEFJy
 a0iCzUOPi29pr6tyZH8Rbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4TUHpsExBfDz
 o7A1yPHHzsTDfid8mCq9H+LpeD+kzuheZ1HQdVU8dY12QbOlwT/EiY+UUawqL+3g0i1VtZbN
 mQd4C9opq83nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjRMcsA8vck6Azkjz
 EaUnsjBDCZq9raSTBq16bqV6ziyNC49JHUHIyQDSGMt/N3LsIw1yBXVQb5LCqmuhMfyHjL26
 z+PpSk6wb4UiKYj1aqh+kvcqymxvZWPRQkwji3eRm+/5xl1TJKkbYevr1Pc6J59wJ2xFwfb+
 iJewo7Hsb5IVMvW/MCQfAkTNJ+o7N+lNwGNu31qHMkcyRXx4HeAOo8FtVmSO3xV3tY4lS7BO
 RGD4lsIvs8MYxNGfocsPdvvVp1CIbzIUI28C6uKNocmjo1ZLlfvwc14WaKHM4kBemAImLp3B
 5qUeN3E4Z0yWfU+l2reqwvwPNYWKsECKYD7H8qTI+yPi+b2WZJsYe5t3KGyRu449riYhw7e7
 sxSMcCHoz0GDr2kM3eIqNRLcw1VRZTeOa0aVuQNLrLTSuaYMDhJ5wDtLUMJJNU+wvU9ehbg9
 XChQE5IoGfCaYn8AVzSMBhLMeq/NauTWFpnZUTAy370gSl8CWtuhY9DH6YKkU4Pr7I5lqItH
 qhtlgfpKq0ndwkrMg81NfHVxLGOvjz27e5SF0JJuAQCQqM=
IronPort-HdrOrdr: A9a23:kwDN1Ku64flgASkKpK7SikcI7skDSdV00zEX/kB9WHVpmwKj5r
 mTdZUgpGfJYVMqMk3I9urwXZVoLUmsl6KdpLNhXotKPzOGhILLFvAH0WKK+VSJcBEWtNQ86U
 4KSdkYNDSfNykdsS842mWF+hQbreVvPJrGuQ4W9RlQcT0=
X-Talos-CUID: 9a23:CCLcimBUMSsS9E36Ewdm/2c0Hfx0SF7YzyftHW7kEm9KD7LAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3Ap8osvg90opA8ZszmfJDj80iQf4BW/o6nMWQPqs8?=
 =?us-ascii?q?pvcSjFiNBNS/HrSviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,244,1677560400"; 
   d="scan'208";a="106369293"
Date: Tue, 2 May 2023 18:06:08 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Luca Fancellu <luca.fancellu@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>,
	<wei.chen@arm.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>
Subject: Re: [PATCH v6 10/12] xen/tools: add sve parameter in XL configuration
Message-ID: <996db21b-e963-4259-884d-2131c548ca1e@perard>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-11-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230424060248.1488859-11-luca.fancellu@arm.com>

On Mon, Apr 24, 2023 at 07:02:46AM +0100, Luca Fancellu wrote:
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index ddc7b2a15975..1e69dac2c4fa 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -211,6 +213,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>          return ERROR_FAIL;
>      }
>  
> +    /* Parameter is sanitised in libxl__arch_domain_build_info_setdefault */
> +    if (d_config->b_info.arch_arm.sve_vl) {
> +        /* Vector length is divided by 128 in struct xen_domctl_createdomain */
> +        config->arch.sve_vl = d_config->b_info.arch_arm.sve_vl / 128U;
> +    }
> +
>      return 0;
>  }
>  
> @@ -1681,6 +1689,26 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
>      /* ACPI is disabled by default */
>      libxl_defbool_setdefault(&b_info->acpi, false);
>  
> +    /* Sanitise SVE parameter */
> +    if (b_info->arch_arm.sve_vl) {
> +        unsigned int max_sve_vl =
> +            arch_capabilities_arm_sve(physinfo->arch_capabilities);
> +
> +        if (!max_sve_vl) {
> +            LOG(ERROR, "SVE is unsupported on this machine.");
> +            return ERROR_FAIL;
> +        }
> +
> +        if (LIBXL_SVE_TYPE_HW == b_info->arch_arm.sve_vl) {
> +            b_info->arch_arm.sve_vl = max_sve_vl;
> +        } else if (b_info->arch_arm.sve_vl > max_sve_vl) {
> +            LOG(ERROR,
> +                "Invalid sve value: %d. Platform supports up to %u bits",
> +                b_info->arch_arm.sve_vl, max_sve_vl);
> +            return ERROR_FAIL;
> +        }

You still need to check that sve_vl is one of the value from the enum,
or that the value is divisible by 128.

> +    }
> +
>      if (b_info->type != LIBXL_DOMAIN_TYPE_PV)
>          return 0;
>  
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index fd31dacf7d5a..9e48bb772646 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -523,6 +523,27 @@ libxl_tee_type = Enumeration("tee_type", [
>      (1, "optee")
>      ], init_val = "LIBXL_TEE_TYPE_NONE")
>  
> +libxl_sve_type = Enumeration("sve_type", [
> +    (-1, "hw"),
> +    (0, "disabled"),
> +    (128, "128"),
> +    (256, "256"),
> +    (384, "384"),
> +    (512, "512"),
> +    (640, "640"),
> +    (768, "768"),
> +    (896, "896"),
> +    (1024, "1024"),
> +    (1152, "1152"),
> +    (1280, "1280"),
> +    (1408, "1408"),
> +    (1536, "1536"),
> +    (1664, "1664"),
> +    (1792, "1792"),
> +    (1920, "1920"),
> +    (2048, "2048")
> +    ], init_val = "LIBXL_SVE_TYPE_DISABLED")

I'm not sure if I like that or not. Is there a reason to stop at 2048?
It is possible that there will be more value available in the future?

Also this mean that users of libxl (like libvirt) would be supposed to
use LIBXL_SVE_TYPE_1024 for e.g., or use libxl_sve_type_from_string().

Also, it feels weird to me to mostly use numerical value of the enum
rather than the enum itself.

Anyway, hopefully that enum will work fine.

>  libxl_rdm_reserve = Struct("rdm_reserve", [
>      ("strategy",    libxl_rdm_reserve_strategy),
>      ("policy",      libxl_rdm_reserve_policy),

Thanks,

-- 
Anthony PERARD

