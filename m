Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3154D6D0BC0
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 18:50:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516828.801589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phvSo-000208-TF; Thu, 30 Mar 2023 16:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516828.801589; Thu, 30 Mar 2023 16:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phvSo-0001xx-Q8; Thu, 30 Mar 2023 16:49:26 +0000
Received: by outflank-mailman (input) for mailman id 516828;
 Thu, 30 Mar 2023 16:49:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tzUU=7W=citrix.com=prvs=446aa7e4f=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1phvSn-0001xr-9r
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 16:49:25 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0a6e1d1-cf1a-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 18:49:22 +0200 (CEST)
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
X-Inumbo-ID: d0a6e1d1-cf1a-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680194962;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9I+Qa8/u0JoQK4SkLbQ3emOfSO7UtZyUN3JTfPvNN88=;
  b=OXh5neX0Oh/c8IJIc4LRw8rz8kogI2x7/1kgKBMx+xb+VIOBuhX4uMZw
   DaO9rGhkPB6iXozwrhcyrGuZbHLArETWvwHFu/FmUNfsZtL8WVwKzm7t2
   /Wsf5F+m7ex2C8FNm3KGEKuVam7MdAaWhIdjZ0zFMQ1oVmn5v2Sh9fufB
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104121359
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:pInhz6DR7oYiNRVW/7bjw5YqxClBgxIJ4kV8jS/XYbTApD8m1mZRx
 jEbWTzUMvyLYGH8LtlxaIuw8EgPvcCAy4RnQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhD5gRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw+s15PGpMr
 d8hJiEKTRrZxMSk3p+0Y7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4TWHJ8MxRvJz
 o7A12ajAQshBPrF8wCu2Sr1v/PCkgDDAJ1HQdVU8dY12QbOlwT/EiY+UUawqL+3g0i1VtZbN
 mQd4C9opq83nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjRMcsA8vck6Azkjz
 EaUnsjBDCZq9raSTBq16bqV6ziyNC49JHUHIyQDSGMt+d74qps0iRHJZtlmGa+xyNbyHFnY3
 DSivCU4wbIJgqYj1aqh+kvcqymxvZWPRQkwji3bV3yoxhl0b4mkY8qv81ezxfNJNoOQVFSCl
 HkChcmF7eoKAI2NlSqCW+EEFvei4PPtGDTEjERmBZUJ6zWn8HnldodViAySP28wbJxCI2WwJ
 haO50UIvsQ70GaWgbFfY6m/Ns8olYvZG8XidfqOLfxcfLV+XVrSlM1xXnJ8z1wBgWB1z/5ua
 MfLLZr8ZZoJIf85lWTrHo/xxZdun3ljnj2LGPgX2jz9idKjiGippaDp2bdkRsQw9+u6rQrc6
 L6z3OPamkwEAIUSjsQ6mLP/zGzmzlBhX/gaU+QNKoa+zvNOQQnN8cP5z7I7YJBClK9IjOrO9
 XzVchYGmAKm3CGZdlvaNC4LhFbTsXBX9ypT0csEYz6VN4ULO97zvM/zibNsFVXYyACT5aEtF
 KRUEylxKv9OVi7G61wgUHUJl6Q7LE7DrVvXb0KYjM0XI8YIq/rhpoW1IWMCNUAmUkKKiCfJi
 +T4hl2CG8FfGlQK4QS/QKvH8m5ddEM1wIpaN3Yk6PEKEKkw2OCG8xDMs8I=
IronPort-HdrOrdr: A9a23:+mJdsqyp8DVIODLdoZfkKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-IronPort-AV: E=Sophos;i="5.98,305,1673931600"; 
   d="scan'208";a="104121359"
Date: Thu, 30 Mar 2023 17:49:09 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Luca Fancellu <luca.fancellu@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>,
	<wei.chen@arm.com>, George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Christian Lindig
	<christian.lindig@cloud.com>
Subject: Re: [PATCH v4 09/12] tools: add physinfo arch_capabilities handling
 for Arm
Message-ID: <9804fbab-3e8d-49dc-847b-4804a6de286b@perard>
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
 <20230327105944.1360856-10-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230327105944.1360856-10-luca.fancellu@arm.com>

On Mon, Mar 27, 2023 at 11:59:41AM +0100, Luca Fancellu wrote:
> ---
>  tools/golang/xenlight/helpers.gen.go    |  2 ++
>  tools/golang/xenlight/types.gen.go      |  1 +
>  tools/include/arm-arch-capabilities.h   | 33 +++++++++++++++++++++++++

Could you move that new file into "tools/include/xen-tools/", where
"common-macros.h" is. The top-dir "tools/include" already has a mixture
of installed and internal headers, but most of them are installed. So
the fairly recent "xen-tools" dir which have been introduced to share
macros at build time seems more appropriate for another built-time
macro.

>  tools/include/xen-tools/common-macros.h |  2 ++
> 
> diff --git a/tools/include/arm-arch-capabilities.h b/tools/include/arm-arch-capabilities.h
> new file mode 100644
> index 000000000000..46e876651052
> --- /dev/null
> +++ b/tools/include/arm-arch-capabilities.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 ARM Ltd.
> + */
> +
> +#ifndef ARM_ARCH_CAPABILITIES_H
> +#define ARM_ARCH_CAPABILITIES_H
> +
> +/* Tell the Xen public headers we are a user-space tools build. */
> +#ifndef __XEN_TOOLS__
> +#define __XEN_TOOLS__ 1

Somehow, this doesn't seems appropriate in this header. This macro
should instead be set on the command line. Any reason you've added this
in the header?

> +#endif
> +
> +#include <stdint.h>
> +#include <xen/sysctl.h>
> +
> +#include <xen-tools/common-macros.h>
> +
> +static inline
> +unsigned int arch_capabilities_arm_sve(unsigned int arch_capabilities)
> +{
> +#if defined(__aarch64__)
> +    unsigned int sve_vl = MASK_EXTR(arch_capabilities,
> +                                    XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
> +
> +    /* Vector length is divided by 128 before storing it in arch_capabilities */
> +    return sve_vl * 128U;
> +#else
> +    return 0;
> +#endif
> +}
> +
> +#endif /* ARM_ARCH_CAPABILITIES_H */
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index c10292e0d7e3..fd31dacf7d5a 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -1133,6 +1133,7 @@ libxl_physinfo = Struct("physinfo", [
>      ("cap_vpmu", bool),
>      ("cap_gnttab_v1", bool),
>      ("cap_gnttab_v2", bool),
> +    ("arch_capabilities", uint32),

This additional field needs a new LIBXL_HAVE_ macro in "libxl.h".

>      ], dir=DIR_OUT)
>  
>  libxl_connectorinfo = Struct("connectorinfo", [
> diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
> index 35901c2d63b6..254d3b5dccd2 100644
> --- a/tools/python/xen/lowlevel/xc/xc.c
> +++ b/tools/python/xen/lowlevel/xc/xc.c
> @@ -7,6 +7,7 @@
>  #define PY_SSIZE_T_CLEAN
>  #include <Python.h>
>  #define XC_WANT_COMPAT_MAP_FOREIGN_API
> +#include <arm-arch-capabilities.h>

Could you add this header ...

>  #include <xenctrl.h>
>  #include <xenguest.h>
>  #include <fcntl.h>
> @@ -22,8 +23,6 @@
>  #include <xen/hvm/hvm_info_table.h>
>  #include <xen/hvm/params.h>
>  
> -#include <xen-tools/common-macros.h>
> -

... here, instead?

Also, I think #include common-macros, can stay.

>  /* Needed for Python versions earlier than 2.3. */
>  #ifndef PyMODINIT_FUNC
>  #define PyMODINIT_FUNC DL_EXPORT(void)
> @@ -897,7 +896,7 @@ static PyObject *pyxc_physinfo(XcObject *self)
>      if ( p != virt_caps )
>        *(p-1) = '\0';
>  
> -    return Py_BuildValue("{s:i,s:i,s:i,s:i,s:l,s:l,s:l,s:i,s:s,s:s}",
> +    return Py_BuildValue("{s:i,s:i,s:i,s:i,s:l,s:l,s:l,s:i,s:s,s:s,s:i}",
>                              "nr_nodes",         pinfo.nr_nodes,
>                              "threads_per_core", pinfo.threads_per_core,
>                              "cores_per_socket", pinfo.cores_per_socket,
> @@ -907,7 +906,10 @@ static PyObject *pyxc_physinfo(XcObject *self)
>                              "scrub_memory",     pages_to_kib(pinfo.scrub_pages),
>                              "cpu_khz",          pinfo.cpu_khz,
>                              "hw_caps",          cpu_cap,
> -                            "virt_caps",        virt_caps);
> +                            "virt_caps",        virt_caps,
> +                            "arm_sve_vl",
> +                              arch_capabilities_arm_sve(pinfo.arch_capabilities)

arch_capabilities_arm_sve() returns an "unsigned int", but the format is
"i", which seems to be an "int". Shouldn't the format be "I" instead?

https://docs.python.org/3/c-api/arg.html#c.Py_BuildValue

> +                        );
>  }
>  
>  static PyObject *pyxc_getcpuinfo(XcObject *self, PyObject *args, PyObject *kwds)
> diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
> index 712b7638b013..bf18ba2449ef 100644
> --- a/tools/xl/xl_info.c
> +++ b/tools/xl/xl_info.c
> @@ -14,6 +14,7 @@
>  
>  #define _GNU_SOURCE
>  
> +#include <arm-arch-capabilities.h>

Any reason reason to have this header first?
I feel like private headers should come after public ones, so here, this
include would be added between <libxlutil.h> and "xl.h".

>  #include <fcntl.h>
>  #include <inttypes.h>
>  #include <stdlib.h>
> @@ -224,6 +225,13 @@ static void output_physinfo(void)
>           info.cap_gnttab_v2 ? " gnttab-v2" : ""
>          );
>  
> +    /* Print arm SVE vector length only on ARM platforms */
> +#if defined(__aarch64__)
> +    maybe_printf("arm_sve_vector_length  : %u\n",
> +         arch_capabilities_arm_sve(info.arch_capabilities)
> +        );
> +#endif
> +
>      vinfo = libxl_get_version_info(ctx);
>      if (vinfo) {
>          i = (1 << 20) / vinfo->pagesize;

Thanks,

-- 
Anthony PERARD

