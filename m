Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AE66D0B21
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 18:28:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516802.801519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phv8a-000485-Af; Thu, 30 Mar 2023 16:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516802.801519; Thu, 30 Mar 2023 16:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phv8a-00045l-6R; Thu, 30 Mar 2023 16:28:32 +0000
Received: by outflank-mailman (input) for mailman id 516802;
 Thu, 30 Mar 2023 16:28:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3PO=7W=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1phv8Y-0003qA-DV
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 16:28:30 +0000
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7538ac5-cf17-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 18:28:29 +0200 (CEST)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 09:28:28 -0700
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga005.jf.intel.com with ESMTP; 30 Mar 2023 09:28:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id DCBBF1D9; Thu, 30 Mar 2023 19:24:49 +0300 (EEST)
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
X-Inumbo-ID: e7538ac5-cf17-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680193709; x=1711729709;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yhhBl9vHYjEoa/C6LYyaGmzTAsrwMbBX/9yhSQi3PhY=;
  b=eB5C1OzY1asxXvzkN6NmOx8NmWLcSDi1o6o0vQzAnDcqz+xslbgfzhEb
   XDNw9hfx/jy6ngofMgRUUDTQDC/ykqkPphM0MtQSCzE7yEkvqDUUZ7kAB
   kgga3g2haWi2Pe9FSnlANvBKaXXCRSShLQ/jUGSfj3iySTmFjiBL4y9qs
   k+Ma/q7Coj/tcNo2fcYvKVGBDo+BgyBg6CN+PzAQTuwUtDQj1nTFq77JU
   /gBT03edahvVi7DzVJsAjUUV/2OGav8FyMQ2oKQwjoZb0GG+HwmUJCVBs
   t/UIm3NuwgQwGlhKNuK/gOFlx/nyEfzQGRH8pZPQ3hmaG24BmSTtI5kaf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="427495956"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="427495956"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="858971546"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="858971546"
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
Subject: [PATCH v8 2/7] PCI: Introduce pci_resource_n()
Date: Thu, 30 Mar 2023 19:24:29 +0300
Message-Id: <20230330162434.35055-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230330162434.35055-1-andriy.shevchenko@linux.intel.com>
References: <20230330162434.35055-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce pci_resource_n() and replace open-coded implementations of it
in pci.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/linux/pci.h | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index b50e5c79f7e3..aeaa95455d4c 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1995,14 +1995,13 @@ int pci_iobar_pfn(struct pci_dev *pdev, int bar, struct vm_area_struct *vma);
  * These helpers provide future and backwards compatibility
  * for accessing popular PCI BAR info
  */
-#define pci_resource_start(dev, bar)	((dev)->resource[(bar)].start)
-#define pci_resource_end(dev, bar)	((dev)->resource[(bar)].end)
-#define pci_resource_flags(dev, bar)	((dev)->resource[(bar)].flags)
-#define pci_resource_len(dev,bar) \
-	((pci_resource_end((dev), (bar)) == 0) ? 0 :	\
-							\
-	 (pci_resource_end((dev), (bar)) -		\
-	  pci_resource_start((dev), (bar)) + 1))
+#define pci_resource_n(dev, bar)	(&(dev)->resource[(bar)])
+#define pci_resource_start(dev, bar)	(pci_resource_n(dev, bar)->start)
+#define pci_resource_end(dev, bar)	(pci_resource_n(dev, bar)->end)
+#define pci_resource_flags(dev, bar)	(pci_resource_n(dev, bar)->flags)
+#define pci_resource_len(dev,bar)					\
+	(pci_resource_end((dev), (bar)) ? 				\
+	 resource_size(pci_resource_n((dev), (bar))) : 0)
 
 /*
  * Similar to the helpers above, these manipulate per-pci_dev
-- 
2.40.0.1.gaa8946217a0b


