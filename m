Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A02684C459E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 14:14:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279085.476626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNaQ3-0005Fj-9K; Fri, 25 Feb 2022 13:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279085.476626; Fri, 25 Feb 2022 13:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNaQ3-0005DS-6H; Fri, 25 Feb 2022 13:13:59 +0000
Received: by outflank-mailman (input) for mailman id 279085;
 Fri, 25 Feb 2022 13:13:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNaQ1-0005DJ-SF
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 13:13:57 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c828cb23-963c-11ec-8eb8-a37418f5ba1a;
 Fri, 25 Feb 2022 14:13:55 +0100 (CET)
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
X-Inumbo-ID: c828cb23-963c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645794835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v2qxe5P4S0hcUcJFEXE67qh405OTQnralKQirE0QE3I=;
  b=PGv+Tetzo+dwR7v77MnvdEzQ/06Zcy2g36SM3W959feJ/4mbwVgupQNU
   VXzsRFT+a7iO4LjTu8wueKSpx23Pnkl93YfRdfSZWMWBc4zdbNemfULXy
   8bJsbJIQ0g/9Q1TdvmlhB3Z4lCDYNNMk6nz3bvhE+jhi7f/FsnqzEffR8
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64880166
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nkt3Qazwm19eGK5jniN6t+fVxirEfRIJ4+MujC+fZmUNrF6WrkUDx
 2QeWT2PPK7cYmfzc413bt+ypkgHu57dyoA1QAZuqyAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYy24XhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplh6KcbQZxH6D1hMsYbBd5D35sP6N70eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6AO
 5pJMWMxMnwsZTVMI3kzNbwEw96Oj3/YcGd5lQLO/qoetj27IAtZj+G2bYu9lsaxbd5Ogk+Sq
 2bC/mL4KhIXLtqSzXyC6H3Eru3SmSL2XqoCGbv+8eRl6HWtwWgUBAwTREGMi/CzgU6jWPpSM
 0URvCEpqMAa+EW1Q/HnUha/oXrCuQQTM/JPF8Uq5QfLzbDbiy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313rWeoC62OCMVBXQffiJCRgwAi/Hhr5s0lQnnVct4Hei+ididJN3r6
 2nU9m5k3exV1JNVkfXglbzav96yjqr3Yio0viTaZ36K6zx3RZL6dY6m1HGOuJ6sM72lZlWGu
 XEFne2X4+YPEYyBmUSxfQkdIF26z63baWOB2DaDC7Fkrm3woCD7Iei89RkjfB8BDyoSRdP+j
 KY/Uyt17YQbAnalZLQfj2mZW5VzlviI+TgIu5npgjtyjnpZKF7vEMJGPxf4M4XRfK4Ey/BX1
 XCzK5vEMJriIf47pAdavs9EuVPR+ggwxHnIWbfwxAm93LyVaRa9EOlZbQTSN7xktPvc+G05F
 uqz0ePQmn2zt8WkP0HqHXM7dwhWfRDX+7iswyCoSgJzClU/QzxwYxMg6bggZ5Zkj8xoehTgp
 RmAtrtj4AOn3xXvcFzSAlg6Me+Hdcsv/BoTYH13VX71iidLXGpaxPpGH3fBVeJ8r7ILID8dZ
 6RtRvhs9dwUEmWXo2lGNMKlxGGgHTzy7T+z0+OeSGBXV/Zdq8bho7cIoiOHGPEyMxeK
IronPort-HdrOrdr: A9a23:rKYDnKkvM1UiWmRIRSXRFwLR4jLpDfLW3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRUdcLW7UpVoLkmyyXcY2+cs1NSZLWzbUQmTXeJfBOLZqlWNJ8SXzIVgPM
 xbAspD4bPLbGSTjazBkXSF+9RL+qj6zEh/792usEuETmtRGt9dBx8SMHf9LqXvLjM2fqbQEv
 Cnl6x6jgvlQ1s7ROKhCEIIWuDSzue77q4PMXY9dmcaABDlt0LR1ILH
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64880166"
Date: Fri, 25 Feb 2022 13:13:49 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Message-ID: <YhjWDZh3kUq1WSHd@perard.uk.xensource.com>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
 <20220218172943.12182-3-jane.malalane@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220218172943.12182-3-jane.malalane@citrix.com>

On Fri, Feb 18, 2022 at 05:29:43PM +0000, Jane Malalane wrote:
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 333ffad38d..1c83cae711 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -535,6 +535,13 @@
>  #define LIBXL_HAVE_PHYSINFO_ASSISTED_APIC 1
>  
>  /*
> + * LIBXL_HAVE_ASSISTED_APIC indicates that libxl_domain_build_info has
> + * assisted_x{2}apic fields, for enabling hardware assisted virtualization for

Could you spell out both "assisted_xapic and assisted_x2apic" as that
would allow for grep to find both string.

> + * x{2}apic per domain.
> + */
> +#define LIBXL_HAVE_ASSISTED_APIC 1
> +
> +/*
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 39fdca1b49..ba5b8f433f 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -1384,8 +1384,9 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
>      }
>  }
>  
> -void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> -                                              libxl_domain_build_info *b_info)
> +int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> +                                             libxl_domain_build_info *b_info,
> +                                             const libxl_physinfo *physinfo)
>  {
>      /* ACPI is disabled by default */
>      libxl_defbool_setdefault(&b_info->acpi, false);
> @@ -1399,6 +1400,8 @@ void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,

There is another return in this function, which want to return 0 rather
than void.

>      memset(&b_info->u, '\0', sizeof(b_info->u));
>      b_info->type = LIBXL_DOMAIN_TYPE_INVALID;
>      libxl_domain_build_info_init_type(b_info, LIBXL_DOMAIN_TYPE_PVH);
> +
> +    return 0;
>  }
>  
>  int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index e0a06ecfe3..c377d13b19 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -819,11 +827,27 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
>  {
>  }
>  
> -void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> -                                              libxl_domain_build_info *b_info)
> +int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> +                                             libxl_domain_build_info *b_info,
> +                                             const libxl_physinfo *physinfo)
>  {
>      libxl_defbool_setdefault(&b_info->acpi, true);
>      libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
> +
> +    if (b_info->type != LIBXL_DOMAIN_TYPE_PV) {
> +        libxl_defbool_setdefault(&b_info->arch_x86.assisted_xapic,
> +                             physinfo->cap_assisted_xapic);
> +        libxl_defbool_setdefault(&b_info->arch_x86.assisted_x2apic,
> +                             physinfo->cap_assisted_x2apic);
> +    }
> +
> +    else if (!libxl_defbool_is_default(b_info->arch_x86.assisted_xapic) ||

This "else" needs to be on the same line as the "}" 2 lines above.

> +             !libxl_defbool_is_default(b_info->arch_x86.assisted_x2apic)) {
> +        LOG(ERROR, "Interrupt Controller Virtualization not supported for PV");
> +        return ERROR_INVAL;
> +    }
> +
> +    return 0;

Thanks,

-- 
Anthony PERARD

