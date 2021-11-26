Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2516D45EE07
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 13:35:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232672.403506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaRY-00032w-LE; Fri, 26 Nov 2021 12:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232672.403506; Fri, 26 Nov 2021 12:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaRY-0002rN-3b; Fri, 26 Nov 2021 12:35:08 +0000
Received: by outflank-mailman (input) for mailman id 232672;
 Fri, 26 Nov 2021 12:35:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqaRV-0001F5-38
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 12:35:05 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 461f8c71-4eb5-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 13:35:01 +0100 (CET)
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
X-Inumbo-ID: 461f8c71-4eb5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637930101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=zzYsAAZqVX0Gd/xLEcar4h/Ts5nqFa6lcinkTdOV1C4=;
  b=WDbbS1q2h98nr0vkGjDjOSZ/GcQOGx+OzYs1pyFBRVXltgJ2yPlZq9dr
   3XfLc+XsrzbkUlzL4S2eUYuD9MO/3HBEtwancEYm3YUti6XXX0FMd8nQo
   keUD1DdURvExTwQijxIV44uEvJG/1H/fydbhE4bCjiacNnburicHf9xY0
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: uUTgDUvTFsbas4FeXJn8l7EQOQJdiwBaOnuS3drF7RqJPozkQHXMLLRiPvkb9JHlaxxUPzXfiP
 BarZgDZ3HCicMTaJ3jivFNp+LLcsq3GYsrxKrZDRRQDK5yad2IiczJMfzCWZaAAJSc+LfDrZHl
 xN1XgBILJtyhkpVUuuSlIg3SmXYljylqxBIXCgKq/vsgenkLDdBuQZMxBg2Gi2lk8mzPjLgQj2
 anOI3UgJ4fnLeLrJ4w8croEmEb0L9O7t/97nkWgxy59dBM8Y48WcLhtJvlYhD8rjcOi8iwRQ5s
 OUEK+NJtfZvZJts859Is3CvD
X-SBRS: 5.1
X-MesageID: 58192118
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:SeVySK5CFGjN2zpEsA9SPwxRtAfAchMFZxGqfqrLsTDasY5as4F+v
 mccUWzSOq6IYGXyKtAlaNvgpB8Fv5bdztBlTARrqCFgHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdg2NAw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z+
 fdM8rDpZS4QHoLyvL49EAEAIyxfFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gTTa+PP
 ZNAOVKDajzEOhRICBAcK64Rle6NnkbRf2QEh2Ka8P9fD2/7k1UqjemF3MDuUt6FX8JOhW6Du
 3nLuW/+B3kyJNGZjDaI7H+oruvOhj/gHpIfEqWi8fxni0HVwXYcYCD6TnPi/6P/0BTnHYsCd
 QpEoULCsJTe6mSabNi6c0SUiUekkSA4AfoTC7UK5SCkn/+8DxmiOkAISTtIadoDvcAwRCA32
 lLho+4FFQCDo5XOFyvDq+78QSeafHFMcDRcPXNsoR4tuoG7+OkOYgTzosGP+UJfpvn8AnnOz
 j+Dt0DSbJ1D3JdQh81XEb0q6g9AR6QlrCZpuW07vUr/t2uVgbJJgaTzsjA3Ct4ace6koqGp5
 iRspiRnxLlm4WuxvCKMWv4RO7qi+uyINjbR6XY2QcJ+p2rwpC//I9wLiN2bGKuPGp1fEdMOS
 BWO0T69GbcJZCf6BUOJS97Z5zsWIVjISo2+C6G8gitmaZltbg6XlByClmbLt10BZHMEyPllU
 b/CKJ7EJS9DVcxPkWrnL89AgORD7n1vmgvuqWXTkk3PPUy2PyXOF9/o8TKmM4gE0U9ziFmPr
 osEaZLVk043vS+XSnC/zLP/5GsidRATba0aYeQMHgJaCgY5SmwnFdHLxrYtJ95sk6hPz7+a9
 XChQE5IjlH4gCSfewmNb3libpLpXIp+8i1nbXB9Yw7w1ihxe5ur4Ycea4AzIest+tt8wKMmV
 PICYciBXKhCE2yV5zQHYJDhh4V+bxD31xmWNi+obWFnLZ5tTgDE4PH+eQ7r+HVcBya7r5Jm8
 bahyhnaUdwIQAE7VJTab/emzlWQu3kBmb0tAxuUc4cLIEi1qdpkMS38iPMzMvogExSby2vIz
 RuSDDcZufLJ/90//u7WiP3WtIyuCeZ/QBZXRjGJ8basOCDG1WO/2oscAv2QdDXQWW6oqqWvY
 eJZk6P1PPEdxQsYtoN9F/BgzL4k5suprLhfl1w2EHLOZlWtK7VhPnjZgpUf6vwTnudU6VmsR
 0aC2thGIrHYasrqHWkYKBchcuneh+ofnSPf7KhtLUj3jMOtEGFrjamG08GwtRFg
IronPort-HdrOrdr: A9a23:CtGZ2anPmULhRQ6GZcv8I3y1lgjpDfIu3DAbv31ZSRFFG/Fxl6
 iV8sjztCWE8Qr5N0tBpTntAsW9qDbnhPtICOoqTNGftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAs9D4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.87,265,1631592000"; 
   d="scan'208";a="58192118"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Juergen Gross <jgross@suse.com>
Subject: [PATCH 03/65] xen/x86: don't use hypercall table for calling compat hypercalls
Date: Fri, 26 Nov 2021 12:33:44 +0000
Message-ID: <20211126123446.32324-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Juergen Gross <jgross@suse.com>

Today the *_op_compat hypercalls call the modern handler functions by
using the entries from the hypercall table. This is resulting in a
not needed indirect function call which can be avoided by using the
correct handler function directly. This is basically a revert of
commit 1252e282311734 ("86/pv: Export pv_hypercall_table[] rather
than working around it in several ways"), which reasoning no longer
applies, as shim no longer modifies the hypercall table.

The hypercall table can now be made static as there is no external
reference to it any longer.

Commit 834cb8761051f7 ("x86/PV32: fix physdev_op_compat handling")
can be reverted, too, as using the direct call of the correct handler
is already handled fine without that patch.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/compat.c           | 14 ++++----------
 xen/arch/x86/pv/hypercall.c     |  9 ++++++++-
 xen/arch/x86/x86_64/compat.c    |  1 -
 xen/include/asm-x86/hypercall.h |  8 --------
 4 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/compat.c b/xen/arch/x86/compat.c
index 58b202f701d5..939b449dec29 100644
--- a/xen/arch/x86/compat.c
+++ b/xen/arch/x86/compat.c
@@ -17,14 +17,12 @@ typedef long ret_t;
 /* Legacy hypercall (as of 0x00030202). */
 ret_t do_physdev_op_compat(XEN_GUEST_HANDLE_PARAM(physdev_op_t) uop)
 {
-    typeof(do_physdev_op) *fn =
-        (void *)pv_hypercall_table[__HYPERVISOR_physdev_op].native;
     struct physdev_op op;
 
     if ( unlikely(copy_from_guest(&op, uop, 1) != 0) )
         return -EFAULT;
 
-    return fn(op.cmd, guest_handle_from_ptr(&uop.p->u, void));
+    return do_physdev_op(op.cmd, guest_handle_from_ptr(&uop.p->u, void));
 }
 
 #ifndef COMPAT
@@ -32,14 +30,11 @@ ret_t do_physdev_op_compat(XEN_GUEST_HANDLE_PARAM(physdev_op_t) uop)
 /* Legacy hypercall (as of 0x00030101). */
 long do_sched_op_compat(int cmd, unsigned long arg)
 {
-    typeof(do_sched_op) *fn =
-        (void *)pv_hypercall_table[__HYPERVISOR_sched_op].native;
-
     switch ( cmd )
     {
     case SCHEDOP_yield:
     case SCHEDOP_block:
-        return fn(cmd, guest_handle_from_ptr(NULL, void));
+        return do_sched_op(cmd, guest_handle_from_ptr(NULL, void));
 
     case SCHEDOP_shutdown:
         TRACE_3D(TRC_SCHED_SHUTDOWN,
@@ -57,8 +52,6 @@ long do_sched_op_compat(int cmd, unsigned long arg)
 /* Legacy hypercall (as of 0x00030202). */
 long do_event_channel_op_compat(XEN_GUEST_HANDLE_PARAM(evtchn_op_t) uop)
 {
-    typeof(do_event_channel_op) *fn =
-        (void *)pv_hypercall_table[__HYPERVISOR_event_channel_op].native;
     struct evtchn_op op;
 
     if ( unlikely(copy_from_guest(&op, uop, 1) != 0) )
@@ -76,7 +69,8 @@ long do_event_channel_op_compat(XEN_GUEST_HANDLE_PARAM(evtchn_op_t) uop)
     case EVTCHNOP_bind_ipi:
     case EVTCHNOP_bind_vcpu:
     case EVTCHNOP_unmask:
-        return fn(op.cmd, guest_handle_from_ptr(&uop.p->u, void));
+        return do_event_channel_op(op.cmd,
+                                   guest_handle_from_ptr(&uop.p->u, void));
 
     default:
         return -ENOSYS;
diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index 4744d9f78f01..e2709ff6e9d4 100644
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -27,6 +27,13 @@
 #include <asm/multicall.h>
 #include <irq_vectors.h>
 
+typedef struct {
+    hypercall_fn_t *native;
+#ifdef CONFIG_PV32
+    hypercall_fn_t *compat;
+#endif
+} pv_hypercall_table_t;
+
 #ifdef CONFIG_PV32
 #define HYPERCALL(x)                                                \
     [ __HYPERVISOR_ ## x ] = { (hypercall_fn_t *) do_ ## x,         \
@@ -42,7 +49,7 @@
 
 #define do_arch_1             paging_domctl_continuation
 
-const pv_hypercall_table_t pv_hypercall_table[] = {
+static const pv_hypercall_table_t pv_hypercall_table[] = {
     COMPAT_CALL(set_trap_table),
     HYPERCALL(mmu_update),
     COMPAT_CALL(set_gdt),
diff --git a/xen/arch/x86/x86_64/compat.c b/xen/arch/x86/x86_64/compat.c
index fcbc1cc0d780..0e4c71f2aa17 100644
--- a/xen/arch/x86/x86_64/compat.c
+++ b/xen/arch/x86/x86_64/compat.c
@@ -12,7 +12,6 @@ EMIT_FILE;
 #define physdev_op_t                  physdev_op_compat_t
 #define do_physdev_op                 compat_physdev_op
 #define do_physdev_op_compat(x)       compat_physdev_op_compat(_##x)
-#define native                        compat
 
 #define COMPAT
 #define _XEN_GUEST_HANDLE(t) XEN_GUEST_HANDLE(t)
diff --git a/xen/include/asm-x86/hypercall.h b/xen/include/asm-x86/hypercall.h
index 45fa987a638f..9caca272eff7 100644
--- a/xen/include/asm-x86/hypercall.h
+++ b/xen/include/asm-x86/hypercall.h
@@ -16,13 +16,6 @@ typedef unsigned long hypercall_fn_t(
     unsigned long, unsigned long, unsigned long);
 
 typedef struct {
-    hypercall_fn_t *native;
-#ifdef CONFIG_PV32
-    hypercall_fn_t *compat;
-#endif
-} pv_hypercall_table_t;
-
-typedef struct {
     uint8_t native;
 #ifdef CONFIG_COMPAT
     uint8_t compat;
@@ -32,7 +25,6 @@ typedef struct {
 extern const hypercall_args_t hypercall_args_table[NR_hypercalls];
 
 #ifdef CONFIG_PV
-extern const pv_hypercall_table_t pv_hypercall_table[];
 void pv_hypercall(struct cpu_user_regs *regs);
 #endif
 
-- 
2.11.0


