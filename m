Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4506C6F37
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 18:36:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514005.795906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfOr5-0001pa-9d; Thu, 23 Mar 2023 17:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514005.795906; Thu, 23 Mar 2023 17:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfOr5-0001kS-1B; Thu, 23 Mar 2023 17:36:03 +0000
Received: by outflank-mailman (input) for mailman id 514005;
 Thu, 23 Mar 2023 17:36:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JuTy=7P=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1pfOr3-0000iP-6N
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 17:36:01 +0000
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c59aa0b-c9a1-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 18:35:59 +0100 (CET)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 10:35:46 -0700
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 23 Mar 2023 10:35:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 1873736E; Thu, 23 Mar 2023 19:36:12 +0200 (EET)
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
X-Inumbo-ID: 2c59aa0b-c9a1-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679592959; x=1711128959;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yfeoYNUxbO0e2gvMFM4I3e9/lrxCDzuwgcUE0vRubSk=;
  b=SnsPC8EmMiZi1EyU3GPkdcv2rNN7HJ4yLh8AdCyIFA4SZ48euhSX1lW+
   rrHIa9gzDxTZusb6BbxusNULuLAzqlz0pnMDIROuxvM+wSql53f/3S9Jj
   ul77FVTI8THfhOPW0oCVMHE7pM/1jvlaGomKra8N0u9ChzvFCgTK/ynLl
   2ya3Av+3Lw+Ed9z8EQs2V1tKnG+gh/JTMMI5Zctem8snBc/1Hn/885kRd
   eMYsxOqWY44WhaeDyTseU9vdnZbgj910ZUzaB3INL+bR04Eo3ngRTlYTF
   /LwWUNAW7jym4R4KkNjpFphUELz7l58OOkv6XmqAk5Qnm9xC/CHYvRysR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="367308136"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="367308136"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="682380750"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="682380750"
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
Subject: [PATCH v7 6/6] PCI: Make use of pci_resource_n()
Date: Thu, 23 Mar 2023 19:36:10 +0200
Message-Id: <20230323173610.60442-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230323173610.60442-1-andriy.shevchenko@linux.intel.com>
References: <20230323173610.60442-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace open-coded implementations of pci_resource_n() in pci.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/pci.h | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index 70a4684d5f26..9539cf63fe5e 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2006,14 +2006,12 @@ int pci_iobar_pfn(struct pci_dev *pdev, int bar, struct vm_area_struct *vma);
  * for accessing popular PCI BAR info
  */
 #define pci_resource_n(dev, bar)	(&(dev)->resource[(bar)])
-#define pci_resource_start(dev, bar)	((dev)->resource[(bar)].start)
-#define pci_resource_end(dev, bar)	((dev)->resource[(bar)].end)
-#define pci_resource_flags(dev, bar)	((dev)->resource[(bar)].flags)
-#define pci_resource_len(dev,bar) \
-	((pci_resource_end((dev), (bar)) == 0) ? 0 :	\
-							\
-	 (pci_resource_end((dev), (bar)) -		\
-	  pci_resource_start((dev), (bar)) + 1))
+#define pci_resource_start(dev, bar)	(pci_resource_n(dev, bar)->start)
+#define pci_resource_end(dev, bar)	(pci_resource_n(dev, bar)->end)
+#define pci_resource_flags(dev, bar)	(pci_resource_n(dev, bar)->flags)
+#define pci_resource_len(dev,bar)					\
+	(pci_resource_end((dev), (bar)) ? 				\
+	 resource_size(pci_resource_n((dev), (bar))) : 0)
 
 #define __pci_dev_for_each_resource_0(dev, res, ...)			\
 	for (unsigned int __b = 0;					\
-- 
2.40.0.1.gaa8946217a0b


