Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 405D953886F
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 23:01:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338743.563553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvmV5-0007Ni-CJ; Mon, 30 May 2022 21:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338743.563553; Mon, 30 May 2022 21:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvmV5-0007LC-96; Mon, 30 May 2022 21:00:31 +0000
Received: by outflank-mailman (input) for mailman id 338743;
 Mon, 30 May 2022 21:00:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pxv1=WG=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nvmV3-0007Kr-N1
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 21:00:29 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8777b38a-e05b-11ec-837f-e5687231ffcc;
 Mon, 30 May 2022 23:00:26 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id w23so1926061ljd.11
 for <xen-devel@lists.xenproject.org>; Mon, 30 May 2022 14:00:26 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a2ea275000000b0025550e2693asm581541ljm.38.2022.05.30.14.00.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 May 2022 14:00:24 -0700 (PDT)
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
X-Inumbo-ID: 8777b38a-e05b-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pCuUv8q5/WjIfzAOA2DFkkQ9mqGV4kxo4YoM+Cvu6ro=;
        b=WiaI+KKEgRCNknoz8Uc1/yoDLF8mhbBdpNIhtRrX887u68NsU80S5MLVYN1hnPW7zZ
         +dTPIJuhRW7AyOX8kfFAcbdIjaFgsZsqJ22tA0rz1M0PUx+hdfJdyQjjJfSltyOzkOVM
         j5bkZUBb1pNLRM354pRd0Cs37ddJYAKbD+rCM2zjsuLVdDR2NnwDNFemZidMtFwTQNg5
         I/2xxvKDxNxedVbMMg6cxnxOekrmwTDufwAlIvt5yfn1jIWc5/qMkroYWwZbDiJjue+y
         Zyg8VcXHD80UYJ/GrcTN34bY37mtfnV7suFPacqHYXpexTrq9BbpeIi3hH+fnocrm7Lc
         1FIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pCuUv8q5/WjIfzAOA2DFkkQ9mqGV4kxo4YoM+Cvu6ro=;
        b=FKHslnztLhypkDavtRrwfuszHZrMq1aSEO8AHk8auaZkNgCtCz/DR8qFLZ9j6uPCHk
         Bi4ya0c3eflZKqlgknHHuJoFJayxAq9EXO6XjleGaJIykNNADDmirxuM3PRXUNpBwPfu
         lhA8NuW7ifn9rGpEUklsj10nM9a7U6dhxP1KGjfAYRiBA1jEOt8cv6z2AgvUg9H8xbNa
         NH4I4pFTeVzJYgxFdBCpNW0uZ5sRlP41pOUG8uWebaWPTYE0apoPBLwQOlZlijlal4BY
         qnElxMpmfFeNltW6R4KAEf+TB/zpKv2867z1C5qtmZwxVIYuZRfoGI95lWRlHepsJcrU
         NvmQ==
X-Gm-Message-State: AOAM533MREUG1i5LqIgcmU8iWJcsMSPpUfUOoimnw7PT1D89sHQRFzLN
	4RljiQztVYWiIeCFoPRTWyEF5SjfAl8=
X-Google-Smtp-Source: ABdhPJxtPivFiIEh6T2ItZTRi/yK5GNRp+BWkq0NWB8Leq1OGP2eIcmRspv46TKfr7DKK6pwtHPgug==
X-Received: by 2002:a2e:bd13:0:b0:246:1ff8:6da1 with SMTP id n19-20020a2ebd13000000b002461ff86da1mr33708820ljq.219.1653944425323;
        Mon, 30 May 2022 14:00:25 -0700 (PDT)
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
Subject: [PATCH V3 0/8] virtio: Solution to restrict memory access under Xen using xen-grant DMA-mapping layer
Date: Tue, 31 May 2022 00:00:09 +0300
Message-Id: <1653944417-17168-1-git-send-email-olekstysh@gmail.com>
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

You can find RFC-V2 patch series (and previous discussions) at [3].

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
for that particular device). We only need to update toolstack to insert "xen,grant-dma" IOMMU node (to be referred
by the virtio-mmio device using "iommus" property) when creating a guest device-tree (this is an indicator for
the guest to use Xen grant mappings scheme for that device with the endpoint ID being used as ID of Xen domain
where the corresponding backend is running, the backend domid is used as an argument to the grant mapping APIs).
It worth mentioning that toolstack patch is based on non upstreamed yet “Virtio support for toolstack on Arm”
series which is on review now [4].

Please note the following:
- Patch series only covers Arm and virtio-mmio (device-tree) for now. To enable the restricted memory access
  feature on Arm the following option should be set:
  CONFIG_XEN_VIRTIO=y
- Patch series is based on "kernel: add new infrastructure for platform_has() support" patch series which
  is on review now [5]
- Xen should be built with the following options:
  CONFIG_IOREQ_SERVER=y
  CONFIG_EXPERT=y

Patch series is rebased on Linux 5.18-rc7 tag with "kernel: add new infrastructure for platform_has() support" and
"xen: simplify frontend side ring setup" series applied and tested on Renesas Salvator-X board + H3 ES3.0 SoC (Arm64)
with standalone userspace (non-Qemu) virtio-mmio based virtio-disk backend running in Driver domain and Linux guest
running on existing virtio-blk driver (frontend). No issues were observed. Guest domain 'reboot/destroy' use-cases
work properly.
I have also tested other use-cases such as assigning several virtio block devices or a mix of virtio and Xen PV block
devices to the guest. Patch series was build-tested on Arm32 and x86.

1. Xen changes located at (last patch):
https://github.com/otyshchenko1/xen/commits/libxl_virtio_next2_1
2. Linux changes located at (last 8 patches):
https://github.com/otyshchenko1/linux/commits/virtio_grant8_1
3. virtio-disk changes located at:
https://github.com/otyshchenko1/virtio-disk/commits/virtio_grant

Any feedback/help would be highly appreciated.

[1] https://xenbits.xenproject.org/docs/4.16-testing/misc/grant-tables.txt
[2] https://www.youtube.com/watch?v=IrlEdaIUDPk
[3] https://lore.kernel.org/xen-devel/1649963973-22879-1-git-send-email-olekstysh@gmail.com/
    https://lore.kernel.org/xen-devel/1650646263-22047-1-git-send-email-olekstysh@gmail.com/
    https://lore.kernel.org/xen-devel/1651947548-4055-1-git-send-email-olekstysh@gmail.com/
[4] https://lore.kernel.org/xen-devel/1651598763-12162-1-git-send-email-olekstysh@gmail.com/
[5] https://lore.kernel.org/xen-devel/20220504155703.13336-1-jgross@suse.com/

Juergen Gross (3):
  xen/grants: support allocating consecutive grants
  xen/grant-dma-ops: Add option to restrict memory access under Xen
  xen/virtio: Enable restricted memory access using Xen grant mappings

Oleksandr Tyshchenko (5):
  arm/xen: Introduce xen_setup_dma_ops()
  dt-bindings: Add xen,grant-dma IOMMU description for xen-grant DMA ops
  xen/grant-dma-iommu: Introduce stub IOMMU driver
  xen/grant-dma-ops: Retrieve the ID of backend's domain for DT devices
  arm/xen: Assign xen-grant DMA ops for xen-grant DMA devices

 .../devicetree/bindings/iommu/xen,grant-dma.yaml   |  49 +++
 arch/arm/include/asm/xen/xen-ops.h                 |   2 +
 arch/arm/mm/dma-mapping.c                          |   7 +-
 arch/arm/xen/enlighten.c                           |   2 +
 arch/arm64/include/asm/xen/xen-ops.h               |   2 +
 arch/arm64/mm/dma-mapping.c                        |   7 +-
 arch/x86/xen/enlighten_hvm.c                       |   2 +
 arch/x86/xen/enlighten_pv.c                        |   2 +
 drivers/xen/Kconfig                                |  20 ++
 drivers/xen/Makefile                               |   2 +
 drivers/xen/grant-dma-iommu.c                      |  78 +++++
 drivers/xen/grant-dma-ops.c                        | 345 +++++++++++++++++++++
 drivers/xen/grant-table.c                          | 251 ++++++++++++---
 include/xen/arm/xen-ops.h                          |  18 ++
 include/xen/grant_table.h                          |   4 +
 include/xen/xen-ops.h                              |  13 +
 include/xen/xen.h                                  |   8 +
 17 files changed, 766 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml
 create mode 100644 arch/arm/include/asm/xen/xen-ops.h
 create mode 100644 arch/arm64/include/asm/xen/xen-ops.h
 create mode 100644 drivers/xen/grant-dma-iommu.c
 create mode 100644 drivers/xen/grant-dma-ops.c
 create mode 100644 include/xen/arm/xen-ops.h

-- 
2.7.4


