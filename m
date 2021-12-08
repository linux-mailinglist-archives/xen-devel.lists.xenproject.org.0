Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EA646D783
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 16:56:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242360.419242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzIn-0002Yt-8S; Wed, 08 Dec 2021 15:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242360.419242; Wed, 08 Dec 2021 15:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzIm-0002Ki-R9; Wed, 08 Dec 2021 15:56:16 +0000
Received: by outflank-mailman (input) for mailman id 242360;
 Wed, 08 Dec 2021 15:56:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J2Or=QZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1muzIk-0001LM-6Y
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 15:56:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5db621af-583f-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 16:56:12 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E0C781FD5B;
 Wed,  8 Dec 2021 15:56:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A8B8413C8E;
 Wed,  8 Dec 2021 15:56:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4DkdKJvVsGHIXwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 08 Dec 2021 15:56:11 +0000
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
X-Inumbo-ID: 5db621af-583f-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1638978971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nEFyO5REy98yyXsf4CZGnr9ARPg0xXVeuhj3Ow7aEFk=;
	b=LTGeeP9QCTW2+cX+mEPR9joCgQvdR6Blyo2yOC9blPOIQxB2Q3CcgDsBZw7zGzuNrrGbQG
	7+Lgh4j5cJWlpgMYIR944ZV03lxi99EwTOBlgpQOySZ0QgBQa2aWH6JikTNOriff7sLrJl
	ivjLi5ue6NxKgZgFJYX0plwdguR7F0I=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 07/13] x86/pv-shim: don't modify hypercall table
Date: Wed,  8 Dec 2021 16:56:00 +0100
Message-Id: <20211208155606.20029-8-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211208155606.20029-1-jgross@suse.com>
References: <20211208155606.20029-1-jgross@suse.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V2:
- add test for pv_shim to wrappers (Jan Beulich)
- add grant_table_op to hypercall table if CONFIG_PV_SHIM (Jan Beulich)
V3:
- add [un]likely() to pv_shim tests (Jan Beulich)
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
index d9704121a7..9a4a257d4c 100644
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
+    if ( likely(!pv_shim) )
+        return -ENOSYS;
+
+    return pv_shim_grant_table_op(cmd, uop, count);
+}
+
+#ifdef CONFIG_PV32
+int compat_grant_table_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop,
+                          unsigned int count)
+{
+    if ( likely(!pv_shim) )
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
index 12006f592e..0e4973f800 100644
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
+    if ( unlikely(pv_shim) )
+        return pv_shim_event_channel_op(cmd, arg);
+#endif
+
     switch ( cmd )
     {
     case EVTCHNOP_alloc_unbound: {
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 4d8adf7faa..e5641608ad 100644
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
@@ -3543,6 +3547,11 @@ do_grant_table_op(
     long rc;
     unsigned int opaque_in = cmd & GNTTABOP_ARG_MASK, opaque_out = 0;
 
+#ifdef CONFIG_PV_SHIM
+    if ( unlikely(pv_shim) )
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


