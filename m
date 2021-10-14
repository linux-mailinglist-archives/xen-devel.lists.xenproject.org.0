Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED0542DC06
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 16:50:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209433.365893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb23g-0005bE-By; Thu, 14 Oct 2021 14:50:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209433.365893; Thu, 14 Oct 2021 14:50:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb23g-0005YK-8w; Thu, 14 Oct 2021 14:50:12 +0000
Received: by outflank-mailman (input) for mailman id 209433;
 Thu, 14 Oct 2021 14:50:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iCUr=PC=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1mb23e-0005YC-Ju
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 14:50:10 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5268b51a-28d4-418a-a4ee-cd0b07e9521b;
 Thu, 14 Oct 2021 14:50:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5889D6E;
 Thu, 14 Oct 2021 07:50:08 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 225A23F694;
 Thu, 14 Oct 2021 07:50:07 -0700 (PDT)
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
X-Inumbo-ID: 5268b51a-28d4-418a-a4ee-cd0b07e9521b
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 0/3] PCI devices passthrough on Arm
Date: Thu, 14 Oct 2021 15:49:48 +0100
Message-Id: <cover.1634221830.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello All,

This serie is a follow up on Rahul serie where we included various fixes
required after review on the mailing list and a new patch to move some
of the x86 ecam related code to the common vpci code.

Most of the patches of the original serie have been merged and this
serie includes only 2 of the original patches reworked and 1 new patch:

Move some ECAM related functions from x86 to generic vpci
implementation:
- move vcpi mmcfg_{read/write} and vpci_access_allowed to common vpci.c.
- use ecam instead of mmcfg in common code.

Enable the existing x86 virtual PCI support for ARM:
- Add VPCI trap handler for each of the PCI device added for config
  space access.
- Register the trap handler in XEN for each of the host bridge PCI ECAM
  config space access.

Emulated PCI device tree node in libxl:
- Create a virtual PCI device tree node in libxl to enable the guest OS
  to discover the virtual PCI during guest boot.

The patch modifying xc_domain_ioport_permission has been removed from
the serie.

Bertrand Marquis (1):
  xen/vpci: Move ecam access functions to common code

Rahul Singh (2):
  xen/arm: Enable the existing x86 virtual PCI support for ARM.
  arm/libxl: Emulated PCI device tree node in libxl

 tools/libs/light/libxl_arm.c     | 105 +++++++++++++++++++++++++++++++
 tools/libs/light/libxl_types.idl |   1 +
 xen/arch/arm/Makefile            |   1 +
 xen/arch/arm/domain.c            |   4 ++
 xen/arch/arm/vpci.c              |  74 ++++++++++++++++++++++
 xen/arch/arm/vpci.h              |  36 +++++++++++
 xen/arch/x86/hvm/io.c            |  50 +++------------
 xen/drivers/passthrough/pci.c    |  18 +++++-
 xen/drivers/vpci/header.c        |   3 +-
 xen/drivers/vpci/vpci.c          |  60 ++++++++++++++++++
 xen/include/asm-arm/domain.h     |   1 +
 xen/include/asm-x86/pci.h        |   2 -
 xen/include/public/arch-arm.h    |  17 +++++
 xen/include/xen/pci.h            |   3 +
 xen/include/xen/vpci.h           |  10 +++
 15 files changed, 338 insertions(+), 47 deletions(-)
 create mode 100644 xen/arch/arm/vpci.c
 create mode 100644 xen/arch/arm/vpci.h

-- 
2.25.1


