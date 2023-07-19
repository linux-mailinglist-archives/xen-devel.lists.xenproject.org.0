Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB70E759030
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 10:24:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565653.883991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM2Tv-0003jW-Dt; Wed, 19 Jul 2023 08:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565653.883991; Wed, 19 Jul 2023 08:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM2Tv-0003gI-B7; Wed, 19 Jul 2023 08:24:23 +0000
Received: by outflank-mailman (input) for mailman id 565653;
 Wed, 19 Jul 2023 08:24:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8bnZ=DF=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qM2Tt-0003gC-Hd
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 08:24:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a880fdd2-260d-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 10:24:20 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.163.72.116])
 by support.bugseng.com (Postfix) with ESMTPSA id 8359E4EE0C89;
 Wed, 19 Jul 2023 10:24:18 +0200 (CEST)
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
X-Inumbo-ID: a880fdd2-260d-11ee-b23a-6b7b168915f2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN PATCH] x86: I/O emulation: fix violations of MISRA C:2012 Rules 8.2 and 8.3
Date: Wed, 19 Jul 2023 10:24:10 +0200
Message-Id: <b6ebf3a49de027981505da63aef594cb0dc42ead.1689691260.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Give a name to unnamed parameters thus fixing violations of
MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
named parameters").
Keep consistency between parameter names used in function declarations
and names used in the corresponding function definitions thus fixing
violations of MISRA C:2012 Rule 8.3 ("All declarations of an object or
function shall use the same names and type qualifiers").

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/hvm/emulate.h |  8 ++++----
 xen/arch/x86/include/asm/hvm/io.h      | 14 +++++++-------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/emulate.h b/xen/arch/x86/include/asm/hvm/emulate.h
index d8ba2df4e4..398d0db078 100644
--- a/xen/arch/x86/include/asm/hvm/emulate.h
+++ b/xen/arch/x86/include/asm/hvm/emulate.h
@@ -121,12 +121,12 @@ static inline void hvmemul_cache_destroy(struct vcpu *v)
 {
     XFREE(v->arch.hvm.hvm_io.cache);
 }
-bool hvmemul_read_cache(const struct vcpu *, paddr_t gpa,
+bool hvmemul_read_cache(const struct vcpu *v, paddr_t gpa,
                         void *buffer, unsigned int size);
-void hvmemul_write_cache(const struct vcpu *, paddr_t gpa,
+void hvmemul_write_cache(const struct vcpu *v, paddr_t gpa,
                          const void *buffer, unsigned int size);
-unsigned int hvmemul_cache_disable(struct vcpu *);
-void hvmemul_cache_restore(struct vcpu *, unsigned int token);
+unsigned int hvmemul_cache_disable(struct vcpu *v);
+void hvmemul_cache_restore(struct vcpu *v, unsigned int token);
 /* For use in ASSERT()s only: */
 static inline bool hvmemul_cache_disabled(struct vcpu *v)
 {
diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
index 8df33eb6cc..e5225e75ef 100644
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -46,17 +46,17 @@ struct hvm_io_handler {
     uint8_t type;
 };
 
-typedef int (*hvm_io_read_t)(const struct hvm_io_handler *,
+typedef int (*hvm_io_read_t)(const struct hvm_io_handler *handler,
                              uint64_t addr,
                              uint32_t size,
                              uint64_t *data);
-typedef int (*hvm_io_write_t)(const struct hvm_io_handler *,
+typedef int (*hvm_io_write_t)(const struct hvm_io_handler *handler,
                               uint64_t addr,
                               uint32_t size,
                               uint64_t data);
-typedef bool_t (*hvm_io_accept_t)(const struct hvm_io_handler *,
+typedef bool_t (*hvm_io_accept_t)(const struct hvm_io_handler *handler,
                                   const ioreq_t *p);
-typedef void (*hvm_io_complete_t)(const struct hvm_io_handler *);
+typedef void (*hvm_io_complete_t)(const struct hvm_io_handler *handler);
 
 struct hvm_io_ops {
     hvm_io_accept_t   accept;
@@ -87,11 +87,11 @@ bool relocate_portio_handler(
 
 void send_timeoffset_req(unsigned long timeoff);
 bool handle_mmio_with_translation(unsigned long gla, unsigned long gpfn,
-                                  struct npfec);
+                                  struct npfec access);
 bool handle_pio(uint16_t port, unsigned int size, int dir);
 void hvm_interrupt_post(struct vcpu *v, int vector, int type);
-void hvm_dpci_eoi(struct domain *d, unsigned int guest_irq);
-void msix_write_completion(struct vcpu *);
+void hvm_dpci_eoi(struct domain *d, unsigned int guest_gsi);
+void msix_write_completion(struct vcpu *v);
 
 #ifdef CONFIG_HVM
 void msixtbl_init(struct domain *d);
-- 
2.34.1


