Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BA85A9DC4
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 19:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396853.637213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTngV-0003R7-9Z; Thu, 01 Sep 2022 17:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396853.637213; Thu, 01 Sep 2022 17:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTngV-0003OA-6W; Thu, 01 Sep 2022 17:08:55 +0000
Received: by outflank-mailman (input) for mailman id 396853;
 Thu, 01 Sep 2022 17:08:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ocd=ZE=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oTngU-0003Nk-AY
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 17:08:54 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1525dd0-2a18-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 19:08:53 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id p16so7356638lfd.6
 for <xen-devel@lists.xenproject.org>; Thu, 01 Sep 2022 10:08:53 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 b24-20020a196458000000b004946b7593fesm1530625lfj.198.2022.09.01.10.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 10:08:51 -0700 (PDT)
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
X-Inumbo-ID: c1525dd0-2a18-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=XHRSQt/qwfKAxSmI7aXeTf1nP69MrNsfm23ssLVEMSw=;
        b=Ad5nZI8x9wXYvgsrpUul+9H+J2uTZUvQzH6jfQrBJuRdSfRqIL+2UB5Juja3Z8vrg0
         AThC5Y2WomHCQoxYFfH+ONEHQMmownrTFqZ/jRHrJloRPFqun97cP9RFWdQwEs8BQiGk
         JW6Qs5XjF1Zgi2b7Kwv9MUvh+k4F71YwpLE2hdbRQS1hmsWM7FmpJUiDDPQ52qahZ8Cp
         Lh6fSh4j2bdBqSPqTJomXZoW2lIu8m7Gn3HuVqpsIn6pIltUbhspTWfnBRIQGEgQtHqX
         2NTWBtMGm6HXTdIsZFI8BpSJYZlH0S05tEPquyNPpgDMh4FVBTebS/Fnn7QzwrxWucem
         Eakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=XHRSQt/qwfKAxSmI7aXeTf1nP69MrNsfm23ssLVEMSw=;
        b=jslhkIH5YiQs96OaMBXhKWnhLYsU+XonsW5+zP2oQlIYCUaHGE8TCH1cRVBSSlLBU6
         u9Cb/omWRWUy7QfuCk/NvKANkGDz2Pji7ofSOb6edMb4q06Usj5kOM6OBbBZddwgqnKu
         lljRU53hif3/fckW6NR4JwG9Kd46FuT7V3SlpH/e98UySlZkF536QGz6q+n38U+SOQsb
         3NqbJjb72f73GfKB0wnKhxd45kVoJUMNyRyS+YzHiiGDpPl76EFMF0r87sjenAR3gWu8
         5+LmAHis7EEQ1c6op3cY5ZerDfM2L1pz7yjLg+KLBYFmPICh6PC99gETXNsXyV0DFF8n
         aE2w==
X-Gm-Message-State: ACgBeo3WPrV7XrbHaDb5XGy1yDgHDydVkq2nGWy7Vso8xVJE3IztPG1S
	xzx/lqoU4P+aAvjMeYlYCiM=
X-Google-Smtp-Source: AA6agR5qFFWYKYd9wrwVtRkdhp4cNqAAOSZACbtKbCCEnz2fGG6WEzP9ReFzM1m6oJg7Es2NFP2lhw==
X-Received: by 2002:a05:6512:c03:b0:494:9f7b:7f84 with SMTP id z3-20020a0565120c0300b004949f7b7f84mr915591lfu.278.1662052132425;
        Thu, 01 Sep 2022 10:08:52 -0700 (PDT)
Message-ID: <b2ffc383-a1b8-efc5-9227-4587f4af8c8f@gmail.com>
Date: Thu, 1 Sep 2022 20:08:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>
References: <cover.1662024325.git.rahul.singh@arm.com>
 <e30beac1480f03b51933d8016ad9aed8855ffc18.1662024325.git.rahul.singh@arm.com>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <e30beac1480f03b51933d8016ad9aed8855ffc18.1662024325.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 01.09.22 12:29, Rahul Singh wrote:

Hello Rahul

> is_memory_hole was implemented for x86 and not for ARM when introduced.
> Replace is_memory_hole call to pci_check_bar as function should check
> if device BAR is in defined memory range. Also, add an implementation
> for ARM which is required for PCI passthrough.
>
> On x86, pci_check_bar will call is_memory_hole which will check if BAR
> is not overlapping with any memory region defined in the memory map.
>
> On ARM, pci_check_bar will go through the host bridge ranges and check
> if the BAR is in the range of defined ranges.
>
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>


Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>


Thanks!


> ---
> Changes in v3:
>   - fix minor comments
> ---
>   xen/arch/arm/include/asm/pci.h     |  2 ++
>   xen/arch/arm/pci/pci-host-common.c | 43 ++++++++++++++++++++++++++++++
>   xen/arch/x86/include/asm/pci.h     | 10 +++++++
>   xen/drivers/passthrough/pci.c      |  8 +++---
>   4 files changed, 59 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
> index 80a2431804..8cb46f6b71 100644
> --- a/xen/arch/arm/include/asm/pci.h
> +++ b/xen/arch/arm/include/asm/pci.h
> @@ -126,6 +126,8 @@ int pci_host_iterate_bridges_and_count(struct domain *d,
>   
>   int pci_host_bridge_mappings(struct domain *d);
>   
> +bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
> +
>   #else   /*!CONFIG_HAS_PCI*/
>   
>   struct arch_pci_dev { };
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index 89ef30028e..0eb121666d 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -24,6 +24,16 @@
>   
>   #include <asm/setup.h>
>   
> +/*
> + * struct to hold pci device bar.
> + */
> +struct pdev_bar
> +{
> +    mfn_t start;
> +    mfn_t end;
> +    bool is_valid;
> +};
> +
>   /*
>    * List for all the pci host bridges.
>    */
> @@ -363,6 +373,39 @@ int __init pci_host_bridge_mappings(struct domain *d)
>       return 0;
>   }
>   
> +static int is_bar_valid(const struct dt_device_node *dev,
> +                        uint64_t addr, uint64_t len, void *data)
> +{
> +    struct pdev_bar *bar_data = data;
> +    unsigned long s = mfn_x(bar_data->start);
> +    unsigned long e = mfn_x(bar_data->end);
> +
> +    if ( (s <= e) && (s >= PFN_DOWN(addr)) && (e <= PFN_UP(addr + len - 1)) )
> +        bar_data->is_valid =  true;
> +
> +    return 0;
> +}
> +
> +bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
> +{
> +    int ret;
> +    const struct dt_device_node *dt_node;
> +    struct pdev_bar bar_data =  {
> +        .start = start,
> +        .end = end,
> +        .is_valid = false
> +    };
> +
> +    dt_node = pci_find_host_bridge_node(pdev);
> +    if ( !dt_node )
> +        return false;
> +
> +    ret = dt_for_each_range(dt_node, &is_bar_valid, &bar_data);
> +    if ( ret < 0 )
> +        return false;
> +
> +    return bar_data.is_valid;
> +}
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
> index c8e1a9ecdb..f4a58c8acf 100644
> --- a/xen/arch/x86/include/asm/pci.h
> +++ b/xen/arch/x86/include/asm/pci.h
> @@ -57,4 +57,14 @@ static always_inline bool is_pci_passthrough_enabled(void)
>   
>   void arch_pci_init_pdev(struct pci_dev *pdev);
>   
> +static inline bool pci_check_bar(const struct pci_dev *pdev,
> +                                 mfn_t start, mfn_t end)
> +{
> +    /*
> +     * Check if BAR is not overlapping with any memory region defined
> +     * in the memory map.
> +     */
> +    return is_memory_hole(start, end);
> +}
> +
>   #endif /* __X86_PCI_H__ */
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index cdaf5c247f..149f68bb6e 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -304,8 +304,8 @@ static void check_pdev(const struct pci_dev *pdev)
>           if ( rc < 0 )
>               /* Unable to size, better leave memory decoding disabled. */
>               return;
> -        if ( size && !is_memory_hole(maddr_to_mfn(addr),
> -                                     maddr_to_mfn(addr + size - 1)) )
> +        if ( size && !pci_check_bar(pdev, maddr_to_mfn(addr),
> +                                    maddr_to_mfn(addr + size - 1)) )
>           {
>               /*
>                * Return without enabling memory decoding if BAR position is not
> @@ -331,8 +331,8 @@ static void check_pdev(const struct pci_dev *pdev)
>   
>           if ( rc < 0 )
>               return;
> -        if ( size && !is_memory_hole(maddr_to_mfn(addr),
> -                                     maddr_to_mfn(addr + size - 1)) )
> +        if ( size && !pci_check_bar(pdev, maddr_to_mfn(addr),
> +                                    maddr_to_mfn(addr + size - 1)) )
>           {
>               printk(warn, &pdev->sbdf, "ROM ", PFN_DOWN(addr),
>                      PFN_DOWN(addr + size - 1));

-- 
Regards,

Oleksandr Tyshchenko


