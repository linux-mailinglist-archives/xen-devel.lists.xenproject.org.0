Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 133697CDF9D
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 16:26:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618620.962515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7VB-0002MT-SP; Wed, 18 Oct 2023 14:26:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618620.962515; Wed, 18 Oct 2023 14:26:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7VB-0002If-Oi; Wed, 18 Oct 2023 14:26:25 +0000
Received: by outflank-mailman (input) for mailman id 618620;
 Wed, 18 Oct 2023 14:26:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOie=GA=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qt7VA-0001YD-JS
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 14:26:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ff7eb0a-6dc2-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 16:26:22 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.127.233])
 by support.bugseng.com (Postfix) with ESMTPSA id DEC424EE0742;
 Wed, 18 Oct 2023 16:26:21 +0200 (CEST)
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
X-Inumbo-ID: 4ff7eb0a-6dc2-11ee-9b0e-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 3/7] x86/domain: address violations of MISRA C:2012 Rule 8.2
Date: Wed, 18 Oct 2023 16:25:56 +0200
Message-Id: <95f9938db062ac2ef10e10790fd12a987eaa90b1.1697638486.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697638486.git.federico.serafini@bugseng.com>
References: <cover.1697638486.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/domain.h | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 619e667938..d033224d2b 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -74,20 +74,20 @@ struct mapcache_domain {
     unsigned long *garbage;
 };
 
-int mapcache_domain_init(struct domain *);
-int mapcache_vcpu_init(struct vcpu *);
-void mapcache_override_current(struct vcpu *);
+int mapcache_domain_init(struct domain *d);
+int mapcache_vcpu_init(struct vcpu *v);
+void mapcache_override_current(struct vcpu *v);
 
 /* x86/64: toggle guest between kernel and user modes. */
-void toggle_guest_mode(struct vcpu *);
+void toggle_guest_mode(struct vcpu *v);
 /* x86/64: toggle guest page tables between kernel and user modes. */
-void toggle_guest_pt(struct vcpu *);
+void toggle_guest_pt(struct vcpu *v);
 
 /*
  * Initialise a hypercall-transfer page. The given pointer must be mapped
  * in Xen virtual address space (accesses are not validated or checked).
  */
-void init_hypercall_page(struct domain *d, void *);
+void init_hypercall_page(struct domain *d, void *ptr);
 
 /************************************************/
 /*          shadow paging extension             */
@@ -342,8 +342,8 @@ struct arch_domain
     struct page_list_head relmem_list;
 
     const struct arch_csw {
-        void (*from)(struct vcpu *);
-        void (*to)(struct vcpu *);
+        void (*from)(struct vcpu *v);
+        void (*to)(struct vcpu *v);
         void noreturn (*tail)(void);
     } *ctxt_switch;
 
@@ -690,12 +690,12 @@ void update_guest_memory_policy(struct vcpu *v,
 
 void domain_cpu_policy_changed(struct domain *d);
 
-bool update_secondary_system_time(struct vcpu *,
-                                  struct vcpu_time_info *);
-void force_update_secondary_system_time(struct vcpu *,
-                                        struct vcpu_time_info *);
+bool update_secondary_system_time(struct vcpu *v,
+                                  struct vcpu_time_info *u);
+void force_update_secondary_system_time(struct vcpu *v,
+                                        struct vcpu_time_info *map);
 
-void vcpu_show_registers(const struct vcpu *);
+void vcpu_show_registers(const struct vcpu *v);
 
 static inline struct vcpu_guest_context *alloc_vcpu_guest_context(void)
 {
-- 
2.34.1


