Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F5A788701
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 14:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590886.923236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZVmN-00013E-Hz; Fri, 25 Aug 2023 12:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590886.923236; Fri, 25 Aug 2023 12:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZVmN-00011C-FM; Fri, 25 Aug 2023 12:19:07 +0000
Received: by outflank-mailman (input) for mailman id 590886;
 Fri, 25 Aug 2023 12:19:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sFgK=EK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qZVmM-000114-8a
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 12:19:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94dd797c-4341-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 14:19:04 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id A143F4EE0737;
 Fri, 25 Aug 2023 14:19:03 +0200 (CEST)
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
X-Inumbo-ID: 94dd797c-4341-11ee-8783-cb3800f73035
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] xen/pci: drop remaining uses of bool_t
Date: Fri, 25 Aug 2023 14:18:46 +0200
Message-Id: <cd7bd01c1ca9f3c6668ed15f7300c17a981c1708.1692965750.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The remaining occurrences of the type bool_t in the header
file can be removed. This also resolves violations of
MISRA C:2012 Rule 8.3 introduced by 870d5cd9a91f
("xen/IOMMU: Switch bool_t to bool").

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/include/xen/pci.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index a8c8c4ff11c3..7d8a7cd21301 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -75,8 +75,8 @@ struct pci_dev_info {
      * VF's 'is_extfn' field is used to indicate whether its PF is an extended
      * function.
      */
-    bool_t is_extfn;
-    bool_t is_virtfn;
+    bool is_extfn;
+    bool is_virtfn;
     struct {
         u8 bus;
         u8 devfn;
@@ -158,10 +158,10 @@ struct pci_dev {
 
 void pcidevs_lock(void);
 void pcidevs_unlock(void);
-bool_t __must_check pcidevs_locked(void);
+bool __must_check pcidevs_locked(void);
 
-bool_t pci_known_segment(u16 seg);
-bool_t pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func);
+bool pci_known_segment(u16 seg);
+bool pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func);
 int scan_pci_devices(void);
 enum pdev_type pdev_type(u16 seg, u8 bus, u8 devfn);
 int find_upstream_bridge(u16 seg, u8 *bus, u8 *devfn, u8 *secbus);
@@ -211,7 +211,7 @@ unsigned int pci_size_mem_bar(pci_sbdf_t sbdf, unsigned int pos,
                               unsigned int flags);
 
 void pci_intx(const struct pci_dev *, bool enable);
-bool_t pcie_aer_get_firmware_first(const struct pci_dev *);
+bool pcie_aer_get_firmware_first(const struct pci_dev *);
 
 struct pirq;
 int msixtbl_pt_register(struct domain *, struct pirq *, uint64_t gtable);
-- 
2.34.1


