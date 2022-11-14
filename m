Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A596288BF
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 19:58:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443516.698087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oueeu-0005AB-Om; Mon, 14 Nov 2022 18:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443516.698087; Mon, 14 Nov 2022 18:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oueeu-00054t-IQ; Mon, 14 Nov 2022 18:58:16 +0000
Received: by outflank-mailman (input) for mailman id 443516;
 Mon, 14 Nov 2022 18:58:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pr3k=3O=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1oueet-0004uP-3M
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 18:58:15 +0000
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a60fd36-644e-11ed-8fd2-01056ac49cbb;
 Mon, 14 Nov 2022 19:58:14 +0100 (CET)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 10:58:09 -0800
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 14 Nov 2022 10:58:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id BAA212F3; Mon, 14 Nov 2022 20:58:24 +0200 (EET)
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
X-Inumbo-ID: 4a60fd36-644e-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668452294; x=1699988294;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=x6ggnXnghcO12tbT4wtQfhiqCsVpusNaj/2IGyQVVxI=;
  b=IM10jECloPmVSCbg7ParEby9o0yD3PknIZd/mY/nBkVE/4iDjQDjG2ov
   WBuML95fIkQcTEj83ZfUoiI3FDY1twhNlq/OoC3xwiVZ4pRcwLvlvy9n/
   XmGd9dvL2Q/sDUXNR5lz/4mo6HWO1ElC3kMqJ25ZX3aqmGcNSGq/c74Yh
   7QceVieRoAy8bxS8wo+bt7Si9rn8pPeyaDyd11tW12VUxXN4hS6t6L7GO
   Dl+47Oyj547YnXho76kowMVPjhZ8Stv0rEM9gkcgNpWJb4KsmoBAO+64R
   oQ0E31rLisMGbDFMBPtIbIpKaJubFMG70gAOF66LQBBClYOFUBTDAyd8d
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="295416003"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="295416003"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="638607285"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="638607285"
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Helgaas <helgaas@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-pci@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH v3 0/4] PCI: Add pci_dev_for_each_resource() helper and
Date: Mon, 14 Nov 2022 20:58:18 +0200
Message-Id: <20221114185822.65038-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide two new helper macros to iterate over PCI device resources and
convert users.

Looking at it, refactor existing pci_bus_for_each_resource() and convert
users accordingly.

This applies on top of this patch Mika sent out earlier:
https://lore.kernel.org/r/20221114115953.40236-1-mika.westerberg@linux.intel.com

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

 .clang-format                      |  3 +++
 arch/alpha/kernel/pci.c            |  5 ++---
 arch/arm/kernel/bios32.c           | 16 ++++++-------
 arch/mips/pci/pci-legacy.c         |  3 +--
 arch/powerpc/kernel/pci-common.c   |  5 ++---
 arch/sparc/kernel/leon_pci.c       |  5 ++---
 arch/sparc/kernel/pci.c            | 10 ++++-----
 arch/sparc/kernel/pcic.c           |  5 ++---
 drivers/eisa/pci_eisa.c            |  4 ++--
 drivers/pci/bus.c                  |  7 +++---
 drivers/pci/hotplug/shpchp_sysfs.c |  8 +++----
 drivers/pci/pci.c                  |  5 ++---
 drivers/pci/probe.c                |  2 +-
 drivers/pci/remove.c               |  5 ++---
 drivers/pci/setup-bus.c            | 36 ++++++++++++------------------
 drivers/pci/setup-res.c            |  4 +---
 drivers/pci/xen-pcifront.c         |  4 +---
 drivers/pcmcia/rsrc_nonstatic.c    |  9 +++-----
 drivers/pcmcia/yenta_socket.c      |  3 +--
 include/linux/pci.h                | 25 +++++++++++++++++----
 20 files changed, 78 insertions(+), 86 deletions(-)

-- 
2.35.1


