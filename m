Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6CF5AF6F2
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:37:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400057.641607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgFX-0008O7-BN; Tue, 06 Sep 2022 21:36:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400057.641607; Tue, 06 Sep 2022 21:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgFX-0008L8-8Z; Tue, 06 Sep 2022 21:36:51 +0000
Received: by outflank-mailman (input) for mailman id 400057;
 Tue, 06 Sep 2022 21:36:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+HoH=ZJ=citrix.com=prvs=2410c4419=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oVgFW-0008L2-0i
 for xen-devel@lists.xen.org; Tue, 06 Sep 2022 21:36:50 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 214c4654-2dff-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 18:15:35 +0200 (CEST)
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
X-Inumbo-ID: 214c4654-2dff-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662480935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dC3wKAwJzVhdLJUzJPu+iEcsBHvMOMD1jcKQFpuYgNo=;
  b=GZO0wmUSQKly795LS7IwQfQn6QC0ZPvC7v/hEuZiaXshi+qNT9AYWNsD
   t8yYhMBaK/az2ErDao0BmfwAsvwlP4TAvUll0Z647T/bj40Eeguv4htmQ
   9jcCcjuop34VPygtycBiHunhYGJ8Xzh4SC5I2noEEj+0zi7FwyMrWb7Uy
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 79862586
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KUtKB6KVwXAqOJLaFE+RkJIlxSXFcZb7ZxGr2PjKsXjdYENSgTxWn
 2IZWDyPPP7cMWT0KtAgOd6w8kJUsJDUz4ViS1BlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYzdJ5xYuajhOs/Pb9ks11BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TE5O5BBWEEJq0jy91vA3BK8
 M0hMmAuYUXW7w626OrTpuhEg80iKI/gPZ8Fu2EmxjbcZRokacmdGeOQv4YehWpuwJAVdRrdT
 5NxhT5HZRLcYxpJKxEPBYg3huuAjXjjaTxI7lmSoMLb5kCMnVwviuW9brI5fPS2XdpbmmCcr
 VuBoWPgLDQrEsG45ROspyfEaujnwnqgBdN6+KeD3vlujV6I2n0ICDUZUFK6pb+yjUvWc9deK
 EFS+i0qqKUp3EiqSNDnWFu/unHslhsVR9pRHvB88AaM0KvZ+S6dB24NVDkHY9sj3Oc0WDgr2
 1mhj97vQzt1v9W9S32H8ayPhSivIiVTJmgHDQcbSSMV7t+lp5s85jrRT9BoHaipyNLoGC3sx
 CyiqCk4jq8Uy8kR2M2T7V3Bxj6huJXNZgo0/RnMGHKo6EV+foHNT5Kp81XA7bBDMYOQVHGFv
 X4Ngc/Y6/oBZbmWiCGDSeMKWqq17vyINDndh19HD5gl9jK9vXWkeOh46TVzNAFjP8ACdDLBZ
 E7VsBlWophJMxOCdrNtap62EIEmwLbIEsygUvHPcsEIZpl3fRWAuiZ0aiatM3vFyRZ21/tlY
 NHCLJjqXS1y5blbICSeYPwy2J8Z3QAF9FjLR4H/yiWey+q9ayvAIVsaC2diftzV/Yvd/luPq
 4YEZpXUo/lMeLagO3eKqOb/OXhPdCFmXs6u9qS7Y8bZemJb9Hcd5+g9KF/LU6hshOxrm+jB5
 RlRsWcImQOk1RUrxehnA02PiY8Dvr4l9xrXxQR2YT6VN4ELOO5DFps3eZotZqUA/+d+1/NyR
 PRtU5zeXK4TEm6WpG9HMsCVQGlemPOD3FvmAsZYSGJnI84Iq/LhobcIgTcDBAFRV3Hq5KPSU
 pWr1x/BQIprejmO+P3+Mav3p25dSFBHx4qeqWOUfYQIEKgtmaA2QxHMYggfeptTdkucmWrDh
 257w34w/IHwnmP8y/GR7YjskmtjO7EW8pZyd4UD0YuLCA==
IronPort-HdrOrdr: A9a23:BzwtNqq258buRqSaUzDUF9waV5opeYIsimQD101hICG8cqSj9v
 xGuM5rsiMc6QxhPE3I9urtBEDtexzhHNtOkO8s1NSZLWzbUQmTXeJfBOLZqlWKcUDDH6xmpM
 VdmsBFeaTN5DNB7foSjjPXL+od
X-IronPort-AV: E=Sophos;i="5.93,294,1654574400"; 
   d="scan'208";a="79862586"
Date: Tue, 6 Sep 2022 17:15:21 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>, Mike Holmes
	<mike.holmes@linaro.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH V5 1/6] libxl: Add support for Virtio I2C device
Message-ID: <YxdyGXxois95bNdI@perard.uk.xensource.com>
References: <cover.1661159474.git.viresh.kumar@linaro.org>
 <8b47d98cec83ca33a2b409c9371356820dd91b7a.1661159474.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8b47d98cec83ca33a2b409c9371356820dd91b7a.1661159474.git.viresh.kumar@linaro.org>

Hi Viresh,

On Mon, Aug 22, 2022 at 02:45:13PM +0530, Viresh Kumar wrote:
> This patch adds basic support for configuring and assisting virtio-mmio
> based virtio-i2c backend (emualator) which is intended to run out of
> Qemu and could be run in any domain.

"to run out of Qemu" -> this is ambiguous. It can both mean that
virtio-i2c is provided by QEMU and also that virtio-i2c is provided by a
different piece of software.

> An example of domain configuration for Virtio I2c:

I believe a proper spelling is "I2C", not "I2c" which looks weird to me.
> i2c = [ "" ]

Is this doing something meaningful (with the whole series applied)?

> Please note, this patch is not enough for virtio-i2c to work on Xen
> (Arm), as for every Virtio device we need to allocate Virtio MMIO params
> (IRQ and memory region) and pass them to the backend, also update Guest
> device-tree. A subsequent patch will add these missing bits. For the
> current patch, the default "irq" and "base" are just written to the
> Xenstore.

Is having irq/base set in a different patch still useful? While it was
probably useful to do this way on the virtio-disk series, it doesn't
seems useful anymore.

> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  tools/golang/xenlight/helpers.gen.go      | 108 +++++++++++
>  tools/golang/xenlight/types.gen.go        |  27 +++

Those .gen.go files aren't up-to-date. You could just add a note after
a '---' line to tell the committer to regenerate them, or make sure to
regenerate them before a new submission.

>  tools/include/libxl.h                     |  32 +++
>  tools/include/libxl_utils.h               |   3 +
>  tools/libs/light/Makefile                 |   1 +
>  tools/libs/light/libxl_create.c           |  13 ++
>  tools/libs/light/libxl_dm.c               |  19 +-
>  tools/libs/light/libxl_i2c.c              | 226 ++++++++++++++++++++++
>  tools/libs/light/libxl_internal.h         |   1 +
>  tools/libs/light/libxl_types.idl          |  24 +++
>  tools/libs/light/libxl_types_internal.idl |   1 +
>  tools/ocaml/libs/xl/genwrap.py            |   1 +
>  tools/ocaml/libs/xl/xenlight_stubs.c      |   1 +
>  tools/xl/Makefile                         |   2 +-

Could you take care of the change in `xl` in a separate patch?
Also, we will want documentation, at least changes in the man pages about
the new commands and configurations.

>  tools/xl/xl.h                             |   3 +
>  tools/xl/xl_cmdtable.c                    |  15 ++
>  tools/xl/xl_i2c.c                         | 142 ++++++++++++++
>  tools/xl/xl_parse.c                       |  80 ++++++++
>  tools/xl/xl_parse.h                       |   1 +
>  tools/xl/xl_sxp.c                         |   2 +
>  20 files changed, 699 insertions(+), 3 deletions(-)
>  create mode 100644 tools/libs/light/libxl_i2c.c
>  create mode 100644 tools/xl/xl_i2c.c
> 
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 2321a648a59a..ab18c0b8c794 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -829,6 +829,15 @@ typedef struct libxl__ctx libxl_ctx;
>   */
>  #define LIBXL_HAVE_BUILDINFO_VKB_DEVICE 1
>  
> +/*
> + * LIBXL_HAVE_BUILDINFO_I2C_DEVICE
> + *
> + * If this is defined, then the libxl_domain_build_info structure will
> + * contain a boolean hvm.i2c_device which instructs libxl whether to include
> + * a i2c at build time or not.

"at built time" ? Maybe "at guest creation time" would be a bit more
descriptive, or "domain build time".

Could you add that "i2cs" is available in "libxl_domain_config" as well?
Or maybe a more generic description and macro name speaking about the
availability of I2C.

> + */
> +#define LIBXL_HAVE_BUILDINFO_I2C_DEVICE 1

Also, can this be put at the end of one of the LIBXL_HAVE_* list? Around
line 1444, just before typedef **libxl_string_list would probably be
better.

> +
>  /*
>   * LIBXL_HAVE_BUILDINFO_USBDEVICE_LIST
>   *
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index b9dd2deedf13..84fe9f80c8fe 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -375,6 +375,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
>          libxl_defbool_setdefault(&b_info->u.hvm.altp2m,             false);
>          libxl_defbool_setdefault(&b_info->u.hvm.usb,                false);
>          libxl_defbool_setdefault(&b_info->u.hvm.vkb_device,         true);
> +        libxl_defbool_setdefault(&b_info->u.hvm.i2c_device,         true);
>          libxl_defbool_setdefault(&b_info->u.hvm.xen_platform_pci,   true);
>  
>          libxl_defbool_setdefault(&b_info->u.hvm.spice.enable, false);
> @@ -1753,6 +1754,7 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
>          libxl__device_console console;
>          libxl__device device;
>          libxl_device_vkb vkb;
> +        libxl_device_i2c i2c;
>  
>          init_console_info(gc, &console, 0);
>          console.backend_domid = state->console_domid;
> @@ -1765,6 +1767,12 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
>              libxl_device_vkb_dispose(&vkb);
>          }
>  
> +        if (libxl_defbool_val(d_config->b_info.u.hvm.i2c_device)) {
> +            libxl_device_i2c_init(&i2c);
> +            libxl__device_add(gc, domid, &libxl__i2c_devtype, &i2c);
> +            libxl_device_i2c_dispose(&i2c);

So, every HVM guest are going to get an I2C device? I don't think that
make sense, especially on x86, or even on Arm.

> +        }
> +
>          dcs->sdss.dm.guest_domid = domid;
>          if (libxl_defbool_val(d_config->b_info.device_model_stubdomain))
>              libxl__spawn_stub_dm(egc, &dcs->sdss);
> @@ -1797,6 +1805,11 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
>                                &d_config->vkbs[i]);
>          }
>  
> +        for (i = 0; i < d_config->num_i2cs; i++) {
> +            libxl__device_add(gc, domid, &libxl__i2c_devtype,
> +                              &d_config->i2cs[i]);
> +        }
> +
>          if (d_config->b_info.arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART) {
>              init_console_info(gc, &vuart, 0);
>              vuart.backend_domid = state->console_domid;
> diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> index fc264a3a13a6..362c0596f497 100644
> --- a/tools/libs/light/libxl_dm.c
> +++ b/tools/libs/light/libxl_dm.c
> @@ -2112,7 +2112,8 @@ static void libxl__dm_vifs_from_hvm_guest_config(libxl__gc *gc,
>  static int libxl__vfb_and_vkb_from_hvm_guest_config(libxl__gc *gc,
>                                          const libxl_domain_config *guest_config,
>                                          libxl_device_vfb *vfb,
> -                                        libxl_device_vkb *vkb)
> +                                        libxl_device_vkb *vkb,
> +                                        libxl_device_i2c *i2c)

That function is about taking care of adding Xen PV virtual framebuffer
and keyboard to a guest. What is the relationship with between that and
I2C?

>  {
>      const libxl_domain_build_info *b_info = &guest_config->b_info;
>  
> diff --git a/tools/libs/light/libxl_i2c.c b/tools/libs/light/libxl_i2c.c
> new file mode 100644
> index 000000000000..2c46351ce3a4
> --- /dev/null
> +++ b/tools/libs/light/libxl_i2c.c
> @@ -0,0 +1,226 @@
> +/*
> + * Copyright (C) 2022 Linaro Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU Lesser General Public License as published
> + * by the Free Software Foundation; version 2.1 only. with the special
> + * exception on linking described in file LICENSE.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU Lesser General Public License for more details.
> + */
> +
> +#include "libxl_internal.h"
> +
> +static int libxl__device_i2c_setdefault(libxl__gc *gc, uint32_t domid,
> +                                        libxl_device_i2c *i2c, bool hotplug)
> +{
> +    if (i2c->backend_type != LIBXL_I2C_BACKEND_VIRTIO) {
> +        i2c->backend_type = LIBXL_I2C_BACKEND_VIRTIO;
> +    }
> +
> +    return libxl__resolve_domid(gc, i2c->backend_domname, &i2c->backend_domid);
> +}
> +
> +static int libxl__device_i2c_dm_needed(void *e, uint32_t domid)
> +{
> +    libxl_device_i2c *elem = e;
> +
> +    return elem->backend_type == LIBXL_I2C_BACKEND_VIRTIO;

I'm not sure I understand the result of this function. Is QEMU needed
to present VirtIO I2C devices to a guest?

> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index d634f304cda2..014a3ea8364c 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -278,6 +278,10 @@ libxl_vkb_backend = Enumeration("vkb_backend", [
>      (2, "LINUX")
>      ])
>  
> +libxl_i2c_backend = Enumeration("i2c_backend", [
> +    (0, "VIRTIO")

Could you start with 1 rather than 0? This will allow libxl to find out
if the backend have been set or if an application let libxl choose which
backend is more appropriate.

> +    ])
> +
>  libxl_passthrough = Enumeration("passthrough", [
>      (0, "default"),
>      (1, "disabled"),
> @@ -626,6 +630,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>                                         # - "mouse" for PS/2 protocol relative mouse
>                                         ("usbdevice",        string),
>                                         ("vkb_device",       libxl_defbool),
> +                                       ("i2c_device",       libxl_defbool),

How is "i2c_device" useful? Would "i2cs" in libxl_domain_config be
enough?


>                                         ("soundhw",          string),
>                                         ("xen_platform_pci", libxl_defbool),
>                                         ("usbdevice_list",   libxl_string_list),
> diff --git a/tools/xl/Makefile b/tools/xl/Makefile
> index b7f439121a3a..06801962f11e 100644
> --- a/tools/xl/Makefile
> +++ b/tools/xl/Makefile
> @@ -23,7 +23,7 @@ XL_OBJS += xl_vtpm.o xl_block.o xl_nic.o xl_usb.o
>  XL_OBJS += xl_sched.o xl_pci.o xl_vcpu.o xl_cdrom.o xl_mem.o
>  XL_OBJS += xl_info.o xl_console.o xl_misc.o
>  XL_OBJS += xl_vmcontrol.o xl_saverestore.o xl_migrate.o
> -XL_OBJS += xl_vdispl.o xl_vsnd.o xl_vkb.o
> +XL_OBJS += xl_vdispl.o xl_vsnd.o xl_vkb.o xl_i2c.o

Could you add xl_i2c.o in a new line instead?

>  
>  $(XL_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
>  $(XL_OBJS): CFLAGS += $(CFLAGS_XL)
> diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
> index 35182ca19630..c409ab1578d4 100644
> --- a/tools/xl/xl_cmdtable.c
> +++ b/tools/xl/xl_cmdtable.c
> @@ -406,6 +406,21 @@ const struct cmd_spec cmd_table[] = {
>        "Destroy a domain's virtual keyboard device",
>        "<Domain> <DevId>",
>      },
> +    { "i2c-attach",
> +      &main_i2cattach, 1, 1,
> +      "Create a new virtual i2c device",
> +      "<Domain> <i2c-spec-component(s)>...",

Is i2c-attach going to work? It seems that an i2c device is presented to
the guest via the device tree, but I don't think it can be modified on
the fly once the guest have booted. Is there i2c device hotplug?

> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 1b5381cef033..b91ffba14d40 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -2583,6 +2657,7 @@ void parse_config_data(const char *config_source,
>          if (vnc_enabled) {
>              libxl_device_vfb *vfb;
>              libxl_device_vkb *vkb;
> +            libxl_device_i2c *i2c;

How is I2C related to VNC?

>  
>              vfb = ARRAY_EXTEND_INIT(d_config->vfbs, d_config->num_vfbs,
>                                      libxl_device_vfb_init);
> diff --git a/tools/xl/xl_sxp.c b/tools/xl/xl_sxp.c
> index 359a0015709e..a44c765aa515 100644
> --- a/tools/xl/xl_sxp.c
> +++ b/tools/xl/xl_sxp.c
> @@ -140,6 +140,8 @@ void printf_info_sexp(int domid, libxl_domain_config *d_config, FILE *fh)
>          fprintf(fh, "\t\t\t(usbdevice %s)\n", b_info->u.hvm.usbdevice);
>          fprintf(fh, "\t\t\t(vkb_device %s)\n",
>                 libxl_defbool_to_string(b_info->u.hvm.vkb_device));
> +        fprintf(fh, "\t\t\t(i2c_device %s)\n",
> +               libxl_defbool_to_string(b_info->u.hvm.i2c_device));

There is a notice on the printf_info_sexp() function:

    /* In general you should not add new output to this function since it
     * is intended only for legacy use.
     */
    void printf_info_sexp(int domid, libxl_domain_config *d_config, FILE *fh)

Could you explain why this function is been modified? If not, there's
probably no modification needed.

>          fprintf(fh, "\t\t)\n");
>          break;
>      case LIBXL_DOMAIN_TYPE_PV:

Thanks,

-- 
Anthony PERARD

