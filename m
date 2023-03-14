Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859FB6B9F92
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 20:26:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509810.786359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcAHs-0005X9-5i; Tue, 14 Mar 2023 19:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509810.786359; Tue, 14 Mar 2023 19:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcAHs-0005Ok-1u; Tue, 14 Mar 2023 19:26:20 +0000
Received: by outflank-mailman (input) for mailman id 509810;
 Tue, 14 Mar 2023 19:26:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oTSp=7G=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1pcAHq-0005Jc-Id
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 19:26:18 +0000
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14d02904-c29e-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 20:26:15 +0100 (CET)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 12:26:02 -0700
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 14 Mar 2023 12:25:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id A3CFB93; Tue, 14 Mar 2023 21:26:37 +0200 (EET)
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
X-Inumbo-ID: 14d02904-c29e-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678821975; x=1710357975;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w+YdvYGhoz+V3BkfBUt2y8DW6u+jmfOhlK0R9Fvr/bI=;
  b=KHfH4oc+20wn5OQxZljMkg2LEgbzNEJL3EkTELs29iBXRQLK1IG7BRNp
   VwiwKm5cLARArKF9ZMKdQe86pE75Lp5BVidmKGi6UKfI+1P6FTKI4zxcZ
   OVF7ihY5pcg/BB08WKynaNx1rT+cW9iGGP9zpDf3uZytmBgzHuWY/Bmu2
   r0TFA24fTOReGO88LIkyIIm6HX1BCgsFuXu8GIr6IwTEu18C5+PVPHJ1o
   gxdmLkVrLxC9ho/STrg4we4b9rfbxiKZ3SXF7xGBiprFPPFJ02zZbGC2n
   UuqZu/9MsXiurhMOyFvY8jXr4xXqtyaQRnwmIhBAVD2StlUOCJAToYKfE
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="402389780"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="402389780"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="656474982"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="656474982"
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
Subject: [PATCH v5 3/4] EISA: Convert to use pci_bus_for_each_resource_p()
Date: Tue, 14 Mar 2023 21:26:33 +0200
Message-Id: <20230314192634.63531-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314192634.63531-1-andriy.shevchenko@linux.intel.com>
References: <20230314192634.63531-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The pci_bus_for_each_resource_p() hides the iterator loop since
it may be not used otherwise. With this, we may drop that iterator
variable definition.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Krzysztof Wilczyński <kw@linux.com>
---
 drivers/eisa/pci_eisa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/eisa/pci_eisa.c b/drivers/eisa/pci_eisa.c
index 930c2332c3c4..907b86384396 100644
--- a/drivers/eisa/pci_eisa.c
+++ b/drivers/eisa/pci_eisa.c
@@ -20,8 +20,8 @@ static struct eisa_root_device pci_eisa_root;
 
 static int __init pci_eisa_init(struct pci_dev *pdev)
 {
-	int rc, i;
 	struct resource *res, *bus_res = NULL;
+	int rc;
 
 	if ((rc = pci_enable_device (pdev))) {
 		dev_err(&pdev->dev, "Could not enable device\n");
@@ -38,7 +38,7 @@ static int __init pci_eisa_init(struct pci_dev *pdev)
 	 * eisa_root_register() can only deal with a single io port resource,
 	*  so we use the first valid io port resource.
 	 */
-	pci_bus_for_each_resource(pdev->bus, res, i)
+	pci_bus_for_each_resource_p(pdev->bus, res)
 		if (res && (res->flags & IORESOURCE_IO)) {
 			bus_res = res;
 			break;
-- 
2.39.2


