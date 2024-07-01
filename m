Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 740B891E0E9
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 15:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751600.1159634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHD5-00037Y-HY; Mon, 01 Jul 2024 13:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751600.1159634; Mon, 01 Jul 2024 13:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHD5-00034D-E8; Mon, 01 Jul 2024 13:36:47 +0000
Received: by outflank-mailman (input) for mailman id 751600;
 Mon, 01 Jul 2024 13:36:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FOPt=OB=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sOHD4-0001bF-KZ
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 13:36:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f53efcd7-37ae-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 15:36:45 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id A91854EE0748;
 Mon,  1 Jul 2024 15:36:42 +0200 (CEST)
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
X-Inumbo-ID: f53efcd7-37ae-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: nicola.vetrini@bugseng.com,
	consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <jgrall@amazon.com>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: [PATCH 09/17] xen: address violations of MISRA C:2012 Directive 4.10
Date: Mon,  1 Jul 2024 15:36:04 +0200
Message-Id: <76caa62c49a7aa02e43892f9edd72d90e9f39243.1719829101.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
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
Signed-off-by: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

---
Changes in v4:
- drop XEN_ prefix from inclusion guard, according to the feedback received
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
index cbdd1bf7f8..65549caac2 100644
--- a/xen/include/xen/err.h
+++ b/xen/include/xen/err.h
@@ -1,5 +1,6 @@
-#if !defined(__XEN_ERR_H__) && !defined(__ASSEMBLY__)
-#define __XEN_ERR_H__
+#ifndef INCLUDE_XEN_ERR_H
+#define INCLUDE_XEN_ERR_H
+#ifndef __ASSEMBLY__
 
 #include <xen/compiler.h>
 #include <xen/errno.h>
@@ -41,4 +42,5 @@ static inline int __must_check PTR_RET(const void *ptr)
 	return IS_ERR(ptr) ? PTR_ERR(ptr) : 0;
 }
 
-#endif /* __XEN_ERR_H__ */
+#endif /* __ASSEMBLY__ */
+#endif /* INCLUDE_XEN_ERR_H */
diff --git a/xen/include/xen/pci_ids.h b/xen/include/xen/pci_ids.h
index e798477a7e..8e40c78db7 100644
--- a/xen/include/xen/pci_ids.h
+++ b/xen/include/xen/pci_ids.h
@@ -1,3 +1,6 @@
+#ifndef INCLUDE_XEN_PCI_IDS_H
+#define INCLUDE_XEN_PCI_IDS_H
+
 #define PCI_VENDOR_ID_AMD                0x1022
 
 #define PCI_VENDOR_ID_NVIDIA             0x10de
@@ -11,3 +14,5 @@
 #define PCI_VENDOR_ID_BROADCOM           0x14e4
 
 #define PCI_VENDOR_ID_INTEL              0x8086
+
+#endif /* INCLUDE_XEN_PCI_IDS_H */
diff --git a/xen/include/xen/softirq.h b/xen/include/xen/softirq.h
index 33d6f2ecd2..90d4875df7 100644
--- a/xen/include/xen/softirq.h
+++ b/xen/include/xen/softirq.h
@@ -1,5 +1,6 @@
-#if !defined(__XEN_SOFTIRQ_H__) && !defined(__ASSEMBLY__)
-#define __XEN_SOFTIRQ_H__
+#ifndef INCLUDE_XEN_SOFTIRQ_H
+#define INCLUDE_XEN_SOFTIRQ_H
+#ifndef __ASSEMBLY__
 
 /* Low-latency softirqs come first in the following list. */
 enum {
@@ -40,4 +41,5 @@ void cpu_raise_softirq_batch_finish(void);
  */
 void process_pending_softirqs(void);
 
-#endif /* __XEN_SOFTIRQ_H__ */
+#endif /* __ASSEMBLY__ */
+#endif /* INCLUDE_XEN_SOFTIRQ_H */
diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index 0c16baa85f..ec1b6b05e9 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -1,5 +1,6 @@
-#if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
-#define __XEN_VMAP_H__
+#ifndef INCLUDE_XEN_VMAP_H
+#define INCLUDE_XEN_VMAP_H
+#ifdef VMAP_VIRT_START
 
 #include <xen/mm-frame.h>
 #include <xen/page-size.h>
@@ -42,4 +43,5 @@ static inline void vm_init(void)
     vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
 }
 
-#endif /* __XEN_VMAP_H__ */
+#endif /* VMAP_VIRT_START */
+#endif /* INCLUDE_XEN_VMAP_H */
-- 
2.34.1


