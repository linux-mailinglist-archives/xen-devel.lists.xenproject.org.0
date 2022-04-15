Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02874502CA8
	for <lists+xen-devel@lfdr.de>; Fri, 15 Apr 2022 17:30:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305802.520884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfNtY-0006W6-4w; Fri, 15 Apr 2022 15:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305802.520884; Fri, 15 Apr 2022 15:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfNtY-0006TU-1j; Fri, 15 Apr 2022 15:30:00 +0000
Received: by outflank-mailman (input) for mailman id 305802;
 Fri, 15 Apr 2022 15:29:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GqiY=UZ=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nfNtW-0006TO-Eu
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 15:29:58 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7dc6ce9-bcd0-11ec-8fbe-03012f2f19d4;
 Fri, 15 Apr 2022 17:29:57 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id g19so655699lfv.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Apr 2022 08:29:57 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a2e92cf000000b002493cc687f3sm306793ljh.45.2022.04.15.08.29.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 08:29:56 -0700 (PDT)
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
X-Inumbo-ID: e7dc6ce9-bcd0-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=HL1TptI/3GtEHoAEr6jgXfR6NOOXBI/okx+jAapSegA=;
        b=eGddImuMmSOl3LcNuqTpT7K9ZL8iCjmwgxofKW7ht3Uk3JRubmks2WiLlqpBXSr1qS
         RK3VJXyuo6udZuS2bPlaPW49IjORlzh6jUv3jnHzDJ59AxdpiPxlJhRJ0YFcoacIYNKl
         pipMBLfJayeC8olZ/1827EaP56sCpiMmFxux/Qe6aqPPZ5EgfEbm4Pzs1r8HhCgT3BEI
         VOwXNdFHqmaPRfUexgZpgpCXwVuhmHy/N65russv34m6G3Nbm0waba56RK2Av9HSBa2Z
         dOd6WfICrgB76klVBL3gnR1cW24uxPRZcDlssl6kzJl27NNNviM7cWTNcmbxxWHoa+4z
         wlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HL1TptI/3GtEHoAEr6jgXfR6NOOXBI/okx+jAapSegA=;
        b=E3O2pxYYeCcRvwOh6aIPa4udwdZ48l3paM2NuK9EJ1Px+Vfz1View49bDpwSPgxbB7
         b6Uc4iTAZTsR9NWZec8xjLWfwiN8Q6VdhrK/TmwEVdQorvyfEEf+3qE+y71t19rKU6yB
         soqfMzul/21xSi8Gea9XYsTGhErF7a3h3g/LPYHxDg9khTdMD4aRyzWV5Ap1Vmj1nOP2
         niLgNkC3pvq7GK8pm9wA9RRy0+Z0htjrU2zpw+I21VwUXgOn/wKxQrAxZxDKu5/ipxd7
         /7SXnyWirP3dc5f+Kzogg8XIdNUe4n2+LQOCffH45AdI9NlyVDAfPdZCnI89wr2q+sSF
         oMHQ==
X-Gm-Message-State: AOAM532nfT+vZ99J6qXD9Lmo0XcVoT00uW9GeXlX4Gl8AlHn/0RzGt4n
	Dl6LfzmU1iG8y0SyF7Zpy/M=
X-Google-Smtp-Source: ABdhPJyrKcKa96eBJYqES8xrdpgPF+J4GHxlt596kf7yccL7/6Po/qumO4NBK1RNMWLXvzRCcCvcMw==
X-Received: by 2002:a05:6512:3d28:b0:46d:d45:8f31 with SMTP id d40-20020a0565123d2800b0046d0d458f31mr5356989lfv.146.1650036596600;
        Fri, 15 Apr 2022 08:29:56 -0700 (PDT)
Subject: Re: [RFC PATCH 0/6] virtio: Solution to restrict memory access under
 Xen using xen-virtio DMA ops layer
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 virtualization@lists.linux-foundation.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Henry Wang <Henry.Wang@arm.com>, Kaly Xin <Kaly.Xin@arm.com>,
 Jiamei Xie <Jiamei.Xie@arm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Christoph Hellwig <hch@infradead.org>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>
 <20220415044225-mutt-send-email-mst@kernel.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <d179fc28-c64c-42aa-8402-789639781cbb@gmail.com>
Date: Fri, 15 Apr 2022 18:29:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220415044225-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 15.04.22 11:44, Michael S. Tsirkin wrote:


Hello Michael



> On Thu, Apr 14, 2022 at 10:19:27PM +0300, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Hello all.
>>
>> The purpose of this RFC patch series is to add support for restricting memory access under Xen using specific
>> grant table based DMA ops layer. Patch series is based on Juergen Gross’ initial work [1] which implies using
>> grant references instead of raw guest physical addresses (GPA) for the virtio communications (some kind of
>> the software IOMMU).
>>
>> The high level idea is to create new Xen’s grant table based DMA ops layer for the guest Linux whose main
>> purpose is to provide a special 64-bit DMA address which is formed by using the grant reference (for a page
>> to be shared with the backend) with offset and setting the highest address bit (this is for the backend to
>> be able to distinguish grant ref based DMA address from normal GPA). For this to work we need the ability
>> to allocate contiguous (consecutive) grant references for multi-page allocations. And the backend then needs
>> to offer VIRTIO_F_ACCESS_PLATFORM and VIRTIO_F_VERSION_1 feature bits (it must support virtio-mmio modern
>> transport for 64-bit addresses in the virtqueue).
> I'm not enough of a xen expert to review this, and I didn't get
> all patches, but I'm very happy to see that approach being
> taken. VIRTIO_F_ACCESS_PLATFORM and VIRTIO_F_VERSION_1 are
> exactly the way to declare not all of memory is accessible.
> Thanks!

I am happy to hear that! Thank you.


Regarding the "all patches" I have already redirect missing ones, I hope 
you and Christoph will get them.

Sorry for the inconvenience.


>
>> Xen's grant mapping mechanism is the secure and safe solution to share pages between domains which proven
>> to work and works for years (in the context of traditional Xen PV drivers for example). So far, the foreign
>> mapping is used for the virtio backend to map and access guest memory. With the foreign mapping, the backend
>> is able to map arbitrary pages from the guest memory (or even from Dom0 memory). And as the result, the malicious
>> backend which runs in a non-trusted domain can take advantage of this. Instead, with the grant mapping
>> the backend is only allowed to map pages which were explicitly granted by the guest before and nothing else.
>> According to the discussions in various mainline threads this solution would likely be welcome because it
>> perfectly fits in the security model Xen provides.
>>
>> What is more, the grant table based solution requires zero changes to the Xen hypervisor itself at least
>> with virtio-mmio and DT (in comparison, for example, with "foreign mapping + virtio-iommu" solution which would
>> require the whole new complex emulator in hypervisor in addition to new functionality/hypercall to pass IOVA
>> from the virtio backend running elsewhere to the hypervisor and translate it to the GPA before mapping into
>> P2M or denying the foreign mapping request if no corresponding IOVA-GPA mapping present in the IOMMU page table
>> for that particular device). We only need to update toolstack to insert a new "xen,dev-domid" property to
>> the virtio-mmio device node when creating a guest device-tree (this is an indicator for the guest to use grants
>> and the ID of Xen domain where the corresponding backend resides, it is used as an argument to the grant mapping
>> APIs). It worth mentioning that toolstack patch is based on non  upstreamed yet “Virtio support for toolstack
>> on Arm” series which is on review now [2].
>>
>> Please note the following:
>> - Patch series only covers Arm and virtio-mmio (device-tree) for now. To enable the restricted memory access
>>    feature on Arm the following options should be set:
>>    CONFIG_XEN_VIRTIO = y
>>    CONFIG_XEN_HVM_VIRTIO_GRANT = y
>> - Some callbacks in xen-virtio DMA ops layer (map_sg/unmap_sg, etc) are not implemented yet as they are not
>>    needed/used in the first prototype
>>
>> Patch series is rebased on Linux 5.18-rc2 tag and tested on Renesas Salvator-X board + H3 ES3.0 SoC (Arm64)
>> with standalone userspace (non-Qemu) virtio-mmio based virtio-disk backend running in Driver domain and Linux
>> guest running on existing virtio-blk driver (frontend). No issues were observed. Guest domain 'reboot/destroy'
>> use-cases work properly. I have also tested other use-cases such as assigning several virtio block devices
>> or a mix of virtio and Xen PV block devices to the guest.
>>
>> 1. Xen changes located at (last patch):
>> https://github.com/otyshchenko1/xen/commits/libxl_virtio_next
>> 2. Linux changes located at:
>> https://github.com/otyshchenko1/linux/commits/virtio_grant5
>> 3. virtio-disk changes located at:
>> https://github.com/otyshchenko1/virtio-disk/commits/virtio_grant
>>
>> Any feedback/help would be highly appreciated.
>>
>> [1] https://www.youtube.com/watch?v=IrlEdaIUDPk
>> [2] https://lore.kernel.org/xen-devel/1649442065-8332-1-git-send-email-olekstysh@gmail.com/
>>
>> Juergen Gross (2):
>>    xen/grants: support allocating consecutive grants
>>    virtio: add option to restrict memory access under Xen
>>
>> Oleksandr Tyshchenko (4):
>>    dt-bindings: xen: Add xen,dev-domid property description for
>>      xen-virtio layer
>>    virtio: Various updates to xen-virtio DMA ops layer
>>    arm/xen: Introduce xen_setup_dma_ops()
>>    arm/xen: Assign xen-virtio DMA ops for virtio devices in Xen guests
>>
>>   .../devicetree/bindings/virtio/xen,dev-domid.yaml  |  39 +++
>>   arch/arm/include/asm/xen/xen-ops.h                 |   1 +
>>   arch/arm/mm/dma-mapping.c                          |   5 +-
>>   arch/arm/xen/enlighten.c                           |  11 +
>>   arch/arm64/include/asm/xen/xen-ops.h               |   1 +
>>   arch/arm64/mm/dma-mapping.c                        |   5 +-
>>   arch/x86/mm/init.c                                 |  15 +
>>   arch/x86/mm/mem_encrypt.c                          |   5 -
>>   arch/x86/xen/Kconfig                               |   9 +
>>   drivers/xen/Kconfig                                |  20 ++
>>   drivers/xen/Makefile                               |   1 +
>>   drivers/xen/grant-table.c                          | 238 +++++++++++++--
>>   drivers/xen/xen-virtio.c                           | 335 +++++++++++++++++++++
>>   include/xen/arm/xen-ops.h                          |  20 ++
>>   include/xen/grant_table.h                          |   4 +
>>   include/xen/xen-ops.h                              |  13 +
>>   16 files changed, 679 insertions(+), 43 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/virtio/xen,dev-domid.yaml
>>   create mode 100644 arch/arm/include/asm/xen/xen-ops.h
>>   create mode 100644 arch/arm64/include/asm/xen/xen-ops.h
>>   create mode 100644 drivers/xen/xen-virtio.c
>>   create mode 100644 include/xen/arm/xen-ops.h
>>
>> -- 
>> 2.7.4

-- 
Regards,

Oleksandr Tyshchenko


