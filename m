Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA65C61850D
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 17:46:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436893.691093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqdMa-0001nr-Cc; Thu, 03 Nov 2022 16:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436893.691093; Thu, 03 Nov 2022 16:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqdMa-0001lO-9Q; Thu, 03 Nov 2022 16:46:44 +0000
Received: by outflank-mailman (input) for mailman id 436893;
 Thu, 03 Nov 2022 16:46:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QhFu=3D=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1oqdMY-000197-0X
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 16:46:42 +0000
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1548d4d0-5b97-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 17:46:39 +0100 (CET)
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 09:46:36 -0700
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga007.jf.intel.com with ESMTP; 03 Nov 2022 09:46:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 858A5F7; Thu,  3 Nov 2022 18:46:52 +0200 (EET)
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
X-Inumbo-ID: 1548d4d0-5b97-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667493999; x=1699029999;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6sEwb2LvPX9v9prH3mu2nEGi0LVqQc1+Me9tIfh9Gsk=;
  b=Nd7KO1lUqzSnMtk3j7fYSRN4GBMulzyp8KtXzvtG6CJ3U8l0+Bw02ZYM
   56Q0/w04hbsprEsCu7TpWXhSVHW587RksAV9JZ3yEL2KDC35A8DgUON9T
   S9V3ICr0AbOnFFdGzl+JWCeDkn+TJ2uCNhdvnrKcDIYU80ENRVrjjvMF4
   QUfEk+tVFXZSWMcVeL34qNT0ZZ1z/dnzaFvI2fa3BGd6WgiLFY42JwZV0
   FZvWu40M4ewv8maytGzDy0gsJ2WHoIajwyNW4eo7g+olJU+E9weHXxkKP
   gTgBjOqn60ynR9iyRXS6K2OkGl47/em5PD+/9CmQm1sHGCEdA6k878nFy
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="309732828"
X-IronPort-AV: E=Sophos;i="5.96,134,1665471600"; 
   d="scan'208";a="309732828"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="629408020"
X-IronPort-AV: E=Sophos;i="5.96,134,1665471600"; 
   d="scan'208";a="629408020"
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Helgaas <helgaas@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
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
Subject: [PATCH v2 0/4] PCI: Add pci_dev_for_each_resource() helper and refactor bus one
Date: Thu,  3 Nov 2022 18:46:40 +0200
Message-Id: <20221103164644.70554-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide two new helper macros to iterate over PCI device resources and
convert users.

Looking at it, refactor existing pci_bus_for_each_resource() and convert
users accordingly.

This applies on top of this patch Mika sent out earlier:
https://lore.kernel.org/linux-pci/20221103103254.30497-1-mika.westerberg@linux.intel.com/

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


