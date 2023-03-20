Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7256C12FD
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 14:17:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511906.791321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peFNp-0001Sn-RS; Mon, 20 Mar 2023 13:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511906.791321; Mon, 20 Mar 2023 13:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peFNp-0001QR-OA; Mon, 20 Mar 2023 13:17:05 +0000
Received: by outflank-mailman (input) for mailman id 511906;
 Mon, 20 Mar 2023 13:17:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTqL=7M=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1peFNo-0001NQ-1N
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 13:17:04 +0000
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dff85f9-c721-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 14:17:00 +0100 (CET)
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 06:16:08 -0700
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga007.jf.intel.com with ESMTP; 20 Mar 2023 06:15:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 2B4BE638; Mon, 20 Mar 2023 15:16:44 +0200 (EET)
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
X-Inumbo-ID: 7dff85f9-c721-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679318220; x=1710854220;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3Bu5KEQ7VbEZVFxJWJ3dCxTl63qFR3TMO6ewhBoLJ+8=;
  b=LA3YhfLRz7BNnF/owpotRpyOX/rLtivqtb+sO01Fem6ULJNJpNjJwuhP
   ynST9OBv/0b43B8HAGNVI86euj10RDznK6MhWgecS2ACXq/6+H+gxvbGq
   BHArNBh/wq3N/9kEsZ17QFMz3pgs0Wud5rfC7iCKhWpprgAScCJQNtw0k
   YYxI+vzUw5fPmP6ZylovJCn3FaQJC/B4ncZVIDhRfzEsbpI1isv/dkBKB
   jSUajEg7aoqkuoqH47m4/uaDIacnpN9k8uEKUh4TOIE1t1yg9pmyD05KI
   pIGDQsGkWavGUwSXDAv8Cx7qjD7B0V0lS/GmhtUkf5H9B+E+W9iCZ0ova
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="424932260"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="424932260"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="674382651"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="674382651"
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
Subject: [PATCH v6 4/4] pcmcia: Convert to use pci_bus_for_each_resource_p()
Date: Mon, 20 Mar 2023 15:16:33 +0200
Message-Id: <20230320131633.61680-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320131633.61680-1-andriy.shevchenko@linux.intel.com>
References: <20230320131633.61680-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The pci_bus_for_each_resource_p() hides the iterator loop since
it may be not used otherwise. With this, we may drop that iterator
variable definition.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Krzysztof Wilczyński <kw@linux.com>
Acked-by: Dominik Brodowski <linux@dominikbrodowski.net>
---
 drivers/pcmcia/rsrc_nonstatic.c | 9 +++------
 drivers/pcmcia/yenta_socket.c   | 3 +--
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/pcmcia/rsrc_nonstatic.c b/drivers/pcmcia/rsrc_nonstatic.c
index ad1141fddb4c..9d92d4bb6239 100644
--- a/drivers/pcmcia/rsrc_nonstatic.c
+++ b/drivers/pcmcia/rsrc_nonstatic.c
@@ -934,7 +934,7 @@ static int adjust_io(struct pcmcia_socket *s, unsigned int action, unsigned long
 static int nonstatic_autoadd_resources(struct pcmcia_socket *s)
 {
 	struct resource *res;
-	int i, done = 0;
+	int done = 0;
 
 	if (!s->cb_dev || !s->cb_dev->bus)
 		return -ENODEV;
@@ -960,12 +960,9 @@ static int nonstatic_autoadd_resources(struct pcmcia_socket *s)
 	 */
 	if (s->cb_dev->bus->number == 0)
 		return -EINVAL;
-
-	for (i = 0; i < PCI_BRIDGE_RESOURCE_NUM; i++) {
-		res = s->cb_dev->bus->resource[i];
-#else
-	pci_bus_for_each_resource(s->cb_dev->bus, res, i) {
 #endif
+
+	pci_bus_for_each_resource_p(s->cb_dev->bus, res) {
 		if (!res)
 			continue;
 
diff --git a/drivers/pcmcia/yenta_socket.c b/drivers/pcmcia/yenta_socket.c
index 1365eaa20ff4..2e5bdf3db0ba 100644
--- a/drivers/pcmcia/yenta_socket.c
+++ b/drivers/pcmcia/yenta_socket.c
@@ -673,9 +673,8 @@ static int yenta_search_res(struct yenta_socket *socket, struct resource *res,
 			    u32 min)
 {
 	struct resource *root;
-	int i;
 
-	pci_bus_for_each_resource(socket->dev->bus, root, i) {
+	pci_bus_for_each_resource_p(socket->dev->bus, root) {
 		if (!root)
 			continue;
 
-- 
2.39.2


