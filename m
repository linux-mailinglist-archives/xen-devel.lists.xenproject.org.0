Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 097E851EEF1
	for <lists+xen-devel@lfdr.de>; Sun,  8 May 2022 18:23:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324070.545982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnjfx-0000gv-QJ; Sun, 08 May 2022 16:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324070.545982; Sun, 08 May 2022 16:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnjfx-0000em-MN; Sun, 08 May 2022 16:22:29 +0000
Received: by outflank-mailman (input) for mailman id 324070;
 Sun, 08 May 2022 16:22:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1pl+=VQ=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nnjfw-0000eg-LI
 for xen-devel@lists.xen.org; Sun, 08 May 2022 16:22:28 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ce68bdb-ceeb-11ec-8fc4-03012f2f19d4;
 Sun, 08 May 2022 18:22:27 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id p26so6870986lfh.10
 for <xen-devel@lists.xen.org>; Sun, 08 May 2022 09:22:27 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 h22-20020a056512221600b0047255d21100sm1596463lfu.47.2022.05.08.09.22.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 May 2022 09:22:25 -0700 (PDT)
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
X-Inumbo-ID: 0ce68bdb-ceeb-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ZVN1ItfsN1Qmb4kY3fi0Ttt70ALg1dF1ykX9870ihD8=;
        b=dDNG3dUceOhEkV44kGi9nIZXY0/tMjWZN4P1Vqbf/4vpX2+sBPjXp5GNH142L6K20S
         yv/bcuYZn9/5fNjfod5UGKtPWnQLbqJLvoBwEeb6UeVJJAzAQpGA5+QhklFv6Abg0EoT
         CrtivEmirKy/DM7kB4ncwEyindPV/bdjtTf74fQ8tf7BNvZ4gUiICKv+VlHxZdnZHjZx
         pH5Rv0MsMMMyDZO16wE+dKm2Ga4oe0s0P05X6iwDVC8R1GgLuj53AgLodOtrzytRWl12
         foc52pM/6+5+MZUwAKbC217Wl/blG8LPdoi7s44AJtJN8W1vayV4ssxTUwgeduBWlIcG
         Y3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ZVN1ItfsN1Qmb4kY3fi0Ttt70ALg1dF1ykX9870ihD8=;
        b=hidq+r5/07Vcdcocii9gRlmIL1GpbXa/atO9dTg8hWkar/IABaQsyRAa7Y17qOlMzq
         juFwLjUxY9MrrGGxIdYR6CrHuLjdQU1BxMLKhHvL6RKwPfbh+ZMtPMtN5nyymcBmQw2D
         lvbkJYvoCf5FIjMjBMgHokkP2jg9D/G6DXCT866CcALCi5hNkjOZ1Cy06F4M9DIgEEfg
         WtiyzVYzKWSAlVNmisGQaEackLPWFfbSr3Tr+xr+hHzdSOhQbuorllNpnBX8V3AQxqWw
         FTy7YzIez2ctep28A7UFgmuRRlhw5quYnVc/BPNmOZarQle9Xzj4l4a/TCnGIgRcrgq+
         DNVQ==
X-Gm-Message-State: AOAM532FytOMeUCmw7LgcSGuLHnaAuvZPCrZomjewTI4YL23coakQd9H
	mtdQoGIAfIXtZXVDF5EofoM=
X-Google-Smtp-Source: ABdhPJw11DECU6dpnRLgAr1LpmkI7H6nEjzWDh/7TUMAGsDlDUF+qfUabAgUyyqkFgaPpN7+e9jIqw==
X-Received: by 2002:a05:6512:a88:b0:473:e080:40e8 with SMTP id m8-20020a0565120a8800b00473e08040e8mr9785101lfu.359.1652026946701;
        Sun, 08 May 2022 09:22:26 -0700 (PDT)
Subject: Re: [PATCH 4/4] libxl: Allocate MMIO params for GPIO device and
 update DT
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: xen-devel@lists.xen.org, Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>
References: <cover.1651734854.git.viresh.kumar@linaro.org>
 <0b8d38ef26bfa9bc150f3818108ca9e875652e5e.1651734854.git.viresh.kumar@linaro.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <f5682bad-558a-7a11-1b7b-407d0682d2dd@gmail.com>
Date: Sun, 8 May 2022 19:22:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0b8d38ef26bfa9bc150f3818108ca9e875652e5e.1651734854.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 05.05.22 10:33, Viresh Kumar wrote:


Hello Viresh

> This patch allocates Virtio MMIO params (IRQ and memory region) and pass
> them to the backend, also update Guest device-tree.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   tools/libs/light/libxl_arm.c | 60 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 60 insertions(+)
>
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index ea633d6f91df..89e5a1e5780d 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -135,6 +135,26 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>               i2c->irq, i2c->base);
>       }
>   
> +    for (i = 0; i < d_config->num_gpios; i++) {
> +        libxl_device_gpio *gpio = &d_config->gpios[i];
> +
> +        gpio->base = alloc_virtio_mmio_base(gc);
> +        if (!gpio->base)
> +            return ERROR_FAIL;
> +
> +        gpio->irq = alloc_virtio_mmio_irq(gc);
> +        if (!gpio->irq)
> +            return ERROR_FAIL;
> +
> +        if (virtio_irq < gpio->irq)
> +            virtio_irq = gpio->irq;
> +
> +        virtio_enabled = true;
> +
> +        LOG(DEBUG, "Allocate Virtio MMIO params for GPIO: IRQ %u BASE 0x%"PRIx64,
> +            gpio->irq, gpio->base);
> +    }
> +


Looks like, we are going to end up with some duplication in 
libxl__arch_domain_prepare_config(). This is already a third chunk (the 
second was in patch #3/4).
I would probably consider moving some code to a separate function.
Below the non-tested diff (based on the recent V8 patch [1]), how it 
could look like. I am not sure this is an ideal variant, but rather to 
demonstrate what I mean.

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 25969e0..6e23c26 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -48,6 +48,23 @@ static uint32_t alloc_virtio_mmio_irq(libxl__gc *gc, 
uint32_t *virtio_mmio_irq)
      return irq;
  }

+static int alloc_virtio_mmio_params(libxl__gc *gc, uint64_t *base, 
uint32_t *irq,
+                                    uint64_t *virtio_mmio_base,
+                                    uint32_t *virtio_mmio_irq)
+{
+    *base = alloc_virtio_mmio_base(gc, virtio_mmio_base);
+    if (!*base)
+        return ERROR_FAIL;
+
+    *irq = alloc_virtio_mmio_irq(gc, virtio_mmio_irq);
+    if (!*irq)
+        return ERROR_FAIL;
+
+    LOG(DEBUG, "Allocate Virtio MMIO params: IRQ %u BASE 0x%"PRIx64, 
*irq, *base);
+
+    return 0;
+}
+
  static const char *gicv_to_string(libxl_gic_version gic_version)
  {
      switch (gic_version) {
@@ -85,25 +102,18 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
          libxl_device_disk *disk = &d_config->disks[i];

          if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
-            disk->base = alloc_virtio_mmio_base(gc, &virtio_mmio_base);
-            if (!disk->base)
-                return ERROR_FAIL;
-
-            disk->irq = alloc_virtio_mmio_irq(gc, &virtio_mmio_irq);
-            if (!disk->irq)
-                return ERROR_FAIL;
-
-            if (virtio_irq < disk->irq)
-                virtio_irq = disk->irq;
-            virtio_enabled = true;
-
-            LOG(DEBUG, "Allocate Virtio MMIO params for Vdev %s: IRQ %u 
BASE 0x%"PRIx64,
-                disk->vdev, disk->irq, disk->base);
+            int rc = alloc_virtio_mmio_params(gc, &disk->base, &disk->irq,
+ &virtio_mmio_base, &virtio_mmio_irq);
+            if (rc)
+                return rc;
          }
      }

-    if (virtio_enabled)
+    if (virtio_mmio_irq != GUEST_VIRTIO_MMIO_SPI_FIRST) {
+        virtio_irq = virtio_mmio_irq - 1;
          nr_spis += (virtio_irq - 32) + 1;
+        virtio_enabled = true;
+    }

      for (i = 0; i < d_config->b_info.num_irqs; i++) {
          uint32_t irq = d_config->b_info.irqs[i];
(END)


So, if this was done before (in a prereq patch), your new addition here 
would be just the following:


diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 6e23c26..ae64cbd 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -109,6 +109,14 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
          }
      }

+    for (i = 0; i < d_config->num_gpios; i++) {
+        libxl_device_gpio *gpio = &d_config->gpios[i];
+        int rc = alloc_virtio_mmio_params(gc, &gpio->base, &gpio->irq,
+                                          &virtio_mmio_base, 
&virtio_mmio_irq);
+        if (rc)
+            return rc;
+    }
+
      if (virtio_mmio_irq != GUEST_VIRTIO_MMIO_SPI_FIRST) {
          virtio_irq = virtio_mmio_irq - 1;
          nr_spis += (virtio_irq - 32) + 1;


>       if (virtio_enabled)
>           nr_spis += (virtio_irq - 32) + 1;
>   
> @@ -954,6 +974,41 @@ static int make_virtio_mmio_node_i2c(libxl__gc *gc, void *fdt,
>       return 0;
>   }
>   
> +static int make_virtio_mmio_node_gpio(libxl__gc *gc, void *fdt,
> +                                 uint64_t base, uint32_t irq)
> +{
> +    int res;
> +
> +    res = _make_virtio_mmio_node(gc, fdt, base, irq);
> +    if (res) return res;
> +
> +    res = fdt_begin_node(fdt, "gpio");
> +    if (res) return res;
> +
> +    res = fdt_property_compat(gc, fdt, 1, "virtio,device29");

Please provide a link (in the commit description) to the corresponding
Linux device tree binding. I assume it is:

Documentation/devicetree/bindings/gpio/gpio-virtio.yaml


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
> +    res = fdt_end_node(fdt);
> +    if (res) return res;
> +
> +    res = fdt_end_node(fdt);
> +    if (res) return res;
> +
> +    return 0;
> +}
> +
>   static const struct arch_info *get_arch_info(libxl__gc *gc,
>                                                const struct xc_dom_image *dom)
>   {
> @@ -1269,6 +1324,11 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
>                   FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq) );
>           }
>   
> +        for (i = 0; i < d_config->num_gpios; i++) {
> +            libxl_device_gpio *gpio = &d_config->gpios[i];
> +            FDT( make_virtio_mmio_node_gpio(gc, fdt, gpio->base, gpio->irq) );
> +        }
> +
>           for (i = 0; i < d_config->num_i2cs; i++) {
>               libxl_device_i2c *i2c = &d_config->i2cs[i];
>               FDT( make_virtio_mmio_node_i2c(gc, fdt, i2c->base, i2c->irq) );


[1] 
https://lore.kernel.org/xen-devel/1651598763-12162-3-git-send-email-olekstysh@gmail.com/


-- 
Regards,

Oleksandr Tyshchenko


