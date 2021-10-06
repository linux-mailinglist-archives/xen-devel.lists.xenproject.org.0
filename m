Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC2A4244D1
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 19:41:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202981.358011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYAuT-00044u-D6; Wed, 06 Oct 2021 17:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202981.358011; Wed, 06 Oct 2021 17:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYAuT-000435-9p; Wed, 06 Oct 2021 17:40:53 +0000
Received: by outflank-mailman (input) for mailman id 202981;
 Wed, 06 Oct 2021 17:40:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=13oh=O2=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mYAuS-00042x-Az
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 17:40:52 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 32e07ecb-0541-423f-a8a6-52ffe5aae1f2;
 Wed, 06 Oct 2021 17:40:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBBCD6D;
 Wed,  6 Oct 2021 10:40:49 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 95D793F70D;
 Wed,  6 Oct 2021 10:40:47 -0700 (PDT)
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
X-Inumbo-ID: 32e07ecb-0541-423f-a8a6-52ffe5aae1f2
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andre.Przywara@arm.com,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Paul Durrant <paul@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v5 00/11] PCI devices passthrough on Arm
Date: Wed,  6 Oct 2021 18:40:26 +0100
Message-Id: <cover.1633540842.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello All,

The purpose of this patch series is to add PCI passthrough support to Xen on
Arm. PCI passthrough support on ARM is the collaboration work between EPAM and
ARM. ARM submitted the partial RFC [1][2] last year to get early feedback. We
tried to fix all the comments and added more features to this patch series.

Working POC with all the features can be found at [3]. Working POC is tested
on x86 so that there will be no regression on x86. Design presentation can be
found at [4]

PCI passthrough support is divided into different patches. This patch series
includes following features: 

Preparatory work to implement the PCI passthrough support for the ARM:
- Refactor MSI code.
- Fixed compilation error when HAS_PCI enabled for ARM.

Discovering PCI Host Bridge in XEN:
- PCI init to initialize the PCI driver.
- PCI host bridge discovery in XEN and map the PCI ECAM configuration space to
  the XEN memory.
- PCI access functions.

Discovering PCI devices:
- To support the PCI passthrough, XEN should be aware of the PCI
  devices.
- Hardware domain is in charge of doing the PCI enumeration and will discover
  the PCI devices and then communicate to the XEN via a hypercall to add the
  PCI devices in XEN.

Enable the existing x86 virtual PCI support for ARM:
- Add VPCI trap handler for each of the PCI device added for config space
  access.
- Register the trap handler in XEN for each of the host bridge PCI ECAM config
  space access.

Emulated PCI device tree node in libxl:
- Create a virtual PCI device tree node in libxl to enable the guest OS to
  discover the virtual PCI during guest boot.

This patch series does not inlcude the following features. Following features
will be send for review in the next version of the patch series once initial
patch series merged.

- VPCI support for DOMU guests (Non-identity mappings guest view of the BARs)
- Virtual bus topology implementation
- IOMMU related changes (generic, SMMUv2, SMMUv3)
- MSI support for DOMU guests.
- Virual ITS support for DOMU guests

[1] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg01184.html
[2] https://lists.xenproject.org/archives/html/xen-devel/2020-07/threads.html#01184
[3] https://gitlab.com/rahsingh/xen-integration/-/tree/arm_pci_v4_integrate
[4] https://static.sched.com/hosted_files/xen2021/e4/PCI_Device_Passthrough_On_Arm.pdf

Oleksandr Andrushchenko (1):
  xen/arm: Add support for Xilinx ZynqMP PCI host controller

Rahul Singh (10):
  xen/arm: xc_domain_ioport_permission(..) not supported on ARM.
  xen/arm: Add PHYSDEVOP_pci_device_(*add/remove) support for ARM
  xen/arm: Add cmdline boot option "pci-passthrough = <boolean>"
  xen/arm: PCI host bridge discovery within XEN on ARM
  xen/arm: Implement pci access functions
  xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
  xen/arm: Enable the existing x86 virtual PCI support for ARM.
  xen/arm: Transitional change to build HAS_VPCI on ARM.
  arm/libxl: Emulated PCI device tree node in libxl
  xen/arm: Add linux,pci-domain property for hwdom if not available.

 docs/misc/xen-command-line.pandoc   |   7 +
 tools/include/libxl.h               |   6 +
 tools/libs/ctrl/xc_domain.c         |   9 +
 tools/libs/light/libxl_arm.c        | 111 +++++++++++
 tools/libs/light/libxl_types.idl    |   1 +
 tools/ocaml/libs/xc/xenctrl.ml      |   1 +
 tools/ocaml/libs/xc/xenctrl.mli     |   1 +
 xen/arch/arm/Makefile               |   1 +
 xen/arch/arm/domain.c               |   8 +-
 xen/arch/arm/domain_build.c         |  19 ++
 xen/arch/arm/pci/Makefile           |   5 +
 xen/arch/arm/pci/ecam.c             |  61 ++++++
 xen/arch/arm/pci/pci-access.c       | 140 ++++++++++++++
 xen/arch/arm/pci/pci-host-common.c  | 287 ++++++++++++++++++++++++++++
 xen/arch/arm/pci/pci-host-generic.c |  48 +++++
 xen/arch/arm/pci/pci-host-zynqmp.c  |  65 +++++++
 xen/arch/arm/pci/pci.c              |  12 ++
 xen/arch/arm/physdev.c              |   6 +-
 xen/arch/arm/vpci.c                 | 102 ++++++++++
 xen/arch/arm/vpci.h                 |  36 ++++
 xen/arch/x86/domain.c               |   6 +
 xen/arch/x86/physdev.c              |  52 +----
 xen/arch/x86/x86_64/physdev.c       |   2 +-
 xen/common/domain.c                 |   2 +-
 xen/drivers/passthrough/pci.c       |  18 ++
 xen/drivers/pci/Makefile            |   1 +
 xen/drivers/pci/physdev.c           |  86 +++++++++
 xen/drivers/vpci/Makefile           |   3 +-
 xen/drivers/vpci/header.c           |   2 +
 xen/include/asm-arm/domain.h        |   7 +-
 xen/include/asm-arm/pci.h           |  85 ++++++++
 xen/include/asm-x86/pci.h           |   8 +-
 xen/include/public/arch-arm.h       |  21 +-
 xen/include/public/domctl.h         |   4 +-
 xen/include/xen/hypercall.h         |   4 +
 xen/include/xen/pci.h               |   2 +
 36 files changed, 1168 insertions(+), 61 deletions(-)
 create mode 100644 xen/arch/arm/pci/ecam.c
 create mode 100644 xen/arch/arm/pci/pci-access.c
 create mode 100644 xen/arch/arm/pci/pci-host-common.c
 create mode 100644 xen/arch/arm/pci/pci-host-generic.c
 create mode 100644 xen/arch/arm/pci/pci-host-zynqmp.c
 create mode 100644 xen/arch/arm/vpci.c
 create mode 100644 xen/arch/arm/vpci.h
 create mode 100644 xen/drivers/pci/physdev.c

-- 
2.25.1


