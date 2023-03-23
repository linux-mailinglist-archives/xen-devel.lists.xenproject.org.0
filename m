Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA536C6F36
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 18:36:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514003.795891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfOr2-0001R7-Cc; Thu, 23 Mar 2023 17:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514003.795891; Thu, 23 Mar 2023 17:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfOr2-0001OP-9C; Thu, 23 Mar 2023 17:36:00 +0000
Received: by outflank-mailman (input) for mailman id 514003;
 Thu, 23 Mar 2023 17:35:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JuTy=7P=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1pfOr0-0000iP-Rr
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 17:35:58 +0000
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2968e8cc-c9a1-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 18:35:56 +0100 (CET)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 10:35:35 -0700
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 23 Mar 2023 10:35:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id A30B5176; Thu, 23 Mar 2023 19:36:11 +0200 (EET)
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
X-Inumbo-ID: 2968e8cc-c9a1-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679592956; x=1711128956;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=40PiIYrpY37wYxSvYhyAFvVxdYaZvy3f8Dv2ifvyB0g=;
  b=TzZGocHurYcgfVCxo+ekgnql7MhPnW0QZzbYf9GbrVoXO+VMzZdWCu3t
   saw4vHxijyjZbt4uagLkFND1994Dmx4kRex4xpeHDk5yOHfHusgWPiJZ0
   Z2C1gYXhJypk71G13CYZPwrepYiXBtLa08IHbSxlM+lA48gCYT/4u5iS3
   NihbFUfGBtj5eFokJNxCiV3G4InH0tLu7hNMx595kmquQiucTmhyxt5Dv
   4XQuhRosfRYypiDdsdP55STQwQkfltCRWyeMq8JN+LF3NlBehcgGbGXno
   UObeLXNonwR9LLs7UkApL3n5kCEoU2ZHxvseSR7XIuknSekC4RX63MqSJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="367307984"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="367307984"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="682380740"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="682380740"
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Randy Dunlap <rdunlap@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Juergen Gross <jgross@suse.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-pci@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Anatolij Gustschin <agust@denx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH v7 0/6] Add pci_dev_for_each_resource() helper and update users
Date: Thu, 23 Mar 2023 19:36:04 +0200
Message-Id: <20230323173610.60442-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Provide two new helper macros to iterate over PCI device resources and
convert users.

Looking at it, refactor existing pci_bus_for_each_resource() and convert
users accordingly.

Changelog v7:
- made both macros to share same name (Bjorn)
- split out the pci_resource_n() conversion (Bjorn)

Changelog v6:
- dropped unused variable in PPC code (LKP)

Changelog v5:
- renamed loop variable to minimize the clash (Keith)
- addressed smatch warning (Dan)
- addressed 0-day bot findings (LKP)

Changelog v4:
- rebased on top of v6.3-rc1
- added tag (Krzysztof)

Changelog v3:
- rebased on top of v2 by Mika, see above
- added tag to pcmcia patch (Dominik)

Changelog v2:
- refactor to have two macros
- refactor existing pci_bus_for_each_resource() in the same way and
  convert users

Andy Shevchenko (5):
  kernel.h: Split out COUNT_ARGS() and CONCATENATE()
  PCI: Allow pci_bus_for_each_resource() to take less arguments
  EISA: Convert to use less arguments in pci_bus_for_each_resource()
  pcmcia: Convert to use less arguments in pci_bus_for_each_resource()
  PCI: Make use of pci_resource_n()

Mika Westerberg (1):
  PCI: Introduce pci_dev_for_each_resource()

 .clang-format                             |  1 +
 arch/alpha/kernel/pci.c                   |  5 +--
 arch/arm/kernel/bios32.c                  | 16 ++++----
 arch/arm/mach-dove/pcie.c                 | 10 ++---
 arch/arm/mach-mv78xx0/pcie.c              | 10 ++---
 arch/arm/mach-orion5x/pci.c               | 10 ++---
 arch/mips/pci/ops-bcm63xx.c               |  8 ++--
 arch/mips/pci/pci-legacy.c                |  3 +-
 arch/powerpc/kernel/pci-common.c          | 21 +++++-----
 arch/powerpc/platforms/4xx/pci.c          |  8 ++--
 arch/powerpc/platforms/52xx/mpc52xx_pci.c |  5 +--
 arch/powerpc/platforms/pseries/pci.c      | 16 ++++----
 arch/sh/drivers/pci/pcie-sh7786.c         | 10 ++---
 arch/sparc/kernel/leon_pci.c              |  5 +--
 arch/sparc/kernel/pci.c                   | 10 ++---
 arch/sparc/kernel/pcic.c                  |  5 +--
 drivers/eisa/pci_eisa.c                   |  4 +-
 drivers/pci/bus.c                         |  7 ++--
 drivers/pci/hotplug/shpchp_sysfs.c        |  8 ++--
 drivers/pci/pci.c                         |  3 +-
 drivers/pci/probe.c                       |  2 +-
 drivers/pci/remove.c                      |  5 +--
 drivers/pci/setup-bus.c                   | 37 +++++++-----------
 drivers/pci/setup-res.c                   |  4 +-
 drivers/pci/vgaarb.c                      | 17 +++-----
 drivers/pci/xen-pcifront.c                |  4 +-
 drivers/pcmcia/rsrc_nonstatic.c           |  9 ++---
 drivers/pcmcia/yenta_socket.c             |  3 +-
 drivers/pnp/quirks.c                      | 29 +++++---------
 include/linux/args.h                      | 13 +++++++
 include/linux/kernel.h                    |  8 +---
 include/linux/pci.h                       | 47 +++++++++++++++++------
 32 files changed, 165 insertions(+), 178 deletions(-)
 create mode 100644 include/linux/args.h

-- 
2.40.0.1.gaa8946217a0b


