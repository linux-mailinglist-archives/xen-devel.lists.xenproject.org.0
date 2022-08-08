Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD28F58CF07
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 22:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382580.617549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL9DI-00008M-M9; Mon, 08 Aug 2022 20:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382580.617549; Mon, 08 Aug 2022 20:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL9DI-000058-Im; Mon, 08 Aug 2022 20:19:00 +0000
Received: by outflank-mailman (input) for mailman id 382580;
 Mon, 08 Aug 2022 20:18:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y+qk=YM=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oL9DG-000051-Tq
 for xen-devel@lists.xen.org; Mon, 08 Aug 2022 20:18:59 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53f21bee-1757-11ed-924f-1f966e50362f;
 Mon, 08 Aug 2022 22:18:57 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id r14so11004845ljp.2
 for <xen-devel@lists.xen.org>; Mon, 08 Aug 2022 13:18:55 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a05651236cf00b0048a85bd4429sm1527851lfs.126.2022.08.08.13.18.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 13:18:54 -0700 (PDT)
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
X-Inumbo-ID: 53f21bee-1757-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Mndvt9OOp+f6zb1S3WX5DYIGtfjZlQBFjALJzZjkBxc=;
        b=FyYu36YyK4tZbS0QoNBDkCR/SbmBQncBLa3YMrIMfNoYoZYbC0EQyj/3G5N4CkpbV6
         DbbfBg69WdYaaVG1V23HkEzX/svuo2Wj8EfqChdDXtU3Jq3BcYNHE57Hk5UAUBXdiOrv
         CNhci7n6Y5P1+dhLcK89fTELjNRsEF/4vheuk0oJ2ydr1coHn9GeVMqsh+ZPSc2jseJM
         XyE2Luu3fXsRMXXiX/CFF7Zkx5qZ09WiI7NRMZiNhAl5r02z9sJH562/jM5Q4Dq/bgnw
         E109giR8Gi2oDUrBZEb7XPi0/DXRABYzg9iGkn7Ww3MO21q01pT7VV4c2Rw/1PngVQNP
         0HOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Mndvt9OOp+f6zb1S3WX5DYIGtfjZlQBFjALJzZjkBxc=;
        b=CVQ0bXqIUNHJc5e4vZpIbSZd2Hi/Tbh1B6F+yiw+0X81sSdRWAW3j7QULA93h4iSJx
         t/Cz6sh/ItwLxBkHUldkU6Ir8tsx2TdtGEDzbLxN8FadoNkmvHBI/eUofRazgny4nOt+
         3eDmGbgSrvtnzg/rklPsahvnAWGnbdO8tNrhfdFvFI09RsFSBnp8okGis3Jxt8x4v2NO
         FV5Vg26+Y+5l/9U56oCh/ro58iMXOrf9UmNcvVNOJkMKoyWLEdTlgIFv4yWVgmE0RGXf
         QMN6hmeJVCUbeY4ocKIySoRu9bK5s1eHtDDdgEOhvJKibPkyrzCM5CiqXxAew57BEqip
         JoFA==
X-Gm-Message-State: ACgBeo0SlKi60CuWB1Q28dIGVrwQvoHeaITOOhPVNQ8RWczs2Bs9cggc
	CPykcdME6WsxlIA8rhSWgdw=
X-Google-Smtp-Source: AA6agR7d5D4UzmoeW8jlbhBsshQmE1jDGxSYys2Ha7Ryb/sPKtGx6ejQ66AoLdx5jYsnCk55lPOGhQ==
X-Received: by 2002:a05:651c:543:b0:25f:dbbb:9cd4 with SMTP id q3-20020a05651c054300b0025fdbbb9cd4mr2211948ljp.495.1659989935066;
        Mon, 08 Aug 2022 13:18:55 -0700 (PDT)
Message-ID: <12a8473d-2205-c4ff-26a5-836190158ed0@gmail.com>
Date: Mon, 8 Aug 2022 23:18:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 5/6] libxl: Allocate MMIO params for I2c device and
 update DT
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>, xen-devel@lists.xen.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>
References: <cover.1659596139.git.viresh.kumar@linaro.org>
 <8dbee989789fdd872256a8679278e174c8c2bdb0.1659596139.git.viresh.kumar@linaro.org>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <8dbee989789fdd872256a8679278e174c8c2bdb0.1659596139.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 04.08.22 10:01, Viresh Kumar wrote:

Hello Viresh

> This patch allocates Virtio MMIO params (IRQ and memory region) and pass
> them to the backend, also update Guest device-tree based on Virtio I2C
> DT bindings [1].
>
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   tools/libs/light/libxl_arm.c | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
>
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 6a8c4d042bd9..08a1499c9523 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -112,6 +112,15 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>           }
>       }
>   
> +    for (i = 0; i < d_config->num_i2cs; i++) {
> +        libxl_device_i2c *i2c = &d_config->i2cs[i];
> +
> +        int rc = alloc_virtio_mmio_params(gc, &i2c->base, &i2c->irq,
> +                &virtio_mmio_base, &virtio_mmio_irq);
> +        if (rc)
> +            return rc;
> +    }
> +
>       /*
>        * Every virtio-mmio device uses one emulated SPI. If Virtio devices are
>        * present, make sure that we allocate enough SPIs for them.
> @@ -945,6 +954,26 @@ static int make_virtio_mmio_node_simple(libxl__gc *gc, void *fdt, uint64_t base,
>       return fdt_end_node(fdt);
>   }
>   
> +static int make_virtio_mmio_node_i2c(libxl__gc *gc, void *fdt, uint64_t base,
> +                                     uint32_t irq)
> +{
> +    int res;
> +
> +    res = make_virtio_mmio_node_common(gc, fdt, base, irq);
> +    if (res) return res;
> +
> +    res = fdt_begin_node(fdt, "i2c");
> +    if (res) return res;
> +
> +    res = fdt_property_compat(gc, fdt, 1, "virtio,device22");
> +    if (res) return res;
> +
> +    res = fdt_end_node(fdt);
> +    if (res) return res;
> +
> +    return fdt_end_node(fdt);
> +}
> +
>   static const struct arch_info *get_arch_info(libxl__gc *gc,
>                                                const struct xc_dom_image *dom)
>   {
> @@ -1270,6 +1299,12 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
>               }
>           }
>   
> +        for (i = 0; i < d_config->num_i2cs; i++) {
> +            libxl_device_i2c *i2c = &d_config->i2cs[i];
> +
> +            FDT( make_virtio_mmio_node_i2c(gc, fdt, i2c->base, i2c->irq) );
> +        }
> +
>           if (pfdt)
>               FDT( copy_partial_fdt(gc, fdt, pfdt) );


I think that patch needs to be updated according to the suggestion 
provided for "[PATCH V3 4/6] libxl: arm: Split make_virtio_mmio_node()" 
(of course, if you agree with it).

If so, the make_virtio_mmio_node_i2c() should gain "uint32_t 
backend_domid" argument, etc. And with introducing new virtio i2c the 
make_xen_iommu_node() should also be called for it if not created yet 
(or maybe better to have only single invocation of make_xen_iommu_node() 
at the end)


Something like the diff on top of current patch below (not tested):

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 0e448c486b..725ccb5f3f 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -957,11 +957,11 @@ static int make_virtio_mmio_node_simple(libxl__gc 
*gc, void *fdt, uint64_t base,
  }

  static int make_virtio_mmio_node_i2c(libxl__gc *gc, void *fdt, 
uint64_t base,
-                                     uint32_t irq)
+                                     uint32_t irq, uint32_t backend_domid)
  {
      int res;

-    res = make_virtio_mmio_node_common(gc, fdt, base, irq);
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
      if (res) return res;

      res = fdt_begin_node(fdt, "i2c");
@@ -1177,7 +1177,7 @@ static int libxl__prepare_dtb(libxl__gc *gc, 
libxl_domain_config *d_config,
      size_t fdt_size = 0;
      int pfdt_size = 0;
      libxl_domain_build_info *const info = &d_config->b_info;
-    bool iommu_created;
+    bool iommu_needed;
      unsigned int i;

      const libxl_version_info *vers;
@@ -1285,16 +1285,13 @@ next_resize:
          if (d_config->num_pcidevs)
              FDT( make_vpci_node(gc, fdt, ainfo, dom) );

-        iommu_created = false;
+        iommu_needed = false;
          for (i = 0; i < d_config->num_disks; i++) {
              libxl_device_disk *disk = &d_config->disks[i];

              if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
-                if (disk->backend_domid != LIBXL_TOOLSTACK_DOMID &&
-                    !iommu_created) {
-                    FDT( make_xen_iommu_node(gc, fdt) );
-                    iommu_created = true;
-                }
+                if (disk->backend_domid != LIBXL_TOOLSTACK_DOMID)
+                    iommu_needed = true;

                  FDT( make_virtio_mmio_node_simple(gc, fdt, disk->base,
                                              disk->irq, 
disk->backend_domid) );
@@ -1303,10 +1300,20 @@ next_resize:

          for (i = 0; i < d_config->num_i2cs; i++) {
              libxl_device_i2c *i2c = &d_config->i2cs[i];
+            if (i2c->backend_domid != LIBXL_TOOLSTACK_DOMID)
+                iommu_needed = true;

-            FDT( make_virtio_mmio_node_i2c(gc, fdt, i2c->base, i2c->irq) );
+            FDT( make_virtio_mmio_node_i2c(gc, fdt, i2c->base, i2c->irq,
+                                           i2c->backend_domid) );
          }

+        /*
+         * Note, this should be only called after creating all virtio-mmio
+         * device nodes
+         */
+        if (iommu_needed)
+            FDT( make_xen_iommu_node(gc, fdt) );
+
          if (pfdt)
              FDT( copy_partial_fdt(gc, fdt, pfdt) );

(END)


Other changes look good.


>   

-- 
Regards,

Oleksandr Tyshchenko


