Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9151842F8C1
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 18:52:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210924.367956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbQR8-00053X-AL; Fri, 15 Oct 2021 16:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210924.367956; Fri, 15 Oct 2021 16:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbQR8-00050l-73; Fri, 15 Oct 2021 16:52:02 +0000
Received: by outflank-mailman (input) for mailman id 210924;
 Fri, 15 Oct 2021 16:52:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqmt=PD=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1mbQR6-00050f-TU
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 16:52:00 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 36fea98c-2dd8-11ec-8248-12813bfff9fa;
 Fri, 15 Oct 2021 16:52:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D04E111D4;
 Fri, 15 Oct 2021 09:51:59 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E7A53F70D;
 Fri, 15 Oct 2021 09:51:58 -0700 (PDT)
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
X-Inumbo-ID: 36fea98c-2dd8-11ec-8248-12813bfff9fa
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	sstabellini@kernel.org,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v8 0/5] PCI devices passthrough on Arm
Date: Fri, 15 Oct 2021 17:51:40 +0100
Message-Id: <cover.1634315461.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello All,

This serie is a follow up on Rahul serie where we included various fixes
required after review on the mailing list and a new patch to move some
of the x86 ecam related code to the common vpci code.

Most of the patches of the original serie have been merged and this
serie includes only 2 of the original patches reworked and 3 new patches:

Move some ECAM related functions from x86 to generic vpci
implementation:
- move vcpi mmcfg_{read/write} and vpci_access_allowed to common vpci.c.
- use ecam instead of mmcfg in common code.

Enable the existing x86 virtual PCI support for ARM:
- Add VPCI trap handler for each of the PCI device added for config
  space access.
- Register the trap handler in XEN for each of the host bridge PCI ECAM
  config space access.

Modify libxl function to take the whole domain config as argument:
- libxl__arch_domain_init_hw_description
- libxl__prepare_dt

Emulated PCI device tree node in libxl:
- Create a virtual PCI device tree node in libxl to enable the guest OS
  to discover the virtual PCI during guest boot.

The patch modifying xc_domain_ioport_permission has been removed from
the serie.

Bertrand Marquis (1):
  xen/vpci: Move ecam access functions to common code

Michal Orzel (2):
  tools/libxl: Modify libxl__arch_domain_init_hw_description...
  tools/libxl_arm: Modify libxl__prepare_dtb...

Rahul Singh (2):
  xen/arm: Enable the existing x86 virtual PCI support for ARM
  arm/libxl: Emulated PCI device tree node in libxl

 tools/libs/light/libxl_arch.h   |   2 +-
 tools/libs/light/libxl_arm.c    | 111 +++++++++++++++++++++++++++++++-
 tools/libs/light/libxl_create.c |   5 ++
 tools/libs/light/libxl_dom.c    |   2 +-
 tools/libs/light/libxl_x86.c    |   2 +-
 xen/arch/arm/Makefile           |   1 +
 xen/arch/arm/domain.c           |   4 ++
 xen/arch/arm/vpci.c             |  77 ++++++++++++++++++++++
 xen/arch/arm/vpci.h             |  36 +++++++++++
 xen/arch/x86/hvm/io.c           |  46 ++-----------
 xen/drivers/passthrough/pci.c   |  13 ++++
 xen/drivers/vpci/header.c       |   2 +-
 xen/drivers/vpci/vpci.c         |  64 ++++++++++++++++++
 xen/include/asm-arm/domain.h    |   1 +
 xen/include/asm-x86/pci.h       |   2 -
 xen/include/public/arch-arm.h   |  17 +++++
 xen/include/xen/pci.h           |   2 +
 xen/include/xen/vpci.h          |  12 ++++
 18 files changed, 349 insertions(+), 50 deletions(-)
 create mode 100644 xen/arch/arm/vpci.c
 create mode 100644 xen/arch/arm/vpci.h

-- 
2.25.1


