Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB01F877C1A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 10:00:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691269.1077111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbW8-0008U5-Jc; Mon, 11 Mar 2024 09:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691269.1077111; Mon, 11 Mar 2024 09:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbW8-0008Ia-4s; Mon, 11 Mar 2024 09:00:20 +0000
Received: by outflank-mailman (input) for mailman id 691269;
 Mon, 11 Mar 2024 09:00:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWeI=KR=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rjbW5-0006j9-D7
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 09:00:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6fdbf60-df85-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 10:00:15 +0100 (CET)
Received: from beta.station (net-93-144-106-196.cust.vodafonedsl.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id 2D0764EE0CA3;
 Mon, 11 Mar 2024 10:00:15 +0100 (CET)
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
X-Inumbo-ID: c6fdbf60-df85-11ee-a1ee-f123f15fe8a2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Subject: [XEN PATCH v3 09/16] xen: address violations of MISRA C:2012 Directive 4.10
Date: Mon, 11 Mar 2024 09:59:18 +0100
Message-Id: <504cdd2a0f27d28e0a87492f75476b123b68bbc0.1710145041.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710145041.git.simone.ballarin@bugseng.com>
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

---
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
index cbdd1bf7f8..360307c5da 100644
--- a/xen/include/xen/err.h
+++ b/xen/include/xen/err.h
@@ -1,5 +1,6 @@
-#if !defined(__XEN_ERR_H__) && !defined(__ASSEMBLY__)
-#define __XEN_ERR_H__
+#ifndef XEN_INCLUDE_XEN_ERR_H
+#define XEN_INCLUDE_XEN_ERR_H
+#ifndef __ASSEMBLY__
 
 #include <xen/compiler.h>
 #include <xen/errno.h>
@@ -41,4 +42,5 @@ static inline int __must_check PTR_RET(const void *ptr)
 	return IS_ERR(ptr) ? PTR_ERR(ptr) : 0;
 }
 
-#endif /* __XEN_ERR_H__ */
+#endif /* __ASSEMBLY__ */
+#endif /* XEN_INCLUDE_XEN_ERR_H */
diff --git a/xen/include/xen/pci_ids.h b/xen/include/xen/pci_ids.h
index e798477a7e..8f2318bccd 100644
--- a/xen/include/xen/pci_ids.h
+++ b/xen/include/xen/pci_ids.h
@@ -1,3 +1,6 @@
+#ifndef XEN_INCLUDE_XEN_PCI_IDS_H
+#define XEN_INCLUDE_XEN_PCI_IDS_H
+
 #define PCI_VENDOR_ID_AMD                0x1022
 
 #define PCI_VENDOR_ID_NVIDIA             0x10de
@@ -11,3 +14,5 @@
 #define PCI_VENDOR_ID_BROADCOM           0x14e4
 
 #define PCI_VENDOR_ID_INTEL              0x8086
+
+#endif /* XEN_INCLUDE_XEN_PCI_IDS_H */
diff --git a/xen/include/xen/softirq.h b/xen/include/xen/softirq.h
index 33d6f2ecd2..d108cdd4bc 100644
--- a/xen/include/xen/softirq.h
+++ b/xen/include/xen/softirq.h
@@ -1,5 +1,6 @@
-#if !defined(__XEN_SOFTIRQ_H__) && !defined(__ASSEMBLY__)
-#define __XEN_SOFTIRQ_H__
+#ifndef XEN_INCLUDE_XEN_SOFTIRQ_H
+#define XEN_INCLUDE_XEN_SOFTIRQ_H
+#ifndef __ASSEMBLY__
 
 /* Low-latency softirqs come first in the following list. */
 enum {
@@ -40,4 +41,5 @@ void cpu_raise_softirq_batch_finish(void);
  */
 void process_pending_softirqs(void);
 
-#endif /* __XEN_SOFTIRQ_H__ */
+#endif /* __ASSEMBLY__ */
+#endif /* XEN_INCLUDE_XEN_SOFTIRQ_H */
diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index 0c16baa85f..bb83f5f64a 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -1,5 +1,6 @@
-#if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
-#define __XEN_VMAP_H__
+#ifndef XEN_INCLUDE_XEN_VMAP_H
+#define XEN_INCLUDE_XEN_VMAP_H
+#ifdef VMAP_VIRT_START
 
 #include <xen/mm-frame.h>
 #include <xen/page-size.h>
@@ -42,4 +43,5 @@ static inline void vm_init(void)
     vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
 }
 
-#endif /* __XEN_VMAP_H__ */
+#endif /* VMAP_VIRT_START */
+#endif /* XEN_INCLUDE_XEN_VMAP_H */
-- 
2.34.1


