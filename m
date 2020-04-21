Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1120C1B2271
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 11:13:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQoy8-0000VU-2B; Tue, 21 Apr 2020 09:13:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OiHr=6F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQoy6-0000VK-Rk
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 09:13:26 +0000
X-Inumbo-ID: 5ad83180-83b0-11ea-911a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ad83180-83b0-11ea-911a-12813bfff9fa;
 Tue, 21 Apr 2020 09:13:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B1559AD23;
 Tue, 21 Apr 2020 09:13:23 +0000 (UTC)
Subject: [PATCH v2 4/4] x86: adjustments to guest handle treatment
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9d4b738a-4487-6bfc-3076-597d074c7b47@suse.com>
Message-ID: <e820e1b9-7a7e-21f3-1ea0-d939de1905dd@suse.com>
Date: Tue, 21 Apr 2020 11:13:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9d4b738a-4487-6bfc-3076-597d074c7b47@suse.com>
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
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

First of all avoid excessive conversions. copy_{from,to}_guest(), for
example, work fine with all of XEN_GUEST_HANDLE{,_64,_PARAM}().

Further
- do_physdev_op_compat() didn't use the param form for its parameter,
- {hap,shadow}_track_dirty_vram() wrongly used the param form,
- compat processor Px logic failed to check compatibility of native and
  compat structures not further converted.

As this eliminates all users of guest_handle_from_param() and as there's
no real need to allow for conversions in both directions, drop the
macros as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/compat.c
+++ b/xen/arch/x86/compat.c
@@ -15,7 +15,7 @@ typedef long ret_t;
 #endif
 
 /* Legacy hypercall (as of 0x00030202). */
-ret_t do_physdev_op_compat(XEN_GUEST_HANDLE(physdev_op_t) uop)
+ret_t do_physdev_op_compat(XEN_GUEST_HANDLE_PARAM(physdev_op_t) uop)
 {
     typeof(do_physdev_op) *fn =
         (void *)pv_hypercall_table[__HYPERVISOR_physdev_op].native;
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -678,7 +678,7 @@ static long microcode_update_helper(void
     return ret;
 }
 
-int microcode_update(XEN_GUEST_HANDLE_PARAM(const_void) buf, unsigned long len)
+int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len)
 {
     int ret;
     struct ucode_buf *buffer;
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4441,20 +4441,16 @@ static int _handle_iomem_range(unsigned
 {
     if ( s > ctxt->s && !(s >> (paddr_bits - PAGE_SHIFT)) )
     {
-        e820entry_t ent;
-        XEN_GUEST_HANDLE_PARAM(e820entry_t) buffer_param;
-        XEN_GUEST_HANDLE(e820entry_t) buffer;
-
         if ( !guest_handle_is_null(ctxt->map.buffer) )
         {
+            e820entry_t ent;
+
             if ( ctxt->n + 1 >= ctxt->map.nr_entries )
                 return -EINVAL;
             ent.addr = (uint64_t)ctxt->s << PAGE_SHIFT;
             ent.size = (uint64_t)(s - ctxt->s) << PAGE_SHIFT;
             ent.type = E820_RESERVED;
-            buffer_param = guest_handle_cast(ctxt->map.buffer, e820entry_t);
-            buffer = guest_handle_from_param(buffer_param, e820entry_t);
-            if ( __copy_to_guest_offset(buffer, ctxt->n, &ent, 1) )
+            if ( __copy_to_guest_offset(ctxt->map.buffer, ctxt->n, &ent, 1) )
                 return -EFAULT;
         }
         ctxt->n++;
@@ -4715,8 +4711,7 @@ long arch_memory_op(unsigned long cmd, X
     case XENMEM_machine_memory_map:
     {
         struct memory_map_context ctxt;
-        XEN_GUEST_HANDLE(e820entry_t) buffer;
-        XEN_GUEST_HANDLE_PARAM(e820entry_t) buffer_param;
+        XEN_GUEST_HANDLE_PARAM(e820entry_t) buffer;
         unsigned int i;
         bool store;
 
@@ -4732,8 +4727,7 @@ long arch_memory_op(unsigned long cmd, X
         if ( store && ctxt.map.nr_entries < e820.nr_map + 1 )
             return -EINVAL;
 
-        buffer_param = guest_handle_cast(ctxt.map.buffer, e820entry_t);
-        buffer = guest_handle_from_param(buffer_param, e820entry_t);
+        buffer = guest_handle_cast(ctxt.map.buffer, e820entry_t);
         if ( store && !guest_handle_okay(buffer, ctxt.map.nr_entries) )
             return -EFAULT;
 
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -59,7 +59,7 @@
 int hap_track_dirty_vram(struct domain *d,
                          unsigned long begin_pfn,
                          unsigned long nr,
-                         XEN_GUEST_HANDLE_PARAM(void) guest_dirty_bitmap)
+                         XEN_GUEST_HANDLE(void) guest_dirty_bitmap)
 {
     long rc = 0;
     struct sh_dirty_vram *dirty_vram;
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -3171,7 +3171,7 @@ static void sh_clean_dirty_bitmap(struct
 int shadow_track_dirty_vram(struct domain *d,
                             unsigned long begin_pfn,
                             unsigned long nr,
-                            XEN_GUEST_HANDLE_PARAM(void) guest_dirty_bitmap)
+                            XEN_GUEST_HANDLE(void) guest_dirty_bitmap)
 {
     int rc = 0;
     unsigned long end_pfn = begin_pfn + nr;
--- a/xen/arch/x86/oprofile/backtrace.c
+++ b/xen/arch/x86/oprofile/backtrace.c
@@ -74,11 +74,8 @@ dump_guest_backtrace(struct vcpu *vcpu,
     }
     else
     {
-        XEN_GUEST_HANDLE(const_frame_head_t) guest_head;
-        XEN_GUEST_HANDLE_PARAM(const_frame_head_t) guest_head_param =
+        XEN_GUEST_HANDLE_PARAM(const_frame_head_t) guest_head =
             const_guest_handle_from_ptr(head, frame_head_t);
-        guest_head = guest_handle_from_param(guest_head_param,
-					     const_frame_head_t);
 
         /* Also check accessibility of one struct frame_head beyond */
         if (!guest_handle_okay(guest_head, 2))
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -285,9 +285,7 @@ ret_t do_platform_op(XEN_GUEST_HANDLE_PA
 
         guest_from_compat_handle(data, op->u.microcode.data);
 
-        ret = microcode_update(
-                guest_handle_to_param(data, const_void),
-                op->u.microcode.length);
+        ret = microcode_update(data, op->u.microcode.length);
     }
     break;
 
@@ -531,9 +529,7 @@ ret_t do_platform_op(XEN_GUEST_HANDLE_PA
             XEN_GUEST_HANDLE(uint32) pdc;
 
             guest_from_compat_handle(pdc, op->u.set_pminfo.u.pdc);
-            ret = acpi_set_pdc_bits(
-                    op->u.set_pminfo.id,
-                    guest_handle_to_param(pdc, uint32));
+            ret = acpi_set_pdc_bits(op->u.set_pminfo.id, pdc);
         }
         break;
 
--- a/xen/arch/x86/x86_64/compat.c
+++ b/xen/arch/x86/x86_64/compat.c
@@ -15,6 +15,7 @@ EMIT_FILE;
 
 #define COMPAT
 #define _XEN_GUEST_HANDLE(t) XEN_GUEST_HANDLE(t)
+#define _XEN_GUEST_HANDLE_PARAM(t) XEN_GUEST_HANDLE_PARAM(t)
 typedef int ret_t;
 
 #include "../compat.c"
--- a/xen/arch/x86/x86_64/cpu_idle.c
+++ b/xen/arch/x86/x86_64/cpu_idle.c
@@ -52,13 +52,9 @@ static int copy_from_compat_state(xen_pr
                                   compat_processor_cx_t *state)
 {
 #define XLAT_processor_cx_HNDL_dp(_d_, _s_) do { \
-    XEN_GUEST_HANDLE(compat_processor_csd_t) dps; \
-    XEN_GUEST_HANDLE_PARAM(xen_processor_csd_t) dps_param; \
     if ( unlikely(!compat_handle_okay((_s_)->dp, (_s_)->dpcnt)) ) \
-            return -EFAULT; \
-    guest_from_compat_handle(dps, (_s_)->dp); \
-    dps_param = guest_handle_cast(dps, xen_processor_csd_t); \
-    (_d_)->dp = guest_handle_from_param(dps_param, xen_processor_csd_t); \
+        return -EFAULT; \
+    guest_from_compat_handle((_d_)->dp, (_s_)->dp); \
 } while (0)
     XLAT_processor_cx(xen_state, state);
 #undef XLAT_processor_cx_HNDL_dp
--- a/xen/arch/x86/x86_64/cpufreq.c
+++ b/xen/arch/x86/x86_64/cpufreq.c
@@ -26,6 +26,8 @@
 #include <xen/pmstat.h>
 #include <compat/platform.h>
 
+CHECK_processor_px;
+
 DEFINE_XEN_GUEST_HANDLE(compat_processor_px_t);
 
 int 
@@ -42,13 +44,9 @@ compat_set_px_pminfo(uint32_t cpu, struc
 	return -EFAULT;
 
 #define XLAT_processor_performance_HNDL_states(_d_, _s_) do { \
-    XEN_GUEST_HANDLE(compat_processor_px_t) states; \
-    XEN_GUEST_HANDLE_PARAM(xen_processor_px_t) states_t; \
     if ( unlikely(!compat_handle_okay((_s_)->states, (_s_)->state_count)) ) \
         return -EFAULT; \
-    guest_from_compat_handle(states, (_s_)->states); \
-    states_t = guest_handle_cast(states, xen_processor_px_t); \
-    (_d_)->states = guest_handle_from_param(states_t, xen_processor_px_t); \
+    guest_from_compat_handle((_d_)->states, (_s_)->states); \
 } while (0)
 
     XLAT_processor_performance(xen_perf, perf);
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -492,7 +492,7 @@ int do_pm_op(struct xen_sysctl_pm_op *op
     return ret;
 }
 
-int acpi_set_pdc_bits(u32 acpi_id, XEN_GUEST_HANDLE_PARAM(uint32) pdc)
+int acpi_set_pdc_bits(u32 acpi_id, XEN_GUEST_HANDLE(uint32) pdc)
 {
     u32 bits[3];
     int ret;
--- a/xen/include/asm-arm/guest_access.h
+++ b/xen/include/asm-arm/guest_access.h
@@ -40,7 +40,7 @@ int access_guest_memory_by_ipa(struct do
     (XEN_GUEST_HANDLE_PARAM(type)) { _x };            \
 })
 
-/* Cast a XEN_GUEST_HANDLE to XEN_GUEST_HANDLE_PARAM */
+/* Convert a XEN_GUEST_HANDLE to XEN_GUEST_HANDLE_PARAM */
 #define guest_handle_to_param(hnd, type) ({                  \
     typeof((hnd).p) _x = (hnd).p;                            \
     XEN_GUEST_HANDLE_PARAM(type) _y = { _x };                \
@@ -51,18 +51,6 @@ int access_guest_memory_by_ipa(struct do
     _y;                                                      \
 })
 
-
-/* Cast a XEN_GUEST_HANDLE_PARAM to XEN_GUEST_HANDLE */
-#define guest_handle_from_param(hnd, type) ({               \
-    typeof((hnd).p) _x = (hnd).p;                           \
-    XEN_GUEST_HANDLE(type) _y = { _x };                     \
-    /* type checking: make sure that the pointers inside    \
-     * XEN_GUEST_HANDLE and XEN_GUEST_HANDLE_PARAM are of   \
-     * the same type, then return hnd */                    \
-    (void)(&_x == &_y.p);                                   \
-    _y;                                                     \
-})
-
 #define guest_handle_for_field(hnd, type, fld)          \
     ((XEN_GUEST_HANDLE(type)) { &(hnd).p->fld })
 
--- a/xen/include/asm-x86/guest_access.h
+++ b/xen/include/asm-x86/guest_access.h
@@ -52,21 +52,11 @@
     (XEN_GUEST_HANDLE_PARAM(type)) { _x };            \
 })
 
-/* Cast a XEN_GUEST_HANDLE to XEN_GUEST_HANDLE_PARAM */
+/* Convert a XEN_GUEST_HANDLE to XEN_GUEST_HANDLE_PARAM */
 #define guest_handle_to_param(hnd, type) ({                  \
     /* type checking: make sure that the pointers inside     \
      * XEN_GUEST_HANDLE and XEN_GUEST_HANDLE_PARAM are of    \
      * the same type, then return hnd */                     \
-    (void)((typeof(&(hnd).p)) 0 ==                           \
-        (typeof(&((XEN_GUEST_HANDLE_PARAM(type)) {}).p)) 0); \
-    (hnd);                                                   \
-})
-
-/* Cast a XEN_GUEST_HANDLE_PARAM to XEN_GUEST_HANDLE */
-#define guest_handle_from_param(hnd, type) ({                \
-    /* type checking: make sure that the pointers inside     \
-     * XEN_GUEST_HANDLE and XEN_GUEST_HANDLE_PARAM are of    \
-     * the same type, then return hnd */                     \
     (void)((typeof(&(hnd).p)) 0 ==                           \
         (typeof(&((XEN_GUEST_HANDLE_PARAM(type)) {}).p)) 0); \
     (hnd);                                                   \
--- a/xen/include/asm-x86/hap.h
+++ b/xen/include/asm-x86/hap.h
@@ -41,7 +41,7 @@ void  hap_vcpu_init(struct vcpu *v);
 int   hap_track_dirty_vram(struct domain *d,
                            unsigned long begin_pfn,
                            unsigned long nr,
-                           XEN_GUEST_HANDLE_PARAM(void) dirty_bitmap);
+                           XEN_GUEST_HANDLE(void) dirty_bitmap);
 
 extern const struct paging_mode *hap_paging_get_mode(struct vcpu *);
 int hap_set_allocation(struct domain *d, unsigned int pages, bool *preempted);
--- a/xen/include/asm-x86/microcode.h
+++ b/xen/include/asm-x86/microcode.h
@@ -20,7 +20,7 @@ struct cpu_signature {
 DECLARE_PER_CPU(struct cpu_signature, cpu_sig);
 
 void microcode_set_module(unsigned int idx);
-int microcode_update(XEN_GUEST_HANDLE_PARAM(const_void), unsigned long len);
+int microcode_update(XEN_GUEST_HANDLE(const_void), unsigned long len);
 int early_microcode_init(void);
 int microcode_update_one(bool start_update);
 
--- a/xen/include/asm-x86/shadow.h
+++ b/xen/include/asm-x86/shadow.h
@@ -64,7 +64,7 @@ int shadow_enable(struct domain *d, u32
 int shadow_track_dirty_vram(struct domain *d,
                             unsigned long first_pfn,
                             unsigned long nr,
-                            XEN_GUEST_HANDLE_PARAM(void) dirty_bitmap);
+                            XEN_GUEST_HANDLE(void) dirty_bitmap);
 
 /* Handler for shadow control ops: operations from user-space to enable
  * and disable ephemeral shadow modes (test mode and log-dirty mode) and
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -184,8 +184,8 @@ static inline unsigned int acpi_get_csub
 static inline void acpi_set_csubstate_limit(unsigned int new_limit) { return; }
 #endif
 
-#ifdef XEN_GUEST_HANDLE_PARAM
-int acpi_set_pdc_bits(u32 acpi_id, XEN_GUEST_HANDLE_PARAM(uint32));
+#ifdef XEN_GUEST_HANDLE
+int acpi_set_pdc_bits(u32 acpi_id, XEN_GUEST_HANDLE(uint32));
 #endif
 int arch_acpi_set_pdc_bits(u32 acpi_id, u32 *, u32 mask);
 


