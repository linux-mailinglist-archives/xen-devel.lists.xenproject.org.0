Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B334A4B3B
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 17:05:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263192.455818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEZB4-0001cW-U6; Mon, 31 Jan 2022 16:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263192.455818; Mon, 31 Jan 2022 16:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEZB4-0001aL-Oq; Mon, 31 Jan 2022 16:05:14 +0000
Received: by outflank-mailman (input) for mailman id 263192;
 Mon, 31 Jan 2022 16:05:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlUa=SP=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nEZB2-0001aF-UA
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 16:05:12 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9088b258-82af-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 17:05:11 +0100 (CET)
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
X-Inumbo-ID: 9088b258-82af-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643645111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T6aOBZn/yAV3KaOeiqoJjanpT8iqbXRJneiyTm/UPmU=;
  b=VvhD9LhSukvjW4An7VnFsUy7QsxOkVij4FlO0dFzvH7Nw8QWRNNWVnTY
   xRDsrRMLqsxOEFQFGEiFSQ8bdWIlCgQt3Qg6vqJKO0oQ0Nyaud9gYXZ9s
   qFDfg+Q5f7J+aWE7kfYf+ZRuUOy0HoHYJba5TuoxFCLwh57UR/wrsurdU
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: KAtJgznxhHI1xwJknvpk8Gxywm94N2InYg5DeMSmrEZVGWJZGHlP8UTt62QaovrupaIc1gxf2O
 tpSv4bOm0pKbwaEjQp+DbxmZhhcjRH+QVfD2mdXn5ZvO+bmfNTgijbnvJz89ejLSQ4HO7c++ik
 Jt2k+HkC0/2xSoyjwx1tZ8+62et/G1EhnN7nG0zbff+wgU3lAYQObgRHAiLnuMlJH1o24B72am
 c8quzHopv+KMfOwzPIu3pdUBwl7rH0YyM+7eRzKcReRvdUMFVmMmJ03IVCkNIZiSKp6K0F/XAs
 BcslTURd6iMF5LSxa7YcaKrh
X-SBRS: 5.2
X-MesageID: 63144971
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1Gkg9q4sFNj0WvjFxcWergxRtIrAchMFZxGqfqrLsTDasY5as4F+v
 mJJX2vUbv+LYWLxctEnPdm39hlXsZeBydRhSlNrpS9hHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZg2dcw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zz
 +gXqLbhSAsSGpbXk8AgTBxKA3FzFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQRq+CO
 5tGMFKDajyQWzBLY1dOLqgajdWMvGDydwxluHGs8P9fD2/7k1UqjemF3MDuUseRWcxfk0Kcp
 2TH12f0GBcXMJqY0zXt2nCxgu7CmwvrVYRUE6e3ntZUh1mUyn0WGQchf1KxqvmkiWazQ9tab
 UcT/0IGoaEs+WSxQ9L6Xhn+p2SL1jYDX/JAHut87xuCooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YXCX+6qQrDiyETMINmJEbigBJSMH7MPku5oblQ/UQ5BoF6vdszHuMWium
 XbQ9nF43uhNy55Qv0mmwbzZqzWR/IXjHw853SHsRWmB0xx8dp71aqX9vDA38s18BIqeS1CAu
 l0NlM6f8P0CAPmxqcCdfAkeNOr3vqjYaVUwlXYqRsB8rGr1pxZPaKgNuGkWGat/DioTldYFi
 mf3sBgZ2pJcNWDCgURfM9PoUJRCIUQN+L3YuhHogjhmP8IZmOyvpngGiausM4bFyhJEfUYXY
 s/zTCpUJSxGYZmLNRLvLwvn7Zclxzol2UTYTo3hwhKs3NK2PSDJEupVbwPeMLFlvctoRTk5F
 f4FbaNmLD0ECIXDjtT/q9ZPfTjm01BmbXwJlyCnXrHaeVc3cI3QI/TQ3akga+RYc1d9zY/1E
 oWGchYAkjLX3CSfQS3TMywLQO6xAf5X8CxqVQRxbQfA8yVyOu6HsfZAH6bbiJF6roSPO9YuE
 alcEyhBa9wSIgn6F8M1NMel9NI6KEX01Gpj/UONOVACQnKpfCSRkveMQ+cl3HNm4vOfuZRsr
 ru++BncRJZfFQ1uANyPMKCkzk+rvGhbk+V3BhOaLt5WcUTq0Y5rNy2u0aNnf5BScU3OlmmAy
 gKbIRYEvu2R8YU7x8bE2PKfpICzHuogQkcDRzvH7ay7PDXx93a4xdMSS/6BeD3QDTum+Kira
 ehP4ev7NfkLwARDv4ZmSu45xqMi/dr/4bRdy108TnnMal2qDJJmI2WHgpYT5vEcmOcBtFLvC
 EyV+9RcNbGYA+/fEQYcdFg/c+CO9fAIgT2Ov/47F1r3uX1s972dXEQMYxTV0H5BLKF4OZ8Oy
 Ps6vJJE8BS2jxcnP4rUji1Q8GjQfHUMX79+68MfCY7vzAEq1ktDcdrXDSqvuMODbNBFM08LJ
 D6IhfWd2+QAlxSaK3djR2LQ2ed9hIgVvEEYxVAPEF2Fh97Zi6JlxxZW6zk2ElxYwxgvPzif4
 YS325mZ/Zmzwgo=
IronPort-HdrOrdr: A9a23:CXMi96MxVD5H0MBcTtijsMiBIKoaSvp037BN7SBMoH1uE/Bw+P
 rEoB1273XJYVUqNk3I++rtBEDoexq1yXcc2/hzAV7IZmbbUQWTQb1f0Q==
X-IronPort-AV: E=Sophos;i="5.88,331,1635220800"; 
   d="scan'208";a="63144971"
Date: Mon, 31 Jan 2022 16:05:00 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Message-ID: <YfgIrNqGzq7s3Cz0@perard>
References: <20220127160133.11608-1-jane.malalane@citrix.com>
 <20220127160133.11608-3-jane.malalane@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220127160133.11608-3-jane.malalane@citrix.com>

On Thu, Jan 27, 2022 at 04:01:33PM +0000, Jane Malalane wrote:
> diff --git a/docs/man/xl.conf.5.pod.in b/docs/man/xl.conf.5.pod.in
> index df20c08137..2d0a59d019 100644
> --- a/docs/man/xl.conf.5.pod.in
> +++ b/docs/man/xl.conf.5.pod.in
> @@ -107,6 +107,18 @@ Sets the default value for the C<max_grant_version> domain config value.
>  
>  Default: maximum grant version supported by the hypervisor.
>  
> +=item B<assisted_xapic=BOOLEAN>
> +
> +If enabled, domains will use xAPIC hardware assisted emulation by default.
> +
> +Default: enabled.
> +
> +=item B<assisted_x2apic=BOOLEAN>
> +
> +If enabled, domains will use x2APIC hardware assisted emulation by default.
> +
> +Default: enabled.
> +
>  =item B<vif.default.script="PATH">
>  
>  Configures the default hotplug script used by virtual network devices.
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 52f2545498..4d422bef96 100644
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

It seems there's a missing 'return 0' in this function now ;-).

> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index d7a40d7550..2bae6fef62 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -264,7 +264,6 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
>      if (!b_info->event_channels)
>          b_info->event_channels = 1023;
>  
> -    libxl__arch_domain_build_info_setdefault(gc, b_info);

I don't think moving this call later is a good idea. It looks like it's
going to break on ARM at least. Instead, calling libxl_get_physinfo()
earlier should be fine I think.

>      libxl_defbool_setdefault(&b_info->dm_restrict, false);
>  
>      if (b_info->iommu_memkb == LIBXL_MEMKB_DEFAULT)
> @@ -456,15 +455,21 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
>          libxl_defbool_setdefault(&b_info->nested_hvm,               false);
>      }
>  
> -    if (b_info->max_grant_version == LIBXL_MAX_GRANT_DEFAULT) {
> -        libxl_physinfo info;
> +    libxl_physinfo info;
>  
> -        rc = libxl_get_physinfo(CTX, &info);
> -        if (rc) {
> -            LOG(ERROR, "failed to get hypervisor info");
> -            return rc;
> -        }
> +    rc = libxl_get_physinfo(CTX, &info);
> +    if (rc) {
> +        LOG(ERROR, "failed to get hypervisor info");
> +        return rc;
> +    }
>  
> +    rc = libxl__arch_domain_build_info_setdefault(gc, b_info, &info);
> +    if (rc) {
> +        LOG(ERROR, "unable to set domain arch build info defaults");
> +        return rc;
> +    }
> +
> +    if (b_info->max_grant_version == LIBXL_MAX_GRANT_DEFAULT) {
>          if (info.cap_gnttab_v2)
>              b_info->max_grant_version = 2;
>          else if (info.cap_gnttab_v1)
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 42ac6c357b..db5eb0a0b3 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -648,6 +648,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
>                                 ("vuart", libxl_vuart_type),
>                                ])),
>      ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
> +                               ("assisted_xapic", libxl_defbool),
> +                               ("assisted_x2apic", libxl_defbool),

Could you add some LIBXL_HAVE_* macro in libxl.h about those new fields
like you did in the previous patch?

>                                ])),
>      # Alternate p2m is not bound to any architecture or guest type, as it is
>      # supported by x86 HVM and ARM support is planned.
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index 33da51fe89..b257fca756 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -819,11 +825,44 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
>  {
>  }
>  
> -void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> -                                              libxl_domain_build_info *b_info)
> +int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> +                                             libxl_domain_build_info *b_info,
> +                                             const libxl_physinfo *physinfo)
>  {
> +    int rc;
> +    bool assisted_xapic;
> +    bool assisted_x2apic;
> +
>      libxl_defbool_setdefault(&b_info->acpi, true);
>      libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
> +
> +    libxl_defbool_setdefault(&b_info->arch_x86.assisted_xapic, false);
> +    libxl_defbool_setdefault(&b_info->arch_x86.assisted_x2apic, false);
> +
> +    assisted_xapic = libxl_defbool_val(b_info->arch_x86.assisted_xapic);
> +    assisted_x2apic = libxl_defbool_val(b_info->arch_x86.assisted_x2apic);
> +
> +    if ((assisted_xapic || assisted_x2apic) &&
> +        b_info->type == LIBXL_DOMAIN_TYPE_PV)
> +    {
> +        LOG(ERROR, "Interrupt Controller Virtualization not supported for PV");
> +        rc = ERROR_INVAL;
> +        goto out;
> +    }
> +
> +    if ((assisted_xapic && !physinfo->cap_assisted_xapic) ||
> +         (assisted_x2apic && !physinfo->cap_assisted_x2apic))
> +    {
> +        LOG(ERROR, "x%sAPIC hardware supported emulation not available",
> +            assisted_xapic && !physinfo->cap_assisted_xapic ? "" : "2");
> +        rc =  ERROR_INVAL;
> +        goto out;
> +    }

Would it make sens to enable assisted_xapic and assisted_x2apic by
default based on hardware support? That way users of libxl could benefit
from the upgrade without having to enable it. Or maybe that could causes
issues, like maybe on migration?

> +
> +    rc = 0;
> +out:
> +    return rc;
> +
>  }
>  
>  int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
> diff --git a/tools/xl/xl.c b/tools/xl/xl.c
> index 2d1ec18ea3..b97e491c9c 100644
> --- a/tools/xl/xl.c
> +++ b/tools/xl/xl.c
> @@ -57,6 +57,8 @@ int max_grant_frames = -1;
>  int max_maptrack_frames = -1;
>  int max_grant_version = LIBXL_MAX_GRANT_DEFAULT;
>  libxl_domid domid_policy = INVALID_DOMID;
> +int assisted_xapic = 0;
> +int assisted_x2apic = 0;

This seems to contradict the manual which says "Default: enabled".



I think you need one more change in ocaml bindings, its ABI checker
fails. I found the following change to work, hopefully that the right
thing to do:

diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 5b4fe72c8d..0aa957d379 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -239,7 +239,7 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config

                cfg.arch.misc_flags = ocaml_list_to_c_bitmap
                        /* ! x86_arch_misc_flags X86_ none */
-                       /* ! XEN_X86_ XEN_X86_MSR_RELAXED all */
+                       /* ! XEN_X86_ XEN_X86_ASSISTED_X2APIC max */
                        (VAL_MISC_FLAGS);

 #undef VAL_MISC_FLAGS

Thanks,

-- 
Anthony PERARD

