Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 176C24BFC7E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:27:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276854.473186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMX4U-0006VS-6h; Tue, 22 Feb 2022 15:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276854.473186; Tue, 22 Feb 2022 15:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMX4U-0006St-2s; Tue, 22 Feb 2022 15:27:22 +0000
Received: by outflank-mailman (input) for mailman id 276854;
 Tue, 22 Feb 2022 15:27:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Woib=TF=citrix.com=prvs=045a4fa17=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMX4R-0006Cs-Vk
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:27:20 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea13a689-93f3-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 16:27:17 +0100 (CET)
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
X-Inumbo-ID: ea13a689-93f3-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645543638;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=z51nQbh8p48webqvVUi7jB0qENb14nHisT5IueN7PE0=;
  b=g1k3X+DsaO6abeafnV8Eae1GLaSrS3fzViWLDxZhkH01RH7l4wGyEb04
   wzLK433f2hz71DgRCf+UB2rgb3fVn5y2ZK0H8HRd2Vi8illmltiQ5AS/i
   kV7ddZuwRQW3nXET93mNM8yB9is3P+s3LGxMlclKjSEk5ulguEa9x7uzG
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65138256
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:iw+zoa4rhiI3rpnsPwwk8gxRtE/HchMFZxGqfqrLsTDasY5as4F+v
 jBNWmCCOfmPM2SheYtxYIjkpExVu8DUyNMxS1Fsqn1hHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFx2XqPp8Zj2tQy2YLjWVvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSTEigJGovcqN0UaB9+PDlzHodd1eDYdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKs2vH16wC6fJvEhWZ3ZGI3B5MNC3Sd2jcdLdRrbT
 5REMGE/NkmeC/FJEgkMOrM0suqDvXj2dzlGtgKIjoss+UGGmWSd15CyaYGIK7RmX/59nEmCo
 Xnd13/kGRxcP9uaoRKV/3TpiuLRkCfTXIMJCKb+5vNsmEeUxGEYFFsRT1TTnBWiohfgAZQFc
 RVSo3dw6/hpnKC2cjXjdz7jj16gmA4sYtNrFcsV8Ayu4LH5vBnMUwDoUQV9QNAhscY3Qxkj2
 VmIg87lCFRTjVGFdZ6O3uzK9G3vYED5OUdHPHZZFlVdv7EPtalu1kqnczp1LEKiYjQZ8xnUy
 ivCkiUxjq57YSUjh/TipgCvb95BS/H0ou8JCuf/AzrNAuBRPtfNi2mUBb7zt60owGGxFATpg
 ZT8s5LChN3i9LnU/MB3fM0DHauy+9GOOyDGjFhkEvEJrmrxpiL9LN0Num0nfC+F1/ronxezO
 yc/XisLufdu0IaCN/crM+pd9exwpUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pNgNcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4FaZPRkk0HCLeWj+u+2dd7EG3m5EMTXfjew/G7vMbZSua6MAnN08Ps/I4=
IronPort-HdrOrdr: A9a23:PR87bqiQBR3bAa2gSx7TzSvhb3BQXtgji2hC6mlwRA09TySZ//
 rBoB17726MtN9/YhEdcLy7VJVoBEmskKKdgrNhW4tKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QFJSWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="65138256"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 03/70] x86/pv-shim: Don't modify the hypercall table
Date: Tue, 22 Feb 2022 15:26:32 +0000
Message-ID: <20220222152645.8844-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220222152645.8844-1-andrew.cooper3@citrix.com>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
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
due to optimisation of the compiler.

Note that for the CONFIG_PV_SHIM_EXCLUSIVE case there is a dummy
wrapper do_grant_table_op() needed, as in this case grant_table.c
isn't being built.

Signed-off-by: Juergen Gross <jgross@suse.com>
[Split out of series.  Make compile in isolation]
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v3:
 * Identify that it is modified as a side effect of pulling it out of the
   middle of Juergen's series.
---
 xen/arch/x86/include/asm/hypercall.h     |  4 ++-
 xen/arch/x86/include/asm/pv/shim.h       |  3 ++
 xen/arch/x86/pv/hypercall.c              |  2 +-
 xen/arch/x86/pv/shim.c                   | 54 ++++++++++++++++----------------
 xen/arch/x86/x86_64/platform_hypercall.c |  2 +-
 xen/common/compat/multicall.c            |  3 +-
 xen/common/event_channel.c               |  9 ++++++
 xen/common/grant_table.c                 |  9 ++++++
 8 files changed, 54 insertions(+), 32 deletions(-)

diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
index 5d394d492318..f004824f16b6 100644
--- a/xen/arch/x86/include/asm/hypercall.h
+++ b/xen/arch/x86/include/asm/hypercall.h
@@ -145,6 +145,7 @@ do_set_segment_base(
 
 #include <compat/arch-x86/xen.h>
 #include <compat/physdev.h>
+#include <compat/platform.h>
 
 extern int
 compat_physdev_op(
@@ -161,8 +162,9 @@ extern int compat_mmuext_op(
     XEN_GUEST_HANDLE_PARAM(uint) pdone,
     unsigned int foreigndom);
 
+DEFINE_XEN_GUEST_HANDLE(compat_platform_op_t);
 extern int compat_platform_op(
-    XEN_GUEST_HANDLE_PARAM(void) u_xenpf_op);
+    XEN_GUEST_HANDLE_PARAM(compat_platform_op_t) u_xenpf_op);
 
 extern long compat_callback_op(
     int cmd, XEN_GUEST_HANDLE(void) arg);
diff --git a/xen/arch/x86/include/asm/pv/shim.h b/xen/arch/x86/include/asm/pv/shim.h
index 8a91f4f9dfbf..6415f8068e5c 100644
--- a/xen/arch/x86/include/asm/pv/shim.h
+++ b/xen/arch/x86/include/asm/pv/shim.h
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
 
diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index ecdd58deea69..50cd219c18fc 100644
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
index da88ad141a69..c9912122d1e5 100644
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
+    if ( unlikely(pv_shim) )
+        return pv_shim_event_channel_op(cmd, arg);
+#endif
+
     switch ( cmd )
     {
     case EVTCHNOP_alloc_unbound: {
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 3d92fee59285..925ed7d6bee2 100644
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
@@ -3561,6 +3565,11 @@ do_grant_table_op(
     long rc;
     unsigned int opaque_in = cmd & GNTTABOP_ARG_MASK, opaque_out = 0;
 
+#ifdef CONFIG_PV_SHIM
+    if ( unlikely(pv_shim) )
+        return pv_shim_grant_table_op(cmd, uop, count);
+#endif
+
     if ( (int)count < 0 )
         return -EINVAL;
 
-- 
2.11.0


