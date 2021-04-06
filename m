Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 536993555F1
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 16:01:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105986.202676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmH3-0005NI-Sg; Tue, 06 Apr 2021 14:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105986.202676; Tue, 06 Apr 2021 14:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmH3-0005Mu-PM; Tue, 06 Apr 2021 14:01:45 +0000
Received: by outflank-mailman (input) for mailman id 105986;
 Tue, 06 Apr 2021 14:01:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lTmH2-0005Mf-CT
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 14:01:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 064f3cdc-1ed3-49c2-832d-0e1228125673;
 Tue, 06 Apr 2021 14:01:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 488C5B1BC;
 Tue,  6 Apr 2021 14:01:42 +0000 (UTC)
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
X-Inumbo-ID: 064f3cdc-1ed3-49c2-832d-0e1228125673
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617717702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vEZ17NvnwSlKSweZ+wN2qQa/aenPa2meHi6XZJOo/ow=;
	b=B4MIKukkk9wf7G+VZI2BNpDegW/ZAbH99YjD5I0cIz+vq1jyqONPXHex3Oufol0t2fc1dt
	nKIs0KJn53sbqh3XZ8rVzVuC7VE04YUnvx8t4Q3t+0/sIrGxvKyK3cbC3FwMRTA72khhWg
	COTDsw9gcEOmWGvKX/Fp2HGstxg+pFM=
Subject: [PATCH v2 2/3] x86: slim down hypercall handling when !PV32
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bf79f745-078b-071d-cf01-dfede456041a@suse.com>
Message-ID: <d85736e6-bca9-de3a-328d-d727c327dbda@suse.com>
Date: Tue, 6 Apr 2021 16:01:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <bf79f745-078b-071d-cf01-dfede456041a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In such a build various of the compat handlers aren't needed. Don't
reference them from the hypercall table, and compile out those which
aren't needed for HVM. Also compile out switch_compat(), which has no
purpose in such a build.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -17,7 +17,8 @@ obj-bin-y += bzimage.init.o
 obj-bin-y += clear_page.o
 obj-bin-y += copy_page.o
 obj-y += cpuid.o
-obj-$(CONFIG_PV) += compat.o x86_64/compat.o
+obj-$(CONFIG_PV) += compat.o
+obj-$(CONFIG_PV32) += x86_64/compat.o
 obj-$(CONFIG_KEXEC) += crash.o
 obj-$(CONFIG_GDBSX) += debug.o
 obj-y += delay.o
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -121,7 +121,9 @@ static long hvm_physdev_op(int cmd, XEN_
 
 #define do_arch_1             paging_domctl_continuation
 
-static const hypercall_table_t hvm_hypercall_table[] = {
+static const struct {
+    hypercall_fn_t *native, *compat;
+} hvm_hypercall_table[] = {
     HVM_CALL(memory_op),
 #ifdef CONFIG_GRANT_TABLE
     HVM_CALL(grant_table_op),
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4498,7 +4498,9 @@ long do_update_va_mapping_otherdomain(un
 
     return rc;
 }
+#endif /* CONFIG_PV */
 
+#ifdef CONFIG_PV32
 int compat_update_va_mapping(unsigned int va, uint32_t lo, uint32_t hi,
                              unsigned int flags)
 {
@@ -4533,7 +4535,7 @@ int compat_update_va_mapping_otherdomain
 
     return rc;
 }
-#endif /* CONFIG_PV */
+#endif /* CONFIG_PV32 */
 
 typedef struct e820entry e820entry_t;
 DEFINE_XEN_GUEST_HANDLE(e820entry_t);
--- a/xen/arch/x86/pv/callback.c
+++ b/xen/arch/x86/pv/callback.c
@@ -19,12 +19,11 @@
 #include <xen/event.h>
 #include <xen/hypercall.h>
 #include <xen/guest_access.h>
-#include <compat/callback.h>
-#include <compat/nmi.h>
 
 #include <asm/shared.h>
 
 #include <public/callback.h>
+#include <public/nmi.h>
 
 static int register_guest_nmi_callback(unsigned long address)
 {
@@ -203,6 +202,11 @@ long do_set_callbacks(unsigned long even
     return 0;
 }
 
+#ifdef CONFIG_PV32
+
+#include <compat/callback.h>
+#include <compat/nmi.h>
+
 static long compat_register_guest_callback(struct compat_callback_register *reg)
 {
     long ret = 0;
@@ -343,6 +347,8 @@ long compat_set_callbacks(unsigned long
     return 0;
 }
 
+#endif /* CONFIG_PV32 */
+
 long do_set_trap_table(XEN_GUEST_HANDLE_PARAM(const_trap_info_t) traps)
 {
     struct trap_info cur;
@@ -388,6 +394,7 @@ long do_set_trap_table(XEN_GUEST_HANDLE_
     return rc;
 }
 
+#ifdef CONFIG_PV32
 int compat_set_trap_table(XEN_GUEST_HANDLE(trap_info_compat_t) traps)
 {
     struct vcpu *curr = current;
@@ -429,6 +436,7 @@ int compat_set_trap_table(XEN_GUEST_HAND
 
     return rc;
 }
+#endif
 
 long do_nmi_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
@@ -455,6 +463,7 @@ long do_nmi_op(unsigned int cmd, XEN_GUE
     return rc;
 }
 
+#ifdef CONFIG_PV32
 int compat_nmi_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     struct compat_nmi_callback cb;
@@ -479,6 +488,7 @@ int compat_nmi_op(unsigned int cmd, XEN_
 
     return rc;
 }
+#endif
 
 /*
  * Local variables:
--- a/xen/arch/x86/pv/descriptor-tables.c
+++ b/xen/arch/x86/pv/descriptor-tables.c
@@ -149,6 +149,8 @@ long do_set_gdt(XEN_GUEST_HANDLE_PARAM(x
     return ret;
 }
 
+#ifdef CONFIG_PV32
+
 int compat_set_gdt(XEN_GUEST_HANDLE_PARAM(uint) frame_list,
                    unsigned int entries)
 {
@@ -185,6 +187,18 @@ int compat_set_gdt(XEN_GUEST_HANDLE_PARA
     return ret;
 }
 
+int compat_update_descriptor(uint32_t pa_lo, uint32_t pa_hi,
+                             uint32_t desc_lo, uint32_t desc_hi)
+{
+    seg_desc_t d;
+
+    d.raw = ((uint64_t)desc_hi << 32) | desc_lo;
+
+    return do_update_descriptor(pa_lo | ((uint64_t)pa_hi << 32), d);
+}
+
+#endif /* CONFIG_PV32 */
+
 static bool check_descriptor(const struct domain *dom, seg_desc_t *d)
 {
     unsigned int a = d->a, b = d->b, cs, dpl;
@@ -334,16 +348,6 @@ long do_update_descriptor(uint64_t gaddr
     return ret;
 }
 
-int compat_update_descriptor(uint32_t pa_lo, uint32_t pa_hi,
-                             uint32_t desc_lo, uint32_t desc_hi)
-{
-    seg_desc_t d;
-
-    d.raw = ((uint64_t)desc_hi << 32) | desc_lo;
-
-    return do_update_descriptor(pa_lo | ((uint64_t)pa_hi << 32), d);
-}
-
 /*
  * Local variables:
  * mode: C
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -212,6 +212,7 @@ unsigned long pv_make_cr4(const struct v
     return cr4;
 }
 
+#ifdef CONFIG_PV32
 int switch_compat(struct domain *d)
 {
     struct vcpu *v;
@@ -256,6 +257,7 @@ int switch_compat(struct domain *d)
 
     return rc;
 }
+#endif
 
 static int pv_create_gdt_ldt_l1tab(struct vcpu *v)
 {
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -25,12 +25,18 @@
 #include <xen/trace.h>
 #include <irq_vectors.h>
 
+#ifdef CONFIG_PV32
 #define HYPERCALL(x)                                                \
     [ __HYPERVISOR_ ## x ] = { (hypercall_fn_t *) do_ ## x,         \
                                (hypercall_fn_t *) do_ ## x }
 #define COMPAT_CALL(x)                                              \
     [ __HYPERVISOR_ ## x ] = { (hypercall_fn_t *) do_ ## x,         \
                                (hypercall_fn_t *) compat_ ## x }
+#else
+#define HYPERCALL(x)                                                \
+    [ __HYPERVISOR_ ## x ] = { (hypercall_fn_t *) do_ ## x }
+#define COMPAT_CALL(x) HYPERCALL(x)
+#endif
 
 #define do_arch_1             paging_domctl_continuation
 
@@ -176,6 +182,7 @@ void pv_hypercall(struct cpu_user_regs *
         }
 #endif
     }
+#ifdef CONFIG_PV32
     else
     {
         unsigned int ebx = regs->ebx;
@@ -225,6 +232,7 @@ void pv_hypercall(struct cpu_user_regs *
         }
 #endif
     }
+#endif /* CONFIG_PV32 */
 
     /*
      * PV guests use SYSCALL or INT $0x82 to make a hypercall, both of which
@@ -255,7 +263,7 @@ enum mc_disposition arch_do_multicall_ca
         else
             call->result = -ENOSYS;
     }
-#ifdef CONFIG_COMPAT
+#ifdef CONFIG_PV32
     else
     {
         struct compat_multicall_entry *call = &state->compat_call;
--- a/xen/arch/x86/pv/iret.c
+++ b/xen/arch/x86/pv/iret.c
@@ -104,6 +104,7 @@ unsigned long do_iret(void)
     return 0;
 }
 
+#ifdef CONFIG_PV32
 unsigned int compat_iret(void)
 {
     struct cpu_user_regs *regs = guest_cpu_user_regs();
@@ -223,6 +224,7 @@ unsigned int compat_iret(void)
      */
     return regs->eax;
 }
+#endif
 
 /*
  * Local variables:
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -255,13 +255,17 @@ void __init pv_shim_setup_dom(struct dom
      */
     rw_pv_hypercall_table = __va(__pa(pv_hypercall_table));
     rw_pv_hypercall_table[__HYPERVISOR_event_channel_op].native =
-        rw_pv_hypercall_table[__HYPERVISOR_event_channel_op].compat =
         (hypercall_fn_t *)pv_shim_event_channel_op;
-
     rw_pv_hypercall_table[__HYPERVISOR_grant_table_op].native =
-        rw_pv_hypercall_table[__HYPERVISOR_grant_table_op].compat =
         (hypercall_fn_t *)pv_shim_grant_table_op;
 
+#ifdef CONFIG_PV32
+    rw_pv_hypercall_table[__HYPERVISOR_event_channel_op].compat =
+        (hypercall_fn_t *)pv_shim_event_channel_op;
+    rw_pv_hypercall_table[__HYPERVISOR_grant_table_op].compat =
+        (hypercall_fn_t *)pv_shim_grant_table_op;
+#endif
+
     guest = d;
 
     /*
--- a/xen/include/asm-x86/compat.h
+++ b/xen/include/asm-x86/compat.h
@@ -6,3 +6,11 @@
 
 typedef uint32_t compat_ptr_t;
 typedef unsigned long full_ptr_t;
+
+struct domain;
+#ifdef CONFIG_PV32
+int switch_compat(struct domain *);
+#else
+#include <xen/errno.h>
+static inline int switch_compat(struct domain *d) { return -EOPNOTSUPP; }
+#endif
--- a/xen/include/asm-x86/hypercall.h
+++ b/xen/include/asm-x86/hypercall.h
@@ -16,7 +16,10 @@ typedef unsigned long hypercall_fn_t(
     unsigned long, unsigned long, unsigned long);
 
 typedef struct {
-    hypercall_fn_t *native, *compat;
+    hypercall_fn_t *native;
+#ifdef CONFIG_PV32
+    hypercall_fn_t *compat;
+#endif
 } hypercall_table_t;
 
 typedef struct {
--- a/xen/include/xen/compat.h
+++ b/xen/include/xen/compat.h
@@ -227,9 +227,6 @@ void xlat_start_info(struct start_info *
 struct vcpu_runstate_info;
 void xlat_vcpu_runstate_info(struct vcpu_runstate_info *);
 
-struct domain;
-int switch_compat(struct domain *);
-
 #else
 
 #define compat_handle_is_null(hnd) 0


