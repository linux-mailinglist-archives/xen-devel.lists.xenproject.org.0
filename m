Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4FB3091A4
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 04:22:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78685.143283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5gqO-0004am-0a; Sat, 30 Jan 2021 03:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78685.143283; Sat, 30 Jan 2021 03:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5gqN-0004aG-TH; Sat, 30 Jan 2021 03:22:39 +0000
Received: by outflank-mailman (input) for mailman id 78685;
 Sat, 30 Jan 2021 03:22:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bynp=HB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5gqM-0004Zu-LW
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 03:22:38 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6a0995e-e43d-4ee0-86f3-b69c2a95e844;
 Sat, 30 Jan 2021 03:22:36 +0000 (UTC)
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
X-Inumbo-ID: c6a0995e-e43d-4ee0-86f3-b69c2a95e844
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611976956;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RvodxG/MydqCN+E4xvoiUIh25DplluKTEEVpMB71d0o=;
  b=TE7F7YHIzQvdPnrmsxJLWfW/57mLs9k8nZ1Zb+KRidDRlovXjCqBny1s
   vcNRDMTBbhpXutTQhQNPPZrFRqXNd3NK96LeSrQUc/AgI2g0fKgdVxQOp
   TgBVp3SuE5re9U3szdXo5Zpy9fGcyu5RmVlWv35jLtNucumnIWQ9SrZvo
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: DrkrKzMAQa+Z0GdL1BLcbo7CJkrKLryk7+CGoketOR6//ROcYNrbD2WmRmlf7/f8amImlXtI9M
 zK866ocDCUFvlsdB9PP67dAdwbQmkKcgjsbQr10ZPQzbs9CfDq6jjuEnYMyW+wcUDNAblDQg8K
 C7+PKaa0VxIV8xj4Nrr7CN/1s7FzEyWE/8nqkhhXLKbgu9xOn9CwVRuSOcbxJmlkqvi659LxWu
 d8BkaLlpClP71LsyEGA/yXKIssYORG/4EmNNRaUtMG/Bxvk5GPwXRA5Dc84NuH/yQjbgrdek2I
 f4M=
X-SBRS: 5.1
X-MesageID: 36195586
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,387,1602561600"; 
   d="scan'208";a="36195586"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v8 12/16] xen/domctl: Add XEN_DOMCTL_vmtrace_op
Date: Sat, 30 Jan 2021 02:58:48 +0000
Message-ID: <20210130025852.12430-13-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210130025852.12430-1-andrew.cooper3@citrix.com>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Michał Leszczyński <michal.leszczynski@cert.pl>

Implement an interface to configure and control tracing operations.  Reuse the
existing SETDEBUGGING flask vector rather than inventing a new one.

Userspace using this interface is going to need platform specific knowledge
anyway to interpret the contents of the trace buffer.  While some operations
(e.g. enable/disable) can reasonably be generic, others cannot.  Provide an
explicitly-platform specific pair of get/set operations to reduce API churn as
new options get added/enabled.

For the VMX specific Processor Trace implementation, tolerate reading and
modifying a safe subset of bits in CTL, STATUS and OUTPUT_MASK.  This permits
userspace to control the content which gets logged, but prevents modification
of details such as the position/size of the output buffer.

Signed-off-by: Michał Leszczyński <michal.leszczynski@cert.pl>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Tamas K Lengyel <tamas@tklengyel.com>

v8:
 * Reposition mask constants.

v7:
 * Major chop&change within the series.
---
 xen/arch/x86/domctl.c         |  55 +++++++++++++++
 xen/arch/x86/hvm/vmx/vmx.c    | 155 ++++++++++++++++++++++++++++++++++++++++++
 xen/include/asm-x86/hvm/hvm.h |  63 +++++++++++++++++
 xen/include/public/domctl.h   |  35 ++++++++++
 xen/xsm/flask/hooks.c         |   1 +
 5 files changed, 309 insertions(+)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index b28cfe9817..b464465230 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -155,6 +155,55 @@ void arch_get_domain_info(const struct domain *d,
     info->arch_config.emulation_flags = d->arch.emulation_flags;
 }
 
+static int do_vmtrace_op(struct domain *d, struct xen_domctl_vmtrace_op *op,
+                         XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
+{
+    struct vcpu *v;
+    int rc;
+
+    if ( !d->vmtrace_size || d == current->domain /* No vcpu_pause() */ )
+        return -EINVAL;
+
+    ASSERT(is_hvm_domain(d)); /* Restricted by domain creation logic. */
+
+    v = domain_vcpu(d, op->vcpu);
+    if ( !v )
+        return -ENOENT;
+
+    vcpu_pause(v);
+    switch ( op->cmd )
+    {
+    case XEN_DOMCTL_vmtrace_enable:
+    case XEN_DOMCTL_vmtrace_disable:
+    case XEN_DOMCTL_vmtrace_reset_and_enable:
+        rc = hvm_vmtrace_control(
+            v, op->cmd != XEN_DOMCTL_vmtrace_disable,
+            op->cmd == XEN_DOMCTL_vmtrace_reset_and_enable);
+        break;
+
+    case XEN_DOMCTL_vmtrace_output_position:
+        rc = hvm_vmtrace_output_position(v, &op->value);
+        if ( rc >= 0 )
+            rc = 0;
+        break;
+
+    case XEN_DOMCTL_vmtrace_get_option:
+        rc = hvm_vmtrace_get_option(v, op->key, &op->value);
+        break;
+
+    case XEN_DOMCTL_vmtrace_set_option:
+        rc = hvm_vmtrace_set_option(v, op->key, op->value);
+        break;
+
+    default:
+        rc = -EOPNOTSUPP;
+        break;
+    }
+    vcpu_unpause(v);
+
+    return rc;
+}
+
 #define MAX_IOPORTS 0x10000
 
 long arch_do_domctl(
@@ -1320,6 +1369,12 @@ long arch_do_domctl(
         domain_unpause(d);
         break;
 
+    case XEN_DOMCTL_vmtrace_op:
+        ret = do_vmtrace_op(d, &domctl->u.vmtrace_op, u_domctl);
+        if ( !ret )
+            copyback = true;
+        break;
+
     default:
         ret = iommu_do_domctl(domctl, d, u_domctl);
         break;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 12b961113e..a64c4e4177 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2261,6 +2261,157 @@ static bool vmx_get_pending_event(struct vcpu *v, struct x86_event *info)
     return true;
 }
 
+/*
+ * We only let vmtrace agents see and modify a subset of bits in MSR_RTIT_CTL.
+ * These all pertain to data-emitted into the trace buffer(s).  Must not
+ * include controls pertaining to the structure/position of the trace
+ * buffer(s).
+ */
+#define RTIT_CTL_MASK                                                   \
+    (RTIT_CTL_TRACE_EN | RTIT_CTL_OS | RTIT_CTL_USR | RTIT_CTL_TSC_EN | \
+     RTIT_CTL_DIS_RETC | RTIT_CTL_BRANCH_EN)
+
+/*
+ * Status bits restricted to the first-gen subset (i.e. no further CPUID
+ * requirements.)
+ */
+#define RTIT_STATUS_MASK                                                \
+    (RTIT_STATUS_FILTER_EN | RTIT_STATUS_CONTEXT_EN | RTIT_STATUS_TRIGGER_EN | \
+     RTIT_STATUS_ERROR | RTIT_STATUS_STOPPED)
+
+static int vmtrace_get_option(struct vcpu *v, uint64_t key, uint64_t *output)
+{
+    const struct vcpu_msrs *msrs = v->arch.msrs;
+
+    switch ( key )
+    {
+    case MSR_RTIT_OUTPUT_MASK:
+        *output = msrs->rtit.output_mask;
+        break;
+
+    case MSR_RTIT_CTL:
+        *output = msrs->rtit.ctl & RTIT_CTL_MASK;
+        break;
+
+    case MSR_RTIT_STATUS:
+        *output = msrs->rtit.status & RTIT_STATUS_MASK;
+        break;
+
+    default:
+        *output = 0;
+        return -EINVAL;
+    }
+    return 0;
+}
+
+static int vmtrace_set_option(struct vcpu *v, uint64_t key, uint64_t value)
+{
+    struct vcpu_msrs *msrs = v->arch.msrs;
+    bool new_en, old_en = msrs->rtit.ctl & RTIT_CTL_TRACE_EN;
+
+    switch ( key )
+    {
+    case MSR_RTIT_OUTPUT_MASK:
+        /*
+         * MSR_RTIT_OUTPUT_MASK, when using Single Output mode, has a limit
+         * field in the lower 32 bits, and an offset in the upper 32 bits.
+         *
+         * Limit is fixed by the vmtrace buffer size and must not be
+         * controlled by userspace, while offset must be within the limit.
+         *
+         * Drop writes to the limit field to simply userspace wanting to reset
+         * the offset by writing 0.
+         */
+        if ( (value >> 32) > msrs->rtit.output_limit )
+            return -EINVAL;
+        msrs->rtit.output_offset = value >> 32;
+        break;
+
+    case MSR_RTIT_CTL:
+        if ( value & ~RTIT_CTL_MASK )
+            return -EINVAL;
+
+        msrs->rtit.ctl &= ~RTIT_CTL_MASK;
+        msrs->rtit.ctl |= (value & RTIT_CTL_MASK);
+        break;
+
+    case MSR_RTIT_STATUS:
+        if ( value & ~RTIT_STATUS_MASK )
+            return -EINVAL;
+
+        msrs->rtit.status &= ~RTIT_STATUS_MASK;
+        msrs->rtit.status |= (value & RTIT_STATUS_MASK);
+        break;
+
+    default:
+        return -EINVAL;
+    }
+
+    new_en = msrs->rtit.ctl & RTIT_CTL_TRACE_EN;
+
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
+
+    return 0;
+}
+
+static int vmtrace_control(struct vcpu *v, bool enable, bool reset)
+{
+    struct vcpu_msrs *msrs = v->arch.msrs;
+    uint64_t new_ctl;
+    int rc;
+
+    /*
+     * Absolutely nothing good will come of Xen's and userspace's idea of
+     * whether ipt is enabled getting out of sync.
+     */
+    if ( v->arch.hvm.vmx.ipt_active == enable )
+        return -EINVAL;
+
+    if ( reset )
+    {
+        msrs->rtit.status = 0;
+        msrs->rtit.output_offset = 0;
+    }
+
+    new_ctl = msrs->rtit.ctl & ~RTIT_CTL_TRACE_EN;
+    if ( enable )
+        new_ctl |= RTIT_CTL_TRACE_EN;
+
+    rc = vmtrace_set_option(v, MSR_RTIT_CTL, new_ctl);
+    if ( rc )
+        return rc;
+
+    v->arch.hvm.vmx.ipt_active = enable;
+
+    return 0;
+}
+
+static int vmtrace_output_position(struct vcpu *v, uint64_t *pos)
+{
+    *pos = v->arch.msrs->rtit.output_offset;
+    return v->arch.hvm.vmx.ipt_active;
+}
+
 static struct hvm_function_table __initdata vmx_function_table = {
     .name                 = "VMX",
     .cpu_up_prepare       = vmx_cpu_up_prepare,
@@ -2316,6 +2467,10 @@ static struct hvm_function_table __initdata vmx_function_table = {
     .altp2m_vcpu_update_vmfunc_ve = vmx_vcpu_update_vmfunc_ve,
     .altp2m_vcpu_emulate_ve = vmx_vcpu_emulate_ve,
     .altp2m_vcpu_emulate_vmfunc = vmx_vcpu_emulate_vmfunc,
+    .vmtrace_control = vmtrace_control,
+    .vmtrace_output_position = vmtrace_output_position,
+    .vmtrace_set_option = vmtrace_set_option,
+    .vmtrace_get_option = vmtrace_get_option,
     .tsc_scaling = {
         .max_ratio = VMX_TSC_MULTIPLIER_MAX,
     },
diff --git a/xen/include/asm-x86/hvm/hvm.h b/xen/include/asm-x86/hvm/hvm.h
index 334bd573b9..960ec03917 100644
--- a/xen/include/asm-x86/hvm/hvm.h
+++ b/xen/include/asm-x86/hvm/hvm.h
@@ -214,6 +214,12 @@ struct hvm_function_table {
     bool_t (*altp2m_vcpu_emulate_ve)(struct vcpu *v);
     int (*altp2m_vcpu_emulate_vmfunc)(const struct cpu_user_regs *regs);
 
+    /* vmtrace */
+    int (*vmtrace_control)(struct vcpu *v, bool enable, bool reset);
+    int (*vmtrace_output_position)(struct vcpu *v, uint64_t *pos);
+    int (*vmtrace_set_option)(struct vcpu *v, uint64_t key, uint64_t value);
+    int (*vmtrace_get_option)(struct vcpu *v, uint64_t key, uint64_t *value);
+
     /*
      * Parameters and callbacks for hardware-assisted TSC scaling,
      * which are valid only when the hardware feature is available.
@@ -655,6 +661,41 @@ static inline bool altp2m_vcpu_emulate_ve(struct vcpu *v)
     return false;
 }
 
+static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool reset)
+{
+    if ( hvm_funcs.vmtrace_control )
+        return hvm_funcs.vmtrace_control(v, enable, reset);
+
+    return -EOPNOTSUPP;
+}
+
+/* Returns -errno, or a boolean of whether tracing is currently active. */
+static inline int hvm_vmtrace_output_position(struct vcpu *v, uint64_t *pos)
+{
+    if ( hvm_funcs.vmtrace_output_position )
+        return hvm_funcs.vmtrace_output_position(v, pos);
+
+    return -EOPNOTSUPP;
+}
+
+static inline int hvm_vmtrace_set_option(
+    struct vcpu *v, uint64_t key, uint64_t value)
+{
+    if ( hvm_funcs.vmtrace_set_option )
+        return hvm_funcs.vmtrace_set_option(v, key, value);
+
+    return -EOPNOTSUPP;
+}
+
+static inline int hvm_vmtrace_get_option(
+    struct vcpu *v, uint64_t key, uint64_t *value)
+{
+    if ( hvm_funcs.vmtrace_get_option )
+        return hvm_funcs.vmtrace_get_option(v, key, value);
+
+    return -EOPNOTSUPP;
+}
+
 /*
  * This must be defined as a macro instead of an inline function,
  * because it uses 'struct vcpu' and 'struct domain' which have
@@ -751,6 +792,28 @@ static inline bool hvm_has_set_descriptor_access_exiting(void)
     return false;
 }
 
+static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool reset)
+{
+    return -EOPNOTSUPP;
+}
+
+static inline int hvm_vmtrace_output_position(struct vcpu *v, uint64_t *pos)
+{
+    return -EOPNOTSUPP;
+}
+
+static inline int hvm_vmtrace_set_option(
+    struct vcpu *v, uint64_t key, uint64_t value)
+{
+    return -EOPNOTSUPP;
+}
+
+static inline int hvm_vmtrace_get_option(
+    struct vcpu *v, uint64_t key, uint64_t *value)
+{
+    return -EOPNOTSUPP;
+}
+
 #define is_viridian_domain(d) ((void)(d), false)
 #define is_viridian_vcpu(v) ((void)(v), false)
 #define has_viridian_time_ref_count(d) ((void)(d), false)
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 88a5b1ef5d..4dbf107785 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1135,6 +1135,39 @@ struct xen_domctl_vuart_op {
                                  */
 };
 
+/* XEN_DOMCTL_vmtrace_op: Perform VM tracing operations. */
+struct xen_domctl_vmtrace_op {
+    uint32_t cmd;           /* IN */
+    uint32_t vcpu;          /* IN */
+    uint64_aligned_t key;   /* IN     - @cmd specific data. */
+    uint64_aligned_t value; /* IN/OUT - @cmd specific data. */
+
+    /*
+     * General enable/disable of tracing.
+     *
+     * XEN_DOMCTL_vmtrace_reset_and_enable is provided as optimisation for
+     * common usecases, which want to reset status and position information
+     * when turning tracing back on.
+     */
+#define XEN_DOMCTL_vmtrace_enable             1
+#define XEN_DOMCTL_vmtrace_disable            2
+#define XEN_DOMCTL_vmtrace_reset_and_enable   3
+
+    /* Obtain the current output position within the buffer.  Fills @value. */
+#define XEN_DOMCTL_vmtrace_output_position    4
+
+    /*
+     * Get/Set platform specific configuration.
+     *
+     * For Intel Processor Trace, @key/@value are interpreted as MSR
+     * reads/writes to MSR_RTIT_*, filtered to a safe subset.
+     */
+#define XEN_DOMCTL_vmtrace_get_option         5
+#define XEN_DOMCTL_vmtrace_set_option         6
+};
+typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
+DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
+
 struct xen_domctl {
     uint32_t cmd;
 #define XEN_DOMCTL_createdomain                   1
@@ -1219,6 +1252,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_vuart_op                      81
 #define XEN_DOMCTL_get_cpu_policy                82
 #define XEN_DOMCTL_set_cpu_policy                83
+#define XEN_DOMCTL_vmtrace_op                    84
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1279,6 +1313,7 @@ struct xen_domctl {
         struct xen_domctl_monitor_op        monitor_op;
         struct xen_domctl_psr_alloc         psr_alloc;
         struct xen_domctl_vuart_op          vuart_op;
+        struct xen_domctl_vmtrace_op        vmtrace_op;
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 11784d7425..3b7313b949 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -703,6 +703,7 @@ static int flask_domctl(struct domain *d, int cmd)
         return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__VM_EVENT);
 
     case XEN_DOMCTL_debug_op:
+    case XEN_DOMCTL_vmtrace_op:
     case XEN_DOMCTL_gdbsx_guestmemio:
     case XEN_DOMCTL_gdbsx_pausevcpu:
     case XEN_DOMCTL_gdbsx_unpausevcpu:
-- 
2.11.0


