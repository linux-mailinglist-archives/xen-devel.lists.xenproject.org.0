Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A4864A530
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 17:43:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459852.717633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4lst-00022h-QX; Mon, 12 Dec 2022 16:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459852.717633; Mon, 12 Dec 2022 16:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4lst-0001za-Mt; Mon, 12 Dec 2022 16:42:31 +0000
Received: by outflank-mailman (input) for mailman id 459852;
 Mon, 12 Dec 2022 16:42:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qxQZ=4K=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1p4lss-0001zU-Kz
 for xen-devel@lists.xen.org; Mon, 12 Dec 2022 16:42:30 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f61f3f5e-7a3b-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 17:42:28 +0100 (CET)
Received: by mail-pj1-x1034.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso480201pjt.0
 for <xen-devel@lists.xen.org>; Mon, 12 Dec 2022 08:42:28 -0800 (PST)
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
X-Inumbo-ID: f61f3f5e-7a3b-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UvrbxLYv48XzvOmstCD8H+EOpr+OkCH7HEKlacvnREQ=;
        b=Qk5kZK39K0+XzQ3tNA5y41027YwSg9M2iGp1Fu27esQyMWDYXy7vJ62qGs56TwI1ev
         6wwjypKh75/wgG0dt1QafhsQyZiZL4tDoFC4lGOj4yzVYo0b9qU10SXbaEmFKXOmpy82
         CbRUgO+YfnGbexw/xiqM4vL6snlxuLsR7F2XdOnjwOmVKo5lTn08qkux81JNQRg0NlMh
         VaJ56syv1zMn2HlZKxJsXu0giBMKjt0Y6JeIHAEFuZolxERYIVfM46JWh1eX2cgSVFD1
         ijpk5B20xQU2jjmZ/TJDRs5h5jL2+Vk4vxuOLYp9hs/UAzjTs/xJ87s0h/XFGUkhx70Q
         npyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvrbxLYv48XzvOmstCD8H+EOpr+OkCH7HEKlacvnREQ=;
        b=PvVIKjZlIzZ12YspMtQCzpLIGjzGPEd4L2P7k/OtF0m+aBNiqd4OVJB/RVsxrjqliR
         mFi5bg7vAc5n7hGAIfOx7vgOu7F8Sn3GZFtMcAQ0u/X8zm7rYKzNEwKe2iNolVx5tOVq
         sbNq4gdMnpXBzA+FJxocTH0dqH8bJSU7G+DjSeRuMxYpAGRIU9Zc0Idimqc496gqnfjV
         rci4uwGjVLqVT0WoeXuzja6cJOklTZ/FiA0LtoFYA42Qzhyd+rJTbbP5mFNKK0giikfs
         9U3Rbuzwhjc980PPUm2+GiVpUCqoHRGDz1R37WKmFzfkmr8JkDEzG7qLyJsF41UPNAQX
         hBXg==
X-Gm-Message-State: ANoB5pm/UqDZgU/Mkc/2oNWFZf+1PjvhJeSFnHnESeupvoNmFndeL7DX
	J7CQLF6BL2P8w/G1NIeGDh8IQ4fzLEjbEa98BrM=
X-Google-Smtp-Source: AA0mqf4PMEEm7y1xjDRPZZk+q831uifU7f7dve40b6dyc5OzYzVcqrDohHq3TW2dj193ZfSYZP2PsOggQF5hvCSjgqo=
X-Received: by 2002:a17:90a:3da1:b0:219:61e5:4994 with SMTP id
 i30-20020a17090a3da100b0021961e54994mr42174588pjc.213.1670863346442; Mon, 12
 Dec 2022 08:42:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1670839220.git.viresh.kumar@linaro.org> <0e58df1510d7d8c0186da6620882b7c4e4035ab0.1670839220.git.viresh.kumar@linaro.org>
In-Reply-To: <0e58df1510d7d8c0186da6620882b7c4e4035ab0.1670839220.git.viresh.kumar@linaro.org>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Mon, 12 Dec 2022 18:42:15 +0200
Message-ID: <CAPD2p-n7Dqx7sC=StTSQXfnmF34Yv643uNXWNgm2_aQnBEvB5g@mail.gmail.com>
Subject: Re: [PATCH V8 1/3] libxl: Add support for generic virtio device
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: xen-devel@lists.xen.org, Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: multipart/alternative; boundary="0000000000003ba79805efa430fd"

--0000000000003ba79805efa430fd
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 12, 2022 at 12:10 PM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

Hello Viresh

[sorry for the possible format issues]


This patch adds basic support for configuring and assisting generic
> Virtio backends, which could run in any domain.
>
> An example of domain configuration for mmio based Virtio I2C device is:
> virtio = ["type=virtio,device22,transport=mmio"]
>
> To make this work on Arm, allocate Virtio MMIO params (IRQ and memory
> region) and pass them to the backend and update guest device-tree to
> create a DT node for the Virtio devices.
>
> Add special support for I2C and GPIO devices, which require the
> "compatible" DT property to be set, among other device specific
> properties. Support for generic virtio devices is also added, which just
> need a MMIO node but not any special DT properties, for such devices the
> user needs to pass "virtio,device" in the "type" string.
>
> The parsing of generic virtio device configurations will be done in a
> separate commit.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>


Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

with one NIT addressed ...


> ---
>  tools/libs/light/Makefile                 |   1 +
>  tools/libs/light/libxl_arm.c              | 100 +++++++++++++++
>  tools/libs/light/libxl_create.c           |   4 +
>  tools/libs/light/libxl_internal.h         |   6 +
>  tools/libs/light/libxl_types.idl          |  18 +++
>  tools/libs/light/libxl_types_internal.idl |   1 +
>  tools/libs/light/libxl_virtio.c           | 144 ++++++++++++++++++++++
>  7 files changed, 274 insertions(+)
>  create mode 100644 tools/libs/light/libxl_virtio.c
>
> diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
> index 374be1cfab25..4fddcc6f51d7 100644
> --- a/tools/libs/light/Makefile
> +++ b/tools/libs/light/Makefile
> @@ -106,6 +106,7 @@ OBJS-y += libxl_vdispl.o
>  OBJS-y += libxl_pvcalls.o
>  OBJS-y += libxl_vsnd.o
>  OBJS-y += libxl_vkb.o
> +OBJS-y += libxl_virtio.o
>  OBJS-y += libxl_genid.o
>  OBJS-y += _libxl_types.o
>  OBJS-y += libxl_flask.o
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index fa3d61f1e882..292b31881210 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -113,6 +113,19 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>          }
>      }
>
> +    for (i = 0; i < d_config->num_virtios; i++) {
> +        libxl_device_virtio *virtio = &d_config->virtios[i];
> +
> +        if (virtio->transport != LIBXL_VIRTIO_TRANSPORT_MMIO)
> +            continue;
> +
> +        rc = alloc_virtio_mmio_params(gc, &virtio->base, &virtio->irq,
> +                                      &virtio_mmio_base,
> &virtio_mmio_irq);
> +
> +        if (rc)
> +            return rc;
> +    }
> +
>      /*
>       * Every virtio-mmio device uses one emulated SPI. If Virtio devices
> are
>       * present, make sure that we allocate enough SPIs for them.
> @@ -956,6 +969,79 @@ static int make_virtio_mmio_node(libxl__gc *gc, void
> *fdt, uint64_t base,
>      return fdt_end_node(fdt);
>  }
>
> +/*
> + * The DT bindings for GPIO device are present here:
>


... here, s/GPIO/I2C

I hope this could be done when committing ...



> + *
> + *
> https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml
> + */
> +static int make_virtio_mmio_node_i2c(libxl__gc *gc, void *fdt)
> +{
> +    int res;
> +
> +    res = fdt_begin_node(fdt, "i2c");
> +    if (res) return res;
> +
> +    res = fdt_property_compat(gc, fdt, 1, VIRTIO_DEVICE_TYPE_I2C);
> +    if (res) return res;
> +
> +    return fdt_end_node(fdt);
> +}
> +
> +/*
> + * The DT bindings for GPIO device are present here:
> + *
> + *
> https://www.kernel.org/doc/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
> + */
> +static int make_virtio_mmio_node_gpio(libxl__gc *gc, void *fdt)
> +{
> +    int res;
> +
> +    res = fdt_begin_node(fdt, "gpio");
> +    if (res) return res;
> +
> +    res = fdt_property_compat(gc, fdt, 1, VIRTIO_DEVICE_TYPE_GPIO);
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
> +static int make_virtio_mmio_node_device(libxl__gc *gc, void *fdt,
> uint64_t base,
> +                                        uint32_t irq, const char *type,
> +                                        uint32_t backend_domid)
> +{
> +    int res;
> +
> +    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
> +    if (res) return res;
> +
> +    /* Add device specific nodes */
> +    if (!strcmp(type, VIRTIO_DEVICE_TYPE_I2C)) {
> +        res = make_virtio_mmio_node_i2c(gc, fdt);
> +        if (res) return res;
> +    } else if (!strcmp(type, VIRTIO_DEVICE_TYPE_GPIO)) {
> +        res = make_virtio_mmio_node_gpio(gc, fdt);
> +        if (res) return res;
> +    } else if (strcmp(type, VIRTIO_DEVICE_TYPE_GENERIC)) {
> +        /* Doesn't match generic virtio device */
> +        LOG(ERROR, "Invalid type for virtio device: %s", type);
> +        return -EINVAL;
> +    }
> +
> +    return fdt_end_node(fdt);
> +}
> +
>  static const struct arch_info *get_arch_info(libxl__gc *gc,
>                                               const struct xc_dom_image
> *dom)
>  {
> @@ -1277,6 +1363,20 @@ static int libxl__prepare_dtb(libxl__gc *gc,
> libxl_domain_config *d_config,
>              }
>          }
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
>          /*
>           * The iommu node should be created only once for all virtio-mmio
>           * devices.
> diff --git a/tools/libs/light/libxl_create.c
> b/tools/libs/light/libxl_create.c
> index 612eacfc7fac..beec3f6b6fec 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -1752,6 +1752,10 @@ static void domcreate_launch_dm(libxl__egc *egc,
> libxl__multidev *multidev,
>          libxl__device_add(gc, domid, &libxl__pvcallsif_devtype,
>                            &d_config->pvcallsifs[i]);
>
> +    for (i = 0; i < d_config->num_virtios; i++)
> +        libxl__device_add(gc, domid, &libxl__virtio_devtype,
> +                          &d_config->virtios[i]);
> +
>      switch (d_config->c_info.type) {
>      case LIBXL_DOMAIN_TYPE_HVM:
>      {
> diff --git a/tools/libs/light/libxl_internal.h
> b/tools/libs/light/libxl_internal.h
> index a7c447c10e5f..97e1e66d98af 100644
> --- a/tools/libs/light/libxl_internal.h
> +++ b/tools/libs/light/libxl_internal.h
> @@ -166,6 +166,11 @@
>  /* Convert pfn to physical address space. */
>  #define pfn_to_paddr(x) ((uint64_t)(x) << XC_PAGE_SHIFT)
>
> +/* Virtio device types */
> +#define VIRTIO_DEVICE_TYPE_GENERIC   "virtio,device"
> +#define VIRTIO_DEVICE_TYPE_GPIO      "virtio,device22"
> +#define VIRTIO_DEVICE_TYPE_I2C       "virtio,device29"
> +
>  /* logging */
>  _hidden void libxl__logv(libxl_ctx *ctx, xentoollog_level msglevel, int
> errnoval,
>               const char *file /* may be 0 */, int line /* ignored if
> !file */,
> @@ -4003,6 +4008,7 @@ static inline int *libxl__device_type_get_num(
>
>  extern const libxl__device_type libxl__vfb_devtype;
>  extern const libxl__device_type libxl__vkb_devtype;
> +extern const libxl__device_type libxl__virtio_devtype;
>  extern const libxl__device_type libxl__disk_devtype;
>  extern const libxl__device_type libxl__nic_devtype;
>  extern const libxl__device_type libxl__vtpm_devtype;
> diff --git a/tools/libs/light/libxl_types.idl
> b/tools/libs/light/libxl_types.idl
> index 9e3d33cb5a59..0cfad8508dbd 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -278,6 +278,11 @@ libxl_vkb_backend = Enumeration("vkb_backend", [
>      (2, "LINUX")
>      ])
>
> +libxl_virtio_transport = Enumeration("virtio_transport", [
> +    (0, "UNKNOWN"),
> +    (1, "MMIO"),
> +    ])
> +
>  libxl_passthrough = Enumeration("passthrough", [
>      (0, "default"),
>      (1, "disabled"),
> @@ -703,6 +708,18 @@ libxl_device_vkb = Struct("device_vkb", [
>      ("multi_touch_num_contacts", uint32)
>      ])
>
> +libxl_device_virtio = Struct("device_virtio", [
> +    ("backend_domid", libxl_domid),
> +    ("backend_domname", string),
> +    ("type", string),
> +    ("transport", libxl_virtio_transport),
> +    ("devid", libxl_devid),
> +    # Note that virtio-mmio parameters (irq and base) are for internal
> +    # use by libxl and can't be modified.
> +    ("irq", uint32),
> +    ("base", uint64)
> +    ])
> +
>  libxl_device_disk = Struct("device_disk", [
>      ("backend_domid", libxl_domid),
>      ("backend_domname", string),
> @@ -980,6 +997,7 @@ libxl_domain_config = Struct("domain_config", [
>      ("dtdevs", Array(libxl_device_dtdev, "num_dtdevs")),
>      ("vfbs", Array(libxl_device_vfb, "num_vfbs")),
>      ("vkbs", Array(libxl_device_vkb, "num_vkbs")),
> +    ("virtios", Array(libxl_device_virtio, "num_virtios")),
>      ("vtpms", Array(libxl_device_vtpm, "num_vtpms")),
>      ("p9s", Array(libxl_device_p9, "num_p9s")),
>      ("pvcallsifs", Array(libxl_device_pvcallsif, "num_pvcallsifs")),
> diff --git a/tools/libs/light/libxl_types_internal.idl
> b/tools/libs/light/libxl_types_internal.idl
> index fb0f4f23d7c2..e24288f1a59e 100644
> --- a/tools/libs/light/libxl_types_internal.idl
> +++ b/tools/libs/light/libxl_types_internal.idl
> @@ -33,6 +33,7 @@ libxl__device_kind = Enumeration("device_kind", [
>      (15, "VSND"),
>      (16, "VINPUT"),
>      (17, "VIRTIO_DISK"),
> +    (18, "VIRTIO"),
>      ])
>
>  libxl__console_backend = Enumeration("console_backend", [
> diff --git a/tools/libs/light/libxl_virtio.c
> b/tools/libs/light/libxl_virtio.c
> new file mode 100644
> index 000000000000..6a38def2faf5
> --- /dev/null
> +++ b/tools/libs/light/libxl_virtio.c
> @@ -0,0 +1,144 @@
> +/*
> + * Copyright (C) 2022 Linaro Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU Lesser General Public License as
> published
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
> +                                      flexarray_t *back, flexarray_t
> *front,
> +                                      flexarray_t *ro_front)
> +{
> +    const char *transport =
> libxl_virtio_transport_to_string(virtio->transport);
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
> +static int libxl__virtio_from_xenstore(libxl__gc *gc, const char
> *libxl_path,
> +                                       libxl_devid devid,
> +                                       libxl_device_virtio *virtio)
> +{
> +    const char *be_path, *tmp = NULL;
> +    int rc;
> +
> +    virtio->devid = devid;
> +
> +    rc = libxl__xs_read_mandatory(gc, XBT_NULL,
> +                                  GCSPRINTF("%s/backend", libxl_path),
> +                                  &be_path);
> +    if (rc) goto out;
> +
> +    rc = libxl__backendpath_parse_domid(gc, be_path,
> &virtio->backend_domid);
> +    if (rc) goto out;
> +
> +    rc = libxl__xs_read_checked(gc, XBT_NULL,
> +                               GCSPRINTF("%s/irq", be_path), &tmp);
> +    if (rc) goto out;
> +
> +    if (tmp) {
> +        virtio->irq = strtoul(tmp, NULL, 0);
> +    }
> +
> +    tmp = NULL;
> +    rc = libxl__xs_read_checked(gc, XBT_NULL,
> +                               GCSPRINTF("%s/base", be_path), &tmp);
> +    if (rc) goto out;
> +
> +    if (tmp) {
> +        virtio->base = strtoul(tmp, NULL, 0);
> +    }
> +
> +    tmp = NULL;
> +    rc = libxl__xs_read_checked(gc, XBT_NULL,
> +                               GCSPRINTF("%s/transport", be_path), &tmp);
> +    if (rc) goto out;
> +
> +    if (tmp) {
> +        if (!strcmp(tmp, "mmio")) {
> +            virtio->transport = LIBXL_VIRTIO_TRANSPORT_MMIO;
> +        } else {
> +            return ERROR_INVAL;
> +        }
> +    }
> +
> +    tmp = NULL;
> +    rc = libxl__xs_read_checked(gc, XBT_NULL,
> +                               GCSPRINTF("%s/type", be_path), &tmp);
> +    if (rc) goto out;
> +
> +    if (tmp) {
> +        int len = sizeof(VIRTIO_DEVICE_TYPE_GENERIC) - 1;
> +
> +        if (!strncmp(tmp, VIRTIO_DEVICE_TYPE_GENERIC, len)) {
> +            virtio->type = libxl__strdup(NOGC, tmp);
> +        } else {
> +            return ERROR_INVAL;
> +        }
> +    }
> +
> +out:
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
> +    .from_xenstore =
> (device_from_xenstore_fn_t)libxl__virtio_from_xenstore,
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
> --
> 2.31.1.272.g89b43f80a514
>
>
>

-- 
Regards,

Oleksandr Tyshchenko

--0000000000003ba79805efa430fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 12, 2022 at 12:10 PM Vire=
sh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.org" target=3D"_blank">v=
iresh.kumar@linaro.org</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gm=
ail_attr"><br></div><div class=3D"gmail_attr">Hello Viresh</div><div class=
=3D"gmail_attr"><br></div><div class=3D"gmail_attr">[sorry for the possible=
 format issues]</div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><div d=
ir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">This patch adds basic support for configuring and assistin=
g generic<br>
Virtio backends, which could run in any domain.<br>
<br>
An example of domain configuration for mmio based Virtio I2C device is:<br>
virtio =3D [&quot;type=3Dvirtio,device22,transport=3Dmmio&quot;]<br>
<br>
To make this work on Arm, allocate Virtio MMIO params (IRQ and memory<br>
region) and pass them to the backend and update guest device-tree to<br>
create a DT node for the Virtio devices.<br>
<br>
Add special support for I2C and GPIO devices, which require the<br>
&quot;compatible&quot; DT property to be set, among other device specific<b=
r>
properties. Support for generic virtio devices is also added, which just<br=
>
need a MMIO node but not any special DT properties, for such devices the<br=
>
user needs to pass &quot;virtio,device&quot; in the &quot;type&quot; string=
.<br>
<br>
The parsing of generic virtio device configurations will be done in a<br>
separate commit.<br>
<br>
Signed-off-by: Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.org" =
target=3D"_blank">viresh.kumar@linaro.org</a>&gt;<br></blockquote><div><br>=
</div><div><br></div><div>Reviewed-by: Oleksandr Tyshchenko &lt;<a href=3D"=
mailto:oleksandr_tyshchenko@epam.com" target=3D"_blank">oleksandr_tyshchenk=
o@epam.com</a>&gt;<br></div><div><br></div><div>with one NIT addressed ...<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0tools/libs/light/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0tools/libs/light/libxl_arm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 100 +++++++++++++++<br>
=C2=A0tools/libs/light/libxl_create.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A04 +<br>
=C2=A0tools/libs/light/libxl_internal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A06 +<br>
=C2=A0tools/libs/light/libxl_types.idl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 18 +++<br>
=C2=A0tools/libs/light/libxl_types_internal.idl |=C2=A0 =C2=A01 +<br>
=C2=A0tools/libs/light/libxl_virtio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 144 ++++++++++++++++++++++<br>
=C2=A07 files changed, 274 insertions(+)<br>
=C2=A0create mode 100644 tools/libs/light/libxl_virtio.c<br>
<br>
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile<br>
index 374be1cfab25..4fddcc6f51d7 100644<br>
--- a/tools/libs/light/Makefile<br>
+++ b/tools/libs/light/Makefile<br>
@@ -106,6 +106,7 @@ OBJS-y +=3D libxl_vdispl.o<br>
=C2=A0OBJS-y +=3D libxl_pvcalls.o<br>
=C2=A0OBJS-y +=3D libxl_vsnd.o<br>
=C2=A0OBJS-y +=3D libxl_vkb.o<br>
+OBJS-y +=3D libxl_virtio.o<br>
=C2=A0OBJS-y +=3D libxl_genid.o<br>
=C2=A0OBJS-y +=3D _libxl_types.o<br>
=C2=A0OBJS-y +=3D libxl_flask.o<br>
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c<br=
>
index fa3d61f1e882..292b31881210 100644<br>
--- a/tools/libs/light/libxl_arm.c<br>
+++ b/tools/libs/light/libxl_arm.c<br>
@@ -113,6 +113,19 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; d_config-&gt;num_virtios; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 libxl_device_virtio *virtio =3D &amp;d_config-=
&gt;virtios[i];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (virtio-&gt;transport !=3D LIBXL_VIRTIO_TRA=
NSPORT_MMIO)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D alloc_virtio_mmio_params(gc, &amp;virti=
o-&gt;base, &amp;virtio-&gt;irq,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;virtio_mmi=
o_base, &amp;virtio_mmio_irq);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return rc;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * Every virtio-mmio device uses one emulated SPI. If V=
irtio devices are<br>
=C2=A0 =C2=A0 =C2=A0 * present, make sure that we allocate enough SPIs for =
them.<br>
@@ -956,6 +969,79 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *=
fdt, uint64_t base,<br>
=C2=A0 =C2=A0 =C2=A0return fdt_end_node(fdt);<br>
=C2=A0}<br>
<br>
+/*<br>
+ * The DT bindings for GPIO device are present here:<br></blockquote><div>=
=C2=A0</div><div><br></div><div>... here, s/GPIO/I2C</div><div><br></div><d=
iv>I hope this could be done when committing=C2=A0...</div><div><br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+ *<br>
+ * <a href=3D"https://www.kernel.org/doc/Documentation/devicetree/bindings=
/i2c/i2c-virtio.yaml" rel=3D"noreferrer" target=3D"_blank">https://www.kern=
el.org/doc/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml</a><br>
+ */<br>
+static int make_virtio_mmio_node_i2c(libxl__gc *gc, void *fdt)<br>
+{<br>
+=C2=A0 =C2=A0 int res;<br>
+<br>
+=C2=A0 =C2=A0 res =3D fdt_begin_node(fdt, &quot;i2c&quot;);<br>
+=C2=A0 =C2=A0 if (res) return res;<br>
+<br>
+=C2=A0 =C2=A0 res =3D fdt_property_compat(gc, fdt, 1, VIRTIO_DEVICE_TYPE_I=
2C);<br>
+=C2=A0 =C2=A0 if (res) return res;<br>
+<br>
+=C2=A0 =C2=A0 return fdt_end_node(fdt);<br>
+}<br>
+<br>
+/*<br>
+ * The DT bindings for GPIO device are present here:<br>
+ *<br>
+ * <a href=3D"https://www.kernel.org/doc/Documentation/devicetree/bindings=
/gpio/gpio-virtio.yaml" rel=3D"noreferrer" target=3D"_blank">https://www.ke=
rnel.org/doc/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml</a><br=
>
+ */<br>
+static int make_virtio_mmio_node_gpio(libxl__gc *gc, void *fdt)<br>
+{<br>
+=C2=A0 =C2=A0 int res;<br>
+<br>
+=C2=A0 =C2=A0 res =3D fdt_begin_node(fdt, &quot;gpio&quot;);<br>
+=C2=A0 =C2=A0 if (res) return res;<br>
+<br>
+=C2=A0 =C2=A0 res =3D fdt_property_compat(gc, fdt, 1, VIRTIO_DEVICE_TYPE_G=
PIO);<br>
+=C2=A0 =C2=A0 if (res) return res;<br>
+<br>
+=C2=A0 =C2=A0 res =3D fdt_property(fdt, &quot;gpio-controller&quot;, NULL,=
 0);<br>
+=C2=A0 =C2=A0 if (res) return res;<br>
+<br>
+=C2=A0 =C2=A0 res =3D fdt_property_cell(fdt, &quot;#gpio-cells&quot;, 2);<=
br>
+=C2=A0 =C2=A0 if (res) return res;<br>
+<br>
+=C2=A0 =C2=A0 res =3D fdt_property(fdt, &quot;interrupt-controller&quot;, =
NULL, 0);<br>
+=C2=A0 =C2=A0 if (res) return res;<br>
+<br>
+=C2=A0 =C2=A0 res =3D fdt_property_cell(fdt, &quot;#interrupt-cells&quot;,=
 2);<br>
+=C2=A0 =C2=A0 if (res) return res;<br>
+<br>
+=C2=A0 =C2=A0 return fdt_end_node(fdt);<br>
+}<br>
+<br>
+static int make_virtio_mmio_node_device(libxl__gc *gc, void *fdt, uint64_t=
 base,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t=
 irq, const char *type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t=
 backend_domid)<br>
+{<br>
+=C2=A0 =C2=A0 int res;<br>
+<br>
+=C2=A0 =C2=A0 res =3D make_virtio_mmio_node_common(gc, fdt, base, irq, bac=
kend_domid);<br>
+=C2=A0 =C2=A0 if (res) return res;<br>
+<br>
+=C2=A0 =C2=A0 /* Add device specific nodes */<br>
+=C2=A0 =C2=A0 if (!strcmp(type, VIRTIO_DEVICE_TYPE_I2C)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D make_virtio_mmio_node_i2c(gc, fdt);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (res) return res;<br>
+=C2=A0 =C2=A0 } else if (!strcmp(type, VIRTIO_DEVICE_TYPE_GPIO)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D make_virtio_mmio_node_gpio(gc, fdt);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (res) return res;<br>
+=C2=A0 =C2=A0 } else if (strcmp(type, VIRTIO_DEVICE_TYPE_GENERIC)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Doesn&#39;t match generic virtio device */<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 LOG(ERROR, &quot;Invalid type for virtio devic=
e: %s&quot;, type);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return fdt_end_node(fdt);<br>
+}<br>
+<br>
=C2=A0static const struct arch_info *get_arch_info(libxl__gc *gc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const struct xc_dom_image *dom)<br>
=C2=A0{<br>
@@ -1277,6 +1363,20 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_d=
omain_config *d_config,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; d_config-&gt;num_virtios;=
 i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libxl_device_virtio *virtio =3D =
&amp;d_config-&gt;virtios[i];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (virtio-&gt;transport !=3D LI=
BXL_VIRTIO_TRANSPORT_MMIO)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (virtio-&gt;backend_domid !=
=3D LIBXL_TOOLSTACK_DOMID)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iommu_needed =3D t=
rue;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FDT( make_virtio_mmio_node_devic=
e(gc, fdt, virtio-&gt;base,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 virtio-&gt;irq, virtio-&gt;type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 virtio-&gt;backend_domid) );<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * The iommu node should be created only =
once for all virtio-mmio<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * devices.<br>
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_creat=
e.c<br>
index 612eacfc7fac..beec3f6b6fec 100644<br>
--- a/tools/libs/light/libxl_create.c<br>
+++ b/tools/libs/light/libxl_create.c<br>
@@ -1752,6 +1752,10 @@ static void domcreate_launch_dm(libxl__egc *egc, lib=
xl__multidev *multidev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libxl__device_add(gc, domid, &amp;libxl__=
pvcallsif_devtype,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&amp;d_config-&gt;pvcallsifs[i]);<br>
<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; d_config-&gt;num_virtios; i++)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 libxl__device_add(gc, domid, &amp;libxl__virti=
o_devtype,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &amp;d_config-&gt;virtios[i]);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0switch (d_config-&gt;c_info.type) {<br>
=C2=A0 =C2=A0 =C2=A0case LIBXL_DOMAIN_TYPE_HVM:<br>
=C2=A0 =C2=A0 =C2=A0{<br>
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_int=
ernal.h<br>
index a7c447c10e5f..97e1e66d98af 100644<br>
--- a/tools/libs/light/libxl_internal.h<br>
+++ b/tools/libs/light/libxl_internal.h<br>
@@ -166,6 +166,11 @@<br>
=C2=A0/* Convert pfn to physical address space. */<br>
=C2=A0#define pfn_to_paddr(x) ((uint64_t)(x) &lt;&lt; XC_PAGE_SHIFT)<br>
<br>
+/* Virtio device types */<br>
+#define VIRTIO_DEVICE_TYPE_GENERIC=C2=A0 =C2=A0&quot;virtio,device&quot;<b=
r>
+#define VIRTIO_DEVICE_TYPE_GPIO=C2=A0 =C2=A0 =C2=A0 &quot;virtio,device22&=
quot;<br>
+#define VIRTIO_DEVICE_TYPE_I2C=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;virtio,devi=
ce29&quot;<br>
+<br>
=C2=A0/* logging */<br>
=C2=A0_hidden void libxl__logv(libxl_ctx *ctx, xentoollog_level msglevel, i=
nt errnoval,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *file /* may be=
 0 */, int line /* ignored if !file */,<br>
@@ -4003,6 +4008,7 @@ static inline int *libxl__device_type_get_num(<br>
<br>
=C2=A0extern const libxl__device_type libxl__vfb_devtype;<br>
=C2=A0extern const libxl__device_type libxl__vkb_devtype;<br>
+extern const libxl__device_type libxl__virtio_devtype;<br>
=C2=A0extern const libxl__device_type libxl__disk_devtype;<br>
=C2=A0extern const libxl__device_type libxl__nic_devtype;<br>
=C2=A0extern const libxl__device_type libxl__vtpm_devtype;<br>
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_type=
s.idl<br>
index 9e3d33cb5a59..0cfad8508dbd 100644<br>
--- a/tools/libs/light/libxl_types.idl<br>
+++ b/tools/libs/light/libxl_types.idl<br>
@@ -278,6 +278,11 @@ libxl_vkb_backend =3D Enumeration(&quot;vkb_backend&qu=
ot;, [<br>
=C2=A0 =C2=A0 =C2=A0(2, &quot;LINUX&quot;)<br>
=C2=A0 =C2=A0 =C2=A0])<br>
<br>
+libxl_virtio_transport =3D Enumeration(&quot;virtio_transport&quot;, [<br>
+=C2=A0 =C2=A0 (0, &quot;UNKNOWN&quot;),<br>
+=C2=A0 =C2=A0 (1, &quot;MMIO&quot;),<br>
+=C2=A0 =C2=A0 ])<br>
+<br>
=C2=A0libxl_passthrough =3D Enumeration(&quot;passthrough&quot;, [<br>
=C2=A0 =C2=A0 =C2=A0(0, &quot;default&quot;),<br>
=C2=A0 =C2=A0 =C2=A0(1, &quot;disabled&quot;),<br>
@@ -703,6 +708,18 @@ libxl_device_vkb =3D Struct(&quot;device_vkb&quot;, [<=
br>
=C2=A0 =C2=A0 =C2=A0(&quot;multi_touch_num_contacts&quot;, uint32)<br>
=C2=A0 =C2=A0 =C2=A0])<br>
<br>
+libxl_device_virtio =3D Struct(&quot;device_virtio&quot;, [<br>
+=C2=A0 =C2=A0 (&quot;backend_domid&quot;, libxl_domid),<br>
+=C2=A0 =C2=A0 (&quot;backend_domname&quot;, string),<br>
+=C2=A0 =C2=A0 (&quot;type&quot;, string),<br>
+=C2=A0 =C2=A0 (&quot;transport&quot;, libxl_virtio_transport),<br>
+=C2=A0 =C2=A0 (&quot;devid&quot;, libxl_devid),<br>
+=C2=A0 =C2=A0 # Note that virtio-mmio parameters (irq and base) are for in=
ternal<br>
+=C2=A0 =C2=A0 # use by libxl and can&#39;t be modified.<br>
+=C2=A0 =C2=A0 (&quot;irq&quot;, uint32),<br>
+=C2=A0 =C2=A0 (&quot;base&quot;, uint64)<br>
+=C2=A0 =C2=A0 ])<br>
+<br>
=C2=A0libxl_device_disk =3D Struct(&quot;device_disk&quot;, [<br>
=C2=A0 =C2=A0 =C2=A0(&quot;backend_domid&quot;, libxl_domid),<br>
=C2=A0 =C2=A0 =C2=A0(&quot;backend_domname&quot;, string),<br>
@@ -980,6 +997,7 @@ libxl_domain_config =3D Struct(&quot;domain_config&quot=
;, [<br>
=C2=A0 =C2=A0 =C2=A0(&quot;dtdevs&quot;, Array(libxl_device_dtdev, &quot;nu=
m_dtdevs&quot;)),<br>
=C2=A0 =C2=A0 =C2=A0(&quot;vfbs&quot;, Array(libxl_device_vfb, &quot;num_vf=
bs&quot;)),<br>
=C2=A0 =C2=A0 =C2=A0(&quot;vkbs&quot;, Array(libxl_device_vkb, &quot;num_vk=
bs&quot;)),<br>
+=C2=A0 =C2=A0 (&quot;virtios&quot;, Array(libxl_device_virtio, &quot;num_v=
irtios&quot;)),<br>
=C2=A0 =C2=A0 =C2=A0(&quot;vtpms&quot;, Array(libxl_device_vtpm, &quot;num_=
vtpms&quot;)),<br>
=C2=A0 =C2=A0 =C2=A0(&quot;p9s&quot;, Array(libxl_device_p9, &quot;num_p9s&=
quot;)),<br>
=C2=A0 =C2=A0 =C2=A0(&quot;pvcallsifs&quot;, Array(libxl_device_pvcallsif, =
&quot;num_pvcallsifs&quot;)),<br>
diff --git a/tools/libs/light/libxl_types_internal.idl b/tools/libs/light/l=
ibxl_types_internal.idl<br>
index fb0f4f23d7c2..e24288f1a59e 100644<br>
--- a/tools/libs/light/libxl_types_internal.idl<br>
+++ b/tools/libs/light/libxl_types_internal.idl<br>
@@ -33,6 +33,7 @@ libxl__device_kind =3D Enumeration(&quot;device_kind&quot=
;, [<br>
=C2=A0 =C2=A0 =C2=A0(15, &quot;VSND&quot;),<br>
=C2=A0 =C2=A0 =C2=A0(16, &quot;VINPUT&quot;),<br>
=C2=A0 =C2=A0 =C2=A0(17, &quot;VIRTIO_DISK&quot;),<br>
+=C2=A0 =C2=A0 (18, &quot;VIRTIO&quot;),<br>
=C2=A0 =C2=A0 =C2=A0])<br>
<br>
=C2=A0libxl__console_backend =3D Enumeration(&quot;console_backend&quot;, [=
<br>
diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_virti=
o.c<br>
new file mode 100644<br>
index 000000000000..6a38def2faf5<br>
--- /dev/null<br>
+++ b/tools/libs/light/libxl_virtio.c<br>
@@ -0,0 +1,144 @@<br>
+/*<br>
+ * Copyright (C) 2022 Linaro Ltd.<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify<br=
>
+ * it under the terms of the GNU Lesser General Public License as publishe=
d<br>
+ * by the Free Software Foundation; version 2.1 only. with the special<br>
+ * exception on linking described in file LICENSE.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+ * GNU Lesser General Public License for more details.<br>
+ */<br>
+<br>
+#include &quot;libxl_internal.h&quot;<br>
+<br>
+static int libxl__device_virtio_setdefault(libxl__gc *gc, uint32_t domid,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0libxl_device_virtio *virtio,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bool hotplug)<br>
+{<br>
+=C2=A0 =C2=A0 return libxl__resolve_domid(gc, virtio-&gt;backend_domname,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;virtio-&gt;backend_domid);<br>
+}<br>
+<br>
+static int libxl__device_from_virtio(libxl__gc *gc, uint32_t domid,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libxl_device_vir=
tio *virtio,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libxl__device *d=
evice)<br>
+{<br>
+=C2=A0 =C2=A0 device-&gt;backend_devid=C2=A0 =C2=A0=3D virtio-&gt;devid;<b=
r>
+=C2=A0 =C2=A0 device-&gt;backend_domid=C2=A0 =C2=A0=3D virtio-&gt;backend_=
domid;<br>
+=C2=A0 =C2=A0 device-&gt;devid=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 virtio-&gt;devid;<br>
+=C2=A0 =C2=A0 device-&gt;domid=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 domid;<br>
+<br>
+=C2=A0 =C2=A0 device-&gt;backend_kind=C2=A0 =C2=A0 =3D LIBXL__DEVICE_KIND_=
VIRTIO;<br>
+=C2=A0 =C2=A0 device-&gt;kind=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 LIBXL__DEVICE_KIND_VIRTIO;<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int libxl__set_xenstore_virtio(libxl__gc *gc, uint32_t domid,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libxl_device_vi=
rtio *virtio,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flexarray_t *ba=
ck, flexarray_t *front,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flexarray_t *ro=
_front)<br>
+{<br>
+=C2=A0 =C2=A0 const char *transport =3D libxl_virtio_transport_to_string(v=
irtio-&gt;transport);<br>
+<br>
+=C2=A0 =C2=A0 flexarray_append_pair(back, &quot;irq&quot;, GCSPRINTF(&quot=
;%u&quot;, virtio-&gt;irq));<br>
+=C2=A0 =C2=A0 flexarray_append_pair(back, &quot;base&quot;, GCSPRINTF(&quo=
t;%lu&quot;, virtio-&gt;base));<br>
+=C2=A0 =C2=A0 flexarray_append_pair(back, &quot;type&quot;, GCSPRINTF(&quo=
t;%s&quot;, virtio-&gt;type));<br>
+=C2=A0 =C2=A0 flexarray_append_pair(back, &quot;transport&quot;, GCSPRINTF=
(&quot;%s&quot;, transport));<br>
+<br>
+=C2=A0 =C2=A0 flexarray_append_pair(front, &quot;irq&quot;, GCSPRINTF(&quo=
t;%u&quot;, virtio-&gt;irq));<br>
+=C2=A0 =C2=A0 flexarray_append_pair(front, &quot;base&quot;, GCSPRINTF(&qu=
ot;%lu&quot;, virtio-&gt;base));<br>
+=C2=A0 =C2=A0 flexarray_append_pair(front, &quot;type&quot;, GCSPRINTF(&qu=
ot;%s&quot;, virtio-&gt;type));<br>
+=C2=A0 =C2=A0 flexarray_append_pair(front, &quot;transport&quot;, GCSPRINT=
F(&quot;%s&quot;, transport));<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int libxl__virtio_from_xenstore(libxl__gc *gc, const char *libxl_pa=
th,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libxl_dev=
id devid,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libxl_dev=
ice_virtio *virtio)<br>
+{<br>
+=C2=A0 =C2=A0 const char *be_path, *tmp =3D NULL;<br>
+=C2=A0 =C2=A0 int rc;<br>
+<br>
+=C2=A0 =C2=A0 virtio-&gt;devid =3D devid;<br>
+<br>
+=C2=A0 =C2=A0 rc =3D libxl__xs_read_mandatory(gc, XBT_NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GCSPRINTF(&quot;%s/backend&qu=
ot;, libxl_path),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;be_path);<br>
+=C2=A0 =C2=A0 if (rc) goto out;<br>
+<br>
+=C2=A0 =C2=A0 rc =3D libxl__backendpath_parse_domid(gc, be_path, &amp;virt=
io-&gt;backend_domid);<br>
+=C2=A0 =C2=A0 if (rc) goto out;<br>
+<br>
+=C2=A0 =C2=A0 rc =3D libxl__xs_read_checked(gc, XBT_NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GCSPRINTF(&quot;%s/irq&quot;, be_path=
), &amp;tmp);<br>
+=C2=A0 =C2=A0 if (rc) goto out;<br>
+<br>
+=C2=A0 =C2=A0 if (tmp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio-&gt;irq =3D strtoul(tmp, NULL, 0);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 tmp =3D NULL;<br>
+=C2=A0 =C2=A0 rc =3D libxl__xs_read_checked(gc, XBT_NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GCSPRINTF(&quot;%s/base&quot;, be_pat=
h), &amp;tmp);<br>
+=C2=A0 =C2=A0 if (rc) goto out;<br>
+<br>
+=C2=A0 =C2=A0 if (tmp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio-&gt;base =3D strtoul(tmp, NULL, 0);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 tmp =3D NULL;<br>
+=C2=A0 =C2=A0 rc =3D libxl__xs_read_checked(gc, XBT_NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GCSPRINTF(&quot;%s/transport&quot;, b=
e_path), &amp;tmp);<br>
+=C2=A0 =C2=A0 if (rc) goto out;<br>
+<br>
+=C2=A0 =C2=A0 if (tmp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strcmp(tmp, &quot;mmio&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio-&gt;transport =3D LIBXL_V=
IRTIO_TRANSPORT_MMIO;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ERROR_INVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 tmp =3D NULL;<br>
+=C2=A0 =C2=A0 rc =3D libxl__xs_read_checked(gc, XBT_NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GCSPRINTF(&quot;%s/type&quot;, be_pat=
h), &amp;tmp);<br>
+=C2=A0 =C2=A0 if (rc) goto out;<br>
+<br>
+=C2=A0 =C2=A0 if (tmp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int len =3D sizeof(VIRTIO_DEVICE_TYPE_GENERIC)=
 - 1;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strncmp(tmp, VIRTIO_DEVICE_TYPE_GENERIC, =
len)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio-&gt;type =3D libxl__strdu=
p(NOGC, tmp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ERROR_INVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+out:<br>
+=C2=A0 =C2=A0 return rc;<br>
+}<br>
+<br>
+static LIBXL_DEFINE_UPDATE_DEVID(virtio)<br>
+<br>
+#define libxl__add_virtios NULL<br>
+#define libxl_device_virtio_compare NULL<br>
+<br>
+DEFINE_DEVICE_TYPE_STRUCT(virtio, VIRTIO, virtios,<br>
+=C2=A0 =C2=A0 .set_xenstore_config =3D (device_set_xenstore_config_fn_t)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0libxl__set_xenstore_virtio,<br>
+=C2=A0 =C2=A0 .from_xenstore =3D (device_from_xenstore_fn_t)libxl__virtio_=
from_xenstore,<br>
+=C2=A0 =C2=A0 .skip_attach =3D 1<br>
+);<br>
+<br>
+/*<br>
+ * Local variables:<br>
+ * mode: C<br>
+ * c-basic-offset: 4<br>
+ * indent-tabs-mode: nil<br>
+ * End:<br>
+ */<br>
-- <br>
2.31.1.272.g89b43f80a514<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><span style=
=3D"background-color:rgb(255,255,255)"><font size=3D"2"><span style=3D"colo=
r:rgb(51,51,51);font-family:Arial,sans-serif">Regards,</span></font></span>=
</div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div><span style=3D"backg=
round-color:rgb(255,255,255)"><font size=3D"2">Oleksandr Tyshchenko</font><=
/span></div></div></div></div></div></div></div></div>

--0000000000003ba79805efa430fd--

