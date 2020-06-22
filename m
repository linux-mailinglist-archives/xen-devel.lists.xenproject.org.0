Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D064B203ED8
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 20:12:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnQvb-0003Jz-QA; Mon, 22 Jun 2020 18:12:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tVQB=AD=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jnQva-0003Jq-SP
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 18:12:18 +0000
X-Inumbo-ID: e7d7e682-b4b3-11ea-bb8b-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7d7e682-b4b3-11ea-bb8b-bc764e2007e4;
 Mon, 22 Jun 2020 18:12:17 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id A7E73A28C2;
 Mon, 22 Jun 2020 20:12:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 9477FA28AD;
 Mon, 22 Jun 2020 20:12:15 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id JNOa44oL45Ms; Mon, 22 Jun 2020 20:12:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 8F3F9A28DD;
 Mon, 22 Jun 2020 20:12:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id N2e-sZ1Fgu28; Mon, 22 Jun 2020 20:12:14 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 65731A289F;
 Mon, 22 Jun 2020 20:12:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 4F90421CD8;
 Mon, 22 Jun 2020 20:11:44 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id GWabTm1LrnFz; Mon, 22 Jun 2020 20:11:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 41A6021CBB;
 Mon, 22 Jun 2020 20:11:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id eoPR0vu2eetH; Mon, 22 Jun 2020 20:11:38 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 21A9521760;
 Mon, 22 Jun 2020 20:11:38 +0200 (CEST)
Date: Mon, 22 Jun 2020 20:11:38 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Message-ID: <97440747.11443782.1592849498089.JavaMail.zimbra@cert.pl>
In-Reply-To: <1617453791.11443328.1592849168658.JavaMail.zimbra@cert.pl>
References: <1617453791.11443328.1592849168658.JavaMail.zimbra@cert.pl>
Subject: [PATCH v3 4/7] x86/vmx: add do_vmtrace_op
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add do_vmtrace_op
Thread-Index: fAatEklvenYpYrSWj77J6AQD/dj+xNwDcrpl
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas.lengyel@intel.com>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Provide an interface for privileged domains to manage
external IPT monitoring. Guest IPT state will be preserved
across vmentry/vmexit using ipt_state structure.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 xen/arch/x86/hvm/hvm.c             | 168 +++++++++++++++++++++++++++++
 xen/arch/x86/hvm/vmx/vmx.c         |  31 ++++++
 xen/arch/x86/mm.c                  |  28 +++++
 xen/common/domain.c                |   3 +
 xen/include/asm-x86/hvm/vmx/vmcs.h |   3 +
 xen/include/asm-x86/hvm/vmx/vmx.h  |  14 +++
 xen/include/public/domctl.h        |   1 +
 xen/include/public/hvm/hvm_op.h    |  26 +++++
 xen/include/public/hvm/params.h    |   2 +-
 xen/include/public/memory.h        |   1 +
 xen/include/xen/sched.h            |   4 +
 xen/include/xlat.lst               |   1 +
 12 files changed, 281 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 5bb47583b3..5899df52c3 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -58,6 +58,7 @@
 #include <asm/monitor.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
+#include <asm/hvm/vmx/vmx.h>
 #include <asm/hvm/vpt.h>
 #include <asm/hvm/support.h>
 #include <asm/hvm/cacheattr.h>
@@ -606,6 +607,57 @@ static int hvm_print_line(
     return X86EMUL_OKAY;
 }
 
+static int vmtrace_alloc_buffers(struct vcpu *v, uint64_t size)
+{
+    struct page_info *pg;
+    struct pt_state *pt;
+
+    if ( size < PAGE_SIZE || size > GB(4) || (size & (size - 1)) )
+    {
+        /*
+         * We don't accept trace buffer size smaller than single page
+         * and the upper bound is defined as 4GB in the specification.
+         * The buffer size must be also a power of 2.
+         */
+        return -EINVAL;
+    }
+
+    if ( vmx_add_host_load_msr(v, MSR_RTIT_CTL, 0) )
+        return -EFAULT;
+
+    pg = alloc_domheap_pages(v->domain, get_order_from_bytes(size),
+                             MEMF_no_refcount);
+
+    if ( !pg )
+        return -ENOMEM;
+
+    pt = xzalloc(struct pt_state);
+
+    if ( !pt )
+        return -ENOMEM;
+
+    pt->output_base = page_to_maddr(pg);
+    pt->output_mask.raw = size - 1;
+
+    v->arch.hvm.vmx.pt_state = pt;
+
+    return 0;
+}
+
+static void vmtrace_destroy_buffers(struct vcpu *v)
+{
+    struct pt_state *pt = v->arch.hvm.vmx.pt_state;
+
+    if ( pt )
+    {
+        free_domheap_pages(maddr_to_page(pt->output_base),
+                           get_order_from_bytes(pt->output_mask.size + 1));
+
+        xfree(pt);
+        v->arch.hvm.vmx.pt_state = NULL;
+    }
+}
+
 int hvm_domain_initialise(struct domain *d)
 {
     unsigned int nr_gsis;
@@ -747,7 +799,10 @@ void hvm_domain_relinquish_resources(struct domain *d)
     hpet_deinit(d);
 
     for_each_vcpu ( d, v )
+    {
+        vmtrace_destroy_buffers(v);
         hvmemul_cache_destroy(v);
+    }
 }
 
 void hvm_domain_destroy(struct domain *d)
@@ -1594,6 +1649,13 @@ int hvm_vcpu_initialise(struct vcpu *v)
         hvm_set_guest_tsc(v, 0);
     }
 
+    if ( d->vmtrace_pt_size )
+    {
+        rc = vmtrace_alloc_buffers(v, d->vmtrace_pt_size);
+        if ( rc != 0 )
+            goto fail1;
+    }
+
     return 0;
 
  fail6:
@@ -4949,6 +5011,108 @@ static int compat_altp2m_op(
     return rc;
 }
 
+CHECK_hvm_vmtrace_op;
+
+static int do_vmtrace_op(XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    struct xen_hvm_vmtrace_op a;
+    struct domain *d;
+    int rc;
+    struct vcpu *v;
+    struct pt_state *pt;
+
+    if ( !hvm_pt_supported() )
+        return -EOPNOTSUPP;
+
+    if ( copy_from_guest(&a, arg, 1) )
+        return -EFAULT;
+
+    if ( a.pad1 || a.pad2 )
+        return -EINVAL;
+
+    rc = rcu_lock_live_remote_domain_by_id(a.domain, &d);
+
+    if ( rc )
+        goto out;
+
+    if ( !is_hvm_domain(d) )
+    {
+        rc = -EOPNOTSUPP;
+        goto out;
+    }
+
+    if ( a.vcpu >= d->max_vcpus )
+    {
+        rc = -EINVAL;
+        goto out;
+    }
+
+    v = domain_vcpu(d, a.vcpu);
+    pt = v->arch.hvm.vmx.pt_state;
+
+    if ( !pt )
+    {
+        /* PT must be first initialized upon domain creation. */
+        rc = -EINVAL;
+        goto out;
+    }
+
+    switch ( a.cmd )
+    {
+    case HVMOP_vmtrace_pt_enable:
+        vcpu_pause(v);
+        spin_lock(&d->vmtrace_lock);
+        if ( vmx_add_guest_msr(v, MSR_RTIT_CTL,
+                               RTIT_CTL_TRACEEN | RTIT_CTL_OS |
+                               RTIT_CTL_USR | RTIT_CTL_BRANCH_EN) )
+        {
+            rc = -EFAULT;
+            goto out;
+        }
+
+        pt->active = 1;
+        spin_unlock(&d->vmtrace_lock);
+        vcpu_unpause(v);
+        break;
+
+    case HVMOP_vmtrace_pt_disable:
+        vcpu_pause(v);
+        spin_lock(&d->vmtrace_lock);
+
+        if ( vmx_del_msr(v, MSR_RTIT_CTL, VMX_MSR_GUEST) )
+        {
+            rc = -EFAULT;
+            goto out;
+        }
+
+        pt->active = 0;
+        spin_unlock(&d->vmtrace_lock);
+        vcpu_unpause(v);
+        break;
+
+    case HVMOP_vmtrace_pt_get_offset:
+        a.offset = pt->output_mask.offset;
+
+        if ( __copy_field_to_guest(guest_handle_cast(arg, xen_hvm_vmtrace_op_t), &a, offset) )
+        {
+            rc = -EFAULT;
+            goto out;
+        }
+        break;
+
+    default:
+        rc = -EOPNOTSUPP;
+        goto out;
+    }
+
+    rc = 0;
+
+ out:
+    rcu_unlock_domain(d);
+
+    return rc;
+}
+
 static int hvmop_get_mem_type(
     XEN_GUEST_HANDLE_PARAM(xen_hvm_get_mem_type_t) arg)
 {
@@ -5101,6 +5265,10 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
         rc = current->hcall_compat ? compat_altp2m_op(arg) : do_altp2m_op(arg);
         break;
 
+    case HVMOP_vmtrace:
+        rc = do_vmtrace_op(arg);
+        break;
+
     default:
     {
         gdprintk(XENLOG_DEBUG, "Bad HVM op %ld.\n", op);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index ab19d9424e..3798a58d0f 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -508,11 +508,24 @@ static void vmx_restore_host_msrs(void)
 
 static void vmx_save_guest_msrs(struct vcpu *v)
 {
+    uint64_t rtit_ctl;
+
     /*
      * We cannot cache SHADOW_GS_BASE while the VCPU runs, as it can
      * be updated at any time via SWAPGS, which we cannot trap.
      */
     v->arch.hvm.vmx.shadow_gs = rdgsshadow();
+
+    if ( unlikely(v->arch.hvm.vmx.pt_state &&
+                  v->arch.hvm.vmx.pt_state->active) )
+    {
+        rdmsrl(MSR_RTIT_CTL, rtit_ctl);
+        BUG_ON(rtit_ctl & RTIT_CTL_TRACEEN);
+
+        rdmsrl(MSR_RTIT_STATUS, v->arch.hvm.vmx.pt_state->status);
+        rdmsrl(MSR_RTIT_OUTPUT_MASK,
+               v->arch.hvm.vmx.pt_state->output_mask.raw);
+    }
 }
 
 static void vmx_restore_guest_msrs(struct vcpu *v)
@@ -524,6 +537,17 @@ static void vmx_restore_guest_msrs(struct vcpu *v)
 
     if ( cpu_has_msr_tsc_aux )
         wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
+
+    if ( unlikely(v->arch.hvm.vmx.pt_state &&
+                  v->arch.hvm.vmx.pt_state->active) )
+    {
+        wrmsrl(MSR_RTIT_OUTPUT_BASE,
+               v->arch.hvm.vmx.pt_state->output_base);
+        wrmsrl(MSR_RTIT_OUTPUT_MASK,
+               v->arch.hvm.vmx.pt_state->output_mask.raw);
+        wrmsrl(MSR_RTIT_STATUS,
+               v->arch.hvm.vmx.pt_state->status);
+    }
 }
 
 void vmx_update_cpu_exec_control(struct vcpu *v)
@@ -3674,6 +3698,13 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
 
     hvm_invalidate_regs_fields(regs);
 
+    if ( unlikely(v->arch.hvm.vmx.pt_state &&
+                  v->arch.hvm.vmx.pt_state->active) )
+    {
+        rdmsrl(MSR_RTIT_OUTPUT_MASK,
+               v->arch.hvm.vmx.pt_state->output_mask.raw);
+    }
+
     if ( paging_mode_hap(v->domain) )
     {
         /*
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index e376fc7e8f..10fc26d13e 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -142,6 +142,7 @@
 #include <asm/pci.h>
 #include <asm/guest.h>
 #include <asm/hvm/ioreq.h>
+#include <asm/hvm/vmx/vmx.h>
 
 #include <asm/hvm/grant_table.h>
 #include <asm/pv/domain.h>
@@ -4624,6 +4625,33 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
         }
         break;
     }
+
+    case XENMEM_resource_vmtrace_buf:
+    {
+        mfn_t mfn;
+        unsigned int i;
+        struct pt_state *pt;
+        rc = -EINVAL;
+
+        if ( id >= d->max_vcpus )
+            break;
+
+        pt = d->vcpu[id]->arch.hvm.vmx.pt_state;
+
+        if ( !pt )
+            break;
+
+        mfn = _mfn(pt->output_base >> PAGE_SHIFT);
+
+        if ( frame + nr_frames > (pt->output_mask.size >> PAGE_SHIFT) + 1 )
+            break;
+
+        rc = 0;
+        for ( i = 0; i < nr_frames; i++ )
+            mfn_list[i] = mfn_x(mfn_add(mfn, frame + i));
+
+        break;
+    }
 #endif
 
     default:
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 7cc9526139..52ccd678f4 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -414,6 +414,7 @@ struct domain *domain_create(domid_t domid,
     d->shutdown_code = SHUTDOWN_CODE_INVALID;
 
     spin_lock_init(&d->pbuf_lock);
+    spin_lock_init(&d->vmtrace_lock);
 
     rwlock_init(&d->vnuma_rwlock);
 
@@ -441,6 +442,8 @@ struct domain *domain_create(domid_t domid,
         d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
 
         radix_tree_init(&d->pirq_tree);
+
+        d->vmtrace_pt_size = config->vmtrace_pt_size;
     }
 
     if ( (err = arch_domain_create(d, config)) != 0 )
diff --git a/xen/include/asm-x86/hvm/vmx/vmcs.h b/xen/include/asm-x86/hvm/vmx/vmcs.h
index 0e9a0b8de6..64c0d82614 100644
--- a/xen/include/asm-x86/hvm/vmx/vmcs.h
+++ b/xen/include/asm-x86/hvm/vmx/vmcs.h
@@ -186,6 +186,9 @@ struct vmx_vcpu {
      * pCPU and wakeup the related vCPU.
      */
     struct pi_blocking_vcpu pi_blocking;
+
+    /* State of processor trace feature */
+    struct pt_state      *pt_state;
 };
 
 int vmx_create_vmcs(struct vcpu *v);
diff --git a/xen/include/asm-x86/hvm/vmx/vmx.h b/xen/include/asm-x86/hvm/vmx/vmx.h
index 111ccd7e61..be7213d3c0 100644
--- a/xen/include/asm-x86/hvm/vmx/vmx.h
+++ b/xen/include/asm-x86/hvm/vmx/vmx.h
@@ -689,4 +689,18 @@ typedef union ldt_or_tr_instr_info {
     };
 } ldt_or_tr_instr_info_t;
 
+/* Processor Trace state per vCPU */
+struct pt_state {
+    bool_t active;
+    uint64_t status;
+    uint64_t output_base;
+    union {
+        uint64_t raw;
+        struct {
+            uint32_t size;
+            uint32_t offset;
+        };
+    } output_mask;
+};
+
 #endif /* __ASM_X86_HVM_VMX_VMX_H__ */
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 59bdc28c89..054892befe 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -92,6 +92,7 @@ struct xen_domctl_createdomain {
     uint32_t max_evtchn_port;
     int32_t max_grant_frames;
     int32_t max_maptrack_frames;
+    uint64_t vmtrace_pt_size;
 
     struct xen_arch_domainconfig arch;
 };
diff --git a/xen/include/public/hvm/hvm_op.h b/xen/include/public/hvm/hvm_op.h
index 870ec52060..6d8841668e 100644
--- a/xen/include/public/hvm/hvm_op.h
+++ b/xen/include/public/hvm/hvm_op.h
@@ -382,6 +382,32 @@ struct xen_hvm_altp2m_op {
 typedef struct xen_hvm_altp2m_op xen_hvm_altp2m_op_t;
 DEFINE_XEN_GUEST_HANDLE(xen_hvm_altp2m_op_t);
 
+#if defined(__XEN__) || defined(__XEN_TOOLS__)
+
+/* HVMOP_vmtrace: Perform VM tracing related operation */
+#define HVMOP_vmtrace 26
+
+struct xen_hvm_vmtrace_op {
+    /* IN variable */
+    uint32_t cmd;
+/* Enable/disable external vmtrace for given domain */
+#define HVMOP_vmtrace_pt_enable      1
+#define HVMOP_vmtrace_pt_disable     2
+#define HVMOP_vmtrace_pt_get_offset  3
+    domid_t domain;
+    uint16_t pad1;
+    uint32_t vcpu;
+    uint32_t pad2;
+    uint64_t size;
+
+    /* OUT variable */
+    uint64_t offset;
+};
+typedef struct xen_hvm_vmtrace_op xen_hvm_vmtrace_op_t;
+DEFINE_XEN_GUEST_HANDLE(xen_hvm_vmtrace_op_t);
+
+#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
+
 #endif /* __XEN_PUBLIC_HVM_HVM_OP_H__ */
 
 /*
diff --git a/xen/include/public/hvm/params.h b/xen/include/public/hvm/params.h
index 0a91bfa749..22f6185e01 100644
--- a/xen/include/public/hvm/params.h
+++ b/xen/include/public/hvm/params.h
@@ -300,6 +300,6 @@
 #define XEN_HVM_MCA_CAP_LMCE   (xen_mk_ullong(1) << 0)
 #define XEN_HVM_MCA_CAP_MASK   XEN_HVM_MCA_CAP_LMCE
 
-#define HVM_NR_PARAMS 39
+#define HVM_NR_PARAMS 40
 
 #endif /* __XEN_PUBLIC_HVM_PARAMS_H__ */
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index dbd35305df..f823c784c3 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -620,6 +620,7 @@ struct xen_mem_acquire_resource {
 
 #define XENMEM_resource_ioreq_server 0
 #define XENMEM_resource_grant_table 1
+#define XENMEM_resource_vmtrace_buf 2
 
     /*
      * IN - a type-specific resource identifier, which must be zero
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index ac53519d7f..48f0a61bbd 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -457,6 +457,10 @@ struct domain
     unsigned    pbuf_idx;
     spinlock_t  pbuf_lock;
 
+    /* Used by vmtrace features */
+    spinlock_t  vmtrace_lock;
+    uint64_t    vmtrace_pt_size;
+
     /* OProfile support. */
     struct xenoprof *xenoprof;
 
diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
index 0921d4a8d0..c15529a43f 100644
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -83,6 +83,7 @@
 ?	dm_op_set_pci_link_route	hvm/dm_op.h
 ?	dm_op_track_dirty_vram		hvm/dm_op.h
 !	hvm_altp2m_set_mem_access_multi	hvm/hvm_op.h
+?	hvm_vmtrace_op			hvm/hvm_op.h
 ?	vcpu_hvm_context		hvm/hvm_vcpu.h
 ?	vcpu_hvm_x86_32			hvm/hvm_vcpu.h
 ?	vcpu_hvm_x86_64			hvm/hvm_vcpu.h
-- 
2.20.1


