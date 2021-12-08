Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA46246D785
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 16:56:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242361.419255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzIo-0002oh-OH; Wed, 08 Dec 2021 15:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242361.419255; Wed, 08 Dec 2021 15:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzIn-0002Yv-N7; Wed, 08 Dec 2021 15:56:17 +0000
Received: by outflank-mailman (input) for mailman id 242361;
 Wed, 08 Dec 2021 15:56:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J2Or=QZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1muzIk-0001Lz-Gh
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 15:56:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dd204a4-583f-11ec-9d12-4777fae47e2b;
 Wed, 08 Dec 2021 16:56:12 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2133A1FDFC;
 Wed,  8 Dec 2021 15:56:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E6EF513F91;
 Wed,  8 Dec 2021 15:56:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KBcvN5vVsGHIXwAAMHmgww
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
X-Inumbo-ID: 5dd204a4-583f-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1638978972; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EIALndOIsMPGW+C03aHxK3+A8bGfi8rpQdK0dJq1lXo=;
	b=F2O0KfVMzGi7qjHBRUBkioSWQPYhFfgd35aEJkr92TkQ6A0H9JVickueP2ztqX/JaERtuE
	MaG4C/jsF/KazmVUsNn+VGMd4WEev6wZ0KCfZ7q2tS4mcAQTf5jq9Z5dzpUU4K6G96o9EL
	LuNJxO9oEWcWyOYyGzopF8TYn93V46s=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 08/13] xen/x86: don't use hypercall table for calling compat hypercalls
Date: Wed,  8 Dec 2021 16:56:01 +0100
Message-Id: <20211208155606.20029-9-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211208155606.20029-1-jgross@suse.com>
References: <20211208155606.20029-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index 58b202f701..939b449dec 100644
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
index abe4dd7839..c391d18130 100644
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
@@ -40,7 +47,7 @@
 #define COMPAT_CALL(x) HYPERCALL(x)
 #endif
 
-const pv_hypercall_table_t pv_hypercall_table[] = {
+static const pv_hypercall_table_t pv_hypercall_table[] = {
     COMPAT_CALL(set_trap_table),
     HYPERCALL(mmu_update),
     COMPAT_CALL(set_gdt),
diff --git a/xen/arch/x86/x86_64/compat.c b/xen/arch/x86/x86_64/compat.c
index fcbc1cc0d7..0e4c71f2aa 100644
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
index 2547572ccd..eb2907b5b6 100644
--- a/xen/include/asm-x86/hypercall.h
+++ b/xen/include/asm-x86/hypercall.h
@@ -21,13 +21,6 @@ typedef unsigned long hypercall_fn_t(
     unsigned long, unsigned long, unsigned long,
     unsigned long, unsigned long);
 
-typedef struct {
-    hypercall_fn_t *native;
-#ifdef CONFIG_PV32
-    hypercall_fn_t *compat;
-#endif
-} pv_hypercall_table_t;
-
 typedef struct {
     uint8_t native;
 #ifdef CONFIG_COMPAT
@@ -38,7 +31,6 @@ typedef struct {
 extern const hypercall_args_t hypercall_args_table[NR_hypercalls];
 
 #ifdef CONFIG_PV
-extern const pv_hypercall_table_t pv_hypercall_table[];
 void pv_hypercall(struct cpu_user_regs *regs);
 #endif
 
-- 
2.26.2


