Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC57C80539B
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:56:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647704.1011293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAU27-0001Vf-CA; Tue, 05 Dec 2023 11:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647704.1011293; Tue, 05 Dec 2023 11:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAU27-0001NY-6S; Tue, 05 Dec 2023 11:56:11 +0000
Received: by outflank-mailman (input) for mailman id 647704;
 Tue, 05 Dec 2023 11:56:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pDPQ=HQ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rAU25-0008Co-A4
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:56:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44f7385f-9365-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 12:56:05 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-79-46-48-173.retail.telecomitalia.it [79.46.48.173])
 by support.bugseng.com (Postfix) with ESMTPSA id CC5C64EE074D;
 Tue,  5 Dec 2023 12:56:04 +0100 (CET)
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
X-Inumbo-ID: 44f7385f-9365-11ee-98e5-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 6/6] xen/pci: address violations of MISRA C:2012 Rule 8.2
Date: Tue,  5 Dec 2023 12:55:55 +0100
Message-Id: <f84479a28a7f9d6e44829259229460dcf7c497c4.1701764980.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701764980.git.federico.serafini@bugseng.com>
References: <cover.1701764980.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names to address violations of MISRA C:2012
Rule 8.2. Furthermore, use C standard types to comply with XEN coding style.
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/drivers/passthrough/pci.c | 8 ++++----
 xen/include/xen/pci.h         | 3 ++-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 04d00c7c37..28ed8ea817 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -104,9 +104,9 @@ static struct pci_seg *alloc_pseg(u16 seg)
 }
 
 static int pci_segments_iterate(
-    int (*handler)(struct pci_seg *, void *), void *arg)
+    int (*handler)(struct pci_seg *pseg, void *arg), void *arg)
 {
-    u16 seg = 0;
+    uint16_t seg = 0;
     int rc = 0;
 
     do {
@@ -1077,7 +1077,7 @@ int __init scan_pci_devices(void)
 
 struct setup_hwdom {
     struct domain *d;
-    int (*handler)(u8 devfn, struct pci_dev *);
+    int (*handler)(uint8_t devfn, struct pci_dev *pdev);
 };
 
 static void __hwdom_init setup_one_hwdom_device(const struct setup_hwdom *ctxt,
@@ -1157,7 +1157,7 @@ static int __hwdom_init cf_check _setup_hwdom_pci_devices(
 }
 
 void __hwdom_init setup_hwdom_pci_devices(
-    struct domain *d, int (*handler)(u8 devfn, struct pci_dev *))
+    struct domain *d, int (*handler)(uint8_t devfn, struct pci_dev *pdev))
 {
     struct setup_hwdom ctxt = { .d = d, .handler = handler };
 
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 50d7dfb2a2..a3b7434818 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -178,7 +178,8 @@ enum pdev_type pdev_type(u16 seg, u8 bus, u8 devfn);
 int find_upstream_bridge(u16 seg, u8 *bus, u8 *devfn, u8 *secbus);
 
 void setup_hwdom_pci_devices(struct domain *d,
-                            int (*handler)(u8 devfn, struct pci_dev *pdev));
+                             int (*handler)(uint8_t devfn,
+                                            struct pci_dev *pdev));
 int pci_release_devices(struct domain *d);
 void pci_segments_init(void);
 int pci_add_segment(u16 seg);
-- 
2.34.1


