Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 072A8598E57
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 22:50:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389781.626911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOmTF-000709-Rc; Thu, 18 Aug 2022 20:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389781.626911; Thu, 18 Aug 2022 20:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOmTF-0006yM-Nv; Thu, 18 Aug 2022 20:50:29 +0000
Received: by outflank-mailman (input) for mailman id 389781;
 Thu, 18 Aug 2022 20:50:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wIxV=YW=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oOmTD-0006yG-Nw
 for xen-devel@lists.xen.org; Thu, 18 Aug 2022 20:50:27 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62ed0a84-1f37-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 22:50:26 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 m17-20020a7bce11000000b003a5bedec07bso3201111wmc.0
 for <xen-devel@lists.xen.org>; Thu, 18 Aug 2022 13:50:26 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 k40-20020a05600c1ca800b003a317ee3036sm3746919wms.2.2022.08.18.13.50.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 13:50:25 -0700 (PDT)
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
X-Inumbo-ID: 62ed0a84-1f37-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=8fDJvyemIy+dOWlcxsfh5pVy59L+pF8d8Lk2w1rkAzM=;
        b=SIMqKkA/cDvLOCqkxg2L1xRD+okIeBf2V4mtif7rin9Br7TV8wHx9jW3Rkhz0W2L30
         lhyv/+LmIphCPOud/Sf6zmeJcAdFOu52E3I1sKVZwn9IOgb6DPyirlHSAzw50yevydwJ
         8YjTXzPGnhz8kKzkuEXjUFKEV1s3OjEsELVxhFfueuWfuUaC0EQeyuWYgfAKkydyFkeT
         XAlDLJs4ynS4x5koGNqhnnm0XXUAKf7QeN1JhQcjbp+OzmXXe27clUPkHxl9hLk1m+cE
         /JIILhbmd1Werj45PQ280OeCFmoXHHcfHjRHshwegKvfUPcMy1tjMD5HkpehJy11kmqI
         yKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=8fDJvyemIy+dOWlcxsfh5pVy59L+pF8d8Lk2w1rkAzM=;
        b=wIJksXQ6i0w5P5mNWbm1Vd1T9rGLtScGxZL6dL4xPbM5ZOQJLERzv+CgQ2xDbh100O
         OQ6XzTwGusTQh0j4/ZwUwK8yBSDO3eZp5HSkoQ+KcGmzb5YGEecPzTlrEXsA4Asaco2b
         SUnMHUiOJUE9W6yjlEZTdDLQL9BntSDswtMpT8Ssy9nTz1kt1aALTOjKXUADdLlGaFnt
         1qzF3Bf0kJX1fdQYN3xRBqeT48jFn2mOTjuwZOMyXeRdwOZzioDUYjkAskjEqk5uWAtR
         PNnasyTXSrmn4p8uch/jRb30Gb+nSJ2bW+8OGYLJ731Id1BJAM3ucL9lxLtGoKKWVQcU
         ighw==
X-Gm-Message-State: ACgBeo02GXzME7scIS4N4v49s8kkeKnrBbZVuuwSyYV5sPUYuS8FRXl3
	ewJbkuct7t6MZJpp7rUK6Mc=
X-Google-Smtp-Source: AA6agR70KpwKhsBX+l9PLTnGbwCHQ0i0d2KcI+BRMYwWjyQa8WFPO7wfsxIiaCqM8R6nJOibH+n5aw==
X-Received: by 2002:a7b:cb55:0:b0:3a5:41a:829c with SMTP id v21-20020a7bcb55000000b003a5041a829cmr6208548wmj.153.1660855825734;
        Thu, 18 Aug 2022 13:50:25 -0700 (PDT)
Message-ID: <527e8e57-4032-8c8c-4e98-969b980b7d9d@gmail.com>
Date: Thu, 18 Aug 2022 23:50:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V4 5/6] libxl: Allocate MMIO params for I2c device and
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
References: <cover.1660023094.git.viresh.kumar@linaro.org>
 <762932ad90785d31039343d543da14c84ce8327d.1660023094.git.viresh.kumar@linaro.org>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <762932ad90785d31039343d543da14c84ce8327d.1660023094.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 09.08.22 08:34, Viresh Kumar wrote:

Hello Viresh

> This patch allocates Virtio MMIO params (IRQ and memory region) and pass
> them to the backend, also update Guest device-tree based on Virtio I2C
> DT bindings [1].

Nit: Patch does more than it claims in the description, I am speaking 
about the changes

related to make_xen_iommu_node(). So I would add a sentence about that here.


>
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   tools/libs/light/libxl_arm.c | 57 +++++++++++++++++++++++++++++++-----
>   1 file changed, 50 insertions(+), 7 deletions(-)
>
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 891cb6ef2674..93ea8e3d3fa3 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -110,6 +110,15 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>           }
>       }
>   
> +    for (i = 0; i < d_config->num_i2cs; i++) {
> +        libxl_device_i2c *i2c = &d_config->i2cs[i];
> +

Nit: This blank line is not needed, I think


> +        int rc = alloc_virtio_mmio_params(gc, &i2c->base, &i2c->irq,
> +                &virtio_mmio_base, &virtio_mmio_irq);

Nit: Something wrong with the indentation and looks like the blank line 
is needed here.

> +        if (rc)
> +            return rc;
> +    }
> +
>       /*
>        * Every virtio-mmio device uses one emulated SPI. If Virtio devices are
>        * present, make sure that we allocate enough SPIs for them.
> @@ -947,6 +956,26 @@ static int make_virtio_mmio_node_simple(libxl__gc *gc, void *fdt, uint64_t base,
>       return fdt_end_node(fdt);
>   }
>   
> +static int make_virtio_mmio_node_i2c(libxl__gc *gc, void *fdt, uint64_t base,
> +                                     uint32_t irq, uint32_t backend_domid)
> +{
> +    int res;
> +
> +    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
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
> @@ -1148,7 +1177,7 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
>       size_t fdt_size = 0;
>       int pfdt_size = 0;
>       libxl_domain_build_info *const info = &d_config->b_info;
> -    bool iommu_created;
> +    bool iommu_needed;
>       unsigned int i;
>   
>       const libxl_version_info *vers;
> @@ -1256,22 +1285,36 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
>           if (d_config->num_pcidevs)
>               FDT( make_vpci_node(gc, fdt, ainfo, dom) );
>   
> -        iommu_created = false;
> +        iommu_needed = false;
>           for (i = 0; i < d_config->num_disks; i++) {
>               libxl_device_disk *disk = &d_config->disks[i];
>   
>               if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
> -                if (disk->backend_domid != LIBXL_TOOLSTACK_DOMID &&
> -                    !iommu_created) {
> -                    FDT( make_xen_iommu_node(gc, fdt) );
> -                    iommu_created = true;
> -                }
> +                if (disk->backend_domid != LIBXL_TOOLSTACK_DOMID)
> +                    iommu_needed = true;
>   
>                   FDT( make_virtio_mmio_node_simple(gc, fdt, disk->base,
>                                               disk->irq, disk->backend_domid) );
>               }
>           }
>   
> +        for (i = 0; i < d_config->num_i2cs; i++) {
> +            libxl_device_i2c *i2c = &d_config->i2cs[i];
> +
> +            if (i2c->backend_domid != LIBXL_TOOLSTACK_DOMID)
> +                iommu_needed = true;
> +
> +            FDT( make_virtio_mmio_node_i2c(gc, fdt, i2c->base, i2c->irq,
> +                                           i2c->backend_domid) );
> +        }
> +
> +        /*
> +         * Note, this should be only called after creating all virtio-mmio
> +         * device nodes
> +         */
> +        if (iommu_needed)
> +            FDT( make_xen_iommu_node(gc, fdt) );
> +
>           if (pfdt)
>               FDT( copy_partial_fdt(gc, fdt, pfdt) );


Preferably with above fixed:


Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>


>   

-- 
Regards,

Oleksandr Tyshchenko


