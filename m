Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F141D51E922
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 20:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323754.545566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnP1W-0006WV-Qu; Sat, 07 May 2022 18:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323754.545566; Sat, 07 May 2022 18:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnP1W-0006Tx-O4; Sat, 07 May 2022 18:19:22 +0000
Received: by outflank-mailman (input) for mailman id 323754;
 Sat, 07 May 2022 18:19:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y6lb=VP=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nnP1V-0006Tm-01
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 18:19:21 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35fb33b5-ce32-11ec-a406-831a346695d4;
 Sat, 07 May 2022 20:19:19 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso8572902wme.5
 for <xen-devel@lists.xenproject.org>; Sat, 07 May 2022 11:19:19 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a5d4d8a000000b0020c5253d8f3sm8198457wru.63.2022.05.07.11.19.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 07 May 2022 11:19:16 -0700 (PDT)
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
X-Inumbo-ID: 35fb33b5-ce32-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XX78GWwMd1nia7nwVqcpbwaGJYOhbuMkDsq/dHRQm1Y=;
        b=NMekUxOk5A9I52CMEmMbtbPh5mza3hWVxCElP9ubE0KvS685lAQ6mzs2uEPkqTYBK5
         FOtr+BdB6ua9HG1LiAdwO4OQ/ebkBrNvHN1d0E5RgAetlfcCL9tAiR43Og6zAlRYW55W
         88r+oBoEZNEYeE4R4NV8LEcDnq8OEteXHou8aU/wrzVABEqgAjc7i4hhEk2ZK2u1/oZ5
         tgrOFy5uwz0lMPGxrMtC90bOEVjYYOCBCs8FlIuoyp4LB7p3QuIBSKqqtl6lhwkMVfIP
         03ZEu+ufqYvoSDN/C1JgVRCqUCkWH+mdS79q9RnfT6RP+tvDiP45mUuKhqCYaxTE2DLc
         JP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XX78GWwMd1nia7nwVqcpbwaGJYOhbuMkDsq/dHRQm1Y=;
        b=kPYWkx/ScKm2tjDKFKz0a7BNSEcH/BcpJODma8SLrV5RGWPDi8wBCooF5+SlIY/6Yx
         oP6CO2xqnBlyrp3p7R+NqXOfZ+YJW8Q6o+gNpExk9eUMLV027sPt6QIGW0UyZKxdOx83
         Ur5LMCQPnSnlt1ZN0R+u165LK6Y+gOJ0MGSNSvN5V+v4PDxlLfOseykqubcDCesAjKhl
         JVL9VvPkXDNoe4QHzbsMg+TDQrCsvjbxpWL2um3ZQhcg2UburRkygSuSuytePxaoM1hF
         K7Y1dfCIckh1zdCQcjUUCdq3+1AWS0fxVIu77fCWWR9l9jds9iq2CQl92HJqAy/WPEyU
         lOIw==
X-Gm-Message-State: AOAM530L/GNlThdNeqJZO8XggpDe0cq42QDxSfE9Lc15wBpeIZhgQtk8
	KtP3Bqf3mG4whevHOSmos6FbVgt3eFw=
X-Google-Smtp-Source: ABdhPJwccDv2hxVU9RUi+xr7GLJPabMJIGyT1Ic0dLKzlXNKKB7nSQ4aD1yIw6UH2GBRi7PQazSapw==
X-Received: by 2002:a05:600c:2112:b0:393:ff25:fb92 with SMTP id u18-20020a05600c211200b00393ff25fb92mr8827389wml.194.1651947557846;
        Sat, 07 May 2022 11:19:17 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	x86@kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
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
Subject: [PATCH V2 0/7] virtio: Solution to restrict memory access under Xen using xen-grant DMA-mapping layer
Date: Sat,  7 May 2022 21:19:01 +0300
Message-Id: <1651947548-4055-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Hello all.

The purpose of this patch series is to add support for restricting memory access under Xen using specific
grant table [1] based DMA-mapping layer. Patch series is based on Juergen Gross’ initial work [2] which implies
using grant references instead of raw guest physical addresses (GPA) for the virtio communications (some
kind of the software IOMMU).

You can find RFC-V1 patch series (and previous discussions) at [3].

The high level idea is to create new Xen’s grant table based DMA-mapping layer for the guest Linux whose main
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
APIs). It worth mentioning that toolstack patch is based on non upstreamed yet “Virtio support for toolstack
on Arm” series which is on review now [4].

Please note the following:
- Patch series only covers Arm and virtio-mmio (device-tree) for now. To enable the restricted memory access
  feature on Arm the following option should be set:
  CONFIG_XEN_VIRTIO = y
- Patch series is based on "platform_has()" patch series which is on review now [5]
- Xen should be built with the following options:
  CONFIG_IOREQ_SERVER=y
  CONFIG_EXPERT=y

Patch series is rebased on Linux 5.18-rc4 tag with "platform_has()" series applied and tested on Renesas
Salvator-X board + H3 ES3.0 SoC (Arm64) with standalone userspace (non-Qemu) virtio-mmio based virtio-disk
backend running in Driver domain and Linux guest running on existing virtio-blk driver (frontend).
No issues were observed. Guest domain 'reboot/destroy' use-cases work properly. I have also tested other
use-cases such as assigning several virtio block devices or a mix of virtio and Xen PV block devices
to the guest. Patch series was build-tested on Arm32 and x86.

1. Xen changes located at (last patch):
https://github.com/otyshchenko1/xen/commits/libxl_virtio_next1
2. Linux changes located at (last 7 patches):
https://github.com/otyshchenko1/linux/commits/virtio_grant7
3. virtio-disk changes located at:
https://github.com/otyshchenko1/virtio-disk/commits/virtio_grant

Any feedback/help would be highly appreciated.

[1] https://xenbits.xenproject.org/docs/4.16-testing/misc/grant-tables.txt
[2] https://www.youtube.com/watch?v=IrlEdaIUDPk
[3] https://lore.kernel.org/xen-devel/1649963973-22879-1-git-send-email-olekstysh@gmail.com/
    https://lore.kernel.org/xen-devel/1650646263-22047-1-git-send-email-olekstysh@gmail.com/
[4] https://lore.kernel.org/xen-devel/1651598763-12162-1-git-send-email-olekstysh@gmail.com/
[5] https://lore.kernel.org/xen-devel/20220504155703.13336-1-jgross@suse.com/

Juergen Gross (3):
  xen/grants: support allocating consecutive grants
  xen/grant-dma-ops: Add option to restrict memory access under Xen
  xen/virtio: Enable restricted memory access using Xen grant mappings

Oleksandr Tyshchenko (4):
  arm/xen: Introduce xen_setup_dma_ops()
  dt-bindings: Add xen,dev-domid property description for xen-grant DMA
    ops
  xen/grant-dma-ops: Retrieve the ID of backend's domain for DT devices
  arm/xen: Assign xen-grant DMA ops for xen-grant DMA devices

 .../devicetree/bindings/arm/xen,dev-domid.yaml     |  37 +++
 Documentation/devicetree/bindings/virtio/mmio.yaml |   7 +
 arch/arm/include/asm/xen/xen-ops.h                 |   2 +
 arch/arm/mm/dma-mapping.c                          |   7 +-
 arch/arm/xen/enlighten.c                           |   2 +
 arch/arm64/include/asm/xen/xen-ops.h               |   2 +
 arch/arm64/mm/dma-mapping.c                        |   7 +-
 arch/x86/xen/enlighten_hvm.c                       |   2 +
 arch/x86/xen/enlighten_pv.c                        |   2 +
 drivers/xen/Kconfig                                |  15 +
 drivers/xen/Makefile                               |   1 +
 drivers/xen/grant-dma-ops.c                        | 324 +++++++++++++++++++++
 drivers/xen/grant-table.c                          | 238 +++++++++++++--
 include/xen/arm/xen-ops.h                          |  18 ++
 include/xen/grant_table.h                          |   4 +
 include/xen/xen-ops.h                              |  13 +
 include/xen/xen.h                                  |   8 +
 17 files changed, 647 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
 create mode 100644 arch/arm/include/asm/xen/xen-ops.h
 create mode 100644 arch/arm64/include/asm/xen/xen-ops.h
 create mode 100644 drivers/xen/grant-dma-ops.c
 create mode 100644 include/xen/arm/xen-ops.h

-- 
2.7.4


