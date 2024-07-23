Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E081939C60
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 10:16:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762715.1173000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAh2-0004VB-37; Tue, 23 Jul 2024 08:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762715.1173000; Tue, 23 Jul 2024 08:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAh1-0004QP-SJ; Tue, 23 Jul 2024 08:16:19 +0000
Received: by outflank-mailman (input) for mailman id 762715;
 Tue, 23 Jul 2024 08:16:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0IL=OX=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sWAge-0007w0-O3
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 08:15:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8727ee1-48cb-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 10:15:55 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-35-51-193.retail.telecomitalia.it [79.35.51.193])
 by support.bugseng.com (Postfix) with ESMTPSA id AC9154EE0747;
 Tue, 23 Jul 2024 10:15:52 +0200 (CEST)
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
X-Inumbo-ID: c8727ee1-48cb-11ef-8776-851b0ebba9a2
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <jgrall@amazon.com>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: [XEN PATCH v5 09/17] xen: address violations of MISRA C:2012 Directive 4.10
Date: Tue, 23 Jul 2024 10:15:01 +0200
Message-Id: <8776f366569c1e789eaaabc8d9204d11abbf1a48.1721720583.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
References: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Simone Ballarin <simone.ballarin@bugseng.com>

Amend inclusion guards to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

Inclusion guards must appear at the beginning of the headers
(comments are permitted anywhere) and the #if directive cannot
be used for other checks.

Mechanical change.

Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

---
Changes in v5:
- edit inclusion guards, according to the feedback received
Changes in v3:
- remove trailing underscores
- change inclusion guard name to adhere to the new standard
Changes in v2:
- drop changes in xen/include/xen/unaligned.h since this second
  series adds a comment-based deviation in a separate patch
- use #ifndef instead of #if !defined()
---
 xen/include/xen/err.h     | 8 +++++---
 xen/include/xen/pci_ids.h | 5 +++++
 xen/include/xen/softirq.h | 8 +++++---
 xen/include/xen/vmap.h    | 8 +++++---
 4 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/xen/include/xen/err.h b/xen/include/xen/err.h
index cbdd1bf7f8..45988e0cbb 100644
--- a/xen/include/xen/err.h
+++ b/xen/include/xen/err.h
@@ -1,5 +1,6 @@
-#if !defined(__XEN_ERR_H__) && !defined(__ASSEMBLY__)
-#define __XEN_ERR_H__
+#ifndef XEN__ERR_H
+#define XEN__ERR_H
+#ifndef __ASSEMBLY__
 
 #include <xen/compiler.h>
 #include <xen/errno.h>
@@ -41,4 +42,5 @@ static inline int __must_check PTR_RET(const void *ptr)
 	return IS_ERR(ptr) ? PTR_ERR(ptr) : 0;
 }
 
-#endif /* __XEN_ERR_H__ */
+#endif /* __ASSEMBLY__ */
+#endif /* XEN__ERR_H */
diff --git a/xen/include/xen/pci_ids.h b/xen/include/xen/pci_ids.h
index e798477a7e..7f74954d6a 100644
--- a/xen/include/xen/pci_ids.h
+++ b/xen/include/xen/pci_ids.h
@@ -1,3 +1,6 @@
+#ifndef XEN__PCI_IDS_H
+#define XEN__PCI_IDS_H
+
 #define PCI_VENDOR_ID_AMD                0x1022
 
 #define PCI_VENDOR_ID_NVIDIA             0x10de
@@ -11,3 +14,5 @@
 #define PCI_VENDOR_ID_BROADCOM           0x14e4
 
 #define PCI_VENDOR_ID_INTEL              0x8086
+
+#endif /* XEN__PCI_IDS_H */
diff --git a/xen/include/xen/softirq.h b/xen/include/xen/softirq.h
index 33d6f2ecd2..5fd57160df 100644
--- a/xen/include/xen/softirq.h
+++ b/xen/include/xen/softirq.h
@@ -1,5 +1,6 @@
-#if !defined(__XEN_SOFTIRQ_H__) && !defined(__ASSEMBLY__)
-#define __XEN_SOFTIRQ_H__
+#ifndef XEN__SOFTIRQ_H
+#define XEN__SOFTIRQ_H
+#ifndef __ASSEMBLY__
 
 /* Low-latency softirqs come first in the following list. */
 enum {
@@ -40,4 +41,5 @@ void cpu_raise_softirq_batch_finish(void);
  */
 void process_pending_softirqs(void);
 
-#endif /* __XEN_SOFTIRQ_H__ */
+#endif /* __ASSEMBLY__ */
+#endif /* XEN__SOFTIRQ_H */
diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index 0c16baa85f..a8475bd05b 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -1,5 +1,6 @@
-#if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
-#define __XEN_VMAP_H__
+#ifndef XEN__VMAP_H
+#define XEN__VMAP_H
+#ifdef VMAP_VIRT_START
 
 #include <xen/mm-frame.h>
 #include <xen/page-size.h>
@@ -42,4 +43,5 @@ static inline void vm_init(void)
     vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
 }
 
-#endif /* __XEN_VMAP_H__ */
+#endif /* VMAP_VIRT_START */
+#endif /* XEN__VMAP_H */
-- 
2.34.1


