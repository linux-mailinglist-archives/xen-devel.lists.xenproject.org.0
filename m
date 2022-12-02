Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7FE6408C6
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 15:53:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452072.709901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p17Oz-0008BL-Vs; Fri, 02 Dec 2022 14:52:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452072.709901; Fri, 02 Dec 2022 14:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p17Oz-00088c-T2; Fri, 02 Dec 2022 14:52:33 +0000
Received: by outflank-mailman (input) for mailman id 452072;
 Fri, 02 Dec 2022 14:52:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qmEy=4A=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1p17Oy-00088T-HT
 for xen-devel@lists.xen.org; Fri, 02 Dec 2022 14:52:32 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f11d8297-7250-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 15:52:30 +0100 (CET)
Received: by mail-pl1-x636.google.com with SMTP id a9so4828058pld.7
 for <xen-devel@lists.xen.org>; Fri, 02 Dec 2022 06:52:29 -0800 (PST)
Received: from [10.17.77.118] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 6-20020a170902c20600b00186ff402508sm5637358pll.281.2022.12.02.06.52.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 06:52:27 -0800 (PST)
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
X-Inumbo-ID: f11d8297-7250-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvDlJNE4khpzbeXd8Arwppb2lZFIkmPmPHR73vMtdFo=;
        b=Sa+3vuLXdp7DeRRo885L/Ea1sk3sO+HHHWGhsKhUzm3ufZlxBM8+CQnWN6K/5ivPwX
         +wc+udIQgxmEhZcX1nPQwkXvCsidnJSfXQJ7l5SBD7DYf/S2ywZs4C/Sm8Ppk7UsrBxb
         SglBo7hnsN8XenMzZ0rqK3bGVpnY/BS2WNDh47rM8T5vXXahj2uQYOhyqLixMb18ZRxX
         GoW4IGfzc8lwoU/W4GXYC4MM6nrFtcOoPlgp/08ZBYhE82e/xFwKJ0tntZ4BaaDsF1gS
         V7+BFknMXp2Zs7ceYoaPncjTuNNss/p4DrK5OEQ7751wtJvm69Ig5NdGxFsDEwJFqehf
         PUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zvDlJNE4khpzbeXd8Arwppb2lZFIkmPmPHR73vMtdFo=;
        b=wb5kVQ03nw98QbC9XgGGb/pwTl8iko5AnKn0UOYNcdGm/kHGIljQ3IkGMntp01WZ2w
         HI4Ocvqa8FH4sMoCtqaQ38fb7e7iUqe7KmlCA814aviErZEntF3o0527Dk4PfUvg39Ko
         kk86x4BHYIWwls6WEpU6P+ltyeqfg2OxJZEja12HhrVka886rEmBnBeaSmrrQ2hWgrLp
         4qFSDITvmOvGu8KbFVWqrIDAKYrlPILne+BYPWbaXOniihzs6UvRXeDkRZ5re4MAlBVO
         EGCQgfYVSm1cefiKksQ8/VGFzuVpqDb8Yu/uOlhYeFAS73XWtNNZFMdy44oRqgg1UfRp
         okXg==
X-Gm-Message-State: ANoB5plVEMYWM4Rx/5H1JBUnsOANIsXhvXp3acmzzgAEuSsslvfQc2IL
	S35KkfQlMf2fZIJTRO8DavE=
X-Google-Smtp-Source: AA0mqf4R7N/lveRackXaWApG3/rZ6HIWQSsHzqmtGVRykTd+FvTg81RYZdj2HhouJSW8+EoFEM8JyA==
X-Received: by 2002:a17:90a:6582:b0:219:2638:42d0 with SMTP id k2-20020a17090a658200b00219263842d0mr2848403pjj.186.1669992747787;
        Fri, 02 Dec 2022 06:52:27 -0800 (PST)
Message-ID: <6a546552-d71d-a262-5981-8058dc37ae26@gmail.com>
Date: Fri, 2 Dec 2022 16:52:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V6 1/3] libxl: Add support for generic virtio device
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xen.org, Julien Grall
 <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <cover.1667906228.git.viresh.kumar@linaro.org>
 <f1dc91669df27705c25a1f3018427c2db77b32a6.1667906228.git.viresh.kumar@linaro.org>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <f1dc91669df27705c25a1f3018427c2db77b32a6.1667906228.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08.11.22 13:23, Viresh Kumar wrote:


Hello Viresh

[sorry for the possible format issues if any]


> This patch adds basic support for configuring and assisting generic
> Virtio backend which could run in any domain.
> 
> An example of domain configuration for mmio based Virtio I2C device is:
> virtio = ["type=virtio,device22,transport=mmio"]
> 
> Also to make this work on Arm, allocate Virtio MMIO params (IRQ and
> memory region) and pass them to the backend. Update guest device-tree as
> well to create a DT node for the Virtio devices.


Some NITs regarding the commit description:
1. Besides making generic things current patch also adds i2c/gpio device 
nodes, I would mention that in the description.
2. I assume current patch is not enough to make this work on Arm, at 
least the subsequent patch is needed, I would mention that as well.
3. I understand where "virtio,device22"/"virtio,device29" came from, but 
I think that links to the corresponding device-tree bindings should be 
mentioned here (and/or maybe in the code).



> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   tools/libs/light/Makefile                 |   1 +
>   tools/libs/light/libxl_arm.c              |  89 +++++++++++++++
>   tools/libs/light/libxl_create.c           |   5 +
>   tools/libs/light/libxl_internal.h         |   1 +
>   tools/libs/light/libxl_types.idl          |  29 +++++
>   tools/libs/light/libxl_types_internal.idl |   1 +
>   tools/libs/light/libxl_virtio.c           | 127 ++++++++++++++++++++++
>   7 files changed, 253 insertions(+)
>   create mode 100644 tools/libs/light/libxl_virtio.c
> 
> diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
> index 374be1cfab25..4fddcc6f51d7 100644
> --- a/tools/libs/light/Makefile
> +++ b/tools/libs/light/Makefile
> @@ -106,6 +106,7 @@ OBJS-y += libxl_vdispl.o
>   OBJS-y += libxl_pvcalls.o
>   OBJS-y += libxl_vsnd.o
>   OBJS-y += libxl_vkb.o
> +OBJS-y += libxl_virtio.o
>   OBJS-y += libxl_genid.o
>   OBJS-y += _libxl_types.o
>   OBJS-y += libxl_flask.o
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index b4928dbf673c..f33c9b273a4f 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -113,6 +113,19 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>           }
>       }
>   
> +    for (i = 0; i < d_config->num_virtios; i++) {
> +        libxl_device_virtio *virtio = &d_config->virtios[i];
> +
> +        if (virtio->transport != LIBXL_VIRTIO_TRANSPORT_MMIO)
> +            continue;
> +
> +        rc = alloc_virtio_mmio_params(gc, &virtio->base, &virtio->irq,
> +                                      &virtio_mmio_base, &virtio_mmio_irq);
> +
> +        if (rc)
> +            return rc;
> +    }
> +
>       /*
>        * Every virtio-mmio device uses one emulated SPI. If Virtio devices are
>        * present, make sure that we allocate enough SPIs for them.
> @@ -968,6 +981,68 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt, uint64_t base,
>       return fdt_end_node(fdt);
>   }
>   
> +static int make_virtio_mmio_node_i2c(libxl__gc *gc, void *fdt)
> +{
> +    int res;
> +
> +    res = fdt_begin_node(fdt, "i2c");
> +    if (res) return res;
> +
> +    res = fdt_property_compat(gc, fdt, 1, "virtio,device22");
> +    if (res) return res;
> +
> +    return fdt_end_node(fdt);
> +}
> +
> +static int make_virtio_mmio_node_gpio(libxl__gc *gc, void *fdt)
> +{
> +    int res;
> +
> +    res = fdt_begin_node(fdt, "gpio");
> +    if (res) return res;
> +
> +    res = fdt_property_compat(gc, fdt, 1, "virtio,device29");
> +    if (res) return res;
> +
> +    res = fdt_property(fdt, "gpio-controller", NULL, 0);
> +    if (res) return res;
> +
> +    res = fdt_property_cell(fdt, "#gpio-cells", 2);
> +    if (res) return res;
> +
> +    res = fdt_property(fdt, "interrupt-controller", NULL, 0);
> +    if (res) return res;
> +
> +    res = fdt_property_cell(fdt, "#interrupt-cells", 2);
> +    if (res) return res;
> +
> +    return fdt_end_node(fdt);
> +}
> +
> +static int make_virtio_mmio_node_device(libxl__gc *gc, void *fdt, uint64_t base,
> +                                        uint32_t irq, const char *type,
> +                                        uint32_t backend_domid)
> +{
> +    int res, len = strlen(type);
> +
> +    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
> +    if (res) return res;
> +
> +    /* Add device specific nodes */
> +    if (!strncmp(type, "virtio,device22", len)) {
> +        res = make_virtio_mmio_node_i2c(gc, fdt);
> +        if (res) return res;
> +    } else if (!strncmp(type, "virtio,device29", len)) {
> +        res = make_virtio_mmio_node_gpio(gc, fdt);
> +        if (res) return res;
> +    } else {
> +        LOG(ERROR, "Invalid type for virtio device: %s", type);
> +        return -EINVAL;
> +    }

I am not sure whether it is the best place to ask, but I will try 
anyway. So I assume that with the whole series applied it would be 
possible to configure only two specific device types ("22" and "29").
But what to do if user, for example, is interested in usual virtio 
device (which doesn't require specific device-tree sub node with 
specific compatible in it). For these usual virtio devices just calling 
make_virtio_mmio_node_common() would be enough.


Maybe we should introduce something like type "common" which would mean 
we don't need any additional device-tree sub nodes?

virtio = ["type=common,transport=mmio"]


> +
> +    return fdt_end_node(fdt);
> +}
> +
>   static const struct arch_info *get_arch_info(libxl__gc *gc,
>                                                const struct xc_dom_image *dom)
>   {
> @@ -1290,6 +1365,20 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
>               }
>           }
>   
> +        for (i = 0; i < d_config->num_virtios; i++) {
> +            libxl_device_virtio *virtio = &d_config->virtios[i];
> +
> +            if (virtio->transport != LIBXL_VIRTIO_TRANSPORT_MMIO)
> +                continue;
> +
> +            if (virtio->backend_domid != LIBXL_TOOLSTACK_DOMID)
> +                iommu_needed = true;
> +
> +            FDT( make_virtio_mmio_node_device(gc, fdt, virtio->base,
> +                                              virtio->irq, virtio->type,
> +                                              virtio->backend_domid) );
> +        }
> +
>           /*
>            * Note, this should be only called after creating all virtio-mmio
>            * device nodes
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index 612eacfc7fac..15a32c75c045 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -1802,6 +1802,11 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
>                                 &d_config->vkbs[i]);
>           }
>   
> +        for (i = 0; i < d_config->num_virtios; i++) {
> +            libxl__device_add(gc, domid, &libxl__virtio_devtype,
> +                              &d_config->virtios[i]);
> +        }


I am wondering whether this is the best place to put this call. This 
gets called for LIBXL_DOMAIN_TYPE_PV and LIBXL_DOMAIN_TYPE_PVH (our Arm 
case), and not for LIBXL_DOMAIN_TYPE_HVM. Is it what we want?


> +
>           if (d_config->b_info.arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART) {
>               init_console_info(gc, &vuart, 0);
>               vuart.backend_domid = state->console_domid;
> diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
> index cb9e8b3b8b5a..e5716f9bef80 100644
> --- a/tools/libs/light/libxl_internal.h
> +++ b/tools/libs/light/libxl_internal.h
> @@ -4003,6 +4003,7 @@ static inline int *libxl__device_type_get_num(
>   
>   extern const libxl__device_type libxl__vfb_devtype;
>   extern const libxl__device_type libxl__vkb_devtype;
> +extern const libxl__device_type libxl__virtio_devtype;
>   extern const libxl__device_type libxl__disk_devtype;
>   extern const libxl__device_type libxl__nic_devtype;
>   extern const libxl__device_type libxl__vtpm_devtype;
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index d634f304cda2..d97a0795d312 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -278,6 +278,14 @@ libxl_vkb_backend = Enumeration("vkb_backend", [
>       (2, "LINUX")
>       ])
>   
> +libxl_virtio_backend = Enumeration("virtio_backend", [

I would add (0, "UNKNOWN") here ...

> +    (1, "STANDALONE")
> +    ])
> +
> +libxl_virtio_transport = Enumeration("virtio_transport", [

    ... and here (these might be needed by parsing code)

> +    (1, "MMIO"),
> +    ])
> +
>   libxl_passthrough = Enumeration("passthrough", [
>       (0, "default"),
>       (1, "disabled"),
> @@ -705,6 +713,17 @@ libxl_device_vkb = Struct("device_vkb", [
>       ("multi_touch_num_contacts", uint32)
>       ])
>   
> +libxl_device_virtio = Struct("device_virtio", [
> +    ("backend_domid", libxl_domid),
> +    ("backend_domname", string),
> +    ("backend", libxl_virtio_backend),
> +    ("type", string),
> +    ("transport", libxl_virtio_transport),
> +    ("devid", libxl_devid),
> +    ("irq", uint32),
> +    ("base", uint64)
> +    ])
> +
>   libxl_device_disk = Struct("device_disk", [
>       ("backend_domid", libxl_domid),
>       ("backend_domname", string),
> @@ -982,6 +1001,7 @@ libxl_domain_config = Struct("domain_config", [
>       ("dtdevs", Array(libxl_device_dtdev, "num_dtdevs")),
>       ("vfbs", Array(libxl_device_vfb, "num_vfbs")),
>       ("vkbs", Array(libxl_device_vkb, "num_vkbs")),
> +    ("virtios", Array(libxl_device_virtio, "num_virtios")),
>       ("vtpms", Array(libxl_device_vtpm, "num_vtpms")),
>       ("p9s", Array(libxl_device_p9, "num_p9s")),
>       ("pvcallsifs", Array(libxl_device_pvcallsif, "num_pvcallsifs")),
> @@ -1145,6 +1165,15 @@ libxl_vkbinfo = Struct("vkbinfo", [
>       ("rref", integer)
>       ], dir=DIR_OUT)
>   
> +libxl_virtioinfo = Struct("virtioinfo", [
> +    ("backend", string),
> +    ("backend_id", uint32),
> +    ("frontend", string),
> +    ("frontend_id", uint32),
> +    ("devid", libxl_devid),
> +    ("state", integer),
> +    ], dir=DIR_OUT)

I failed to find where libxl_virtioinfo is used within the series. Why 
do we need it?


> +
>   # NUMA node characteristics: size and free are how much memory it has, and how
>   # much of it is free, respectively. dists is an array of distances from this
>   # node to each other node.
> diff --git a/tools/libs/light/libxl_types_internal.idl b/tools/libs/light/libxl_types_internal.idl
> index fb0f4f23d7c2..e24288f1a59e 100644
> --- a/tools/libs/light/libxl_types_internal.idl
> +++ b/tools/libs/light/libxl_types_internal.idl
> @@ -33,6 +33,7 @@ libxl__device_kind = Enumeration("device_kind", [
>       (15, "VSND"),
>       (16, "VINPUT"),
>       (17, "VIRTIO_DISK"),
> +    (18, "VIRTIO"),
>       ])
>   
>   libxl__console_backend = Enumeration("console_backend", [
> diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_virtio.c
> new file mode 100644
> index 000000000000..14b0c016a0a2
> --- /dev/null
> +++ b/tools/libs/light/libxl_virtio.c
> @@ -0,0 +1,127 @@
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
> +static int libxl__device_virtio_setdefault(libxl__gc *gc, uint32_t domid,
> +                                           libxl_device_virtio *virtio,
> +                                           bool hotplug)
> +{
> +    return libxl__resolve_domid(gc, virtio->backend_domname,
> +                                &virtio->backend_domid);
> +}
> +
> +static int libxl__device_from_virtio(libxl__gc *gc, uint32_t domid,
> +                                     libxl_device_virtio *virtio,
> +                                     libxl__device *device)
> +{
> +    device->backend_devid   = virtio->devid;
> +    device->backend_domid   = virtio->backend_domid;
> +    device->devid           = virtio->devid;
> +    device->domid           = domid;
> +
> +    device->backend_kind    = LIBXL__DEVICE_KIND_VIRTIO;
> +    device->kind            = LIBXL__DEVICE_KIND_VIRTIO;
> +
> +    return 0;
> +}
> +
> +static int libxl__set_xenstore_virtio(libxl__gc *gc, uint32_t domid,
> +                                      libxl_device_virtio *virtio,
> +                                      flexarray_t *back, flexarray_t *front,
> +                                      flexarray_t *ro_front)
> +{
> +    const char *transport = libxl_virtio_transport_to_string(virtio->transport);
> +
> +    flexarray_append_pair(back, "irq", GCSPRINTF("%u", virtio->irq));
> +    flexarray_append_pair(back, "base", GCSPRINTF("%lu", virtio->base));
> +    flexarray_append_pair(back, "type", GCSPRINTF("%s", virtio->type));
> +    flexarray_append_pair(back, "transport", GCSPRINTF("%s", transport));
> +
> +    flexarray_append_pair(front, "irq", GCSPRINTF("%u", virtio->irq));
> +    flexarray_append_pair(front, "base", GCSPRINTF("%lu", virtio->base));
> +    flexarray_append_pair(front, "type", GCSPRINTF("%s", virtio->type));
> +    flexarray_append_pair(front, "transport", GCSPRINTF("%s", transport));
> +
> +    return 0;
> +}
> +
> +static int libxl__virtio_from_xenstore(libxl__gc *gc, const char *libxl_path,
> +                                       libxl_devid devid,
> +                                       libxl_device_virtio *virtio)
> +{
> +    const char *be_path, *fe_path, *tmp;
> +    libxl__device dev;
> +    int rc;
> +
> +    virtio->devid = devid;
> +
> +    rc = libxl__xs_read_mandatory(gc, XBT_NULL,
> +                                  GCSPRINTF("%s/backend", libxl_path),
> +                                  &be_path);
> +    if (rc) goto out;
> +
> +    rc = libxl__xs_read_mandatory(gc, XBT_NULL,
> +                                  GCSPRINTF("%s/frontend", libxl_path),
> +                                  &fe_path);
> +    if (rc) goto out;

fe_path is not used anywhere down the code even within the series, why 
do we need it? Or we just read it to make sure that corresponding entry 
is present in Xenstore (some kind of sanity check)?


> +
> +    rc = libxl__backendpath_parse_domid(gc, be_path, &virtio->backend_domid);
> +    if (rc) goto out;
> +
> +    rc = libxl__parse_backend_path(gc, be_path, &dev);
> +    if (rc) goto out;

The same question for dev variable.



> +
> +    rc = libxl__xs_read_checked(gc, XBT_NULL,
> +				GCSPRINTF("%s/irq", be_path), &tmp);
> +    if (rc) goto out;
> +
> +    if (tmp) {
> +        virtio->irq = strtoul(tmp, NULL, 0);
> +    }
> +
> +    rc = libxl__xs_read_checked(gc, XBT_NULL,
> +				GCSPRINTF("%s/base", be_path), &tmp);
> +    if (rc) goto out;
> +
> +    if (tmp) {
> +        virtio->base = strtoul(tmp, NULL, 0);
> +    }
> +
> +    rc = 0;


It feels to me, that we also need to read "type" and "transport" from 
the Xenstore (and probably check them for the valid values).


> +
> +out:
> +
> +    return rc;
> +}
> +
> +static LIBXL_DEFINE_UPDATE_DEVID(virtio)
> +
> +#define libxl__add_virtios NULL
> +#define libxl_device_virtio_compare NULL
> +
> +DEFINE_DEVICE_TYPE_STRUCT(virtio, VIRTIO, virtios,
> +    .set_xenstore_config = (device_set_xenstore_config_fn_t)
> +                           libxl__set_xenstore_virtio,
> +    .from_xenstore = (device_from_xenstore_fn_t)libxl__virtio_from_xenstore,
> +    .skip_attach = 1
> +);
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

