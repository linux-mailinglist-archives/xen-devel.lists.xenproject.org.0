Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB8B59A004
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 18:32:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390385.627778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP4tv-0000jj-Hf; Fri, 19 Aug 2022 16:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390385.627778; Fri, 19 Aug 2022 16:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP4tv-0000gR-E0; Fri, 19 Aug 2022 16:31:15 +0000
Received: by outflank-mailman (input) for mailman id 390385;
 Fri, 19 Aug 2022 16:31:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nXp=YX=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oP4tt-0000gL-OI
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 16:31:13 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5662fd50-1fdc-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 18:31:12 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 m17-20020a7bce11000000b003a5bedec07bso4384315wmc.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Aug 2022 09:31:12 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a05600c4f8d00b003a5f3f5883dsm9537396wmq.17.2022.08.19.09.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 09:31:10 -0700 (PDT)
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
X-Inumbo-ID: 5662fd50-1fdc-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=QsLMmJrvOTTFuktoZXz83bwigPgYzmSPYeK05B9a7go=;
        b=FliYyPHy3rkQz1aGjbSeHaUmQzHbNenTjZAk5iI1uhB88mMymi+i9RLC5Stju3k+CX
         6lpXAd/fctlJPec8QETAp/ooqVYzYpxtFSbFUBtMibbLS4d/G8WkjfZ/3E2wFX7X2Cma
         wNeFIS+Gz4opnV7FhKy8lQ3B/p+RZZ2ilP8oyKiVs+l7+32898IeNv8N9G7aun8M3QYq
         chIFvCP4xDNG2B+rAcnYw5hh6fzd/RGm8rMswxqfIXF1rA7s+pZnIy/cNGlT4I9blYV5
         j/SioP/WW256egVzyjuf5iKfmAxe67vcjKH1XiZjUcj23/cfwx8PkZcAn2IbcpFTQe4c
         griw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=QsLMmJrvOTTFuktoZXz83bwigPgYzmSPYeK05B9a7go=;
        b=jyXwdmUKzeHI5b83YHbYlMRJFuP0wuPEJUun0R+5L4TPbOpdSKWXgiQjCol4Xokng+
         K3CrNAWfJhvtetJU2ATq9bCAJl0RupcGurKOB/nK5NBt9N8WvI9LLbE4U3w6shv17h9P
         y11eLkvp7v+9q5wyp04/61eiLh3vLVeGrBC/Hw2vCO0DL6uZBwJsaraXoIh1g61hQBAH
         c810zji6IRXWv4APrLqqd2urBZHmkClcY/lWkaX3XMY2d4RannrPKC+Pyx1I2Wo+jKnI
         onLBzcbFPC5kwptRnXCkeOJALqtg1VzVghWqd+T0HRaCWcB133zAQJ5Qes3Ls9jJYSeS
         aCLA==
X-Gm-Message-State: ACgBeo0xaOS39K8QJ/g1lIllJXoqc8ABM4mpIrTQuWTXKoZd9UjQq1bp
	sjRHEWxDFsNYwHhkH8+H7zw=
X-Google-Smtp-Source: AA6agR4edsnoSz9UkieZ85y3W+3VH1Zu3w8QA9bUSIk/U+aTmCBfZVAzA5Kg0qDG7YM7vRdg/ihz8Q==
X-Received: by 2002:a1c:cc0f:0:b0:3a5:333:310d with SMTP id h15-20020a1ccc0f000000b003a50333310dmr5276353wmb.122.1660926671673;
        Fri, 19 Aug 2022 09:31:11 -0700 (PDT)
Message-ID: <8e09ddde-1170-b489-f17d-83df7543dbad@gmail.com>
Date: Fri, 19 Aug 2022 19:31:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/2] xen/arm: pci: modify pci_find_host_bridge_node
 argument to const pdev
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1660746990.git.rahul.singh@arm.com>
 <5f0f92fe734d3c8478c98a90b7eb85e032d7b9ce.1660746990.git.rahul.singh@arm.com>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <5f0f92fe734d3c8478c98a90b7eb85e032d7b9ce.1660746990.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 17.08.22 17:45, Rahul Singh wrote:


Hello Rahul

> Modify pci_find_host_bridge_node argument to const pdev to avoid
> converting the dev to pdev in pci_find_host_bridge_node and also
> constify the return.
>
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>


Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>


> ---
> Changes in v2:
>   - this patch is introduced in this version
> ---
>   xen/arch/arm/include/asm/pci.h     | 3 ++-
>   xen/arch/arm/pci/pci-host-common.c | 4 ++--
>   2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
> index 7c7449d64f..80a2431804 100644
> --- a/xen/arch/arm/include/asm/pci.h
> +++ b/xen/arch/arm/include/asm/pci.h
> @@ -106,7 +106,8 @@ bool pci_ecam_need_p2m_hwdom_mapping(struct domain *d,
>                                        struct pci_host_bridge *bridge,
>                                        uint64_t addr);
>   struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
> -struct dt_device_node *pci_find_host_bridge_node(struct device *dev);
> +const struct dt_device_node *
> +pci_find_host_bridge_node(const struct pci_dev *pdev);
>   int pci_get_host_bridge_segment(const struct dt_device_node *node,
>                                   uint16_t *segment);
>   
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index fd8c0f837a..89ef30028e 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -243,10 +243,10 @@ err_exit:
>   /*
>    * Get host bridge node given a device attached to it.
>    */
> -struct dt_device_node *pci_find_host_bridge_node(struct device *dev)
> +const struct dt_device_node *
> +pci_find_host_bridge_node(const struct pci_dev *pdev)
>   {
>       struct pci_host_bridge *bridge;
> -    struct pci_dev *pdev = dev_to_pci(dev);
>   
>       bridge = pci_find_host_bridge(pdev->seg, pdev->bus);
>       if ( unlikely(!bridge) )

-- 
Regards,

Oleksandr Tyshchenko


