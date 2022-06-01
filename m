Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5864653A921
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 16:26:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340511.565559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwPHo-0003m9-T5; Wed, 01 Jun 2022 14:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340511.565559; Wed, 01 Jun 2022 14:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwPHo-0003jB-Q8; Wed, 01 Jun 2022 14:25:24 +0000
Received: by outflank-mailman (input) for mailman id 340511;
 Wed, 01 Jun 2022 14:25:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Edd5=WI=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nwPHm-0003j4-OB
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 14:25:22 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aacf5421-e1b6-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 16:25:20 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id 1so2179479ljp.8
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jun 2022 07:25:20 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 be34-20020a056512252200b0047255d2111csm400301lfb.75.2022.06.01.07.25.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 07:25:19 -0700 (PDT)
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
X-Inumbo-ID: aacf5421-e1b6-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=FBKSGghGMyehS2TUOWQO4R6WCmFwpZJjX3cauamzd94=;
        b=Ultw8DU29BFuHHv+SAl79K1cLAUml40sbYhf7/PNERagVaxUEYg66jGdS44iSwOWlN
         lWW2GoUaD/bEMI45tTYaZ+VrJza8xUox2zbdsm6A1B5GNJVjCMmiF888AgbA4h4m5aLg
         tn04ixsSJnKFIOwQRTmXkajhAmOBFv+X3vyNQ50rVoM6CwgPo61c3A6SUfi0bTVWMxdh
         z8+sz6cZ2yjIAK6Wa/lyR4bfrIUynhxz2XEYplpOkgbCoA+Gqhma7dRyrwfPrV5pt6CB
         PNV8QzOoeRVsBC7bv34CN2R3y1QEpFKFXNBfqhf6Vx5A3MC02CZRwFylWK207E8wRJ3C
         oLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=FBKSGghGMyehS2TUOWQO4R6WCmFwpZJjX3cauamzd94=;
        b=EcYXnX3QabuDwGsJgbrtOx7/1xhwNyY/8SUdTllWcJlTcJnteGvYqITEHlnEsRZPg0
         jpXsZqdC4w9FXO0DQtyBufHNTDjq8isvIhJdgPZimkRycIinxBK2xuq1HJgPCEJY5m0A
         8p+SqXHTrFptufZXsjAvtPq2S9D1jWtEDqfABhOIzvMj3fageTuo3c1aEibYZYCohDRx
         FfIG5Xh8COhUIt/DcXGUiQwCdZrPtL+PMHjyWuoVCBC6NiTz+gfxbbM3xBgXZ3sJW30w
         2OoiGJqWJ3bLnFQEsCRKypUCSoHcQRQLMcuQD7jDma6RD5fRIwwbeyyJB4bSDl96M4KV
         EN7w==
X-Gm-Message-State: AOAM532e5l9TtEGrs5jCxbCE+t/ah5xeOrL2NWSpnydRDO4hcsRIRwqj
	nZj7sGfyZSKzmsGx5oEA7+k=
X-Google-Smtp-Source: ABdhPJzdgU0TEzWOzw1uVTXtzjAfJDCmQ71KdCZvzgA7rJtMp7zu5PwgQORHQ3eXgUOOk1oqeJ0a0Q==
X-Received: by 2002:a2e:a36f:0:b0:253:d948:731c with SMTP id i15-20020a2ea36f000000b00253d948731cmr37053467ljn.159.1654093520369;
        Wed, 01 Jun 2022 07:25:20 -0700 (PDT)
Subject: Re: [PATCH V2] libxl/arm: Create specific IOMMU node to be referred
 by virtio-mmio device
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>
References: <1653944813-17970-1-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2205311755010.1905099@ubuntu-linux-20-04-desktop>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <e67bde26-2eff-948a-a2c3-08cc474affa6@gmail.com>
Date: Wed, 1 Jun 2022 17:25:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2205311755010.1905099@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 01.06.22 04:04, Stefano Stabellini wrote:


Hello Stefano


> On Tue, 31 May 2022, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Reuse generic IOMMU device tree bindings to communicate Xen specific
>> information for the virtio devices for which the restricted memory
>> access using Xen grant mappings need to be enabled.
>>
>> Insert "iommus" property pointed to the IOMMU node with "xen,grant-dma"
>> compatible to all virtio devices which backends are going to run in
>> non-hardware domains (which are non-trusted by default).
>>
>> Based on device-tree binding from Linux:
>> Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml
>>
>> The example of generated nodes:
>>
>> xen_iommu {
>>      compatible = "xen,grant-dma";
>>      #iommu-cells = <0x01>;
>>      phandle = <0xfde9>;
>> };
>>
>> virtio@2000000 {
>>      compatible = "virtio,mmio";
>>      reg = <0x00 0x2000000 0x00 0x200>;
>>      interrupts = <0x00 0x01 0xf01>;
>>      interrupt-parent = <0xfde8>;
>>      dma-coherent;
>>      iommus = <0xfde9 0x01>;
>> };
>>
>> virtio@2000200 {
>>      compatible = "virtio,mmio";
>>      reg = <0x00 0x2000200 0x00 0x200>;
>>      interrupts = <0x00 0x02 0xf01>;
>>      interrupt-parent = <0xfde8>;
>>      dma-coherent;
>>      iommus = <0xfde9 0x01>;
>> };
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> !!! This patch is based on non upstreamed yet “Virtio support for toolstack
>> on Arm” V8 series which is on review now:
>> https://lore.kernel.org/xen-devel/1651598763-12162-1-git-send-email-olekstysh@gmail.com/
>>
>> New device-tree binding (commit #5) is a part of solution to restrict memory
>> access under Xen using xen-grant DMA-mapping layer (which is also on review):
>> https://lore.kernel.org/xen-devel/1653944417-17168-1-git-send-email-olekstysh@gmail.com/
>>
>> Changes RFC -> V1:
>>     - update commit description
>>     - rebase according to the recent changes to
>>       "libxl: Introduce basic virtio-mmio support on Arm"
>>
>> Changes V1 -> V2:
>>     - Henry already gave his Reviewed-by, I dropped it due to the changes
>>     - use generic IOMMU device tree bindings instead of custom property
>>       "xen,dev-domid"
>>     - change commit subject and description, was
>>       "libxl/arm: Insert "xen,dev-domid" property to virtio-mmio device node"
>> ---
>>   tools/libs/light/libxl_arm.c          | 49 ++++++++++++++++++++++++++++++++---
>>   xen/include/public/device_tree_defs.h |  1 +
>>   2 files changed, 47 insertions(+), 3 deletions(-)
>>
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index 9be9b2a..72da3b1 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -865,9 +865,32 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
>>       return 0;
>>   }
>>   
>> +static int make_xen_iommu_node(libxl__gc *gc, void *fdt)
>> +{
>> +    int res;
>> +
>> +    /* See Linux Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml */
>> +    res = fdt_begin_node(fdt, "xen_iommu");
>> +    if (res) return res;
>> +
>> +    res = fdt_property_compat(gc, fdt, 1, "xen,grant-dma");
>> +    if (res) return res;
>> +
>> +    res = fdt_property_cell(fdt, "#iommu-cells", 1);
>> +    if (res) return res;
>> +
>> +    res = fdt_property_cell(fdt, "phandle", GUEST_PHANDLE_IOMMU);
>> +    if (res) return res;
>> +
>> +    res = fdt_end_node(fdt);
>> +    if (res) return res;
>> +
>> +    return 0;
>> +}
>>   
>>   static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
>> -                                 uint64_t base, uint32_t irq)
>> +                                 uint64_t base, uint32_t irq,
>> +                                 uint32_t backend_domid)
>>   {
>>       int res;
>>       gic_interrupt intr;
>> @@ -890,6 +913,16 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
>>       res = fdt_property(fdt, "dma-coherent", NULL, 0);
>>       if (res) return res;
>>   
>> +    if (backend_domid != LIBXL_TOOLSTACK_DOMID) {
>> +        uint32_t iommus_prop[2];
>> +
>> +        iommus_prop[0] = cpu_to_fdt32(GUEST_PHANDLE_IOMMU);
>> +        iommus_prop[1] = cpu_to_fdt32(backend_domid);
>> +
>> +        res = fdt_property(fdt, "iommus", iommus_prop, sizeof(iommus_prop));
>> +        if (res) return res;
>> +    }
>> +
>>       res = fdt_end_node(fdt);
>>       if (res) return res;
>>   
>> @@ -1097,6 +1130,7 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
>>       size_t fdt_size = 0;
>>       int pfdt_size = 0;
>>       libxl_domain_build_info *const info = &d_config->b_info;
>> +    bool iommu_created;
>>       unsigned int i;
>>   
>>       const libxl_version_info *vers;
>> @@ -1204,11 +1238,20 @@ next_resize:
>>           if (d_config->num_pcidevs)
>>               FDT( make_vpci_node(gc, fdt, ainfo, dom) );
>>   
>> +        iommu_created = false;
>>           for (i = 0; i < d_config->num_disks; i++) {
>>               libxl_device_disk *disk = &d_config->disks[i];
>>   
>> -            if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO)
>> -                FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq) );
>> +            if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
>> +                if (disk->backend_domid != LIBXL_TOOLSTACK_DOMID &&
>> +                    !iommu_created) {
>> +                    FDT( make_xen_iommu_node(gc, fdt) );
>> +                    iommu_created = true;
>> +                }
>> +
>> +                FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq,
>> +                                           disk->backend_domid) );
>> +            }
> This is a matter of taste as the code would also work as is, but I would
> do the following instead:
>
>
> if ( d_config->num_disks > 0 &&
>       disk->backend_domid != LIBXL_TOOLSTACK_DOMID) {
>       FDT( make_xen_iommu_node(gc, fdt) );
> }
>
> for (i = 0; i < d_config->num_disks; i++) {
>      libxl_device_disk *disk = &d_config->disks[i];
>
>      if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO)
>          FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq) );
> }

I got your idea to avoid using local "iommu_created". For that, I think, 
we need to modify the first check to make sure that we have at least one 
virtio device, otherwise we might end up inserting unused IOMMU node. 
But, it will turn into an extra loop to go through num_disks and look 
for LIBXL_DISK_SPECIFICATION_VIRTIO.



>
> but I would give my acked-by anyway

Thanks!


>
>
>>           }
>>   
>>           if (pfdt)
>> diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/device_tree_defs.h
>> index 209d43d..df58944 100644
>> --- a/xen/include/public/device_tree_defs.h
>> +++ b/xen/include/public/device_tree_defs.h
>> @@ -7,6 +7,7 @@
>>    * onwards. Reserve a high value for the GIC phandle.
>>    */
>>   #define GUEST_PHANDLE_GIC (65000)
>> +#define GUEST_PHANDLE_IOMMU (GUEST_PHANDLE_GIC + 1)
>>   
>>   #define GUEST_ROOT_ADDRESS_CELLS 2
>>   #define GUEST_ROOT_SIZE_CELLS 2
>> -- 
>> 2.7.4

-- 
Regards,

Oleksandr Tyshchenko


