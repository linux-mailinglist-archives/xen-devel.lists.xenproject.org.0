Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BD52FF734
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 22:28:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72433.130474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hUr-0005bJ-8T; Thu, 21 Jan 2021 21:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72433.130474; Thu, 21 Jan 2021 21:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hUr-0005aa-3J; Thu, 21 Jan 2021 21:28:05 +0000
Received: by outflank-mailman (input) for mailman id 72433;
 Thu, 21 Jan 2021 21:28:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOiS=GY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l2hUp-0005Yt-B2
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 21:28:03 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 069a7fe1-dc92-44cf-9c62-0116619a9485;
 Thu, 21 Jan 2021 21:28:02 +0000 (UTC)
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
X-Inumbo-ID: 069a7fe1-dc92-44cf-9c62-0116619a9485
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611264482;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ao91LD5RU1JMlY1QXvmQo9WVVoz5as90GePXi5Nwnxw=;
  b=d5Nigeb2Tz0CzZihuzPt5WvPOpxZfv5uZWcDwAZVxp7Gwnz0l5RnU92T
   QMhzEifK1WnLivOUw13qZNOm/9mdTwtk7k5vSzW7dudPWn+oN6D8UgdIS
   VROxApv9dor7TLrfqRBfAreOhjRNkIHov7vywn0ayugCWFe5SG1c3Xc3B
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 5nDw2G6uFJpOg7SlV4SYjm/To8+T/hhhKhvuegTu8ja7NYZfLrN3dQcnTbRAp1Xo5OvSEfc/Hv
 ub0ZHxxrSjH/Ar/AvYHY8NzbL6s+NzR2f2ckgiC4e1fMygN0UMWJvI4Fu3dv4gZKMd4uLjGTrW
 oOmqOF9jFVn0ksIRypIZ0AAoyfKOYpKDLRU9YK1PvLwBupi2cKUkGjNYRj45+lbU1mNW3uJQJg
 1dnSFxQqd7BXvOOnwMvOPYczZHXXT0HZXnbIgwlH4XpCKOMhAR8QnM0eguI377/I2IpptVkG98
 w/g=
X-SBRS: 5.1
X-MesageID: 35651443
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,365,1602561600"; 
   d="scan'208";a="35651443"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v7 06/10] xen/domctl: Add XEN_DOMCTL_vmtrace_op
Date: Thu, 21 Jan 2021 21:27:14 +0000
Message-ID: <20210121212718.2441-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210121212718.2441-1-andrew.cooper3@citrix.com>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
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

v7:
 * Major chop&change within the series.
---
 xen/arch/x86/domctl.c         |  55 +++++++++++++++
 xen/arch/x86/hvm/vmx/vmx.c    | 151 ++++++++++++++++++++++++++++++++++++++++++
 xen/include/asm-x86/hvm/hvm.h |  63 ++++++++++++++++++
 xen/include/public/domctl.h   |  35 ++++++++++
 xen/xsm/flask/hooks.c         |   1 +
 5 files changed, 305 insertions(+)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index b28cfe9817..aa6dfe8eed 100644
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
+    if ( !d->vmtrace_frames || d == current->domain /* No vcpu_pause() */ )
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
index 93121fbf27..d4e7b50b8a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2261,6 +2261,153 @@ static bool vmx_get_pending_event(struct vcpu *v, struct x86_event *info)
     return true;
 }
 
+static int vmtrace_get_option(struct vcpu *v, uint64_t key, uint64_t *output)
+{
+    const struct vcpu_msrs *msrs = v->arch.msrs;
+
+    /*
+     * We only let vmtrace agents see and modify a subset of bits in
+     * MSR_RTIT_CTL.  These all pertain to date emitted into the trace
+     * buffer(s).  Must not include controls pertaining to the
+     * structure/position of the trace buffer(s).
+     */
+#define RTIT_CTL_MASK                                                   \
+    (RTIT_CTL_TRACE_EN | RTIT_CTL_OS | RTIT_CTL_USR | RTIT_CTL_TSC_EN | \
+     RTIT_CTL_DIS_RETC | RTIT_CTL_BRANCH_EN)
+
+    /*
+     * Status bits restricted to the first-gen subset (i.e. no further CPUID
+     * requirements.)
+     */
+#define RTIT_STATUS_MASK \
+    (RTIT_STATUS_FILTER_EN | RTIT_STATUS_CONTEXT_EN | RTIT_STATUS_TRIGGER_EN | \
+     RTIT_STATUS_ERROR | RTIT_STATUS_STOPPED)
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
@@ -2316,6 +2463,10 @@ static struct hvm_function_table __initdata vmx_function_table = {
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
index 1585678d50..218593e548 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1133,6 +1133,39 @@ struct xen_domctl_vuart_op {
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
@@ -1217,6 +1250,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_vuart_op                      81
 #define XEN_DOMCTL_get_cpu_policy                82
 #define XEN_DOMCTL_set_cpu_policy                83
+#define XEN_DOMCTL_vmtrace_op                    84
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1277,6 +1311,7 @@ struct xen_domctl {
         struct xen_domctl_monitor_op        monitor_op;
         struct xen_domctl_psr_alloc         psr_alloc;
         struct xen_domctl_vuart_op          vuart_op;
+        struct xen_domctl_vmtrace_op        vmtrace_op;
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 19b0d9e3eb..3eba495ab3 100644
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


