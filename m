Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A30F858CDC2
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 20:39:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382532.617477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL7ed-0004Hy-JO; Mon, 08 Aug 2022 18:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382532.617477; Mon, 08 Aug 2022 18:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL7ed-0004Fc-Ei; Mon, 08 Aug 2022 18:39:07 +0000
Received: by outflank-mailman (input) for mailman id 382532;
 Mon, 08 Aug 2022 18:39:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y+qk=YM=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oL7eb-0004FQ-EU
 for xen-devel@lists.xen.org; Mon, 08 Aug 2022 18:39:05 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6004b676-1749-11ed-bd2e-47488cf2e6aa;
 Mon, 08 Aug 2022 20:39:04 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id v2so5279453lfi.6
 for <xen-devel@lists.xen.org>; Mon, 08 Aug 2022 11:39:03 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a2eb743000000b0025e48907929sm1452241ljo.23.2022.08.08.11.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 11:39:01 -0700 (PDT)
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
X-Inumbo-ID: 6004b676-1749-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=YLfAaoA6TVYVn3NAUPMEsTnFNbo7kNjnovMZPyuIUaE=;
        b=Z5qj71MYxY109mQ4Uvz5hPIXwu8z3Ulsl4v8C3LfZ2eYjOQWLQdoWAeXpI9wWsPIsH
         S/VKPr3Bf6BYv302nxT3e84JlO4aEXltO4Q6jHYvnazKMniA8B1LtDwRO1dJPA63Qi0A
         NasLMvak6KJgAS/QWitYcFkPOQZq1+7yYlFKUvKkgm25+L2ypdAzluVae2TPAyssNCa5
         cOYi/5MXHCMsw/SYiid5dQVrmC4pdLHEnGm10sTSbowHd/WUi9nzpAD3ioeg80VnI1Fm
         JFNpx6Byvb4joy+sWw5ccJj2dQ97lwZVDLkJfZZyGZEywaGbe47H3qWnyuiNTZj4+Zlv
         yCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=YLfAaoA6TVYVn3NAUPMEsTnFNbo7kNjnovMZPyuIUaE=;
        b=6Qf3gKceCepTyEQc31h+hegeV2rbmFE+JDdSKdKyv0GbsKOuZMG8cOdgQv2o4v/DQQ
         D1TiiTxnYbLeNfghDQqFTbZY7vC5DXBt6mpiuaYyOBdcnYomPIR14leoU/vWq2lXTnpI
         1Kg0fhoIDJNPABfVQfQyKNwhuj+lLSTJg9f6aAkdSeZ+VQrURirhnYGem/c+AwH1x02X
         qaidY7KGQzPGiEZ2Q7b8B1hSq7uYgTl0M5AscadmrTFPUsqfhiJmfVZC5SnUIMYVtdsm
         aXVXWg/qv8Z21tjBXjMTGopejZkpvOxWFks/36745qR1o9q9Dxjm675V5v63to6KgHU4
         sA2g==
X-Gm-Message-State: ACgBeo1vik5jHY+/ZeGWUS94WPBu2L8nJLGkdWYF7tqrI++xHCiFbmWP
	8u2tPPs8P5y5fw0Z5Bpj/xg=
X-Google-Smtp-Source: AA6agR6GkYbAdmTyxOKKLQr74xnHajS7R2opP+iUK6JfvQEoUcpFsjTJCAQsiXAY1vacefiDnHHZ3g==
X-Received: by 2002:a05:6512:10d0:b0:48b:27f2:6d96 with SMTP id k16-20020a05651210d000b0048b27f26d96mr6588581lfg.94.1659983942429;
        Mon, 08 Aug 2022 11:39:02 -0700 (PDT)
Message-ID: <82a9d50c-58ef-1842-be7f-33a05d861f15@gmail.com>
Date: Mon, 8 Aug 2022 21:39:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 3/6] libxl: arm: Create alloc_virtio_mmio_params()
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>, xen-devel@lists.xen.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <cover.1659596139.git.viresh.kumar@linaro.org>
 <ae3e61fe687cb2d9dac17622da2ec81c4064db39.1659596139.git.viresh.kumar@linaro.org>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <ae3e61fe687cb2d9dac17622da2ec81c4064db39.1659596139.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 04.08.22 10:01, Viresh Kumar wrote:

Hello Viresh


> Create a separate routine to allocate base and irq for a device as the
> same code will be required for each device type.
>
> Suggested-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   tools/libs/light/libxl_arm.c | 38 ++++++++++++++++++++++++------------
>   1 file changed, 25 insertions(+), 13 deletions(-)
>
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 1a3ac1646e94..2f64b9f0ebee 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -48,6 +48,24 @@ static uint32_t alloc_virtio_mmio_irq(libxl__gc *gc, uint32_t *virtio_mmio_irq)
>       return irq;
>   }
>   
> +static int alloc_virtio_mmio_params(libxl__gc *gc, uint64_t *base,
> +                                    uint32_t *irq, uint64_t *virtio_mmio_base,
> +                                    uint32_t *virtio_mmio_irq)
> +{
> +    *base = alloc_virtio_mmio_base(gc, virtio_mmio_base);
> +    if (!*base)
> +        return ERROR_FAIL;
> +
> +    *irq = alloc_virtio_mmio_irq(gc, virtio_mmio_irq);
> +    if (!*irq)
> +        return ERROR_FAIL;
> +
> +    LOG(DEBUG, "Allocate Virtio MMIO params: IRQ %u BASE 0x%"PRIx64, *irq,
> +        *base);
> +
> +    return 0;
> +}
> +
>   static const char *gicv_to_string(libxl_gic_version gic_version)
>   {
>       switch (gic_version) {
> @@ -85,20 +103,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>           libxl_device_disk *disk = &d_config->disks[i];
>   
>           if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
> -            disk->base = alloc_virtio_mmio_base(gc, &virtio_mmio_base);
> -            if (!disk->base)
> -                return ERROR_FAIL;
> +            int rc = alloc_virtio_mmio_params(gc, &disk->base, &disk->irq,
> +                    &virtio_mmio_base, &virtio_mmio_irq);
> +            if (rc)
> +                return rc;
>   
> -            disk->irq = alloc_virtio_mmio_irq(gc, &virtio_mmio_irq);
> -            if (!disk->irq)
> -                return ERROR_FAIL;
> -
> -            if (virtio_irq < disk->irq)
> -                virtio_irq = disk->irq;
>               virtio_enabled = true;

    I think that "virtio_enabled = true;" should be moved ...


> -
> -            LOG(DEBUG, "Allocate Virtio MMIO params for Vdev %s: IRQ %u BASE 0x%"PRIx64,
> -                disk->vdev, disk->irq, disk->base);
>           }
>       }
>   
> @@ -107,8 +117,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>        * present, make sure that we allocate enough SPIs for them.
>        * The resulting "nr_spis" needs to cover the highest possible SPI.
>        */
> -    if (virtio_enabled)
> +    if (virtio_mmio_irq != GUEST_VIRTIO_MMIO_SPI_FIRST) {
> +        virtio_irq = virtio_mmio_irq - 1;
>           nr_spis = max(nr_spis, virtio_irq - 32 + 1);

  ... here. Otherwise after applying all patches "virtio_enabled" only 
gets set if there is a virtio disk device. So it won't be set for virtio 
i2c, etc.

I see that in V2 it was there, but in V3 is not. Or maybe there is some 
reason for doing that which I am not aware of?


Other changes look good.


> +    }
>   
>       for (i = 0; i < d_config->b_info.num_irqs; i++) {
>           uint32_t irq = d_config->b_info.irqs[i];

-- 
Regards,

Oleksandr Tyshchenko


