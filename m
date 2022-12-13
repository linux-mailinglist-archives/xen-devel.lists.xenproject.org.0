Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA99464B465
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 12:45:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460585.718523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53ih-0006Rc-Ua; Tue, 13 Dec 2022 11:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460585.718523; Tue, 13 Dec 2022 11:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53ih-0006P5-Rj; Tue, 13 Dec 2022 11:45:11 +0000
Received: by outflank-mailman (input) for mailman id 460585;
 Tue, 13 Dec 2022 11:45:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3cNm=4L=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1p53ig-0006Oz-Dh
 for xen-devel@lists.xen.org; Tue, 13 Dec 2022 11:45:10 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efe7723c-7ada-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 12:40:26 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso6205103wmp.3
 for <xen-devel@lists.xen.org>; Tue, 13 Dec 2022 03:45:08 -0800 (PST)
Received: from [10.17.77.104] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 bu4-20020a056000078400b00236576c8eddsm11474105wrb.12.2022.12.13.03.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 03:45:07 -0800 (PST)
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
X-Inumbo-ID: efe7723c-7ada-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HvbQMk0rgwAVWehQmYzA2S5Uu5kHGu8p19NlJk5ENIg=;
        b=VYbV/U1yAmTaqZ3ACn7pLYI/HddPLTP/R5t+yfCjO8EjaqWXc9v02sB2DY/mjgE7o5
         Jft9hwPXYgpp0KYo7AmzTqkut/Xpua9qCmAay/cQvQhH6ry2raanLFasObYUI+EAUlU7
         bxWWN2u8z1Lo0Nczet7sgbqvPPy1GQzZYrTQig8vVe6LPGGScVZNbY/nQws0Chci/MsS
         fq+dUhetnALOhfKB+GhqyhTBLcyMGBvED070+N01G00E7xnGQo7DmERg8jycpk9cOiNf
         hHg4477+BDBNRyCCA63Izk9Im+XyNaavDpZcH2JyGu85F1TlxF9WajT5tmUyr5Is2UMX
         5uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HvbQMk0rgwAVWehQmYzA2S5Uu5kHGu8p19NlJk5ENIg=;
        b=q+xSdCSFaefRC9k9Hj6Fa8dfrLSyHmL8ddlRmVqtbMGbjADNlKHd2Yqd9x2BNumGRf
         ljKyMnb+Ma1sFVUdyjuERFSFWJcQzevVGQsGtNOHlw2VEGvbD5zXQgKbzV0X/9XO1lTy
         pWszYbynp6mBlTlTISJhBCbAbgXwAX+kjkPZseG0ozfbJP0/pyVL/ZyTRGCQEKrlcKAL
         oMBntaBVJzcPY8qVTpL0wGosC9feZChq/5Kgv3WQ0ZiWXEsdTZ6bKNiUVRvM36wbLZCE
         qVqtvTUT7wtsn721eLRmaaD6Yu6sKlSDQVfYCHfNMc0898cUH+pSY7Di3XkuDuRotKRP
         Qliw==
X-Gm-Message-State: ANoB5pnVLDX+8owGvfqvmlDkyeUL6LFjKaJKvssn6C9hp2KHl//iIPUl
	UtNdC0ytl0WS1Reltn5DuwQ=
X-Google-Smtp-Source: AA0mqf6F2qjzVAJgQNa6NhMVVE6wL3lKwPbnWHtopoJG9et890j17igDFo65KhuP7jLl4+RYUYmujw==
X-Received: by 2002:a05:600c:310e:b0:3cf:a39f:eb2a with SMTP id g14-20020a05600c310e00b003cfa39feb2amr15457558wmo.11.1670931907953;
        Tue, 13 Dec 2022 03:45:07 -0800 (PST)
Message-ID: <c86ac2ad-3fc3-7250-052e-45936c807dbd@gmail.com>
Date: Tue, 13 Dec 2022 13:45:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V9 1/3] libxl: Add support for generic virtio device
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Julien Grall <julien@xen.org>, stratos-dev@op-lists.linaro.org,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, xen-devel@lists.xen.org,
 Mathieu Poirier <mathieu.poirier@linaro.com>,
 Mike Holmes <mike.holmes@linaro.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <cover.1670925998.git.viresh.kumar@linaro.org>
 <01dfa7692457a7f40255645f5239f74797e6db3a.1670925998.git.viresh.kumar@linaro.org>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <01dfa7692457a7f40255645f5239f74797e6db3a.1670925998.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13.12.22 12:08, Viresh Kumar wrote:

Hello Viresh

> This patch adds basic support for configuring and assisting generic
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
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   tools/libs/light/Makefile                 |   1 +
>   tools/libs/light/libxl_arm.c              | 100 +++++++++++++++
>   tools/libs/light/libxl_create.c           |   4 +
>   tools/libs/light/libxl_internal.h         |   6 +
>   tools/libs/light/libxl_types.idl          |  18 +++
>   tools/libs/light/libxl_types_internal.idl |   1 +
>   tools/libs/light/libxl_virtio.c           | 144 ++++++++++++++++++++++
>   7 files changed, 274 insertions(+)
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
> index fa3d61f1e882..ddc7b2a15975 100644
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
> @@ -956,6 +969,79 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt, uint64_t base,
>       return fdt_end_node(fdt);
>   }
>   
> +/*
> + * The DT bindings for I2C device are present here:
> + *
> + * https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml
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
> + * https://www.kernel.org/doc/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
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
> +static int make_virtio_mmio_node_device(libxl__gc *gc, void *fdt, uint64_t base,
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
>   static const struct arch_info *get_arch_info(libxl__gc *gc,
>                                                const struct xc_dom_image *dom)
>   {
> @@ -1277,6 +1363,20 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
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
>            * The iommu node should be created only once for all virtio-mmio
>            * devices.
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index 612eacfc7fac..beec3f6b6fec 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -1752,6 +1752,10 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
>           libxl__device_add(gc, domid, &libxl__pvcallsif_devtype,
>                             &d_config->pvcallsifs[i]);
>   
> +    for (i = 0; i < d_config->num_virtios; i++)
> +        libxl__device_add(gc, domid, &libxl__virtio_devtype,
> +                          &d_config->virtios[i]);
> +
>       switch (d_config->c_info.type) {
>       case LIBXL_DOMAIN_TYPE_HVM:
>       {
> diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
> index a7c447c10e5f..97e1e66d98af 100644
> --- a/tools/libs/light/libxl_internal.h
> +++ b/tools/libs/light/libxl_internal.h
> @@ -166,6 +166,11 @@
>   /* Convert pfn to physical address space. */
>   #define pfn_to_paddr(x) ((uint64_t)(x) << XC_PAGE_SHIFT)
>   
> +/* Virtio device types */
> +#define VIRTIO_DEVICE_TYPE_GENERIC   "virtio,device"
> +#define VIRTIO_DEVICE_TYPE_GPIO      "virtio,device22"
> +#define VIRTIO_DEVICE_TYPE_I2C       "virtio,device29"


Sorry for pointing this out only now, I have just realized that this 
doesn't match device-tree bindings. According to the bindings they 
should be the other way around:

#define VIRTIO_DEVICE_TYPE_I2C      "virtio,device22"
#define VIRTIO_DEVICE_TYPE_GPIO       "virtio,device29"


> +
>   /* logging */
>   _hidden void libxl__logv(libxl_ctx *ctx, xentoollog_level msglevel, int errnoval,
>                const char *file /* may be 0 */, int line /* ignored if !file */,
> @@ -4003,6 +4008,7 @@ static inline int *libxl__device_type_get_num(
>   
>   extern const libxl__device_type libxl__vfb_devtype;
>   extern const libxl__device_type libxl__vkb_devtype;
> +extern const libxl__device_type libxl__virtio_devtype;
>   extern const libxl__device_type libxl__disk_devtype;
>   extern const libxl__device_type libxl__nic_devtype;
>   extern const libxl__device_type libxl__vtpm_devtype;
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 9e3d33cb5a59..0cfad8508dbd 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -278,6 +278,11 @@ libxl_vkb_backend = Enumeration("vkb_backend", [
>       (2, "LINUX")
>       ])
>   
> +libxl_virtio_transport = Enumeration("virtio_transport", [
> +    (0, "UNKNOWN"),
> +    (1, "MMIO"),
> +    ])
> +
>   libxl_passthrough = Enumeration("passthrough", [
>       (0, "default"),
>       (1, "disabled"),
> @@ -703,6 +708,18 @@ libxl_device_vkb = Struct("device_vkb", [
>       ("multi_touch_num_contacts", uint32)
>       ])
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
>   libxl_device_disk = Struct("device_disk", [
>       ("backend_domid", libxl_domid),
>       ("backend_domname", string),
> @@ -980,6 +997,7 @@ libxl_domain_config = Struct("domain_config", [
>       ("dtdevs", Array(libxl_device_dtdev, "num_dtdevs")),
>       ("vfbs", Array(libxl_device_vfb, "num_vfbs")),
>       ("vkbs", Array(libxl_device_vkb, "num_vkbs")),
> +    ("virtios", Array(libxl_device_virtio, "num_virtios")),
>       ("vtpms", Array(libxl_device_vtpm, "num_vtpms")),
>       ("p9s", Array(libxl_device_p9, "num_p9s")),
>       ("pvcallsifs", Array(libxl_device_pvcallsif, "num_pvcallsifs")),
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
> index 000000000000..6a38def2faf5
> --- /dev/null
> +++ b/tools/libs/light/libxl_virtio.c
> @@ -0,0 +1,144 @@
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
> +    rc = libxl__backendpath_parse_domid(gc, be_path, &virtio->backend_domid);
> +    if (rc) goto out;
> +
> +    rc = libxl__xs_read_checked(gc, XBT_NULL,
> +				GCSPRINTF("%s/irq", be_path), &tmp);
> +    if (rc) goto out;
> +
> +    if (tmp) {
> +        virtio->irq = strtoul(tmp, NULL, 0);
> +    }
> +
> +    tmp = NULL;
> +    rc = libxl__xs_read_checked(gc, XBT_NULL,
> +				GCSPRINTF("%s/base", be_path), &tmp);
> +    if (rc) goto out;
> +
> +    if (tmp) {
> +        virtio->base = strtoul(tmp, NULL, 0);
> +    }
> +
> +    tmp = NULL;
> +    rc = libxl__xs_read_checked(gc, XBT_NULL,
> +				GCSPRINTF("%s/transport", be_path), &tmp);
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
> +				GCSPRINTF("%s/type", be_path), &tmp);
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

