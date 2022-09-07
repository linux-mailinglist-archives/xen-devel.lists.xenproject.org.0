Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911405B0C13
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 20:03:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402130.644137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVzNf-0006mw-Dp; Wed, 07 Sep 2022 18:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402130.644137; Wed, 07 Sep 2022 18:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVzNf-0006l7-BC; Wed, 07 Sep 2022 18:02:31 +0000
Received: by outflank-mailman (input) for mailman id 402130;
 Wed, 07 Sep 2022 18:02:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YTO0=ZK=xen.org=julien@srs-se1.protection.inumbo.net>)
 id 1oVzNd-0006l1-LZ
 for xen-devel@lists.xen.org; Wed, 07 Sep 2022 18:02:29 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c11ba3a-2ed7-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 20:02:28 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVzNa-0003au-H7; Wed, 07 Sep 2022 18:02:26 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVzNa-00056U-9q; Wed, 07 Sep 2022 18:02:26 +0000
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
X-Inumbo-ID: 3c11ba3a-2ed7-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=0zIZK5RsJMZZGiNX1CvKYFkNjVf7mYTEFPgVazl8pWI=; b=m9cKiAIEUSa49C223w52rm9waS
	jWWaX1VeBEdwZssm9ZnpXp+Re5Uu1JhqzlaXVE8IrDqEvOCfMq+EvRnG+CJWVbFjacSoAqLiMrLm9
	1oVNhX1kvr9lBjvJSgLBgl3VRSQ4AwgSFcjElguE7ypRFOH5YVMQbPQBA3JXOG0HEROc=;
Message-ID: <855f6a63-5315-d9ff-780c-9512b5a89bd6@xen.org>
Date: Wed, 7 Sep 2022 19:02:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH V5 6/6] libxl: Allocate MMIO params for GPIO device and
 update DT
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>, xen-devel@lists.xen.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, anthony.perard@citrix.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1661159474.git.viresh.kumar@linaro.org>
 <4a238937ceb803f494e5633a3a779866383bd463.1661159474.git.viresh.kumar@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4a238937ceb803f494e5633a3a779866383bd463.1661159474.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ Bertrand)

Hi Viresh,

On 22/08/2022 10:15, Viresh Kumar wrote:
> This patch allocates Virtio MMIO params (IRQ and memory region) and pass
> them to the backend, also update Guest device-tree based on Virtio GPIO
> DT bindings [1].
> 
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
> 
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   tools/libs/light/libxl_arm.c | 51 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 51 insertions(+)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 4c1012e56893..86c1e560900f 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -121,6 +121,15 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>               return rc;
>       }
>   
> +    for (i = 0; i < d_config->num_gpios; i++) {
> +        libxl_device_gpio *gpio = &d_config->gpios[i];
> +    int rc = alloc_virtio_mmio_params(gc, &gpio->base, &gpio->irq,
> +                                      &virtio_mmio_base, &virtio_mmio_irq);
> +
> +    if (rc)
> +        return rc;
> +    }
> +
>       /*
>        * Every virtio-mmio device uses one emulated SPI. If Virtio devices are
>        * present, make sure that we allocate enough SPIs for them.
> @@ -984,6 +993,38 @@ static int make_virtio_mmio_node_i2c(libxl__gc *gc, void *fdt, uint64_t base,
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

It is a very descriptive compatible :). And yes I realize this is the 
compatible chosen by upstream.

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
> @@ -1317,6 +1358,16 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
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

So this is exposing a GPIO interrupt controller but IIUC we will also 
need to describe the devices in the device-tree. Can you outline how you 
would expect it to work?

To put some context, this is related to what I wrote in patch #1. How 
much code will be necessary in libxl to add new device?

I am not the maintainer of this code, but I would expect some example 
how this can be used once this merged. This would help us to understand 
whether the interface is correct.

Cheers,

-- 
Julien Grall

