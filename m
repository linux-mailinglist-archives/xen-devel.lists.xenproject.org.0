Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83376441D4B
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 16:20:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219245.380005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ70-0001lO-8N; Mon, 01 Nov 2021 15:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219245.380005; Mon, 01 Nov 2021 15:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ70-0001iC-3d; Mon, 01 Nov 2021 15:20:38 +0000
Received: by outflank-mailman (input) for mailman id 219245;
 Mon, 01 Nov 2021 15:20:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rWtG=PU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mhZ6y-0008DA-La
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 15:20:36 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 116c999b-c4b1-46e1-b39a-854453387f59;
 Mon, 01 Nov 2021 15:20:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E2B931FD77;
 Mon,  1 Nov 2021 15:20:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9B39E13A4A;
 Mon,  1 Nov 2021 15:20:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CGOxJLUFgGFzNwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 01 Nov 2021 15:20:21 +0000
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
X-Inumbo-ID: 116c999b-c4b1-46e1-b39a-854453387f59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635780021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D7p81uvIjBLlAROdby8lQ54/U9wmyTthcMwaGdQ0Ndc=;
	b=nVqYvVo8rQ+/Hh+t2UKIFqfomIt6QFl6uXhDYzrbKptXBxV6WshW4PHSceMIcEDw6R2RSm
	XepLtmtDydDd+V/OJ+bCb+lA2b6QisAeCKoe+S87crIr/G/ag2jg/YvbuSdF58wZcBkekK
	l2bBtwL1pgb8q5uYDlYUrEx9O57Qb7A=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 09/15] x86/pv-shim: don't modify hypercall table
Date: Mon,  1 Nov 2021 16:20:09 +0100
Message-Id: <20211101152015.28488-10-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211101152015.28488-1-jgross@suse.com>
References: <20211101152015.28488-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
V2:
- add test for pv_shim to wrappers (Jan Beulich)
- add grant_table_op to hypercall table if CONFIG_PV_SHIM (Jan Beulich)
---
 xen/arch/x86/pv/hypercall.c   |  2 +-
 xen/arch/x86/pv/shim.c        | 54 +++++++++++++++++------------------
 xen/common/event_channel.c    |  9 ++++++
 xen/common/grant_table.c      |  9 ++++++
 xen/include/asm-x86/pv/shim.h |  3 ++
 5 files changed, 49 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index 7e99dbda34..abe4dd7839 100644
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -62,7 +62,7 @@ const pv_hypercall_table_t pv_hypercall_table[] = {
     COMPAT_CALL(xen_version),
     HYPERCALL(console_io),
     COMPAT_CALL(physdev_op_compat),
-#ifdef CONFIG_GRANT_TABLE
+#if defined(CONFIG_GRANT_TABLE) || defined(CONFIG_PV_SHIM)
     COMPAT_CALL(grant_table_op),
 #endif
     HYPERCALL(vm_assist),
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index d9704121a7..7e891fe2f7 100644
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
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 12006f592e..a15f986b32 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -32,6 +32,10 @@
 #include <public/event_channel.h>
 #include <xsm/xsm.h>
 
+#ifdef CONFIG_PV_SHIM
+#include <asm/guest.h>
+#endif
+
 #define ERROR_EXIT(_errno)                                          \
     do {                                                            \
         gdprintk(XENLOG_WARNING,                                    \
@@ -1190,6 +1194,11 @@ long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
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
index 49e12621ac..de097c0eda 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -45,6 +45,10 @@
 #include <asm/flushtlb.h>
 #include <asm/guest_atomics.h>
 
+#ifdef CONFIG_PV_SHIM
+#include <asm/guest.h>
+#endif
+
 /* Per-domain grant information. */
 struct grant_table {
     /*
@@ -3526,6 +3530,11 @@ do_grant_table_op(
     long rc;
     unsigned int opaque_in = cmd & GNTTABOP_ARG_MASK, opaque_out = 0;
 
+#ifdef CONFIG_PV_SHIM
+    if ( pv_shim )
+        return pv_shim_grant_table_op(cmd, uop, count);
+#endif
+
     if ( (int)count < 0 )
         return -EINVAL;
 
diff --git a/xen/include/asm-x86/pv/shim.h b/xen/include/asm-x86/pv/shim.h
index 8a91f4f9df..6415f8068e 100644
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
2.26.2


