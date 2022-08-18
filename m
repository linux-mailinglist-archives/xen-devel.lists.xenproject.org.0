Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3E6598E8A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 23:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389788.626922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOmet-0000Br-1x; Thu, 18 Aug 2022 21:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389788.626922; Thu, 18 Aug 2022 21:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOmes-000087-VC; Thu, 18 Aug 2022 21:02:30 +0000
Received: by outflank-mailman (input) for mailman id 389788;
 Thu, 18 Aug 2022 21:02:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wIxV=YW=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oOmer-000081-C9
 for xen-devel@lists.xen.org; Thu, 18 Aug 2022 21:02:29 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 111e741c-1f39-11ed-9250-1f966e50362f;
 Thu, 18 Aug 2022 23:02:28 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id j7so3070785wrh.3
 for <xen-devel@lists.xen.org>; Thu, 18 Aug 2022 14:02:28 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a5d4647000000b002237fd66585sm2221781wrs.92.2022.08.18.14.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 14:02:26 -0700 (PDT)
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
X-Inumbo-ID: 111e741c-1f39-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=GuQcyuaGKDKPP224Chrcs1vbmjpflnRjYi6Mym3IeHw=;
        b=NlvXeejX/qutyflmRu3qCodOKO8PW59n/XOJvStv2FP37/oRez0mLoSRPGuDM4suEk
         3AfwmZM0qa7TSRCpfOYYCvnUZn9QF+S7th2hGItgrknUcdDmSk5nf1h1ysrb1CNWKtbw
         9s9/CgYFl+tHcogMj/ee+RKfW00jdMZ1ByxCkyow9sDJ8fe7ab2jI3f2SnC+7LSKkI9G
         RWwihkMZIh6hIaT0zLB3yO2tLjYXkdbhku1bBdaDB4wFq5PeXbsCQDEBuTgODrKkLTFy
         YS57gqoWI75bvp4/BfjfccMyhBn7Xy7p8EotZ2G83qyQU8Qeyv0ZxbGg56Mg2v1NiMHE
         hEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=GuQcyuaGKDKPP224Chrcs1vbmjpflnRjYi6Mym3IeHw=;
        b=Pcof9eTZhOYWPP9Bo4P103KuygfkiismGMYbIyLbIWQNDuhomMtkumFL70KrFfc7B1
         KAQP4CiM1SHk7YficE5b32oOv0Kpg5mtjdAvCSKPvRSbIZgICtk0jfwWDeOXboRLBWpu
         gHSxw+X9AS0G7IGjuxnLHqz9cNQgsLOGGXvBRcTmlL3Q29b3e9s+9LL+xoKkKL9B3JOn
         lh7gEQYsiD7Lk+BR9QJ808jwRQrRIBd2rapJPUgx2LTIZEg6E7rQono1278ZpkL7lpFO
         0GHcm88HO/lJaO+TtOlqx3P6zi21LXIk0ZE5XlKqVI11JrEMvY8l5DdRlLWvT8mD6/Mi
         Qf6Q==
X-Gm-Message-State: ACgBeo2K+0VNpby/TpC7nmK0Eun++MEOdpgTggoQXHYCtPdWY7vQyv9e
	YD1pP3quOq2iFpagaiOAVVY=
X-Google-Smtp-Source: AA6agR6AhPnloSJ5B8pT4LRfWSb+WRtS9syx/igkP2UDB2rRnWkqvdNA0f0PsecUoVnZOvE4Ii3qng==
X-Received: by 2002:a5d:5e93:0:b0:225:24f5:ed2a with SMTP id ck19-20020a5d5e93000000b0022524f5ed2amr2426292wrb.81.1660856547540;
        Thu, 18 Aug 2022 14:02:27 -0700 (PDT)
Message-ID: <bc9df506-ebb3-47f4-0c4d-58aadb00292c@gmail.com>
Date: Fri, 19 Aug 2022 00:02:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V4 6/6] libxl: Allocate MMIO params for GPIO device and
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
 <f4c77a566ce2a141e2044c859798a11152ce1928.1660023094.git.viresh.kumar@linaro.org>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <f4c77a566ce2a141e2044c859798a11152ce1928.1660023094.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 09.08.22 08:34, Viresh Kumar wrote:

Hello Viresh

> This patch allocates Virtio MMIO params (IRQ and memory region) and pass
> them to the backend, also update Guest device-tree based on Virtio GPIO
> DT bindings [1].
>
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   tools/libs/light/libxl_arm.c | 51 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 51 insertions(+)
>
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 93ea8e3d3fa3..c0ffb7f179d4 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -119,6 +119,15 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>               return rc;
>       }
>   
> +    for (i = 0; i < d_config->num_gpios; i++) {
> +        libxl_device_gpio *gpio = &d_config->gpios[i];
> +

Nit: This blank line is not needed, I think


> +    int rc = alloc_virtio_mmio_params(gc, &gpio->base, &gpio->irq,
> +            &virtio_mmio_base, &virtio_mmio_irq);

Nit: Something wrong with the indentation and looks like the blank line 
is needed here.


> +    if (rc)
> +        return rc;
> +    }
> +
>       /*
>        * Every virtio-mmio device uses one emulated SPI. If Virtio devices are
>        * present, make sure that we allocate enough SPIs for them.
> @@ -976,6 +985,38 @@ static int make_virtio_mmio_node_i2c(libxl__gc *gc, void *fdt, uint64_t base,
>       return fdt_end_node(fdt);
>   }
>   
> +static int make_virtio_mmio_node_gpio(libxl__gc *gc, void *fdt, uint64_t base,
> +                                      uint32_t irq, uint32_t backend_domid)
> +{
> +    int res;
> +
> +    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
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
> @@ -1308,6 +1349,16 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
>                                              i2c->backend_domid) );
>           }
>   
> +        for (i = 0; i < d_config->num_gpios; i++) {
> +            libxl_device_gpio *gpio = &d_config->gpios[i];
> +
> +            if (gpio->backend_domid != LIBXL_TOOLSTACK_DOMID)
> +                iommu_needed = true;
> +
> +            FDT( make_virtio_mmio_node_gpio(gc, fdt, gpio->base, gpio->irq,
> +                                            gpio->backend_domid) );
> +        }
> +
>           /*
>            * Note, this should be only called after creating all virtio-mmio
>            * device nodes


Preferably with above fixed:

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>


-- 
Regards,

Oleksandr Tyshchenko


