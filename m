Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6814A6B9F91
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 20:26:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509806.786323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcAHn-0004bP-Ng; Tue, 14 Mar 2023 19:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509806.786323; Tue, 14 Mar 2023 19:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcAHn-0004Zg-KW; Tue, 14 Mar 2023 19:26:15 +0000
Received: by outflank-mailman (input) for mailman id 509806;
 Tue, 14 Mar 2023 19:26:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oTSp=7G=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1pcAHl-0004ZR-Eb
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 19:26:13 +0000
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f64122c-c29e-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 20:26:05 +0100 (CET)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 12:26:02 -0700
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2023 12:25:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 77DF1163; Tue, 14 Mar 2023 21:26:37 +0200 (EET)
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
X-Inumbo-ID: 0f64122c-c29e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678821965; x=1710357965;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=o5wvjgss3WToenPFVgKISR2zGwGV5RepaqjvWSlSslQ=;
  b=l1ViJyeeFrHs3hJRJlxZA3XoxM0ogfTnMZ6zx1q6h6l8pUo8F6OxKGv+
   KW1drOqCGJ2jmtvTpMwUTBPFNPU04Alc3IMImBjT7La7zexT1g8zRr3+w
   rhb/tsspuHbxvBJ3nYv02Qoh/cLjRPbr+T0qho7Iyve1mFhMVw22JLyIq
   /wObCEz0xDESRlJKLl626EiyI/r7+muFiGMbs/ile+AEMB9QNOoLcvmKv
   ON2Y911xbJcihpIxAfvKITceC77NH/Ja/XW3uj/Hsy2fR9wL/Mp68r/4T
   iZj6CqnyyNrV+WRtP3+4xindlaNfkSVq03i2//Fsg0sYHfHGunYvTWBA1
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="321369006"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="321369006"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="822495607"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="822495607"
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Subject: [PATCH v5 0/4] PCI: Add pci_dev_for_each_resource() helper and update users
Date: Tue, 14 Mar 2023 21:26:30 +0200
Message-Id: <20230314192634.63531-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Provide two new helper macros to iterate over PCI device resources and
convert users.

Looking at it, refactor existing pci_bus_for_each_resource() and convert
users accordingly.

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
 include/linux/pci.h                       | 29 ++++++++++++++----
 30 files changed, 142 insertions(+), 165 deletions(-)

-- 
2.39.2


