Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 183501B2A26
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 16:39:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQu3Q-0004PW-MJ; Tue, 21 Apr 2020 14:39:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OiHr=6F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQu3O-0004PR-I5
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 14:39:14 +0000
X-Inumbo-ID: de836d06-83dd-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de836d06-83dd-11ea-b58d-bc764e2007e4;
 Tue, 21 Apr 2020 14:39:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ECC0AAEE6;
 Tue, 21 Apr 2020 14:39:11 +0000 (UTC)
Subject: [PATCH v3 1/2] x86/HVM: expose VM assist hypercall
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cb2dd3ad-2f38-1576-7743-7525e77704b5@suse.com>
Message-ID: <5ed6b8a1-1f05-c24b-b3a8-d170a315d92a@suse.com>
Date: Tue, 21 Apr 2020 16:39:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <cb2dd3ad-2f38-1576-7743-7525e77704b5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In preparation for the addition of VMASST_TYPE_runstate_update_flag
commit 72c538cca957 ("arm: add support for vm_assist hypercall") enabled
the hypercall for Arm. I consider it not logical that it then isn't also
exposed to x86 HVM guests (with the same single feature permitted to be
enabled as Arm has); Linux actually tries to use it afaict.

Rather than introducing yet another thin wrapper around vm_assist(),
make that function the main handler, requiring a per-arch
arch_vm_assist_valid_mask() definition instead.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v3: Rename to arch_vm_assist_valid_mask(). Have separate 32- and 64-bit
    PV #define-s.
v2: Re-work vm_assist() handling/layering at the same time. Also adjust
    arch_set_info_guest().

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -939,6 +939,9 @@ int arch_set_info_guest(
         v->arch.dr6 = c(debugreg[6]);
         v->arch.dr7 = c(debugreg[7]);
 
+        if ( v->vcpu_id == 0 )
+            d->vm_assist = c.nat->vm_assist;
+
         hvm_set_info_guest(v);
         goto out;
     }
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -128,6 +128,7 @@ static const hypercall_table_t hvm_hyper
 #ifdef CONFIG_GRANT_TABLE
     HVM_CALL(grant_table_op),
 #endif
+    HYPERCALL(vm_assist),
     COMPAT_CALL(vcpu_op),
     HVM_CALL(physdev_op),
     COMPAT_CALL(xen_version),
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -57,7 +57,7 @@ const hypercall_table_t pv_hypercall_tab
 #ifdef CONFIG_GRANT_TABLE
     COMPAT_CALL(grant_table_op),
 #endif
-    COMPAT_CALL(vm_assist),
+    HYPERCALL(vm_assist),
     COMPAT_CALL(update_va_mapping_otherdomain),
     COMPAT_CALL(iret),
     COMPAT_CALL(vcpu_op),
--- a/xen/common/compat/kernel.c
+++ b/xen/common/compat/kernel.c
@@ -37,11 +37,6 @@ CHECK_TYPE(capabilities_info);
 
 CHECK_TYPE(domain_handle);
 
-#ifdef COMPAT_VM_ASSIST_VALID
-#undef VM_ASSIST_VALID
-#define VM_ASSIST_VALID COMPAT_VM_ASSIST_VALID
-#endif
-
 #define DO(fn) int compat_##fn
 #define COMPAT
 
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1517,20 +1517,23 @@ long do_vcpu_op(int cmd, unsigned int vc
     return rc;
 }
 
-#ifdef VM_ASSIST_VALID
-long vm_assist(struct domain *p, unsigned int cmd, unsigned int type,
-               unsigned long valid)
+#ifdef arch_vm_assist_valid_mask
+long do_vm_assist(unsigned int cmd, unsigned int type)
 {
+    struct domain *currd = current->domain;
+    const unsigned long valid = arch_vm_assist_valid_mask(currd);
+
     if ( type >= BITS_PER_LONG || !test_bit(type, &valid) )
         return -EINVAL;
 
     switch ( cmd )
     {
     case VMASST_CMD_enable:
-        set_bit(type, &p->vm_assist);
+        set_bit(type, &currd->vm_assist);
         return 0;
+
     case VMASST_CMD_disable:
-        clear_bit(type, &p->vm_assist);
+        clear_bit(type, &currd->vm_assist);
         return 0;
     }
 
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -566,13 +566,6 @@ DO(xen_version)(int cmd, XEN_GUEST_HANDL
     return -ENOSYS;
 }
 
-#ifdef VM_ASSIST_VALID
-DO(vm_assist)(unsigned int cmd, unsigned int type)
-{
-    return vm_assist(current->domain, cmd, type, VM_ASSIST_VALID);
-}
-#endif
-
 /*
  * Local variables:
  * mode: C
--- a/xen/include/asm-arm/config.h
+++ b/xen/include/asm-arm/config.h
@@ -195,8 +195,6 @@ extern unsigned long frametable_virt_end
 #define watchdog_disable() ((void)0)
 #define watchdog_enable()  ((void)0)
 
-#define VM_ASSIST_VALID          (1UL << VMASST_TYPE_runstate_update_flag)
-
 #endif /* __ARM_CONFIG_H__ */
 /*
  * Local variables:
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -269,6 +269,8 @@ static inline void free_vcpu_guest_conte
 
 static inline void arch_vcpu_block(struct vcpu *v) {}
 
+#define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
+
 #endif /* __ASM_DOMAIN_H__ */
 
 /*
--- a/xen/include/asm-x86/config.h
+++ b/xen/include/asm-x86/config.h
@@ -309,17 +309,6 @@ extern unsigned long xen_phys_start;
 #define ARG_XLAT_START(v)        \
     (ARG_XLAT_VIRT_START + ((v)->vcpu_id << ARG_XLAT_VA_SHIFT))
 
-#define NATIVE_VM_ASSIST_VALID   ((1UL << VMASST_TYPE_4gb_segments)        | \
-                                  (1UL << VMASST_TYPE_4gb_segments_notify) | \
-                                  (1UL << VMASST_TYPE_writable_pagetables) | \
-                                  (1UL << VMASST_TYPE_pae_extended_cr3)    | \
-                                  (1UL << VMASST_TYPE_architectural_iopl)  | \
-                                  (1UL << VMASST_TYPE_runstate_update_flag)| \
-                                  (1UL << VMASST_TYPE_m2p_strict))
-#define VM_ASSIST_VALID          NATIVE_VM_ASSIST_VALID
-#define COMPAT_VM_ASSIST_VALID   (NATIVE_VM_ASSIST_VALID & \
-                                  ((1UL << COMPAT_BITS_PER_LONG) - 1))
-
 #define ELFSIZE 64
 
 #define ARCH_CRASH_SAVE_VMCOREINFO
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -694,6 +694,25 @@ static inline void pv_inject_sw_interrup
     pv_inject_event(&event);
 }
 
+#define PV32_VM_ASSIST_MASK ((1UL << VMASST_TYPE_4gb_segments)        | \
+                             (1UL << VMASST_TYPE_4gb_segments_notify) | \
+                             (1UL << VMASST_TYPE_writable_pagetables) | \
+                             (1UL << VMASST_TYPE_pae_extended_cr3)    | \
+                             (1UL << VMASST_TYPE_architectural_iopl)  | \
+                             (1UL << VMASST_TYPE_runstate_update_flag))
+/*
+ * Various of what PV32_VM_ASSIST_MASK has isn't really applicable to 64-bit,
+ * but we can't make such requests fail all of the sudden.
+ */
+#define PV64_VM_ASSIST_MASK (PV32_VM_ASSIST_MASK                      | \
+                             (1UL << VMASST_TYPE_m2p_strict))
+#define HVM_VM_ASSIST_MASK  (1UL << VMASST_TYPE_runstate_update_flag)
+
+#define arch_vm_assist_valid_mask(d) \
+    (is_hvm_domain(d) ? HVM_VM_ASSIST_MASK \
+                      : is_pv_32bit_domain(d) ? PV32_VM_ASSIST_MASK \
+                                              : PV64_VM_ASSIST_MASK)
+
 #endif /* __ASM_DOMAIN_H__ */
 
 /*
--- a/xen/include/xen/hypercall.h
+++ b/xen/include/xen/hypercall.h
@@ -192,8 +192,6 @@ extern int compat_xsm_op(
 
 extern int compat_kexec_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) uarg);
 
-extern int compat_vm_assist(unsigned int cmd, unsigned int type);
-
 DEFINE_XEN_GUEST_HANDLE(multicall_entry_compat_t);
 extern int compat_multicall(
     XEN_GUEST_HANDLE_PARAM(multicall_entry_compat_t) call_list,
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -122,8 +122,6 @@ extern void guest_printk(const struct do
     __attribute__ ((format (printf, 2, 3)));
 extern void noreturn panic(const char *format, ...)
     __attribute__ ((format (printf, 1, 2)));
-extern long vm_assist(struct domain *, unsigned int cmd, unsigned int type,
-                      unsigned long valid);
 extern int __printk_ratelimit(int ratelimit_ms, int ratelimit_burst);
 extern int printk_ratelimit(void);
 


