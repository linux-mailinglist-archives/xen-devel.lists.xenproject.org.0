Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 221916D0B28
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 18:28:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516807.801569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phv8h-0005VE-RE; Thu, 30 Mar 2023 16:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516807.801569; Thu, 30 Mar 2023 16:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phv8h-0005RH-NE; Thu, 30 Mar 2023 16:28:39 +0000
Received: by outflank-mailman (input) for mailman id 516807;
 Thu, 30 Mar 2023 16:28:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3PO=7W=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1phv8f-0004tu-B1
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 16:28:37 +0000
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e85ccbff-cf17-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 18:28:33 +0200 (CEST)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 09:28:30 -0700
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 30 Mar 2023 09:28:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 43047238; Thu, 30 Mar 2023 19:24:51 +0300 (EEST)
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
X-Inumbo-ID: e85ccbff-cf17-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680193713; x=1711729713;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mMeyztJwnpsG6WpiZZE3Wzd++aYBpdo5TdtsAUuwHek=;
  b=UKJh84Ox4ppKFyS170YQltzUlOlRmEuBpL/+hQTzzZtAKsUQHFent1GC
   HAXifF3kiaOlNmQG3yOZL2Ke7Q84Wx8GsIwk0TX2oeA1zVLZP0FSNDBGa
   S3lEADeLlZZlJmCsHtHuzkoQFC8I2I5arjfETaCq0aYz75FNwi8wXLHK9
   Rhsx3RKOIzZ94fYX12A2JmZ2OGWsrS8/GvEt30w9rY/XVus+ppdYmGfLn
   vSdvNDayqURixPN0TECvUAOkJjrXzd4hOmn3PfMP6CdC3PQ4kUtI9tdj4
   Lh7taW/KOBvvNmtDHK/NyTvKsbkk2qqYD1Cs6Zv7LhIzvVZLqQp9A4hbw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="427496048"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="427496048"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="684762351"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="684762351"
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
Subject: [PATCH v8 4/7] PCI: Document pci_bus_for_each_resource() to avoid confusion
Date: Thu, 30 Mar 2023 19:24:31 +0300
Message-Id: <20230330162434.35055-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230330162434.35055-1-andriy.shevchenko@linux.intel.com>
References: <20230330162434.35055-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There might be a confusion with the implementation of the
pci_bus_for_each_resources() due to side effect of Logical
OR. Document entire macro and explain how it works and why
the conditional needs to be like that.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/pci.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index 5cacd9e4c8cd..e3b3af606280 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1446,6 +1446,26 @@ int devm_request_pci_bus_resources(struct device *dev,
 /* Temporary until new and working PCI SBR API in place */
 int pci_bridge_secondary_bus_reset(struct pci_dev *dev);
 
+/**
+ * pci_bus_for_each_resource - iterate over PCI bus resources
+ * @bus: the PCI bus
+ * @res: a varible to keep a pointer to the current resource
+ * @i: a variable to keep the index of the current resource
+ *
+ * Iterate over PCI bus resources. The first part is to go over PCI bus
+ * resource array, which has at most the %PCI_BRIDGE_RESOURCE_NUM entries.
+ * After that continue with the separate list of the additional resources,
+ * if not empty. That's why the Logical OR is being used.
+ *
+ * Possible usage:
+ *
+ *	struct pci_bus *bus = ...;
+ *	struct resource *res;
+ *	unsigned int i;
+ *
+ * 	pci_bus_for_each_resource(bus, res, i)
+ * 		pr_info("PCI bus resource[%u]: %pR\n", i, res);
+ */
 #define pci_bus_for_each_resource(bus, res, i)				\
 	for (i = 0;							\
 	    (res = pci_bus_resource_n(bus, i)) || i < PCI_BRIDGE_RESOURCE_NUM; \
-- 
2.40.0.1.gaa8946217a0b


