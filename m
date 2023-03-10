Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6EA6B4E34
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 18:14:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508541.783294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pagJo-0003zY-Kd; Fri, 10 Mar 2023 17:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508541.783294; Fri, 10 Mar 2023 17:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pagJo-0003yA-Gm; Fri, 10 Mar 2023 17:14:12 +0000
Received: by outflank-mailman (input) for mailman id 508541;
 Fri, 10 Mar 2023 17:14:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N78y=7C=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1pagJm-0003j4-MJ
 for xen-devel@lists.xenproject.org; Fri, 10 Mar 2023 17:14:10 +0000
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6d52e2a-bf66-11ed-87f5-c1b5be75604c;
 Fri, 10 Mar 2023 18:14:09 +0100 (CET)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 09:13:47 -0800
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 10 Mar 2023 09:13:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 4D6B0143; Fri, 10 Mar 2023 19:14:21 +0200 (EET)
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
X-Inumbo-ID: f6d52e2a-bf66-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678468449; x=1710004449;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RzCBUYiGCwAhlk2Ryilx5v//I3nq0USDpq2BpORLpGQ=;
  b=I2APb1KqA+G3+e1XPkj16RqOE10v74xeydCT/ScuC09eCIhgsDnQsu9t
   Vidnl9jeZXE+4iEz47m4BUL7i7hsCgkaGC5PB+lP3Z44/JgA00/HRxeBI
   H2G67XmisDxzAAvY5PdNX0pjulYg6NHc8caJn6DMIfhwea1Zv0q8/QY6K
   k9enGfuXQrO2d+Eo+97MYhGQjRyiHDxyNb9a9QTG5neIDNu3oa7n9zTb/
   cYPaYGTqS5V2Cg6Brth9HaxMGHuZY99/QGv+ooLaW/fpoq7blwUEH9AsG
   VON+tUw2oQkO63nKI5BBp4W5GP4dxLBEv7pdEMXlDQyPYM+s0bS/412bm
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="325132225"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="325132225"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="655250053"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="655250053"
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Randy Dunlap <rdunlap@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Helgaas <helgaas@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
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
Subject: [PATCH v4 0/4] PCI: Add pci_dev_for_each_resource() helper and update users
Date: Fri, 10 Mar 2023 19:14:12 +0200
Message-Id: <20230310171416.23356-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Provide two new helper macros to iterate over PCI device resources and
convert users.

Looking at it, refactor existing pci_bus_for_each_resource() and convert
users accordingly.

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

Andy Shevchenko (3):
  PCI: Split pci_bus_for_each_resource_p() out of
    pci_bus_for_each_resource()
  EISA: Convert to use pci_bus_for_each_resource_p()
  pcmcia: Convert to use pci_bus_for_each_resource_p()

Mika Westerberg (1):
  PCI: Introduce pci_dev_for_each_resource()

 .clang-format                             |  3 ++
 arch/alpha/kernel/pci.c                   |  5 ++-
 arch/arm/kernel/bios32.c                  | 16 +++++-----
 arch/arm/mach-dove/pcie.c                 | 10 +++---
 arch/arm/mach-mv78xx0/pcie.c              | 10 +++---
 arch/arm/mach-orion5x/pci.c               | 10 +++---
 arch/mips/pci/ops-bcm63xx.c               |  8 ++---
 arch/mips/pci/pci-legacy.c                |  3 +-
 arch/powerpc/kernel/pci-common.c          | 21 +++++++------
 arch/powerpc/platforms/4xx/pci.c          |  8 ++---
 arch/powerpc/platforms/52xx/mpc52xx_pci.c |  4 +--
 arch/powerpc/platforms/pseries/pci.c      | 16 +++++-----
 arch/sh/drivers/pci/pcie-sh7786.c         | 10 +++---
 arch/sparc/kernel/leon_pci.c              |  5 ++-
 arch/sparc/kernel/pci.c                   | 10 +++---
 arch/sparc/kernel/pcic.c                  |  5 ++-
 drivers/eisa/pci_eisa.c                   |  4 +--
 drivers/pci/bus.c                         |  7 ++---
 drivers/pci/hotplug/shpchp_sysfs.c        |  8 ++---
 drivers/pci/pci.c                         |  5 ++-
 drivers/pci/probe.c                       |  2 +-
 drivers/pci/remove.c                      |  5 ++-
 drivers/pci/setup-bus.c                   | 37 +++++++++--------------
 drivers/pci/setup-res.c                   |  4 +--
 drivers/pci/vgaarb.c                      | 17 +++--------
 drivers/pci/xen-pcifront.c                |  4 +--
 drivers/pcmcia/rsrc_nonstatic.c           |  9 ++----
 drivers/pcmcia/yenta_socket.c             |  3 +-
 drivers/pnp/quirks.c                      | 29 ++++++------------
 include/linux/pci.h                       | 26 +++++++++++++---
 30 files changed, 141 insertions(+), 163 deletions(-)

-- 
2.39.1


