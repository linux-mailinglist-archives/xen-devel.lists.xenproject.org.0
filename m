Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5E26C12EE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 14:16:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511900.791300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peFN4-0000OR-3D; Mon, 20 Mar 2023 13:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511900.791300; Mon, 20 Mar 2023 13:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peFN4-0000MK-02; Mon, 20 Mar 2023 13:16:18 +0000
Received: by outflank-mailman (input) for mailman id 511900;
 Mon, 20 Mar 2023 13:16:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTqL=7M=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1peFN2-0000MD-1r
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 13:16:16 +0000
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60f94fe6-c721-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 14:16:11 +0100 (CET)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 06:16:07 -0700
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 20 Mar 2023 06:15:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 0FA3050B; Mon, 20 Mar 2023 15:16:44 +0200 (EET)
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
X-Inumbo-ID: 60f94fe6-c721-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679318171; x=1710854171;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pKBg2DWRtjN/3o0GQ+Gz1Jmqpx4HtRyfpegHo4oOuDE=;
  b=klH+DgYPQPZx2ycy+5yn2zuj8aR9pJKVoJ2yQjAZnahZzZo2FwZgHaBA
   ac/bnUS63+Trd+/e2Dx2YkZ4PqMi1XYhSPFxlHmQKoBZWSID+Vic+qjSM
   2+DJtOrSA1ESRFmETE9zFMKs1QmYvI1/eKlyGA+om1tgwMEihuE0iw9L6
   qk2nnUTI6KMvRmCrByKIBPKSB6L0DLRuNvxeUxJEWeAZ5LYv7dsNPTaRb
   7ht6eMWEAY17oXtWU9v30QGuXfpW+9JaXxVwWHYJv5u3nPHLIuTkh7yf0
   nGe1tlwFOUpssYysB0qQkaAYGCLe0ymE+x7/YI1r4j+9N7n8wvHuaT5uH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="341015302"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="341015302"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="824468996"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="824468996"
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
Subject: [PATCH v6 2/4] PCI: Split pci_bus_for_each_resource_p() out of pci_bus_for_each_resource()
Date: Mon, 20 Mar 2023 15:16:31 +0200
Message-Id: <20230320131633.61680-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320131633.61680-1-andriy.shevchenko@linux.intel.com>
References: <20230320131633.61680-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Refactor pci_bus_for_each_resource() in the same way as it's done in
pci_dev_for_each_resource() case. This will allow to hide iterator
inside the loop, where it's not used otherwise.

No functional changes intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Krzysztof Wilczyński <kw@linux.com>
---
 .clang-format                      |  1 +
 drivers/pci/bus.c                  |  7 +++----
 drivers/pci/hotplug/shpchp_sysfs.c |  8 ++++----
 drivers/pci/pci.c                  |  5 ++---
 drivers/pci/probe.c                |  2 +-
 drivers/pci/setup-bus.c            | 10 ++++------
 include/linux/pci.h                | 14 ++++++++++----
 7 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/.clang-format b/.clang-format
index 266abb843654..81c9f055086f 100644
--- a/.clang-format
+++ b/.clang-format
@@ -520,6 +520,7 @@ ForEachMacros:
   - 'of_property_for_each_string'
   - 'of_property_for_each_u32'
   - 'pci_bus_for_each_resource'
+  - 'pci_bus_for_each_resource_p'
   - 'pci_dev_for_each_resource'
   - 'pci_dev_for_each_resource_p'
   - 'pci_doe_for_each_off'
diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
index 549c4bd5caec..b0789d332d36 100644
--- a/drivers/pci/bus.c
+++ b/drivers/pci/bus.c
@@ -182,13 +182,13 @@ static int pci_bus_alloc_from_region(struct pci_bus *bus, struct resource *res,
 		void *alignf_data,
 		struct pci_bus_region *region)
 {
-	int i, ret;
 	struct resource *r, avail;
 	resource_size_t max;
+	int ret;
 
 	type_mask |= IORESOURCE_TYPE_BITS;
 
-	pci_bus_for_each_resource(bus, r, i) {
+	pci_bus_for_each_resource_p(bus, r) {
 		resource_size_t min_used = min;
 
 		if (!r)
@@ -289,9 +289,8 @@ bool pci_bus_clip_resource(struct pci_dev *dev, int idx)
 	struct resource *res = &dev->resource[idx];
 	struct resource orig_res = *res;
 	struct resource *r;
-	int i;
 
-	pci_bus_for_each_resource(bus, r, i) {
+	pci_bus_for_each_resource_p(bus, r) {
 		resource_size_t start, end;
 
 		if (!r)
diff --git a/drivers/pci/hotplug/shpchp_sysfs.c b/drivers/pci/hotplug/shpchp_sysfs.c
index 64beed7a26be..ff04f0c5e7c3 100644
--- a/drivers/pci/hotplug/shpchp_sysfs.c
+++ b/drivers/pci/hotplug/shpchp_sysfs.c
@@ -24,16 +24,16 @@
 static ssize_t show_ctrl(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct pci_dev *pdev;
-	int index, busnr;
 	struct resource *res;
 	struct pci_bus *bus;
 	size_t len = 0;
+	int busnr;
 
 	pdev = to_pci_dev(dev);
 	bus = pdev->subordinate;
 
 	len += sysfs_emit_at(buf, len, "Free resources: memory\n");
-	pci_bus_for_each_resource(bus, res, index) {
+	pci_bus_for_each_resource_p(bus, res) {
 		if (res && (res->flags & IORESOURCE_MEM) &&
 				!(res->flags & IORESOURCE_PREFETCH)) {
 			len += sysfs_emit_at(buf, len,
@@ -43,7 +43,7 @@ static ssize_t show_ctrl(struct device *dev, struct device_attribute *attr, char
 		}
 	}
 	len += sysfs_emit_at(buf, len, "Free resources: prefetchable memory\n");
-	pci_bus_for_each_resource(bus, res, index) {
+	pci_bus_for_each_resource_p(bus, res) {
 		if (res && (res->flags & IORESOURCE_MEM) &&
 			       (res->flags & IORESOURCE_PREFETCH)) {
 			len += sysfs_emit_at(buf, len,
@@ -53,7 +53,7 @@ static ssize_t show_ctrl(struct device *dev, struct device_attribute *attr, char
 		}
 	}
 	len += sysfs_emit_at(buf, len, "Free resources: IO\n");
-	pci_bus_for_each_resource(bus, res, index) {
+	pci_bus_for_each_resource_p(bus, res) {
 		if (res && (res->flags & IORESOURCE_IO)) {
 			len += sysfs_emit_at(buf, len,
 					     "start = %8.8llx, length = %8.8llx\n",
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 7a67611dc5f4..2f8915ab41ef 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -779,9 +779,8 @@ struct resource *pci_find_parent_resource(const struct pci_dev *dev,
 {
 	const struct pci_bus *bus = dev->bus;
 	struct resource *r;
-	int i;
 
-	pci_bus_for_each_resource(bus, r, i) {
+	pci_bus_for_each_resource_p(bus, r) {
 		if (!r)
 			continue;
 		if (resource_contains(r, res)) {
@@ -799,7 +798,7 @@ struct resource *pci_find_parent_resource(const struct pci_dev *dev,
 			 * be both a positively-decoded aperture and a
 			 * subtractively-decoded region that contain the BAR.
 			 * We want the positively-decoded one, so this depends
-			 * on pci_bus_for_each_resource() giving us those
+			 * on pci_bus_for_each_resource_p() giving us those
 			 * first.
 			 */
 			return r;
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index a3f68b6ba6ac..5ada4c155d3c 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -533,7 +533,7 @@ void pci_read_bridge_bases(struct pci_bus *child)
 	pci_read_bridge_mmio_pref(child);
 
 	if (dev->transparent) {
-		pci_bus_for_each_resource(child->parent, res, i) {
+		pci_bus_for_each_resource_p(child->parent, res) {
 			if (res && res->flags) {
 				pci_bus_add_resource(child, res,
 						     PCI_SUBTRACTIVE_DECODE);
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index d4fc7665f70a..d6ead027255f 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -770,9 +770,8 @@ static struct resource *find_bus_resource_of_type(struct pci_bus *bus,
 						  unsigned long type)
 {
 	struct resource *r, *r_assigned = NULL;
-	int i;
 
-	pci_bus_for_each_resource(bus, r, i) {
+	pci_bus_for_each_resource_p(bus, r) {
 		if (r == &ioport_resource || r == &iomem_resource)
 			continue;
 		if (r && (r->flags & type_mask) == type && !r->parent)
@@ -1204,7 +1203,7 @@ void __pci_bus_size_bridges(struct pci_bus *bus, struct list_head *realloc_head)
 			additional_mmio_pref_size = 0;
 	struct resource *pref;
 	struct pci_host_bridge *host;
-	int hdr_type, i, ret;
+	int hdr_type, ret;
 
 	list_for_each_entry(dev, &bus->devices, bus_list) {
 		struct pci_bus *b = dev->subordinate;
@@ -1228,7 +1227,7 @@ void __pci_bus_size_bridges(struct pci_bus *bus, struct list_head *realloc_head)
 		host = to_pci_host_bridge(bus->bridge);
 		if (!host->size_windows)
 			return;
-		pci_bus_for_each_resource(bus, pref, i)
+		pci_bus_for_each_resource_p(bus, pref)
 			if (pref && (pref->flags & IORESOURCE_PREFETCH))
 				break;
 		hdr_type = -1;	/* Intentionally invalid - not a PCI device. */
@@ -1333,12 +1332,11 @@ EXPORT_SYMBOL(pci_bus_size_bridges);
 
 static void assign_fixed_resource_on_bus(struct pci_bus *b, struct resource *r)
 {
-	int i;
 	struct resource *parent_r;
 	unsigned long mask = IORESOURCE_IO | IORESOURCE_MEM |
 			     IORESOURCE_PREFETCH;
 
-	pci_bus_for_each_resource(b, parent_r, i) {
+	pci_bus_for_each_resource_p(b, parent_r) {
 		if (!parent_r)
 			continue;
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index a97f026afaed..f0be961fcd7e 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1445,10 +1445,16 @@ int devm_request_pci_bus_resources(struct device *dev,
 /* Temporary until new and working PCI SBR API in place */
 int pci_bridge_secondary_bus_reset(struct pci_dev *dev);
 
-#define pci_bus_for_each_resource(bus, res, i)				\
-	for (i = 0;							\
-	    (res = pci_bus_resource_n(bus, i)) || i < PCI_BRIDGE_RESOURCE_NUM; \
-	     i++)
+#define __pci_bus_for_each_resource(bus, res, __i, vartype)			\
+	for (vartype __i = 0;							\
+	     res = pci_bus_resource_n(bus, __i), __i < PCI_BRIDGE_RESOURCE_NUM;	\
+	     __i++)
+
+#define pci_bus_for_each_resource(bus, res, i)					\
+	__pci_bus_for_each_resource(bus, res, i, )
+
+#define pci_bus_for_each_resource_p(bus, res)					\
+	__pci_bus_for_each_resource(bus, res, __i, unsigned int)
 
 int __must_check pci_bus_alloc_resource(struct pci_bus *bus,
 			struct resource *res, resource_size_t size,
-- 
2.39.2


