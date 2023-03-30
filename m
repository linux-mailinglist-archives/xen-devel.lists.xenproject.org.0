Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D516D0B26
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 18:28:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516801.801508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phv8X-0003sb-2T; Thu, 30 Mar 2023 16:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516801.801508; Thu, 30 Mar 2023 16:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phv8W-0003qG-Vr; Thu, 30 Mar 2023 16:28:28 +0000
Received: by outflank-mailman (input) for mailman id 516801;
 Thu, 30 Mar 2023 16:28:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3PO=7W=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1phv8V-0003qA-AP
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 16:28:27 +0000
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e343b9e2-cf17-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 18:28:24 +0200 (CEST)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 09:28:21 -0700
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga005.jf.intel.com with ESMTP; 30 Mar 2023 09:28:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 9DDDB13A; Thu, 30 Mar 2023 19:24:42 +0300 (EEST)
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
X-Inumbo-ID: e343b9e2-cf17-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680193704; x=1711729704;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+jsYsz3z4S0KxQURpz+5dUW16i3yUqiq6XHaWQFPwWw=;
  b=mivwcMf9HOkCM7eXDBH8b6cc89f4ST2N1Ame/dD36aFowxQeQhlKlXC6
   Zj7vJ7BNaweDmG1J+2oLvtje0RkLJWis7CRZtUV0Ua0gAs252pa39tIHb
   SEIgiOAF9VwGeh7VMu6m1CqwOxl93lLi+O+HO0GjZ0H2dnxW7EigkdgzW
   bvaSkloC2KP6XXnOT0qsfs/Xsqf62vHaSR2gqfictN35IBek/e49gYXQw
   dHUiJRgimxKDUuoLxmHS58IB9b94ocgWy4mze+l0OpVbYzDgBh7QrHSCU
   iSrZlqTndD9aa8SJZLUo8qjI5Me343+7OxeBB+YFoxk4UGTboxNPAJto0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="427495924"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="427495924"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="858971536"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="858971536"
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Randy Dunlap <rdunlap@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
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
Subject: [PATCH v8 0/7] Add pci_dev_for_each_resource() helper and update users
Date: Thu, 30 Mar 2023 19:24:27 +0300
Message-Id: <20230330162434.35055-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Provide two new helper macros to iterate over PCI device resources and
convert users.

Looking at it, refactor existing pci_bus_for_each_resource() and convert
users accordingly.

Note, the amount of lines grew due to the documentation update.

Changelog v8:
- fixed issue with pci_bus_for_each_resource() macro (LKP)
- due to above added a new patch to document how it works
- moved the last patch to be #2 (Philippe)
- added tags (Philippe)

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

Andy Shevchenko (6):
  kernel.h: Split out COUNT_ARGS() and CONCATENATE()
  PCI: Introduce pci_resource_n()
  PCI: Document pci_bus_for_each_resource() to avoid confusion
  PCI: Allow pci_bus_for_each_resource() to take less arguments
  EISA: Convert to use less arguments in pci_bus_for_each_resource()
  pcmcia: Convert to use less arguments in pci_bus_for_each_resource()

Mika Westerberg (1):
  PCI: Introduce pci_dev_for_each_resource()

 .clang-format                             |  1 +
 arch/alpha/kernel/pci.c                   |  5 +-
 arch/arm/kernel/bios32.c                  | 16 +++--
 arch/arm/mach-dove/pcie.c                 | 10 ++--
 arch/arm/mach-mv78xx0/pcie.c              | 10 ++--
 arch/arm/mach-orion5x/pci.c               | 10 ++--
 arch/mips/pci/ops-bcm63xx.c               |  8 +--
 arch/mips/pci/pci-legacy.c                |  3 +-
 arch/powerpc/kernel/pci-common.c          | 21 +++----
 arch/powerpc/platforms/4xx/pci.c          |  8 +--
 arch/powerpc/platforms/52xx/mpc52xx_pci.c |  5 +-
 arch/powerpc/platforms/pseries/pci.c      | 16 ++---
 arch/sh/drivers/pci/pcie-sh7786.c         | 10 ++--
 arch/sparc/kernel/leon_pci.c              |  5 +-
 arch/sparc/kernel/pci.c                   | 10 ++--
 arch/sparc/kernel/pcic.c                  |  5 +-
 drivers/eisa/pci_eisa.c                   |  4 +-
 drivers/pci/bus.c                         |  7 +--
 drivers/pci/hotplug/shpchp_sysfs.c        |  8 +--
 drivers/pci/pci.c                         |  3 +-
 drivers/pci/probe.c                       |  2 +-
 drivers/pci/remove.c                      |  5 +-
 drivers/pci/setup-bus.c                   | 37 +++++-------
 drivers/pci/setup-res.c                   |  4 +-
 drivers/pci/vgaarb.c                      | 17 ++----
 drivers/pci/xen-pcifront.c                |  4 +-
 drivers/pcmcia/rsrc_nonstatic.c           |  9 +--
 drivers/pcmcia/yenta_socket.c             |  3 +-
 drivers/pnp/quirks.c                      | 29 ++++-----
 include/linux/args.h                      | 13 ++++
 include/linux/kernel.h                    |  8 +--
 include/linux/pci.h                       | 72 +++++++++++++++++++----
 32 files changed, 190 insertions(+), 178 deletions(-)
 create mode 100644 include/linux/args.h

-- 
2.40.0.1.gaa8946217a0b


