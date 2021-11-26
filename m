Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD1145EE04
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 13:35:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232664.403430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaRQ-0001HG-8d; Fri, 26 Nov 2021 12:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232664.403430; Fri, 26 Nov 2021 12:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaRQ-0001FB-5Q; Fri, 26 Nov 2021 12:35:00 +0000
Received: by outflank-mailman (input) for mailman id 232664;
 Fri, 26 Nov 2021 12:34:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqaRP-0001F5-Ai
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 12:34:59 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42b961ab-4eb5-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 13:34:57 +0100 (CET)
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
X-Inumbo-ID: 42b961ab-4eb5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637930097;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=P6+wFk0+JaJVj/ZX7SdMdgmqS7z6GuiHKgY74wOhyk8=;
  b=XXabGXOm/xDtqv/4PkD/jojExkGwr2V6komB1QEWA43hO3mZYnsr4xBl
   ELrxTZDiWfN0enjfdJaNnAtg3pD6F7c5gcgzvHDqQSNRRU+zfqYenqTIA
   UGAmvBjrmFAes1/RZYmgMFe8FcUbJNwCkS/yWndfytvJ1Qw4xzC7yCd4X
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: y72rfEu8k5kqf4e9U1JsSGxFKJTjzAjzP9VUDZbs6zDPPf3XebNHNsy5uvs12GZBBGlLSQ37XB
 Hyt3Czjj6blcFWDJYSfGIZIbHCI9Wu3ENCoEFW7wYcREIEmQ8gMqkYNZlKp/NnHz7uXRick/TI
 Qa+tAZl8858dyclEqqlsjnVdnuPj2svpQ4DVDtfZla7GXiHi1a4Tt41wG7U5HbGt2gQtDdqZxH
 HKu2h/s3OlviqiPPqGZ4V6Tc46d5mS+rMnkG/Gpeu2Q9GGt6VuZK0ZkWP5NBr6B6s2Kxu1Vd/N
 RzyGEDaTYamQRDx4DOZsZoX8
X-SBRS: 5.1
X-MesageID: 58192115
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pLZZZK8UEkcpIvaO8MPIDrUDv3mTJUtcMsCJ2f8bNWPcYEJGY0x3y
 WIdD2+OafjeMDf8LtknYIS28koDuZWAyddnTgRlrC08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrdj3NYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhS6
 cx1k6aLdTsII/Pg36dMSgd6KTlhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp0eRKeEP
 pNEAdZpRE79SjNDJm4KM8wZrO6jrV/CVQdFtk3A8MLb5ECMlVcsgdABKuH9eNOQQt5Otl2Fv
 W+A9GP8ajkKOdraxTeb/3aEgu7UgTi9SI8UDKe/9PNhnBuU3GN7NfENfQLl+7/j0Bf4Ao8Bb
 RxPksYzkUQs3G+KV+HbZSaEnF+Z4DJbGItJDc8A8B7Yn8I4/D2lLmQDSzdAbvkvu8k3WSEm2
 ze1oj/5OdB8mObLECzAr994uRv3YHFIdjFaOUfoWCNcu4G7yLzfmC4jWTqK/ESdqtTuUQ/9z
 DmRxMTVr+VC1JVbv0lXEL2uvt5NmnQrZlJqjuk0djj8hu+cWGJDT9fzgbQ8xawdRLt1tnHb4
 BA5dzG2tYji962lmi2XW/kqF7q0/fuDOzC0qQcxRMZxqWnyqiL9Ids4DNRCyKFBaZ1sldjBO
 hK7hO+szMULYCvCgVFfP+pd9PjGPYC/TI+4B5g4n/JFY4RrdR/vwc2dTRX44owZq2B1yftXE
 c7CKa6EVC9GYYw6nGveb7pMitcDm3FhrV4/sLimlnxLJ5LFPyXLIVrEWXPTBt0EAFSs/F+Ir
 o0BbpTSkH2ykoTWO0HqzGLaFnhSRVBTOHw8g5Y/mjerLlU0FWc/JeXWxL99KYVpk74MzrXD/
 22nW18ew1363CWVJQKPY3FlSbXuQZcg8i5rYX1yZQ6liyo5fIKizKYDbJ9rL7Mpw/NukKxvR
 P4fdsTeXvkWEmbb+y4QZIXWpZB5cEj5nhqHOieoOWBtf5NpSwHT1MXjew/jqHsHAiat7JNsq
 Ly8zALLB5EEQl06XsrRbfuuyXK3vGQcx70uDxeZfIELdRy1ooZwKiH3gvsmGO02KE3OlmmAy
 gKbIRYEvu2R8YU7x8bE2PKfpICzHuogQkcDRzvH7ay7PDXx93a4xdMSS/6BeD3QWT+m+KimY
 ukJnfjwPOdewQRPuot4Vb1q0bg/953koLoDllZoG3DCblKKDLJ8IybZgZkT5/MVnrIJ6xGrX
 k+v+8VBPeTbMczoJ1cdOQ45Y7nRzvoTgDTTsaw4LUiSCPWbJ1ZbvZG+5yWxtRE=
IronPort-HdrOrdr: A9a23:zMmCHq7nBwrQhNdmUgPXwMrXdLJyesId70hD6qhwISY6TiX4rb
 HWoB1173/JYVoqNE3I3OrwXZVoIkmsk6Kdg7NhXotKNTOO0ADDQb2Kr7GSpwEIcxeOkdK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.87,265,1631592000"; 
   d="scan'208";a="58192115"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Juergen Gross <jgross@suse.com>
Subject: [PATCH 02/65] x86/pv-shim: don't modify hypercall table
Date: Fri, 26 Nov 2021 12:33:43 +0000
Message-ID: <20211126123446.32324-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Juergen Gross <jgross@suse.com>

When running as pv-shim the hypercall is modified today in order to
replace the functions for __HYPERVISOR_event_channel_op and
__HYPERVISOR_grant_table_op hypercalls.

Change this to call the related functions from the normal handlers
instead when running as shim. The performance implications are not
really relevant, as a normal production hypervisor will not be
configured to support shim mode, so the related calls will be dropped
due to optimization of the compiler.

Note that for the CONFIG_PV_SHIM_EXCLUSIVE case there is a dummy
wrapper do_grant_table_op() needed, as in this case grant_table.c
isn't being built.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/pv/hypercall.c              |  2 +-
 xen/arch/x86/pv/shim.c                   | 54 ++++++++++++++++----------------
 xen/arch/x86/x86_64/platform_hypercall.c |  2 +-
 xen/common/compat/multicall.c            |  3 +-
 xen/common/event_channel.c               |  9 ++++++
 xen/common/grant_table.c                 |  9 ++++++
 xen/include/asm-x86/hypercall.h          |  4 ++-
 xen/include/asm-x86/pv/shim.h            |  3 ++
 8 files changed, 54 insertions(+), 32 deletions(-)

diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index 3579ba905c1c..4744d9f78f01 100644
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -64,7 +64,7 @@ const pv_hypercall_table_t pv_hypercall_table[] = {
     COMPAT_CALL(xen_version),
     HYPERCALL(console_io),
     COMPAT_CALL(physdev_op_compat),
-#ifdef CONFIG_GRANT_TABLE
+#if defined(CONFIG_GRANT_TABLE) || defined(CONFIG_PV_SHIM)
     COMPAT_CALL(grant_table_op),
 #endif
     HYPERCALL(vm_assist),
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index d9704121a739..7e891fe2f7a4 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -56,11 +56,6 @@ static DEFINE_SPINLOCK(balloon_lock);
 
 static struct platform_bad_page __initdata reserved_pages[2];
 
-static long pv_shim_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
-static long pv_shim_grant_table_op(unsigned int cmd,
-                                   XEN_GUEST_HANDLE_PARAM(void) uop,
-                                   unsigned int count);
-
 /*
  * By default give the shim 1MB of free memory slack. Some users may wish to
  * tune this constants for better memory utilization. This can be achieved
@@ -203,7 +198,6 @@ void __init pv_shim_setup_dom(struct domain *d, l4_pgentry_t *l4start,
                               start_info_t *si)
 {
     bool compat = is_pv_32bit_domain(d);
-    pv_hypercall_table_t *rw_pv_hypercall_table;
     uint64_t param = 0;
     long rc;
 
@@ -249,23 +243,6 @@ void __init pv_shim_setup_dom(struct domain *d, l4_pgentry_t *l4start,
         consoled_set_ring_addr(page);
     }
 
-    /*
-     * Locate pv_hypercall_table[] (usually .rodata) in the directmap (which
-     * is writeable) and insert some shim-specific hypercall handlers.
-     */
-    rw_pv_hypercall_table = __va(__pa(pv_hypercall_table));
-    rw_pv_hypercall_table[__HYPERVISOR_event_channel_op].native =
-        (hypercall_fn_t *)pv_shim_event_channel_op;
-    rw_pv_hypercall_table[__HYPERVISOR_grant_table_op].native =
-        (hypercall_fn_t *)pv_shim_grant_table_op;
-
-#ifdef CONFIG_PV32
-    rw_pv_hypercall_table[__HYPERVISOR_event_channel_op].compat =
-        (hypercall_fn_t *)pv_shim_event_channel_op;
-    rw_pv_hypercall_table[__HYPERVISOR_grant_table_op].compat =
-        (hypercall_fn_t *)pv_shim_grant_table_op;
-#endif
-
     guest = d;
 
     /*
@@ -435,7 +412,7 @@ int pv_shim_shutdown(uint8_t reason)
     return 0;
 }
 
-static long pv_shim_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+long pv_shim_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     struct domain *d = current->domain;
     struct evtchn_close close;
@@ -683,9 +660,9 @@ void pv_shim_inject_evtchn(unsigned int port)
 # define compat_handle_okay guest_handle_okay
 #endif
 
-static long pv_shim_grant_table_op(unsigned int cmd,
-                                   XEN_GUEST_HANDLE_PARAM(void) uop,
-                                   unsigned int count)
+long pv_shim_grant_table_op(unsigned int cmd,
+                            XEN_GUEST_HANDLE_PARAM(void) uop,
+                            unsigned int count)
 {
     struct domain *d = current->domain;
     long rc = 0;
@@ -845,6 +822,29 @@ static long pv_shim_grant_table_op(unsigned int cmd,
     return rc;
 }
 
+#ifndef CONFIG_GRANT_TABLE
+/* Thin wrapper(s) needed. */
+long do_grant_table_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop,
+                       unsigned int count)
+{
+    if ( !pv_shim )
+        return -ENOSYS;
+
+    return pv_shim_grant_table_op(cmd, uop, count);
+}
+
+#ifdef CONFIG_PV32
+int compat_grant_table_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop,
+                          unsigned int count)
+{
+    if ( !pv_shim )
+        return -ENOSYS;
+
+    return pv_shim_grant_table_op(cmd, uop, count);
+}
+#endif
+#endif
+
 long pv_shim_cpu_up(void *data)
 {
     struct vcpu *v = data;
diff --git a/xen/arch/x86/x86_64/platform_hypercall.c b/xen/arch/x86/x86_64/platform_hypercall.c
index fbba893a47cb..966fd27b5f22 100644
--- a/xen/arch/x86/x86_64/platform_hypercall.c
+++ b/xen/arch/x86/x86_64/platform_hypercall.c
@@ -6,8 +6,8 @@ EMIT_FILE;
 
 #include <xen/lib.h>
 #include <compat/platform.h>
+#include <xen/hypercall.h>
 
-DEFINE_XEN_GUEST_HANDLE(compat_platform_op_t);
 #define xen_platform_op     compat_platform_op
 #define xen_platform_op_t   compat_platform_op_t
 #define do_platform_op(x)   compat_platform_op(_##x)
diff --git a/xen/common/compat/multicall.c b/xen/common/compat/multicall.c
index a0e9918f4805..b17739d21829 100644
--- a/xen/common/compat/multicall.c
+++ b/xen/common/compat/multicall.c
@@ -5,7 +5,7 @@
 EMIT_FILE;
 
 #include <xen/types.h>
-#include <xen/multicall.h>
+#include <xen/hypercall.h>
 #include <xen/trace.h>
 
 #define COMPAT
@@ -19,7 +19,6 @@ static inline void xlat_multicall_entry(struct mc_state *mcs)
         mcs->compat_call.args[i] = mcs->call.args[i];
 }
 
-DEFINE_XEN_GUEST_HANDLE(multicall_entry_compat_t);
 #define multicall_entry      compat_multicall_entry
 #define multicall_entry_t    multicall_entry_compat_t
 #define do_multicall_call    compat_multicall_call
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index da88ad141a69..b38f49e0a616 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -31,6 +31,10 @@
 #include <public/event_channel.h>
 #include <xsm/xsm.h>
 
+#ifdef CONFIG_PV_SHIM
+#include <asm/guest.h>
+#endif
+
 #define ERROR_EXIT(_errno)                                          \
     do {                                                            \
         gdprintk(XENLOG_WARNING,                                    \
@@ -1189,6 +1193,11 @@ long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     int rc;
 
+#ifdef CONFIG_PV_SHIM
+    if ( pv_shim )
+        return pv_shim_event_channel_op(cmd, arg);
+#endif
+
     switch ( cmd )
     {
     case EVTCHNOP_alloc_unbound: {
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 012a74455ba6..7dfbee2f370f 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -44,6 +44,10 @@
 #include <asm/flushtlb.h>
 #include <asm/guest_atomics.h>
 
+#ifdef CONFIG_PV_SHIM
+#include <asm/guest.h>
+#endif
+
 /* Per-domain grant information. */
 struct grant_table {
     /*
@@ -3543,6 +3547,11 @@ do_grant_table_op(
     long rc;
     unsigned int opaque_in = cmd & GNTTABOP_ARG_MASK, opaque_out = 0;
 
+#ifdef CONFIG_PV_SHIM
+    if ( pv_shim )
+        return pv_shim_grant_table_op(cmd, uop, count);
+#endif
+
     if ( (int)count < 0 )
         return -EINVAL;
 
diff --git a/xen/include/asm-x86/hypercall.h b/xen/include/asm-x86/hypercall.h
index 0ae3b8b043b2..45fa987a638f 100644
--- a/xen/include/asm-x86/hypercall.h
+++ b/xen/include/asm-x86/hypercall.h
@@ -161,8 +161,10 @@ extern int compat_mmuext_op(
     XEN_GUEST_HANDLE_PARAM(uint) pdone,
     unsigned int foreigndom);
 
+typedef struct compat_platform_op compat_platform_op_t;
+DEFINE_XEN_GUEST_HANDLE(compat_platform_op_t);
 extern int compat_platform_op(
-    XEN_GUEST_HANDLE_PARAM(void) u_xenpf_op);
+    XEN_GUEST_HANDLE_PARAM(compat_platform_op_t) u_xenpf_op);
 
 extern long compat_callback_op(
     int cmd, XEN_GUEST_HANDLE(void) arg);
diff --git a/xen/include/asm-x86/pv/shim.h b/xen/include/asm-x86/pv/shim.h
index 8a91f4f9dfbf..6415f8068e5c 100644
--- a/xen/include/asm-x86/pv/shim.h
+++ b/xen/include/asm-x86/pv/shim.h
@@ -19,6 +19,7 @@
 #ifndef __X86_PV_SHIM_H__
 #define __X86_PV_SHIM_H__
 
+#include <xen/hypercall.h>
 #include <xen/types.h>
 
 #if defined(CONFIG_PV_SHIM_EXCLUSIVE)
@@ -45,6 +46,8 @@ domid_t get_initial_domain_id(void);
 uint64_t pv_shim_mem(uint64_t avail);
 void pv_shim_fixup_e820(struct e820map *e820);
 const struct platform_bad_page *pv_shim_reserved_pages(unsigned int *size);
+typeof(do_event_channel_op) pv_shim_event_channel_op;
+typeof(do_grant_table_op) pv_shim_grant_table_op;
 
 #else
 
-- 
2.11.0


