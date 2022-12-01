Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4D163F4B3
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:03:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450903.708421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m1g-0000E9-PA; Thu, 01 Dec 2022 16:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450903.708421; Thu, 01 Dec 2022 16:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m1g-0000BA-Kv; Thu, 01 Dec 2022 16:03:04 +0000
Received: by outflank-mailman (input) for mailman id 450903;
 Thu, 01 Dec 2022 16:03:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ShmB=37=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1p0m1f-0008HE-1w
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:03:03 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a0bdf955-7191-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 17:03:01 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23E35D6E;
 Thu,  1 Dec 2022 08:03:06 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7FD93F67D;
 Thu,  1 Dec 2022 08:02:57 -0800 (PST)
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
X-Inumbo-ID: a0bdf955-7191-11ed-91b6-6bf2151ebd3b
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [RFC PATCH 00/21] Add SMMUv3 Stage 1 Support for XEN guests
Date: Thu,  1 Dec 2022 16:02:24 +0000
Message-Id: <cover.1669888522.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The SMMUv3 supports two stages of translation. Each stage of translation can be
independently enabled. An incoming address is logically translated from VA to
IPA in stage 1, then the IPA is input to stage 2 which translates the IPA to
the output PA.

Stage 1 is intended to be used by a software entity to provide isolation or
translation to buffers within the entity, for example DMA isolation within an
OS. Stage 2 is intended to be available in systems supporting the
Virtualization Extensions and is intended to virtualize device DMA to guest VM
address spaces. When both stage 1 and stage 2 are enabled, the translation
configuration is called nested.

Stage 1 translation support is required to provide isolation between different
devices within OS. XEN already supports Stage 2 translation but there is no
support for Stage 1 translation. The goal of this work is to support Stage 1
translation for XEN guests. Stage 1 has to be configured within the guest to
provide isolation.

We cannot trust the guest OS to control the SMMUv3 hardware directly as
compromised guest OS can corrupt the SMMUv3 configuration and make the system
vulnerable. The guest gets the ownership of the stage 1 page tables and also
owns stage 1 configuration structures. The XEN handles the root configuration
structure (for security reasons), including the stage 2 configuration.

XEN will emulate the SMMUv3 hardware and exposes the virtual SMMUv3 to the
guest. Guest can use the native SMMUv3 driver to configure the stage 1
translation. When the guest configures the SMMUv3 for Stage 1, XEN will trap
the access and configure hardware.

SMMUv3 Driver(Guest OS) -> Configure the Stage-1 translation ->
XEN trap access -> XEN SMMUv3 driver configure the HW.

SMMUv3 driver has to be updated to support the Stage-1 translation support
based on work done by the KVM team to support Nested Stage translation:
https://github.com/eauger/linux/commits/v5.11-stallv12-2stage-v14
https://lwn.net/Articles/852299/

As the stage 1 translation is configured by XEN on behalf of the guest,
translation faults encountered during the translation process need to be
propagated up to the guest and re-injected into the guest. When the guest
invalidates stage 1 related caches, invalidations must be forwarded to the
SMMUv3 hardware.

This patch series is sent as RFC to get the initial feedback from the
community. This patch series consists of 21 patches which is a big number for
the reviewer to review the patches but to understand the feature end-to-end we
thought of sending this as a big series. Once we will get initial feedback, we
will divide the series into a small number of patches for review.

Jean-Philippe Brucker (1):
  xen/arm: smmuv3: Maintain a SID->device structure

Rahul Singh (20):
  xen/arm: smmuv3: Add support for stage-1 and nested stage translation
  xen/arm: smmuv3: Alloc io_domain for each device
  xen/arm: vIOMMU: add generic vIOMMU framework
  xen/arm: vsmmuv3: Add dummy support for virtual SMMUv3 for guests
  xen/domctl: Add XEN_DOMCTL_CONFIG_VIOMMU_* and viommu config param
  xen/arm: vIOMMU: Add cmdline boot option "viommu = <boolean>"
  xen/arm: vsmmuv3: Add support for registers emulation
  xen/arm: vsmmuv3: Add support for cmdqueue handling
  xen/arm: vsmmuv3: Add support for command CMD_CFGI_STE
  xen/arm: vsmmuv3: Attach Stage-1 configuration to SMMUv3 hardware
  xen/arm: vsmmuv3: Add support for event queue and global error
  xen/arm: vsmmuv3: Add "iommus" property node for dom0 devices
  xen/arm: vIOMMU: IOMMU device tree node for dom0
  xen/arm: vsmmuv3: Emulated SMMUv3 device tree node for dom0less
  arm/libxl: vsmmuv3: Emulated SMMUv3 device tree node in libxl
  xen/arm: vsmmuv3: Alloc virq for virtual SMMUv3
  xen/arm: iommu: skip the iommu-map property for PCI devices
  xen/arm: vsmmuv3: Add support to send stage-1 event to guest
  libxl/arm: vIOMMU: Modify the partial device tree for iommus
  xen/arm: vIOMMU: Modify the partial device tree for dom0less

 docs/man/xl.cfg.5.pod.in               |  11 +
 docs/misc/xen-command-line.pandoc      |   7 +
 tools/golang/xenlight/helpers.gen.go   |   2 +
 tools/golang/xenlight/types.gen.go     |   1 +
 tools/include/libxl.h                  |   5 +
 tools/libs/light/libxl_arm.c           | 121 +++-
 tools/libs/light/libxl_types.idl       |   6 +
 tools/xl/xl_parse.c                    |   9 +
 xen/arch/arm/domain.c                  |  18 +
 xen/arch/arm/domain_build.c            | 213 +++++-
 xen/arch/arm/include/asm/domain.h      |   4 +
 xen/arch/arm/include/asm/viommu.h      | 102 +++
 xen/drivers/passthrough/Kconfig        |  14 +
 xen/drivers/passthrough/arm/Makefile   |   2 +
 xen/drivers/passthrough/arm/smmu-v3.c  | 370 +++++++++--
 xen/drivers/passthrough/arm/smmu-v3.h  |  43 +-
 xen/drivers/passthrough/arm/viommu.c   |  87 +++
 xen/drivers/passthrough/arm/vsmmu-v3.c | 887 +++++++++++++++++++++++++
 xen/drivers/passthrough/arm/vsmmu-v3.h |  32 +
 xen/include/public/arch-arm.h          |  14 +-
 xen/include/public/device_tree_defs.h  |   1 +
 xen/include/xen/iommu.h                |  14 +
 22 files changed, 1913 insertions(+), 50 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/viommu.h
 create mode 100644 xen/drivers/passthrough/arm/viommu.c
 create mode 100644 xen/drivers/passthrough/arm/vsmmu-v3.c
 create mode 100644 xen/drivers/passthrough/arm/vsmmu-v3.h

--
2.25.1


