Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0F0441D52
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 16:21:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219250.380054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ7B-0003pO-I3; Mon, 01 Nov 2021 15:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219250.380054; Mon, 01 Nov 2021 15:20:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ7A-0003gv-Va; Mon, 01 Nov 2021 15:20:48 +0000
Received: by outflank-mailman (input) for mailman id 219250;
 Mon, 01 Nov 2021 15:20:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rWtG=PU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mhZ78-0008DB-Na
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 15:20:46 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39c28ddb-3b27-11ec-8548-12813bfff9fa;
 Mon, 01 Nov 2021 15:20:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 254961FD73;
 Mon,  1 Nov 2021 15:20:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C7CC113B13;
 Mon,  1 Nov 2021 15:20:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ePyDL7MFgGFzNwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 01 Nov 2021 15:20:19 +0000
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
X-Inumbo-ID: 39c28ddb-3b27-11ec-8548-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635780020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tmlPc9auNVfUliuSzcaGSKuNe/JhODB1awWiSXuNbC4=;
	b=YlKJxlc17DJj2WyfegAb5IsT9t69rbDEhABdhQQbw7mSW8M3Xnyvz8/N82Fmg+PRAslo4e
	e41o8yiW3ufMfcRb3gEPRDjq9YKul3lqnuAN4AL1F4AbZvJbcShFkbgF089PsMzZKbSvTQ
	uw8C6hmgUxpKHpu0DLSPKmpSwe9V9IA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v2 03/15] xen: harmonize return types of hypercall handlers
Date: Mon,  1 Nov 2021 16:20:03 +0100
Message-Id: <20211101152015.28488-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211101152015.28488-1-jgross@suse.com>
References: <20211101152015.28488-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today most hypercall handlers have a return type of long, while the
compat ones return an int. There are a few exceptions from that rule,
however.

Get rid of the exceptions by letting compat handlers always return int
and others always return long.

For the compat hvm case use eax instead of rax for the stored result as
it should have been from the beginning.

Additionally move some prototypes to include/asm-x86/hypercall.h
as they are x86 specific. Move the do_physdev_op() prototype from both
architecture dependant headers to the common one. Move the
compat_platform_op() prototype to the common header.

Switch some non style compliant types (u32, s32, s64) to style compliant
ones.

Rename paging_domctl_continuation() to do_paging_domctl_cont() and add
a matching define for the associated hypercall.

Make do_callback_op() and compat_callback_op() more similar by adding
the const attribute to compat_callback_op()'s 2nd parameter.

Change the type of the cmd parameter for [do|compat]_kexec_op() to
unsigned int, as this is more appropriate for the compat case.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- rework platform_op compat handling (Jan Beulich)
---
 xen/arch/arm/physdev.c                   |  2 +-
 xen/arch/x86/domctl.c                    |  4 +--
 xen/arch/x86/hvm/hypercall.c             |  8 ++---
 xen/arch/x86/hypercall.c                 |  2 +-
 xen/arch/x86/mm/paging.c                 |  3 +-
 xen/arch/x86/pv/callback.c               | 20 +++++------
 xen/arch/x86/pv/emul-priv-op.c           |  2 +-
 xen/arch/x86/pv/hypercall.c              |  5 +--
 xen/arch/x86/pv/iret.c                   |  4 +--
 xen/arch/x86/pv/misc-hypercalls.c        | 14 +++++---
 xen/arch/x86/x86_64/platform_hypercall.c |  3 +-
 xen/common/argo.c                        | 12 +++----
 xen/common/kexec.c                       |  6 ++--
 xen/include/asm-arm/hypercall.h          |  1 -
 xen/include/asm-x86/hypercall.h          | 43 +++++++++++-------------
 xen/include/asm-x86/paging.h             |  3 --
 xen/include/xen/hypercall.h              | 26 +++++++-------
 17 files changed, 75 insertions(+), 83 deletions(-)

diff --git a/xen/arch/arm/physdev.c b/xen/arch/arm/physdev.c
index f9aa274dda..5a7593fa8f 100644
--- a/xen/arch/arm/physdev.c
+++ b/xen/arch/arm/physdev.c
@@ -11,7 +11,7 @@
 #include <xen/hypercall.h>
 
 
-int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+long do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
 #ifdef CONFIG_HAS_PCI
     return pci_physdev_op(cmd, arg);
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 7d102e0647..b01ea81373 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -221,8 +221,8 @@ long arch_do_domctl(
     case XEN_DOMCTL_shadow_op:
         ret = paging_domctl(d, &domctl->u.shadow_op, u_domctl, 0);
         if ( ret == -ERESTART )
-            return hypercall_create_continuation(__HYPERVISOR_arch_1,
-                                                 "h", u_domctl);
+            return hypercall_create_continuation(
+                       __HYPERVISOR_paging_domctl_cont, "h", u_domctl);
         copyback = true;
         break;
 
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index f0321c6cb4..5be1050453 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -120,8 +120,6 @@ static long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     [ __HYPERVISOR_ ## x ] = { (hypercall_fn_t *) do_ ## x,  \
                                (hypercall_fn_t *) compat_ ## x }
 
-#define do_arch_1             paging_domctl_continuation
-
 static const struct {
     hypercall_fn_t *native, *compat;
 } hvm_hypercall_table[] = {
@@ -154,11 +152,9 @@ static const struct {
 #ifdef CONFIG_HYPFS
     HYPERCALL(hypfs_op),
 #endif
-    HYPERCALL(arch_1)
+    HYPERCALL(paging_domctl_cont)
 };
 
-#undef do_arch_1
-
 #undef HYPERCALL
 #undef HVM_CALL
 #undef COMPAT_CALL
@@ -296,7 +292,7 @@ int hvm_hypercall(struct cpu_user_regs *regs)
 #endif
 
         curr->hcall_compat = true;
-        regs->rax = hvm_hypercall_table[eax].compat(ebx, ecx, edx, esi, edi);
+        regs->eax = hvm_hypercall_table[eax].compat(ebx, ecx, edx, esi, edi);
         curr->hcall_compat = false;
 
 #ifndef NDEBUG
diff --git a/xen/arch/x86/hypercall.c b/xen/arch/x86/hypercall.c
index 2370d31d3f..07e1a45ef5 100644
--- a/xen/arch/x86/hypercall.c
+++ b/xen/arch/x86/hypercall.c
@@ -75,7 +75,7 @@ const hypercall_args_t hypercall_args_table[NR_hypercalls] =
     ARGS(dm_op, 3),
     ARGS(hypfs_op, 5),
     ARGS(mca, 1),
-    ARGS(arch_1, 1),
+    ARGS(paging_domctl_cont, 1),
 };
 
 #undef COMP
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index dd6b2bdf6f..6cc2636bf4 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -21,6 +21,7 @@
 
 #include <xen/init.h>
 #include <xen/guest_access.h>
+#include <xen/hypercall.h>
 #include <asm/paging.h>
 #include <asm/shadow.h>
 #include <asm/p2m.h>
@@ -756,7 +757,7 @@ int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
         return shadow_domctl(d, sc, u_domctl);
 }
 
-long paging_domctl_continuation(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
+long do_paging_domctl_cont(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
     struct xen_domctl op;
     struct domain *d;
diff --git a/xen/arch/x86/pv/callback.c b/xen/arch/x86/pv/callback.c
index 42a6aa0831..6d60263dbc 100644
--- a/xen/arch/x86/pv/callback.c
+++ b/xen/arch/x86/pv/callback.c
@@ -207,9 +207,9 @@ long do_set_callbacks(unsigned long event_address,
 #include <compat/callback.h>
 #include <compat/nmi.h>
 
-static long compat_register_guest_callback(struct compat_callback_register *reg)
+static int compat_register_guest_callback(struct compat_callback_register *reg)
 {
-    long ret = 0;
+    int ret = 0;
     struct vcpu *curr = current;
 
     fixup_guest_code_selector(curr->domain, reg->address.cs);
@@ -256,10 +256,10 @@ static long compat_register_guest_callback(struct compat_callback_register *reg)
     return ret;
 }
 
-static long compat_unregister_guest_callback(
+static int compat_unregister_guest_callback(
     struct compat_callback_unregister *unreg)
 {
-    long ret;
+    int ret;
 
     switch ( unreg->type )
     {
@@ -283,9 +283,9 @@ static long compat_unregister_guest_callback(
     return ret;
 }
 
-long compat_callback_op(int cmd, XEN_GUEST_HANDLE(void) arg)
+int compat_callback_op(int cmd, XEN_GUEST_HANDLE(const_void) arg)
 {
-    long ret;
+    int ret;
 
     switch ( cmd )
     {
@@ -321,10 +321,10 @@ long compat_callback_op(int cmd, XEN_GUEST_HANDLE(void) arg)
     return ret;
 }
 
-long compat_set_callbacks(unsigned long event_selector,
-                          unsigned long event_address,
-                          unsigned long failsafe_selector,
-                          unsigned long failsafe_address)
+int compat_set_callbacks(unsigned long event_selector,
+                         unsigned long event_address,
+                         unsigned long failsafe_selector,
+                         unsigned long failsafe_address)
 {
     struct compat_callback_register event = {
         .type = CALLBACKTYPE_event,
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 7f4279a051..4982e58e71 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -22,12 +22,12 @@
 #include <xen/domain_page.h>
 #include <xen/event.h>
 #include <xen/guest_access.h>
+#include <xen/hypercall.h>
 #include <xen/iocap.h>
 
 #include <asm/amd.h>
 #include <asm/debugreg.h>
 #include <asm/hpet.h>
-#include <asm/hypercall.h>
 #include <asm/mc146818rtc.h>
 #include <asm/pv/domain.h>
 #include <asm/pv/trace.h>
diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index 16a77e3a35..7e99dbda34 100644
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -40,8 +40,6 @@
 #define COMPAT_CALL(x) HYPERCALL(x)
 #endif
 
-#define do_arch_1             paging_domctl_continuation
-
 const pv_hypercall_table_t pv_hypercall_table[] = {
     COMPAT_CALL(set_trap_table),
     HYPERCALL(mmu_update),
@@ -102,11 +100,10 @@ const pv_hypercall_table_t pv_hypercall_table[] = {
 #endif
     HYPERCALL(mca),
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
-    HYPERCALL(arch_1),
+    HYPERCALL(paging_domctl_cont),
 #endif
 };
 
-#undef do_arch_1
 #undef COMPAT_CALL
 #undef HYPERCALL
 
diff --git a/xen/arch/x86/pv/iret.c b/xen/arch/x86/pv/iret.c
index 29a2f7cc45..90946c4629 100644
--- a/xen/arch/x86/pv/iret.c
+++ b/xen/arch/x86/pv/iret.c
@@ -48,7 +48,7 @@ static void async_exception_cleanup(struct vcpu *curr)
         curr->arch.async_exception_state(trap).old_mask;
 }
 
-unsigned long do_iret(void)
+long do_iret(void)
 {
     struct cpu_user_regs *regs = guest_cpu_user_regs();
     struct iret_context iret_saved;
@@ -105,7 +105,7 @@ unsigned long do_iret(void)
 }
 
 #ifdef CONFIG_PV32
-unsigned int compat_iret(void)
+int compat_iret(void)
 {
     struct cpu_user_regs *regs = guest_cpu_user_regs();
     struct vcpu *v = current;
diff --git a/xen/arch/x86/pv/misc-hypercalls.c b/xen/arch/x86/pv/misc-hypercalls.c
index 5dade24726..aaaf70eb63 100644
--- a/xen/arch/x86/pv/misc-hypercalls.c
+++ b/xen/arch/x86/pv/misc-hypercalls.c
@@ -28,12 +28,16 @@ long do_set_debugreg(int reg, unsigned long value)
     return set_debugreg(current, reg, value);
 }
 
-unsigned long do_get_debugreg(int reg)
+long do_get_debugreg(int reg)
 {
-    unsigned long val;
-    int res = x86emul_read_dr(reg, &val, NULL);
-
-    return res == X86EMUL_OKAY ? val : -ENODEV;
+    /* Avoid implementation defined behavior casting unsigned long to long. */
+    union {
+        unsigned long val;
+        long ret;
+    } u;
+    int res = x86emul_read_dr(reg, &u.val, NULL);
+
+    return res == X86EMUL_OKAY ? u.ret : -ENODEV;
 }
 
 long do_fpu_taskswitch(int set)
diff --git a/xen/arch/x86/x86_64/platform_hypercall.c b/xen/arch/x86/x86_64/platform_hypercall.c
index fbba893a47..eca48e9335 100644
--- a/xen/arch/x86/x86_64/platform_hypercall.c
+++ b/xen/arch/x86/x86_64/platform_hypercall.c
@@ -4,10 +4,11 @@
 
 EMIT_FILE;
 
+#include <xen/hypercall.h>
+#include <xen/types.h>
 #include <xen/lib.h>
 #include <compat/platform.h>
 
-DEFINE_XEN_GUEST_HANDLE(compat_platform_op_t);
 #define xen_platform_op     compat_platform_op
 #define xen_platform_op_t   compat_platform_op_t
 #define do_platform_op(x)   compat_platform_op(_##x)
diff --git a/xen/common/argo.c b/xen/common/argo.c
index eaea7ba888..bf6aac7655 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -2207,13 +2207,13 @@ do_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg1,
 }
 
 #ifdef CONFIG_COMPAT
-long
-compat_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg1,
-               XEN_GUEST_HANDLE_PARAM(void) arg2, unsigned long arg3,
-               unsigned long arg4)
+int compat_argo_op(unsigned int cmd,
+                   XEN_GUEST_HANDLE_PARAM(void) arg1,
+                   XEN_GUEST_HANDLE_PARAM(void) arg2,
+                   unsigned long arg3, unsigned long arg4)
 {
     struct domain *currd = current->domain;
-    long rc;
+    int rc;
     xen_argo_send_addr_t send_addr;
     xen_argo_iov_t iovs[XEN_ARGO_MAXIOV];
     compat_argo_iov_t compat_iovs[XEN_ARGO_MAXIOV];
@@ -2267,7 +2267,7 @@ compat_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg1,
 
     rc = sendv(currd, &send_addr.src, &send_addr.dst, iovs, niov, arg4);
  out:
-    argo_dprintk("<-compat_argo_op(%u)=%ld\n", cmd, rc);
+    argo_dprintk("<-compat_argo_op(%u)=%d\n", cmd, rc);
 
     return rc;
 }
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index c63db618a7..d7373233e1 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -1213,7 +1213,7 @@ static int kexec_status(XEN_GUEST_HANDLE_PARAM(void) uarg)
     return !!test_bit(bit, &kexec_flags);
 }
 
-static int do_kexec_op_internal(unsigned long op,
+static int do_kexec_op_internal(unsigned int op,
                                 XEN_GUEST_HANDLE_PARAM(void) uarg,
                                 bool_t compat)
 {
@@ -1265,13 +1265,13 @@ static int do_kexec_op_internal(unsigned long op,
     return ret;
 }
 
-long do_kexec_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) uarg)
+long do_kexec_op(unsigned int op, XEN_GUEST_HANDLE_PARAM(void) uarg)
 {
     return do_kexec_op_internal(op, uarg, 0);
 }
 
 #ifdef CONFIG_COMPAT
-int compat_kexec_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) uarg)
+int compat_kexec_op(unsigned int op, XEN_GUEST_HANDLE_PARAM(void) uarg)
 {
     return do_kexec_op_internal(op, uarg, 1);
 }
diff --git a/xen/include/asm-arm/hypercall.h b/xen/include/asm-arm/hypercall.h
index 9fd13c6b2c..cadafd76c7 100644
--- a/xen/include/asm-arm/hypercall.h
+++ b/xen/include/asm-arm/hypercall.h
@@ -2,7 +2,6 @@
 #define __ASM_ARM_HYPERCALL_H__
 
 #include <public/domctl.h> /* for arch_do_domctl */
-int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 
 long subarch_do_domctl(struct xen_domctl *domctl, struct domain *d,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
diff --git a/xen/include/asm-x86/hypercall.h b/xen/include/asm-x86/hypercall.h
index e614f7c78c..9c0981defd 100644
--- a/xen/include/asm-x86/hypercall.h
+++ b/xen/include/asm-x86/hypercall.h
@@ -11,6 +11,8 @@
 #include <public/arch-x86/xen-mca.h> /* for do_mca */
 #include <asm/paging.h>
 
+#define __HYPERVISOR_paging_domctl_cont __HYPERVISOR_arch_1
+
 typedef unsigned long hypercall_fn_t(
     unsigned long, unsigned long, unsigned long,
     unsigned long, unsigned long);
@@ -88,7 +90,7 @@ do_set_debugreg(
     int reg,
     unsigned long value);
 
-extern unsigned long
+extern long
 do_get_debugreg(
     int reg);
 
@@ -102,17 +104,13 @@ do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc);
 extern long
 do_update_va_mapping(
     unsigned long va,
-    u64 val64,
+    uint64_t val64,
     unsigned long flags);
 
-extern long
-do_physdev_op(
-    int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
-
 extern long
 do_update_va_mapping_otherdomain(
     unsigned long va,
-    u64 val64,
+    uint64_t val64,
     unsigned long flags,
     domid_t domid);
 
@@ -126,7 +124,7 @@ do_mmuext_op(
 extern long do_callback_op(
     int cmd, XEN_GUEST_HANDLE_PARAM(const_void) arg);
 
-extern unsigned long
+extern long
 do_iret(
     void);
 
@@ -141,16 +139,18 @@ do_set_segment_base(
     unsigned int which,
     unsigned long base);
 
+long do_nmi_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
+
+long do_xenpmu_op(unsigned int op,
+                  XEN_GUEST_HANDLE_PARAM(xen_pmu_params_t) arg);
+
+long do_paging_domctl_cont(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
+
 #ifdef CONFIG_COMPAT
 
 #include <compat/arch-x86/xen.h>
 #include <compat/physdev.h>
 
-extern int
-compat_physdev_op(
-    int cmd,
-    XEN_GUEST_HANDLE_PARAM(void) arg);
-
 extern int
 compat_common_vcpu_op(
     int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
@@ -161,17 +161,14 @@ extern int compat_mmuext_op(
     XEN_GUEST_HANDLE_PARAM(uint) pdone,
     unsigned int foreigndom);
 
-extern int compat_platform_op(
-    XEN_GUEST_HANDLE_PARAM(void) u_xenpf_op);
-
-extern long compat_callback_op(
-    int cmd, XEN_GUEST_HANDLE(void) arg);
+extern int compat_callback_op(
+    int cmd, XEN_GUEST_HANDLE(const_void) arg);
 
 extern int compat_update_va_mapping(
-    unsigned int va, u32 lo, u32 hi, unsigned int flags);
+    unsigned int va, uint32_t lo, uint32_t hi, unsigned int flags);
 
 extern int compat_update_va_mapping_otherdomain(
-    unsigned int va, u32 lo, u32 hi, unsigned int flags, domid_t domid);
+    unsigned int va, uint32_t lo, uint32_t hi, unsigned int flags, domid_t domid);
 
 DEFINE_XEN_GUEST_HANDLE(trap_info_compat_t);
 extern int compat_set_trap_table(XEN_GUEST_HANDLE(trap_info_compat_t) traps);
@@ -180,13 +177,13 @@ extern int compat_set_gdt(
     XEN_GUEST_HANDLE_PARAM(uint) frame_list, unsigned int entries);
 
 extern int compat_update_descriptor(
-    u32 pa_lo, u32 pa_hi, u32 desc_lo, u32 desc_hi);
+    uint32_t pa_lo, uint32_t pa_hi, uint32_t desc_lo, uint32_t desc_hi);
 
-extern unsigned int compat_iret(void);
+extern int compat_iret(void);
 
 extern int compat_nmi_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 
-extern long compat_set_callbacks(
+extern int compat_set_callbacks(
     unsigned long event_selector, unsigned long event_address,
     unsigned long failsafe_selector, unsigned long failsafe_address);
 
diff --git a/xen/include/asm-x86/paging.h b/xen/include/asm-x86/paging.h
index fa22558e2e..f6e8808b0a 100644
--- a/xen/include/asm-x86/paging.h
+++ b/xen/include/asm-x86/paging.h
@@ -236,9 +236,6 @@ int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
                   XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl,
                   bool_t resuming);
 
-/* Helper hypercall for dealing with continuations. */
-long paging_domctl_continuation(XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
-
 /* Call when destroying a vcpu/domain */
 void paging_vcpu_teardown(struct vcpu *v);
 int paging_teardown(struct domain *d);
diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
index 30558d3c61..9266bc86e9 100644
--- a/xen/include/xen/hypercall.h
+++ b/xen/include/xen/hypercall.h
@@ -114,11 +114,6 @@ common_vcpu_op(int cmd,
     struct vcpu *v,
     XEN_GUEST_HANDLE_PARAM(void) arg);
 
-extern long
-do_nmi_op(
-    unsigned int cmd,
-    XEN_GUEST_HANDLE_PARAM(void) arg);
-
 extern long
 do_hvm_op(
     unsigned long op,
@@ -126,13 +121,15 @@ do_hvm_op(
 
 extern long
 do_kexec_op(
-    unsigned long op,
+    unsigned int op,
     XEN_GUEST_HANDLE_PARAM(void) uarg);
 
 extern long
 do_xsm_op(
     XEN_GUEST_HANDLE_PARAM(void) u_xsm_op);
 
+long do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
+
 #ifdef CONFIG_ARGO
 extern long do_argo_op(
     unsigned int cmd,
@@ -145,9 +142,6 @@ extern long do_argo_op(
 extern long
 do_xenoprof_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
 
-extern long
-do_xenpmu_op(unsigned int op, XEN_GUEST_HANDLE_PARAM(xen_pmu_params_t) arg);
-
 extern long
 do_dm_op(
     domid_t domid,
@@ -198,21 +192,27 @@ compat_sched_op(
 
 extern int
 compat_set_timer_op(
-    u32 lo,
-    s32 hi);
+    uint32_t lo,
+    int32_t hi);
 
 extern int compat_xsm_op(
     XEN_GUEST_HANDLE_PARAM(void) op);
 
-extern int compat_kexec_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) uarg);
+extern int compat_kexec_op(unsigned int op, XEN_GUEST_HANDLE_PARAM(void) uarg);
 
 DEFINE_XEN_GUEST_HANDLE(multicall_entry_compat_t);
 extern int compat_multicall(
     XEN_GUEST_HANDLE_PARAM(multicall_entry_compat_t) call_list,
     uint32_t nr_calls);
 
+int compat_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
+
+typedef struct compat_platform_op compat_platform_op_t;
+DEFINE_XEN_GUEST_HANDLE(compat_platform_op_t);
+int compat_platform_op(XEN_GUEST_HANDLE_PARAM(compat_platform_op_t) u_xenpf_op);
+
 #ifdef CONFIG_ARGO
-extern long compat_argo_op(
+extern int compat_argo_op(
     unsigned int cmd,
     XEN_GUEST_HANDLE_PARAM(void) arg1,
     XEN_GUEST_HANDLE_PARAM(void) arg2,
-- 
2.26.2


