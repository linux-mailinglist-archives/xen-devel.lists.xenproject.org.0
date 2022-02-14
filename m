Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5184B50A6
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 13:52:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271505.466008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJapk-0005Fm-4Z; Mon, 14 Feb 2022 12:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271505.466008; Mon, 14 Feb 2022 12:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJapk-0005Ch-01; Mon, 14 Feb 2022 12:52:00 +0000
Received: by outflank-mailman (input) for mailman id 271505;
 Mon, 14 Feb 2022 12:51:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJapi-0003jk-OP
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 12:51:58 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e494dfa9-8d94-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 13:51:57 +0100 (CET)
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
X-Inumbo-ID: e494dfa9-8d94-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=buQ4vU5zrwUnxyg9VsKbyngF1+pXb0VGwNc+MlpJ+mM=;
  b=bRtiKHd1uW9uN1ZelZttxi1VxjSGrZJ49jRDL2sBh0LTWHqrttE3d7Kz
   M+gQGwE8j9yupKbZWrpXcN0gCnIooy8jpKFRPwc89MZe6Yx/MQ9CV0hO1
   2jMnoSm18AhA+9dY1XakQI6crYEZlK3zKYyyC6KPdC32e7UHu5Ka1vo5I
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: uAzcBEHgs19KlcXxNtoAvTZkwZ39kwU1m9GZ9FRn48W4ZaiXUIaaipYVtaEw3ruaz5uP0Jtg4N
 SnJJ07QGeQob/LUubRxfxMc5/P4hg/FRyqkSfhiu/XYR7be/bjuLxn+UV3ln+EfVvPLw+eXj7V
 D/knoMag1kbEvJ++VjLcb1DQiSnSJkv9H3p+8e28kAXnHbD49GfHB5xDVWUeNJrbvkOmFPyVY5
 2fYTPHWKMY0Y1wEzKsJFpkknnkjKcHe8Ry/3FczqUw8sygsaRrn/Z4EStq2O05qZ17gF+sPQBD
 DRNft9JDcj11+w2Qs7aR816/
X-SBRS: 5.1
X-MesageID: 63591047
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jQSZzKuY9vLYwld9Kw/5VP2hwefnVH9ZMUV32f8akzHdYApBsoF/q
 tZmKT+GOazeMGPxLdpzbYmy8hkH7cLWmoVkHAVs/i5nQ34U+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2IThWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplrIeKGTgJJ4z1keEAdBVqVHxvHLRd0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AP
 JdIMGIzM3wsZTVKMFUrULFildutgyG4TR1qrgLNt7Q4tj27IAtZj+G2bYu9lsaxbcdahEGDv
 Urd4n/0RBodMbS32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPWZXutHg1BT4AYgGb
 RVJpGx+9sDe6XBHUPHkRCfon16dnycVXsd3H999tRCs07H9tlPx6nc/chZNb9kvtckTTDMs1
 0OUk96BOQGDoIF5WlrGqO7K8Gra1Tw9aDZbOHRaFVdtD8zL/dlr5i8jWOqPB0JcYjfdPTjri
 w6HoyEl71n4pZ5ajv7rlbwrbt/Fm3QocuLXzliNNo5GxlkgDGJAW2BPwQKFhcus1K7DEjG8U
 IEswqByFtwmA5CXjzCqS+4QBryv7PvtGGSC3QIwT8l8qmz0oCTLkWVsDNZWfhkBDyr5UWWxP
 B+7Vf15uPe/w0dGnYcoOtnsWqzGPIDrFMj/V+C8Uza9SsMZSeNzxwk3PRT49zm0yCAEyPhjU
 b/GIZfEJStLUsxPkWvpL9rxJJd2n0jSM0uIHsulp/lmuJLDDEOopUAtbgffMLBhtPncyOgXm
 v4GX/a3J9xkeLWWSkHqHUQ7dzjm9FA3WsL7rdJ5bOmGLlY0EW0tEaaJk7ggZ5Zkj+JekeKRp
 iOxXUpRyVzeg3zbKFrVNiA/Oe23BZsv/2gmOSEMPEqz3yRxa4iY86pCJYA8eqMq9bI/wKcsH
 eUFYciJHt9GVi/Dp2YGdZD4oYE7LEariAuCMjCLej86e5I8FQXF9sW9Jlnk9TUUDzrxvsw7+
 uXy2gTeSJsFZgJjEMeJN67/kwLv5SAQwbsgUVHJL99ffFTX3LJrcyGh3OUqJ8wsKAnYwmfI3
 QihHhpF9/LGpJU48YeViPnc/ZupCeZ3AmFTA3LfseStLSDf82eund1AXeKPcWyPXW/44vz/N
 +BczvW6O/wbhlda9YF7Fu8zn6454tLuoZ5czxhlQyqXPwj6VOs4LynUx9RLu41M2qRd6Fm/V
 U+489VHPamEZZH+G1kLKQt5NumO2Jn4QNUJASjZ9Kki2BJKwQ==
IronPort-HdrOrdr: A9a23:6W+QAq9A7d3sZRss+UNuk+DcI+orL9Y04lQ7vn2ZLiYlFfBw9v
 re+MjzsCWetN9/Yh0dcLy7V5VoIkm9yXcW2+cs1N6ZNWGN1VdAR7sC0aLShxHmBi3i5qp8+M
 5bAs1D4QTLfDtHZBDBkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="63591047"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 05/70] x86: Don't use the hypercall table for calling compat hypercalls
Date: Mon, 14 Feb 2022 12:50:22 +0000
Message-ID: <20220214125127.17985-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
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
 xen/arch/x86/compat.c                | 14 ++++----------
 xen/arch/x86/include/asm/hypercall.h |  8 --------
 xen/arch/x86/pv/hypercall.c          |  9 ++++++++-
 xen/arch/x86/x86_64/compat.c         |  1 -
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
diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
index f004824f16b6..eb3aed3bf70e 100644
--- a/xen/arch/x86/include/asm/hypercall.h
+++ b/xen/arch/x86/include/asm/hypercall.h
@@ -16,13 +16,6 @@ typedef unsigned long hypercall_fn_t(
     unsigned long, unsigned long);
 
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
 
diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index 50cd219c18fc..e8fbee7bbbc0 100644
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
-- 
2.11.0


