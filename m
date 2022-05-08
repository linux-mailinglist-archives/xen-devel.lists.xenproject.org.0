Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BEB51EE96
	for <lists+xen-devel@lfdr.de>; Sun,  8 May 2022 17:30:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324054.545960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nniqb-0001vW-Lx; Sun, 08 May 2022 15:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324054.545960; Sun, 08 May 2022 15:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nniqb-0001sk-IU; Sun, 08 May 2022 15:29:25 +0000
Received: by outflank-mailman (input) for mailman id 324054;
 Sun, 08 May 2022 15:29:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1pl+=VQ=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nniqa-0001se-0t
 for xen-devel@lists.xen.org; Sun, 08 May 2022 15:29:24 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2ed176c-cee3-11ec-a406-831a346695d4;
 Sun, 08 May 2022 17:29:23 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id s27so14417895ljd.2
 for <xen-devel@lists.xen.org>; Sun, 08 May 2022 08:29:22 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 i38-20020a0565123e2600b0047255d211a5sm1571754lfv.212.2022.05.08.08.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 May 2022 08:29:21 -0700 (PDT)
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
X-Inumbo-ID: a2ed176c-cee3-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=TPJZvkVngAln1O8pkkTy/BND3SA2mso/c6GA+lTw/Es=;
        b=JJOXkCVjEm954y79H+Sqs1TKNZ9tRegNS8FEP3Ev11lz+ClaPjkLTkKzKlXabaHg+L
         9UoqJeOki3gWi+49YrYP9DFYQUbJ/Jg2hcxM7BNzew+1ZX/jWzRY4UwFPlW8K2VpjcHD
         ofO/eLC+K7gpSWr/8IrN1ermda1P/Xcris8iuZtBo+TGhRhZaVFdeQ52eZ1zYoHj28h0
         iM5xIbC+XZtE/gQku3bfGAemJJlYIw612EmzWdBVBhC81DQhZQC6iZPX9h/3arCtvyTH
         NY3Vooudg17Fpw2r6cEcs6q1baCsnJQvL3lacOmChqQh6Qdf0vvPTSQ4CcCE1KSQE3U4
         bauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=TPJZvkVngAln1O8pkkTy/BND3SA2mso/c6GA+lTw/Es=;
        b=rEPiP6/zeRye2dsPE+oG8QW4gNdEHqw8Xs7TZjmDhpG5Z7lfYyhIUlqkWW5C4nwQPI
         DVQXVkXOLRLkXsYcuY5x/QVkl7lLs8T4zYMjR/o31AXqIMmxzZkz90eRSOBhn4tdYq2p
         PWI4kHBh2b+GLZzR3wclnqKZEQP5Y1A0d/dQWydjM+7CV3N3lfvNQnCKhcwjjqvIsuVl
         2AQZItr+kACvRAgGBVH6lsM/mngvJ/xIK5xYkK/aUcpMndW/nDjzx2WkuIFPckrPef5Q
         fiN9DW4QvVKmog17vN0N6D0K946w1pR7871KE8Awrp17jV6QHbvkiYeGvBFuOpjxsTBL
         rNiw==
X-Gm-Message-State: AOAM532o5RSqp7FASC1gaO7EGOMU8yW9K1BYm+os8Krulzd0H05Ogyz9
	SweYpeCIJvg8VZHn3y6dNlg=
X-Google-Smtp-Source: ABdhPJwgIA/8OvUSydPmWxcsTzRrElEcZw8tPQ6hPhQLhWxrnBB2uHJXxpRwFOy3jGHb5ZXd24WLYw==
X-Received: by 2002:a05:651c:19aa:b0:250:60b9:2301 with SMTP id bx42-20020a05651c19aa00b0025060b92301mr7973492ljb.69.1652023762325;
        Sun, 08 May 2022 08:29:22 -0700 (PDT)
Subject: Re: [PATCH 3/4] libxl: Allocate MMIO params for I2c device and update
 DT
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: xen-devel@lists.xen.org, Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>
References: <cover.1651734854.git.viresh.kumar@linaro.org>
 <aa5335be86c926555e12d5d3d54afa5b29059be3.1651734854.git.viresh.kumar@linaro.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <35e9f70d-3077-067a-afae-4ad11019f764@gmail.com>
Date: Sun, 8 May 2022 18:29:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <aa5335be86c926555e12d5d3d54afa5b29059be3.1651734854.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 05.05.22 10:33, Viresh Kumar wrote:

Hello Viresh


> This patch allocates Virtio MMIO params (IRQ and memory region) and pass
> them to the backend, also update Guest device-tree.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   tools/libs/light/libxl_arm.c | 57 ++++++++++++++++++++++++++++++++++--
>   1 file changed, 55 insertions(+), 2 deletions(-)
>
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 8132a47a72b6..ea633d6f91df 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -115,6 +115,26 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>           }
>       }
>   
> +    for (i = 0; i < d_config->num_i2cs; i++) {
> +        libxl_device_i2c *i2c = &d_config->i2cs[i];
> +
> +        i2c->base = alloc_virtio_mmio_base(gc);
> +        if (!i2c->base)
> +            return ERROR_FAIL;
> +
> +        i2c->irq = alloc_virtio_mmio_irq(gc);
> +        if (!i2c->irq)
> +            return ERROR_FAIL;
> +
> +        if (virtio_irq < i2c->irq)
> +            virtio_irq = i2c->irq;
> +
> +        virtio_enabled = true;
> +
> +        LOG(DEBUG, "Allocate Virtio MMIO params for I2C: IRQ %u BASE 0x%"PRIx64,
> +            i2c->irq, i2c->base);
> +    }
> +
>       if (virtio_enabled)
>           nr_spis += (virtio_irq - 32) + 1;
>   
> @@ -874,7 +894,7 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
>   }
>   
>   
> -static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
> +static int _make_virtio_mmio_node(libxl__gc *gc, void *fdt,
>                                    uint64_t base, uint32_t irq)


NIT: I am not sure the leading underscore in the name would be welcome. 
I would probably rename it.

How about s/_make_virtio_mmio_node/make_virtio_mmio_node_common here and ...



>   {
>       int res;
> @@ -897,7 +917,35 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
>       res = fdt_property_interrupts(gc, fdt, &intr, 1);
>       if (res) return res;
>   
> -    res = fdt_property(fdt, "dma-coherent", NULL, 0);
> +    return fdt_property(fdt, "dma-coherent", NULL, 0);
> +}
> +
> +static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
> +                                 uint64_t base, uint32_t irq)

... s/make_virtio_mmio_node/make_virtio_mmio_node_simple here or 
something like that?


> +{
> +    int res;
> +
> +    res = _make_virtio_mmio_node(gc, fdt, base, irq);
> +    if (res) return res;
> +
> +    return fdt_end_node(fdt);
> +}
> +
> +static int make_virtio_mmio_node_i2c(libxl__gc *gc, void *fdt,
> +                                 uint64_t base, uint32_t irq)
> +{
> +    int res;
> +
> +    res = _make_virtio_mmio_node(gc, fdt, base, irq);
> +    if (res) return res;
> +
> +    res = fdt_begin_node(fdt, "i2c");
> +    if (res) return res;
> +
> +    res = fdt_property_compat(gc, fdt, 1, "virtio,device22");

Please provide a link (in the commit description) to the corresponding 
Linux device tree binding. I assume it is:

Documentation/devicetree/bindings/i2c/i2c-virtio.yaml


> +    if (res) return res;
> +
> +    res = fdt_end_node(fdt);
>       if (res) return res;
>   
>       res = fdt_end_node(fdt);
> @@ -1221,6 +1269,11 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
>                   FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq) );
>           }
>   
> +        for (i = 0; i < d_config->num_i2cs; i++) {
> +            libxl_device_i2c *i2c = &d_config->i2cs[i];
> +            FDT( make_virtio_mmio_node_i2c(gc, fdt, i2c->base, i2c->irq) );
> +        }
> +
>           if (pfdt)
>               FDT( copy_partial_fdt(gc, fdt, pfdt) );
>   

-- 
Regards,

Oleksandr Tyshchenko


