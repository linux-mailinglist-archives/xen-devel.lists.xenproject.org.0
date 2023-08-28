Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367DA78B372
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 16:45:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591539.924081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadUO-00024T-P2; Mon, 28 Aug 2023 14:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591539.924081; Mon, 28 Aug 2023 14:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadUO-0001rC-FK; Mon, 28 Aug 2023 14:45:12 +0000
Received: by outflank-mailman (input) for mailman id 591539;
 Mon, 28 Aug 2023 13:36:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJ5s=EN=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qacQ0-0004gK-LD
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 13:36:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab3ade64-45a5-11ee-9b0c-b553b5be7939;
 Mon, 28 Aug 2023 15:20:34 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 6CD1D4EE0C8B;
 Mon, 28 Aug 2023 15:20:33 +0200 (CEST)
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
X-Inumbo-ID: ab3ade64-45a5-11ee-9b0c-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 12/13] xen: address violations of MISRA C:2012 Directive 4.10
Date: Mon, 28 Aug 2023 15:20:09 +0200
Message-Id: <6ef4634e273a89582299061f1d14346572bf1d47.1693228255.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693228255.git.simone.ballarin@bugseng.com>
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move or amended inclusion guards to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

Inclusion guards must appear at the beginning of the headers
(comments are permitted anywhere) and the #if directive cannot
be used for other checks.

Mechanical change.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/include/xen/err.h       | 4 +++-
 xen/include/xen/pci_ids.h   | 5 +++++
 xen/include/xen/softirq.h   | 4 +++-
 xen/include/xen/unaligned.h | 7 ++++---
 xen/include/xen/vmap.h      | 4 +++-
 5 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/xen/include/xen/err.h b/xen/include/xen/err.h
index 2f29b57d28..a6323d82d7 100644
--- a/xen/include/xen/err.h
+++ b/xen/include/xen/err.h
@@ -1,5 +1,6 @@
-#if !defined(__XEN_ERR_H__) && !defined(__ASSEMBLY__)
+#if !defined(__XEN_ERR_H__)
 #define __XEN_ERR_H__
+#if !defined(__ASSEMBLY__)
 
 #include <xen/compiler.h>
 #include <xen/errno.h>
@@ -54,4 +55,5 @@ static inline int __must_check PTR_RET(const void *ptr)
 	return IS_ERR(ptr) ? PTR_ERR(ptr) : 0;
 }
 
+#endif /* __ASSEMBLY__ */
 #endif /* __XEN_ERR_H__ */
diff --git a/xen/include/xen/pci_ids.h b/xen/include/xen/pci_ids.h
index e798477a7e..1a739d4c92 100644
--- a/xen/include/xen/pci_ids.h
+++ b/xen/include/xen/pci_ids.h
@@ -1,3 +1,6 @@
+#ifndef __XEN_PCI_IDS_H__
+#define __XEN_PCI_IDS_H__
+
 #define PCI_VENDOR_ID_AMD                0x1022
 
 #define PCI_VENDOR_ID_NVIDIA             0x10de
@@ -11,3 +14,5 @@
 #define PCI_VENDOR_ID_BROADCOM           0x14e4
 
 #define PCI_VENDOR_ID_INTEL              0x8086
+
+#endif /* __XEN_PCI_IDS_H__ */
diff --git a/xen/include/xen/softirq.h b/xen/include/xen/softirq.h
index 33d6f2ecd2..092ec733b7 100644
--- a/xen/include/xen/softirq.h
+++ b/xen/include/xen/softirq.h
@@ -1,5 +1,6 @@
-#if !defined(__XEN_SOFTIRQ_H__) && !defined(__ASSEMBLY__)
+#if !defined(__XEN_SOFTIRQ_H__)
 #define __XEN_SOFTIRQ_H__
+#if !defined(__ASSEMBLY__)
 
 /* Low-latency softirqs come first in the following list. */
 enum {
@@ -40,4 +41,5 @@ void cpu_raise_softirq_batch_finish(void);
  */
 void process_pending_softirqs(void);
 
+#endif /* __ASSEMBLY__ */
 #endif /* __XEN_SOFTIRQ_H__ */
diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h
index 0a2b16d05d..45f03b3f1b 100644
--- a/xen/include/xen/unaligned.h
+++ b/xen/include/xen/unaligned.h
@@ -3,13 +3,14 @@
  * without faulting, and at least reasonably efficiently.  Other architectures
  * will need to have a custom asm/unaligned.h.
  */
-#ifndef __ASM_UNALIGNED_H__
-#error "xen/unaligned.h should not be included directly - include asm/unaligned.h instead"
-#endif
 
 #ifndef __XEN_UNALIGNED_H__
 #define __XEN_UNALIGNED_H__
 
+#ifndef __ASM_UNALIGNED_H__
+#error "xen/unaligned.h should not be included directly - include asm/unaligned.h instead"
+#endif
+
 #ifdef __XEN__
 #include <xen/types.h>
 #include <asm/byteorder.h>
diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index b0f7632e89..7a61dea54a 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -1,5 +1,6 @@
-#if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
+#if !defined(__XEN_VMAP_H__)
 #define __XEN_VMAP_H__
+#if defined(VMAP_VIRT_START)
 
 #include <xen/mm-frame.h>
 #include <xen/page-size.h>
@@ -38,4 +39,5 @@ static inline void vm_init(void)
     vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
 }
 
+#endif /* VMAP_VIRT_START */
 #endif /* __XEN_VMAP_H__ */
-- 
2.34.1


