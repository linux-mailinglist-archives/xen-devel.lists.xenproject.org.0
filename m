Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F7558CB4D
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 17:30:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382480.617409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL4hw-0001G3-7O; Mon, 08 Aug 2022 15:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382480.617409; Mon, 08 Aug 2022 15:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL4hw-0001E8-4O; Mon, 08 Aug 2022 15:30:20 +0000
Received: by outflank-mailman (input) for mailman id 382480;
 Mon, 08 Aug 2022 15:30:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y+qk=YM=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oL4hu-0001Dw-Au
 for xen-devel@lists.xenproject.org; Mon, 08 Aug 2022 15:30:18 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 014893e0-172f-11ed-bd2e-47488cf2e6aa;
 Mon, 08 Aug 2022 17:30:17 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id v10so6707958ljh.9
 for <xen-devel@lists.xenproject.org>; Mon, 08 Aug 2022 08:30:17 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 u28-20020a2eb81c000000b0025e6e1c836dsm1393006ljo.126.2022.08.08.08.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 08:30:15 -0700 (PDT)
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
X-Inumbo-ID: 014893e0-172f-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=liYOe8byd9KtMcGEPYQzUMb3SHaoWj/+mK+OKIWdke0=;
        b=qg7qbiZbeIveYN1kxUYMwHkcfN3l3WS5zzYR4J4dHt9SMlzCDh0h6p04ZRPY2BwlSS
         7dfujNsZFELYvyEjgVGY1donwHWe1YXlzpSRLgxNiiLTv/MORmy2aEOO2i8kqTh/Ka8a
         gZ73TCJBf7x2JUB9aKNKOgyTDCcYWUhp2yCtvLVtFFD8Mof7j3pMky1iNftgWO19Fz/6
         514TJL1yKPZ7GwXDNKmwt3jxD7powiD567sRQAwK08bZyPOLfdLdoF0Uy6jg1lHx/htd
         rnyU9nLnjrBmxAGjN4866C76V5TmLdBf9JjsVIB2Rx244QZcxdcVHTOuNc6/HTTKqP5y
         LIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=liYOe8byd9KtMcGEPYQzUMb3SHaoWj/+mK+OKIWdke0=;
        b=FTjjMRlrwBRy8Bn28e2Z1wHevBWaTdSobZP5LokU8HmcBIRNf3/9g6wfZlQr/bIL6W
         5BLoCOtZRgvZMcc1z8AV3hNIBPe75KAFxMYxJDBlYaUuKQBxioLDdeNi+xCnbDeZbSYh
         JX0FYpxM5SOorfPKCU/o0sBbxa0kb0nZ1qlziZbSTiFOyjdl8d9KGiudo3zcaxeaD93o
         eGcTrmfK+CUeDW0nAv8bSAXg8eeDxUqhn5VeWl/Y4xBWlOLAGHXzLg6NwsZBuTX38Nja
         YWfVPIsmxpi46z9XRs8CPolrTe34oca5Vz8EchTN4rVdysnz8CCOACsfH/cRqXQw0V+1
         lQpg==
X-Gm-Message-State: ACgBeo1m+vIxCmoUcf0S9ihWmQU6yX9Po1heTPA0FESlccpdf2JmTJVE
	dUZkk8KcpHN0S+oIlqDvhcc=
X-Google-Smtp-Source: AA6agR7gr1vhmD/TuDChtiDSmBi3cdzpB+Jb1SJEQ3U/RoUwB6mjFZskFz+CXbwrTGJb/NPHtHdl3w==
X-Received: by 2002:a2e:9e10:0:b0:25d:fe95:3b5f with SMTP id e16-20020a2e9e10000000b0025dfe953b5fmr5603023ljk.179.1659972616552;
        Mon, 08 Aug 2022 08:30:16 -0700 (PDT)
Message-ID: <5e762a42-d0d5-86be-e3cd-64bde82c8b47@gmail.com>
Date: Mon, 8 Aug 2022 18:30:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/pci: replace call to is_memory_hole to pci_check_bar
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>
References: <5650ddce1de4fd5471823bde44a12a03f157bc11.1659713913.git.rahul.singh@arm.com>
 <d5590d91683f2dddb3836b1afb444f30c2f5a7fb.1659713855.git.rahul.singh@arm.com>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <d5590d91683f2dddb3836b1afb444f30c2f5a7fb.1659713855.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 05.08.22 18:43, Rahul Singh wrote:


Hello Rahul


Thank you very much for that patch!


> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

I am not 100% sure regarding that. This is *completely* different patch 
from what Oleksandr initially made here:

https://lore.kernel.org/xen-devel/20220719174253.541965-2-olekstysh@gmail.com/

Copy below for the convenience:


+bool is_memory_hole(mfn_t start, mfn_t end)
+{
+    /* TODO: this needs to be properly implemented. */
+    return true;
+}




Patch looks good, just a couple of minor comments/nits.

>
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
> ---
>   xen/arch/arm/include/asm/pci.h     | 12 ++++++++++
>   xen/arch/arm/pci/pci-host-common.c | 35 ++++++++++++++++++++++++++++++
>   xen/arch/x86/include/asm/pci.h     | 10 +++++++++
>   xen/drivers/passthrough/pci.c      |  8 +++----
>   4 files changed, 61 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
> index 7c7449d64f..5c4ab2c4dc 100644
> --- a/xen/arch/arm/include/asm/pci.h
> +++ b/xen/arch/arm/include/asm/pci.h
> @@ -91,6 +91,16 @@ struct pci_ecam_ops {
>       int (*init)(struct pci_config_window *);
>   };
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


Nit: This is only used by pci-host-common.c, so I think it could be 
declared there.



> +
>   /* Default ECAM ops */
>   extern const struct pci_ecam_ops pci_generic_ecam_ops;
>   
> @@ -125,6 +135,8 @@ int pci_host_iterate_bridges_and_count(struct domain *d,
>   
>   int pci_host_bridge_mappings(struct domain *d);
>   
> +bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
> +
>   #else   /*!CONFIG_HAS_PCI*/
>   
>   struct arch_pci_dev { };
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index fd8c0f837a..8ea1aaeece 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -363,6 +363,41 @@ int __init pci_host_bridge_mappings(struct domain *d)
>       return 0;
>   }
>   
> +static int is_bar_valid(const struct dt_device_node *dev,
> +                        u64 addr, u64 len, void *data)
> +{
> +    struct pdev_bar *bar_data = data;
> +    unsigned long s = mfn_x(bar_data->start);
> +    unsigned long e = mfn_x(bar_data->end);
> +
> +    if ( (s < e) && (s >= PFN_DOWN(addr)) && (e<= PFN_DOWN(addr + len - 1)) )


Nit: white space after 'e' is missed in the last part of the check


> +        bar_data->is_valid =  true;
> +
> +    return 0;
> +}
> +
> +bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
> +{
> +    int ret;
> +    struct dt_device_node *dt_node;
> +    struct device *dev = (struct device *)pci_to_dev(pdev);


The cast is present here because of the const?

I would consider passing "const struct pci_dev *pdev" instead of "struct 
device *dev" to pci_find_host_bridge_node() and dropping conversion 
(pci<->dev) in both functions.


Something like below (not tested):

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
index 5c4ab2c4dc..a17ef32252 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -116,7 +116,7 @@ bool pci_ecam_need_p2m_hwdom_mapping(struct domain *d,
                                       struct pci_host_bridge *bridge,
                                       uint64_t addr);
  struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t 
bus);
-struct dt_device_node *pci_find_host_bridge_node(struct device *dev);
+struct dt_device_node *pci_find_host_bridge_node(const struct pci_dev 
*pdev);
  int pci_get_host_bridge_segment(const struct dt_device_node *node,
                                  uint16_t *segment);

diff --git a/xen/arch/arm/pci/pci-host-common.c 
b/xen/arch/arm/pci/pci-host-common.c
index 8ea1aaeece..3a64a7350f 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -243,10 +243,9 @@ err_exit:
  /*
   * Get host bridge node given a device attached to it.
   */
-struct dt_device_node *pci_find_host_bridge_node(struct device *dev)
+struct dt_device_node *pci_find_host_bridge_node(const struct pci_dev 
*pdev)
  {
      struct pci_host_bridge *bridge;
-    struct pci_dev *pdev = dev_to_pci(dev);

      bridge = pci_find_host_bridge(pdev->seg, pdev->bus);
      if ( unlikely(!bridge) )
@@ -380,14 +379,13 @@ bool pci_check_bar(const struct pci_dev *pdev, 
mfn_t start, mfn_t end)
  {
      int ret;
      struct dt_device_node *dt_node;
-    struct device *dev = (struct device *)pci_to_dev(pdev);
      struct pdev_bar bar_data =  {
          .start = start,
          .end = end,
          .is_valid = false
      };

-    dt_node = pci_find_host_bridge_node(dev);
+    dt_node = pci_find_host_bridge_node(pdev);

      ret = dt_for_each_range(dt_node, &is_bar_valid, &bar_data);
      if ( ret < 0 )


> +    struct pdev_bar bar_data =  {
> +        .start = start,
> +        .end = end,
> +        .is_valid = false
> +    };
> +
> +    dt_node = pci_find_host_bridge_node(dev);

     if ( !dt_node )
         return false;


> +
> +    ret = dt_for_each_range(dt_node, &is_bar_valid, &bar_data);
> +    if ( ret < 0 )
> +        return ret;

s/return ret;/return false;


> +
> +    if ( !bar_data.is_valid )
> +        return false;
> +
> +    return true;
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


Nit: I would use simple #define instead of static inline here

But I am not 100% sure that x86 maintainers would be happy.


> +
>   #endif /* __X86_PCI_H__ */
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 29356d59a7..52453a05fe 100644
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


