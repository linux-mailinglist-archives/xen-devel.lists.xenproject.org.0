Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5500658CF80
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 23:10:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382587.617560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLA0d-0005FT-Cr; Mon, 08 Aug 2022 21:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382587.617560; Mon, 08 Aug 2022 21:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLA0d-0005Cq-9d; Mon, 08 Aug 2022 21:09:59 +0000
Received: by outflank-mailman (input) for mailman id 382587;
 Mon, 08 Aug 2022 21:09:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y+qk=YM=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oLA0b-0005Ck-EL
 for xen-devel@lists.xen.org; Mon, 08 Aug 2022 21:09:57 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7436e0d8-175e-11ed-924f-1f966e50362f;
 Mon, 08 Aug 2022 23:09:56 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id t1so14416805lft.8
 for <xen-devel@lists.xen.org>; Mon, 08 Aug 2022 14:09:56 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 f14-20020ac251ae000000b0048a934168c0sm1536752lfk.35.2022.08.08.14.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 14:09:55 -0700 (PDT)
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
X-Inumbo-ID: 7436e0d8-175e-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=fclTaO0RR7QqFPILVMZmcxoWslEPz/TF0H6dXGpu+9c=;
        b=AfE7XA/+CmYZnI0Mdv4ztZx6YG0jfXPFPoPDtH9r1UFmjlVJbgF/u6prUn1bm+b7e4
         uuoNaHkJsPk/DvZL4tgkH1LogMVPLuv9dPu2gehLEf9Iv/Pg7HvC1W3eDETk2VFwK3Rp
         rfSzn7f/aP5VUQMpar78YbOJJSE8vjsZAja6/LPT/BDE2VRX2xIzXxX8cO+TMS9e4jFk
         uYFTmMKt3i3E2PIqden2c49qKNMAhP9A/pe2s7uHjC5wO1QECmTvIoTbklVzCF9vJzng
         +ZjPjLXTayMDJuMZ7ffDivaloJW/xBO0uvJHE2UC+wQDSazfYDB68C0wJldF8UCXHL1I
         kY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=fclTaO0RR7QqFPILVMZmcxoWslEPz/TF0H6dXGpu+9c=;
        b=2bLpaX1g3JiwgvyLHymC/E672cI4WC7uaC1f1QL9WaOs/jdq5EV9GHBn+r+ZYRu0ys
         MVoMkUFmc4oz2t55zXEbiZbT1xeqk87pZH8XTDjsDJJfs5NNBw8IYh3STZm7DauApxVX
         K/Dz/suIf8Ggn6rmG94DKjk5C1IdGHBpbT/y4cBUqWOF3mpmwI3SaZYoL3zBfnv5DzSf
         IetGbUjAq+RVcWezPpLrjNq5OTK1d3lHWcd9zQ5Wuw7c/cBFNHUMlAzxii8HTpxwq/bi
         KW+qVvChK5Z7svuBNl988zjYYuNbZF0e7vEGyRTXLRqspPfH+il73sjh8lGCLJTz2MJs
         xneQ==
X-Gm-Message-State: ACgBeo1fmZiUzNDjVydUfTICayjZOGQY2/k3QyeyFMhb1XrpqcD3pIf3
	9wpossvwHxjOUnK0FqNRVtE=
X-Google-Smtp-Source: AA6agR6TpbUH1fOvxYXdcCmuYvPM2CZTSzNRVmy7OeJJzxu2UddrXSxID4y/zfXTTf6GqlXMPJJOmg==
X-Received: by 2002:ac2:484e:0:b0:48b:1d04:e37c with SMTP id 14-20020ac2484e000000b0048b1d04e37cmr7094155lfy.320.1659992995891;
        Mon, 08 Aug 2022 14:09:55 -0700 (PDT)
Message-ID: <6b7cc481-78a1-e979-351e-e8135c5afa21@gmail.com>
Date: Tue, 9 Aug 2022 00:09:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 6/6] libxl: Allocate MMIO params for GPIO device and
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
 <20af3a836d0ddd0d73024f8c10f7325e89ef19d8.1659596139.git.viresh.kumar@linaro.org>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <20af3a836d0ddd0d73024f8c10f7325e89ef19d8.1659596139.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 04.08.22 10:01, Viresh Kumar wrote:

Hello Viresh


> This patch allocates Virtio MMIO params (IRQ and memory region) and pass
> them to the backend, also update Guest device-tree based on Virtio GPIO
> DT bindings [1].
>
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   tools/libs/light/libxl_arm.c | 47 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
>
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 08a1499c9523..14b95087f027 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -121,6 +121,15 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>               return rc;
>       }
>   
> +    for (i = 0; i < d_config->num_gpios; i++) {
> +        libxl_device_gpio *gpio = &d_config->gpios[i];
> +
> +    int rc = alloc_virtio_mmio_params(gc, &gpio->base, &gpio->irq,
> +            &virtio_mmio_base, &virtio_mmio_irq);
> +    if (rc)
> +        return rc;
> +    }
> +
>       /*
>        * Every virtio-mmio device uses one emulated SPI. If Virtio devices are
>        * present, make sure that we allocate enough SPIs for them.
> @@ -974,6 +983,38 @@ static int make_virtio_mmio_node_i2c(libxl__gc *gc, void *fdt, uint64_t base,
>       return fdt_end_node(fdt);
>   }
>   
> +static int make_virtio_mmio_node_gpio(libxl__gc *gc, void *fdt, uint64_t base,
> +                                      uint32_t irq)
> +{
> +    int res;
> +
> +    res = make_virtio_mmio_node_common(gc, fdt, base, irq);
> +    if (res) return res;
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
> +    res = fdt_end_node(fdt);
> +    if (res) return res;
> +
> +    return fdt_end_node(fdt);
> +}
> +
>   static const struct arch_info *get_arch_info(libxl__gc *gc,
>                                                const struct xc_dom_image *dom)
>   {
> @@ -1305,6 +1346,12 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
>               FDT( make_virtio_mmio_node_i2c(gc, fdt, i2c->base, i2c->irq) );
>           }
>   
> +        for (i = 0; i < d_config->num_gpios; i++) {
> +            libxl_device_gpio *gpio = &d_config->gpios[i];
> +
> +            FDT( make_virtio_mmio_node_gpio(gc, fdt, gpio->base, gpio->irq) );
> +        }
> +
>           if (pfdt)
>               FDT( copy_partial_fdt(gc, fdt, pfdt) );

I think that patch needs to be updated taking into the account 
suggestions provided for two previous patches (of course, if you agree 
with them).

If so, the make_virtio_mmio_node_gpio() should gain "uint32_t 
backend_domid" argument, etc. And we need to make sure that 
make_xen_iommu_node() will be called for virtio gpio.


Something like the diff on top of current patch below (not tested):

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 9bd8d49f3c..54756b3dd5 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -986,11 +986,11 @@ static int make_virtio_mmio_node_i2c(libxl__gc 
*gc, void *fdt, uint64_t base,
  }

  static int make_virtio_mmio_node_gpio(libxl__gc *gc, void *fdt, 
uint64_t base,
-                                      uint32_t irq)
+                                      uint32_t irq, uint32_t backend_domid)
  {
      int res;

-    res = make_virtio_mmio_node_common(gc, fdt, base, irq);
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
      if (res) return res;

      res = fdt_begin_node(fdt, "gpio");
@@ -1350,8 +1350,11 @@ next_resize:

          for (i = 0; i < d_config->num_gpios; i++) {
              libxl_device_gpio *gpio = &d_config->gpios[i];
+            if (gpio->backend_domid != LIBXL_TOOLSTACK_DOMID)
+                iommu_needed = true;

-            FDT( make_virtio_mmio_node_gpio(gc, fdt, gpio->base, 
gpio->irq) );
+            FDT( make_virtio_mmio_node_gpio(gc, fdt, gpio->base, gpio->irq,
+ gpio->backend_domid) );
          }

          /*

Other changes look good.


>   

-- 
Regards,

Oleksandr Tyshchenko


