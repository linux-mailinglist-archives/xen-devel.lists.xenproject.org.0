Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B6850BD97
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 18:51:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311111.528147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhwV8-0006FL-Et; Fri, 22 Apr 2022 16:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311111.528147; Fri, 22 Apr 2022 16:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhwV8-0006Ct-Af; Fri, 22 Apr 2022 16:51:22 +0000
Received: by outflank-mailman (input) for mailman id 311111;
 Fri, 22 Apr 2022 16:51:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hyV/=VA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nhwV6-00064C-Ch
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 16:51:20 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ee2a5c5-c25c-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 18:51:19 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id q185so1165337ljb.5
 for <xen-devel@lists.xenproject.org>; Fri, 22 Apr 2022 09:51:19 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a056512310200b0046e2f507a3asm279742lfb.167.2022.04.22.09.51.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Apr 2022 09:51:17 -0700 (PDT)
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
X-Inumbo-ID: 6ee2a5c5-c25c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LliXt8vJbXvk0gdFymCWz7TFV5bME1jg6XdQF6Tyw7k=;
        b=E9bX8ntWQGbQG1g3CC0CY2p2Kmtu3Nq9zrBtYvnyvEBLe7UDaSXAfZp84Hz0Tmy7ZA
         AATF/cIenThS+4zqHWER1H04j8AbhDQSZaiKleKvsWFfPEERKOkds0mIPjp1CnINcTYs
         RLpfQnNiRd8n8brSU0+bqdlt5sMm5kgdxDCiGtBaZHF3pAZRJU4F2T867V9vCEExFw7G
         OI9aX+a85bD1I3FoyNGdVkXG/48sjsOQuXPybwv6PTvN6tn1yJhSp1wtym1oBJjESUKS
         NjVtGr70HWW9TBwhjue+jdSTc64xnZqHDbqFQjwFr0fddlJhOkp/FOuMjxHmyoihZYWs
         hrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LliXt8vJbXvk0gdFymCWz7TFV5bME1jg6XdQF6Tyw7k=;
        b=HNVkh1jpLKCM+4DCzkvHAhYOENrZPuufNtC/+eev0wvQ2HRrMOi4gKy54hfCD90K0T
         /zsj8q1p/eWy98xx0XoXPezi/a6LZdqgDVDJTNIcowvSukL26ML4rXTRwwyqrvF2Vga/
         X9w4/5qyXSfqm4HXnm9m+NIJNvN/P3OlxlxUA3wB8VUzWtwiqPwC8Kn8+apneJokO5bm
         +tWHknXnCU+CSHYu/s4ds6XiUb92CmDXfr7e7wlG1ezKsfHQ96sf/KB86w7lyKXhn1NX
         TaWvTfUVOUPoQ9J428UmwrzQVm+KSxedcsGrkrzojewoCxDWp5jhXmQ0vvK86Oxfcs5e
         W1Cw==
X-Gm-Message-State: AOAM530d0cm3ynSymAZVJ0xVdFddqHfseDO1Va0YkYS16gmt0010Q5R6
	tIdMTYnFMxmp5q05k/0A76v6rC2FO88=
X-Google-Smtp-Source: ABdhPJy6agfKahSo69KTOtM8idnRXj26r9imzfrM1EBFWoxzebKvrJ8xa3gfhyv7KZGn11RXBkTAWA==
X-Received: by 2002:a2e:9984:0:b0:24e:f843:3e8c with SMTP id w4-20020a2e9984000000b0024ef8433e8cmr1173572lji.299.1650646278427;
        Fri, 22 Apr 2022 09:51:18 -0700 (PDT)
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
Subject: [PATCH V1 0/6] virtio: Solution to restrict memory access under Xen using xen-grant DMA-mapping layer
Date: Fri, 22 Apr 2022 19:50:57 +0300
Message-Id: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
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

You can find RFC patch series (and previous discussions) at [3].

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
APIs). It worth mentioning that toolstack patch is based on non  upstreamed yet “Virtio support for toolstack
on Arm” series which is on review now [4].

Please note the following:
- Patch series only covers Arm and virtio-mmio (device-tree) for now. To enable the restricted memory access
  feature on Arm the following option should be set:
  CONFIG_XEN_VIRTIO = y
- Some callbacks in xen-grant DMA-mapping layer (alloc_pages/free_pages, etc) are not implemented yet as they
  are not needed/used in the first prototype
- Xen should be built with the following options:
  CONFIG_IOREQ_SERVER=y
  CONFIG_EXPERT=y
  
Patch series is rebased on Linux 5.18-rc2 tag and tested on Renesas Salvator-X board + H3 ES3.0 SoC (Arm64)
with standalone userspace (non-Qemu) virtio-mmio based virtio-disk backend running in Driver domain and Linux
guest running on existing virtio-blk driver (frontend). No issues were observed. Guest domain 'reboot/destroy'
use-cases work properly. I have also tested other use-cases such as assigning several virtio block devices
or a mix of virtio and Xen PV block devices to the guest. Patch series was build-tested on Arm32 and x86.

1. Xen changes located at (last patch):
https://github.com/otyshchenko1/xen/commits/libxl_virtio_next
2. Linux changes located at:
https://github.com/otyshchenko1/linux/commits/virtio_grant6
3. virtio-disk changes located at:
https://github.com/otyshchenko1/virtio-disk/commits/virtio_grant

Any feedback/help would be highly appreciated.

[1] https://xenbits.xenproject.org/docs/4.16-testing/misc/grant-tables.txt
[2] https://www.youtube.com/watch?v=IrlEdaIUDPk
[3] https://lore.kernel.org/xen-devel/1649963973-22879-1-git-send-email-olekstysh@gmail.com/
[4] https://lore.kernel.org/xen-devel/1649442065-8332-1-git-send-email-olekstysh@gmail.com/

Juergen Gross (2):
  xen/grants: support allocating consecutive grants
  xen/virtio: Add option to restrict memory access under Xen

Oleksandr Tyshchenko (4):
  arm/xen: Introduce xen_setup_dma_ops()
  dt-bindings: Add xen,dev-domid property description for xen-grant DMA
    ops
  xen/grant-dma-ops: Retrieve the ID of backend's domain for DT devices
  arm/xen: Assign xen-grant DMA ops for xen-grant DMA devices

 .../devicetree/bindings/arm/xen,dev-domid.yaml     |  37 +++
 arch/arm/include/asm/xen/xen-ops.h                 |   1 +
 arch/arm/mm/dma-mapping.c                          |   7 +-
 arch/arm/xen/enlighten.c                           |   8 +
 arch/arm64/include/asm/xen/xen-ops.h               |   1 +
 arch/arm64/mm/dma-mapping.c                        |   7 +-
 arch/x86/mm/init.c                                 |  11 +
 arch/x86/mm/mem_encrypt.c                          |   5 -
 drivers/xen/Kconfig                                |  15 +
 drivers/xen/Makefile                               |   1 +
 drivers/xen/grant-dma-ops.c                        | 328 +++++++++++++++++++++
 drivers/xen/grant-table.c                          | 238 +++++++++++++--
 include/xen/arm/xen-ops.h                          |  20 ++
 include/xen/grant_table.h                          |   4 +
 include/xen/xen-ops.h                              |  13 +
 include/xen/xen.h                                  |   5 +
 16 files changed, 654 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/xen,dev-domid.yaml
 create mode 100644 arch/arm/include/asm/xen/xen-ops.h
 create mode 100644 arch/arm64/include/asm/xen/xen-ops.h
 create mode 100644 drivers/xen/grant-dma-ops.c
 create mode 100644 include/xen/arm/xen-ops.h

-- 
2.7.4


