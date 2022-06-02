Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB9053BEC4
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 21:28:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341209.566459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwqUJ-00053g-Se; Thu, 02 Jun 2022 19:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341209.566459; Thu, 02 Jun 2022 19:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwqUJ-00051L-ON; Thu, 02 Jun 2022 19:28:07 +0000
Received: by outflank-mailman (input) for mailman id 341209;
 Thu, 02 Jun 2022 19:28:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2EeJ=WJ=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nwqUI-00051E-Sq
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 19:28:06 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 204d01ba-e2aa-11ec-bd2c-47488cf2e6aa;
 Thu, 02 Jun 2022 21:28:05 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id 25so7256838edw.8
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jun 2022 12:28:05 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a170906094300b0070ad296e4b0sm926605ejd.186.2022.06.02.12.28.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 12:28:04 -0700 (PDT)
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
X-Inumbo-ID: 204d01ba-e2aa-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=vbAEqTtMltIjLFnJDROsfHStyE044+oJNOWsnHjqrXE=;
        b=Nv50WEmTh4wFPvQammySLQ1FWccD9Mr60pS3bU9HudwtAfHmbg1RwuEQI2FucZFpnn
         9wbz8eSVurUvBDDYvosAJGBmETp1zNDv6VzXWOB0/XCHsttljXR6K7P8Oo2+X5NUTfqi
         qbegVq5F0eeHV8e2vo7sq0TUY6O/lMIMULf2yozMmZcWcv7McgIL0kDZrgAKzt4LxkS5
         ZN00Dd8pWM1f+lED5Cyh/NkO7V4WpuImuxiF5nBLYte+DUAJAB7Kqs7XkKa5GKqL4tKc
         pRAk9R8o7iegb6pxwVKiLgrNtNzs6eoLg6Fl4IdVTnC3LXS20elAGncc4MpVvtVAafln
         Qxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=vbAEqTtMltIjLFnJDROsfHStyE044+oJNOWsnHjqrXE=;
        b=RrhEm4Tre/4LyUF9tP3QXIkhLpy19q/lG/hv5p0sazsy3veSDWngYPf0EKe3SOpL3C
         APkJzL/uDtLzGMoG+/RRt+9+8LIXAI0B7YFpnXCpJtq2Yx6HOTgVeSwSNi8CNP4RcHv+
         Bb0s3ZpEv+dxcGDdSX53Rfey2SSQ2hkyoh79qudwHykjdOUzfTBU0xKXRsrNfLlXA4DJ
         L1O/1M4gXrLZU++brPT8NTIiYscCO0Q5GhNb9PhFa8RBRg0OcT+/JqhC9+ABqibVHZ5r
         LJBE7S6Gl7H1P6rAZXQxfgsA2xH7LxNI5wEizsoScLpRlKrRYJ4cfPTEQxoGnDwLABGp
         NYBg==
X-Gm-Message-State: AOAM533jU4OzAX8uFHUQkS5rtUU5TH5/tYxynaqrZedsn8K2GWIkVScR
	OYkqVsVYv80UUhzkPszL+uU=
X-Google-Smtp-Source: ABdhPJwWPyT4XNOPOjxAa68FXYb7xAdVTT+TH8Liokjf020d0Q0m/psH7TjjmhOZhEBSJJusjo1qbA==
X-Received: by 2002:a05:6402:3227:b0:42d:df54:ba24 with SMTP id g39-20020a056402322700b0042ddf54ba24mr7071532eda.49.1654198085236;
        Thu, 02 Jun 2022 12:28:05 -0700 (PDT)
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
 <e67bde26-2eff-948a-a2c3-08cc474affa6@gmail.com>
 <alpine.DEB.2.22.394.2206011338310.1905099@ubuntu-linux-20-04-desktop>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <ff312d2b-ece4-e4e3-a654-413636a6c8dd@gmail.com>
Date: Thu, 2 Jun 2022 22:28:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2206011338310.1905099@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 01.06.22 23:39, Stefano Stabellini wrote:

Hello Stefano

> On Wed, 1 Jun 2022, Oleksandr wrote:
>> On 01.06.22 04:04, Stefano Stabellini wrote:
>>> On Tue, 31 May 2022, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>
>>>> Reuse generic IOMMU device tree bindings to communicate Xen specific
>>>> information for the virtio devices for which the restricted memory
>>>> access using Xen grant mappings need to be enabled.
>>>>
>>>> Insert "iommus" property pointed to the IOMMU node with "xen,grant-dma"
>>>> compatible to all virtio devices which backends are going to run in
>>>> non-hardware domains (which are non-trusted by default).
>>>>
>>>> Based on device-tree binding from Linux:
>>>> Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml
>>>>
>>>> The example of generated nodes:
>>>>
>>>> xen_iommu {
>>>>       compatible = "xen,grant-dma";
>>>>       #iommu-cells = <0x01>;
>>>>       phandle = <0xfde9>;
>>>> };
>>>>
>>>> virtio@2000000 {
>>>>       compatible = "virtio,mmio";
>>>>       reg = <0x00 0x2000000 0x00 0x200>;
>>>>       interrupts = <0x00 0x01 0xf01>;
>>>>       interrupt-parent = <0xfde8>;
>>>>       dma-coherent;
>>>>       iommus = <0xfde9 0x01>;
>>>> };
>>>>
>>>> virtio@2000200 {
>>>>       compatible = "virtio,mmio";
>>>>       reg = <0x00 0x2000200 0x00 0x200>;
>>>>       interrupts = <0x00 0x02 0xf01>;
>>>>       interrupt-parent = <0xfde8>;
>>>>       dma-coherent;
>>>>       iommus = <0xfde9 0x01>;
>>>> };
>>>>
>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>> ---
>>>> !!! This patch is based on non upstreamed yet “Virtio support for
>>>> toolstack
>>>> on Arm” V8 series which is on review now:
>>>> https://lore.kernel.org/xen-devel/1651598763-12162-1-git-send-email-olekstysh@gmail.com/
>>>>
>>>> New device-tree binding (commit #5) is a part of solution to restrict
>>>> memory
>>>> access under Xen using xen-grant DMA-mapping layer (which is also on
>>>> review):
>>>> https://lore.kernel.org/xen-devel/1653944417-17168-1-git-send-email-olekstysh@gmail.com/
>>>>
>>>> Changes RFC -> V1:
>>>>      - update commit description
>>>>      - rebase according to the recent changes to
>>>>        "libxl: Introduce basic virtio-mmio support on Arm"
>>>>
>>>> Changes V1 -> V2:
>>>>      - Henry already gave his Reviewed-by, I dropped it due to the changes
>>>>      - use generic IOMMU device tree bindings instead of custom property
>>>>        "xen,dev-domid"
>>>>      - change commit subject and description, was
>>>>        "libxl/arm: Insert "xen,dev-domid" property to virtio-mmio device
>>>> node"
>>>> ---
>>>>    tools/libs/light/libxl_arm.c          | 49
>>>> ++++++++++++++++++++++++++++++++---
>>>>    xen/include/public/device_tree_defs.h |  1 +
>>>>    2 files changed, 47 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>>>> index 9be9b2a..72da3b1 100644
>>>> --- a/tools/libs/light/libxl_arm.c
>>>> +++ b/tools/libs/light/libxl_arm.c
>>>> @@ -865,9 +865,32 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
>>>>        return 0;
>>>>    }
>>>>    +static int make_xen_iommu_node(libxl__gc *gc, void *fdt)
>>>> +{
>>>> +    int res;
>>>> +
>>>> +    /* See Linux
>>>> Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml */
>>>> +    res = fdt_begin_node(fdt, "xen_iommu");
>>>> +    if (res) return res;
>>>> +
>>>> +    res = fdt_property_compat(gc, fdt, 1, "xen,grant-dma");
>>>> +    if (res) return res;
>>>> +
>>>> +    res = fdt_property_cell(fdt, "#iommu-cells", 1);
>>>> +    if (res) return res;
>>>> +
>>>> +    res = fdt_property_cell(fdt, "phandle", GUEST_PHANDLE_IOMMU);
>>>> +    if (res) return res;
>>>> +
>>>> +    res = fdt_end_node(fdt);
>>>> +    if (res) return res;
>>>> +
>>>> +    return 0;
>>>> +}
>>>>      static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
>>>> -                                 uint64_t base, uint32_t irq)
>>>> +                                 uint64_t base, uint32_t irq,
>>>> +                                 uint32_t backend_domid)
>>>>    {
>>>>        int res;
>>>>        gic_interrupt intr;
>>>> @@ -890,6 +913,16 @@ static int make_virtio_mmio_node(libxl__gc *gc, void
>>>> *fdt,
>>>>        res = fdt_property(fdt, "dma-coherent", NULL, 0);
>>>>        if (res) return res;
>>>>    +    if (backend_domid != LIBXL_TOOLSTACK_DOMID) {
>>>> +        uint32_t iommus_prop[2];
>>>> +
>>>> +        iommus_prop[0] = cpu_to_fdt32(GUEST_PHANDLE_IOMMU);
>>>> +        iommus_prop[1] = cpu_to_fdt32(backend_domid);
>>>> +
>>>> +        res = fdt_property(fdt, "iommus", iommus_prop,
>>>> sizeof(iommus_prop));
>>>> +        if (res) return res;
>>>> +    }
>>>> +
>>>>        res = fdt_end_node(fdt);
>>>>        if (res) return res;
>>>>    @@ -1097,6 +1130,7 @@ static int libxl__prepare_dtb(libxl__gc *gc,
>>>> libxl_domain_config *d_config,
>>>>        size_t fdt_size = 0;
>>>>        int pfdt_size = 0;
>>>>        libxl_domain_build_info *const info = &d_config->b_info;
>>>> +    bool iommu_created;
>>>>        unsigned int i;
>>>>          const libxl_version_info *vers;
>>>> @@ -1204,11 +1238,20 @@ next_resize:
>>>>            if (d_config->num_pcidevs)
>>>>                FDT( make_vpci_node(gc, fdt, ainfo, dom) );
>>>>    +        iommu_created = false;
>>>>            for (i = 0; i < d_config->num_disks; i++) {
>>>>                libxl_device_disk *disk = &d_config->disks[i];
>>>>    -            if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO)
>>>> -                FDT( make_virtio_mmio_node(gc, fdt, disk->base,
>>>> disk->irq) );
>>>> +            if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
>>>> +                if (disk->backend_domid != LIBXL_TOOLSTACK_DOMID &&
>>>> +                    !iommu_created) {
>>>> +                    FDT( make_xen_iommu_node(gc, fdt) );
>>>> +                    iommu_created = true;
>>>> +                }
>>>> +
>>>> +                FDT( make_virtio_mmio_node(gc, fdt, disk->base,
>>>> disk->irq,
>>>> +                                           disk->backend_domid) );
>>>> +            }
>>> This is a matter of taste as the code would also work as is, but I would
>>> do the following instead:
>>>
>>>
>>> if ( d_config->num_disks > 0 &&
>>>        disk->backend_domid != LIBXL_TOOLSTACK_DOMID) {
>>>        FDT( make_xen_iommu_node(gc, fdt) );
>>> }
>>>
>>> for (i = 0; i < d_config->num_disks; i++) {
>>>       libxl_device_disk *disk = &d_config->disks[i];
>>>
>>>       if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO)
>>>           FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq) );
>>> }
>> I got your idea to avoid using local "iommu_created". For that, I think, we
>> need to modify the first check to make sure that we have at least one virtio
>> device, otherwise we might end up inserting unused IOMMU node. But, it will
>> turn into an extra loop to go through num_disks and look for
>> LIBXL_DISK_SPECIFICATION_VIRTIO.
> I see, then just keep it as is.

ok


>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks!


-- 
Regards,

Oleksandr Tyshchenko


