Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2738F69B282
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 19:48:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497257.768193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT5mj-00060J-34; Fri, 17 Feb 2023 18:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497257.768193; Fri, 17 Feb 2023 18:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT5mi-0005w0-VJ; Fri, 17 Feb 2023 18:48:40 +0000
Received: by outflank-mailman (input) for mailman id 497257;
 Fri, 17 Feb 2023 18:48:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DzBr=6N=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pT5mg-00054o-8v
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 18:48:38 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aec33c5a-aef3-11ed-933d-83870f6b2ba8;
 Fri, 17 Feb 2023 19:48:35 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id eg30so7566679edb.7
 for <xen-devel@lists.xenproject.org>; Fri, 17 Feb 2023 10:48:35 -0800 (PST)
Received: from uni.router.wind (adsl-65.109.242.225.tellas.gr.
 [109.242.225.65]) by smtp.googlemail.com with ESMTPSA id
 z61-20020a509e43000000b004ad03b18ae3sm2641585ede.62.2023.02.17.10.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 10:48:32 -0800 (PST)
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
X-Inumbo-ID: aec33c5a-aef3-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwpnNdLF03Qvt4ru2IS4FhVpf+3W2MPfD26oPHMc8BU=;
        b=kzD6k/sLHlVIg/YTl6AbRdSEzfFZX9bqqHFaA+7OJjoUjpEGAKUIeJg+8S6o88cDPJ
         2x+pDXSG3n+a5rlnS9p0sTMJhs1It2bGNIciKtbArH4iIKSZhmW330uGvSmzoTp6iRqL
         dczSA1CooKINyUUB97mKnWSCJxzg9NIfyek1LlcKxEHt+XM4dfo9CptMC4kowJg9q41p
         PrIJ0vw3/DA4eoDZlDU31WkI+8ZgMkBseHKir/hibXcuY/xjcKwAAwuaFREGWobPWNtS
         TuIQlwzwLQq0IuQ+/sHb8Dxerw+9y56s52fVz5ZRN1CRU9SYVk29RlRztQz1MgAtkoHb
         qj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwpnNdLF03Qvt4ru2IS4FhVpf+3W2MPfD26oPHMc8BU=;
        b=NE9gQnFDZ5+ySTd1SZiTvkgEpKni5NF9KhBCBAlF1zXX1Ry3ZbptKEcVbcYmkcjVkZ
         v+Za+7aZk7KzA7Wgwvrym47wdMviwigS0ERv6dwfdlxMlXNXMeoO8rsMG2g+96L6eXi/
         vo2w9dCwm+yct+qd+Xf3b6jode/YW5K5L9Tf18wMQPQL8AFAA5btyQMtSdyeNCNizH8K
         jjBpbs7UaMkPGb7vBwimNewMNVyNn+jb/hqGbdQ9LamHH5z2M4Ca+uxQMJfVI3IFj6KY
         hmYGRXr2NqMkw/5TCLR+RrvSsntKJAgXMaT8dvZZLRYgVoQEd7xV3aGI+LyhfSaMYLBJ
         T2rQ==
X-Gm-Message-State: AO0yUKU2HqBOgM8MEa4yYc5Nihw/RB2R4Mt5sZkLPI7vQMsJGSzBdi9W
	ePq5LhEq7XbQ8MYV3V+Ggu1JJngYrmM=
X-Google-Smtp-Source: AK7set+47OKSq70fzhQs3f6eyl9T6ME5IWD+PDDdaWod+KmL6CJUcR0xzOI44f3d4Ma4BLb/9tQ2qQ==
X-Received: by 2002:a05:6402:2997:b0:4ab:1681:b99e with SMTP id eq23-20020a056402299700b004ab1681b99emr6153129edb.4.1676659713222;
        Fri, 17 Feb 2023 10:48:33 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/4] x86/vmx: cleanup vmx.c
Date: Fri, 17 Feb 2023 20:48:13 +0200
Message-Id: <20230217184814.1243046-4-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230217184814.1243046-1-burzalodowa@gmail.com>
References: <20230217184814.1243046-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not include the headers:
  asm/hvm/vpic.h
  asm/hvm/vpt.h
  asm/io.h
  asm/mce.h
  asm/mem_sharing.h
  asm/regs.h
  public/arch-x86/cpuid.h
  public/hvm/save.h
because none of the declarations and macro definitions in them is used.
Sort alphabetically the rest of the headers.

Rearrange the code to replace all forward declarations with the function
definitions.

Replace double new lines with one.

Reduce scope of nvmx_enqueue_n2_exceptions() to static because it is used
only in this file.

Move vmx_update_debug_state() in vmcs.c because it is used only in this file
and limit its scope to this file by declaring it static and removing its
declaration from vmx.h.

Take the opportunity to remove all trailing spaces in vmx.c.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/hvm/vmx/vmcs.c            |   12 +
 xen/arch/x86/hvm/vmx/vmx.c             | 5844 ++++++++++++------------
 xen/arch/x86/include/asm/hvm/vmx/vmx.h |    1 -
 3 files changed, 2913 insertions(+), 2944 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index e1c268789e..c46bb55f05 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1864,6 +1864,18 @@ void vmx_vmentry_failure(void)
     domain_crash(curr->domain);
 }
 
+static void vmx_update_debug_state(struct vcpu *v)
+{
+    if ( v->arch.hvm.debug_state_latch )
+        v->arch.hvm.vmx.exception_bitmap |= 1U << TRAP_int3;
+    else
+        v->arch.hvm.vmx.exception_bitmap &= ~(1U << TRAP_int3);
+
+    vmx_vmcs_enter(v);
+    vmx_update_exception_bitmap(v);
+    vmx_vmcs_exit(v);
+}
+
 void noreturn vmx_asm_do_vmentry(void);
 
 void cf_check vmx_do_resume(void)
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 0ec33bcc18..d02ad01b9b 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -15,130 +15,236 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/domain_page.h>
 #include <xen/guest_access.h>
+#include <xen/hypercall.h>
 #include <xen/init.h>
+#include <xen/irq.h>
 #include <xen/lib.h>
 #include <xen/param.h>
-#include <xen/trace.h>
+#include <xen/perfc.h>
 #include <xen/sched.h>
-#include <xen/irq.h>
 #include <xen/softirq.h>
-#include <xen/domain_page.h>
-#include <xen/hypercall.h>
-#include <xen/perfc.h>
-#include <asm/current.h>
-#include <asm/io.h>
-#include <asm/iocap.h>
-#include <asm/regs.h>
+#include <xen/trace.h>
+#include <asm/altp2m.h>
+#include <asm/apic.h>
 #include <asm/cpufeature.h>
-#include <asm/processor.h>
+#include <asm/current.h>
+#include <asm/gdbsx.h>
 #include <asm/debugreg.h>
-#include <asm/msr.h>
-#include <asm/p2m.h>
-#include <asm/mem_sharing.h>
+#include <asm/event.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
-#include <asm/hvm/support.h>
-#include <asm/hvm/vmx/vmx.h>
-#include <asm/hvm/vmx/vmcs.h>
-#include <public/sched.h>
-#include <public/hvm/ioreq.h>
-#include <asm/hvm/vpic.h>
-#include <asm/hvm/vlapic.h>
-#include <asm/x86_emulate.h>
-#include <asm/hvm/vpt.h>
-#include <public/hvm/save.h>
-#include <asm/hvm/trace.h>
 #include <asm/hvm/monitor.h>
-#include <asm/xenoprof.h>
-#include <asm/gdbsx.h>
-#include <asm/apic.h>
 #include <asm/hvm/nestedhvm.h>
-#include <asm/altp2m.h>
-#include <asm/event.h>
-#include <asm/mce.h>
+#include <asm/hvm/support.h>
+#include <asm/hvm/trace.h>
+#include <asm/hvm/vlapic.h>
+#include <asm/hvm/vmx/vmcs.h>
+#include <asm/hvm/vmx/vmx.h>
+#include <asm/iocap.h>
 #include <asm/monitor.h>
+#include <asm/msr.h>
+#include <asm/processor.h>
 #include <asm/prot-key.h>
-#include <public/arch-x86/cpuid.h>
+#include <asm/p2m.h>
+#include <asm/xenoprof.h>
+#include <asm/x86_emulate.h>
+#include <public/hvm/ioreq.h>
+#include <public/sched.h>
 
 static bool_t __initdata opt_force_ept;
 boolean_param("force-ept", opt_force_ept);
 
-static void cf_check vmx_ctxt_switch_from(struct vcpu *v);
-static void cf_check vmx_ctxt_switch_to(struct vcpu *v);
+void vmx_update_cpu_exec_control(struct vcpu *v)
+{
+    if ( nestedhvm_vcpu_in_guestmode(v) )
+        nvmx_update_exec_control(v, v->arch.hvm.vmx.exec_control);
+    else
+        __vmwrite(CPU_BASED_VM_EXEC_CONTROL, v->arch.hvm.vmx.exec_control);
+}
 
-static int  vmx_alloc_vlapic_mapping(struct domain *d);
-static void vmx_free_vlapic_mapping(struct domain *d);
-static void vmx_install_vlapic_mapping(struct vcpu *v);
-static void cf_check vmx_update_guest_cr(
-    struct vcpu *v, unsigned int cr, unsigned int flags);
-static void cf_check vmx_update_guest_efer(struct vcpu *v);
-static void cf_check vmx_wbinvd_intercept(void);
-static void cf_check vmx_fpu_dirty_intercept(void);
-static int cf_check vmx_msr_read_intercept(
-    unsigned int msr, uint64_t *msr_content);
-static int cf_check vmx_msr_write_intercept(
-    unsigned int msr, uint64_t msr_content);
-static void cf_check vmx_invlpg(struct vcpu *v, unsigned long linear);
+void vmx_update_secondary_exec_control(struct vcpu *v)
+{
+    if ( nestedhvm_vcpu_in_guestmode(v) )
+        nvmx_update_secondary_exec_control(v,
+            v->arch.hvm.vmx.secondary_exec_control);
+    else
+        __vmwrite(SECONDARY_VM_EXEC_CONTROL,
+                  v->arch.hvm.vmx.secondary_exec_control);
+}
 
-/* Values for domain's ->arch.hvm_domain.pi_ops.flags. */
-#define PI_CSW_FROM (1u << 0)
-#define PI_CSW_TO   (1u << 1)
+void vmx_update_exception_bitmap(struct vcpu *v)
+{
+    u32 bitmap = unlikely(v->arch.hvm.vmx.vmx_realmode)
+        ? 0xffffffffu : v->arch.hvm.vmx.exception_bitmap;
 
-struct vmx_pi_blocking_vcpu {
-    struct list_head     list;
-    spinlock_t           lock;
-};
+    if ( nestedhvm_vcpu_in_guestmode(v) )
+        nvmx_update_exception_bitmap(v, bitmap);
+    else
+        __vmwrite(EXCEPTION_BITMAP, bitmap);
+}
+
+static void vmx_fpu_enter(struct vcpu *v)
+{
+    vcpu_restore_fpu_lazy(v);
+    v->arch.hvm.vmx.exception_bitmap &= ~(1u << TRAP_no_device);
+    vmx_update_exception_bitmap(v);
+    v->arch.hvm.vmx.host_cr0 &= ~X86_CR0_TS;
+    __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
+}
+
+static void cf_check vmx_fpu_leave(struct vcpu *v)
+{
+    ASSERT(!v->fpu_dirtied);
+    ASSERT(read_cr0() & X86_CR0_TS);
+
+    if ( !(v->arch.hvm.vmx.host_cr0 & X86_CR0_TS) )
+    {
+        v->arch.hvm.vmx.host_cr0 |= X86_CR0_TS;
+        __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
+    }
+
+    /*
+     * If the guest does not have TS enabled then we must cause and handle an
+     * exception on first use of the FPU. If the guest *does* have TS enabled
+     * then this is not necessary: no FPU activity can occur until the guest
+     * clears CR0.TS, and we will initialise the FPU when that happens.
+     */
+    if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
+    {
+        v->arch.hvm.hw_cr[0] |= X86_CR0_TS;
+        __vmwrite(GUEST_CR0, v->arch.hvm.hw_cr[0]);
+        v->arch.hvm.vmx.exception_bitmap |= (1u << TRAP_no_device);
+        vmx_update_exception_bitmap(v);
+    }
+}
 
 /*
- * We maintain a per-CPU linked-list of vCPUs, so in PI wakeup
- * handler we can find which vCPU should be woken up.
+ * To avoid MSR save/restore at every VM exit/entry time, we restore
+ * the x86_64 specific MSRs at domain switch time. Since these MSRs
+ * are not modified once set for para domains, we don't save them,
+ * but simply reset them to values set in percpu_traps_init().
  */
-static DEFINE_PER_CPU(struct vmx_pi_blocking_vcpu, vmx_pi_blocking);
+static void vmx_restore_host_msrs(void)
+{
+    /* No PV guests?  No need to restore host SYSCALL infrastructure. */
+    if ( !IS_ENABLED(CONFIG_PV) )
+        return;
 
-uint8_t __read_mostly posted_intr_vector;
-static uint8_t __read_mostly pi_wakeup_vector;
+    /* Relies on the SYSCALL trampoline being at the start of the stubs. */
+    wrmsrl(MSR_STAR,         XEN_MSR_STAR);
+    wrmsrl(MSR_LSTAR,        this_cpu(stubs.addr));
+    wrmsrl(MSR_SYSCALL_MASK, XEN_SYSCALL_MASK);
+}
 
-void vmx_pi_per_cpu_init(unsigned int cpu)
+static void vmx_save_guest_msrs(struct vcpu *v)
 {
-    INIT_LIST_HEAD(&per_cpu(vmx_pi_blocking, cpu).list);
-    spin_lock_init(&per_cpu(vmx_pi_blocking, cpu).lock);
+    const struct cpuid_policy *cp = v->domain->arch.cpuid;
+    struct vcpu_msrs *msrs = v->arch.msrs;
+
+    /*
+     * We cannot cache SHADOW_GS_BASE while the VCPU runs, as it can
+     * be updated at any time via SWAPGS, which we cannot trap.
+     */
+    v->arch.hvm.vmx.shadow_gs = read_gs_shadow();
+
+    if ( v->arch.hvm.vmx.ipt_active )
+    {
+        rdmsrl(MSR_RTIT_OUTPUT_MASK, msrs->rtit.output_mask);
+        rdmsrl(MSR_RTIT_STATUS, msrs->rtit.status);
+    }
+
+    if ( cp->feat.pks )
+        msrs->pkrs = rdpkrs_and_cache();
 }
 
-static void cf_check vmx_vcpu_block(struct vcpu *v)
+static void vmx_restore_guest_msrs(struct vcpu *v)
 {
-    unsigned long flags;
-    unsigned int dest;
-    spinlock_t *old_lock;
-    spinlock_t *pi_blocking_list_lock =
-		&per_cpu(vmx_pi_blocking, v->processor).lock;
-    struct pi_desc *pi_desc = &v->arch.hvm.vmx.pi_desc;
+    const struct cpuid_policy *cp = v->domain->arch.cpuid;
+    const struct vcpu_msrs *msrs = v->arch.msrs;
 
-    spin_lock_irqsave(pi_blocking_list_lock, flags);
-    old_lock = cmpxchg(&v->arch.hvm.vmx.pi_blocking.lock, NULL,
-                       pi_blocking_list_lock);
+    write_gs_shadow(v->arch.hvm.vmx.shadow_gs);
+    wrmsrl(MSR_STAR,           v->arch.hvm.vmx.star);
+    wrmsrl(MSR_LSTAR,          v->arch.hvm.vmx.lstar);
+    wrmsrl(MSR_SYSCALL_MASK,   v->arch.hvm.vmx.sfmask);
 
-    /*
-     * 'v->arch.hvm.vmx.pi_blocking.lock' should be NULL before
-     * being assigned to a new value, since the vCPU is currently
-     * running and it cannot be on any blocking list.
-     */
-    ASSERT(old_lock == NULL);
+    if ( cpu_has_msr_tsc_aux )
+        wrmsr_tsc_aux(msrs->tsc_aux);
 
-    list_add_tail(&v->arch.hvm.vmx.pi_blocking.list,
-                  &per_cpu(vmx_pi_blocking, v->processor).list);
-    spin_unlock_irqrestore(pi_blocking_list_lock, flags);
+    if ( v->arch.hvm.vmx.ipt_active )
+    {
+        wrmsrl(MSR_RTIT_OUTPUT_BASE, page_to_maddr(v->vmtrace.pg));
+        wrmsrl(MSR_RTIT_OUTPUT_MASK, msrs->rtit.output_mask);
+        wrmsrl(MSR_RTIT_STATUS, msrs->rtit.status);
+    }
 
-    ASSERT(!pi_test_sn(pi_desc));
+    if ( cp->feat.pks )
+        wrpkrs(msrs->pkrs);
+}
 
-    dest = cpu_physical_id(v->processor);
+static void vmx_save_dr(struct vcpu *v)
+{
+    if ( !v->arch.hvm.flag_dr_dirty )
+        return;
 
-    ASSERT(pi_desc->ndst ==
-           (x2apic_enabled ? dest : MASK_INSR(dest, PI_xAPIC_NDST_MASK)));
+    /* Clear the DR dirty flag and re-enable intercepts for DR accesses. */
+    v->arch.hvm.flag_dr_dirty = 0;
+    v->arch.hvm.vmx.exec_control |= CPU_BASED_MOV_DR_EXITING;
+    vmx_update_cpu_exec_control(v);
 
-    write_atomic(&pi_desc->nv, pi_wakeup_vector);
+    v->arch.dr[0] = read_debugreg(0);
+    v->arch.dr[1] = read_debugreg(1);
+    v->arch.dr[2] = read_debugreg(2);
+    v->arch.dr[3] = read_debugreg(3);
+    v->arch.dr6   = read_debugreg(6);
+    /* DR7 must be saved as it is used by vmx_restore_dr(). */
+    __vmread(GUEST_DR7, &v->arch.dr7);
+}
+
+static void __restore_debug_registers(struct vcpu *v)
+{
+    if ( v->arch.hvm.flag_dr_dirty )
+        return;
+
+    v->arch.hvm.flag_dr_dirty = 1;
+
+    write_debugreg(0, v->arch.dr[0]);
+    write_debugreg(1, v->arch.dr[1]);
+    write_debugreg(2, v->arch.dr[2]);
+    write_debugreg(3, v->arch.dr[3]);
+    write_debugreg(6, v->arch.dr6);
+    /* DR7 is loaded from the VMCS. */
+}
+
+/*
+ * DR7 is saved and restored on every vmexit.  Other debug registers only
+ * need to be restored if their value is going to affect execution -- i.e.,
+ * if one of the breakpoints is enabled.  So mask out all bits that don't
+ * enable some breakpoint functionality.
+ */
+static void vmx_restore_dr(struct vcpu *v)
+{
+    /* NB. __vmread() is not usable here, so we cannot read from the VMCS. */
+    if ( unlikely(v->arch.dr7 & DR7_ACTIVE_MASK) )
+        __restore_debug_registers(v);
 }
 
+/* Values for domain's ->arch.hvm_domain.pi_ops.flags. */
+#define PI_CSW_FROM (1u << 0)
+#define PI_CSW_TO   (1u << 1)
+
+struct vmx_pi_blocking_vcpu {
+    struct list_head     list;
+    spinlock_t           lock;
+};
+
+/*
+ * We maintain a per-CPU linked-list of vCPUs, so in PI wakeup
+ * handler we can find which vCPU should be woken up.
+ */
+static DEFINE_PER_CPU(struct vmx_pi_blocking_vcpu, vmx_pi_blocking);
+
 static void vmx_pi_switch_from(struct vcpu *v)
 {
     struct pi_desc *pi_desc = &v->arch.hvm.vmx.pi_desc;
@@ -160,3561 +266,3424 @@ static void vmx_pi_switch_to(struct vcpu *v)
     pi_clear_sn(pi_desc);
 }
 
-static void vmx_pi_unblock_vcpu(struct vcpu *v)
+static void cf_check vmx_ctxt_switch_from(struct vcpu *v)
 {
-    unsigned long flags;
-    spinlock_t *pi_blocking_list_lock;
-    struct pi_desc *pi_desc = &v->arch.hvm.vmx.pi_desc;
-
     /*
-     * Set 'NV' field back to posted_intr_vector, so the
-     * Posted-Interrupts can be delivered to the vCPU when
-     * it is running in non-root mode.
+     * Return early if trying to do a context switch without VMX enabled,
+     * this can happen when the hypervisor shuts down with HVM guests
+     * still running.
      */
-    write_atomic(&pi_desc->nv, posted_intr_vector);
-
-    pi_blocking_list_lock = v->arch.hvm.vmx.pi_blocking.lock;
-
-    /* Prevent the compiler from eliminating the local variable.*/
-    smp_rmb();
-
-    /* The vCPU is not on any blocking list. */
-    if ( pi_blocking_list_lock == NULL )
+    if ( unlikely(!this_cpu(vmxon)) )
         return;
 
-    spin_lock_irqsave(pi_blocking_list_lock, flags);
-
-    /*
-     * v->arch.hvm.vmx.pi_blocking.lock == NULL here means the vCPU
-     * was removed from the blocking list while we are acquiring the lock.
-     */
-    if ( v->arch.hvm.vmx.pi_blocking.lock != NULL )
+    if ( !v->is_running )
     {
-        ASSERT(v->arch.hvm.vmx.pi_blocking.lock == pi_blocking_list_lock);
-        list_del(&v->arch.hvm.vmx.pi_blocking.list);
-        v->arch.hvm.vmx.pi_blocking.lock = NULL;
+        /*
+         * When this vCPU isn't marked as running anymore, a remote pCPU's
+         * attempt to pause us (from vmx_vmcs_enter()) won't have a reason
+         * to spin in vcpu_sleep_sync(), and hence that pCPU might have taken
+         * away the VMCS from us. As we're running with interrupts disabled,
+         * we also can't call vmx_vmcs_enter().
+         */
+        vmx_vmcs_reload(v);
     }
 
-    spin_unlock_irqrestore(pi_blocking_list_lock, flags);
+    if ( !v->arch.fully_eager_fpu )
+        vmx_fpu_leave(v);
+    vmx_save_guest_msrs(v);
+    vmx_restore_host_msrs();
+    vmx_save_dr(v);
+
+    if ( v->domain->arch.hvm.pi_ops.flags & PI_CSW_FROM )
+        vmx_pi_switch_from(v);
 }
 
-static void vmx_pi_do_resume(struct vcpu *v)
+static void cf_check vmx_ctxt_switch_to(struct vcpu *v)
 {
-    ASSERT(!test_bit(_VPF_blocked, &v->pause_flags));
+    vmx_restore_guest_msrs(v);
+    vmx_restore_dr(v);
 
-    vmx_pi_unblock_vcpu(v);
+    if ( v->domain->arch.hvm.pi_ops.flags & PI_CSW_TO )
+        vmx_pi_switch_to(v);
 }
 
-void vmx_pi_desc_fixup(unsigned int cpu)
+static int vmx_alloc_vlapic_mapping(struct domain *d)
 {
-    unsigned int new_cpu, dest;
-    unsigned long flags;
-    struct vmx_vcpu *vmx, *tmp;
-    spinlock_t *new_lock, *old_lock = &per_cpu(vmx_pi_blocking, cpu).lock;
-    struct list_head *blocked_vcpus = &per_cpu(vmx_pi_blocking, cpu).list;
+    struct page_info *pg;
+    mfn_t mfn;
 
-    if ( !iommu_intpost )
-        return;
+    if ( !has_vlapic(d) || !cpu_has_vmx_virtualize_apic_accesses )
+        return 0;
 
-    /*
-     * We are in the context of CPU_DEAD or CPU_UP_CANCELED notification,
-     * and it is impossible for a second CPU go down in parallel. So we
-     * can safely acquire the old cpu's lock and then acquire the new_cpu's
-     * lock after that.
-     */
-    spin_lock_irqsave(old_lock, flags);
+    pg = alloc_domheap_page(d, MEMF_no_refcount);
+    if ( !pg )
+        return -ENOMEM;
 
-    list_for_each_entry_safe(vmx, tmp, blocked_vcpus, pi_blocking.list)
+    if ( !get_page_and_type(pg, d, PGT_writable_page) )
     {
         /*
-         * Suppress notification or we may miss an interrupt when the
-         * target cpu is dying.
-         */
-        pi_set_sn(&vmx->pi_desc);
-
-        /*
-         * Check whether a notification is pending before doing the
-         * movement, if that is the case we need to wake up it directly
-         * other than moving it to the new cpu's list.
+         * The domain can't possibly know about this page yet, so failure
+         * here is a clear indication of something fishy going on.
          */
-        if ( pi_test_on(&vmx->pi_desc) )
-        {
-            list_del(&vmx->pi_blocking.list);
-            vmx->pi_blocking.lock = NULL;
-            vcpu_unblock(container_of(vmx, struct vcpu, arch.hvm.vmx));
-        }
-        else
-        {
-            /*
-             * We need to find an online cpu as the NDST of the PI descriptor, it
-             * doesn't matter whether it is within the cpupool of the domain or
-             * not. As long as it is online, the vCPU will be woken up once the
-             * notification event arrives.
-             */
-            new_cpu = cpumask_any(&cpu_online_map);
-            new_lock = &per_cpu(vmx_pi_blocking, new_cpu).lock;
-
-            spin_lock(new_lock);
+        domain_crash(d);
+        return -ENODATA;
+    }
 
-            ASSERT(vmx->pi_blocking.lock == old_lock);
+    mfn = page_to_mfn(pg);
+    clear_domain_page(mfn);
+    d->arch.hvm.vmx.apic_access_mfn = mfn;
 
-            dest = cpu_physical_id(new_cpu);
-            write_atomic(&vmx->pi_desc.ndst,
-                         x2apic_enabled ? dest : MASK_INSR(dest, PI_xAPIC_NDST_MASK));
+    return 0;
+}
 
-            list_move(&vmx->pi_blocking.list,
-                      &per_cpu(vmx_pi_blocking, new_cpu).list);
-            vmx->pi_blocking.lock = new_lock;
+static void vmx_free_vlapic_mapping(struct domain *d)
+{
+    mfn_t mfn = d->arch.hvm.vmx.apic_access_mfn;
 
-            spin_unlock(new_lock);
-        }
+    d->arch.hvm.vmx.apic_access_mfn = _mfn(0);
+    if ( !mfn_eq(mfn, _mfn(0)) )
+    {
+        struct page_info *pg = mfn_to_page(mfn);
 
-        pi_clear_sn(&vmx->pi_desc);
+        put_page_alloc_ref(pg);
+        put_page_and_type(pg);
     }
-
-    spin_unlock_irqrestore(old_lock, flags);
 }
 
-/*
- * To handle posted interrupts correctly, we need to set the following
- * state:
- *
- * * The PI notification vector (NV)
- * * The PI notification destination processor (NDST)
- * * The PI "suppress notification" bit (SN)
- * * The vcpu pi "blocked" list
- *
- * VMX implements the runstate transitions as the following:
- *
- * A: ... -> running
- *  - SN = 0
- *  - NDST = v->processor
- *  If a VM is currently running, we want the PI delivered to the guest vcpu
- *  on the proper pcpu.
- *
- * B: running -> ...
- *  - SN = 1
- *
- * C: ... -> blocked
- *  - SN = 0
- *  - NV = pi_wakeup_vector
- *  - Add vcpu to blocked list
- *  If the vm is blocked, we want the PI delivered to Xen so that it can
- *  wake it up.
- *
- * D: ... -> vmentry
- *  - SN = 0
- *  - NV = posted_intr_vector
- *  - Take vcpu off blocked list
- *
- *  If the VM is currently either preempted or offline (i.e., not running
- *  because of some reason other than blocking waiting for an interrupt),
- *  there's nothing Xen can do -- we want the interrupt pending bit set in
- *  the guest, but we don't want to bother Xen with an interrupt (SN clear).
- *
- * There's a brief window of time between vmx_intr_assist() and checking
- * softirqs where if an interrupt comes in it may be lost; so we need Xen
- * to get an interrupt and raise a softirq so that it will go through the
- * vmx_intr_assist() path again (SN clear, NV = posted_interrupt).
- */
-
-/* This function is called when pcidevs_lock is held */
-void vmx_pi_hooks_assign(struct domain *d)
+static void vmx_install_vlapic_mapping(struct vcpu *v)
 {
-    struct vcpu *v;
+    mfn_t apic_access_mfn = v->domain->arch.hvm.vmx.apic_access_mfn;
+    paddr_t virt_page_ma, apic_page_ma;
 
-    if ( !iommu_intpost || !is_hvm_domain(d) )
+    if ( mfn_eq(apic_access_mfn, _mfn(0)) )
         return;
 
-    ASSERT(!d->arch.hvm.pi_ops.vcpu_block);
-
-    /*
-     * We carefully handle the timing here:
-     * - Install the context switch first
-     * - Then set the NDST field
-     * - Install the block and resume hooks in the end
-     *
-     * This can make sure the PI (especially the NDST feild) is
-     * in proper state when we call vmx_vcpu_block().
-     */
-    d->arch.hvm.pi_ops.flags = PI_CSW_FROM | PI_CSW_TO;
-
-    for_each_vcpu ( d, v )
-    {
-        unsigned int dest = cpu_physical_id(v->processor);
-        struct pi_desc *pi_desc = &v->arch.hvm.vmx.pi_desc;
+    ASSERT(cpu_has_vmx_virtualize_apic_accesses);
 
-        /*
-         * We don't need to update NDST if vmx_pi_switch_to()
-         * has already got called.
-         */
-        (void)cmpxchg(&pi_desc->ndst, APIC_INVALID_DEST,
-                x2apic_enabled ? dest : MASK_INSR(dest, PI_xAPIC_NDST_MASK));
-    }
+    virt_page_ma = page_to_maddr(vcpu_vlapic(v)->regs_page);
+    apic_page_ma = mfn_to_maddr(apic_access_mfn);
 
-    d->arch.hvm.pi_ops.vcpu_block = vmx_vcpu_block;
+    vmx_vmcs_enter(v);
+    __vmwrite(VIRTUAL_APIC_PAGE_ADDR, virt_page_ma);
+    __vmwrite(APIC_ACCESS_ADDR, apic_page_ma);
+    vmx_vmcs_exit(v);
 }
 
-/* This function is called when pcidevs_lock is held */
-void vmx_pi_hooks_deassign(struct domain *d)
+void cf_check vmx_vlapic_msr_changed(struct vcpu *v)
 {
-    struct vcpu *v;
+    int virtualize_x2apic_mode;
+    struct vlapic *vlapic = vcpu_vlapic(v);
+    unsigned int msr;
 
-    if ( !iommu_intpost || !is_hvm_domain(d) )
+    virtualize_x2apic_mode = ( (cpu_has_vmx_apic_reg_virt ||
+                                cpu_has_vmx_virtual_intr_delivery) &&
+                               cpu_has_vmx_virtualize_x2apic_mode );
+
+    if ( !cpu_has_vmx_virtualize_apic_accesses &&
+         !virtualize_x2apic_mode )
         return;
 
-    ASSERT(d->arch.hvm.pi_ops.vcpu_block);
+    vmx_vmcs_enter(v);
+    v->arch.hvm.vmx.secondary_exec_control &=
+        ~(SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES |
+          SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE);
+    if ( !vlapic_hw_disabled(vlapic) &&
+         (vlapic_base_address(vlapic) == APIC_DEFAULT_PHYS_BASE) )
+    {
+        if ( virtualize_x2apic_mode && vlapic_x2apic_mode(vlapic) )
+        {
+            v->arch.hvm.vmx.secondary_exec_control |=
+                SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE;
+            if ( cpu_has_vmx_apic_reg_virt )
+            {
+                for ( msr = MSR_X2APIC_FIRST;
+                      msr <= MSR_X2APIC_LAST; msr++ )
+                    vmx_clear_msr_intercept(v, msr, VMX_MSR_R);
 
-    /*
-     * Pausing the domain can make sure the vCPUs are not
-     * running and hence not calling the hooks simultaneously
-     * when deassigning the PI hooks and removing the vCPU
-     * from the blocking list.
-     */
-    ASSERT(current->domain != d);
-    domain_pause(d);
-
-    /*
-     * Note that we don't set 'd->arch.hvm.pi_ops.switch_to' to NULL
-     * here. If we deassign the hooks while the vCPU is runnable in the
-     * runqueue with 'SN' set, all the future notification event will be
-     * suppressed since vmx_deliver_posted_intr() also use 'SN' bit
-     * as the suppression flag. Preserving the 'switch_to' hook function can
-     * clear the 'SN' bit when the vCPU becomes running next time. After
-     * that, No matter which status(runnable, running or block) the vCPU is in,
-     * the 'SN' bit will keep clear for the 'switch_from' hook function that set
-     * the 'SN' bit has been removed. At that time, the 'switch_to' hook function
-     * is also useless. Considering the function doesn't do harm to the whole
-     * system, leave it here until we find a clean solution to deassign the
-     * 'switch_to' hook function.
-     */
-    d->arch.hvm.pi_ops.vcpu_block = NULL;
-    d->arch.hvm.pi_ops.flags = PI_CSW_TO;
-
-    for_each_vcpu ( d, v )
-        vmx_pi_unblock_vcpu(v);
-
-    domain_unpause(d);
-}
-
-/*
- * This function is used to update the IRTE for posted-interrupt
- * when guest changes MSI/MSI-X information.
- */
-static int cf_check vmx_pi_update_irte(const struct vcpu *v,
-                                       const struct pirq *pirq, uint8_t gvec)
-{
-    const struct pi_desc *pi_desc = v ? &v->arch.hvm.vmx.pi_desc : NULL;
-    struct irq_desc *desc;
-    struct msi_desc *msi_desc;
-    int rc;
-
-    desc = pirq_spin_lock_irq_desc(pirq, NULL);
-    if ( !desc )
-        return -EINVAL;
-
-    msi_desc = desc->msi_desc;
-    if ( !msi_desc )
-    {
-        rc = -ENODEV;
-        goto unlock_out;
-    }
-    msi_desc->pi_desc = pi_desc;
-    msi_desc->gvec = gvec;
-
-    spin_unlock_irq(&desc->lock);
-
-    ASSERT(pcidevs_locked());
-
-    return iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
-
- unlock_out:
-    spin_unlock_irq(&desc->lock);
-
-    return rc;
-}
-
-static const struct lbr_info {
-    u32 base, count;
-} p4_lbr[] = {
-    { MSR_P4_LER_FROM_LIP,          1 },
-    { MSR_P4_LER_TO_LIP,            1 },
-    { MSR_P4_LASTBRANCH_TOS,        1 },
-    { MSR_P4_LASTBRANCH_0_FROM_LIP, NUM_MSR_P4_LASTBRANCH_FROM_TO },
-    { MSR_P4_LASTBRANCH_0_TO_LIP,   NUM_MSR_P4_LASTBRANCH_FROM_TO },
-    { 0, 0 }
-}, c2_lbr[] = {
-    { MSR_IA32_LASTINTFROMIP,       1 },
-    { MSR_IA32_LASTINTTOIP,         1 },
-    { MSR_C2_LASTBRANCH_TOS,        1 },
-    { MSR_C2_LASTBRANCH_0_FROM_IP,  NUM_MSR_C2_LASTBRANCH_FROM_TO },
-    { MSR_C2_LASTBRANCH_0_TO_IP,    NUM_MSR_C2_LASTBRANCH_FROM_TO },
-    { 0, 0 }
-}, nh_lbr[] = {
-    { MSR_IA32_LASTINTFROMIP,       1 },
-    { MSR_IA32_LASTINTTOIP,         1 },
-    { MSR_NHL_LBR_SELECT,           1 },
-    { MSR_NHL_LASTBRANCH_TOS,       1 },
-    { MSR_P4_LASTBRANCH_0_FROM_LIP, NUM_MSR_P4_LASTBRANCH_FROM_TO },
-    { MSR_P4_LASTBRANCH_0_TO_LIP,   NUM_MSR_P4_LASTBRANCH_FROM_TO },
-    { 0, 0 }
-}, sk_lbr[] = {
-    { MSR_IA32_LASTINTFROMIP,       1 },
-    { MSR_IA32_LASTINTTOIP,         1 },
-    { MSR_NHL_LBR_SELECT,           1 },
-    { MSR_NHL_LASTBRANCH_TOS,       1 },
-    { MSR_SKL_LASTBRANCH_0_FROM_IP, NUM_MSR_SKL_LASTBRANCH },
-    { MSR_SKL_LASTBRANCH_0_TO_IP,   NUM_MSR_SKL_LASTBRANCH },
-    { MSR_SKL_LASTBRANCH_0_INFO,    NUM_MSR_SKL_LASTBRANCH },
-    { 0, 0 }
-}, at_lbr[] = {
-    { MSR_IA32_LASTINTFROMIP,       1 },
-    { MSR_IA32_LASTINTTOIP,         1 },
-    { MSR_C2_LASTBRANCH_TOS,        1 },
-    { MSR_C2_LASTBRANCH_0_FROM_IP,  NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
-    { MSR_C2_LASTBRANCH_0_TO_IP,    NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
-    { 0, 0 }
-}, sm_lbr[] = {
-    { MSR_IA32_LASTINTFROMIP,       1 },
-    { MSR_IA32_LASTINTTOIP,         1 },
-    { MSR_SM_LBR_SELECT,            1 },
-    { MSR_SM_LASTBRANCH_TOS,        1 },
-    { MSR_C2_LASTBRANCH_0_FROM_IP,  NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
-    { MSR_C2_LASTBRANCH_0_TO_IP,    NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
-    { 0, 0 }
-}, gm_lbr[] = {
-    { MSR_IA32_LASTINTFROMIP,       1 },
-    { MSR_IA32_LASTINTTOIP,         1 },
-    { MSR_SM_LBR_SELECT,            1 },
-    { MSR_SM_LASTBRANCH_TOS,        1 },
-    { MSR_GM_LASTBRANCH_0_FROM_IP,  NUM_MSR_GM_LASTBRANCH_FROM_TO },
-    { MSR_GM_LASTBRANCH_0_TO_IP,    NUM_MSR_GM_LASTBRANCH_FROM_TO },
-    { 0, 0 }
-};
-static const struct lbr_info *__ro_after_init model_specific_lbr;
-
-static const struct lbr_info *__init get_model_specific_lbr(void)
-{
-    switch ( boot_cpu_data.x86 )
-    {
-    case 6:
-        switch ( boot_cpu_data.x86_model )
-        {
-        /* Core2 Duo */
-        case 0x0f:
-        /* Enhanced Core */
-        case 0x17:
-        /* Xeon 7400 */
-        case 0x1d:
-            return c2_lbr;
-        /* Nehalem */
-        case 0x1a: case 0x1e: case 0x1f: case 0x2e:
-        /* Westmere */
-        case 0x25: case 0x2c: case 0x2f:
-        /* Sandy Bridge */
-        case 0x2a: case 0x2d:
-        /* Ivy Bridge */
-        case 0x3a: case 0x3e:
-        /* Haswell */
-        case 0x3c: case 0x3f: case 0x45: case 0x46:
-        /* Broadwell */
-        case 0x3d: case 0x47: case 0x4f: case 0x56:
-            return nh_lbr;
-        /* Skylake */
-        case 0x4e: case 0x5e:
-        /* Xeon Scalable */
-        case 0x55:
-        /* Cannon Lake */
-        case 0x66:
-        /* Goldmont Plus */
-        case 0x7a:
-        /* Ice Lake */
-        case 0x6a: case 0x6c: case 0x7d: case 0x7e:
-        /* Tiger Lake */
-        case 0x8c: case 0x8d:
-        /* Tremont */
-        case 0x86:
-        /* Kaby Lake */
-        case 0x8e: case 0x9e:
-        /* Comet Lake */
-        case 0xa5: case 0xa6:
-            return sk_lbr;
-        /* Atom */
-        case 0x1c: case 0x26: case 0x27: case 0x35: case 0x36:
-            return at_lbr;
-        /* Silvermont */
-        case 0x37: case 0x4a: case 0x4d: case 0x5a: case 0x5d:
-        /* Xeon Phi Knights Landing */
-        case 0x57:
-        /* Xeon Phi Knights Mill */
-        case 0x85:
-        /* Airmont */
-        case 0x4c:
-            return sm_lbr;
-        /* Goldmont */
-        case 0x5c: case 0x5f:
-            return gm_lbr;
-        }
-        break;
-
-    case 15:
-        switch ( boot_cpu_data.x86_model )
-        {
-        /* Pentium4/Xeon with em64t */
-        case 3: case 4: case 6:
-            return p4_lbr;
+                vmx_set_msr_intercept(v, MSR_X2APIC_PPR, VMX_MSR_R);
+                vmx_set_msr_intercept(v, MSR_X2APIC_TMICT, VMX_MSR_R);
+                vmx_set_msr_intercept(v, MSR_X2APIC_TMCCT, VMX_MSR_R);
+            }
+            if ( cpu_has_vmx_virtual_intr_delivery )
+            {
+                vmx_clear_msr_intercept(v, MSR_X2APIC_TPR, VMX_MSR_W);
+                vmx_clear_msr_intercept(v, MSR_X2APIC_EOI, VMX_MSR_W);
+                vmx_clear_msr_intercept(v, MSR_X2APIC_SELF, VMX_MSR_W);
+            }
         }
-        break;
+        else
+            v->arch.hvm.vmx.secondary_exec_control |=
+                SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES;
     }
+    if ( !(v->arch.hvm.vmx.secondary_exec_control &
+           SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE) )
+        for ( msr = MSR_X2APIC_FIRST;
+              msr <= MSR_X2APIC_LAST; msr++ )
+            vmx_set_msr_intercept(v, msr, VMX_MSR_RW);
 
-    return NULL;
-}
-
-static int cf_check vmx_domain_initialise(struct domain *d)
-{
-    static const struct arch_csw csw = {
-        .from = vmx_ctxt_switch_from,
-        .to   = vmx_ctxt_switch_to,
-        .tail = vmx_do_resume,
-    };
-    int rc;
-
-    d->arch.ctxt_switch = &csw;
-
-    /*
-     * Work around CVE-2018-12207?  The hardware domain is already permitted
-     * to reboot the system, so doesn't need mitigating against DoS's.
-     */
-    d->arch.hvm.vmx.exec_sp = is_hardware_domain(d) || opt_ept_exec_sp;
-
-    if ( (rc = vmx_alloc_vlapic_mapping(d)) != 0 )
-        return rc;
-
-    return 0;
-}
-
-static void cf_check vmx_domain_relinquish_resources(struct domain *d)
-{
-    vmx_free_vlapic_mapping(d);
-}
-
-static void cf_check domain_creation_finished(struct domain *d)
-{
-    gfn_t gfn = gaddr_to_gfn(APIC_DEFAULT_PHYS_BASE);
-    mfn_t apic_access_mfn = d->arch.hvm.vmx.apic_access_mfn;
-    bool ipat;
-
-    if ( mfn_eq(apic_access_mfn, _mfn(0)) )
-        return;
-
-    ASSERT(epte_get_entry_emt(d, gfn, apic_access_mfn, 0, &ipat,
-                              p2m_mmio_direct) == X86_MT_WB);
-    ASSERT(ipat);
-
-    if ( set_mmio_p2m_entry(d, gfn, apic_access_mfn, PAGE_ORDER_4K) )
-        domain_crash(d);
+    vmx_update_secondary_exec_control(v);
+    vmx_vmcs_exit(v);
 }
 
-static void vmx_init_ipt(struct vcpu *v)
+static void vmx_load_pdptrs(struct vcpu *v)
 {
-    unsigned int size = v->domain->vmtrace_size;
+    uint32_t cr3 = v->arch.hvm.guest_cr[3];
+    const uint64_t *guest_pdptes;
+    struct page_info *page;
+    p2m_type_t p2mt;
 
-    if ( !size )
+    /* EPT needs to load PDPTRS into VMCS for PAE. */
+    if ( !hvm_pae_enabled(v) || hvm_long_mode_active(v) )
         return;
 
-    /* Checked by domain creation logic. */
-    ASSERT(v->vmtrace.pg);
-    ASSERT(size >= PAGE_SIZE && (size & (size - 1)) == 0);
-
-    v->arch.msrs->rtit.output_limit = size - 1;
-}
-
-static int cf_check vmx_vcpu_initialise(struct vcpu *v)
-{
-    int rc;
-
-    spin_lock_init(&v->arch.hvm.vmx.vmcs_lock);
-
-    INIT_LIST_HEAD(&v->arch.hvm.vmx.pi_blocking.list);
-
-    vcpu_2_nvmx(v).vmxon_region_pa = INVALID_PADDR;
-
-    if ( (rc = vmx_create_vmcs(v)) != 0 )
+    page = get_page_from_gfn(v->domain, cr3 >> PAGE_SHIFT, &p2mt, P2M_ALLOC);
+    if ( !page )
     {
-        dprintk(XENLOG_WARNING,
-                "Failed to create VMCS for vcpu %d: err=%d.\n",
-                v->vcpu_id, rc);
-        return rc;
+        /* Ideally you don't want to crash but rather go into a wait
+         * queue, but this is the wrong place. We're holding at least
+         * the paging lock */
+        gdprintk(XENLOG_ERR,
+                 "Bad cr3 on load pdptrs gfn %"PRIx32" type %d\n",
+                 cr3 >> PAGE_SHIFT, (int) p2mt);
+        domain_crash(v->domain);
+        return;
     }
 
+    guest_pdptes = __map_domain_page(page) + (cr3 & ~(PAGE_MASK | 0x1f));
+
     /*
-     * It's rare but still possible that domain has already been in log-dirty
-     * mode when vcpu is being created (commented by Tim), in which case we
-     * should enable PML for this vcpu if PML has been enabled for the domain,
-     * and failure to enable results in failure of creating this vcpu.
-     *
-     * Note even there's no vcpu created for the domain, vmx_domain_enable_pml
-     * will return successful in which case vmx_domain_pml_enabled will also
-     * return true. And even this is the first vcpu to be created with
-     * vmx_domain_pml_enabled being true, failure of enabling PML still results
-     * in failure of creating vcpu, to avoid complicated logic to revert PML
-     * style EPT table to non-PML style EPT table.
+     * We do not check the PDPTRs for validity. The CPU will do this during
+     * vm entry, and we can handle the failure there and crash the guest.
+     * The only thing we could do better here is #GP instead.
      */
-    if ( vmx_domain_pml_enabled(v->domain) )
-    {
-        if ( (rc = vmx_vcpu_enable_pml(v)) != 0 )
-        {
-            dprintk(XENLOG_ERR, "%pv: Failed to enable PML.\n", v);
-            vmx_destroy_vmcs(v);
-            return rc;
-        }
-    }
 
-    vmx_install_vlapic_mapping(v);
-    vmx_init_ipt(v);
-
-    return 0;
-}
+    vmx_vmcs_enter(v);
 
-static void cf_check vmx_vcpu_destroy(struct vcpu *v)
-{
-    /*
-     * There are cases that domain still remains in log-dirty mode when it is
-     * about to be destroyed (ex, user types 'xl destroy <dom>'), in which case
-     * we should disable PML manually here. Note that vmx_vcpu_destroy is called
-     * prior to vmx_domain_destroy so we need to disable PML for each vcpu
-     * separately here.
-     */
-    vmx_vcpu_disable_pml(v);
-    vmx_destroy_vmcs(v);
-    passive_domain_destroy(v);
-}
+    __vmwrite(GUEST_PDPTE(0), guest_pdptes[0]);
+    __vmwrite(GUEST_PDPTE(1), guest_pdptes[1]);
+    __vmwrite(GUEST_PDPTE(2), guest_pdptes[2]);
+    __vmwrite(GUEST_PDPTE(3), guest_pdptes[3]);
 
-/*
- * To avoid MSR save/restore at every VM exit/entry time, we restore
- * the x86_64 specific MSRs at domain switch time. Since these MSRs
- * are not modified once set for para domains, we don't save them,
- * but simply reset them to values set in percpu_traps_init().
- */
-static void vmx_restore_host_msrs(void)
-{
-    /* No PV guests?  No need to restore host SYSCALL infrastructure. */
-    if ( !IS_ENABLED(CONFIG_PV) )
-        return;
+    vmx_vmcs_exit(v);
 
-    /* Relies on the SYSCALL trampoline being at the start of the stubs. */
-    wrmsrl(MSR_STAR,         XEN_MSR_STAR);
-    wrmsrl(MSR_LSTAR,        this_cpu(stubs.addr));
-    wrmsrl(MSR_SYSCALL_MASK, XEN_SYSCALL_MASK);
+    unmap_domain_page(guest_pdptes);
+    put_page(page);
+    return;
 }
 
-static void vmx_save_guest_msrs(struct vcpu *v)
+static void cf_check vmx_update_guest_cr(
+    struct vcpu *v, unsigned int cr, unsigned int flags)
 {
-    const struct cpuid_policy *cp = v->domain->arch.cpuid;
-    struct vcpu_msrs *msrs = v->arch.msrs;
-
-    /*
-     * We cannot cache SHADOW_GS_BASE while the VCPU runs, as it can
-     * be updated at any time via SWAPGS, which we cannot trap.
-     */
-    v->arch.hvm.vmx.shadow_gs = read_gs_shadow();
+    vmx_vmcs_enter(v);
 
-    if ( v->arch.hvm.vmx.ipt_active )
+    switch ( cr )
     {
-        rdmsrl(MSR_RTIT_OUTPUT_MASK, msrs->rtit.output_mask);
-        rdmsrl(MSR_RTIT_STATUS, msrs->rtit.status);
-    }
+    case 0:
+    {
+        bool realmode;
+        unsigned long hw_cr0_mask = X86_CR0_NE;
 
-    if ( cp->feat.pks )
-        msrs->pkrs = rdpkrs_and_cache();
-}
+        if ( !vmx_unrestricted_guest(v) )
+            hw_cr0_mask |= X86_CR0_PG | X86_CR0_PE;
 
-static void vmx_restore_guest_msrs(struct vcpu *v)
-{
-    const struct cpuid_policy *cp = v->domain->arch.cpuid;
-    const struct vcpu_msrs *msrs = v->arch.msrs;
+        if ( paging_mode_shadow(v->domain) )
+            hw_cr0_mask |= X86_CR0_WP;
 
-    write_gs_shadow(v->arch.hvm.vmx.shadow_gs);
-    wrmsrl(MSR_STAR,           v->arch.hvm.vmx.star);
-    wrmsrl(MSR_LSTAR,          v->arch.hvm.vmx.lstar);
-    wrmsrl(MSR_SYSCALL_MASK,   v->arch.hvm.vmx.sfmask);
+        if ( paging_mode_hap(v->domain) )
+        {
+            /* Manage GUEST_CR3 when CR0.PE=0. */
+            uint32_t old_ctls = v->arch.hvm.vmx.exec_control;
+            uint32_t cr3_ctls = (CPU_BASED_CR3_LOAD_EXITING |
+                                 CPU_BASED_CR3_STORE_EXITING);
 
-    if ( cpu_has_msr_tsc_aux )
-        wrmsr_tsc_aux(msrs->tsc_aux);
+            v->arch.hvm.vmx.exec_control &= ~cr3_ctls;
+            if ( !hvm_paging_enabled(v) && !vmx_unrestricted_guest(v) )
+                v->arch.hvm.vmx.exec_control |= cr3_ctls;
 
-    if ( v->arch.hvm.vmx.ipt_active )
-    {
-        wrmsrl(MSR_RTIT_OUTPUT_BASE, page_to_maddr(v->vmtrace.pg));
-        wrmsrl(MSR_RTIT_OUTPUT_MASK, msrs->rtit.output_mask);
-        wrmsrl(MSR_RTIT_STATUS, msrs->rtit.status);
-    }
+            /* Trap CR3 updates if CR3 memory events are enabled. */
+            if ( v->domain->arch.monitor.write_ctrlreg_enabled &
+                 monitor_ctrlreg_bitmask(VM_EVENT_X86_CR3) )
+                v->arch.hvm.vmx.exec_control |= CPU_BASED_CR3_LOAD_EXITING;
 
-    if ( cp->feat.pks )
-        wrpkrs(msrs->pkrs);
-}
+            if ( old_ctls != v->arch.hvm.vmx.exec_control )
+                vmx_update_cpu_exec_control(v);
+        }
 
-void vmx_update_cpu_exec_control(struct vcpu *v)
-{
-    if ( nestedhvm_vcpu_in_guestmode(v) )
-        nvmx_update_exec_control(v, v->arch.hvm.vmx.exec_control);
-    else
-        __vmwrite(CPU_BASED_VM_EXEC_CONTROL, v->arch.hvm.vmx.exec_control);
-}
+        if ( !nestedhvm_vcpu_in_guestmode(v) )
+            __vmwrite(CR0_READ_SHADOW, v->arch.hvm.guest_cr[0]);
+        else
+            nvmx_set_cr_read_shadow(v, 0);
 
-void vmx_update_secondary_exec_control(struct vcpu *v)
-{
-    if ( nestedhvm_vcpu_in_guestmode(v) )
-        nvmx_update_secondary_exec_control(v,
-            v->arch.hvm.vmx.secondary_exec_control);
-    else
-        __vmwrite(SECONDARY_VM_EXEC_CONTROL,
-                  v->arch.hvm.vmx.secondary_exec_control);
-}
+        if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
+        {
+            if ( v != current )
+            {
+                if ( !v->arch.fully_eager_fpu )
+                    hw_cr0_mask |= X86_CR0_TS;
+            }
+            else if ( v->arch.hvm.hw_cr[0] & X86_CR0_TS )
+                vmx_fpu_enter(v);
+        }
 
-void vmx_update_exception_bitmap(struct vcpu *v)
-{
-    u32 bitmap = unlikely(v->arch.hvm.vmx.vmx_realmode)
-        ? 0xffffffffu : v->arch.hvm.vmx.exception_bitmap;
+        realmode = !(v->arch.hvm.guest_cr[0] & X86_CR0_PE);
 
-    if ( nestedhvm_vcpu_in_guestmode(v) )
-        nvmx_update_exception_bitmap(v, bitmap);
-    else
-        __vmwrite(EXCEPTION_BITMAP, bitmap);
-}
+        if ( !vmx_unrestricted_guest(v) &&
+             (realmode != v->arch.hvm.vmx.vmx_realmode) )
+        {
+            enum x86_segment s;
+            struct segment_register reg[x86_seg_tr + 1];
 
-static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
-{
-    const struct cpuid_policy *cp = v->domain->arch.cpuid;
-    int rc = 0;
+            BUILD_BUG_ON(x86_seg_tr != x86_seg_gs + 1);
 
-    if ( opt_hvm_fep ||
-         (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
-        v->arch.hvm.vmx.exception_bitmap |= (1U << TRAP_invalid_op);
-    else
-        v->arch.hvm.vmx.exception_bitmap &= ~(1U << TRAP_invalid_op);
+            /* Entering or leaving real mode: adjust the segment registers.
+             * Need to read them all either way, as realmode reads can update
+             * the saved values we'll use when returning to prot mode. */
+            for ( s = 0; s < ARRAY_SIZE(reg); s++ )
+                hvm_get_segment_register(v, s, &reg[s]);
+            v->arch.hvm.vmx.vmx_realmode = realmode;
 
-    vmx_vmcs_enter(v);
-    vmx_update_exception_bitmap(v);
+            if ( realmode )
+            {
+                for ( s = 0; s < ARRAY_SIZE(reg); s++ )
+                    hvm_set_segment_register(v, s, &reg[s]);
+            }
+            else
+            {
+                for ( s = 0; s < ARRAY_SIZE(reg); s++ )
+                    if ( !(v->arch.hvm.vmx.vm86_segment_mask & (1<<s)) )
+                        hvm_set_segment_register(
+                            v, s, &v->arch.hvm.vmx.vm86_saved_seg[s]);
+            }
 
-    /*
-     * We can safely pass MSR_SPEC_CTRL through to the guest, even if STIBP
-     * isn't enumerated in hardware, as SPEC_CTRL_STIBP is ignored.
-     */
-    if ( cp->feat.ibrsb )
-    {
-        vmx_clear_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
+            vmx_update_exception_bitmap(v);
+        }
 
-        rc = vmx_add_guest_msr(v, MSR_SPEC_CTRL, 0);
-        if ( rc )
-            goto out;
+        v->arch.hvm.hw_cr[0] =
+            v->arch.hvm.guest_cr[0] | hw_cr0_mask;
+        __vmwrite(GUEST_CR0, v->arch.hvm.hw_cr[0]);
     }
-    else
-    {
-        vmx_set_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
+        /* Fallthrough: Changing CR0 can change some bits in real CR4. */
+    case 4:
+        v->arch.hvm.hw_cr[4] = HVM_CR4_HOST_MASK;
+        if ( paging_mode_hap(v->domain) )
+            v->arch.hvm.hw_cr[4] &= ~X86_CR4_PAE;
 
-        rc = vmx_del_msr(v, MSR_SPEC_CTRL, VMX_MSR_GUEST);
-        if ( rc && rc != -ESRCH )
-            goto out;
-        rc = 0; /* Tolerate -ESRCH */
-    }
+        if ( !nestedhvm_vcpu_in_guestmode(v) )
+            __vmwrite(CR4_READ_SHADOW, v->arch.hvm.guest_cr[4]);
+        else
+            nvmx_set_cr_read_shadow(v, 4);
 
-    /* MSR_PRED_CMD is safe to pass through if the guest knows about it. */
-    if ( cp->feat.ibrsb || cp->extd.ibpb )
-        vmx_clear_msr_intercept(v, MSR_PRED_CMD,  VMX_MSR_RW);
-    else
-        vmx_set_msr_intercept(v, MSR_PRED_CMD,  VMX_MSR_RW);
+        v->arch.hvm.hw_cr[4] |= v->arch.hvm.guest_cr[4];
+        if ( v->arch.hvm.vmx.vmx_realmode )
+            v->arch.hvm.hw_cr[4] |= X86_CR4_VME;
 
-    /* MSR_FLUSH_CMD is safe to pass through if the guest knows about it. */
-    if ( cp->feat.l1d_flush )
-        vmx_clear_msr_intercept(v, MSR_FLUSH_CMD, VMX_MSR_RW);
-    else
-        vmx_set_msr_intercept(v, MSR_FLUSH_CMD, VMX_MSR_RW);
+        if ( !hvm_paging_enabled(v) )
+        {
+            /*
+             * When the guest thinks paging is disabled, Xen may need to hide
+             * the effects of running with CR0.PG actually enabled.  There are
+             * two subtly complicated cases.
+             */
 
-    if ( cp->feat.pks )
-        vmx_clear_msr_intercept(v, MSR_PKRS, VMX_MSR_RW);
-    else
-        vmx_set_msr_intercept(v, MSR_PKRS, VMX_MSR_RW);
+            if ( paging_mode_hap(v->domain) )
+            {
+                /*
+                 * On hardware lacking the Unrestricted Guest feature (or with
+                 * it disabled in the VMCS), we may not enter the guest with
+                 * CR0.PG actually disabled.  When EPT is enabled, we run with
+                 * guest paging settings, but with CR3 pointing at
+                 * HVM_PARAM_IDENT_PT which is a 32bit pagetable using 4M
+                 * superpages.  Override the guests paging settings to match.
+                 */
+                v->arch.hvm.hw_cr[4] |= X86_CR4_PSE;
+                v->arch.hvm.hw_cr[4] &= ~X86_CR4_PAE;
+            }
 
- out:
-    vmx_vmcs_exit(v);
+            /*
+             * Without CR0.PG, all memory accesses are user mode, so
+             * _PAGE_USER must be set in the pagetables for guest userspace to
+             * function.  This in turn trips up guest supervisor mode if
+             * SMEP/SMAP are left active in context.  They wouldn't have any
+             * effect if paging was actually disabled, so hide them behind the
+             * back of the guest.
+             */
+            v->arch.hvm.hw_cr[4] &= ~(X86_CR4_SMEP | X86_CR4_SMAP);
+        }
 
-    if ( rc )
-    {
-        printk(XENLOG_G_ERR "%pv MSR list error: %d", v, rc);
-        domain_crash(v->domain);
-    }
-}
+        __vmwrite(GUEST_CR4, v->arch.hvm.hw_cr[4]);
 
-int cf_check vmx_guest_x86_mode(struct vcpu *v)
-{
-    unsigned long cs_ar_bytes;
+        /*
+         * Shadow path has not been optimized because it requires
+         * unconditionally trapping more CR4 bits, at which point the
+         * performance benefit of doing this is quite dubious.
+         */
+        if ( paging_mode_hap(v->domain) )
+        {
+            /*
+             * Update CR4 host mask to only trap when the guest tries to set
+             * bits that are controlled by the hypervisor.
+             */
+            v->arch.hvm.vmx.cr4_host_mask =
+                (HVM_CR4_HOST_MASK | X86_CR4_PKE |
+                 ~hvm_cr4_guest_valid_bits(v->domain));
 
-    if ( unlikely(!(v->arch.hvm.guest_cr[0] & X86_CR0_PE)) )
-        return 0;
-    if ( unlikely(guest_cpu_user_regs()->eflags & X86_EFLAGS_VM) )
-        return 1;
-    __vmread(GUEST_CS_AR_BYTES, &cs_ar_bytes);
-    if ( hvm_long_mode_active(v) &&
-         likely(cs_ar_bytes & X86_SEG_AR_CS_LM_ACTIVE) )
-        return 8;
-    return (likely(cs_ar_bytes & X86_SEG_AR_DEF_OP_SIZE) ? 4 : 2);
-}
+            v->arch.hvm.vmx.cr4_host_mask |= v->arch.hvm.vmx.vmx_realmode ?
+                                             X86_CR4_VME : 0;
+            v->arch.hvm.vmx.cr4_host_mask |= !hvm_paging_enabled(v) ?
+                                             (X86_CR4_PSE | X86_CR4_SMEP |
+                                              X86_CR4_SMAP)
+                                             : 0;
+            if ( v->domain->arch.monitor.write_ctrlreg_enabled &
+                 monitor_ctrlreg_bitmask(VM_EVENT_X86_CR4) )
+                v->arch.hvm.vmx.cr4_host_mask |=
+                ~v->domain->arch.monitor.write_ctrlreg_mask[VM_EVENT_X86_CR4];
 
-static void vmx_save_dr(struct vcpu *v)
-{
-    if ( !v->arch.hvm.flag_dr_dirty )
-        return;
+            if ( nestedhvm_vcpu_in_guestmode(v) )
+                /* Add the nested host mask to get the more restrictive one. */
+                v->arch.hvm.vmx.cr4_host_mask |= get_vvmcs(v,
+                                                           CR4_GUEST_HOST_MASK);
 
-    /* Clear the DR dirty flag and re-enable intercepts for DR accesses. */
-    v->arch.hvm.flag_dr_dirty = 0;
-    v->arch.hvm.vmx.exec_control |= CPU_BASED_MOV_DR_EXITING;
-    vmx_update_cpu_exec_control(v);
+            __vmwrite(CR4_GUEST_HOST_MASK, v->arch.hvm.vmx.cr4_host_mask);
+        }
 
-    v->arch.dr[0] = read_debugreg(0);
-    v->arch.dr[1] = read_debugreg(1);
-    v->arch.dr[2] = read_debugreg(2);
-    v->arch.dr[3] = read_debugreg(3);
-    v->arch.dr6   = read_debugreg(6);
-    /* DR7 must be saved as it is used by vmx_restore_dr(). */
-    __vmread(GUEST_DR7, &v->arch.dr7);
-}
+        break;
+
+    case 2:
+        /* CR2 is updated in exit stub. */
+        break;
+
+    case 3:
+        if ( paging_mode_hap(v->domain) )
+        {
+            if ( !hvm_paging_enabled(v) && !vmx_unrestricted_guest(v) )
+                v->arch.hvm.hw_cr[3] =
+                    v->domain->arch.hvm.params[HVM_PARAM_IDENT_PT];
+            vmx_load_pdptrs(v);
+        }
 
-static void __restore_debug_registers(struct vcpu *v)
-{
-    if ( v->arch.hvm.flag_dr_dirty )
-        return;
+        __vmwrite(GUEST_CR3, v->arch.hvm.hw_cr[3]);
 
-    v->arch.hvm.flag_dr_dirty = 1;
+        if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
+            hvm_asid_flush_vcpu(v);
+        break;
 
-    write_debugreg(0, v->arch.dr[0]);
-    write_debugreg(1, v->arch.dr[1]);
-    write_debugreg(2, v->arch.dr[2]);
-    write_debugreg(3, v->arch.dr[3]);
-    write_debugreg(6, v->arch.dr6);
-    /* DR7 is loaded from the VMCS. */
-}
+    default:
+        BUG();
+    }
 
-/*
- * DR7 is saved and restored on every vmexit.  Other debug registers only
- * need to be restored if their value is going to affect execution -- i.e.,
- * if one of the breakpoints is enabled.  So mask out all bits that don't
- * enable some breakpoint functionality.
- */
-static void vmx_restore_dr(struct vcpu *v)
-{
-    /* NB. __vmread() is not usable here, so we cannot read from the VMCS. */
-    if ( unlikely(v->arch.dr7 & DR7_ACTIVE_MASK) )
-        __restore_debug_registers(v);
+    vmx_vmcs_exit(v);
 }
 
-static void vmx_vmcs_save(struct vcpu *v, struct hvm_hw_cpu *c)
+static void cf_check vmx_update_guest_efer(struct vcpu *v)
 {
-    unsigned long ev;
-
-    vmx_vmcs_enter(v);
+    unsigned long entry_ctls, guest_efer = v->arch.hvm.guest_efer,
+        xen_efer = read_efer();
 
-    __vmread(GUEST_SYSENTER_CS, &c->sysenter_cs);
-    __vmread(GUEST_SYSENTER_ESP, &c->sysenter_esp);
-    __vmread(GUEST_SYSENTER_EIP, &c->sysenter_eip);
+    if ( paging_mode_shadow(v->domain) )
+    {
+        /*
+         * When using shadow pagetables, EFER.NX is a Xen-owned bit and is not
+         * under guest control.
+         */
+        guest_efer &= ~EFER_NXE;
+        guest_efer |= xen_efer & EFER_NXE;
+    }
 
-    __vmread(VM_ENTRY_INTR_INFO, &ev);
-    if ( (ev & INTR_INFO_VALID_MASK) &&
-         hvm_event_needs_reinjection(MASK_EXTR(ev, INTR_INFO_INTR_TYPE_MASK),
-                                     ev & INTR_INFO_VECTOR_MASK) )
+    if ( !vmx_unrestricted_guest(v) )
     {
-        c->pending_event = ev;
-        __vmread(VM_ENTRY_EXCEPTION_ERROR_CODE, &ev);
-        c->error_code = ev;
+        /*
+         * When Unrestricted Guest is not enabled in the VMCS, hardware does
+         * not tolerate the LME and LMA settings being different.  As writes
+         * to CR0 are intercepted, it is safe to leave LME clear at this
+         * point, and fix up both LME and LMA when CR0.PG is set.
+         *
+         * Furthermore, when using shadow pagetables (subsumed by the
+         * Unrestricted Guest check), CR0.PG is a Xen-owned bit, and remains
+         * set even when the guest has logically disabled paging.  LMA was
+         * calculated using the guest CR0.PG setting, but LME needs clearing
+         * to avoid interacting with Xen's CR0.PG setting.
+         */
+        if ( !(guest_efer & EFER_LMA) )
+            guest_efer &= ~EFER_LME;
     }
 
-    vmx_vmcs_exit(v);
-}
+    vmx_vmcs_enter(v);
 
-static int vmx_restore_cr0_cr3(
-    struct vcpu *v, unsigned long cr0, unsigned long cr3)
-{
-    struct page_info *page = NULL;
+    /*
+     * The intended guest running mode is derived from VM_ENTRY_IA32E_MODE,
+     * which (architecturally) is the guest's LMA setting.
+     */
+    __vmread(VM_ENTRY_CONTROLS, &entry_ctls);
 
-    if ( paging_mode_shadow(v->domain) )
+    entry_ctls &= ~VM_ENTRY_IA32E_MODE;
+    if ( guest_efer & EFER_LMA )
+        entry_ctls |= VM_ENTRY_IA32E_MODE;
+
+    __vmwrite(VM_ENTRY_CONTROLS, entry_ctls);
+
+    /* We expect to use EFER loading in the common case, but... */
+    if ( likely(cpu_has_vmx_efer) )
+        __vmwrite(GUEST_EFER, guest_efer);
+
+    /* ... on Gen1 VT-x hardware, we have to use MSR load/save lists instead. */
+    else
     {
-        if ( cr0 & X86_CR0_PG )
+        /*
+         * When the guests choice of EFER matches Xen's, remove the load/save
+         * list entries.  It is unnecessary overhead, especially as this is
+         * expected to be the common case for 64bit guests.
+         */
+        if ( guest_efer == xen_efer )
         {
-            page = get_page_from_gfn(v->domain, cr3 >> PAGE_SHIFT,
-                                     NULL, P2M_ALLOC);
-            if ( !page )
-            {
-                gdprintk(XENLOG_ERR, "Invalid CR3 value=%#lx\n", cr3);
-                return -EINVAL;
-            }
+            vmx_del_msr(v, MSR_EFER, VMX_MSR_HOST);
+            vmx_del_msr(v, MSR_EFER, VMX_MSR_GUEST_LOADONLY);
+        }
+        else
+        {
+            vmx_add_msr(v, MSR_EFER, xen_efer, VMX_MSR_HOST);
+            vmx_add_msr(v, MSR_EFER, guest_efer, VMX_MSR_GUEST_LOADONLY);
         }
+    }
 
-        if ( hvm_paging_enabled(v) )
-            put_page(pagetable_get_page(v->arch.guest_table));
+    vmx_vmcs_exit(v);
 
-        v->arch.guest_table =
-            page ? pagetable_from_page(page) : pagetable_null();
-    }
+    /*
+     * If the guests virtualised view of MSR_EFER matches the value loaded
+     * into hardware, clear the read intercept to avoid unnecessary VMExits.
+     */
+    if ( guest_efer == v->arch.hvm.guest_efer )
+        vmx_clear_msr_intercept(v, MSR_EFER, VMX_MSR_R);
+    else
+        vmx_set_msr_intercept(v, MSR_EFER, VMX_MSR_R);
+}
 
-    v->arch.hvm.guest_cr[0] = cr0 | X86_CR0_ET;
-    v->arch.hvm.guest_cr[3] = cr3;
+static void cf_check vmx_wbinvd_intercept(void)
+{
+    if ( !cache_flush_permitted(current->domain) || iommu_snoop )
+        return;
 
-    return 0;
+    if ( cpu_has_wbinvd_exiting )
+        flush_all(FLUSH_CACHE);
+    else
+        wbinvd();
 }
 
-static int vmx_vmcs_restore(struct vcpu *v, struct hvm_hw_cpu *c)
+static void cf_check vmx_fpu_dirty_intercept(void)
 {
-    int rc;
+    struct vcpu *curr = current;
 
-    if ( c->pending_valid )
+    vmx_fpu_enter(curr);
+
+    /* Disable TS in guest CR0 unless the guest wants the exception too. */
+    if ( !(curr->arch.hvm.guest_cr[0] & X86_CR0_TS) )
     {
-        if ( (c->pending_type == 1) || (c->pending_type > 6) ||
-             (c->pending_reserved != 0) )
+        curr->arch.hvm.hw_cr[0] &= ~X86_CR0_TS;
+        __vmwrite(GUEST_CR0, curr->arch.hvm.hw_cr[0]);
+    }
+}
+
+static const struct lbr_info {
+    u32 base, count;
+} p4_lbr[] = {
+    { MSR_P4_LER_FROM_LIP,          1 },
+    { MSR_P4_LER_TO_LIP,            1 },
+    { MSR_P4_LASTBRANCH_TOS,        1 },
+    { MSR_P4_LASTBRANCH_0_FROM_LIP, NUM_MSR_P4_LASTBRANCH_FROM_TO },
+    { MSR_P4_LASTBRANCH_0_TO_LIP,   NUM_MSR_P4_LASTBRANCH_FROM_TO },
+    { 0, 0 }
+}, c2_lbr[] = {
+    { MSR_IA32_LASTINTFROMIP,       1 },
+    { MSR_IA32_LASTINTTOIP,         1 },
+    { MSR_C2_LASTBRANCH_TOS,        1 },
+    { MSR_C2_LASTBRANCH_0_FROM_IP,  NUM_MSR_C2_LASTBRANCH_FROM_TO },
+    { MSR_C2_LASTBRANCH_0_TO_IP,    NUM_MSR_C2_LASTBRANCH_FROM_TO },
+    { 0, 0 }
+}, nh_lbr[] = {
+    { MSR_IA32_LASTINTFROMIP,       1 },
+    { MSR_IA32_LASTINTTOIP,         1 },
+    { MSR_NHL_LBR_SELECT,           1 },
+    { MSR_NHL_LASTBRANCH_TOS,       1 },
+    { MSR_P4_LASTBRANCH_0_FROM_LIP, NUM_MSR_P4_LASTBRANCH_FROM_TO },
+    { MSR_P4_LASTBRANCH_0_TO_LIP,   NUM_MSR_P4_LASTBRANCH_FROM_TO },
+    { 0, 0 }
+}, sk_lbr[] = {
+    { MSR_IA32_LASTINTFROMIP,       1 },
+    { MSR_IA32_LASTINTTOIP,         1 },
+    { MSR_NHL_LBR_SELECT,           1 },
+    { MSR_NHL_LASTBRANCH_TOS,       1 },
+    { MSR_SKL_LASTBRANCH_0_FROM_IP, NUM_MSR_SKL_LASTBRANCH },
+    { MSR_SKL_LASTBRANCH_0_TO_IP,   NUM_MSR_SKL_LASTBRANCH },
+    { MSR_SKL_LASTBRANCH_0_INFO,    NUM_MSR_SKL_LASTBRANCH },
+    { 0, 0 }
+}, at_lbr[] = {
+    { MSR_IA32_LASTINTFROMIP,       1 },
+    { MSR_IA32_LASTINTTOIP,         1 },
+    { MSR_C2_LASTBRANCH_TOS,        1 },
+    { MSR_C2_LASTBRANCH_0_FROM_IP,  NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
+    { MSR_C2_LASTBRANCH_0_TO_IP,    NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
+    { 0, 0 }
+}, sm_lbr[] = {
+    { MSR_IA32_LASTINTFROMIP,       1 },
+    { MSR_IA32_LASTINTTOIP,         1 },
+    { MSR_SM_LBR_SELECT,            1 },
+    { MSR_SM_LASTBRANCH_TOS,        1 },
+    { MSR_C2_LASTBRANCH_0_FROM_IP,  NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
+    { MSR_C2_LASTBRANCH_0_TO_IP,    NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
+    { 0, 0 }
+}, gm_lbr[] = {
+    { MSR_IA32_LASTINTFROMIP,       1 },
+    { MSR_IA32_LASTINTTOIP,         1 },
+    { MSR_SM_LBR_SELECT,            1 },
+    { MSR_SM_LASTBRANCH_TOS,        1 },
+    { MSR_GM_LASTBRANCH_0_FROM_IP,  NUM_MSR_GM_LASTBRANCH_FROM_TO },
+    { MSR_GM_LASTBRANCH_0_TO_IP,    NUM_MSR_GM_LASTBRANCH_FROM_TO },
+    { 0, 0 }
+};
+static const struct lbr_info *__ro_after_init model_specific_lbr;
+
+static const struct lbr_info *__init get_model_specific_lbr(void)
+{
+    switch ( boot_cpu_data.x86 )
+    {
+    case 6:
+        switch ( boot_cpu_data.x86_model )
         {
-            dprintk(XENLOG_ERR, "%pv: Invalid pending event %#"PRIx32"\n",
-                    v, c->pending_event);
-            return -EINVAL;
+        /* Core2 Duo */
+        case 0x0f:
+        /* Enhanced Core */
+        case 0x17:
+        /* Xeon 7400 */
+        case 0x1d:
+            return c2_lbr;
+        /* Nehalem */
+        case 0x1a: case 0x1e: case 0x1f: case 0x2e:
+        /* Westmere */
+        case 0x25: case 0x2c: case 0x2f:
+        /* Sandy Bridge */
+        case 0x2a: case 0x2d:
+        /* Ivy Bridge */
+        case 0x3a: case 0x3e:
+        /* Haswell */
+        case 0x3c: case 0x3f: case 0x45: case 0x46:
+        /* Broadwell */
+        case 0x3d: case 0x47: case 0x4f: case 0x56:
+            return nh_lbr;
+        /* Skylake */
+        case 0x4e: case 0x5e:
+        /* Xeon Scalable */
+        case 0x55:
+        /* Cannon Lake */
+        case 0x66:
+        /* Goldmont Plus */
+        case 0x7a:
+        /* Ice Lake */
+        case 0x6a: case 0x6c: case 0x7d: case 0x7e:
+        /* Tiger Lake */
+        case 0x8c: case 0x8d:
+        /* Tremont */
+        case 0x86:
+        /* Kaby Lake */
+        case 0x8e: case 0x9e:
+        /* Comet Lake */
+        case 0xa5: case 0xa6:
+            return sk_lbr;
+        /* Atom */
+        case 0x1c: case 0x26: case 0x27: case 0x35: case 0x36:
+            return at_lbr;
+        /* Silvermont */
+        case 0x37: case 0x4a: case 0x4d: case 0x5a: case 0x5d:
+        /* Xeon Phi Knights Landing */
+        case 0x57:
+        /* Xeon Phi Knights Mill */
+        case 0x85:
+        /* Airmont */
+        case 0x4c:
+            return sm_lbr;
+        /* Goldmont */
+        case 0x5c: case 0x5f:
+            return gm_lbr;
         }
+        break;
 
-        if ( c->pending_error_valid &&
-             c->error_code != (uint16_t)c->error_code )
+    case 15:
+        switch ( boot_cpu_data.x86_model )
         {
-            dprintk(XENLOG_ERR, "%pv: Invalid error code %#"PRIx32"\n",
-                    v, c->error_code);
-            return -EINVAL;
+        /* Pentium4/Xeon with em64t */
+        case 3: case 4: case 6:
+            return p4_lbr;
         }
+        break;
     }
 
-    rc = vmx_restore_cr0_cr3(v, c->cr0, c->cr3);
-    if ( rc )
-        return rc;
-
-    vmx_vmcs_enter(v);
-
-    v->arch.hvm.guest_cr[4] = c->cr4;
-    vmx_update_guest_cr(v, 0, 0);
-    vmx_update_guest_cr(v, 4, 0);
-
-    v->arch.hvm.guest_efer = c->msr_efer;
-    vmx_update_guest_efer(v);
-
-    __vmwrite(GUEST_SYSENTER_CS, c->sysenter_cs);
-    __vmwrite(GUEST_SYSENTER_ESP, c->sysenter_esp);
-    __vmwrite(GUEST_SYSENTER_EIP, c->sysenter_eip);
-
-    __vmwrite(GUEST_DR7, c->dr7);
-
-    if ( c->pending_valid &&
-         hvm_event_needs_reinjection(c->pending_type, c->pending_vector) )
-    {
-        gdprintk(XENLOG_INFO, "Re-injecting %#"PRIx32", %#"PRIx32"\n",
-                 c->pending_event, c->error_code);
-        __vmwrite(VM_ENTRY_INTR_INFO, c->pending_event);
-        __vmwrite(VM_ENTRY_EXCEPTION_ERROR_CODE, c->error_code);
-    }
-    else
-    {
-        __vmwrite(VM_ENTRY_INTR_INFO, 0);
-        __vmwrite(VM_ENTRY_EXCEPTION_ERROR_CODE, 0);
-    }
-    vmx_vmcs_exit(v);
-
-    paging_update_paging_modes(v);
-
-    return 0;
-}
-
-static void vmx_save_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
-{
-    data->shadow_gs        = v->arch.hvm.vmx.shadow_gs;
-    data->msr_lstar        = v->arch.hvm.vmx.lstar;
-    data->msr_star         = v->arch.hvm.vmx.star;
-    data->msr_cstar        = v->arch.hvm.vmx.cstar;
-    data->msr_syscall_mask = v->arch.hvm.vmx.sfmask;
+    return NULL;
 }
 
-static void vmx_load_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
+static int is_last_branch_msr(u32 ecx)
 {
-    v->arch.hvm.vmx.shadow_gs = data->shadow_gs;
-    v->arch.hvm.vmx.star      = data->msr_star;
-    v->arch.hvm.vmx.lstar     = data->msr_lstar;
-    v->arch.hvm.vmx.cstar     = data->msr_cstar;
-    v->arch.hvm.vmx.sfmask    = data->msr_syscall_mask;
-}
+    const struct lbr_info *lbr = model_specific_lbr;
 
+    if ( lbr == NULL )
+        return 0;
 
-static void cf_check vmx_save_vmcs_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
-{
-    if ( v == current )
-        vmx_save_guest_msrs(v);
+    for ( ; lbr->count; lbr++ )
+        if ( (ecx >= lbr->base) && (ecx < (lbr->base + lbr->count)) )
+            return 1;
 
-    vmx_save_cpu_state(v, ctxt);
-    vmx_vmcs_save(v, ctxt);
+    return 0;
 }
 
-static int cf_check vmx_load_vmcs_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
+enum
 {
-    /* Not currently safe to use in current context. */
-    ASSERT(v != current);
-
-    vmx_load_cpu_state(v, ctxt);
+    LBR_FORMAT_32                 = 0x0, /* 32-bit record format */
+    LBR_FORMAT_LIP                = 0x1, /* 64-bit LIP record format */
+    LBR_FORMAT_EIP                = 0x2, /* 64-bit EIP record format */
+    LBR_FORMAT_EIP_FLAGS          = 0x3, /* 64-bit EIP, Flags */
+    LBR_FORMAT_EIP_FLAGS_TSX      = 0x4, /* 64-bit EIP, Flags, TSX */
+    LBR_FORMAT_EIP_FLAGS_TSX_INFO = 0x5, /* 64-bit EIP, Flags, TSX, LBR_INFO */
+    LBR_FORMAT_EIP_FLAGS_CYCLES   = 0x6, /* 64-bit EIP, Flags, Cycles */
+    LBR_FORMAT_LIP_FLAGS_TSX_INFO = 0x7, /* 64-bit LIP, Flags, TSX, LBR_INFO */
+};
 
-    if ( vmx_vmcs_restore(v, ctxt) )
-    {
-        gdprintk(XENLOG_ERR, "vmx_vmcs restore failed!\n");
-        domain_crash(v->domain);
-        return -EINVAL;
-    }
+#define LBR_FROM_SIGNEXT_2MSB  ((1ULL << 59) | (1ULL << 60))
 
-    return 0;
-}
+#define LBR_MSRS_INSERTED      (1u << 0)
+#define LBR_FIXUP_TSX          (1u << 1)
+#define LBR_FIXUP_LER_TO       (1u << 2)
+#define LBR_FIXUP_MASK         (LBR_FIXUP_TSX | LBR_FIXUP_LER_TO)
 
-static void vmx_fpu_enter(struct vcpu *v)
-{
-    vcpu_restore_fpu_lazy(v);
-    v->arch.hvm.vmx.exception_bitmap &= ~(1u << TRAP_no_device);
-    vmx_update_exception_bitmap(v);
-    v->arch.hvm.vmx.host_cr0 &= ~X86_CR0_TS;
-    __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
-}
+static bool __read_mostly lbr_tsx_fixup_needed;
+static bool __read_mostly ler_to_fixup_needed;
 
-static void cf_check vmx_fpu_leave(struct vcpu *v)
+static void __init lbr_tsx_fixup_check(void)
 {
-    ASSERT(!v->fpu_dirtied);
-    ASSERT(read_cr0() & X86_CR0_TS);
-
-    if ( !(v->arch.hvm.vmx.host_cr0 & X86_CR0_TS) )
-    {
-        v->arch.hvm.vmx.host_cr0 |= X86_CR0_TS;
-        __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
-    }
+    uint64_t caps;
+    uint32_t lbr_format;
 
     /*
-     * If the guest does not have TS enabled then we must cause and handle an
-     * exception on first use of the FPU. If the guest *does* have TS enabled
-     * then this is not necessary: no FPU activity can occur until the guest
-     * clears CR0.TS, and we will initialise the FPU when that happens.
+     * Haswell erratum HSM182 et al, Broadwell erratum BDM127 et al:
+     *
+     * On processors that do not support Intel Transactional Synchronization
+     * Extensions (Intel TSX) (CPUID.07H.EBX bits 4 and 11 are both zero),
+     * writes to MSR_LASTBRANCH_x_FROM_IP (MSR 680H to 68FH) may #GP unless
+     * bits[62:61] are equal to bit[47].
+     *
+     * Software should sign extend the MSRs.
+     *
+     * Experimentally, MSR_LER_FROM_LIP (1DDH) is similarly impacted, so is
+     * fixed up as well.
      */
-    if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
+    if ( cpu_has_hle || cpu_has_rtm ||
+         boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
+         boot_cpu_data.x86 != 6 )
+        return;
+
+    switch ( boot_cpu_data.x86_model )
     {
-        v->arch.hvm.hw_cr[0] |= X86_CR0_TS;
-        __vmwrite(GUEST_CR0, v->arch.hvm.hw_cr[0]);
-        v->arch.hvm.vmx.exception_bitmap |= (1u << TRAP_no_device);
-        vmx_update_exception_bitmap(v);
+    case 0x3c: /* HSM182, HSD172 - 4th gen Core */
+    case 0x3f: /* HSE117 - Xeon E5 v3 */
+    case 0x45: /* HSM182 - 4th gen Core */
+    case 0x46: /* HSM182, HSD172 - 4th gen Core (GT3) */
+    case 0x3d: /* BDM127 - 5th gen Core */
+    case 0x47: /* BDD117 - 5th gen Core (GT3)
+                  BDW117 - Xeon E3-1200 v4 */
+    case 0x4f: /* BDF85  - Xeon E5-2600 v4
+                  BDH75  - Core-i7 for LGA2011-v3 Socket
+                  BDX88  - Xeon E7-x800 v4 */
+    case 0x56: /* BDE105 - Xeon D-1500 */
+        break;
+    default:
+        return;
     }
-}
 
-static void cf_check vmx_ctxt_switch_from(struct vcpu *v)
-{
     /*
-     * Return early if trying to do a context switch without VMX enabled,
-     * this can happen when the hypervisor shuts down with HVM guests
-     * still running.
+     * Fixup is needed only when TSX support is disabled and the address
+     * format of LBR includes TSX bits 61:62
      */
-    if ( unlikely(!this_cpu(vmxon)) )
+    if ( !cpu_has_pdcm )
         return;
 
-    if ( !v->is_running )
-    {
-        /*
-         * When this vCPU isn't marked as running anymore, a remote pCPU's
-         * attempt to pause us (from vmx_vmcs_enter()) won't have a reason
-         * to spin in vcpu_sleep_sync(), and hence that pCPU might have taken
-         * away the VMCS from us. As we're running with interrupts disabled,
-         * we also can't call vmx_vmcs_enter().
-         */
-        vmx_vmcs_reload(v);
-    }
-
-    if ( !v->arch.fully_eager_fpu )
-        vmx_fpu_leave(v);
-    vmx_save_guest_msrs(v);
-    vmx_restore_host_msrs();
-    vmx_save_dr(v);
-
-    if ( v->domain->arch.hvm.pi_ops.flags & PI_CSW_FROM )
-        vmx_pi_switch_from(v);
-}
-
-static void cf_check vmx_ctxt_switch_to(struct vcpu *v)
-{
-    vmx_restore_guest_msrs(v);
-    vmx_restore_dr(v);
+    rdmsrl(MSR_IA32_PERF_CAPABILITIES, caps);
+    lbr_format = caps & MSR_IA32_PERF_CAP_LBR_FORMAT;
 
-    if ( v->domain->arch.hvm.pi_ops.flags & PI_CSW_TO )
-        vmx_pi_switch_to(v);
+    if ( lbr_format == LBR_FORMAT_EIP_FLAGS_TSX )
+        lbr_tsx_fixup_needed = true;
 }
 
-
-unsigned int vmx_get_cpl(void)
+static void __init ler_to_fixup_check(void)
 {
-    unsigned long attr;
-
-    __vmread(GUEST_SS_AR_BYTES, &attr);
+    /*
+     * Broadwell erratum BDF93 et al:
+     *
+     * Reads from MSR_LER_TO_LIP (MSR 1DEH) may return values for bits[63:61]
+     * that are not equal to bit[47].  Attempting to context switch this value
+     * may cause a #GP.  Software should sign extend the MSR.
+     */
+    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
+         boot_cpu_data.x86 != 6 )
+        return;
 
-    return (attr >> 5) & 3;
+    switch ( boot_cpu_data.x86_model )
+    {
+    case 0x3d: /* BDM131 - 5th gen Core */
+    case 0x47: /* BDD??? - 5th gen Core (H-Processor line)
+                  BDW120 - Xeon E3-1200 v4 */
+    case 0x4f: /* BDF93  - Xeon E5-2600 v4
+                  BDH80  - Core-i7 for LGA2011-v3 Socket
+                  BDX93  - Xeon E7-x800 v4 */
+    case 0x56: /* BDE??? - Xeon D-1500 */
+        ler_to_fixup_needed = true;
+        break;
+    }
 }
 
-static unsigned int cf_check _vmx_get_cpl(struct vcpu *v)
+static int cf_check vmx_msr_read_intercept(
+    unsigned int msr, uint64_t *msr_content)
 {
-    unsigned int cpl;
+    struct vcpu *curr = current;
+    uint64_t tmp;
 
-    vmx_vmcs_enter(v);
-    cpl = vmx_get_cpl();
-    vmx_vmcs_exit(v);
+    HVM_DBG_LOG(DBG_LEVEL_MSR, "ecx=%#x", msr);
 
-    return cpl;
-}
+    switch ( msr )
+    {
+    case MSR_IA32_SYSENTER_CS:
+        __vmread(GUEST_SYSENTER_CS, msr_content);
+        break;
+    case MSR_IA32_SYSENTER_ESP:
+        __vmread(GUEST_SYSENTER_ESP, msr_content);
+        break;
+    case MSR_IA32_SYSENTER_EIP:
+        __vmread(GUEST_SYSENTER_EIP, msr_content);
+        break;
 
-/*
- * SDM Vol 3: VM Entries > Checks on Guest Segment Registers:
- *
- * We can only enter virtual 8086 mode if all of CS, SS, DS, ES, FS and GS are
- * 16bit ring-3 data segments.  On hardware lacking the unrestricted_guest
- * feature, Xen fakes up real mode using vm86 mode.  The guest thinks it's got
- * ring-0 segments, so we need to fudge things.  We store the ring-3 version
- * in the VMCS to avoid lots of shuffling on vmenter and vmexit, and translate
- * in these accessors.
- */
-#define rm_cs_attr   0x9b
-#define rm_ds_attr   0x93
-#define vm86_ds_attr 0xf3
-#define vm86_tr_attr 0x8b
+    case MSR_FS_BASE:
+        __vmread(GUEST_FS_BASE, msr_content);
+        break;
 
-static void cf_check vmx_get_segment_register(
-    struct vcpu *v, enum x86_segment seg, struct segment_register *reg)
-{
-    unsigned long attr = 0, sel = 0, limit;
-    unsigned int tmp_seg;
+    case MSR_GS_BASE:
+        __vmread(GUEST_GS_BASE, msr_content);
+        break;
 
-    /*
-     * We may get here in the context of dump_execstate(), which may have
-     * interrupted context switching between setting "current" and
-     * vmx_do_resume() reaching the end of vmx_load_vmcs(). That would make
-     * all the VMREADs below fail if we don't bail right away.
-     */
-    if ( unlikely(!vmx_vmcs_try_enter(v)) )
-    {
-        static bool_t warned;
+    case MSR_SHADOW_GS_BASE:
+        *msr_content = read_gs_shadow();
+        break;
 
-        if ( !warned )
-        {
-            warned = 1;
-            printk(XENLOG_WARNING "Segment register inaccessible for %pv\n"
-                   "(If you see this outside of debugging activity,"
-                   " please report to xen-devel@lists.xenproject.org)\n",
-                   v);
-        }
-        memset(reg, 0, sizeof(*reg));
-        return;
-    }
+    case MSR_STAR:
+        *msr_content = curr->arch.hvm.vmx.star;
+        break;
 
-    /*
-     * Xen's x86_seg_* enumeration *almost* matches the VMCS encoding order.
-     *
-     * tr and ldtr are reversed, and other areas of code rely on this, so we
-     * can't just re-enumerate.
-     */
-    BUILD_BUG_ON(x86_seg_tr   != 6);
-    BUILD_BUG_ON(x86_seg_ldtr != 7);
-    BUILD_BUG_ON(x86_seg_gdtr != 8);
-    BUILD_BUG_ON(x86_seg_idtr != 9);
-    switch ( tmp_seg = seg )
-    {
-    case x86_seg_tr:
-    case x86_seg_ldtr:
-        tmp_seg ^= 1; /* Flip tr and ldtr so GUEST_SEG_*() works. */
-        fallthrough;
+    case MSR_LSTAR:
+        *msr_content = curr->arch.hvm.vmx.lstar;
+        break;
 
-    case x86_seg_es ... x86_seg_gs:
-        __vmread(GUEST_SEG_SELECTOR(tmp_seg), &sel);
-        __vmread(GUEST_SEG_AR_BYTES(tmp_seg), &attr);
-        fallthrough;
+    case MSR_CSTAR:
+        *msr_content = curr->arch.hvm.vmx.cstar;
+        break;
 
-    case x86_seg_gdtr:
-    case x86_seg_idtr:
-        __vmread(GUEST_SEG_LIMIT(tmp_seg),    &limit);
-        __vmread(GUEST_SEG_BASE(tmp_seg),     &reg->base);
+    case MSR_SYSCALL_MASK:
+        *msr_content = curr->arch.hvm.vmx.sfmask;
         break;
 
-    default:
-        BUG();
-        return;
-    }
+    case MSR_IA32_DEBUGCTLMSR:
+        __vmread(GUEST_IA32_DEBUGCTL, msr_content);
+        break;
 
-    vmx_vmcs_exit(v);
+    case MSR_IA32_VMX_BASIC...MSR_IA32_VMX_VMFUNC:
+        if ( !nvmx_msr_read_intercept(msr, msr_content) )
+            goto gp_fault;
+        break;
+    case MSR_IA32_MISC_ENABLE:
+        rdmsrl(MSR_IA32_MISC_ENABLE, *msr_content);
+        /* Debug Trace Store is not supported. */
+        *msr_content |= MSR_IA32_MISC_ENABLE_BTS_UNAVAIL |
+                       MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL;
+        /* Perhaps vpmu will change some bits. */
+        /* FALLTHROUGH */
+    case MSR_P6_PERFCTR(0)...MSR_P6_PERFCTR(7):
+    case MSR_P6_EVNTSEL(0)...MSR_P6_EVNTSEL(3):
+    case MSR_CORE_PERF_FIXED_CTR0...MSR_CORE_PERF_FIXED_CTR2:
+    case MSR_CORE_PERF_FIXED_CTR_CTRL...MSR_CORE_PERF_GLOBAL_OVF_CTRL:
+    case MSR_IA32_PEBS_ENABLE:
+    case MSR_IA32_DS_AREA:
+        if ( vpmu_do_rdmsr(msr, msr_content) )
+            goto gp_fault;
+        break;
 
-    reg->sel = sel;
-    reg->limit = limit;
+    default:
+        if ( passive_domain_do_rdmsr(msr, msr_content) )
+            goto done;
 
-    /*
-     * Fold VT-x representation into Xen's representation.  The Present bit is
-     * unconditionally set to the inverse of unusable.
-     */
-    reg->attr =
-        (!(attr & (1u << 16)) << 7) | (attr & 0x7f) | ((attr >> 4) & 0xf00);
+        if ( vmx_read_guest_msr(curr, msr, msr_content) == 0 )
+            break;
 
-    /* Adjust for virtual 8086 mode */
-    if ( v->arch.hvm.vmx.vmx_realmode && seg <= x86_seg_tr
-         && !(v->arch.hvm.vmx.vm86_segment_mask & (1u << seg)) )
-    {
-        struct segment_register *sreg = &v->arch.hvm.vmx.vm86_saved_seg[seg];
-        if ( seg == x86_seg_tr ) 
-            *reg = *sreg;
-        else if ( reg->base != sreg->base || seg == x86_seg_ss )
+        if ( is_last_branch_msr(msr) )
         {
-            /* If the guest's reloaded the segment, remember the new version.
-             * We can't tell if the guest reloaded the segment with another 
-             * one that has the same base.  By default we assume it hasn't,
-             * since we don't want to lose big-real-mode segment attributes,
-             * but for SS we assume it has: the Ubuntu graphical bootloader
-             * does this and gets badly confused if we leave the old SS in 
-             * place. */
-            reg->attr = (seg == x86_seg_cs ? rm_cs_attr : rm_ds_attr);
-            *sreg = *reg;
+            *msr_content = 0;
+            break;
         }
-        else 
+
+        if ( curr->domain->arch.msr_relaxed && !rdmsr_safe(msr, tmp) )
         {
-            /* Always give realmode guests a selector that matches the base
-             * but keep the attr and limit from before */
-            *reg = *sreg;
-            reg->sel = reg->base >> 4;
+            *msr_content = 0;
+            break;
         }
+
+        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
+        goto gp_fault;
     }
+
+done:
+    HVM_DBG_LOG(DBG_LEVEL_MSR, "returns: ecx=%#x, msr_value=%#"PRIx64,
+                msr, *msr_content);
+    return X86EMUL_OKAY;
+
+gp_fault:
+    return X86EMUL_EXCEPTION;
 }
 
-static void cf_check vmx_set_segment_register(
-    struct vcpu *v, enum x86_segment seg, struct segment_register *reg)
+static int cf_check vmx_msr_write_intercept(
+    unsigned int msr, uint64_t msr_content)
 {
-    uint32_t attr, sel, limit;
-    uint64_t base;
+    struct vcpu *v = current;
+    const struct cpuid_policy *cp = v->domain->arch.cpuid;
 
-    sel = reg->sel;
-    attr = reg->attr;
-    limit = reg->limit;
-    base = reg->base;
+    HVM_DBG_LOG(DBG_LEVEL_MSR, "ecx=%#x, msr_value=%#"PRIx64, msr, msr_content);
 
-    /* Adjust CS/SS/DS/ES/FS/GS/TR for virtual 8086 mode */
-    if ( v->arch.hvm.vmx.vmx_realmode && seg <= x86_seg_tr )
+    switch ( msr )
     {
-        /* Remember the proper contents */
-        v->arch.hvm.vmx.vm86_saved_seg[seg] = *reg;
-        
-        if ( seg == x86_seg_tr ) 
-        {
-            const struct domain *d = v->domain;
-            uint64_t val = d->arch.hvm.params[HVM_PARAM_VM86_TSS_SIZED];
+        uint64_t rsvd, tmp;
 
-            if ( val )
-            {
-                sel = 0;
-                attr = vm86_tr_attr;
-                limit = ((val & ~VM86_TSS_UPDATED) >> 32) - 1;
-                base = (uint32_t)val;
-                if ( val & VM86_TSS_UPDATED )
-                {
-                    hvm_prepare_vm86_tss(v, base, limit);
-                    cmpxchg(&d->arch.hvm.params[HVM_PARAM_VM86_TSS_SIZED],
-                            val, val & ~VM86_TSS_UPDATED);
-                }
-                v->arch.hvm.vmx.vm86_segment_mask &= ~(1u << seg);
-            }
-            else
-                v->arch.hvm.vmx.vm86_segment_mask |= (1u << seg);
-        }
-        else
-        {
-            /* Try to fake it out as a 16bit data segment.  This could
-             * cause confusion for the guest if it reads the selector,
-             * but otherwise we have to emulate if *any* segment hasn't
-             * been reloaded. */
-            if ( base < 0x100000 && !(base & 0xf) && limit >= 0xffff && reg->p )
-            {
-                sel = base >> 4;
-                attr = vm86_ds_attr;
-                limit = 0xffff;
-                v->arch.hvm.vmx.vm86_segment_mask &= ~(1u << seg);
-            }
-            else 
-                v->arch.hvm.vmx.vm86_segment_mask |= (1u << seg);
-        }
-    }
+    case MSR_IA32_SYSENTER_CS:
+        __vmwrite(GUEST_SYSENTER_CS, msr_content);
+        break;
+    case MSR_IA32_SYSENTER_ESP:
+        if ( !is_canonical_address(msr_content) )
+            goto gp_fault;
+        __vmwrite(GUEST_SYSENTER_ESP, msr_content);
+        break;
+    case MSR_IA32_SYSENTER_EIP:
+        if ( !is_canonical_address(msr_content) )
+            goto gp_fault;
+        __vmwrite(GUEST_SYSENTER_EIP, msr_content);
+        break;
 
-    /*
-     * Unfold Xen representation into VT-x representation.  The unusable bit
-     * is unconditionally set to the inverse of present.
-     */
-    attr = (!(attr & (1u << 7)) << 16) | ((attr & 0xf00) << 4) | (attr & 0xff);
+    case MSR_FS_BASE:
+    case MSR_GS_BASE:
+    case MSR_SHADOW_GS_BASE:
+        if ( !is_canonical_address(msr_content) )
+            goto gp_fault;
 
-    vmx_vmcs_enter(v);
+        if ( msr == MSR_FS_BASE )
+            __vmwrite(GUEST_FS_BASE, msr_content);
+        else if ( msr == MSR_GS_BASE )
+            __vmwrite(GUEST_GS_BASE, msr_content);
+        else
+            write_gs_shadow(msr_content);
 
-    switch ( seg )
-    {
-    case x86_seg_tr:
-    case x86_seg_ldtr:
-        seg ^= 1; /* Flip tr and ldtr so GUEST_SEG_*() works. */
-        fallthrough;
+        break;
 
-    case x86_seg_es ... x86_seg_gs:
-        __vmwrite(GUEST_SEG_SELECTOR(seg), sel);
-        __vmwrite(GUEST_SEG_AR_BYTES(seg), attr);
-        fallthrough;
+    case MSR_STAR:
+        v->arch.hvm.vmx.star = msr_content;
+        wrmsrl(MSR_STAR, msr_content);
+        break;
 
-    case x86_seg_gdtr:
-    case x86_seg_idtr:
-        __vmwrite(GUEST_SEG_LIMIT(seg),    limit);
-        __vmwrite(GUEST_SEG_BASE(seg),     base);
+    case MSR_LSTAR:
+        if ( !is_canonical_address(msr_content) )
+            goto gp_fault;
+        v->arch.hvm.vmx.lstar = msr_content;
+        wrmsrl(MSR_LSTAR, msr_content);
         break;
 
-    default:
-        BUG();
-    }
+    case MSR_CSTAR:
+        if ( !is_canonical_address(msr_content) )
+            goto gp_fault;
+        v->arch.hvm.vmx.cstar = msr_content;
+        break;
 
-    vmx_vmcs_exit(v);
-}
+    case MSR_SYSCALL_MASK:
+        v->arch.hvm.vmx.sfmask = msr_content;
+        wrmsrl(MSR_SYSCALL_MASK, msr_content);
+        break;
 
-static int cf_check vmx_set_guest_pat(struct vcpu *v, u64 gpat)
-{
-    if ( !paging_mode_hap(v->domain) ||
-         unlikely(v->arch.hvm.cache_mode == NO_FILL_CACHE_MODE) )
-        return 0;
+    case MSR_IA32_DEBUGCTLMSR:
+        rsvd = ~(IA32_DEBUGCTLMSR_LBR | IA32_DEBUGCTLMSR_BTF);
 
-    vmx_vmcs_enter(v);
-    __vmwrite(GUEST_PAT, gpat);
-    vmx_vmcs_exit(v);
-    return 1;
-}
+        /* TODO: Wire vPMU settings properly through the CPUID policy */
+        if ( vpmu_is_set(vcpu_vpmu(v), VPMU_CPU_HAS_BTS) )
+        {
+            rsvd &= ~(IA32_DEBUGCTLMSR_TR | IA32_DEBUGCTLMSR_BTS |
+                      IA32_DEBUGCTLMSR_BTINT);
 
-static int cf_check vmx_get_guest_pat(struct vcpu *v, u64 *gpat)
-{
-    if ( !paging_mode_hap(v->domain) ||
-         unlikely(v->arch.hvm.cache_mode == NO_FILL_CACHE_MODE) )
-        return 0;
+            if ( cpu_has(&current_cpu_data, X86_FEATURE_DSCPL) )
+                rsvd &= ~(IA32_DEBUGCTLMSR_BTS_OFF_OS |
+                          IA32_DEBUGCTLMSR_BTS_OFF_USR);
+        }
 
-    vmx_vmcs_enter(v);
-    __vmread(GUEST_PAT, gpat);
-    vmx_vmcs_exit(v);
-    return 1;
-}
+        if ( cp->feat.rtm )
+            rsvd &= ~IA32_DEBUGCTLMSR_RTM;
+
+        if ( msr_content & rsvd )
+            goto gp_fault;
 
-static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
-{
-    if ( !paging_mode_hap(v->domain) )
-    {
         /*
-         * For shadow, 'load IA32_PAT' VM-entry control is 0, so it cannot
-         * set guest memory type as UC via IA32_PAT. Xen drop all shadows
-         * so that any new ones would be created on demand.
+         * The Arch LBR spec (new in Ice Lake) states that CPUs with no
+         * model-specific LBRs implement MSR_DBG_CTL.LBR by discarding writes
+         * and always returning 0.
+         *
+         * Use this property in all cases where we don't know any
+         * model-specific LBR information, as it matches real hardware
+         * behaviour on post-Ice Lake systems.
          */
-        hvm_shadow_handle_cd(v, value);
-    }
-    else
-    {
-        u64 *pat = &v->arch.hvm.pat_cr;
+        if ( !model_specific_lbr )
+            msr_content &= ~IA32_DEBUGCTLMSR_LBR;
 
-        if ( value & X86_CR0_CD )
+        /*
+         * When a guest first enables LBR, arrange to save and restore the LBR
+         * MSRs and allow the guest direct access.
+         *
+         * Hitting -ENOSPC with the guest load/save list is definitely a
+         * hypervisor bug, whereas -ENOMEM for allocating the load/save list
+         * is simply unlucky (and shouldn't occur with sensible management by
+         * the toolstack).
+         *
+         * Either way, there is nothing we can do right now to recover, and
+         * the guest won't execute correctly either.  Simply crash the domain
+         * to make the failure obvious.
+         */
+        if ( !(v->arch.hvm.vmx.lbr_flags & LBR_MSRS_INSERTED) &&
+             (msr_content & IA32_DEBUGCTLMSR_LBR) )
         {
-            /*
-             * For EPT, set guest IA32_PAT fields as UC so that guest
-             * memory type are all UC.
-             */
-            u64 uc_pat =
-                ((uint64_t)X86_MT_UC)       |       /* PAT0 */
-                ((uint64_t)X86_MT_UC << 8)  |       /* PAT1 */
-                ((uint64_t)X86_MT_UC << 16) |       /* PAT2 */
-                ((uint64_t)X86_MT_UC << 24) |       /* PAT3 */
-                ((uint64_t)X86_MT_UC << 32) |       /* PAT4 */
-                ((uint64_t)X86_MT_UC << 40) |       /* PAT5 */
-                ((uint64_t)X86_MT_UC << 48) |       /* PAT6 */
-                ((uint64_t)X86_MT_UC << 56);        /* PAT7 */
+            const struct lbr_info *lbr = model_specific_lbr;
 
-            vmx_get_guest_pat(v, pat);
-            vmx_set_guest_pat(v, uc_pat);
-            vmx_set_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
+            for ( ; lbr->count; lbr++ )
+            {
+                unsigned int i;
 
-            wbinvd();               /* flush possibly polluted cache */
-            hvm_asid_flush_vcpu(v); /* invalidate memory type cached in TLB */
-            v->arch.hvm.cache_mode = NO_FILL_CACHE_MODE;
-        }
-        else
-        {
-            v->arch.hvm.cache_mode = NORMAL_CACHE_MODE;
-            vmx_set_guest_pat(v, *pat);
-            if ( !is_iommu_enabled(v->domain) || iommu_snoop )
-                vmx_clear_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
-            hvm_asid_flush_vcpu(v); /* no need to flush cache */
+                for ( i = 0; i < lbr->count; i++ )
+                {
+                    int rc = vmx_add_guest_msr(v, lbr->base + i, 0);
+
+                    if ( unlikely(rc) )
+                    {
+                        gprintk(XENLOG_ERR,
+                                "Guest load/save list error %d\n", rc);
+                        domain_crash(v->domain);
+                        return X86EMUL_OKAY;
+                    }
+
+                    vmx_clear_msr_intercept(v, lbr->base + i, VMX_MSR_RW);
+                }
+            }
+
+            v->arch.hvm.vmx.lbr_flags |= LBR_MSRS_INSERTED;
+            if ( lbr_tsx_fixup_needed )
+                v->arch.hvm.vmx.lbr_flags |= LBR_FIXUP_TSX;
+            if ( ler_to_fixup_needed )
+                v->arch.hvm.vmx.lbr_flags |= LBR_FIXUP_LER_TO;
         }
-    }
-}
 
-static void cf_check vmx_setup_tsc_scaling(struct vcpu *v)
-{
-    if ( v->domain->arch.vtsc )
-        return;
+        __vmwrite(GUEST_IA32_DEBUGCTL, msr_content);
+        break;
 
-    vmx_vmcs_enter(v);
-    __vmwrite(TSC_MULTIPLIER, hvm_tsc_scaling_ratio(v->domain));
-    vmx_vmcs_exit(v);
-}
+    case MSR_IA32_MISC_ENABLE:
+        /*
+         * Silently drop writes that don't change the reported value: At least
+         * some Windows guests will expect to be able to write to MISC_ENABLE
+         * with the same value that's been read from it.
+         */
+        if ( vmx_msr_read_intercept(msr, &tmp) != X86EMUL_OKAY ||
+             tmp != msr_content )
+            goto gp_fault;
+        break;
 
-static void cf_check vmx_set_tsc_offset(struct vcpu *v, u64 offset, u64 at_tsc)
-{
-    vmx_vmcs_enter(v);
+    case MSR_P6_PERFCTR(0)...MSR_P6_PERFCTR(7):
+    case MSR_P6_EVNTSEL(0)...MSR_P6_EVNTSEL(7):
+    case MSR_CORE_PERF_FIXED_CTR0...MSR_CORE_PERF_FIXED_CTR2:
+    case MSR_CORE_PERF_FIXED_CTR_CTRL...MSR_CORE_PERF_GLOBAL_OVF_CTRL:
+    case MSR_IA32_PEBS_ENABLE:
+    case MSR_IA32_DS_AREA:
+         if ( vpmu_do_wrmsr(msr, msr_content) )
+            goto gp_fault;
+        break;
 
-    if ( nestedhvm_vcpu_in_guestmode(v) )
-        offset += nvmx_get_tsc_offset(v);
+    default:
+        if ( passive_domain_do_wrmsr(msr, msr_content) )
+            return X86EMUL_OKAY;
 
-    __vmwrite(TSC_OFFSET, offset);
-    vmx_vmcs_exit(v);
+        if ( vmx_write_guest_msr(v, msr, msr_content) == 0 ||
+             is_last_branch_msr(msr) )
+            break;
+
+        if ( v->domain->arch.msr_relaxed && !rdmsr_safe(msr, msr_content) )
+            break;
+
+        gdprintk(XENLOG_WARNING,
+                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
+                 msr, msr_content);
+        goto gp_fault;
+    }
+
+    return X86EMUL_OKAY;
+
+gp_fault:
+    return X86EMUL_EXCEPTION;
 }
 
-static void cf_check vmx_set_rdtsc_exiting(struct vcpu *v, bool enable)
+static void cf_check vmx_invlpg(struct vcpu *v, unsigned long linear)
 {
-    vmx_vmcs_enter(v);
-    v->arch.hvm.vmx.exec_control &= ~CPU_BASED_RDTSC_EXITING;
-    if ( enable )
-        v->arch.hvm.vmx.exec_control |= CPU_BASED_RDTSC_EXITING;
-    vmx_update_cpu_exec_control(v);
-    vmx_vmcs_exit(v);
+    if ( cpu_has_vmx_vpid )
+        vpid_sync_vcpu_gva(v, linear);
 }
 
-static void cf_check vmx_set_descriptor_access_exiting(
-    struct vcpu *v, bool enable)
-{
-    if ( enable )
-        v->arch.hvm.vmx.secondary_exec_control |=
-            SECONDARY_EXEC_DESCRIPTOR_TABLE_EXITING;
-    else
-        v->arch.hvm.vmx.secondary_exec_control &=
-            ~SECONDARY_EXEC_DESCRIPTOR_TABLE_EXITING;
+uint8_t __read_mostly posted_intr_vector;
+static uint8_t __read_mostly pi_wakeup_vector;
 
-    vmx_vmcs_enter(v);
-    vmx_update_secondary_exec_control(v);
-    vmx_vmcs_exit(v);
+void vmx_pi_per_cpu_init(unsigned int cpu)
+{
+    INIT_LIST_HEAD(&per_cpu(vmx_pi_blocking, cpu).list);
+    spin_lock_init(&per_cpu(vmx_pi_blocking, cpu).lock);
 }
 
-static void cf_check vmx_init_hypercall_page(void *p)
+static void cf_check vmx_vcpu_block(struct vcpu *v)
 {
-    unsigned int i;
+    unsigned long flags;
+    unsigned int dest;
+    spinlock_t *old_lock;
+    spinlock_t *pi_blocking_list_lock =
+		&per_cpu(vmx_pi_blocking, v->processor).lock;
+    struct pi_desc *pi_desc = &v->arch.hvm.vmx.pi_desc;
 
-    for ( i = 0; i < (PAGE_SIZE / 32); i++, p += 32 )
-    {
-        if ( unlikely(i == __HYPERVISOR_iret) )
-        {
-            /* HYPERVISOR_iret isn't supported */
-            *(u16 *)p = 0x0b0f; /* ud2 */
+    spin_lock_irqsave(pi_blocking_list_lock, flags);
+    old_lock = cmpxchg(&v->arch.hvm.vmx.pi_blocking.lock, NULL,
+                       pi_blocking_list_lock);
 
-            continue;
-        }
+    /*
+     * 'v->arch.hvm.vmx.pi_blocking.lock' should be NULL before
+     * being assigned to a new value, since the vCPU is currently
+     * running and it cannot be on any blocking list.
+     */
+    ASSERT(old_lock == NULL);
 
-        *(u8  *)(p + 0) = 0xb8; /* mov imm32, %eax */
-        *(u32 *)(p + 1) = i;
-        *(u8  *)(p + 5) = 0x0f; /* vmcall */
-        *(u8  *)(p + 6) = 0x01;
-        *(u8  *)(p + 7) = 0xc1;
-        *(u8  *)(p + 8) = 0xc3; /* ret */
-    }
-}
+    list_add_tail(&v->arch.hvm.vmx.pi_blocking.list,
+                  &per_cpu(vmx_pi_blocking, v->processor).list);
+    spin_unlock_irqrestore(pi_blocking_list_lock, flags);
 
-static unsigned int cf_check vmx_get_interrupt_shadow(struct vcpu *v)
-{
-    unsigned long intr_shadow;
+    ASSERT(!pi_test_sn(pi_desc));
 
-    __vmread(GUEST_INTERRUPTIBILITY_INFO, &intr_shadow);
+    dest = cpu_physical_id(v->processor);
 
-    return intr_shadow;
-}
+    ASSERT(pi_desc->ndst ==
+           (x2apic_enabled ? dest : MASK_INSR(dest, PI_xAPIC_NDST_MASK)));
 
-static void cf_check vmx_set_interrupt_shadow(
-    struct vcpu *v, unsigned int intr_shadow)
-{
-    __vmwrite(GUEST_INTERRUPTIBILITY_INFO, intr_shadow);
+    write_atomic(&pi_desc->nv, pi_wakeup_vector);
 }
 
-static void cf_check vmx_get_nonreg_state(struct vcpu *v,
-    struct hvm_vcpu_nonreg_state *nrs)
+static void vmx_pi_unblock_vcpu(struct vcpu *v)
 {
-    vmx_vmcs_enter(v);
+    unsigned long flags;
+    spinlock_t *pi_blocking_list_lock;
+    struct pi_desc *pi_desc = &v->arch.hvm.vmx.pi_desc;
 
-    __vmread(GUEST_ACTIVITY_STATE, &nrs->vmx.activity_state);
-    __vmread(GUEST_INTERRUPTIBILITY_INFO, &nrs->vmx.interruptibility_info);
-    __vmread(GUEST_PENDING_DBG_EXCEPTIONS, &nrs->vmx.pending_dbg);
+    /*
+     * Set 'NV' field back to posted_intr_vector, so the
+     * Posted-Interrupts can be delivered to the vCPU when
+     * it is running in non-root mode.
+     */
+    write_atomic(&pi_desc->nv, posted_intr_vector);
 
-    if ( cpu_has_vmx_virtual_intr_delivery )
-        __vmread(GUEST_INTR_STATUS, &nrs->vmx.interrupt_status);
+    pi_blocking_list_lock = v->arch.hvm.vmx.pi_blocking.lock;
 
-    vmx_vmcs_exit(v);
-}
+    /* Prevent the compiler from eliminating the local variable.*/
+    smp_rmb();
 
-static void cf_check vmx_set_nonreg_state(struct vcpu *v,
-    struct hvm_vcpu_nonreg_state *nrs)
-{
-    vmx_vmcs_enter(v);
+    /* The vCPU is not on any blocking list. */
+    if ( pi_blocking_list_lock == NULL )
+        return;
 
-    __vmwrite(GUEST_ACTIVITY_STATE, nrs->vmx.activity_state);
-    __vmwrite(GUEST_INTERRUPTIBILITY_INFO, nrs->vmx.interruptibility_info);
-    __vmwrite(GUEST_PENDING_DBG_EXCEPTIONS, nrs->vmx.pending_dbg);
+    spin_lock_irqsave(pi_blocking_list_lock, flags);
 
-    if ( cpu_has_vmx_virtual_intr_delivery )
-        __vmwrite(GUEST_INTR_STATUS, nrs->vmx.interrupt_status);
+    /*
+     * v->arch.hvm.vmx.pi_blocking.lock == NULL here means the vCPU
+     * was removed from the blocking list while we are acquiring the lock.
+     */
+    if ( v->arch.hvm.vmx.pi_blocking.lock != NULL )
+    {
+        ASSERT(v->arch.hvm.vmx.pi_blocking.lock == pi_blocking_list_lock);
+        list_del(&v->arch.hvm.vmx.pi_blocking.list);
+        v->arch.hvm.vmx.pi_blocking.lock = NULL;
+    }
 
-    vmx_vmcs_exit(v);
+    spin_unlock_irqrestore(pi_blocking_list_lock, flags);
 }
 
-static void vmx_load_pdptrs(struct vcpu *v)
+static void vmx_pi_do_resume(struct vcpu *v)
 {
-    uint32_t cr3 = v->arch.hvm.guest_cr[3];
-    const uint64_t *guest_pdptes;
-    struct page_info *page;
-    p2m_type_t p2mt;
+    ASSERT(!test_bit(_VPF_blocked, &v->pause_flags));
 
-    /* EPT needs to load PDPTRS into VMCS for PAE. */
-    if ( !hvm_pae_enabled(v) || hvm_long_mode_active(v) )
-        return;
+    vmx_pi_unblock_vcpu(v);
+}
 
-    page = get_page_from_gfn(v->domain, cr3 >> PAGE_SHIFT, &p2mt, P2M_ALLOC);
-    if ( !page )
-    {
-        /* Ideally you don't want to crash but rather go into a wait 
-         * queue, but this is the wrong place. We're holding at least
-         * the paging lock */
-        gdprintk(XENLOG_ERR,
-                 "Bad cr3 on load pdptrs gfn %"PRIx32" type %d\n",
-                 cr3 >> PAGE_SHIFT, (int) p2mt);
-        domain_crash(v->domain);
-        return;
-    }
+void vmx_pi_desc_fixup(unsigned int cpu)
+{
+    unsigned int new_cpu, dest;
+    unsigned long flags;
+    struct vmx_vcpu *vmx, *tmp;
+    spinlock_t *new_lock, *old_lock = &per_cpu(vmx_pi_blocking, cpu).lock;
+    struct list_head *blocked_vcpus = &per_cpu(vmx_pi_blocking, cpu).list;
 
-    guest_pdptes = __map_domain_page(page) + (cr3 & ~(PAGE_MASK | 0x1f));
+    if ( !iommu_intpost )
+        return;
 
     /*
-     * We do not check the PDPTRs for validity. The CPU will do this during
-     * vm entry, and we can handle the failure there and crash the guest.
-     * The only thing we could do better here is #GP instead.
+     * We are in the context of CPU_DEAD or CPU_UP_CANCELED notification,
+     * and it is impossible for a second CPU go down in parallel. So we
+     * can safely acquire the old cpu's lock and then acquire the new_cpu's
+     * lock after that.
      */
+    spin_lock_irqsave(old_lock, flags);
 
-    vmx_vmcs_enter(v);
+    list_for_each_entry_safe(vmx, tmp, blocked_vcpus, pi_blocking.list)
+    {
+        /*
+         * Suppress notification or we may miss an interrupt when the
+         * target cpu is dying.
+         */
+        pi_set_sn(&vmx->pi_desc);
 
-    __vmwrite(GUEST_PDPTE(0), guest_pdptes[0]);
-    __vmwrite(GUEST_PDPTE(1), guest_pdptes[1]);
-    __vmwrite(GUEST_PDPTE(2), guest_pdptes[2]);
-    __vmwrite(GUEST_PDPTE(3), guest_pdptes[3]);
+        /*
+         * Check whether a notification is pending before doing the
+         * movement, if that is the case we need to wake up it directly
+         * other than moving it to the new cpu's list.
+         */
+        if ( pi_test_on(&vmx->pi_desc) )
+        {
+            list_del(&vmx->pi_blocking.list);
+            vmx->pi_blocking.lock = NULL;
+            vcpu_unblock(container_of(vmx, struct vcpu, arch.hvm.vmx));
+        }
+        else
+        {
+            /*
+             * We need to find an online cpu as the NDST of the PI descriptor, it
+             * doesn't matter whether it is within the cpupool of the domain or
+             * not. As long as it is online, the vCPU will be woken up once the
+             * notification event arrives.
+             */
+            new_cpu = cpumask_any(&cpu_online_map);
+            new_lock = &per_cpu(vmx_pi_blocking, new_cpu).lock;
 
-    vmx_vmcs_exit(v);
+            spin_lock(new_lock);
 
-    unmap_domain_page(guest_pdptes);
-    put_page(page);
-    return;
-}
+            ASSERT(vmx->pi_blocking.lock == old_lock);
 
-static void cf_check vmx_update_host_cr3(struct vcpu *v)
-{
-    vmx_vmcs_enter(v);
-    __vmwrite(HOST_CR3, v->arch.cr3);
-    vmx_vmcs_exit(v);
-}
+            dest = cpu_physical_id(new_cpu);
+            write_atomic(&vmx->pi_desc.ndst,
+                         x2apic_enabled ? dest : MASK_INSR(dest, PI_xAPIC_NDST_MASK));
 
-void vmx_update_debug_state(struct vcpu *v)
-{
-    if ( v->arch.hvm.debug_state_latch )
-        v->arch.hvm.vmx.exception_bitmap |= 1U << TRAP_int3;
-    else
-        v->arch.hvm.vmx.exception_bitmap &= ~(1U << TRAP_int3);
+            list_move(&vmx->pi_blocking.list,
+                      &per_cpu(vmx_pi_blocking, new_cpu).list);
+            vmx->pi_blocking.lock = new_lock;
 
-    vmx_vmcs_enter(v);
-    vmx_update_exception_bitmap(v);
-    vmx_vmcs_exit(v);
+            spin_unlock(new_lock);
+        }
+
+        pi_clear_sn(&vmx->pi_desc);
+    }
+
+    spin_unlock_irqrestore(old_lock, flags);
 }
 
-static void cf_check vmx_update_guest_cr(
-    struct vcpu *v, unsigned int cr, unsigned int flags)
+/*
+ * To handle posted interrupts correctly, we need to set the following
+ * state:
+ *
+ * * The PI notification vector (NV)
+ * * The PI notification destination processor (NDST)
+ * * The PI "suppress notification" bit (SN)
+ * * The vcpu pi "blocked" list
+ *
+ * VMX implements the runstate transitions as the following:
+ *
+ * A: ... -> running
+ *  - SN = 0
+ *  - NDST = v->processor
+ *  If a VM is currently running, we want the PI delivered to the guest vcpu
+ *  on the proper pcpu.
+ *
+ * B: running -> ...
+ *  - SN = 1
+ *
+ * C: ... -> blocked
+ *  - SN = 0
+ *  - NV = pi_wakeup_vector
+ *  - Add vcpu to blocked list
+ *  If the vm is blocked, we want the PI delivered to Xen so that it can
+ *  wake it up.
+ *
+ * D: ... -> vmentry
+ *  - SN = 0
+ *  - NV = posted_intr_vector
+ *  - Take vcpu off blocked list
+ *
+ *  If the VM is currently either preempted or offline (i.e., not running
+ *  because of some reason other than blocking waiting for an interrupt),
+ *  there's nothing Xen can do -- we want the interrupt pending bit set in
+ *  the guest, but we don't want to bother Xen with an interrupt (SN clear).
+ *
+ * There's a brief window of time between vmx_intr_assist() and checking
+ * softirqs where if an interrupt comes in it may be lost; so we need Xen
+ * to get an interrupt and raise a softirq so that it will go through the
+ * vmx_intr_assist() path again (SN clear, NV = posted_interrupt).
+ */
+
+/* This function is called when pcidevs_lock is held */
+void vmx_pi_hooks_assign(struct domain *d)
 {
-    vmx_vmcs_enter(v);
+    struct vcpu *v;
 
-    switch ( cr )
-    {
-    case 0:
-    {
-        bool realmode;
-        unsigned long hw_cr0_mask = X86_CR0_NE;
+    if ( !iommu_intpost || !is_hvm_domain(d) )
+        return;
 
-        if ( !vmx_unrestricted_guest(v) )
-            hw_cr0_mask |= X86_CR0_PG | X86_CR0_PE;
+    ASSERT(!d->arch.hvm.pi_ops.vcpu_block);
 
-        if ( paging_mode_shadow(v->domain) )
-            hw_cr0_mask |= X86_CR0_WP;
+    /*
+     * We carefully handle the timing here:
+     * - Install the context switch first
+     * - Then set the NDST field
+     * - Install the block and resume hooks in the end
+     *
+     * This can make sure the PI (especially the NDST feild) is
+     * in proper state when we call vmx_vcpu_block().
+     */
+    d->arch.hvm.pi_ops.flags = PI_CSW_FROM | PI_CSW_TO;
 
-        if ( paging_mode_hap(v->domain) )
-        {
-            /* Manage GUEST_CR3 when CR0.PE=0. */
-            uint32_t old_ctls = v->arch.hvm.vmx.exec_control;
-            uint32_t cr3_ctls = (CPU_BASED_CR3_LOAD_EXITING |
-                                 CPU_BASED_CR3_STORE_EXITING);
+    for_each_vcpu ( d, v )
+    {
+        unsigned int dest = cpu_physical_id(v->processor);
+        struct pi_desc *pi_desc = &v->arch.hvm.vmx.pi_desc;
 
-            v->arch.hvm.vmx.exec_control &= ~cr3_ctls;
-            if ( !hvm_paging_enabled(v) && !vmx_unrestricted_guest(v) )
-                v->arch.hvm.vmx.exec_control |= cr3_ctls;
+        /*
+         * We don't need to update NDST if vmx_pi_switch_to()
+         * has already got called.
+         */
+        (void)cmpxchg(&pi_desc->ndst, APIC_INVALID_DEST,
+                x2apic_enabled ? dest : MASK_INSR(dest, PI_xAPIC_NDST_MASK));
+    }
 
-            /* Trap CR3 updates if CR3 memory events are enabled. */
-            if ( v->domain->arch.monitor.write_ctrlreg_enabled &
-                 monitor_ctrlreg_bitmask(VM_EVENT_X86_CR3) )
-                v->arch.hvm.vmx.exec_control |= CPU_BASED_CR3_LOAD_EXITING;
+    d->arch.hvm.pi_ops.vcpu_block = vmx_vcpu_block;
+}
 
-            if ( old_ctls != v->arch.hvm.vmx.exec_control )
-                vmx_update_cpu_exec_control(v);
-        }
+/* This function is called when pcidevs_lock is held */
+void vmx_pi_hooks_deassign(struct domain *d)
+{
+    struct vcpu *v;
 
-        if ( !nestedhvm_vcpu_in_guestmode(v) )
-            __vmwrite(CR0_READ_SHADOW, v->arch.hvm.guest_cr[0]);
-        else
-            nvmx_set_cr_read_shadow(v, 0);
+    if ( !iommu_intpost || !is_hvm_domain(d) )
+        return;
 
-        if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
-        {
-            if ( v != current )
-            {
-                if ( !v->arch.fully_eager_fpu )
-                    hw_cr0_mask |= X86_CR0_TS;
-            }
-            else if ( v->arch.hvm.hw_cr[0] & X86_CR0_TS )
-                vmx_fpu_enter(v);
-        }
+    ASSERT(d->arch.hvm.pi_ops.vcpu_block);
 
-        realmode = !(v->arch.hvm.guest_cr[0] & X86_CR0_PE);
+    /*
+     * Pausing the domain can make sure the vCPUs are not
+     * running and hence not calling the hooks simultaneously
+     * when deassigning the PI hooks and removing the vCPU
+     * from the blocking list.
+     */
+    ASSERT(current->domain != d);
+    domain_pause(d);
 
-        if ( !vmx_unrestricted_guest(v) &&
-             (realmode != v->arch.hvm.vmx.vmx_realmode) )
-        {
-            enum x86_segment s;
-            struct segment_register reg[x86_seg_tr + 1];
+    /*
+     * Note that we don't set 'd->arch.hvm.pi_ops.switch_to' to NULL
+     * here. If we deassign the hooks while the vCPU is runnable in the
+     * runqueue with 'SN' set, all the future notification event will be
+     * suppressed since vmx_deliver_posted_intr() also use 'SN' bit
+     * as the suppression flag. Preserving the 'switch_to' hook function can
+     * clear the 'SN' bit when the vCPU becomes running next time. After
+     * that, No matter which status(runnable, running or block) the vCPU is in,
+     * the 'SN' bit will keep clear for the 'switch_from' hook function that set
+     * the 'SN' bit has been removed. At that time, the 'switch_to' hook function
+     * is also useless. Considering the function doesn't do harm to the whole
+     * system, leave it here until we find a clean solution to deassign the
+     * 'switch_to' hook function.
+     */
+    d->arch.hvm.pi_ops.vcpu_block = NULL;
+    d->arch.hvm.pi_ops.flags = PI_CSW_TO;
 
-            BUILD_BUG_ON(x86_seg_tr != x86_seg_gs + 1);
+    for_each_vcpu ( d, v )
+        vmx_pi_unblock_vcpu(v);
 
-            /* Entering or leaving real mode: adjust the segment registers.
-             * Need to read them all either way, as realmode reads can update
-             * the saved values we'll use when returning to prot mode. */
-            for ( s = 0; s < ARRAY_SIZE(reg); s++ )
-                hvm_get_segment_register(v, s, &reg[s]);
-            v->arch.hvm.vmx.vmx_realmode = realmode;
+    domain_unpause(d);
+}
 
-            if ( realmode )
-            {
-                for ( s = 0; s < ARRAY_SIZE(reg); s++ )
-                    hvm_set_segment_register(v, s, &reg[s]);
-            }
-            else
-            {
-                for ( s = 0; s < ARRAY_SIZE(reg); s++ )
-                    if ( !(v->arch.hvm.vmx.vm86_segment_mask & (1<<s)) )
-                        hvm_set_segment_register(
-                            v, s, &v->arch.hvm.vmx.vm86_saved_seg[s]);
-            }
+/*
+ * This function is used to update the IRTE for posted-interrupt
+ * when guest changes MSI/MSI-X information.
+ */
+static int cf_check vmx_pi_update_irte(const struct vcpu *v,
+                                       const struct pirq *pirq, uint8_t gvec)
+{
+    const struct pi_desc *pi_desc = v ? &v->arch.hvm.vmx.pi_desc : NULL;
+    struct irq_desc *desc;
+    struct msi_desc *msi_desc;
+    int rc;
 
-            vmx_update_exception_bitmap(v);
-        }
+    desc = pirq_spin_lock_irq_desc(pirq, NULL);
+    if ( !desc )
+        return -EINVAL;
 
-        v->arch.hvm.hw_cr[0] =
-            v->arch.hvm.guest_cr[0] | hw_cr0_mask;
-        __vmwrite(GUEST_CR0, v->arch.hvm.hw_cr[0]);
+    msi_desc = desc->msi_desc;
+    if ( !msi_desc )
+    {
+        rc = -ENODEV;
+        goto unlock_out;
     }
-        /* Fallthrough: Changing CR0 can change some bits in real CR4. */
-    case 4:
-        v->arch.hvm.hw_cr[4] = HVM_CR4_HOST_MASK;
-        if ( paging_mode_hap(v->domain) )
-            v->arch.hvm.hw_cr[4] &= ~X86_CR4_PAE;
-
-        if ( !nestedhvm_vcpu_in_guestmode(v) )
-            __vmwrite(CR4_READ_SHADOW, v->arch.hvm.guest_cr[4]);
-        else
-            nvmx_set_cr_read_shadow(v, 4);
-
-        v->arch.hvm.hw_cr[4] |= v->arch.hvm.guest_cr[4];
-        if ( v->arch.hvm.vmx.vmx_realmode )
-            v->arch.hvm.hw_cr[4] |= X86_CR4_VME;
+    msi_desc->pi_desc = pi_desc;
+    msi_desc->gvec = gvec;
 
-        if ( !hvm_paging_enabled(v) )
-        {
-            /*
-             * When the guest thinks paging is disabled, Xen may need to hide
-             * the effects of running with CR0.PG actually enabled.  There are
-             * two subtly complicated cases.
-             */
+    spin_unlock_irq(&desc->lock);
 
-            if ( paging_mode_hap(v->domain) )
-            {
-                /*
-                 * On hardware lacking the Unrestricted Guest feature (or with
-                 * it disabled in the VMCS), we may not enter the guest with
-                 * CR0.PG actually disabled.  When EPT is enabled, we run with
-                 * guest paging settings, but with CR3 pointing at
-                 * HVM_PARAM_IDENT_PT which is a 32bit pagetable using 4M
-                 * superpages.  Override the guests paging settings to match.
-                 */
-                v->arch.hvm.hw_cr[4] |= X86_CR4_PSE;
-                v->arch.hvm.hw_cr[4] &= ~X86_CR4_PAE;
-            }
+    ASSERT(pcidevs_locked());
 
-            /*
-             * Without CR0.PG, all memory accesses are user mode, so
-             * _PAGE_USER must be set in the pagetables for guest userspace to
-             * function.  This in turn trips up guest supervisor mode if
-             * SMEP/SMAP are left active in context.  They wouldn't have any
-             * effect if paging was actually disabled, so hide them behind the
-             * back of the guest.
-             */
-            v->arch.hvm.hw_cr[4] &= ~(X86_CR4_SMEP | X86_CR4_SMAP);
-        }
+    return iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
 
-        __vmwrite(GUEST_CR4, v->arch.hvm.hw_cr[4]);
+ unlock_out:
+    spin_unlock_irq(&desc->lock);
 
-        /*
-         * Shadow path has not been optimized because it requires
-         * unconditionally trapping more CR4 bits, at which point the
-         * performance benefit of doing this is quite dubious.
-         */
-        if ( paging_mode_hap(v->domain) )
-        {
-            /*
-             * Update CR4 host mask to only trap when the guest tries to set
-             * bits that are controlled by the hypervisor.
-             */
-            v->arch.hvm.vmx.cr4_host_mask =
-                (HVM_CR4_HOST_MASK | X86_CR4_PKE |
-                 ~hvm_cr4_guest_valid_bits(v->domain));
+    return rc;
+}
 
-            v->arch.hvm.vmx.cr4_host_mask |= v->arch.hvm.vmx.vmx_realmode ?
-                                             X86_CR4_VME : 0;
-            v->arch.hvm.vmx.cr4_host_mask |= !hvm_paging_enabled(v) ?
-                                             (X86_CR4_PSE | X86_CR4_SMEP |
-                                              X86_CR4_SMAP)
-                                             : 0;
-            if ( v->domain->arch.monitor.write_ctrlreg_enabled &
-                 monitor_ctrlreg_bitmask(VM_EVENT_X86_CR4) )
-                v->arch.hvm.vmx.cr4_host_mask |=
-                ~v->domain->arch.monitor.write_ctrlreg_mask[VM_EVENT_X86_CR4];
+static int cf_check vmx_domain_initialise(struct domain *d)
+{
+    static const struct arch_csw csw = {
+        .from = vmx_ctxt_switch_from,
+        .to   = vmx_ctxt_switch_to,
+        .tail = vmx_do_resume,
+    };
+    int rc;
 
-            if ( nestedhvm_vcpu_in_guestmode(v) )
-                /* Add the nested host mask to get the more restrictive one. */
-                v->arch.hvm.vmx.cr4_host_mask |= get_vvmcs(v,
-                                                           CR4_GUEST_HOST_MASK);
+    d->arch.ctxt_switch = &csw;
 
-            __vmwrite(CR4_GUEST_HOST_MASK, v->arch.hvm.vmx.cr4_host_mask);
-        }
+    /*
+     * Work around CVE-2018-12207?  The hardware domain is already permitted
+     * to reboot the system, so doesn't need mitigating against DoS's.
+     */
+    d->arch.hvm.vmx.exec_sp = is_hardware_domain(d) || opt_ept_exec_sp;
 
-        break;
+    if ( (rc = vmx_alloc_vlapic_mapping(d)) != 0 )
+        return rc;
 
-    case 2:
-        /* CR2 is updated in exit stub. */
-        break;
+    return 0;
+}
 
-    case 3:
-        if ( paging_mode_hap(v->domain) )
-        {
-            if ( !hvm_paging_enabled(v) && !vmx_unrestricted_guest(v) )
-                v->arch.hvm.hw_cr[3] =
-                    v->domain->arch.hvm.params[HVM_PARAM_IDENT_PT];
-            vmx_load_pdptrs(v);
-        }
+static void cf_check vmx_domain_relinquish_resources(struct domain *d)
+{
+    vmx_free_vlapic_mapping(d);
+}
 
-        __vmwrite(GUEST_CR3, v->arch.hvm.hw_cr[3]);
+static void cf_check domain_creation_finished(struct domain *d)
+{
+    gfn_t gfn = gaddr_to_gfn(APIC_DEFAULT_PHYS_BASE);
+    mfn_t apic_access_mfn = d->arch.hvm.vmx.apic_access_mfn;
+    bool ipat;
 
-        if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
-            hvm_asid_flush_vcpu(v);
-        break;
+    if ( mfn_eq(apic_access_mfn, _mfn(0)) )
+        return;
 
-    default:
-        BUG();
-    }
+    ASSERT(epte_get_entry_emt(d, gfn, apic_access_mfn, 0, &ipat,
+                              p2m_mmio_direct) == X86_MT_WB);
+    ASSERT(ipat);
 
-    vmx_vmcs_exit(v);
+    if ( set_mmio_p2m_entry(d, gfn, apic_access_mfn, PAGE_ORDER_4K) )
+        domain_crash(d);
 }
 
-static void cf_check vmx_update_guest_efer(struct vcpu *v)
+static void vmx_init_ipt(struct vcpu *v)
 {
-    unsigned long entry_ctls, guest_efer = v->arch.hvm.guest_efer,
-        xen_efer = read_efer();
+    unsigned int size = v->domain->vmtrace_size;
 
-    if ( paging_mode_shadow(v->domain) )
-    {
-        /*
-         * When using shadow pagetables, EFER.NX is a Xen-owned bit and is not
-         * under guest control.
-         */
-        guest_efer &= ~EFER_NXE;
-        guest_efer |= xen_efer & EFER_NXE;
-    }
+    if ( !size )
+        return;
 
-    if ( !vmx_unrestricted_guest(v) )
-    {
-        /*
-         * When Unrestricted Guest is not enabled in the VMCS, hardware does
-         * not tolerate the LME and LMA settings being different.  As writes
-         * to CR0 are intercepted, it is safe to leave LME clear at this
-         * point, and fix up both LME and LMA when CR0.PG is set.
-         *
-         * Furthermore, when using shadow pagetables (subsumed by the
-         * Unrestricted Guest check), CR0.PG is a Xen-owned bit, and remains
-         * set even when the guest has logically disabled paging.  LMA was
-         * calculated using the guest CR0.PG setting, but LME needs clearing
-         * to avoid interacting with Xen's CR0.PG setting.
-         */
-        if ( !(guest_efer & EFER_LMA) )
-            guest_efer &= ~EFER_LME;
-    }
+    /* Checked by domain creation logic. */
+    ASSERT(v->vmtrace.pg);
+    ASSERT(size >= PAGE_SIZE && (size & (size - 1)) == 0);
 
-    vmx_vmcs_enter(v);
+    v->arch.msrs->rtit.output_limit = size - 1;
+}
 
-    /*
-     * The intended guest running mode is derived from VM_ENTRY_IA32E_MODE,
-     * which (architecturally) is the guest's LMA setting.
-     */
-    __vmread(VM_ENTRY_CONTROLS, &entry_ctls);
+static int cf_check vmx_vcpu_initialise(struct vcpu *v)
+{
+    int rc;
 
-    entry_ctls &= ~VM_ENTRY_IA32E_MODE;
-    if ( guest_efer & EFER_LMA )
-        entry_ctls |= VM_ENTRY_IA32E_MODE;
+    spin_lock_init(&v->arch.hvm.vmx.vmcs_lock);
 
-    __vmwrite(VM_ENTRY_CONTROLS, entry_ctls);
+    INIT_LIST_HEAD(&v->arch.hvm.vmx.pi_blocking.list);
 
-    /* We expect to use EFER loading in the common case, but... */
-    if ( likely(cpu_has_vmx_efer) )
-        __vmwrite(GUEST_EFER, guest_efer);
+    vcpu_2_nvmx(v).vmxon_region_pa = INVALID_PADDR;
 
-    /* ... on Gen1 VT-x hardware, we have to use MSR load/save lists instead. */
-    else
+    if ( (rc = vmx_create_vmcs(v)) != 0 )
     {
-        /*
-         * When the guests choice of EFER matches Xen's, remove the load/save
-         * list entries.  It is unnecessary overhead, especially as this is
-         * expected to be the common case for 64bit guests.
-         */
-        if ( guest_efer == xen_efer )
-        {
-            vmx_del_msr(v, MSR_EFER, VMX_MSR_HOST);
-            vmx_del_msr(v, MSR_EFER, VMX_MSR_GUEST_LOADONLY);
-        }
-        else
+        dprintk(XENLOG_WARNING,
+                "Failed to create VMCS for vcpu %d: err=%d.\n",
+                v->vcpu_id, rc);
+        return rc;
+    }
+
+    /*
+     * It's rare but still possible that domain has already been in log-dirty
+     * mode when vcpu is being created (commented by Tim), in which case we
+     * should enable PML for this vcpu if PML has been enabled for the domain,
+     * and failure to enable results in failure of creating this vcpu.
+     *
+     * Note even there's no vcpu created for the domain, vmx_domain_enable_pml
+     * will return successful in which case vmx_domain_pml_enabled will also
+     * return true. And even this is the first vcpu to be created with
+     * vmx_domain_pml_enabled being true, failure of enabling PML still results
+     * in failure of creating vcpu, to avoid complicated logic to revert PML
+     * style EPT table to non-PML style EPT table.
+     */
+    if ( vmx_domain_pml_enabled(v->domain) )
+    {
+        if ( (rc = vmx_vcpu_enable_pml(v)) != 0 )
         {
-            vmx_add_msr(v, MSR_EFER, xen_efer, VMX_MSR_HOST);
-            vmx_add_msr(v, MSR_EFER, guest_efer, VMX_MSR_GUEST_LOADONLY);
+            dprintk(XENLOG_ERR, "%pv: Failed to enable PML.\n", v);
+            vmx_destroy_vmcs(v);
+            return rc;
         }
     }
 
-    vmx_vmcs_exit(v);
+    vmx_install_vlapic_mapping(v);
+    vmx_init_ipt(v);
+
+    return 0;
+}
 
+static void cf_check vmx_vcpu_destroy(struct vcpu *v)
+{
     /*
-     * If the guests virtualised view of MSR_EFER matches the value loaded
-     * into hardware, clear the read intercept to avoid unnecessary VMExits.
+     * There are cases that domain still remains in log-dirty mode when it is
+     * about to be destroyed (ex, user types 'xl destroy <dom>'), in which case
+     * we should disable PML manually here. Note that vmx_vcpu_destroy is called
+     * prior to vmx_domain_destroy so we need to disable PML for each vcpu
+     * separately here.
      */
-    if ( guest_efer == v->arch.hvm.guest_efer )
-        vmx_clear_msr_intercept(v, MSR_EFER, VMX_MSR_R);
-    else
-        vmx_set_msr_intercept(v, MSR_EFER, VMX_MSR_R);
+    vmx_vcpu_disable_pml(v);
+    vmx_destroy_vmcs(v);
+    passive_domain_destroy(v);
 }
 
-void nvmx_enqueue_n2_exceptions(struct vcpu *v, 
-            unsigned long intr_fields, int error_code, uint8_t source)
+static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
 {
-    struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
+    const struct cpuid_policy *cp = v->domain->arch.cpuid;
+    int rc = 0;
 
-    if ( !(nvmx->intr.intr_info & INTR_INFO_VALID_MASK) ) {
-        /* enqueue the exception till the VMCS switch back to L1 */
-        nvmx->intr.intr_info = intr_fields;
-        nvmx->intr.error_code = error_code;
-        nvmx->intr.source = source;
-        vcpu_nestedhvm(v).nv_vmexit_pending = 1;
-        return;
-    }
+    if ( opt_hvm_fep ||
+         (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
+        v->arch.hvm.vmx.exception_bitmap |= (1U << TRAP_invalid_op);
     else
-        gdprintk(XENLOG_ERR, "Double Fault on Nested Guest: exception %lx %x"
-                 "on %lx %x\n", intr_fields, error_code,
-                 nvmx->intr.intr_info, nvmx->intr.error_code);
-}
-
-static int cf_check nvmx_vmexit_event(
-    struct vcpu *v, const struct x86_event *event)
-{
-    nvmx_enqueue_n2_exceptions(v, event->vector, event->error_code,
-                               hvm_intsrc_none);
-    return NESTEDHVM_VMEXIT_DONE;
-}
+        v->arch.hvm.vmx.exception_bitmap &= ~(1U << TRAP_invalid_op);
 
-static void __vmx_inject_exception(int trap, int type, int error_code)
-{
-    unsigned long intr_fields;
-    struct vcpu *curr = current;
+    vmx_vmcs_enter(v);
+    vmx_update_exception_bitmap(v);
 
     /*
-     * NB. Callers do not need to worry about clearing STI/MOV-SS blocking:
-     *  "If the VM entry is injecting, there is no blocking by STI or by
-     *   MOV SS following the VM entry, regardless of the contents of the
-     *   interruptibility-state field [in the guest-state area before the
-     *   VM entry]", PRM Vol. 3, 22.6.1 (Interruptibility State).
+     * We can safely pass MSR_SPEC_CTRL through to the guest, even if STIBP
+     * isn't enumerated in hardware, as SPEC_CTRL_STIBP is ignored.
      */
+    if ( cp->feat.ibrsb )
+    {
+        vmx_clear_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
 
-    intr_fields = INTR_INFO_VALID_MASK |
-                  MASK_INSR(type, INTR_INFO_INTR_TYPE_MASK) |
-                  MASK_INSR(trap, INTR_INFO_VECTOR_MASK);
-    if ( error_code != X86_EVENT_NO_EC )
+        rc = vmx_add_guest_msr(v, MSR_SPEC_CTRL, 0);
+        if ( rc )
+            goto out;
+    }
+    else
     {
-        ASSERT(error_code == (uint16_t)error_code);
-        __vmwrite(VM_ENTRY_EXCEPTION_ERROR_CODE, error_code);
-        intr_fields |= INTR_INFO_DELIVER_CODE_MASK;
+        vmx_set_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
+
+        rc = vmx_del_msr(v, MSR_SPEC_CTRL, VMX_MSR_GUEST);
+        if ( rc && rc != -ESRCH )
+            goto out;
+        rc = 0; /* Tolerate -ESRCH */
+    }
+
+    /* MSR_PRED_CMD is safe to pass through if the guest knows about it. */
+    if ( cp->feat.ibrsb || cp->extd.ibpb )
+        vmx_clear_msr_intercept(v, MSR_PRED_CMD,  VMX_MSR_RW);
+    else
+        vmx_set_msr_intercept(v, MSR_PRED_CMD,  VMX_MSR_RW);
+
+    /* MSR_FLUSH_CMD is safe to pass through if the guest knows about it. */
+    if ( cp->feat.l1d_flush )
+        vmx_clear_msr_intercept(v, MSR_FLUSH_CMD, VMX_MSR_RW);
+    else
+        vmx_set_msr_intercept(v, MSR_FLUSH_CMD, VMX_MSR_RW);
+
+    if ( cp->feat.pks )
+        vmx_clear_msr_intercept(v, MSR_PKRS, VMX_MSR_RW);
+    else
+        vmx_set_msr_intercept(v, MSR_PKRS, VMX_MSR_RW);
+
+ out:
+    vmx_vmcs_exit(v);
+
+    if ( rc )
+    {
+        printk(XENLOG_G_ERR "%pv MSR list error: %d", v, rc);
+        domain_crash(v->domain);
     }
+}
 
-    __vmwrite(VM_ENTRY_INTR_INFO, intr_fields);
+int cf_check vmx_guest_x86_mode(struct vcpu *v)
+{
+    unsigned long cs_ar_bytes;
 
-    /* Can't inject exceptions in virtual 8086 mode because they would 
-     * use the protected-mode IDT.  Emulate at the next vmenter instead. */
-    if ( curr->arch.hvm.vmx.vmx_realmode )
-        curr->arch.hvm.vmx.vmx_emulate = 1;
+    if ( unlikely(!(v->arch.hvm.guest_cr[0] & X86_CR0_PE)) )
+        return 0;
+    if ( unlikely(guest_cpu_user_regs()->eflags & X86_EFLAGS_VM) )
+        return 1;
+    __vmread(GUEST_CS_AR_BYTES, &cs_ar_bytes);
+    if ( hvm_long_mode_active(v) &&
+         likely(cs_ar_bytes & X86_SEG_AR_CS_LM_ACTIVE) )
+        return 8;
+    return (likely(cs_ar_bytes & X86_SEG_AR_DEF_OP_SIZE) ? 4 : 2);
 }
 
-void vmx_inject_extint(int trap, uint8_t source)
+static void vmx_vmcs_save(struct vcpu *v, struct hvm_hw_cpu *c)
 {
-    struct vcpu *v = current;
-    u32    pin_based_cntrl;
+    unsigned long ev;
 
-    if ( nestedhvm_vcpu_in_guestmode(v) ) {
-        pin_based_cntrl = get_vvmcs(v, PIN_BASED_VM_EXEC_CONTROL);
-        if ( pin_based_cntrl & PIN_BASED_EXT_INTR_MASK ) {
-            nvmx_enqueue_n2_exceptions (v, 
-               INTR_INFO_VALID_MASK |
-               MASK_INSR(X86_EVENTTYPE_EXT_INTR, INTR_INFO_INTR_TYPE_MASK) |
-               MASK_INSR(trap, INTR_INFO_VECTOR_MASK),
-               X86_EVENT_NO_EC, source);
-            return;
-        }
+    vmx_vmcs_enter(v);
+
+    __vmread(GUEST_SYSENTER_CS, &c->sysenter_cs);
+    __vmread(GUEST_SYSENTER_ESP, &c->sysenter_esp);
+    __vmread(GUEST_SYSENTER_EIP, &c->sysenter_eip);
+
+    __vmread(VM_ENTRY_INTR_INFO, &ev);
+    if ( (ev & INTR_INFO_VALID_MASK) &&
+         hvm_event_needs_reinjection(MASK_EXTR(ev, INTR_INFO_INTR_TYPE_MASK),
+                                     ev & INTR_INFO_VECTOR_MASK) )
+    {
+        c->pending_event = ev;
+        __vmread(VM_ENTRY_EXCEPTION_ERROR_CODE, &ev);
+        c->error_code = ev;
     }
-    __vmx_inject_exception(trap, X86_EVENTTYPE_EXT_INTR,
-                           X86_EVENT_NO_EC);
+
+    vmx_vmcs_exit(v);
 }
 
-void vmx_inject_nmi(void)
+static int vmx_restore_cr0_cr3(
+    struct vcpu *v, unsigned long cr0, unsigned long cr3)
 {
-    struct vcpu *v = current;
-    u32    pin_based_cntrl;
+    struct page_info *page = NULL;
 
-    if ( nestedhvm_vcpu_in_guestmode(v) ) {
-        pin_based_cntrl = get_vvmcs(v, PIN_BASED_VM_EXEC_CONTROL);
-        if ( pin_based_cntrl & PIN_BASED_NMI_EXITING ) {
-            nvmx_enqueue_n2_exceptions (v, 
-               INTR_INFO_VALID_MASK |
-               MASK_INSR(X86_EVENTTYPE_NMI, INTR_INFO_INTR_TYPE_MASK) |
-               MASK_INSR(TRAP_nmi, INTR_INFO_VECTOR_MASK),
-               X86_EVENT_NO_EC, hvm_intsrc_nmi);
-            return;
+    if ( paging_mode_shadow(v->domain) )
+    {
+        if ( cr0 & X86_CR0_PG )
+        {
+            page = get_page_from_gfn(v->domain, cr3 >> PAGE_SHIFT,
+                                     NULL, P2M_ALLOC);
+            if ( !page )
+            {
+                gdprintk(XENLOG_ERR, "Invalid CR3 value=%#lx\n", cr3);
+                return -EINVAL;
+            }
         }
+
+        if ( hvm_paging_enabled(v) )
+            put_page(pagetable_get_page(v->arch.guest_table));
+
+        v->arch.guest_table =
+            page ? pagetable_from_page(page) : pagetable_null();
     }
-    __vmx_inject_exception(2, X86_EVENTTYPE_NMI,
-                           X86_EVENT_NO_EC);
+
+    v->arch.hvm.guest_cr[0] = cr0 | X86_CR0_ET;
+    v->arch.hvm.guest_cr[3] = cr3;
+
+    return 0;
 }
 
-/*
- * Generate a virtual event in the guest.
- * NOTES:
- *  - INT 3 (CC) and INTO (CE) are X86_EVENTTYPE_SW_EXCEPTION;
- *  - INT nn (CD nn) is X86_EVENTTYPE_SW_INTERRUPT;
- *  - #DB is X86_EVENTTYPE_HW_EXCEPTION, except when generated by
- *    opcode 0xf1 (which is X86_EVENTTYPE_PRI_SW_EXCEPTION)
- */
-static void cf_check vmx_inject_event(const struct x86_event *event)
+static int vmx_vmcs_restore(struct vcpu *v, struct hvm_hw_cpu *c)
 {
-    unsigned long intr_info;
-    struct vcpu *curr = current;
-    struct x86_event _event = *event;
+    int rc;
 
-    switch ( _event.vector | -(_event.type == X86_EVENTTYPE_SW_INTERRUPT) )
+    if ( c->pending_valid )
     {
-    case TRAP_debug:
-        if ( guest_cpu_user_regs()->eflags & X86_EFLAGS_TF )
+        if ( (c->pending_type == 1) || (c->pending_type > 6) ||
+             (c->pending_reserved != 0) )
         {
-            __restore_debug_registers(curr);
-            write_debugreg(6, read_debugreg(6) | DR_STEP);
+            dprintk(XENLOG_ERR, "%pv: Invalid pending event %#"PRIx32"\n",
+                    v, c->pending_event);
+            return -EINVAL;
         }
-        if ( !nestedhvm_vcpu_in_guestmode(curr) ||
-             !nvmx_intercepts_exception(curr, TRAP_debug, _event.error_code) )
-        {
-            unsigned long val;
 
-            __vmread(GUEST_DR7, &val);
-            __vmwrite(GUEST_DR7, val & ~DR_GENERAL_DETECT);
-            __vmread(GUEST_IA32_DEBUGCTL, &val);
-            __vmwrite(GUEST_IA32_DEBUGCTL, val & ~IA32_DEBUGCTLMSR_LBR);
-        }
-        if ( cpu_has_monitor_trap_flag )
-            break;
-        /* fall through */
-    case TRAP_int3:
-        if ( curr->domain->debugger_attached )
+        if ( c->pending_error_valid &&
+             c->error_code != (uint16_t)c->error_code )
         {
-            /* Debug/Int3: Trap to debugger. */
-            domain_pause_for_debugger();
-            return;
+            dprintk(XENLOG_ERR, "%pv: Invalid error code %#"PRIx32"\n",
+                    v, c->error_code);
+            return -EINVAL;
         }
-        break;
-
-    case TRAP_page_fault:
-        ASSERT(_event.type == X86_EVENTTYPE_HW_EXCEPTION);
-        curr->arch.hvm.guest_cr[2] = _event.cr2;
-        break;
     }
 
-    if ( nestedhvm_vcpu_in_guestmode(curr) )
-        intr_info = vcpu_2_nvmx(curr).intr.intr_info;
-    else
-        __vmread(VM_ENTRY_INTR_INFO, &intr_info);
+    rc = vmx_restore_cr0_cr3(v, c->cr0, c->cr3);
+    if ( rc )
+        return rc;
 
-    if ( unlikely(intr_info & INTR_INFO_VALID_MASK) &&
-         (MASK_EXTR(intr_info, INTR_INFO_INTR_TYPE_MASK) ==
-          X86_EVENTTYPE_HW_EXCEPTION) )
-    {
-        _event.vector = hvm_combine_hw_exceptions(
-            (uint8_t)intr_info, _event.vector);
-        if ( _event.vector == TRAP_double_fault )
-            _event.error_code = 0;
-    }
+    vmx_vmcs_enter(v);
 
-    if ( _event.type >= X86_EVENTTYPE_SW_INTERRUPT )
-        __vmwrite(VM_ENTRY_INSTRUCTION_LEN, _event.insn_len);
+    v->arch.hvm.guest_cr[4] = c->cr4;
+    vmx_update_guest_cr(v, 0, 0);
+    vmx_update_guest_cr(v, 4, 0);
 
-    if ( nestedhvm_vcpu_in_guestmode(curr) &&
-         nvmx_intercepts_exception(curr, _event.vector, _event.error_code) )
+    v->arch.hvm.guest_efer = c->msr_efer;
+    vmx_update_guest_efer(v);
+
+    __vmwrite(GUEST_SYSENTER_CS, c->sysenter_cs);
+    __vmwrite(GUEST_SYSENTER_ESP, c->sysenter_esp);
+    __vmwrite(GUEST_SYSENTER_EIP, c->sysenter_eip);
+
+    __vmwrite(GUEST_DR7, c->dr7);
+
+    if ( c->pending_valid &&
+         hvm_event_needs_reinjection(c->pending_type, c->pending_vector) )
     {
-        nvmx_enqueue_n2_exceptions (curr, 
-            INTR_INFO_VALID_MASK |
-            MASK_INSR(_event.type, INTR_INFO_INTR_TYPE_MASK) |
-            MASK_INSR(_event.vector, INTR_INFO_VECTOR_MASK),
-            _event.error_code, hvm_intsrc_none);
-        return;
+        gdprintk(XENLOG_INFO, "Re-injecting %#"PRIx32", %#"PRIx32"\n",
+                 c->pending_event, c->error_code);
+        __vmwrite(VM_ENTRY_INTR_INFO, c->pending_event);
+        __vmwrite(VM_ENTRY_EXCEPTION_ERROR_CODE, c->error_code);
     }
     else
-        __vmx_inject_exception(_event.vector, _event.type, _event.error_code);
+    {
+        __vmwrite(VM_ENTRY_INTR_INFO, 0);
+        __vmwrite(VM_ENTRY_EXCEPTION_ERROR_CODE, 0);
+    }
+    vmx_vmcs_exit(v);
 
-    if ( (_event.vector == TRAP_page_fault) &&
-         (_event.type == X86_EVENTTYPE_HW_EXCEPTION) )
-        HVMTRACE_LONG_2D(PF_INJECT, _event.error_code,
-                         TRC_PAR_LONG(curr->arch.hvm.guest_cr[2]));
-    else
-        HVMTRACE_2D(INJ_EXC, _event.vector, _event.error_code);
+    paging_update_paging_modes(v);
+
+    return 0;
 }
 
-static bool cf_check vmx_event_pending(const struct vcpu *v)
+static void vmx_save_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
 {
-    unsigned long intr_info;
-
-    ASSERT(v == current);
-    __vmread(VM_ENTRY_INTR_INFO, &intr_info);
-
-    return intr_info & INTR_INFO_VALID_MASK;
+    data->shadow_gs        = v->arch.hvm.vmx.shadow_gs;
+    data->msr_lstar        = v->arch.hvm.vmx.lstar;
+    data->msr_star         = v->arch.hvm.vmx.star;
+    data->msr_cstar        = v->arch.hvm.vmx.cstar;
+    data->msr_syscall_mask = v->arch.hvm.vmx.sfmask;
 }
 
-static void cf_check vmx_set_info_guest(struct vcpu *v)
+static void vmx_load_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
 {
-    unsigned long intr_shadow;
-
-    vmx_vmcs_enter(v);
-
-    __vmwrite(GUEST_DR7, v->arch.dr7);
-
-    /* 
-     * If the interruptibility-state field indicates blocking by STI,
-     * setting the TF flag in the EFLAGS may cause VM entry to fail
-     * and crash the guest. See SDM 3B 22.3.1.5.
-     * Resetting the VMX_INTR_SHADOW_STI flag looks hackish but
-     * to set the GUEST_PENDING_DBG_EXCEPTIONS.BS here incurs
-     * immediately vmexit and hence make no progress.
-     */
-    __vmread(GUEST_INTERRUPTIBILITY_INFO, &intr_shadow);
-    if ( v->domain->debugger_attached &&
-         (v->arch.user_regs.eflags & X86_EFLAGS_TF) &&
-         (intr_shadow & VMX_INTR_SHADOW_STI) )
-    {
-        intr_shadow &= ~VMX_INTR_SHADOW_STI;
-        __vmwrite(GUEST_INTERRUPTIBILITY_INFO, intr_shadow);
-    }
-
-    vmx_vmcs_exit(v);
+    v->arch.hvm.vmx.shadow_gs = data->shadow_gs;
+    v->arch.hvm.vmx.star      = data->msr_star;
+    v->arch.hvm.vmx.lstar     = data->msr_lstar;
+    v->arch.hvm.vmx.cstar     = data->msr_cstar;
+    v->arch.hvm.vmx.sfmask    = data->msr_syscall_mask;
 }
 
-static void cf_check vmx_update_eoi_exit_bitmap(
-    struct vcpu *v, uint8_t vector, bool set)
+static void cf_check vmx_save_vmcs_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
 {
-    if ( set )
-        vmx_set_eoi_exit_bitmap(v, vector);
-    else
-        vmx_clear_eoi_exit_bitmap(v, vector);
+    if ( v == current )
+        vmx_save_guest_msrs(v);
+
+    vmx_save_cpu_state(v, ctxt);
+    vmx_vmcs_save(v, ctxt);
 }
 
-static u8 set_svi(int isr)
+static int cf_check vmx_load_vmcs_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
 {
-    unsigned long status;
-    u8 old;
+    /* Not currently safe to use in current context. */
+    ASSERT(v != current);
 
-    if ( isr < 0 )
-        isr = 0;
+    vmx_load_cpu_state(v, ctxt);
 
-    __vmread(GUEST_INTR_STATUS, &status);
-    old = status >> VMX_GUEST_INTR_STATUS_SVI_OFFSET;
-    if ( isr != old )
+    if ( vmx_vmcs_restore(v, ctxt) )
     {
-        status &= VMX_GUEST_INTR_STATUS_SUBFIELD_BITMASK;
-        status |= isr << VMX_GUEST_INTR_STATUS_SVI_OFFSET;
-        __vmwrite(GUEST_INTR_STATUS, status);
+        gdprintk(XENLOG_ERR, "vmx_vmcs restore failed!\n");
+        domain_crash(v->domain);
+        return -EINVAL;
     }
 
-    return old;
+    return 0;
 }
 
-static void cf_check vmx_process_isr(int isr, struct vcpu *v)
+unsigned int vmx_get_cpl(void)
 {
-    unsigned int i;
-    const struct vlapic *vlapic = vcpu_vlapic(v);
-
-    vmx_vmcs_enter(v);
-
-    set_svi(isr);
-
-    /*
-     * Theoretically, only level triggered interrupts can have their
-     * corresponding bits set in the eoi exit bitmap. That is, the bits
-     * set in the eoi exit bitmap should also be set in TMR. But a periodic
-     * timer interrupt does not follow the rule: it is edge triggered, but
-     * requires its corresponding bit be set in the eoi exit bitmap. So we
-     * should not construct the eoi exit bitmap based on TMR.
-     * Here we will construct the eoi exit bitmap via (IRR | ISR). This
-     * means that EOIs to the interrupts that are set in the IRR or ISR will
-     * cause VM exits after restoring, regardless of the trigger modes. It
-     * is acceptable because the subsequent interrupts will set up the eoi
-     * bitmap correctly.
-     */
-    for ( i = 0x10; i < X86_NR_VECTORS; ++i )
-        if ( vlapic_test_vector(i, &vlapic->regs->data[APIC_IRR]) ||
-             vlapic_test_vector(i, &vlapic->regs->data[APIC_ISR]) )
-            set_bit(i, v->arch.hvm.vmx.eoi_exit_bitmap);
+    unsigned long attr;
 
-    for ( i = 0; i < ARRAY_SIZE(v->arch.hvm.vmx.eoi_exit_bitmap); ++i )
-        __vmwrite(EOI_EXIT_BITMAP(i), v->arch.hvm.vmx.eoi_exit_bitmap[i]);
+    __vmread(GUEST_SS_AR_BYTES, &attr);
 
-    vmx_vmcs_exit(v);
+    return (attr >> 5) & 3;
 }
 
-static void __vmx_deliver_posted_interrupt(struct vcpu *v)
+static unsigned int cf_check _vmx_get_cpl(struct vcpu *v)
 {
-    bool_t running = v->is_running;
+    unsigned int cpl;
 
-    vcpu_unblock(v);
-    /*
-     * Just like vcpu_kick(), nothing is needed for the following two cases:
-     * 1. The target vCPU is not running, meaning it is blocked or runnable.
-     * 2. The target vCPU is the current vCPU and we're in non-interrupt
-     * context.
-     */
-    if ( running && (in_irq() || (v != current)) )
-    {
-        /*
-         * Note: Only two cases will reach here:
-         * 1. The target vCPU is running on other pCPU.
-         * 2. The target vCPU is the current vCPU.
-         *
-         * Note2: Don't worry the v->processor may change. The vCPU being
-         * moved to another processor is guaranteed to sync PIR to vIRR,
-         * due to the involved scheduling cycle.
-         */
-        unsigned int cpu = v->processor;
+    vmx_vmcs_enter(v);
+    cpl = vmx_get_cpl();
+    vmx_vmcs_exit(v);
 
-        /*
-         * For case 1, we send an IPI to the pCPU. When an IPI arrives, the
-         * target vCPU maybe is running in non-root mode, running in root
-         * mode, runnable or blocked. If the target vCPU is running in
-         * non-root mode, the hardware will sync PIR to vIRR for
-         * 'posted_intr_vector' is special to the pCPU. If the target vCPU is
-         * running in root-mode, the interrupt handler starts to run.
-         * Considering an IPI may arrive in the window between the call to
-         * vmx_intr_assist() and interrupts getting disabled, the interrupt
-         * handler should raise a softirq to ensure events will be delivered
-         * in time. If the target vCPU is runnable, it will sync PIR to
-         * vIRR next time it is chose to run. In this case, a IPI and a
-         * softirq is sent to a wrong vCPU which will not have any adverse
-         * effect. If the target vCPU is blocked, since vcpu_block() checks
-         * whether there is an event to be delivered through
-         * local_events_need_delivery() just after blocking, the vCPU must
-         * have synced PIR to vIRR. Similarly, there is a IPI and a softirq
-         * sent to a wrong vCPU.
-         */
-        if ( cpu != smp_processor_id() )
-            send_IPI_mask(cpumask_of(cpu), posted_intr_vector);
-        /*
-         * For case 2, raising a softirq ensures PIR will be synced to vIRR.
-         * As any softirq will do, as an optimization we only raise one if
-         * none is pending already.
-         */
-        else if ( !softirq_pending(cpu) )
-            raise_softirq(VCPU_KICK_SOFTIRQ);
-    }
+    return cpl;
 }
 
-static void cf_check vmx_deliver_posted_intr(struct vcpu *v, u8 vector)
-{
-    struct pi_desc old, new, prev;
+/*
+ * SDM Vol 3: VM Entries > Checks on Guest Segment Registers:
+ *
+ * We can only enter virtual 8086 mode if all of CS, SS, DS, ES, FS and GS are
+ * 16bit ring-3 data segments.  On hardware lacking the unrestricted_guest
+ * feature, Xen fakes up real mode using vm86 mode.  The guest thinks it's got
+ * ring-0 segments, so we need to fudge things.  We store the ring-3 version
+ * in the VMCS to avoid lots of shuffling on vmenter and vmexit, and translate
+ * in these accessors.
+ */
+#define rm_cs_attr   0x9b
+#define rm_ds_attr   0x93
+#define vm86_ds_attr 0xf3
+#define vm86_tr_attr 0x8b
 
-    if ( pi_test_and_set_pir(vector, &v->arch.hvm.vmx.pi_desc) )
-        return;
+static void cf_check vmx_get_segment_register(
+    struct vcpu *v, enum x86_segment seg, struct segment_register *reg)
+{
+    unsigned long attr = 0, sel = 0, limit;
+    unsigned int tmp_seg;
 
-    if ( unlikely(v->arch.hvm.vmx.eoi_exitmap_changed) )
+    /*
+     * We may get here in the context of dump_execstate(), which may have
+     * interrupted context switching between setting "current" and
+     * vmx_do_resume() reaching the end of vmx_load_vmcs(). That would make
+     * all the VMREADs below fail if we don't bail right away.
+     */
+    if ( unlikely(!vmx_vmcs_try_enter(v)) )
     {
-        /*
-         * If EOI exitbitmap needs to changed or notification vector
-         * can't be allocated, interrupt will not be injected till
-         * VMEntry as it used to be.
-         */
-        pi_set_on(&v->arch.hvm.vmx.pi_desc);
-        vcpu_kick(v);
-        return;
-    }
-
-    prev.control = v->arch.hvm.vmx.pi_desc.control;
+        static bool_t warned;
 
-    do {
-        /*
-         * Currently, we don't support urgent interrupt, all
-         * interrupts are recognized as non-urgent interrupt,
-         * Besides that, if 'ON' is already set, no need to
-         * send posted-interrupts notification event as well,
-         * according to hardware behavior.
-         */
-        if ( pi_test_sn(&prev) || pi_test_on(&prev) )
+        if ( !warned )
         {
-            vcpu_kick(v);
-            return;
+            warned = 1;
+            printk(XENLOG_WARNING "Segment register inaccessible for %pv\n"
+                   "(If you see this outside of debugging activity,"
+                   " please report to xen-devel@lists.xenproject.org)\n",
+                   v);
         }
+        memset(reg, 0, sizeof(*reg));
+        return;
+    }
 
-        old.control = v->arch.hvm.vmx.pi_desc.control &
-                      ~((1 << POSTED_INTR_ON) | (1 << POSTED_INTR_SN));
-        new.control = v->arch.hvm.vmx.pi_desc.control |
-                      (1 << POSTED_INTR_ON);
-
-        prev.control = cmpxchg(&v->arch.hvm.vmx.pi_desc.control,
-                               old.control, new.control);
-    } while ( prev.control != old.control );
+    /*
+     * Xen's x86_seg_* enumeration *almost* matches the VMCS encoding order.
+     *
+     * tr and ldtr are reversed, and other areas of code rely on this, so we
+     * can't just re-enumerate.
+     */
+    BUILD_BUG_ON(x86_seg_tr   != 6);
+    BUILD_BUG_ON(x86_seg_ldtr != 7);
+    BUILD_BUG_ON(x86_seg_gdtr != 8);
+    BUILD_BUG_ON(x86_seg_idtr != 9);
+    switch ( tmp_seg = seg )
+    {
+    case x86_seg_tr:
+    case x86_seg_ldtr:
+        tmp_seg ^= 1; /* Flip tr and ldtr so GUEST_SEG_*() works. */
+        fallthrough;
 
-    __vmx_deliver_posted_interrupt(v);
-}
+    case x86_seg_es ... x86_seg_gs:
+        __vmread(GUEST_SEG_SELECTOR(tmp_seg), &sel);
+        __vmread(GUEST_SEG_AR_BYTES(tmp_seg), &attr);
+        fallthrough;
 
-static void cf_check vmx_sync_pir_to_irr(struct vcpu *v)
-{
-    struct vlapic *vlapic = vcpu_vlapic(v);
-    unsigned int group, i;
-    DECLARE_BITMAP(pending_intr, X86_NR_VECTORS);
+    case x86_seg_gdtr:
+    case x86_seg_idtr:
+        __vmread(GUEST_SEG_LIMIT(tmp_seg),    &limit);
+        __vmread(GUEST_SEG_BASE(tmp_seg),     &reg->base);
+        break;
 
-    if ( !pi_test_and_clear_on(&v->arch.hvm.vmx.pi_desc) )
+    default:
+        BUG();
         return;
+    }
 
-    for ( group = 0; group < ARRAY_SIZE(pending_intr); group++ )
-        pending_intr[group] = pi_get_pir(&v->arch.hvm.vmx.pi_desc, group);
+    vmx_vmcs_exit(v);
 
-    for_each_set_bit(i, pending_intr, X86_NR_VECTORS)
-        vlapic_set_vector(i, &vlapic->regs->data[APIC_IRR]);
-}
+    reg->sel = sel;
+    reg->limit = limit;
 
-static bool cf_check vmx_test_pir(const struct vcpu *v, uint8_t vec)
-{
-    return pi_test_pir(vec, &v->arch.hvm.vmx.pi_desc);
+    /*
+     * Fold VT-x representation into Xen's representation.  The Present bit is
+     * unconditionally set to the inverse of unusable.
+     */
+    reg->attr =
+        (!(attr & (1u << 16)) << 7) | (attr & 0x7f) | ((attr >> 4) & 0xf00);
+
+    /* Adjust for virtual 8086 mode */
+    if ( v->arch.hvm.vmx.vmx_realmode && seg <= x86_seg_tr
+         && !(v->arch.hvm.vmx.vm86_segment_mask & (1u << seg)) )
+    {
+        struct segment_register *sreg = &v->arch.hvm.vmx.vm86_saved_seg[seg];
+        if ( seg == x86_seg_tr )
+            *reg = *sreg;
+        else if ( reg->base != sreg->base || seg == x86_seg_ss )
+        {
+            /* If the guest's reloaded the segment, remember the new version.
+             * We can't tell if the guest reloaded the segment with another
+             * one that has the same base.  By default we assume it hasn't,
+             * since we don't want to lose big-real-mode segment attributes,
+             * but for SS we assume it has: the Ubuntu graphical bootloader
+             * does this and gets badly confused if we leave the old SS in
+             * place. */
+            reg->attr = (seg == x86_seg_cs ? rm_cs_attr : rm_ds_attr);
+            *sreg = *reg;
+        }
+        else
+        {
+            /* Always give realmode guests a selector that matches the base
+             * but keep the attr and limit from before */
+            *reg = *sreg;
+            reg->sel = reg->base >> 4;
+        }
+    }
 }
 
-static void cf_check vmx_handle_eoi(uint8_t vector, int isr)
+static void cf_check vmx_set_segment_register(
+    struct vcpu *v, enum x86_segment seg, struct segment_register *reg)
 {
-    uint8_t old_svi = set_svi(isr);
-    static bool warned;
-
-    if ( vector != old_svi && !test_and_set_bool(warned) )
-        printk(XENLOG_WARNING "EOI for %02x but SVI=%02x\n", vector, old_svi);
-}
+    uint32_t attr, sel, limit;
+    uint64_t base;
 
-static void cf_check vmx_enable_msr_interception(struct domain *d, uint32_t msr)
-{
-    struct vcpu *v;
+    sel = reg->sel;
+    attr = reg->attr;
+    limit = reg->limit;
+    base = reg->base;
 
-    for_each_vcpu ( d, v )
-        vmx_set_msr_intercept(v, msr, VMX_MSR_W);
-}
+    /* Adjust CS/SS/DS/ES/FS/GS/TR for virtual 8086 mode */
+    if ( v->arch.hvm.vmx.vmx_realmode && seg <= x86_seg_tr )
+    {
+        /* Remember the proper contents */
+        v->arch.hvm.vmx.vm86_saved_seg[seg] = *reg;
 
-static void cf_check vmx_vcpu_update_eptp(struct vcpu *v)
-{
-    struct domain *d = v->domain;
-    struct p2m_domain *p2m = NULL;
-    struct ept_data *ept;
+        if ( seg == x86_seg_tr )
+        {
+            const struct domain *d = v->domain;
+            uint64_t val = d->arch.hvm.params[HVM_PARAM_VM86_TSS_SIZED];
 
-    if ( altp2m_active(d) )
-        p2m = p2m_get_altp2m(v);
-    if ( !p2m )
-        p2m = p2m_get_hostp2m(d);
+            if ( val )
+            {
+                sel = 0;
+                attr = vm86_tr_attr;
+                limit = ((val & ~VM86_TSS_UPDATED) >> 32) - 1;
+                base = (uint32_t)val;
+                if ( val & VM86_TSS_UPDATED )
+                {
+                    hvm_prepare_vm86_tss(v, base, limit);
+                    cmpxchg(&d->arch.hvm.params[HVM_PARAM_VM86_TSS_SIZED],
+                            val, val & ~VM86_TSS_UPDATED);
+                }
+                v->arch.hvm.vmx.vm86_segment_mask &= ~(1u << seg);
+            }
+            else
+                v->arch.hvm.vmx.vm86_segment_mask |= (1u << seg);
+        }
+        else
+        {
+            /* Try to fake it out as a 16bit data segment.  This could
+             * cause confusion for the guest if it reads the selector,
+             * but otherwise we have to emulate if *any* segment hasn't
+             * been reloaded. */
+            if ( base < 0x100000 && !(base & 0xf) && limit >= 0xffff && reg->p )
+            {
+                sel = base >> 4;
+                attr = vm86_ds_attr;
+                limit = 0xffff;
+                v->arch.hvm.vmx.vm86_segment_mask &= ~(1u << seg);
+            }
+            else
+                v->arch.hvm.vmx.vm86_segment_mask |= (1u << seg);
+        }
+    }
 
-    ept = &p2m->ept;
-    ept->mfn = pagetable_get_pfn(p2m_get_pagetable(p2m));
+    /*
+     * Unfold Xen representation into VT-x representation.  The unusable bit
+     * is unconditionally set to the inverse of present.
+     */
+    attr = (!(attr & (1u << 7)) << 16) | ((attr & 0xf00) << 4) | (attr & 0xff);
 
     vmx_vmcs_enter(v);
 
-    __vmwrite(EPT_POINTER, ept->eptp);
+    switch ( seg )
+    {
+    case x86_seg_tr:
+    case x86_seg_ldtr:
+        seg ^= 1; /* Flip tr and ldtr so GUEST_SEG_*() works. */
+        fallthrough;
 
-    if ( v->arch.hvm.vmx.secondary_exec_control &
-         SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS )
-        __vmwrite(EPTP_INDEX, vcpu_altp2m(v).p2midx);
+    case x86_seg_es ... x86_seg_gs:
+        __vmwrite(GUEST_SEG_SELECTOR(seg), sel);
+        __vmwrite(GUEST_SEG_AR_BYTES(seg), attr);
+        fallthrough;
+
+    case x86_seg_gdtr:
+    case x86_seg_idtr:
+        __vmwrite(GUEST_SEG_LIMIT(seg),    limit);
+        __vmwrite(GUEST_SEG_BASE(seg),     base);
+        break;
+
+    default:
+        BUG();
+    }
 
     vmx_vmcs_exit(v);
 }
 
-static void cf_check vmx_vcpu_update_vmfunc_ve(struct vcpu *v)
+static int cf_check vmx_set_guest_pat(struct vcpu *v, u64 gpat)
 {
-    struct domain *d = v->domain;
-    u32 mask = SECONDARY_EXEC_ENABLE_VM_FUNCTIONS;
+    if ( !paging_mode_hap(v->domain) ||
+         unlikely(v->arch.hvm.cache_mode == NO_FILL_CACHE_MODE) )
+        return 0;
 
-    if ( !cpu_has_vmx_vmfunc )
-        return;
+    vmx_vmcs_enter(v);
+    __vmwrite(GUEST_PAT, gpat);
+    vmx_vmcs_exit(v);
+    return 1;
+}
 
-    if ( cpu_has_vmx_virt_exceptions )
-        mask |= SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS;
+static int cf_check vmx_get_guest_pat(struct vcpu *v, u64 *gpat)
+{
+    if ( !paging_mode_hap(v->domain) ||
+         unlikely(v->arch.hvm.cache_mode == NO_FILL_CACHE_MODE) )
+        return 0;
 
     vmx_vmcs_enter(v);
+    __vmread(GUEST_PAT, gpat);
+    vmx_vmcs_exit(v);
+    return 1;
+}
 
-    if ( !d->is_dying && altp2m_active(d) )
+static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
+{
+    if ( !paging_mode_hap(v->domain) )
     {
-        v->arch.hvm.vmx.secondary_exec_control |= mask;
-        __vmwrite(VM_FUNCTION_CONTROL, VMX_VMFUNC_EPTP_SWITCHING);
-        __vmwrite(EPTP_LIST_ADDR, virt_to_maddr(d->arch.altp2m_visible_eptp));
+        /*
+         * For shadow, 'load IA32_PAT' VM-entry control is 0, so it cannot
+         * set guest memory type as UC via IA32_PAT. Xen drop all shadows
+         * so that any new ones would be created on demand.
+         */
+        hvm_shadow_handle_cd(v, value);
+    }
+    else
+    {
+        u64 *pat = &v->arch.hvm.pat_cr;
 
-        if ( cpu_has_vmx_virt_exceptions )
+        if ( value & X86_CR0_CD )
         {
-            const struct page_info *pg = vcpu_altp2m(v).veinfo_pg;
+            /*
+             * For EPT, set guest IA32_PAT fields as UC so that guest
+             * memory type are all UC.
+             */
+            u64 uc_pat =
+                ((uint64_t)X86_MT_UC)       |       /* PAT0 */
+                ((uint64_t)X86_MT_UC << 8)  |       /* PAT1 */
+                ((uint64_t)X86_MT_UC << 16) |       /* PAT2 */
+                ((uint64_t)X86_MT_UC << 24) |       /* PAT3 */
+                ((uint64_t)X86_MT_UC << 32) |       /* PAT4 */
+                ((uint64_t)X86_MT_UC << 40) |       /* PAT5 */
+                ((uint64_t)X86_MT_UC << 48) |       /* PAT6 */
+                ((uint64_t)X86_MT_UC << 56);        /* PAT7 */
 
-            if ( pg )
-            {
-                __vmwrite(VIRT_EXCEPTION_INFO, page_to_maddr(pg));
-                /*
-                 * Make sure we have an up-to-date EPTP_INDEX when
-                 * setting SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS.
-                 */
-                __vmwrite(EPTP_INDEX, vcpu_altp2m(v).p2midx);
-            }
-            else
-                v->arch.hvm.vmx.secondary_exec_control &=
-                    ~SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS;
+            vmx_get_guest_pat(v, pat);
+            vmx_set_guest_pat(v, uc_pat);
+            vmx_set_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
+
+            wbinvd();               /* flush possibly polluted cache */
+            hvm_asid_flush_vcpu(v); /* invalidate memory type cached in TLB */
+            v->arch.hvm.cache_mode = NO_FILL_CACHE_MODE;
+        }
+        else
+        {
+            v->arch.hvm.cache_mode = NORMAL_CACHE_MODE;
+            vmx_set_guest_pat(v, *pat);
+            if ( !is_iommu_enabled(v->domain) || iommu_snoop )
+                vmx_clear_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
+            hvm_asid_flush_vcpu(v); /* no need to flush cache */
         }
     }
-    else
-        v->arch.hvm.vmx.secondary_exec_control &= ~mask;
-
-    vmx_update_secondary_exec_control(v);
-    vmx_vmcs_exit(v);
 }
 
-static int cf_check vmx_vcpu_emulate_vmfunc(const struct cpu_user_regs *regs)
+static void cf_check vmx_setup_tsc_scaling(struct vcpu *v)
 {
-    int rc = X86EMUL_EXCEPTION;
-    struct vcpu *curr = current;
-
-    if ( !cpu_has_vmx_vmfunc && altp2m_active(curr->domain) &&
-         regs->eax == 0 &&
-         p2m_switch_vcpu_altp2m_by_id(curr, regs->ecx) )
-        rc = X86EMUL_OKAY;
+    if ( v->domain->arch.vtsc )
+        return;
 
-    return rc;
+    vmx_vmcs_enter(v);
+    __vmwrite(TSC_MULTIPLIER, hvm_tsc_scaling_ratio(v->domain));
+    vmx_vmcs_exit(v);
 }
 
-static bool cf_check vmx_vcpu_emulate_ve(struct vcpu *v)
+static void cf_check vmx_set_tsc_offset(struct vcpu *v, u64 offset, u64 at_tsc)
 {
-    const struct page_info *pg = vcpu_altp2m(v).veinfo_pg;
-    ve_info_t *veinfo;
-    bool rc = false;
-
-    if ( !pg )
-        return rc;
-
-    veinfo = __map_domain_page(pg);
+    vmx_vmcs_enter(v);
 
-    if ( veinfo->semaphore != 0 )
-        goto out;
+    if ( nestedhvm_vcpu_in_guestmode(v) )
+        offset += nvmx_get_tsc_offset(v);
 
-    rc = true;
-    veinfo->exit_reason = EXIT_REASON_EPT_VIOLATION;
-    veinfo->semaphore = ~0;
-    veinfo->eptp_index = vcpu_altp2m(v).p2midx;
+    __vmwrite(TSC_OFFSET, offset);
+    vmx_vmcs_exit(v);
+}
 
+static void cf_check vmx_set_rdtsc_exiting(struct vcpu *v, bool enable)
+{
     vmx_vmcs_enter(v);
-    __vmread(EXIT_QUALIFICATION, &veinfo->exit_qualification);
-    __vmread(GUEST_LINEAR_ADDRESS, &veinfo->gla);
-    __vmread(GUEST_PHYSICAL_ADDRESS, &veinfo->gpa);
+    v->arch.hvm.vmx.exec_control &= ~CPU_BASED_RDTSC_EXITING;
+    if ( enable )
+        v->arch.hvm.vmx.exec_control |= CPU_BASED_RDTSC_EXITING;
+    vmx_update_cpu_exec_control(v);
     vmx_vmcs_exit(v);
-
-    hvm_inject_hw_exception(TRAP_virtualisation,
-                            X86_EVENT_NO_EC);
-
- out:
-    unmap_domain_page(veinfo);
-
-    if ( rc )
-        paging_mark_dirty(v->domain, page_to_mfn(pg));
-
-    return rc;
 }
 
-static bool cf_check vmx_get_pending_event(
-    struct vcpu *v, struct x86_event *info)
+static void cf_check vmx_set_descriptor_access_exiting(
+    struct vcpu *v, bool enable)
 {
-    unsigned long intr_info, error_code;
+    if ( enable )
+        v->arch.hvm.vmx.secondary_exec_control |=
+            SECONDARY_EXEC_DESCRIPTOR_TABLE_EXITING;
+    else
+        v->arch.hvm.vmx.secondary_exec_control &=
+            ~SECONDARY_EXEC_DESCRIPTOR_TABLE_EXITING;
 
     vmx_vmcs_enter(v);
-    __vmread(VM_ENTRY_INTR_INFO, &intr_info);
-    __vmread(VM_ENTRY_EXCEPTION_ERROR_CODE, &error_code);
+    vmx_update_secondary_exec_control(v);
     vmx_vmcs_exit(v);
+}
 
-    if ( !(intr_info & INTR_INFO_VALID_MASK) )
-        return false;
+static void cf_check vmx_init_hypercall_page(void *p)
+{
+    unsigned int i;
 
-    info->vector = MASK_EXTR(intr_info, INTR_INFO_VECTOR_MASK);
-    info->type = MASK_EXTR(intr_info, INTR_INFO_INTR_TYPE_MASK);
-    info->error_code = error_code;
+    for ( i = 0; i < (PAGE_SIZE / 32); i++, p += 32 )
+    {
+        if ( unlikely(i == __HYPERVISOR_iret) )
+        {
+            /* HYPERVISOR_iret isn't supported */
+            *(u16 *)p = 0x0b0f; /* ud2 */
 
-    return true;
+            continue;
+        }
+
+        *(u8  *)(p + 0) = 0xb8; /* mov imm32, %eax */
+        *(u32 *)(p + 1) = i;
+        *(u8  *)(p + 5) = 0x0f; /* vmcall */
+        *(u8  *)(p + 6) = 0x01;
+        *(u8  *)(p + 7) = 0xc1;
+        *(u8  *)(p + 8) = 0xc3; /* ret */
+    }
 }
 
-/*
- * We only let vmtrace agents see and modify a subset of bits in MSR_RTIT_CTL.
- * These all pertain to data-emitted into the trace buffer(s).  Must not
- * include controls pertaining to the structure/position of the trace
- * buffer(s).
- */
-#define RTIT_CTL_MASK                                                   \
-    (RTIT_CTL_TRACE_EN | RTIT_CTL_OS | RTIT_CTL_USR | RTIT_CTL_TSC_EN | \
-     RTIT_CTL_DIS_RETC | RTIT_CTL_BRANCH_EN)
+static unsigned int cf_check vmx_get_interrupt_shadow(struct vcpu *v)
+{
+    unsigned long intr_shadow;
 
-/*
- * Status bits restricted to the first-gen subset (i.e. no further CPUID
- * requirements.)
- */
-#define RTIT_STATUS_MASK                                                \
-    (RTIT_STATUS_FILTER_EN | RTIT_STATUS_CONTEXT_EN | RTIT_STATUS_TRIGGER_EN | \
-     RTIT_STATUS_ERROR | RTIT_STATUS_STOPPED)
+    __vmread(GUEST_INTERRUPTIBILITY_INFO, &intr_shadow);
 
-static int cf_check vmtrace_get_option(
-    struct vcpu *v, uint64_t key, uint64_t *output)
+    return intr_shadow;
+}
+
+static void cf_check vmx_set_interrupt_shadow(
+    struct vcpu *v, unsigned int intr_shadow)
 {
-    const struct vcpu_msrs *msrs = v->arch.msrs;
+    __vmwrite(GUEST_INTERRUPTIBILITY_INFO, intr_shadow);
+}
 
-    switch ( key )
-    {
-    case MSR_RTIT_CTL:
-        *output = msrs->rtit.ctl & RTIT_CTL_MASK;
-        break;
+static void cf_check vmx_get_nonreg_state(struct vcpu *v,
+    struct hvm_vcpu_nonreg_state *nrs)
+{
+    vmx_vmcs_enter(v);
 
-    case MSR_RTIT_STATUS:
-        *output = msrs->rtit.status & RTIT_STATUS_MASK;
-        break;
+    __vmread(GUEST_ACTIVITY_STATE, &nrs->vmx.activity_state);
+    __vmread(GUEST_INTERRUPTIBILITY_INFO, &nrs->vmx.interruptibility_info);
+    __vmread(GUEST_PENDING_DBG_EXCEPTIONS, &nrs->vmx.pending_dbg);
 
-    default:
-        *output = 0;
-        return -EINVAL;
-    }
-    return 0;
+    if ( cpu_has_vmx_virtual_intr_delivery )
+        __vmread(GUEST_INTR_STATUS, &nrs->vmx.interrupt_status);
+
+    vmx_vmcs_exit(v);
 }
 
-static int cf_check vmtrace_set_option(
-    struct vcpu *v, uint64_t key, uint64_t value)
+static void cf_check vmx_set_nonreg_state(struct vcpu *v,
+    struct hvm_vcpu_nonreg_state *nrs)
 {
-    struct vcpu_msrs *msrs = v->arch.msrs;
-    bool new_en, old_en = msrs->rtit.ctl & RTIT_CTL_TRACE_EN;
-
-    switch ( key )
-    {
-    case MSR_RTIT_CTL:
-        if ( value & ~RTIT_CTL_MASK )
-            return -EINVAL;
+    vmx_vmcs_enter(v);
 
-        msrs->rtit.ctl &= ~RTIT_CTL_MASK;
-        msrs->rtit.ctl |= (value & RTIT_CTL_MASK);
-        break;
+    __vmwrite(GUEST_ACTIVITY_STATE, nrs->vmx.activity_state);
+    __vmwrite(GUEST_INTERRUPTIBILITY_INFO, nrs->vmx.interruptibility_info);
+    __vmwrite(GUEST_PENDING_DBG_EXCEPTIONS, nrs->vmx.pending_dbg);
 
-    case MSR_RTIT_STATUS:
-        if ( value & ~RTIT_STATUS_MASK )
-            return -EINVAL;
+    if ( cpu_has_vmx_virtual_intr_delivery )
+        __vmwrite(GUEST_INTR_STATUS, nrs->vmx.interrupt_status);
 
-        msrs->rtit.status &= ~RTIT_STATUS_MASK;
-        msrs->rtit.status |= (value & RTIT_STATUS_MASK);
-        break;
+    vmx_vmcs_exit(v);
+}
 
-    default:
-        return -EINVAL;
-    }
+static void cf_check vmx_update_host_cr3(struct vcpu *v)
+{
+    vmx_vmcs_enter(v);
+    __vmwrite(HOST_CR3, v->arch.cr3);
+    vmx_vmcs_exit(v);
+}
 
-    new_en = msrs->rtit.ctl & RTIT_CTL_TRACE_EN;
+static void nvmx_enqueue_n2_exceptions(struct vcpu *v,
+            unsigned long intr_fields, int error_code, uint8_t source)
+{
+    struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
 
-    /* ctl.trace_en changed => update MSR load/save lists appropriately. */
-    if ( !old_en && new_en )
-    {
-        if ( vmx_add_guest_msr(v, MSR_RTIT_CTL, msrs->rtit.ctl) ||
-             vmx_add_host_load_msr(v, MSR_RTIT_CTL, 0) )
-        {
-            /*
-             * The only failure cases here are failing the
-             * singleton-per-domain memory allocation, or exceeding the space
-             * in the allocation.  We could unwind in principle, but there is
-             * nothing userspace can usefully do to continue using this VM.
-             */
-            domain_crash(v->domain);
-            return -ENXIO;
-        }
-    }
-    else if ( old_en && !new_en )
-    {
-        vmx_del_msr(v, MSR_RTIT_CTL, VMX_MSR_GUEST);
-        vmx_del_msr(v, MSR_RTIT_CTL, VMX_MSR_HOST);
+    if ( !(nvmx->intr.intr_info & INTR_INFO_VALID_MASK) ) {
+        /* enqueue the exception till the VMCS switch back to L1 */
+        nvmx->intr.intr_info = intr_fields;
+        nvmx->intr.error_code = error_code;
+        nvmx->intr.source = source;
+        vcpu_nestedhvm(v).nv_vmexit_pending = 1;
+        return;
     }
+    else
+        gdprintk(XENLOG_ERR, "Double Fault on Nested Guest: exception %lx %x"
+                 "on %lx %x\n", intr_fields, error_code,
+                 nvmx->intr.intr_info, nvmx->intr.error_code);
+}
 
-    return 0;
+static int cf_check nvmx_vmexit_event(
+    struct vcpu *v, const struct x86_event *event)
+{
+    nvmx_enqueue_n2_exceptions(v, event->vector, event->error_code,
+                               hvm_intsrc_none);
+    return NESTEDHVM_VMEXIT_DONE;
 }
 
-static int cf_check vmtrace_control(struct vcpu *v, bool enable, bool reset)
+static void __vmx_inject_exception(int trap, int type, int error_code)
 {
-    struct vcpu_msrs *msrs = v->arch.msrs;
-    uint64_t new_ctl;
-    int rc;
+    unsigned long intr_fields;
+    struct vcpu *curr = current;
 
     /*
-     * Absolutely nothing good will come of Xen's and userspace's idea of
-     * whether ipt is enabled getting out of sync.
+     * NB. Callers do not need to worry about clearing STI/MOV-SS blocking:
+     *  "If the VM entry is injecting, there is no blocking by STI or by
+     *   MOV SS following the VM entry, regardless of the contents of the
+     *   interruptibility-state field [in the guest-state area before the
+     *   VM entry]", PRM Vol. 3, 22.6.1 (Interruptibility State).
      */
-    if ( v->arch.hvm.vmx.ipt_active == enable )
-        return -EINVAL;
 
-    if ( reset )
+    intr_fields = INTR_INFO_VALID_MASK |
+                  MASK_INSR(type, INTR_INFO_INTR_TYPE_MASK) |
+                  MASK_INSR(trap, INTR_INFO_VECTOR_MASK);
+    if ( error_code != X86_EVENT_NO_EC )
     {
-        msrs->rtit.status = 0;
-        msrs->rtit.output_offset = 0;
+        ASSERT(error_code == (uint16_t)error_code);
+        __vmwrite(VM_ENTRY_EXCEPTION_ERROR_CODE, error_code);
+        intr_fields |= INTR_INFO_DELIVER_CODE_MASK;
     }
 
-    new_ctl = msrs->rtit.ctl & ~RTIT_CTL_TRACE_EN;
-    if ( enable )
-        new_ctl |= RTIT_CTL_TRACE_EN;
-
-    rc = vmtrace_set_option(v, MSR_RTIT_CTL, new_ctl);
-    if ( rc )
-        return rc;
-
-    v->arch.hvm.vmx.ipt_active = enable;
+    __vmwrite(VM_ENTRY_INTR_INFO, intr_fields);
 
-    return 0;
+    /* Can't inject exceptions in virtual 8086 mode because they would
+     * use the protected-mode IDT.  Emulate at the next vmenter instead. */
+    if ( curr->arch.hvm.vmx.vmx_realmode )
+        curr->arch.hvm.vmx.vmx_emulate = 1;
 }
 
-static int cf_check vmtrace_output_position(struct vcpu *v, uint64_t *pos)
+void vmx_inject_extint(int trap, uint8_t source)
 {
-    *pos = v->arch.msrs->rtit.output_offset;
-    return v->arch.hvm.vmx.ipt_active;
+    struct vcpu *v = current;
+    u32    pin_based_cntrl;
+
+    if ( nestedhvm_vcpu_in_guestmode(v) ) {
+        pin_based_cntrl = get_vvmcs(v, PIN_BASED_VM_EXEC_CONTROL);
+        if ( pin_based_cntrl & PIN_BASED_EXT_INTR_MASK ) {
+            nvmx_enqueue_n2_exceptions (v,
+               INTR_INFO_VALID_MASK |
+               MASK_INSR(X86_EVENTTYPE_EXT_INTR, INTR_INFO_INTR_TYPE_MASK) |
+               MASK_INSR(trap, INTR_INFO_VECTOR_MASK),
+               X86_EVENT_NO_EC, source);
+            return;
+        }
+    }
+    __vmx_inject_exception(trap, X86_EVENTTYPE_EXT_INTR,
+                           X86_EVENT_NO_EC);
 }
 
-static int cf_check vmtrace_reset(struct vcpu *v)
+void vmx_inject_nmi(void)
 {
-    if ( !v->arch.hvm.vmx.ipt_active )
-        return -EINVAL;
+    struct vcpu *v = current;
+    u32    pin_based_cntrl;
 
-    v->arch.msrs->rtit.output_offset = 0;
-    v->arch.msrs->rtit.status = 0;
-    return 0;
+    if ( nestedhvm_vcpu_in_guestmode(v) ) {
+        pin_based_cntrl = get_vvmcs(v, PIN_BASED_VM_EXEC_CONTROL);
+        if ( pin_based_cntrl & PIN_BASED_NMI_EXITING ) {
+            nvmx_enqueue_n2_exceptions (v,
+               INTR_INFO_VALID_MASK |
+               MASK_INSR(X86_EVENTTYPE_NMI, INTR_INFO_INTR_TYPE_MASK) |
+               MASK_INSR(TRAP_nmi, INTR_INFO_VECTOR_MASK),
+               X86_EVENT_NO_EC, hvm_intsrc_nmi);
+            return;
+        }
+    }
+    __vmx_inject_exception(2, X86_EVENTTYPE_NMI,
+                           X86_EVENT_NO_EC);
 }
 
-static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
+/*
+ * Generate a virtual event in the guest.
+ * NOTES:
+ *  - INT 3 (CC) and INTO (CE) are X86_EVENTTYPE_SW_EXCEPTION;
+ *  - INT nn (CD nn) is X86_EVENTTYPE_SW_INTERRUPT;
+ *  - #DB is X86_EVENTTYPE_HW_EXCEPTION, except when generated by
+ *    opcode 0xf1 (which is X86_EVENTTYPE_PRI_SW_EXCEPTION)
+ */
+static void cf_check vmx_inject_event(const struct x86_event *event)
 {
-    const struct vcpu *curr = current;
-    struct domain *d = v->domain;
-    const struct vcpu_msrs *msrs = v->arch.msrs;
-    uint64_t val = 0;
-    int rc;
+    unsigned long intr_info;
+    struct vcpu *curr = current;
+    struct x86_event _event = *event;
 
-    /* Logic which doesn't require remote VMCS acquisition. */
-    switch ( reg )
+    switch ( _event.vector | -(_event.type == X86_EVENTTYPE_SW_INTERRUPT) )
     {
-    case MSR_SPEC_CTRL:
-        rc = vmx_read_guest_msr(v, reg, &val);
-        if ( rc )
+    case TRAP_debug:
+        if ( guest_cpu_user_regs()->eflags & X86_EFLAGS_TF )
         {
-            printk(XENLOG_G_ERR "%s(%pv, 0x%08x) MSR list error: %d\n",
-                   __func__, v, reg, rc);
-            domain_crash(d);
+            __restore_debug_registers(curr);
+            write_debugreg(6, read_debugreg(6) | DR_STEP);
         }
-        return val;
+        if ( !nestedhvm_vcpu_in_guestmode(curr) ||
+             !nvmx_intercepts_exception(curr, TRAP_debug, _event.error_code) )
+        {
+            unsigned long val;
 
-    case MSR_PKRS:
-        return (v == curr) ? rdpkrs() : msrs->pkrs;
+            __vmread(GUEST_DR7, &val);
+            __vmwrite(GUEST_DR7, val & ~DR_GENERAL_DETECT);
+            __vmread(GUEST_IA32_DEBUGCTL, &val);
+            __vmwrite(GUEST_IA32_DEBUGCTL, val & ~IA32_DEBUGCTLMSR_LBR);
+        }
+        if ( cpu_has_monitor_trap_flag )
+            break;
+        /* fall through */
+    case TRAP_int3:
+        if ( curr->domain->debugger_attached )
+        {
+            /* Debug/Int3: Trap to debugger. */
+            domain_pause_for_debugger();
+            return;
+        }
+        break;
 
-    case MSR_SHADOW_GS_BASE:
-        if ( v != curr )
-            return v->arch.hvm.vmx.shadow_gs;
-        rdmsrl(MSR_SHADOW_GS_BASE, val);
-        return val;
+    case TRAP_page_fault:
+        ASSERT(_event.type == X86_EVENTTYPE_HW_EXCEPTION);
+        curr->arch.hvm.guest_cr[2] = _event.cr2;
+        break;
     }
 
-    /* Logic which maybe requires remote VMCS acquisition. */
-    vmx_vmcs_enter(v);
-    switch ( reg )
+    if ( nestedhvm_vcpu_in_guestmode(curr) )
+        intr_info = vcpu_2_nvmx(curr).intr.intr_info;
+    else
+        __vmread(VM_ENTRY_INTR_INFO, &intr_info);
+
+    if ( unlikely(intr_info & INTR_INFO_VALID_MASK) &&
+         (MASK_EXTR(intr_info, INTR_INFO_INTR_TYPE_MASK) ==
+          X86_EVENTTYPE_HW_EXCEPTION) )
     {
-    case MSR_IA32_BNDCFGS:
-        __vmread(GUEST_BNDCFGS, &val);
-        break;
+        _event.vector = hvm_combine_hw_exceptions(
+            (uint8_t)intr_info, _event.vector);
+        if ( _event.vector == TRAP_double_fault )
+            _event.error_code = 0;
+    }
 
-    default:
-        printk(XENLOG_G_ERR "%s(%pv, 0x%08x) Bad register\n",
-               __func__, v, reg);
-        domain_crash(d);
-        break;
+    if ( _event.type >= X86_EVENTTYPE_SW_INTERRUPT )
+        __vmwrite(VM_ENTRY_INSTRUCTION_LEN, _event.insn_len);
+
+    if ( nestedhvm_vcpu_in_guestmode(curr) &&
+         nvmx_intercepts_exception(curr, _event.vector, _event.error_code) )
+    {
+        nvmx_enqueue_n2_exceptions (curr,
+            INTR_INFO_VALID_MASK |
+            MASK_INSR(_event.type, INTR_INFO_INTR_TYPE_MASK) |
+            MASK_INSR(_event.vector, INTR_INFO_VECTOR_MASK),
+            _event.error_code, hvm_intsrc_none);
+        return;
     }
-    vmx_vmcs_exit(v);
+    else
+        __vmx_inject_exception(_event.vector, _event.type, _event.error_code);
 
-    return val;
+    if ( (_event.vector == TRAP_page_fault) &&
+         (_event.type == X86_EVENTTYPE_HW_EXCEPTION) )
+        HVMTRACE_LONG_2D(PF_INJECT, _event.error_code,
+                         TRC_PAR_LONG(curr->arch.hvm.guest_cr[2]));
+    else
+        HVMTRACE_2D(INJ_EXC, _event.vector, _event.error_code);
 }
 
-static void cf_check vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
+static bool cf_check vmx_event_pending(const struct vcpu *v)
 {
-    const struct vcpu *curr = current;
-    struct vcpu_msrs *msrs = v->arch.msrs;
-    struct domain *d = v->domain;
-    int rc;
+    unsigned long intr_info;
 
-    /* Logic which doesn't require remote VMCS acquisition. */
-    switch ( reg )
-    {
-    case MSR_SPEC_CTRL:
-        rc = vmx_write_guest_msr(v, reg, val);
-        if ( rc )
-        {
-            printk(XENLOG_G_ERR "%s(%pv, 0x%08x) MSR list error: %d\n",
-                   __func__, v, reg, rc);
-            domain_crash(d);
-        }
-        return;
+    ASSERT(v == current);
+    __vmread(VM_ENTRY_INTR_INFO, &intr_info);
 
-    case MSR_PKRS:
-        msrs->pkrs = val;
-        if ( v == curr )
-            wrpkrs(val);
-        return;
-    }
+    return intr_info & INTR_INFO_VALID_MASK;
+}
+
+static void cf_check vmx_set_info_guest(struct vcpu *v)
+{
+    unsigned long intr_shadow;
 
-    /* Logic which maybe requires remote VMCS acquisition. */
     vmx_vmcs_enter(v);
-    switch ( reg )
-    {
-    case MSR_IA32_BNDCFGS:
-        __vmwrite(GUEST_BNDCFGS, val);
-        break;
 
-    default:
-        printk(XENLOG_G_ERR "%s(%pv, 0x%08x, 0x%016"PRIx64") Bad register\n",
-               __func__, v, reg, val);
-        domain_crash(d);
+    __vmwrite(GUEST_DR7, v->arch.dr7);
+
+    /*
+     * If the interruptibility-state field indicates blocking by STI,
+     * setting the TF flag in the EFLAGS may cause VM entry to fail
+     * and crash the guest. See SDM 3B 22.3.1.5.
+     * Resetting the VMX_INTR_SHADOW_STI flag looks hackish but
+     * to set the GUEST_PENDING_DBG_EXCEPTIONS.BS here incurs
+     * immediately vmexit and hence make no progress.
+     */
+    __vmread(GUEST_INTERRUPTIBILITY_INFO, &intr_shadow);
+    if ( v->domain->debugger_attached &&
+         (v->arch.user_regs.eflags & X86_EFLAGS_TF) &&
+         (intr_shadow & VMX_INTR_SHADOW_STI) )
+    {
+        intr_shadow &= ~VMX_INTR_SHADOW_STI;
+        __vmwrite(GUEST_INTERRUPTIBILITY_INFO, intr_shadow);
     }
+
     vmx_vmcs_exit(v);
 }
 
-static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
-    .name                 = "VMX",
-    .cpu_up_prepare       = vmx_cpu_up_prepare,
-    .cpu_dead             = vmx_cpu_dead,
-    .domain_initialise    = vmx_domain_initialise,
-    .domain_relinquish_resources = vmx_domain_relinquish_resources,
-    .domain_creation_finished = domain_creation_finished,
-    .vcpu_initialise      = vmx_vcpu_initialise,
-    .vcpu_destroy         = vmx_vcpu_destroy,
-    .save_cpu_ctxt        = vmx_save_vmcs_ctxt,
-    .load_cpu_ctxt        = vmx_load_vmcs_ctxt,
-    .get_interrupt_shadow = vmx_get_interrupt_shadow,
-    .set_interrupt_shadow = vmx_set_interrupt_shadow,
-    .get_nonreg_state     = vmx_get_nonreg_state,
-    .set_nonreg_state     = vmx_set_nonreg_state,
-    .guest_x86_mode       = vmx_guest_x86_mode,
-    .get_cpl              = _vmx_get_cpl,
-    .get_segment_register = vmx_get_segment_register,
-    .set_segment_register = vmx_set_segment_register,
-    .update_host_cr3      = vmx_update_host_cr3,
-    .update_guest_cr      = vmx_update_guest_cr,
-    .update_guest_efer    = vmx_update_guest_efer,
-    .cpuid_policy_changed = vmx_cpuid_policy_changed,
-    .fpu_leave            = vmx_fpu_leave,
-    .set_guest_pat        = vmx_set_guest_pat,
-    .get_guest_pat        = vmx_get_guest_pat,
-    .set_tsc_offset       = vmx_set_tsc_offset,
-    .inject_event         = vmx_inject_event,
-    .init_hypercall_page  = vmx_init_hypercall_page,
-    .event_pending        = vmx_event_pending,
-    .get_pending_event    = vmx_get_pending_event,
-    .invlpg               = vmx_invlpg,
-    .cpu_up               = vmx_cpu_up,
-    .cpu_down             = vmx_cpu_down,
-    .wbinvd_intercept     = vmx_wbinvd_intercept,
-    .fpu_dirty_intercept  = vmx_fpu_dirty_intercept,
-    .msr_read_intercept   = vmx_msr_read_intercept,
-    .msr_write_intercept  = vmx_msr_write_intercept,
-    .handle_cd            = vmx_handle_cd,
-    .set_info_guest       = vmx_set_info_guest,
-    .set_rdtsc_exiting    = vmx_set_rdtsc_exiting,
-    .nhvm_vcpu_initialise = nvmx_vcpu_initialise,
-    .nhvm_vcpu_destroy    = nvmx_vcpu_destroy,
-    .nhvm_vcpu_reset      = nvmx_vcpu_reset,
-    .nhvm_vcpu_p2m_base   = nvmx_vcpu_eptp_base,
-    .nhvm_vmcx_hap_enabled = nvmx_ept_enabled,
-    .nhvm_vmcx_guest_intercepts_event = nvmx_intercepts_exception,
-    .nhvm_vcpu_vmexit_event = nvmx_vmexit_event,
-    .nhvm_intr_blocked    = nvmx_intr_blocked,
-    .nhvm_domain_relinquish_resources = nvmx_domain_relinquish_resources,
-    .update_vlapic_mode = vmx_vlapic_msr_changed,
-    .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
-    .enable_msr_interception = vmx_enable_msr_interception,
-    .altp2m_vcpu_update_p2m = vmx_vcpu_update_eptp,
-    .altp2m_vcpu_update_vmfunc_ve = vmx_vcpu_update_vmfunc_ve,
-    .altp2m_vcpu_emulate_ve = vmx_vcpu_emulate_ve,
-    .altp2m_vcpu_emulate_vmfunc = vmx_vcpu_emulate_vmfunc,
-    .vmtrace_control = vmtrace_control,
-    .vmtrace_output_position = vmtrace_output_position,
-    .vmtrace_set_option = vmtrace_set_option,
-    .vmtrace_get_option = vmtrace_get_option,
-    .vmtrace_reset = vmtrace_reset,
-
-    .get_reg = vmx_get_reg,
-    .set_reg = vmx_set_reg,
-
-    .tsc_scaling = {
-        .max_ratio = VMX_TSC_MULTIPLIER_MAX,
-    },
-};
-
-/* Handle VT-d posted-interrupt when VCPU is blocked. */
-static void cf_check pi_wakeup_interrupt(struct cpu_user_regs *regs)
+static void cf_check vmx_update_eoi_exit_bitmap(
+    struct vcpu *v, uint8_t vector, bool set)
 {
-    struct vmx_vcpu *vmx, *tmp;
-    spinlock_t *lock = &per_cpu(vmx_pi_blocking, smp_processor_id()).lock;
-    struct list_head *blocked_vcpus =
-		&per_cpu(vmx_pi_blocking, smp_processor_id()).list;
+    if ( set )
+        vmx_set_eoi_exit_bitmap(v, vector);
+    else
+        vmx_clear_eoi_exit_bitmap(v, vector);
+}
 
-    ack_APIC_irq();
-    this_cpu(irq_count)++;
+static u8 set_svi(int isr)
+{
+    unsigned long status;
+    u8 old;
 
-    spin_lock(lock);
+    if ( isr < 0 )
+        isr = 0;
 
-    /*
-     * XXX: The length of the list depends on how many vCPU is current
-     * blocked on this specific pCPU. This may hurt the interrupt latency
-     * if the list grows to too many entries.
-     */
-    list_for_each_entry_safe(vmx, tmp, blocked_vcpus, pi_blocking.list)
+    __vmread(GUEST_INTR_STATUS, &status);
+    old = status >> VMX_GUEST_INTR_STATUS_SVI_OFFSET;
+    if ( isr != old )
     {
-        if ( pi_test_on(&vmx->pi_desc) )
-        {
-            list_del(&vmx->pi_blocking.list);
-            ASSERT(vmx->pi_blocking.lock == lock);
-            vmx->pi_blocking.lock = NULL;
-            vcpu_unblock(container_of(vmx, struct vcpu, arch.hvm.vmx));
-        }
+        status &= VMX_GUEST_INTR_STATUS_SUBFIELD_BITMASK;
+        status |= isr << VMX_GUEST_INTR_STATUS_SVI_OFFSET;
+        __vmwrite(GUEST_INTR_STATUS, status);
     }
 
-    spin_unlock(lock);
+    return old;
 }
 
-/* Handle VT-d posted-interrupt when VCPU is running. */
-static void cf_check pi_notification_interrupt(struct cpu_user_regs *regs)
+static void cf_check vmx_process_isr(int isr, struct vcpu *v)
 {
-    ack_APIC_irq();
-    this_cpu(irq_count)++;
-
-    /*
-     * We get here when a vCPU is running in root-mode (such as via hypercall,
-     * or any other reasons which can result in VM-Exit), and before vCPU is
-     * back to non-root, external interrupts from an assigned device happen
-     * and a notification event is delivered to this logical CPU.
-     *
-     * we need to set VCPU_KICK_SOFTIRQ for the current cpu, just like
-     * __vmx_deliver_posted_interrupt(). So the pending interrupt in PIRR will
-     * be synced to vIRR before VM-Exit in time.
-     *
-     * Please refer to the following code fragments from
-     * xen/arch/x86/hvm/vmx/entry.S:
-     *
-     *     .Lvmx_do_vmentry
-     *
-     *      ......
-     *
-     *      point 1
-     *
-     *      cli
-     *      cmp  %ecx,(%rdx,%rax,1)
-     *      jnz  .Lvmx_process_softirqs
-     *
-     *      ......
-     *
-     *      je   .Lvmx_launch
-     *
-     *      ......
-     *
-     *     .Lvmx_process_softirqs:
-     *      sti
-     *      call do_softirq
-     *      jmp  .Lvmx_do_vmentry
-     *
-     * If VT-d engine issues a notification event at point 1 above, it cannot
-     * be delivered to the guest during this VM-entry without raising the
-     * softirq in this notification handler.
-     */
-    raise_softirq(VCPU_KICK_SOFTIRQ);
-}
+    unsigned int i;
+    const struct vlapic *vlapic = vcpu_vlapic(v);
 
-static void __init lbr_tsx_fixup_check(void);
-static void __init ler_to_fixup_check(void);
+    vmx_vmcs_enter(v);
 
-/*
- * Calculate whether the CPU is vulnerable to Instruction Fetch page
- * size-change MCEs.
- */
-static bool __init has_if_pschange_mc(void)
-{
-    uint64_t caps = 0;
+    set_svi(isr);
 
     /*
-     * If we are virtualised, there is nothing we can do.  Our EPT tables are
-     * shadowed by our hypervisor, and not walked by hardware.
+     * Theoretically, only level triggered interrupts can have their
+     * corresponding bits set in the eoi exit bitmap. That is, the bits
+     * set in the eoi exit bitmap should also be set in TMR. But a periodic
+     * timer interrupt does not follow the rule: it is edge triggered, but
+     * requires its corresponding bit be set in the eoi exit bitmap. So we
+     * should not construct the eoi exit bitmap based on TMR.
+     * Here we will construct the eoi exit bitmap via (IRR | ISR). This
+     * means that EOIs to the interrupts that are set in the IRR or ISR will
+     * cause VM exits after restoring, regardless of the trigger modes. It
+     * is acceptable because the subsequent interrupts will set up the eoi
+     * bitmap correctly.
      */
-    if ( cpu_has_hypervisor )
-        return false;
+    for ( i = 0x10; i < X86_NR_VECTORS; ++i )
+        if ( vlapic_test_vector(i, &vlapic->regs->data[APIC_IRR]) ||
+             vlapic_test_vector(i, &vlapic->regs->data[APIC_ISR]) )
+            set_bit(i, v->arch.hvm.vmx.eoi_exit_bitmap);
 
-    if ( cpu_has_arch_caps )
-        rdmsrl(MSR_ARCH_CAPABILITIES, caps);
+    for ( i = 0; i < ARRAY_SIZE(v->arch.hvm.vmx.eoi_exit_bitmap); ++i )
+        __vmwrite(EOI_EXIT_BITMAP(i), v->arch.hvm.vmx.eoi_exit_bitmap[i]);
 
-    if ( caps & ARCH_CAPS_IF_PSCHANGE_MC_NO )
-        return false;
+    vmx_vmcs_exit(v);
+}
+
+static void __vmx_deliver_posted_interrupt(struct vcpu *v)
+{
+    bool_t running = v->is_running;
 
+    vcpu_unblock(v);
     /*
-     * IF_PSCHANGE_MC is only known to affect Intel Family 6 processors at
-     * this time.
+     * Just like vcpu_kick(), nothing is needed for the following two cases:
+     * 1. The target vCPU is not running, meaning it is blocked or runnable.
+     * 2. The target vCPU is the current vCPU and we're in non-interrupt
+     * context.
      */
-    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.x86 != 6 )
-        return false;
-
-    switch ( boot_cpu_data.x86_model )
+    if ( running && (in_irq() || (v != current)) )
     {
         /*
-         * Core processors since at least Nehalem are vulnerable.
+         * Note: Only two cases will reach here:
+         * 1. The target vCPU is running on other pCPU.
+         * 2. The target vCPU is the current vCPU.
+         *
+         * Note2: Don't worry the v->processor may change. The vCPU being
+         * moved to another processor is guaranteed to sync PIR to vIRR,
+         * due to the involved scheduling cycle.
          */
-    case 0x1f: /* Auburndale / Havendale */
-    case 0x1e: /* Nehalem */
-    case 0x1a: /* Nehalem EP */
-    case 0x2e: /* Nehalem EX */
-    case 0x25: /* Westmere */
-    case 0x2c: /* Westmere EP */
-    case 0x2f: /* Westmere EX */
-    case 0x2a: /* SandyBridge */
-    case 0x2d: /* SandyBridge EP/EX */
-    case 0x3a: /* IvyBridge */
-    case 0x3e: /* IvyBridge EP/EX */
-    case 0x3c: /* Haswell */
-    case 0x3f: /* Haswell EX/EP */
-    case 0x45: /* Haswell D */
-    case 0x46: /* Haswell H */
-    case 0x3d: /* Broadwell */
-    case 0x47: /* Broadwell H */
-    case 0x4f: /* Broadwell EP/EX */
-    case 0x56: /* Broadwell D */
-    case 0x4e: /* Skylake M */
-    case 0x5e: /* Skylake D */
-    case 0x55: /* Skylake-X / Cascade Lake */
-    case 0x7d: /* Ice Lake */
-    case 0x7e: /* Ice Lake */
-    case 0x8e: /* Kaby / Coffee / Whiskey Lake M */
-    case 0x9e: /* Kaby / Coffee / Whiskey Lake D */
-    case 0xa5: /* Comet Lake H/S */
-    case 0xa6: /* Comet Lake U */
-        return true;
+        unsigned int cpu = v->processor;
 
         /*
-         * Atom processors are not vulnerable.
+         * For case 1, we send an IPI to the pCPU. When an IPI arrives, the
+         * target vCPU maybe is running in non-root mode, running in root
+         * mode, runnable or blocked. If the target vCPU is running in
+         * non-root mode, the hardware will sync PIR to vIRR for
+         * 'posted_intr_vector' is special to the pCPU. If the target vCPU is
+         * running in root-mode, the interrupt handler starts to run.
+         * Considering an IPI may arrive in the window between the call to
+         * vmx_intr_assist() and interrupts getting disabled, the interrupt
+         * handler should raise a softirq to ensure events will be delivered
+         * in time. If the target vCPU is runnable, it will sync PIR to
+         * vIRR next time it is chose to run. In this case, a IPI and a
+         * softirq is sent to a wrong vCPU which will not have any adverse
+         * effect. If the target vCPU is blocked, since vcpu_block() checks
+         * whether there is an event to be delivered through
+         * local_events_need_delivery() just after blocking, the vCPU must
+         * have synced PIR to vIRR. Similarly, there is a IPI and a softirq
+         * sent to a wrong vCPU.
          */
-    case 0x1c: /* Pineview */
-    case 0x26: /* Lincroft */
-    case 0x27: /* Penwell */
-    case 0x35: /* Cloverview */
-    case 0x36: /* Cedarview */
-    case 0x37: /* Baytrail / Valleyview (Silvermont) */
-    case 0x4d: /* Avaton / Rangely (Silvermont) */
-    case 0x4c: /* Cherrytrail / Brasswell */
-    case 0x4a: /* Merrifield */
-    case 0x5a: /* Moorefield */
-    case 0x5c: /* Goldmont */
-    case 0x5d: /* SoFIA 3G Granite/ES2.1 */
-    case 0x65: /* SoFIA LTE AOSP */
-    case 0x5f: /* Denverton */
-    case 0x6e: /* Cougar Mountain */
-    case 0x75: /* Lightning Mountain */
-    case 0x7a: /* Gemini Lake */
-    case 0x86: /* Jacobsville */
-
+        if ( cpu != smp_processor_id() )
+            send_IPI_mask(cpumask_of(cpu), posted_intr_vector);
         /*
-         * Knights processors are not vulnerable.
+         * For case 2, raising a softirq ensures PIR will be synced to vIRR.
+         * As any softirq will do, as an optimization we only raise one if
+         * none is pending already.
          */
-    case 0x57: /* Knights Landing */
-    case 0x85: /* Knights Mill */
-        return false;
-
-    default:
-        printk("Unrecognised CPU model %#x - assuming vulnerable to IF_PSCHANGE_MC\n",
-               boot_cpu_data.x86_model);
-        return true;
+        else if ( !softirq_pending(cpu) )
+            raise_softirq(VCPU_KICK_SOFTIRQ);
     }
 }
 
-const struct hvm_function_table * __init start_vmx(void)
+static void cf_check vmx_deliver_posted_intr(struct vcpu *v, u8 vector)
 {
-    set_in_cr4(X86_CR4_VMXE);
+    struct pi_desc old, new, prev;
 
-    if ( vmx_vmcs_init() )
+    if ( pi_test_and_set_pir(vector, &v->arch.hvm.vmx.pi_desc) )
+        return;
+
+    if ( unlikely(v->arch.hvm.vmx.eoi_exitmap_changed) )
     {
-        printk("VMX: failed to initialise.\n");
-        return NULL;
+        /*
+         * If EOI exitbitmap needs to changed or notification vector
+         * can't be allocated, interrupt will not be injected till
+         * VMEntry as it used to be.
+         */
+        pi_set_on(&v->arch.hvm.vmx.pi_desc);
+        vcpu_kick(v);
+        return;
     }
 
-    vmx_function_table.singlestep_supported = cpu_has_monitor_trap_flag;
+    prev.control = v->arch.hvm.vmx.pi_desc.control;
+
+    do {
+        /*
+         * Currently, we don't support urgent interrupt, all
+         * interrupts are recognized as non-urgent interrupt,
+         * Besides that, if 'ON' is already set, no need to
+         * send posted-interrupts notification event as well,
+         * according to hardware behavior.
+         */
+        if ( pi_test_sn(&prev) || pi_test_on(&prev) )
+        {
+            vcpu_kick(v);
+            return;
+        }
+
+        old.control = v->arch.hvm.vmx.pi_desc.control &
+                      ~((1 << POSTED_INTR_ON) | (1 << POSTED_INTR_SN));
+        new.control = v->arch.hvm.vmx.pi_desc.control |
+                      (1 << POSTED_INTR_ON);
+
+        prev.control = cmpxchg(&v->arch.hvm.vmx.pi_desc.control,
+                               old.control, new.control);
+    } while ( prev.control != old.control );
+
+    __vmx_deliver_posted_interrupt(v);
+}
 
-    if ( cpu_has_vmx_dt_exiting )
-        vmx_function_table.set_descriptor_access_exiting =
-            vmx_set_descriptor_access_exiting;
+static void cf_check vmx_sync_pir_to_irr(struct vcpu *v)
+{
+    struct vlapic *vlapic = vcpu_vlapic(v);
+    unsigned int group, i;
+    DECLARE_BITMAP(pending_intr, X86_NR_VECTORS);
 
-    /*
-     * Do not enable EPT when (!cpu_has_vmx_pat), to prevent security hole
-     * (refer to https://xenbits.xen.org/xsa/advisory-60.html).
-     */
-    if ( cpu_has_vmx_ept && (cpu_has_vmx_pat || opt_force_ept) )
-    {
-        bool cpu_has_bug_pschange_mc = has_if_pschange_mc();
+    if ( !pi_test_and_clear_on(&v->arch.hvm.vmx.pi_desc) )
+        return;
 
-        if ( opt_ept_exec_sp == -1 )
-        {
-            /* Default to non-executable superpages on vulnerable hardware. */
-            opt_ept_exec_sp = !cpu_has_bug_pschange_mc;
+    for ( group = 0; group < ARRAY_SIZE(pending_intr); group++ )
+        pending_intr[group] = pi_get_pir(&v->arch.hvm.vmx.pi_desc, group);
 
-            if ( cpu_has_bug_pschange_mc )
-                printk("VMX: Disabling executable EPT superpages due to CVE-2018-12207\n");
-        }
+    for_each_set_bit(i, pending_intr, X86_NR_VECTORS)
+        vlapic_set_vector(i, &vlapic->regs->data[APIC_IRR]);
+}
 
-        vmx_function_table.hap_supported = 1;
-        vmx_function_table.altp2m_supported = 1;
+static bool cf_check vmx_test_pir(const struct vcpu *v, uint8_t vec)
+{
+    return pi_test_pir(vec, &v->arch.hvm.vmx.pi_desc);
+}
 
-        vmx_function_table.hap_capabilities = 0;
+static void cf_check vmx_handle_eoi(uint8_t vector, int isr)
+{
+    uint8_t old_svi = set_svi(isr);
+    static bool warned;
 
-        if ( cpu_has_vmx_ept_2mb )
-            vmx_function_table.hap_capabilities |= HVM_HAP_SUPERPAGE_2MB;
-        if ( cpu_has_vmx_ept_1gb )
-            vmx_function_table.hap_capabilities |= HVM_HAP_SUPERPAGE_1GB;
+    if ( vector != old_svi && !test_and_set_bool(warned) )
+        printk(XENLOG_WARNING "EOI for %02x but SVI=%02x\n", vector, old_svi);
+}
 
-        setup_ept_dump();
-    }
+static void cf_check vmx_enable_msr_interception(struct domain *d, uint32_t msr)
+{
+    struct vcpu *v;
 
-    if ( cpu_has_vmx_virtual_intr_delivery )
-    {
-        vmx_function_table.update_eoi_exit_bitmap = vmx_update_eoi_exit_bitmap;
-        vmx_function_table.process_isr = vmx_process_isr;
-        vmx_function_table.handle_eoi = vmx_handle_eoi;
-        vmx_function_table.virtual_intr_delivery_enabled = true;
-    }
+    for_each_vcpu ( d, v )
+        vmx_set_msr_intercept(v, msr, VMX_MSR_W);
+}
 
-    if ( cpu_has_vmx_posted_intr_processing )
-    {
-        alloc_direct_apic_vector(&posted_intr_vector, pi_notification_interrupt);
-        if ( iommu_intpost )
-        {
-            alloc_direct_apic_vector(&pi_wakeup_vector, pi_wakeup_interrupt);
+static void cf_check vmx_vcpu_update_eptp(struct vcpu *v)
+{
+    struct domain *d = v->domain;
+    struct p2m_domain *p2m = NULL;
+    struct ept_data *ept;
 
-            vmx_function_table.pi_update_irte = vmx_pi_update_irte;
-        }
+    if ( altp2m_active(d) )
+        p2m = p2m_get_altp2m(v);
+    if ( !p2m )
+        p2m = p2m_get_hostp2m(d);
 
-        vmx_function_table.deliver_posted_intr = vmx_deliver_posted_intr;
-        vmx_function_table.sync_pir_to_irr     = vmx_sync_pir_to_irr;
-        vmx_function_table.test_pir            = vmx_test_pir;
-    }
+    ept = &p2m->ept;
+    ept->mfn = pagetable_get_pfn(p2m_get_pagetable(p2m));
 
-    if ( cpu_has_vmx_tsc_scaling )
-    {
-        vmx_function_table.tsc_scaling.ratio_frac_bits = 48;
-        vmx_function_table.tsc_scaling.setup = vmx_setup_tsc_scaling;
-    }
+    vmx_vmcs_enter(v);
 
-    model_specific_lbr = get_model_specific_lbr();
-    lbr_tsx_fixup_check();
-    ler_to_fixup_check();
+    __vmwrite(EPT_POINTER, ept->eptp);
 
-    return &vmx_function_table;
+    if ( v->arch.hvm.vmx.secondary_exec_control &
+         SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS )
+        __vmwrite(EPTP_INDEX, vcpu_altp2m(v).p2midx);
+
+    vmx_vmcs_exit(v);
 }
 
-/*
- * Not all cases receive valid value in the VM-exit instruction length field.
- * Callers must know what they're doing!
- */
-static int get_instruction_length(void)
+static void cf_check vmx_vcpu_update_vmfunc_ve(struct vcpu *v)
 {
-    unsigned long len;
+    struct domain *d = v->domain;
+    u32 mask = SECONDARY_EXEC_ENABLE_VM_FUNCTIONS;
 
-    __vmread(VM_EXIT_INSTRUCTION_LEN, &len); /* Safe: callers audited */
-    BUG_ON((len < 1) || (len > MAX_INST_LEN));
-    return len;
-}
+    if ( !cpu_has_vmx_vmfunc )
+        return;
 
-void update_guest_eip(void)
-{
-    struct cpu_user_regs *regs = guest_cpu_user_regs();
-    unsigned long x;
+    if ( cpu_has_vmx_virt_exceptions )
+        mask |= SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS;
 
-    regs->rip += get_instruction_length(); /* Safe: callers audited */
-    regs->eflags &= ~X86_EFLAGS_RF;
+    vmx_vmcs_enter(v);
 
-    __vmread(GUEST_INTERRUPTIBILITY_INFO, &x);
-    if ( x & (VMX_INTR_SHADOW_STI | VMX_INTR_SHADOW_MOV_SS) )
+    if ( !d->is_dying && altp2m_active(d) )
     {
-        x &= ~(VMX_INTR_SHADOW_STI | VMX_INTR_SHADOW_MOV_SS);
-        __vmwrite(GUEST_INTERRUPTIBILITY_INFO, x);
+        v->arch.hvm.vmx.secondary_exec_control |= mask;
+        __vmwrite(VM_FUNCTION_CONTROL, VMX_VMFUNC_EPTP_SWITCHING);
+        __vmwrite(EPTP_LIST_ADDR, virt_to_maddr(d->arch.altp2m_visible_eptp));
+
+        if ( cpu_has_vmx_virt_exceptions )
+        {
+            const struct page_info *pg = vcpu_altp2m(v).veinfo_pg;
+
+            if ( pg )
+            {
+                __vmwrite(VIRT_EXCEPTION_INFO, page_to_maddr(pg));
+                /*
+                 * Make sure we have an up-to-date EPTP_INDEX when
+                 * setting SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS.
+                 */
+                __vmwrite(EPTP_INDEX, vcpu_altp2m(v).p2midx);
+            }
+            else
+                v->arch.hvm.vmx.secondary_exec_control &=
+                    ~SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS;
+        }
     }
+    else
+        v->arch.hvm.vmx.secondary_exec_control &= ~mask;
 
-    if ( regs->eflags & X86_EFLAGS_TF )
-        hvm_inject_hw_exception(TRAP_debug, X86_EVENT_NO_EC);
+    vmx_update_secondary_exec_control(v);
+    vmx_vmcs_exit(v);
 }
 
-static void cf_check vmx_fpu_dirty_intercept(void)
+static int cf_check vmx_vcpu_emulate_vmfunc(const struct cpu_user_regs *regs)
 {
+    int rc = X86EMUL_EXCEPTION;
     struct vcpu *curr = current;
 
-    vmx_fpu_enter(curr);
+    if ( !cpu_has_vmx_vmfunc && altp2m_active(curr->domain) &&
+         regs->eax == 0 &&
+         p2m_switch_vcpu_altp2m_by_id(curr, regs->ecx) )
+        rc = X86EMUL_OKAY;
 
-    /* Disable TS in guest CR0 unless the guest wants the exception too. */
-    if ( !(curr->arch.hvm.guest_cr[0] & X86_CR0_TS) )
-    {
-        curr->arch.hvm.hw_cr[0] &= ~X86_CR0_TS;
-        __vmwrite(GUEST_CR0, curr->arch.hvm.hw_cr[0]);
-    }
+    return rc;
 }
 
-static void vmx_dr_access(unsigned long exit_qualification,
-                          struct cpu_user_regs *regs)
+static bool cf_check vmx_vcpu_emulate_ve(struct vcpu *v)
 {
-    struct vcpu *v = current;
+    const struct page_info *pg = vcpu_altp2m(v).veinfo_pg;
+    ve_info_t *veinfo;
+    bool rc = false;
 
-    HVMTRACE_0D(DR_WRITE);
+    if ( !pg )
+        return rc;
 
-    if ( !v->arch.hvm.flag_dr_dirty )
-        __restore_debug_registers(v);
+    veinfo = __map_domain_page(pg);
 
-    /* Allow guest direct access to DR registers */
-    v->arch.hvm.vmx.exec_control &= ~CPU_BASED_MOV_DR_EXITING;
-    vmx_update_cpu_exec_control(v);
-}
+    if ( veinfo->semaphore != 0 )
+        goto out;
 
-static void vmx_invlpg_intercept(unsigned long linear)
-{
-    HVMTRACE_LONG_2D(INVLPG, /*invlpga=*/ 0, TRC_PAR_LONG(linear));
-    paging_invlpg(current, linear);
-}
+    rc = true;
+    veinfo->exit_reason = EXIT_REASON_EPT_VIOLATION;
+    veinfo->semaphore = ~0;
+    veinfo->eptp_index = vcpu_altp2m(v).p2midx;
 
-static void cf_check vmx_invlpg(struct vcpu *v, unsigned long linear)
-{
-    if ( cpu_has_vmx_vpid )
-        vpid_sync_vcpu_gva(v, linear);
-}
+    vmx_vmcs_enter(v);
+    __vmread(EXIT_QUALIFICATION, &veinfo->exit_qualification);
+    __vmread(GUEST_LINEAR_ADDRESS, &veinfo->gla);
+    __vmread(GUEST_PHYSICAL_ADDRESS, &veinfo->gpa);
+    vmx_vmcs_exit(v);
 
-static int vmx_vmfunc_intercept(struct cpu_user_regs *regs)
-{
-    /*
-     * This handler is a placeholder for future where Xen may
-     * want to handle VMFUNC exits and resume a domain normally without
-     * injecting a #UD to the guest - for example, in a VT-nested
-     * scenario where Xen may want to lazily shadow the alternate
-     * EPTP list.
-     */
-    gdprintk(XENLOG_ERR, "Failed guest VMFUNC execution\n");
-    return X86EMUL_EXCEPTION;
+    hvm_inject_hw_exception(TRAP_virtualisation,
+                            X86_EVENT_NO_EC);
+
+ out:
+    unmap_domain_page(veinfo);
+
+    if ( rc )
+        paging_mark_dirty(v->domain, page_to_mfn(pg));
+
+    return rc;
 }
 
-static int vmx_cr_access(cr_access_qual_t qual)
+static bool cf_check vmx_get_pending_event(
+    struct vcpu *v, struct x86_event *info)
 {
-    struct vcpu *curr = current;
+    unsigned long intr_info, error_code;
 
-    switch ( qual.access_type )
-    {
-    case VMX_CR_ACCESS_TYPE_MOV_TO_CR:
-        return hvm_mov_to_cr(qual.cr, qual.gpr);
+    vmx_vmcs_enter(v);
+    __vmread(VM_ENTRY_INTR_INFO, &intr_info);
+    __vmread(VM_ENTRY_EXCEPTION_ERROR_CODE, &error_code);
+    vmx_vmcs_exit(v);
 
-    case VMX_CR_ACCESS_TYPE_MOV_FROM_CR:
-        return hvm_mov_from_cr(qual.cr, qual.gpr);
+    if ( !(intr_info & INTR_INFO_VALID_MASK) )
+        return false;
+
+    info->vector = MASK_EXTR(intr_info, INTR_INFO_VECTOR_MASK);
+    info->type = MASK_EXTR(intr_info, INTR_INFO_INTR_TYPE_MASK);
+    info->error_code = error_code;
 
-    case VMX_CR_ACCESS_TYPE_CLTS:
-    {
-        unsigned long old = curr->arch.hvm.guest_cr[0];
-        unsigned long value = old & ~X86_CR0_TS;
+    return true;
+}
 
-        /*
-         * Special case unlikely to be interesting to a
-         * VM_EVENT_FLAG_DENY-capable application, so the hvm_monitor_crX()
-         * return value is ignored for now.
-         */
-        hvm_monitor_crX(CR0, value, old);
-        curr->arch.hvm.guest_cr[0] = value;
-        vmx_update_guest_cr(curr, 0, 0);
-        HVMTRACE_0D(CLTS);
-        break;
-    }
+/*
+ * We only let vmtrace agents see and modify a subset of bits in MSR_RTIT_CTL.
+ * These all pertain to data-emitted into the trace buffer(s).  Must not
+ * include controls pertaining to the structure/position of the trace
+ * buffer(s).
+ */
+#define RTIT_CTL_MASK                                                   \
+    (RTIT_CTL_TRACE_EN | RTIT_CTL_OS | RTIT_CTL_USR | RTIT_CTL_TSC_EN | \
+     RTIT_CTL_DIS_RETC | RTIT_CTL_BRANCH_EN)
 
-    case VMX_CR_ACCESS_TYPE_LMSW:
-    {
-        unsigned long value = curr->arch.hvm.guest_cr[0];
-        int rc;
+/*
+ * Status bits restricted to the first-gen subset (i.e. no further CPUID
+ * requirements.)
+ */
+#define RTIT_STATUS_MASK                                                \
+    (RTIT_STATUS_FILTER_EN | RTIT_STATUS_CONTEXT_EN | RTIT_STATUS_TRIGGER_EN | \
+     RTIT_STATUS_ERROR | RTIT_STATUS_STOPPED)
 
-        /* LMSW can (1) set PE; (2) set or clear MP, EM, and TS. */
-        value = (value & ~(X86_CR0_MP|X86_CR0_EM|X86_CR0_TS)) |
-                (qual.lmsw_data &
-                 (X86_CR0_PE|X86_CR0_MP|X86_CR0_EM|X86_CR0_TS));
-        HVMTRACE_LONG_1D(LMSW, value);
+static int cf_check vmtrace_get_option(
+    struct vcpu *v, uint64_t key, uint64_t *output)
+{
+    const struct vcpu_msrs *msrs = v->arch.msrs;
 
-        if ( (rc = hvm_set_cr0(value, true)) == X86EMUL_EXCEPTION )
-            hvm_inject_hw_exception(TRAP_gp_fault, 0);
+    switch ( key )
+    {
+    case MSR_RTIT_CTL:
+        *output = msrs->rtit.ctl & RTIT_CTL_MASK;
+        break;
 
-        return rc;
-    }
+    case MSR_RTIT_STATUS:
+        *output = msrs->rtit.status & RTIT_STATUS_MASK;
+        break;
 
     default:
-        ASSERT_UNREACHABLE();
-        return X86EMUL_UNHANDLEABLE;
+        *output = 0;
+        return -EINVAL;
     }
-
-    return X86EMUL_OKAY;
+    return 0;
 }
 
-enum
+static int cf_check vmtrace_set_option(
+    struct vcpu *v, uint64_t key, uint64_t value)
 {
-    LBR_FORMAT_32                 = 0x0, /* 32-bit record format */
-    LBR_FORMAT_LIP                = 0x1, /* 64-bit LIP record format */
-    LBR_FORMAT_EIP                = 0x2, /* 64-bit EIP record format */
-    LBR_FORMAT_EIP_FLAGS          = 0x3, /* 64-bit EIP, Flags */
-    LBR_FORMAT_EIP_FLAGS_TSX      = 0x4, /* 64-bit EIP, Flags, TSX */
-    LBR_FORMAT_EIP_FLAGS_TSX_INFO = 0x5, /* 64-bit EIP, Flags, TSX, LBR_INFO */
-    LBR_FORMAT_EIP_FLAGS_CYCLES   = 0x6, /* 64-bit EIP, Flags, Cycles */
-    LBR_FORMAT_LIP_FLAGS_TSX_INFO = 0x7, /* 64-bit LIP, Flags, TSX, LBR_INFO */
-};
-
-#define LBR_FROM_SIGNEXT_2MSB  ((1ULL << 59) | (1ULL << 60))
-
-#define LBR_MSRS_INSERTED      (1u << 0)
-#define LBR_FIXUP_TSX          (1u << 1)
-#define LBR_FIXUP_LER_TO       (1u << 2)
-#define LBR_FIXUP_MASK         (LBR_FIXUP_TSX | LBR_FIXUP_LER_TO)
+    struct vcpu_msrs *msrs = v->arch.msrs;
+    bool new_en, old_en = msrs->rtit.ctl & RTIT_CTL_TRACE_EN;
 
-static bool __read_mostly lbr_tsx_fixup_needed;
-static bool __read_mostly ler_to_fixup_needed;
+    switch ( key )
+    {
+    case MSR_RTIT_CTL:
+        if ( value & ~RTIT_CTL_MASK )
+            return -EINVAL;
 
-static void __init lbr_tsx_fixup_check(void)
-{
-    uint64_t caps;
-    uint32_t lbr_format;
+        msrs->rtit.ctl &= ~RTIT_CTL_MASK;
+        msrs->rtit.ctl |= (value & RTIT_CTL_MASK);
+        break;
 
-    /*
-     * Haswell erratum HSM182 et al, Broadwell erratum BDM127 et al:
-     *
-     * On processors that do not support Intel Transactional Synchronization
-     * Extensions (Intel TSX) (CPUID.07H.EBX bits 4 and 11 are both zero),
-     * writes to MSR_LASTBRANCH_x_FROM_IP (MSR 680H to 68FH) may #GP unless
-     * bits[62:61] are equal to bit[47].
-     *
-     * Software should sign extend the MSRs.
-     *
-     * Experimentally, MSR_LER_FROM_LIP (1DDH) is similarly impacted, so is
-     * fixed up as well.
-     */
-    if ( cpu_has_hle || cpu_has_rtm ||
-         boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.x86 != 6 )
-        return;
+    case MSR_RTIT_STATUS:
+        if ( value & ~RTIT_STATUS_MASK )
+            return -EINVAL;
 
-    switch ( boot_cpu_data.x86_model )
-    {
-    case 0x3c: /* HSM182, HSD172 - 4th gen Core */
-    case 0x3f: /* HSE117 - Xeon E5 v3 */
-    case 0x45: /* HSM182 - 4th gen Core */
-    case 0x46: /* HSM182, HSD172 - 4th gen Core (GT3) */
-    case 0x3d: /* BDM127 - 5th gen Core */
-    case 0x47: /* BDD117 - 5th gen Core (GT3)
-                  BDW117 - Xeon E3-1200 v4 */
-    case 0x4f: /* BDF85  - Xeon E5-2600 v4
-                  BDH75  - Core-i7 for LGA2011-v3 Socket
-                  BDX88  - Xeon E7-x800 v4 */
-    case 0x56: /* BDE105 - Xeon D-1500 */
+        msrs->rtit.status &= ~RTIT_STATUS_MASK;
+        msrs->rtit.status |= (value & RTIT_STATUS_MASK);
         break;
+
     default:
-        return;
+        return -EINVAL;
     }
 
-    /*
-     * Fixup is needed only when TSX support is disabled and the address
-     * format of LBR includes TSX bits 61:62
-     */
-    if ( !cpu_has_pdcm )
-        return;
+    new_en = msrs->rtit.ctl & RTIT_CTL_TRACE_EN;
 
-    rdmsrl(MSR_IA32_PERF_CAPABILITIES, caps);
-    lbr_format = caps & MSR_IA32_PERF_CAP_LBR_FORMAT;
+    /* ctl.trace_en changed => update MSR load/save lists appropriately. */
+    if ( !old_en && new_en )
+    {
+        if ( vmx_add_guest_msr(v, MSR_RTIT_CTL, msrs->rtit.ctl) ||
+             vmx_add_host_load_msr(v, MSR_RTIT_CTL, 0) )
+        {
+            /*
+             * The only failure cases here are failing the
+             * singleton-per-domain memory allocation, or exceeding the space
+             * in the allocation.  We could unwind in principle, but there is
+             * nothing userspace can usefully do to continue using this VM.
+             */
+            domain_crash(v->domain);
+            return -ENXIO;
+        }
+    }
+    else if ( old_en && !new_en )
+    {
+        vmx_del_msr(v, MSR_RTIT_CTL, VMX_MSR_GUEST);
+        vmx_del_msr(v, MSR_RTIT_CTL, VMX_MSR_HOST);
+    }
 
-    if ( lbr_format == LBR_FORMAT_EIP_FLAGS_TSX )
-        lbr_tsx_fixup_needed = true;
+    return 0;
 }
 
-static void __init ler_to_fixup_check(void)
+static int cf_check vmtrace_control(struct vcpu *v, bool enable, bool reset)
 {
+    struct vcpu_msrs *msrs = v->arch.msrs;
+    uint64_t new_ctl;
+    int rc;
+
     /*
-     * Broadwell erratum BDF93 et al:
-     *
-     * Reads from MSR_LER_TO_LIP (MSR 1DEH) may return values for bits[63:61]
-     * that are not equal to bit[47].  Attempting to context switch this value
-     * may cause a #GP.  Software should sign extend the MSR.
+     * Absolutely nothing good will come of Xen's and userspace's idea of
+     * whether ipt is enabled getting out of sync.
      */
-    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.x86 != 6 )
-        return;
+    if ( v->arch.hvm.vmx.ipt_active == enable )
+        return -EINVAL;
 
-    switch ( boot_cpu_data.x86_model )
+    if ( reset )
     {
-    case 0x3d: /* BDM131 - 5th gen Core */
-    case 0x47: /* BDD??? - 5th gen Core (H-Processor line)
-                  BDW120 - Xeon E3-1200 v4 */
-    case 0x4f: /* BDF93  - Xeon E5-2600 v4
-                  BDH80  - Core-i7 for LGA2011-v3 Socket
-                  BDX93  - Xeon E7-x800 v4 */
-    case 0x56: /* BDE??? - Xeon D-1500 */
-        ler_to_fixup_needed = true;
-        break;
+        msrs->rtit.status = 0;
+        msrs->rtit.output_offset = 0;
     }
-}
 
-static int is_last_branch_msr(u32 ecx)
-{
-    const struct lbr_info *lbr = model_specific_lbr;
+    new_ctl = msrs->rtit.ctl & ~RTIT_CTL_TRACE_EN;
+    if ( enable )
+        new_ctl |= RTIT_CTL_TRACE_EN;
 
-    if ( lbr == NULL )
-        return 0;
+    rc = vmtrace_set_option(v, MSR_RTIT_CTL, new_ctl);
+    if ( rc )
+        return rc;
 
-    for ( ; lbr->count; lbr++ )
-        if ( (ecx >= lbr->base) && (ecx < (lbr->base + lbr->count)) )
-            return 1;
+    v->arch.hvm.vmx.ipt_active = enable;
 
     return 0;
 }
 
-static int cf_check vmx_msr_read_intercept(
-    unsigned int msr, uint64_t *msr_content)
+static int cf_check vmtrace_output_position(struct vcpu *v, uint64_t *pos)
 {
-    struct vcpu *curr = current;
-    uint64_t tmp;
+    *pos = v->arch.msrs->rtit.output_offset;
+    return v->arch.hvm.vmx.ipt_active;
+}
 
-    HVM_DBG_LOG(DBG_LEVEL_MSR, "ecx=%#x", msr);
+static int cf_check vmtrace_reset(struct vcpu *v)
+{
+    if ( !v->arch.hvm.vmx.ipt_active )
+        return -EINVAL;
 
-    switch ( msr )
-    {
-    case MSR_IA32_SYSENTER_CS:
-        __vmread(GUEST_SYSENTER_CS, msr_content);
-        break;
-    case MSR_IA32_SYSENTER_ESP:
-        __vmread(GUEST_SYSENTER_ESP, msr_content);
-        break;
-    case MSR_IA32_SYSENTER_EIP:
-        __vmread(GUEST_SYSENTER_EIP, msr_content);
-        break;
+    v->arch.msrs->rtit.output_offset = 0;
+    v->arch.msrs->rtit.status = 0;
+    return 0;
+}
 
-    case MSR_FS_BASE:
-        __vmread(GUEST_FS_BASE, msr_content);
-        break;
+static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
+{
+    const struct vcpu *curr = current;
+    struct domain *d = v->domain;
+    const struct vcpu_msrs *msrs = v->arch.msrs;
+    uint64_t val = 0;
+    int rc;
 
-    case MSR_GS_BASE:
-        __vmread(GUEST_GS_BASE, msr_content);
-        break;
+    /* Logic which doesn't require remote VMCS acquisition. */
+    switch ( reg )
+    {
+    case MSR_SPEC_CTRL:
+        rc = vmx_read_guest_msr(v, reg, &val);
+        if ( rc )
+        {
+            printk(XENLOG_G_ERR "%s(%pv, 0x%08x) MSR list error: %d\n",
+                   __func__, v, reg, rc);
+            domain_crash(d);
+        }
+        return val;
+
+    case MSR_PKRS:
+        return (v == curr) ? rdpkrs() : msrs->pkrs;
 
     case MSR_SHADOW_GS_BASE:
-        *msr_content = read_gs_shadow();
-        break;
+        if ( v != curr )
+            return v->arch.hvm.vmx.shadow_gs;
+        rdmsrl(MSR_SHADOW_GS_BASE, val);
+        return val;
+    }
 
-    case MSR_STAR:
-        *msr_content = curr->arch.hvm.vmx.star;
+    /* Logic which maybe requires remote VMCS acquisition. */
+    vmx_vmcs_enter(v);
+    switch ( reg )
+    {
+    case MSR_IA32_BNDCFGS:
+        __vmread(GUEST_BNDCFGS, &val);
         break;
 
-    case MSR_LSTAR:
-        *msr_content = curr->arch.hvm.vmx.lstar;
+    default:
+        printk(XENLOG_G_ERR "%s(%pv, 0x%08x) Bad register\n",
+               __func__, v, reg);
+        domain_crash(d);
         break;
+    }
+    vmx_vmcs_exit(v);
 
-    case MSR_CSTAR:
-        *msr_content = curr->arch.hvm.vmx.cstar;
-        break;
+    return val;
+}
 
-    case MSR_SYSCALL_MASK:
-        *msr_content = curr->arch.hvm.vmx.sfmask;
-        break;
+static void cf_check vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
+{
+    const struct vcpu *curr = current;
+    struct vcpu_msrs *msrs = v->arch.msrs;
+    struct domain *d = v->domain;
+    int rc;
 
-    case MSR_IA32_DEBUGCTLMSR:
-        __vmread(GUEST_IA32_DEBUGCTL, msr_content);
-        break;
+    /* Logic which doesn't require remote VMCS acquisition. */
+    switch ( reg )
+    {
+    case MSR_SPEC_CTRL:
+        rc = vmx_write_guest_msr(v, reg, val);
+        if ( rc )
+        {
+            printk(XENLOG_G_ERR "%s(%pv, 0x%08x) MSR list error: %d\n",
+                   __func__, v, reg, rc);
+            domain_crash(d);
+        }
+        return;
 
-    case MSR_IA32_VMX_BASIC...MSR_IA32_VMX_VMFUNC:
-        if ( !nvmx_msr_read_intercept(msr, msr_content) )
-            goto gp_fault;
-        break;
-    case MSR_IA32_MISC_ENABLE:
-        rdmsrl(MSR_IA32_MISC_ENABLE, *msr_content);
-        /* Debug Trace Store is not supported. */
-        *msr_content |= MSR_IA32_MISC_ENABLE_BTS_UNAVAIL |
-                       MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL;
-        /* Perhaps vpmu will change some bits. */
-        /* FALLTHROUGH */
-    case MSR_P6_PERFCTR(0)...MSR_P6_PERFCTR(7):
-    case MSR_P6_EVNTSEL(0)...MSR_P6_EVNTSEL(3):
-    case MSR_CORE_PERF_FIXED_CTR0...MSR_CORE_PERF_FIXED_CTR2:
-    case MSR_CORE_PERF_FIXED_CTR_CTRL...MSR_CORE_PERF_GLOBAL_OVF_CTRL:
-    case MSR_IA32_PEBS_ENABLE:
-    case MSR_IA32_DS_AREA:
-        if ( vpmu_do_rdmsr(msr, msr_content) )
-            goto gp_fault;
+    case MSR_PKRS:
+        msrs->pkrs = val;
+        if ( v == curr )
+            wrpkrs(val);
+        return;
+    }
+
+    /* Logic which maybe requires remote VMCS acquisition. */
+    vmx_vmcs_enter(v);
+    switch ( reg )
+    {
+    case MSR_IA32_BNDCFGS:
+        __vmwrite(GUEST_BNDCFGS, val);
         break;
 
     default:
-        if ( passive_domain_do_rdmsr(msr, msr_content) )
-            goto done;
+        printk(XENLOG_G_ERR "%s(%pv, 0x%08x, 0x%016"PRIx64") Bad register\n",
+               __func__, v, reg, val);
+        domain_crash(d);
+    }
+    vmx_vmcs_exit(v);
+}
 
-        if ( vmx_read_guest_msr(curr, msr, msr_content) == 0 )
-            break;
+/* Handle VT-d posted-interrupt when VCPU is blocked. */
+static void cf_check pi_wakeup_interrupt(struct cpu_user_regs *regs)
+{
+    struct vmx_vcpu *vmx, *tmp;
+    spinlock_t *lock = &per_cpu(vmx_pi_blocking, smp_processor_id()).lock;
+    struct list_head *blocked_vcpus =
+		&per_cpu(vmx_pi_blocking, smp_processor_id()).list;
 
-        if ( is_last_branch_msr(msr) )
-        {
-            *msr_content = 0;
-            break;
-        }
+    ack_APIC_irq();
+    this_cpu(irq_count)++;
 
-        if ( curr->domain->arch.msr_relaxed && !rdmsr_safe(msr, tmp) )
+    spin_lock(lock);
+
+    /*
+     * XXX: The length of the list depends on how many vCPU is current
+     * blocked on this specific pCPU. This may hurt the interrupt latency
+     * if the list grows to too many entries.
+     */
+    list_for_each_entry_safe(vmx, tmp, blocked_vcpus, pi_blocking.list)
+    {
+        if ( pi_test_on(&vmx->pi_desc) )
         {
-            *msr_content = 0;
-            break;
+            list_del(&vmx->pi_blocking.list);
+            ASSERT(vmx->pi_blocking.lock == lock);
+            vmx->pi_blocking.lock = NULL;
+            vcpu_unblock(container_of(vmx, struct vcpu, arch.hvm.vmx));
         }
-
-        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
-        goto gp_fault;
     }
 
-done:
-    HVM_DBG_LOG(DBG_LEVEL_MSR, "returns: ecx=%#x, msr_value=%#"PRIx64,
-                msr, *msr_content);
-    return X86EMUL_OKAY;
+    spin_unlock(lock);
+}
 
-gp_fault:
-    return X86EMUL_EXCEPTION;
+/* Handle VT-d posted-interrupt when VCPU is running. */
+static void cf_check pi_notification_interrupt(struct cpu_user_regs *regs)
+{
+    ack_APIC_irq();
+    this_cpu(irq_count)++;
+
+    /*
+     * We get here when a vCPU is running in root-mode (such as via hypercall,
+     * or any other reasons which can result in VM-Exit), and before vCPU is
+     * back to non-root, external interrupts from an assigned device happen
+     * and a notification event is delivered to this logical CPU.
+     *
+     * we need to set VCPU_KICK_SOFTIRQ for the current cpu, just like
+     * __vmx_deliver_posted_interrupt(). So the pending interrupt in PIRR will
+     * be synced to vIRR before VM-Exit in time.
+     *
+     * Please refer to the following code fragments from
+     * xen/arch/x86/hvm/vmx/entry.S:
+     *
+     *     .Lvmx_do_vmentry
+     *
+     *      ......
+     *
+     *      point 1
+     *
+     *      cli
+     *      cmp  %ecx,(%rdx,%rax,1)
+     *      jnz  .Lvmx_process_softirqs
+     *
+     *      ......
+     *
+     *      je   .Lvmx_launch
+     *
+     *      ......
+     *
+     *     .Lvmx_process_softirqs:
+     *      sti
+     *      call do_softirq
+     *      jmp  .Lvmx_do_vmentry
+     *
+     * If VT-d engine issues a notification event at point 1 above, it cannot
+     * be delivered to the guest during this VM-entry without raising the
+     * softirq in this notification handler.
+     */
+    raise_softirq(VCPU_KICK_SOFTIRQ);
 }
 
-static int vmx_alloc_vlapic_mapping(struct domain *d)
+/*
+ * Calculate whether the CPU is vulnerable to Instruction Fetch page
+ * size-change MCEs.
+ */
+static bool __init has_if_pschange_mc(void)
 {
-    struct page_info *pg;
-    mfn_t mfn;
+    uint64_t caps = 0;
 
-    if ( !has_vlapic(d) || !cpu_has_vmx_virtualize_apic_accesses )
-        return 0;
+    /*
+     * If we are virtualised, there is nothing we can do.  Our EPT tables are
+     * shadowed by our hypervisor, and not walked by hardware.
+     */
+    if ( cpu_has_hypervisor )
+        return false;
 
-    pg = alloc_domheap_page(d, MEMF_no_refcount);
-    if ( !pg )
-        return -ENOMEM;
+    if ( cpu_has_arch_caps )
+        rdmsrl(MSR_ARCH_CAPABILITIES, caps);
+
+    if ( caps & ARCH_CAPS_IF_PSCHANGE_MC_NO )
+        return false;
+
+    /*
+     * IF_PSCHANGE_MC is only known to affect Intel Family 6 processors at
+     * this time.
+     */
+    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
+         boot_cpu_data.x86 != 6 )
+        return false;
+
+    switch ( boot_cpu_data.x86_model )
+    {
+        /*
+         * Core processors since at least Nehalem are vulnerable.
+         */
+    case 0x1f: /* Auburndale / Havendale */
+    case 0x1e: /* Nehalem */
+    case 0x1a: /* Nehalem EP */
+    case 0x2e: /* Nehalem EX */
+    case 0x25: /* Westmere */
+    case 0x2c: /* Westmere EP */
+    case 0x2f: /* Westmere EX */
+    case 0x2a: /* SandyBridge */
+    case 0x2d: /* SandyBridge EP/EX */
+    case 0x3a: /* IvyBridge */
+    case 0x3e: /* IvyBridge EP/EX */
+    case 0x3c: /* Haswell */
+    case 0x3f: /* Haswell EX/EP */
+    case 0x45: /* Haswell D */
+    case 0x46: /* Haswell H */
+    case 0x3d: /* Broadwell */
+    case 0x47: /* Broadwell H */
+    case 0x4f: /* Broadwell EP/EX */
+    case 0x56: /* Broadwell D */
+    case 0x4e: /* Skylake M */
+    case 0x5e: /* Skylake D */
+    case 0x55: /* Skylake-X / Cascade Lake */
+    case 0x7d: /* Ice Lake */
+    case 0x7e: /* Ice Lake */
+    case 0x8e: /* Kaby / Coffee / Whiskey Lake M */
+    case 0x9e: /* Kaby / Coffee / Whiskey Lake D */
+    case 0xa5: /* Comet Lake H/S */
+    case 0xa6: /* Comet Lake U */
+        return true;
 
-    if ( !get_page_and_type(pg, d, PGT_writable_page) )
-    {
         /*
-         * The domain can't possibly know about this page yet, so failure
-         * here is a clear indication of something fishy going on.
+         * Atom processors are not vulnerable.
          */
-        domain_crash(d);
-        return -ENODATA;
-    }
-
-    mfn = page_to_mfn(pg);
-    clear_domain_page(mfn);
-    d->arch.hvm.vmx.apic_access_mfn = mfn;
-
-    return 0;
-}
-
-static void vmx_free_vlapic_mapping(struct domain *d)
-{
-    mfn_t mfn = d->arch.hvm.vmx.apic_access_mfn;
+    case 0x1c: /* Pineview */
+    case 0x26: /* Lincroft */
+    case 0x27: /* Penwell */
+    case 0x35: /* Cloverview */
+    case 0x36: /* Cedarview */
+    case 0x37: /* Baytrail / Valleyview (Silvermont) */
+    case 0x4d: /* Avaton / Rangely (Silvermont) */
+    case 0x4c: /* Cherrytrail / Brasswell */
+    case 0x4a: /* Merrifield */
+    case 0x5a: /* Moorefield */
+    case 0x5c: /* Goldmont */
+    case 0x5d: /* SoFIA 3G Granite/ES2.1 */
+    case 0x65: /* SoFIA LTE AOSP */
+    case 0x5f: /* Denverton */
+    case 0x6e: /* Cougar Mountain */
+    case 0x75: /* Lightning Mountain */
+    case 0x7a: /* Gemini Lake */
+    case 0x86: /* Jacobsville */
 
-    d->arch.hvm.vmx.apic_access_mfn = _mfn(0);
-    if ( !mfn_eq(mfn, _mfn(0)) )
-    {
-        struct page_info *pg = mfn_to_page(mfn);
+        /*
+         * Knights processors are not vulnerable.
+         */
+    case 0x57: /* Knights Landing */
+    case 0x85: /* Knights Mill */
+        return false;
 
-        put_page_alloc_ref(pg);
-        put_page_and_type(pg);
+    default:
+        printk("Unrecognised CPU model %#x - assuming vulnerable to IF_PSCHANGE_MC\n",
+               boot_cpu_data.x86_model);
+        return true;
     }
 }
 
-static void vmx_install_vlapic_mapping(struct vcpu *v)
-{
-    mfn_t apic_access_mfn = v->domain->arch.hvm.vmx.apic_access_mfn;
-    paddr_t virt_page_ma, apic_page_ma;
-
-    if ( mfn_eq(apic_access_mfn, _mfn(0)) )
-        return;
-
-    ASSERT(cpu_has_vmx_virtualize_apic_accesses);
+static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
+    .name                 = "VMX",
+    .cpu_up_prepare       = vmx_cpu_up_prepare,
+    .cpu_dead             = vmx_cpu_dead,
+    .domain_initialise    = vmx_domain_initialise,
+    .domain_relinquish_resources = vmx_domain_relinquish_resources,
+    .domain_creation_finished = domain_creation_finished,
+    .vcpu_initialise      = vmx_vcpu_initialise,
+    .vcpu_destroy         = vmx_vcpu_destroy,
+    .save_cpu_ctxt        = vmx_save_vmcs_ctxt,
+    .load_cpu_ctxt        = vmx_load_vmcs_ctxt,
+    .get_interrupt_shadow = vmx_get_interrupt_shadow,
+    .set_interrupt_shadow = vmx_set_interrupt_shadow,
+    .get_nonreg_state     = vmx_get_nonreg_state,
+    .set_nonreg_state     = vmx_set_nonreg_state,
+    .guest_x86_mode       = vmx_guest_x86_mode,
+    .get_cpl              = _vmx_get_cpl,
+    .get_segment_register = vmx_get_segment_register,
+    .set_segment_register = vmx_set_segment_register,
+    .update_host_cr3      = vmx_update_host_cr3,
+    .update_guest_cr      = vmx_update_guest_cr,
+    .update_guest_efer    = vmx_update_guest_efer,
+    .cpuid_policy_changed = vmx_cpuid_policy_changed,
+    .fpu_leave            = vmx_fpu_leave,
+    .set_guest_pat        = vmx_set_guest_pat,
+    .get_guest_pat        = vmx_get_guest_pat,
+    .set_tsc_offset       = vmx_set_tsc_offset,
+    .inject_event         = vmx_inject_event,
+    .init_hypercall_page  = vmx_init_hypercall_page,
+    .event_pending        = vmx_event_pending,
+    .get_pending_event    = vmx_get_pending_event,
+    .invlpg               = vmx_invlpg,
+    .cpu_up               = vmx_cpu_up,
+    .cpu_down             = vmx_cpu_down,
+    .wbinvd_intercept     = vmx_wbinvd_intercept,
+    .fpu_dirty_intercept  = vmx_fpu_dirty_intercept,
+    .msr_read_intercept   = vmx_msr_read_intercept,
+    .msr_write_intercept  = vmx_msr_write_intercept,
+    .handle_cd            = vmx_handle_cd,
+    .set_info_guest       = vmx_set_info_guest,
+    .set_rdtsc_exiting    = vmx_set_rdtsc_exiting,
+    .nhvm_vcpu_initialise = nvmx_vcpu_initialise,
+    .nhvm_vcpu_destroy    = nvmx_vcpu_destroy,
+    .nhvm_vcpu_reset      = nvmx_vcpu_reset,
+    .nhvm_vcpu_p2m_base   = nvmx_vcpu_eptp_base,
+    .nhvm_vmcx_hap_enabled = nvmx_ept_enabled,
+    .nhvm_vmcx_guest_intercepts_event = nvmx_intercepts_exception,
+    .nhvm_vcpu_vmexit_event = nvmx_vmexit_event,
+    .nhvm_intr_blocked    = nvmx_intr_blocked,
+    .nhvm_domain_relinquish_resources = nvmx_domain_relinquish_resources,
+    .update_vlapic_mode = vmx_vlapic_msr_changed,
+    .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
+    .enable_msr_interception = vmx_enable_msr_interception,
+    .altp2m_vcpu_update_p2m = vmx_vcpu_update_eptp,
+    .altp2m_vcpu_update_vmfunc_ve = vmx_vcpu_update_vmfunc_ve,
+    .altp2m_vcpu_emulate_ve = vmx_vcpu_emulate_ve,
+    .altp2m_vcpu_emulate_vmfunc = vmx_vcpu_emulate_vmfunc,
+    .vmtrace_control = vmtrace_control,
+    .vmtrace_output_position = vmtrace_output_position,
+    .vmtrace_set_option = vmtrace_set_option,
+    .vmtrace_get_option = vmtrace_get_option,
+    .vmtrace_reset = vmtrace_reset,
 
-    virt_page_ma = page_to_maddr(vcpu_vlapic(v)->regs_page);
-    apic_page_ma = mfn_to_maddr(apic_access_mfn);
+    .get_reg = vmx_get_reg,
+    .set_reg = vmx_set_reg,
 
-    vmx_vmcs_enter(v);
-    __vmwrite(VIRTUAL_APIC_PAGE_ADDR, virt_page_ma);
-    __vmwrite(APIC_ACCESS_ADDR, apic_page_ma);
-    vmx_vmcs_exit(v);
-}
+    .tsc_scaling = {
+        .max_ratio = VMX_TSC_MULTIPLIER_MAX,
+    },
+};
 
-void cf_check vmx_vlapic_msr_changed(struct vcpu *v)
+const struct hvm_function_table * __init start_vmx(void)
 {
-    int virtualize_x2apic_mode;
-    struct vlapic *vlapic = vcpu_vlapic(v);
-    unsigned int msr;
+    set_in_cr4(X86_CR4_VMXE);
 
-    virtualize_x2apic_mode = ( (cpu_has_vmx_apic_reg_virt ||
-                                cpu_has_vmx_virtual_intr_delivery) &&
-                               cpu_has_vmx_virtualize_x2apic_mode );
+    if ( vmx_vmcs_init() )
+    {
+        printk("VMX: failed to initialise.\n");
+        return NULL;
+    }
 
-    if ( !cpu_has_vmx_virtualize_apic_accesses &&
-         !virtualize_x2apic_mode )
-        return;
+    vmx_function_table.singlestep_supported = cpu_has_monitor_trap_flag;
 
-    vmx_vmcs_enter(v);
-    v->arch.hvm.vmx.secondary_exec_control &=
-        ~(SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES |
-          SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE);
-    if ( !vlapic_hw_disabled(vlapic) &&
-         (vlapic_base_address(vlapic) == APIC_DEFAULT_PHYS_BASE) )
+    if ( cpu_has_vmx_dt_exiting )
+        vmx_function_table.set_descriptor_access_exiting =
+            vmx_set_descriptor_access_exiting;
+
+    /*
+     * Do not enable EPT when (!cpu_has_vmx_pat), to prevent security hole
+     * (refer to https://xenbits.xen.org/xsa/advisory-60.html).
+     */
+    if ( cpu_has_vmx_ept && (cpu_has_vmx_pat || opt_force_ept) )
     {
-        if ( virtualize_x2apic_mode && vlapic_x2apic_mode(vlapic) )
+        bool cpu_has_bug_pschange_mc = has_if_pschange_mc();
+
+        if ( opt_ept_exec_sp == -1 )
         {
-            v->arch.hvm.vmx.secondary_exec_control |=
-                SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE;
-            if ( cpu_has_vmx_apic_reg_virt )
-            {
-                for ( msr = MSR_X2APIC_FIRST;
-                      msr <= MSR_X2APIC_LAST; msr++ )
-                    vmx_clear_msr_intercept(v, msr, VMX_MSR_R);
+            /* Default to non-executable superpages on vulnerable hardware. */
+            opt_ept_exec_sp = !cpu_has_bug_pschange_mc;
 
-                vmx_set_msr_intercept(v, MSR_X2APIC_PPR, VMX_MSR_R);
-                vmx_set_msr_intercept(v, MSR_X2APIC_TMICT, VMX_MSR_R);
-                vmx_set_msr_intercept(v, MSR_X2APIC_TMCCT, VMX_MSR_R);
-            }
-            if ( cpu_has_vmx_virtual_intr_delivery )
-            {
-                vmx_clear_msr_intercept(v, MSR_X2APIC_TPR, VMX_MSR_W);
-                vmx_clear_msr_intercept(v, MSR_X2APIC_EOI, VMX_MSR_W);
-                vmx_clear_msr_intercept(v, MSR_X2APIC_SELF, VMX_MSR_W);
-            }
+            if ( cpu_has_bug_pschange_mc )
+                printk("VMX: Disabling executable EPT superpages due to CVE-2018-12207\n");
         }
-        else
-            v->arch.hvm.vmx.secondary_exec_control |=
-                SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES;
-    }
-    if ( !(v->arch.hvm.vmx.secondary_exec_control &
-           SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE) )
-        for ( msr = MSR_X2APIC_FIRST;
-              msr <= MSR_X2APIC_LAST; msr++ )
-            vmx_set_msr_intercept(v, msr, VMX_MSR_RW);
 
-    vmx_update_secondary_exec_control(v);
-    vmx_vmcs_exit(v);
-}
+        vmx_function_table.hap_supported = 1;
+        vmx_function_table.altp2m_supported = 1;
 
-static int cf_check vmx_msr_write_intercept(
-    unsigned int msr, uint64_t msr_content)
-{
-    struct vcpu *v = current;
-    const struct cpuid_policy *cp = v->domain->arch.cpuid;
+        vmx_function_table.hap_capabilities = 0;
 
-    HVM_DBG_LOG(DBG_LEVEL_MSR, "ecx=%#x, msr_value=%#"PRIx64, msr, msr_content);
+        if ( cpu_has_vmx_ept_2mb )
+            vmx_function_table.hap_capabilities |= HVM_HAP_SUPERPAGE_2MB;
+        if ( cpu_has_vmx_ept_1gb )
+            vmx_function_table.hap_capabilities |= HVM_HAP_SUPERPAGE_1GB;
 
-    switch ( msr )
-    {
-        uint64_t rsvd, tmp;
+        setup_ept_dump();
+    }
 
-    case MSR_IA32_SYSENTER_CS:
-        __vmwrite(GUEST_SYSENTER_CS, msr_content);
-        break;
-    case MSR_IA32_SYSENTER_ESP:
-        if ( !is_canonical_address(msr_content) )
-            goto gp_fault;
-        __vmwrite(GUEST_SYSENTER_ESP, msr_content);
-        break;
-    case MSR_IA32_SYSENTER_EIP:
-        if ( !is_canonical_address(msr_content) )
-            goto gp_fault;
-        __vmwrite(GUEST_SYSENTER_EIP, msr_content);
-        break;
+    if ( cpu_has_vmx_virtual_intr_delivery )
+    {
+        vmx_function_table.update_eoi_exit_bitmap = vmx_update_eoi_exit_bitmap;
+        vmx_function_table.process_isr = vmx_process_isr;
+        vmx_function_table.handle_eoi = vmx_handle_eoi;
+        vmx_function_table.virtual_intr_delivery_enabled = true;
+    }
 
-    case MSR_FS_BASE:
-    case MSR_GS_BASE:
-    case MSR_SHADOW_GS_BASE:
-        if ( !is_canonical_address(msr_content) )
-            goto gp_fault;
+    if ( cpu_has_vmx_posted_intr_processing )
+    {
+        alloc_direct_apic_vector(&posted_intr_vector, pi_notification_interrupt);
+        if ( iommu_intpost )
+        {
+            alloc_direct_apic_vector(&pi_wakeup_vector, pi_wakeup_interrupt);
 
-        if ( msr == MSR_FS_BASE )
-            __vmwrite(GUEST_FS_BASE, msr_content);
-        else if ( msr == MSR_GS_BASE )
-            __vmwrite(GUEST_GS_BASE, msr_content);
-        else
-            write_gs_shadow(msr_content);
+            vmx_function_table.pi_update_irte = vmx_pi_update_irte;
+        }
 
-        break;
+        vmx_function_table.deliver_posted_intr = vmx_deliver_posted_intr;
+        vmx_function_table.sync_pir_to_irr     = vmx_sync_pir_to_irr;
+        vmx_function_table.test_pir            = vmx_test_pir;
+    }
 
-    case MSR_STAR:
-        v->arch.hvm.vmx.star = msr_content;
-        wrmsrl(MSR_STAR, msr_content);
-        break;
+    if ( cpu_has_vmx_tsc_scaling )
+    {
+        vmx_function_table.tsc_scaling.ratio_frac_bits = 48;
+        vmx_function_table.tsc_scaling.setup = vmx_setup_tsc_scaling;
+    }
 
-    case MSR_LSTAR:
-        if ( !is_canonical_address(msr_content) )
-            goto gp_fault;
-        v->arch.hvm.vmx.lstar = msr_content;
-        wrmsrl(MSR_LSTAR, msr_content);
-        break;
+    model_specific_lbr = get_model_specific_lbr();
+    lbr_tsx_fixup_check();
+    ler_to_fixup_check();
 
-    case MSR_CSTAR:
-        if ( !is_canonical_address(msr_content) )
-            goto gp_fault;
-        v->arch.hvm.vmx.cstar = msr_content;
-        break;
+    return &vmx_function_table;
+}
 
-    case MSR_SYSCALL_MASK:
-        v->arch.hvm.vmx.sfmask = msr_content;
-        wrmsrl(MSR_SYSCALL_MASK, msr_content);
-        break;
+/*
+ * Not all cases receive valid value in the VM-exit instruction length field.
+ * Callers must know what they're doing!
+ */
+static int get_instruction_length(void)
+{
+    unsigned long len;
 
-    case MSR_IA32_DEBUGCTLMSR:
-        rsvd = ~(IA32_DEBUGCTLMSR_LBR | IA32_DEBUGCTLMSR_BTF);
+    __vmread(VM_EXIT_INSTRUCTION_LEN, &len); /* Safe: callers audited */
+    BUG_ON((len < 1) || (len > MAX_INST_LEN));
+    return len;
+}
 
-        /* TODO: Wire vPMU settings properly through the CPUID policy */
-        if ( vpmu_is_set(vcpu_vpmu(v), VPMU_CPU_HAS_BTS) )
-        {
-            rsvd &= ~(IA32_DEBUGCTLMSR_TR | IA32_DEBUGCTLMSR_BTS |
-                      IA32_DEBUGCTLMSR_BTINT);
+void update_guest_eip(void)
+{
+    struct cpu_user_regs *regs = guest_cpu_user_regs();
+    unsigned long x;
 
-            if ( cpu_has(&current_cpu_data, X86_FEATURE_DSCPL) )
-                rsvd &= ~(IA32_DEBUGCTLMSR_BTS_OFF_OS |
-                          IA32_DEBUGCTLMSR_BTS_OFF_USR);
-        }
+    regs->rip += get_instruction_length(); /* Safe: callers audited */
+    regs->eflags &= ~X86_EFLAGS_RF;
 
-        if ( cp->feat.rtm )
-            rsvd &= ~IA32_DEBUGCTLMSR_RTM;
+    __vmread(GUEST_INTERRUPTIBILITY_INFO, &x);
+    if ( x & (VMX_INTR_SHADOW_STI | VMX_INTR_SHADOW_MOV_SS) )
+    {
+        x &= ~(VMX_INTR_SHADOW_STI | VMX_INTR_SHADOW_MOV_SS);
+        __vmwrite(GUEST_INTERRUPTIBILITY_INFO, x);
+    }
 
-        if ( msr_content & rsvd )
-            goto gp_fault;
+    if ( regs->eflags & X86_EFLAGS_TF )
+        hvm_inject_hw_exception(TRAP_debug, X86_EVENT_NO_EC);
+}
 
-        /*
-         * The Arch LBR spec (new in Ice Lake) states that CPUs with no
-         * model-specific LBRs implement MSR_DBG_CTL.LBR by discarding writes
-         * and always returning 0.
-         *
-         * Use this property in all cases where we don't know any
-         * model-specific LBR information, as it matches real hardware
-         * behaviour on post-Ice Lake systems.
-         */
-        if ( !model_specific_lbr )
-            msr_content &= ~IA32_DEBUGCTLMSR_LBR;
+static void vmx_dr_access(unsigned long exit_qualification,
+                          struct cpu_user_regs *regs)
+{
+    struct vcpu *v = current;
 
-        /*
-         * When a guest first enables LBR, arrange to save and restore the LBR
-         * MSRs and allow the guest direct access.
-         *
-         * Hitting -ENOSPC with the guest load/save list is definitely a
-         * hypervisor bug, whereas -ENOMEM for allocating the load/save list
-         * is simply unlucky (and shouldn't occur with sensible management by
-         * the toolstack).
-         *
-         * Either way, there is nothing we can do right now to recover, and
-         * the guest won't execute correctly either.  Simply crash the domain
-         * to make the failure obvious.
-         */
-        if ( !(v->arch.hvm.vmx.lbr_flags & LBR_MSRS_INSERTED) &&
-             (msr_content & IA32_DEBUGCTLMSR_LBR) )
-        {
-            const struct lbr_info *lbr = model_specific_lbr;
+    HVMTRACE_0D(DR_WRITE);
 
-            for ( ; lbr->count; lbr++ )
-            {
-                unsigned int i;
+    if ( !v->arch.hvm.flag_dr_dirty )
+        __restore_debug_registers(v);
 
-                for ( i = 0; i < lbr->count; i++ )
-                {
-                    int rc = vmx_add_guest_msr(v, lbr->base + i, 0);
+    /* Allow guest direct access to DR registers */
+    v->arch.hvm.vmx.exec_control &= ~CPU_BASED_MOV_DR_EXITING;
+    vmx_update_cpu_exec_control(v);
+}
 
-                    if ( unlikely(rc) )
-                    {
-                        gprintk(XENLOG_ERR,
-                                "Guest load/save list error %d\n", rc);
-                        domain_crash(v->domain);
-                        return X86EMUL_OKAY;
-                    }
+static void vmx_invlpg_intercept(unsigned long linear)
+{
+    HVMTRACE_LONG_2D(INVLPG, /*invlpga=*/ 0, TRC_PAR_LONG(linear));
+    paging_invlpg(current, linear);
+}
 
-                    vmx_clear_msr_intercept(v, lbr->base + i, VMX_MSR_RW);
-                }
-            }
+static int vmx_vmfunc_intercept(struct cpu_user_regs *regs)
+{
+    /*
+     * This handler is a placeholder for future where Xen may
+     * want to handle VMFUNC exits and resume a domain normally without
+     * injecting a #UD to the guest - for example, in a VT-nested
+     * scenario where Xen may want to lazily shadow the alternate
+     * EPTP list.
+     */
+    gdprintk(XENLOG_ERR, "Failed guest VMFUNC execution\n");
+    return X86EMUL_EXCEPTION;
+}
 
-            v->arch.hvm.vmx.lbr_flags |= LBR_MSRS_INSERTED;
-            if ( lbr_tsx_fixup_needed )
-                v->arch.hvm.vmx.lbr_flags |= LBR_FIXUP_TSX;
-            if ( ler_to_fixup_needed )
-                v->arch.hvm.vmx.lbr_flags |= LBR_FIXUP_LER_TO;
-        }
+static int vmx_cr_access(cr_access_qual_t qual)
+{
+    struct vcpu *curr = current;
 
-        __vmwrite(GUEST_IA32_DEBUGCTL, msr_content);
-        break;
+    switch ( qual.access_type )
+    {
+    case VMX_CR_ACCESS_TYPE_MOV_TO_CR:
+        return hvm_mov_to_cr(qual.cr, qual.gpr);
+
+    case VMX_CR_ACCESS_TYPE_MOV_FROM_CR:
+        return hvm_mov_from_cr(qual.cr, qual.gpr);
+
+    case VMX_CR_ACCESS_TYPE_CLTS:
+    {
+        unsigned long old = curr->arch.hvm.guest_cr[0];
+        unsigned long value = old & ~X86_CR0_TS;
 
-    case MSR_IA32_MISC_ENABLE:
         /*
-         * Silently drop writes that don't change the reported value: At least
-         * some Windows guests will expect to be able to write to MISC_ENABLE
-         * with the same value that's been read from it.
+         * Special case unlikely to be interesting to a
+         * VM_EVENT_FLAG_DENY-capable application, so the hvm_monitor_crX()
+         * return value is ignored for now.
          */
-        if ( vmx_msr_read_intercept(msr, &tmp) != X86EMUL_OKAY ||
-             tmp != msr_content )
-            goto gp_fault;
+        hvm_monitor_crX(CR0, value, old);
+        curr->arch.hvm.guest_cr[0] = value;
+        vmx_update_guest_cr(curr, 0, 0);
+        HVMTRACE_0D(CLTS);
         break;
+    }
 
-    case MSR_P6_PERFCTR(0)...MSR_P6_PERFCTR(7):
-    case MSR_P6_EVNTSEL(0)...MSR_P6_EVNTSEL(7):
-    case MSR_CORE_PERF_FIXED_CTR0...MSR_CORE_PERF_FIXED_CTR2:
-    case MSR_CORE_PERF_FIXED_CTR_CTRL...MSR_CORE_PERF_GLOBAL_OVF_CTRL:
-    case MSR_IA32_PEBS_ENABLE:
-    case MSR_IA32_DS_AREA:
-         if ( vpmu_do_wrmsr(msr, msr_content) )
-            goto gp_fault;
-        break;
+    case VMX_CR_ACCESS_TYPE_LMSW:
+    {
+        unsigned long value = curr->arch.hvm.guest_cr[0];
+        int rc;
 
-    default:
-        if ( passive_domain_do_wrmsr(msr, msr_content) )
-            return X86EMUL_OKAY;
+        /* LMSW can (1) set PE; (2) set or clear MP, EM, and TS. */
+        value = (value & ~(X86_CR0_MP|X86_CR0_EM|X86_CR0_TS)) |
+                (qual.lmsw_data &
+                 (X86_CR0_PE|X86_CR0_MP|X86_CR0_EM|X86_CR0_TS));
+        HVMTRACE_LONG_1D(LMSW, value);
 
-        if ( vmx_write_guest_msr(v, msr, msr_content) == 0 ||
-             is_last_branch_msr(msr) )
-            break;
+        if ( (rc = hvm_set_cr0(value, true)) == X86EMUL_EXCEPTION )
+            hvm_inject_hw_exception(TRAP_gp_fault, 0);
 
-        if ( v->domain->arch.msr_relaxed && !rdmsr_safe(msr, msr_content) )
-            break;
+        return rc;
+    }
 
-        gdprintk(XENLOG_WARNING,
-                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
-                 msr, msr_content);
-        goto gp_fault;
+    default:
+        ASSERT_UNREACHABLE();
+        return X86EMUL_UNHANDLEABLE;
     }
 
     return X86EMUL_OKAY;
-
-gp_fault:
-    return X86EMUL_EXCEPTION;
 }
 
 static void vmx_do_extint(struct cpu_user_regs *regs)
@@ -3731,17 +3700,6 @@ static void vmx_do_extint(struct cpu_user_regs *regs)
     do_IRQ(regs);
 }
 
-static void cf_check vmx_wbinvd_intercept(void)
-{
-    if ( !cache_flush_permitted(current->domain) || iommu_snoop )
-        return;
-
-    if ( cpu_has_wbinvd_exiting )
-        flush_all(FLUSH_CACHE);
-    else
-        wbinvd();
-}
-
 static void ept_handle_violation(ept_qual_t q, paddr_t gpa)
 {
     unsigned long gla, gfn = gpa >> PAGE_SHIFT;
@@ -4193,8 +4151,8 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         {
         case EXIT_REASON_EXCEPTION_NMI:
             if ( vector != TRAP_page_fault
-                 && vector != TRAP_nmi 
-                 && vector != TRAP_machine_check ) 
+                 && vector != TRAP_nmi
+                 && vector != TRAP_machine_check )
             {
         default:
                 perfc_incr(realmode_exits);
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 97d6b810ec..5c748d5b09 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -89,7 +89,6 @@ void cf_check vmx_vlapic_msr_changed(struct vcpu *v);
 struct hvm_emulate_ctxt;
 void vmx_realmode_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt);
 void vmx_realmode(struct cpu_user_regs *regs);
-void vmx_update_debug_state(struct vcpu *v);
 void vmx_update_exception_bitmap(struct vcpu *v);
 void vmx_update_cpu_exec_control(struct vcpu *v);
 void vmx_update_secondary_exec_control(struct vcpu *v);
-- 
2.37.2


