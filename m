Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C885E501BB1
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 21:20:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305045.519854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf50I-00057s-EC; Thu, 14 Apr 2022 19:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305045.519854; Thu, 14 Apr 2022 19:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf50I-000558-BB; Thu, 14 Apr 2022 19:19:42 +0000
Received: by outflank-mailman (input) for mailman id 305045;
 Thu, 14 Apr 2022 19:19:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RCiM=UY=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nf50G-00054x-8T
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 19:19:40 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d419adcc-bc27-11ec-8fbe-03012f2f19d4;
 Thu, 14 Apr 2022 21:19:39 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id p10so10721585lfa.12
 for <xen-devel@lists.xenproject.org>; Thu, 14 Apr 2022 12:19:39 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a194943000000b0046b928d2795sm85001lfj.67.2022.04.14.12.19.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Apr 2022 12:19:37 -0700 (PDT)
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
X-Inumbo-ID: d419adcc-bc27-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hBeYUJyh8cohFIBXMw+rp2zvHseFstsvrmjjJq6v1RA=;
        b=OS9Zyyw11+ahcSbaFBwnet4m/+SqFvTSxBJAra7HuBWht0AJqsov+byDRY2fDcE7Cs
         ytQj6zRGrqwIncCbAZw9crMvkswQ0zpZovlwDav7PgeiWph9GDH1Vn+lFgWyfq4pf9Q6
         D2bG8OWhifqZbowaCdO0dbVut/XPPk2sn+J4gDQPfI0IRUkzB49h1qS2s77WM2wj6Hc0
         XiiWyRzeOYZiYXi7x7A/rRQlZHH+glMqunBBbrU6BwKqFdu1m5oH6E29FDom7ZKFAHyW
         2ozw4PRAgrtB8ITcoMnvHW1txGeX3p4mnMFmtLnTd+4XkolWYRvNXGTibUY+EzZSgMXW
         D3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hBeYUJyh8cohFIBXMw+rp2zvHseFstsvrmjjJq6v1RA=;
        b=hAZmmcU5Owv+s0GbrbfllirN7dzhY7fl4g5me5r7uNjrBvBVv6ggtl4Gju2Es6eNeT
         BbA54HK0DUoRmjMNSXactDKPojFPZWssYXnTNoKUO1BYc6VCpTFV0BY/wSE0YmPrn3Bq
         uP/jnnwECzeXG5x7m6c+dMlH4HIc7TOEH5w30o8aCJc0emDYViIVuvSJ1SnD4PJtYD34
         MrfWjt06NGSbVvhanhnsEBudqc88DhQ5OR++4y4Sic85gvF9170+ghWamHFvZEejGhNp
         PdsdaP1xukKkDRle62QjmmZzh2PMN+MpxR4GWHxpcYy9WedUY2zAjc8WoTvxpfjco7nA
         +TDQ==
X-Gm-Message-State: AOAM533zINWnobCY7AB3LklX+m+KEJsGfPnX2mId1grteYswviyZJkSb
	o1VRjf0Uh6LvaHQRuYg3mkKSXR1XXoY=
X-Google-Smtp-Source: ABdhPJyF5XrQhJyJg+R3ILmVTNsDHntbRwzflHI2RtvXh6tjp4CUiSxKClbc5XPs/9iS6Kt3RoSWZQ==
X-Received: by 2002:ac2:4d18:0:b0:46b:c318:193b with SMTP id r24-20020ac24d18000000b0046bc318193bmr2602821lfi.293.1649963978137;
        Thu, 14 Apr 2022 12:19:38 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <Wei.Chen@arm.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Kaly Xin <Kaly.Xin@arm.com>,
	Jiamei Xie <Jiamei.Xie@arm.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 0/6] virtio: Solution to restrict memory access under Xen using xen-virtio DMA ops layer
Date: Thu, 14 Apr 2022 22:19:27 +0300
Message-Id: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Hello all.

The purpose of this RFC patch series is to add support for restricting memory access under Xen using specific
grant table based DMA ops layer. Patch series is based on Juergen Gross’ initial work [1] which implies using
grant references instead of raw guest physical addresses (GPA) for the virtio communications (some kind of
the software IOMMU).

The high level idea is to create new Xen’s grant table based DMA ops layer for the guest Linux whose main
purpose is to provide a special 64-bit DMA address which is formed by using the grant reference (for a page
to be shared with the backend) with offset and setting the highest address bit (this is for the backend to
be able to distinguish grant ref based DMA address from normal GPA). For this to work we need the ability
to allocate contiguous (consecutive) grant references for multi-page allocations. And the backend then needs
to offer VIRTIO_F_ACCESS_PLATFORM and VIRTIO_F_VERSION_1 feature bits (it must support virtio-mmio modern
transport for 64-bit addresses in the virtqueue).

Xen's grant mapping mechanism is the secure and safe solution to share pages between domains which proven
to work and works for years (in the context of traditional Xen PV drivers for example). So far, the foreign
mapping is used for the virtio backend to map and access guest memory. With the foreign mapping, the backend
is able to map arbitrary pages from the guest memory (or even from Dom0 memory). And as the result, the malicious
backend which runs in a non-trusted domain can take advantage of this. Instead, with the grant mapping
the backend is only allowed to map pages which were explicitly granted by the guest before and nothing else. 
According to the discussions in various mainline threads this solution would likely be welcome because it
perfectly fits in the security model Xen provides. 

What is more, the grant table based solution requires zero changes to the Xen hypervisor itself at least
with virtio-mmio and DT (in comparison, for example, with "foreign mapping + virtio-iommu" solution which would
require the whole new complex emulator in hypervisor in addition to new functionality/hypercall to pass IOVA
from the virtio backend running elsewhere to the hypervisor and translate it to the GPA before mapping into
P2M or denying the foreign mapping request if no corresponding IOVA-GPA mapping present in the IOMMU page table
for that particular device). We only need to update toolstack to insert a new "xen,dev-domid" property to
the virtio-mmio device node when creating a guest device-tree (this is an indicator for the guest to use grants
and the ID of Xen domain where the corresponding backend resides, it is used as an argument to the grant mapping
APIs). It worth mentioning that toolstack patch is based on non  upstreamed yet “Virtio support for toolstack
on Arm” series which is on review now [2].

Please note the following:
- Patch series only covers Arm and virtio-mmio (device-tree) for now. To enable the restricted memory access
  feature on Arm the following options should be set:
  CONFIG_XEN_VIRTIO = y
  CONFIG_XEN_HVM_VIRTIO_GRANT = y
- Some callbacks in xen-virtio DMA ops layer (map_sg/unmap_sg, etc) are not implemented yet as they are not
  needed/used in the first prototype

Patch series is rebased on Linux 5.18-rc2 tag and tested on Renesas Salvator-X board + H3 ES3.0 SoC (Arm64)
with standalone userspace (non-Qemu) virtio-mmio based virtio-disk backend running in Driver domain and Linux
guest running on existing virtio-blk driver (frontend). No issues were observed. Guest domain 'reboot/destroy'
use-cases work properly. I have also tested other use-cases such as assigning several virtio block devices
or a mix of virtio and Xen PV block devices to the guest. 

1. Xen changes located at (last patch):
https://github.com/otyshchenko1/xen/commits/libxl_virtio_next
2. Linux changes located at:
https://github.com/otyshchenko1/linux/commits/virtio_grant5
3. virtio-disk changes located at:
https://github.com/otyshchenko1/virtio-disk/commits/virtio_grant

Any feedback/help would be highly appreciated.

[1] https://www.youtube.com/watch?v=IrlEdaIUDPk
[2] https://lore.kernel.org/xen-devel/1649442065-8332-1-git-send-email-olekstysh@gmail.com/

Juergen Gross (2):
  xen/grants: support allocating consecutive grants
  virtio: add option to restrict memory access under Xen

Oleksandr Tyshchenko (4):
  dt-bindings: xen: Add xen,dev-domid property description for
    xen-virtio layer
  virtio: Various updates to xen-virtio DMA ops layer
  arm/xen: Introduce xen_setup_dma_ops()
  arm/xen: Assign xen-virtio DMA ops for virtio devices in Xen guests

 .../devicetree/bindings/virtio/xen,dev-domid.yaml  |  39 +++
 arch/arm/include/asm/xen/xen-ops.h                 |   1 +
 arch/arm/mm/dma-mapping.c                          |   5 +-
 arch/arm/xen/enlighten.c                           |  11 +
 arch/arm64/include/asm/xen/xen-ops.h               |   1 +
 arch/arm64/mm/dma-mapping.c                        |   5 +-
 arch/x86/mm/init.c                                 |  15 +
 arch/x86/mm/mem_encrypt.c                          |   5 -
 arch/x86/xen/Kconfig                               |   9 +
 drivers/xen/Kconfig                                |  20 ++
 drivers/xen/Makefile                               |   1 +
 drivers/xen/grant-table.c                          | 238 +++++++++++++--
 drivers/xen/xen-virtio.c                           | 335 +++++++++++++++++++++
 include/xen/arm/xen-ops.h                          |  20 ++
 include/xen/grant_table.h                          |   4 +
 include/xen/xen-ops.h                              |  13 +
 16 files changed, 679 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/virtio/xen,dev-domid.yaml
 create mode 100644 arch/arm/include/asm/xen/xen-ops.h
 create mode 100644 arch/arm64/include/asm/xen/xen-ops.h
 create mode 100644 drivers/xen/xen-virtio.c
 create mode 100644 include/xen/arm/xen-ops.h

-- 
2.7.4


