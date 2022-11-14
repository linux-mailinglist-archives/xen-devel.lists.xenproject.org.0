Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8382F6288C2
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 19:58:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443515.698080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oueeu-00053x-Au; Mon, 14 Nov 2022 18:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443515.698080; Mon, 14 Nov 2022 18:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oueeu-0004xQ-6q; Mon, 14 Nov 2022 18:58:16 +0000
Received: by outflank-mailman (input) for mailman id 443515;
 Mon, 14 Nov 2022 18:58:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pr3k=3O=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1ouees-0004uP-HJ
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 18:58:14 +0000
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49b6d320-644e-11ed-8fd2-01056ac49cbb;
 Mon, 14 Nov 2022 19:58:12 +0100 (CET)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 10:58:09 -0800
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 14 Nov 2022 10:58:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id EECC2348; Mon, 14 Nov 2022 20:58:24 +0200 (EET)
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
X-Inumbo-ID: 49b6d320-644e-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668452292; x=1699988292;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BZMLhTwKqFLidxOVtwWq081cCaNo7ow4HF5ovB57GGE=;
  b=aPyQYIOGt3ALpsf7qnIz8dkBQX8iT6ykijN7i68DddUhjbbh6GKYyYHT
   RnKsmwjQzBor8bmmNs4W8aeslrLwqg5ycjeJNQuAwqzOifVyfCtwYZzUU
   9+ue3guDRbbjM5+RqbnzBQdZocdW7rF5jmHJxAa8pcJSN9MbS4vmYs4tA
   HtCK4Cqazr4wQSQymKyM64wzEFZ2xZJX0AKQ6h3j61FtfXI5n6626vA3W
   LMWCY5nIpBIt1H3J8BcME5H9/0u7ND8xT+Wo21JWDnz4dbVEaiFcrR/2e
   rbvs/8Dho1LjQX0qyxPzdnv9haMN/ChZdDOgu+w3RRseYMPlALNg5z+5F
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="295415999"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="295415999"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="638607286"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="638607286"
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
Subject: [PATCH v3 4/4] pcmcia: Convert to use pci_bus_for_each_resource_p()
Date: Mon, 14 Nov 2022 20:58:22 +0200
Message-Id: <20221114185822.65038-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221114185822.65038-1-andriy.shevchenko@linux.intel.com>
References: <20221114185822.65038-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pci_bus_for_each_resource_p() hides the iterator loop since
it may be not used otherwise. With this, we may drop that iterator
variable definition.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
index 3966a6ceb1ac..b200f2b99a7a 100644
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
2.35.1


