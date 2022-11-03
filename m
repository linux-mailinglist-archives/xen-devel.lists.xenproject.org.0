Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD11618514
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 17:47:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436903.691126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqdN7-0003Nz-7r; Thu, 03 Nov 2022 16:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436903.691126; Thu, 03 Nov 2022 16:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqdN7-0003Lg-4r; Thu, 03 Nov 2022 16:47:17 +0000
Received: by outflank-mailman (input) for mailman id 436903;
 Thu, 03 Nov 2022 16:47:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QhFu=3D=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1oqdN6-0002ih-1H
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 16:47:16 +0000
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25b81a63-5b97-11ed-8fd0-01056ac49cbb;
 Thu, 03 Nov 2022 17:47:07 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 09:46:36 -0700
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga005.jf.intel.com with ESMTP; 03 Nov 2022 09:46:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id B75E129D; Thu,  3 Nov 2022 18:46:52 +0200 (EET)
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
X-Inumbo-ID: 25b81a63-5b97-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667494033; x=1699030033;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EaNuN468AX7oVVNzygbZKjeVdiuKUVO8jdpIxMpvwBE=;
  b=Voi+kRr9Zp10H+K4cuAxV1LmnyNY6gKw/G0DgaycWnXEatL6nDgX2Wzh
   RW+uPVvrCWpkbKi8jCYl79gAnuQgATfINATvUFE3Fdir0x4Wkt9qjWcRk
   KxFtBXStZnga813ivkRQqyE/1wMQ8Ns3FTNPT5q+OeiECCEsipFOIm9TW
   E1W1WSCqf4ChYPKHf/VWH97ZUb96kdzQAyXp7n/XAajpeFvZCwclpR7pE
   UIUFCQYNtwXF7hlRhGB5vrV3taGM7vuOGJDZBGIHMWAEPu3uukwM7bKIw
   9s7Rj1Ua/JZCQQbVXCJuHfO1SbSkbm1HxTlg/lk18RSCfFiJRV488uCjP
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="293061340"
X-IronPort-AV: E=Sophos;i="5.96,134,1665471600"; 
   d="scan'208";a="293061340"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="809735378"
X-IronPort-AV: E=Sophos;i="5.96,134,1665471600"; 
   d="scan'208";a="809735378"
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
Subject: [PATCH v2 3/4] EISA: Convert to use pci_bus_for_each_resource_p()
Date: Thu,  3 Nov 2022 18:46:43 +0200
Message-Id: <20221103164644.70554-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221103164644.70554-1-andriy.shevchenko@linux.intel.com>
References: <20221103164644.70554-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pci_bus_for_each_resource_p() hides the iterator loop since
it may be not used otherwise. With this, we may drop that iterator
variable definition.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
2.35.1


