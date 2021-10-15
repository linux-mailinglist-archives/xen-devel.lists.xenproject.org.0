Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7992542F17E
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 14:52:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210480.367400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbMh5-0002En-75; Fri, 15 Oct 2021 12:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210480.367400; Fri, 15 Oct 2021 12:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbMh5-0002C9-1U; Fri, 15 Oct 2021 12:52:15 +0000
Received: by outflank-mailman (input) for mailman id 210480;
 Fri, 15 Oct 2021 12:52:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=esao=PD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mbMh4-00012o-3E
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 12:52:14 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf772da3-ce75-4130-b42e-9dba69243e60;
 Fri, 15 Oct 2021 12:52:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 879221FD53;
 Fri, 15 Oct 2021 12:52:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4627C13FC3;
 Fri, 15 Oct 2021 12:52:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uMzoD3R5aWEYHgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 15 Oct 2021 12:52:04 +0000
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
X-Inumbo-ID: bf772da3-ce75-4130-b42e-9dba69243e60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634302324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jbCrdJmB+LvvFT54GH7dIQVd+hNw2QbLXV79l4uAygg=;
	b=Imb2n1DJXmbW8+Nw9IvK8W4nTyAD8dZ/64TXvzg2JRO3rq8AbY9o/W79uNd2GDgVIW4K9h
	YaUG8AY3Kog8N3JR7Nh72w6p1u1OoeXkyWYaOQc3cgMU+DK5p/uNojB3wyXH+22l97Cx3k
	IL2HDANBd3F+CWxcDKDei9DEqHkoS/s=
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
Subject: [PATCH 08/12] x86/pv-shim: don't modify hypercall table
Date: Fri, 15 Oct 2021 14:51:48 +0200
Message-Id: <20211015125152.25198-9-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211015125152.25198-1-jgross@suse.com>
References: <20211015125152.25198-1-jgross@suse.com>
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
 xen/arch/x86/pv/shim.c        | 48 +++++++++++++++--------------------
 xen/common/event_channel.c    |  9 +++++++
 xen/common/grant_table.c      |  9 +++++++
 xen/include/asm-x86/pv/shim.h |  3 +++
 4 files changed, 42 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index d9704121a7..8f66aa3957 100644
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
@@ -845,6 +822,23 @@ static long pv_shim_grant_table_op(unsigned int cmd,
     return rc;
 }
 
+#ifndef CONFIG_GRANT_TABLE
+/* Thin wrapper(s) needed. */
+long do_grant_table_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop,
+                       unsigned int count)
+{
+    return pv_shim_grant_table_op(cmd, uop, count);
+}
+
+#ifdef CONFIG_PV32
+int compat_grant_table_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop,
+                          unsigned int count)
+{
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


