Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D4D79A5C7
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 10:16:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599120.934390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfc5J-0002co-MW; Mon, 11 Sep 2023 08:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599120.934390; Mon, 11 Sep 2023 08:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfc5J-0002aD-K3; Mon, 11 Sep 2023 08:15:53 +0000
Received: by outflank-mailman (input) for mailman id 599120;
 Mon, 11 Sep 2023 08:15:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vgak=E3=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qfc5I-0002a7-O7
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 08:15:52 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bb45f02-507b-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 10:15:51 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-87-19-206-190.retail.telecomitalia.it [87.19.206.190])
 by support.bugseng.com (Postfix) with ESMTPSA id B6D2C4EE0741;
 Mon, 11 Sep 2023 10:15:50 +0200 (CEST)
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
X-Inumbo-ID: 6bb45f02-507b-11ee-8784-cb3800f73035
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] xen/PCI: address violations of MISRA C:2012 Rules 8.2 and 8.3
Date: Mon, 11 Sep 2023 10:15:35 +0200
Message-Id: <f6884bbff0a4117874618bfbece5066d98131aff.1694419992.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names and make function declarations and
definitions consistent. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/pci.h | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 7d8a7cd213..3ed79d15cd 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -166,14 +166,14 @@ int scan_pci_devices(void);
 enum pdev_type pdev_type(u16 seg, u8 bus, u8 devfn);
 int find_upstream_bridge(u16 seg, u8 *bus, u8 *devfn, u8 *secbus);
 
-void setup_hwdom_pci_devices(struct domain *,
-                            int (*)(u8 devfn, struct pci_dev *));
+void setup_hwdom_pci_devices(struct domain *d,
+                            int (*handler)(u8 devfn, struct pci_dev *pdev));
 int pci_release_devices(struct domain *d);
 void pci_segments_init(void);
 int pci_add_segment(u16 seg);
 const unsigned long *pci_get_ro_map(u16 seg);
 int pci_add_device(u16 seg, u8 bus, u8 devfn,
-                   const struct pci_dev_info *, nodeid_t node);
+                   const struct pci_dev_info *info, nodeid_t node);
 int pci_remove_device(u16 seg, u8 bus, u8 devfn);
 int pci_ro_device(int seg, int bus, int devfn);
 int pci_hide_device(unsigned int seg, unsigned int bus, unsigned int devfn);
@@ -198,10 +198,11 @@ int pci_find_next_cap(u16 seg, u8 bus, unsigned int devfn, u8 pos, int cap);
 int pci_find_ext_capability(int seg, int bus, int devfn, int cap);
 int pci_find_next_ext_capability(int seg, int bus, int devfn, int start,
                                  int cap);
-const char *parse_pci(const char *, unsigned int *seg, unsigned int *bus,
-                      unsigned int *dev, unsigned int *func);
-const char *parse_pci_seg(const char *, unsigned int *seg, unsigned int *bus,
-                          unsigned int *dev, unsigned int *func, bool *def_seg);
+const char *parse_pci(const char *s, unsigned int *seg_p, unsigned int *bus_p,
+                      unsigned int *dev_p, unsigned int *func_p);
+const char *parse_pci_seg(const char *s, unsigned int *seg_p,
+                          unsigned int *bus_p, unsigned int *dev_p,
+                          unsigned int *func_p, bool *def_seg);
 
 #define PCI_BAR_VF      (1u << 0)
 #define PCI_BAR_LAST    (1u << 1)
@@ -210,12 +211,12 @@ unsigned int pci_size_mem_bar(pci_sbdf_t sbdf, unsigned int pos,
                               uint64_t *paddr, uint64_t *psize,
                               unsigned int flags);
 
-void pci_intx(const struct pci_dev *, bool enable);
-bool pcie_aer_get_firmware_first(const struct pci_dev *);
+void pci_intx(const struct pci_dev *pdev, bool enable);
+bool pcie_aer_get_firmware_first(const struct pci_dev *pdev);
 
 struct pirq;
-int msixtbl_pt_register(struct domain *, struct pirq *, uint64_t gtable);
-void msixtbl_pt_unregister(struct domain *, struct pirq *);
+int msixtbl_pt_register(struct domain *d, struct pirq *pirq, uint64_t gtable);
+void msixtbl_pt_unregister(struct domain *d, struct pirq *pirq);
 void msixtbl_pt_cleanup(struct domain *d);
 
 #ifdef CONFIG_HVM
-- 
2.34.1


