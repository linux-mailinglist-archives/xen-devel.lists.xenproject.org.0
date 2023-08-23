Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 950E1785116
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 09:05:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588972.920641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYhuz-0003g1-Nq; Wed, 23 Aug 2023 07:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588972.920641; Wed, 23 Aug 2023 07:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYhuz-0003dj-KI; Wed, 23 Aug 2023 07:04:41 +0000
Received: by outflank-mailman (input) for mailman id 588972;
 Wed, 23 Aug 2023 07:04:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nI0R=EI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qYhux-0003dd-Pq
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 07:04:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52a6ce10-4183-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 09:04:38 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-79-55-201-67.retail.telecomitalia.it [79.55.201.67])
 by support.bugseng.com (Postfix) with ESMTPSA id 3D6474EE0737;
 Wed, 23 Aug 2023 09:04:37 +0200 (CEST)
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
X-Inumbo-ID: 52a6ce10-4183-11ee-8783-cb3800f73035
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2] xen/hypercalls: address violations of MISRA C:2012 Rule 8.3
Date: Wed, 23 Aug 2023 09:04:30 +0200
Message-Id: <7e3abd4c0ef5127a07a60de1bf090a8aefac8e5c.1692717906.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make function declarations and definitions consistent to address
violations of MISRA C:2012 Rule 8.3 ("All declarations of an object or
function shall use the same names and type qualifiers").

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
- change compat_grant_table_op() definition instead of the declaration;
- use unsigned int for multicall()'s parameter in accordance with XEN coding
  style.
---
 xen/common/compat/grant_table.c | 22 +++++++++++-----------
 xen/common/multicall.c          |  2 +-
 xen/include/hypercall-defs.c    |  4 ++--
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/xen/common/compat/grant_table.c b/xen/common/compat/grant_table.c
index f8177c84c0..e00bc24a34 100644
--- a/xen/common/compat/grant_table.c
+++ b/xen/common/compat/grant_table.c
@@ -57,7 +57,7 @@ CHECK_gnttab_cache_flush;
 #undef xen_gnttab_cache_flush
 
 int compat_grant_table_op(
-    unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) cmp_uop, unsigned int count)
+    unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop, unsigned int count)
 {
     int rc = 0;
     unsigned int i, cmd_op;
@@ -71,7 +71,7 @@ int compat_grant_table_op(
     {
 #define CASE(name) \
     case GNTTABOP_##name: \
-        if ( unlikely(!guest_handle_okay(guest_handle_cast(cmp_uop, \
+        if ( unlikely(!guest_handle_okay(guest_handle_cast(uop, \
                                                            gnttab_##name##_compat_t), \
                                          count)) ) \
             rc = -EFAULT; \
@@ -119,7 +119,7 @@ int compat_grant_table_op(
 
 #undef CASE
     default:
-        return do_grant_table_op(cmd, cmp_uop, count);
+        return do_grant_table_op(cmd, uop, count);
     }
 
     if ( (int)count < 0 )
@@ -148,7 +148,7 @@ int compat_grant_table_op(
         case GNTTABOP_setup_table:
             if ( unlikely(count > 1) )
                 rc = -EINVAL;
-            else if ( unlikely(__copy_from_guest(&cmp.setup, cmp_uop, 1)) )
+            else if ( unlikely(__copy_from_guest(&cmp.setup, uop, 1)) )
                 rc = -EFAULT;
             else if ( unlikely(!compat_handle_okay(cmp.setup.frame_list, cmp.setup.nr_frames)) )
                 rc = -EFAULT;
@@ -193,7 +193,7 @@ int compat_grant_table_op(
                 } while (0)
                 XLAT_gnttab_setup_table(&cmp.setup, nat.setup);
 #undef XLAT_gnttab_setup_table_HNDL_frame_list
-                if ( unlikely(__copy_to_guest(cmp_uop, &cmp.setup, 1)) )
+                if ( unlikely(__copy_to_guest(uop, &cmp.setup, 1)) )
                     rc = -EFAULT;
                 else
                     i = 1;
@@ -203,7 +203,7 @@ int compat_grant_table_op(
         case GNTTABOP_transfer:
             for ( n = 0; n < COMPAT_ARG_XLAT_SIZE / sizeof(*nat.xfer) && i < count && rc == 0; ++i, ++n )
             {
-                if ( unlikely(__copy_from_guest_offset(&cmp.xfer, cmp_uop, i, 1)) )
+                if ( unlikely(__copy_from_guest_offset(&cmp.xfer, uop, i, 1)) )
                     rc = -EFAULT;
                 else
                 {
@@ -222,7 +222,7 @@ int compat_grant_table_op(
             {
                 XEN_GUEST_HANDLE_PARAM(gnttab_transfer_compat_t) xfer;
 
-                xfer = guest_handle_cast(cmp_uop, gnttab_transfer_compat_t);
+                xfer = guest_handle_cast(uop, gnttab_transfer_compat_t);
                 guest_handle_add_offset(xfer, i);
                 cnt_uop = guest_handle_cast(xfer, void);
                 while ( n-- )
@@ -237,7 +237,7 @@ int compat_grant_table_op(
         case GNTTABOP_copy:
             for ( n = 0; n < COMPAT_ARG_XLAT_SIZE / sizeof(*nat.copy) && i < count && rc == 0; ++i, ++n )
             {
-                if ( unlikely(__copy_from_guest_offset(&cmp.copy, cmp_uop, i, 1)) )
+                if ( unlikely(__copy_from_guest_offset(&cmp.copy, uop, i, 1)) )
                     rc = -EFAULT;
                 else
                 {
@@ -267,7 +267,7 @@ int compat_grant_table_op(
             {
                 XEN_GUEST_HANDLE_PARAM(gnttab_copy_compat_t) copy;
 
-                copy = guest_handle_cast(cmp_uop, gnttab_copy_compat_t);
+                copy = guest_handle_cast(uop, gnttab_copy_compat_t);
                 guest_handle_add_offset(copy, i);
                 cnt_uop = guest_handle_cast(copy, void);
                 while ( n-- )
@@ -285,7 +285,7 @@ int compat_grant_table_op(
                 rc = -EINVAL;
                 break;
             }
-            if ( unlikely(__copy_from_guest(&cmp.get_status, cmp_uop, 1) ||
+            if ( unlikely(__copy_from_guest(&cmp.get_status, uop, 1) ||
                           !compat_handle_okay(cmp.get_status.frame_list,
                                               cmp.get_status.nr_frames)) )
             {
@@ -303,7 +303,7 @@ int compat_grant_table_op(
             if ( rc >= 0 )
             {
                 XEN_GUEST_HANDLE_PARAM(gnttab_get_status_frames_compat_t) get =
-                    guest_handle_cast(cmp_uop,
+                    guest_handle_cast(uop,
                                       gnttab_get_status_frames_compat_t);
 
                 if ( unlikely(__copy_field_to_guest(get, nat.get_status,
diff --git a/xen/common/multicall.c b/xen/common/multicall.c
index 1f0cc4cb26..5330997144 100644
--- a/xen/common/multicall.c
+++ b/xen/common/multicall.c
@@ -34,7 +34,7 @@ static void trace_multicall_call(multicall_entry_t *call)
 }
 
 ret_t do_multicall(
-    XEN_GUEST_HANDLE_PARAM(multicall_entry_t) call_list, uint32_t nr_calls)
+    XEN_GUEST_HANDLE_PARAM(multicall_entry_t) call_list, unsigned int nr_calls)
 {
     struct vcpu *curr = current;
     struct mc_state *mcs = &curr->mc_state;
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 6d361ddfce..d1892fd14f 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -135,8 +135,8 @@ xenoprof_op(int op, void *arg)
 #ifdef CONFIG_COMPAT
 prefix: compat
 set_timer_op(uint32_t lo, int32_t hi)
-multicall(multicall_entry_compat_t *call_list, uint32_t nr_calls)
-memory_op(unsigned int cmd, void *arg)
+multicall(multicall_entry_compat_t *call_list, unsigned int nr_calls)
+memory_op(unsigned int cmd, void *compat)
 #ifdef CONFIG_IOREQ_SERVER
 dm_op(domid_t domid, unsigned int nr_bufs, void *bufs)
 #endif
-- 
2.34.1


