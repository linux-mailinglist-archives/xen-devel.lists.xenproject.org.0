Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C50886CCEC
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 16:28:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687194.1070256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiKU-0000Wt-Cb; Thu, 29 Feb 2024 15:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687194.1070256; Thu, 29 Feb 2024 15:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiKU-0000QD-4w; Thu, 29 Feb 2024 15:28:14 +0000
Received: by outflank-mailman (input) for mailman id 687194;
 Thu, 29 Feb 2024 15:28:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ot4I=KG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rfiKS-0008Ql-PM
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 15:28:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2576eed4-d717-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 16:28:10 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.196])
 by support.bugseng.com (Postfix) with ESMTPSA id 3B1364EE074C;
 Thu, 29 Feb 2024 16:28:10 +0100 (CET)
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
X-Inumbo-ID: 2576eed4-d717-11ee-a1ee-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 03/10] x86: address some violations of MISRA C Rule 20.7
Date: Thu, 29 Feb 2024 16:27:55 +0100
Message-Id: <3c9e90aaf5dde769b689468fc818e4ae61fa11f3.1709219010.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709219010.git.nicola.vetrini@bugseng.com>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

GUARD(1) is also amended to avoid modifying UA_KEEP or its definition.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
I wasn't very sure whether touching the definition of UA_KEEP would be a good
idea, so I added parentheses in the only user I've seen so far that causes a
violation.
---
 xen/arch/x86/include/asm/irq.h | 6 +++---
 xen/arch/x86/usercopy.c        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 082a3d6bbc6a..5c722848e8ce 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -179,9 +179,9 @@ void cleanup_domain_irq_mapping(struct domain *d);
     void *__ret = radix_tree_lookup(&(d)->arch.hvm.emuirq_pirq, emuirq);\
     __ret ? radix_tree_ptr_to_int(__ret) : IRQ_UNBOUND;                 \
 })
-#define IRQ_UNBOUND -1
-#define IRQ_PT -2
-#define IRQ_MSI_EMU -3
+#define IRQ_UNBOUND (-1)
+#define IRQ_PT      (-2)
+#define IRQ_MSI_EMU (-3)
 
 bool cpu_has_pending_apic_eoi(void);
 
diff --git a/xen/arch/x86/usercopy.c b/xen/arch/x86/usercopy.c
index b8c2d1cc0bed..b0b55398e968 100644
--- a/xen/arch/x86/usercopy.c
+++ b/xen/arch/x86/usercopy.c
@@ -106,7 +106,7 @@ unsigned int copy_from_guest_ll(void *to, const void __user *from, unsigned int
     return n;
 }
 
-#if GUARD(1) + 0
+#if GUARD((1)) + 0
 
 /**
  * copy_to_guest_pv: - Copy a block of data into PV guest space.
-- 
2.34.1

