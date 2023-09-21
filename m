Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CCC7A9414
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 14:12:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606333.944186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjIX1-0005Dy-IM; Thu, 21 Sep 2023 12:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606333.944186; Thu, 21 Sep 2023 12:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjIX1-0005Ap-FU; Thu, 21 Sep 2023 12:11:43 +0000
Received: by outflank-mailman (input) for mailman id 606333;
 Thu, 21 Sep 2023 12:11:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWz/=FF=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qjIX0-0004uB-0F
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 12:11:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 055763e4-5878-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 14:11:40 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-82-50-59-70.retail.telecomitalia.it [82.50.59.70])
 by support.bugseng.com (Postfix) with ESMTPSA id A9FFB4EE073F;
 Thu, 21 Sep 2023 14:11:39 +0200 (CEST)
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
X-Inumbo-ID: 055763e4-5878-11ee-878a-cb3800f73035
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
Subject: [XEN PATCH v3] xen/hypercalls: address violations of MISRA C:2012 Rule 8.3
Date: Thu, 21 Sep 2023 14:11:24 +0200
Message-Id: <2c3e9469b3e59c7c4d0128320515f2b3df2b4c1c.1695297383.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make function declarations and definitions consistent.
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v3:
- removed changes involving types with fixed/unfixed width;
- uniformed parameter names of compat_memory_op() with {do,hvm}_memory_op().
---
Changes in v2:
- change compat_grant_table_op() definition instead of the declaration;
- use unsigned int for multicall()'s parameter in accordance with XEN
  coding style.
---
---
 xen/common/compat/grant_table.c | 22 +++++++++---------
 xen/common/compat/memory.c      | 40 ++++++++++++++++-----------------
 2 files changed, 31 insertions(+), 31 deletions(-)

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
diff --git a/xen/common/compat/memory.c b/xen/common/compat/memory.c
index 8c34f201c2..45e5fb0e5d 100644
--- a/xen/common/compat/memory.c
+++ b/xen/common/compat/memory.c
@@ -54,7 +54,7 @@ static int cf_check get_reserved_device_memory(
 }
 #endif
 
-int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
+int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     struct vcpu *curr = current;
     struct domain *currd = curr->domain;
@@ -96,7 +96,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
         case XENMEM_increase_reservation:
         case XENMEM_decrease_reservation:
         case XENMEM_populate_physmap:
-            if ( copy_from_guest(&cmp.rsrv, compat, 1) )
+            if ( copy_from_guest(&cmp.rsrv, arg, 1) )
                 return start_extent;
 
             /* Is size too large for us to encode a continuation? */
@@ -158,7 +158,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
         {
             int order_delta;
 
-            if ( copy_from_guest(&cmp.xchg, compat, 1) )
+            if ( copy_from_guest(&cmp.xchg, arg, 1) )
                 return -EFAULT;
 
             order_delta = cmp.xchg.out.extent_order - cmp.xchg.in.extent_order;
@@ -241,14 +241,14 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
         case XENMEM_maximum_reservation:
         case XENMEM_maximum_gpfn:
         case XENMEM_maximum_ram_page:
-            nat.hnd = compat;
+            nat.hnd = arg;
             break;
 
         case XENMEM_add_to_physmap:
             BUILD_BUG_ON((typeof(cmp.atp.size))-1 >
                          (UINT_MAX >> MEMOP_EXTENT_SHIFT));
 
-            if ( copy_from_guest(&cmp.atp, compat, 1) )
+            if ( copy_from_guest(&cmp.atp, arg, 1) )
                 return -EFAULT;
 
             XLAT_add_to_physmap(nat.atp, &cmp.atp);
@@ -271,7 +271,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
             enum XLAT_add_to_physmap_batch_u u =
                 XLAT_add_to_physmap_batch_u_res0;
 
-            if ( copy_from_guest(&cmp.atpb, compat, 1) )
+            if ( copy_from_guest(&cmp.atpb, arg, 1) )
                 return -EFAULT;
             size = cmp.atpb.size;
             if ( !compat_handle_okay(cmp.atpb.idxs, size) ||
@@ -322,7 +322,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
 
         case XENMEM_remove_from_physmap:
         {
-            if ( copy_from_guest(&cmp.xrfp, compat, 1) )
+            if ( copy_from_guest(&cmp.xrfp, arg, 1) )
                 return -EFAULT;
 
             XLAT_remove_from_physmap(nat.xrfp, &cmp.xrfp);
@@ -331,7 +331,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
         }
 
         case XENMEM_access_op:
-            if ( copy_from_guest(&cmp.mao, compat, 1) )
+            if ( copy_from_guest(&cmp.mao, arg, 1) )
                 return -EFAULT;
             
 #define XLAT_mem_access_op_HNDL_pfn_list(_d_, _s_)                      \
@@ -355,7 +355,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
             enum XLAT_vnuma_topology_info_vmemrange vmemrange =
                 XLAT_vnuma_topology_info_vmemrange_h;
 
-            if ( copy_from_guest(&cmp.vnuma, compat, 1) )
+            if ( copy_from_guest(&cmp.vnuma, arg, 1) )
                 return -EFAULT;
 
 #define XLAT_vnuma_topology_info_HNDL_vdistance_h(_d_, _s_)		\
@@ -381,7 +381,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
             if ( unlikely(start_extent) )
                 return -EINVAL;
 
-            if ( copy_from_guest(&grdm.map, compat, 1) ||
+            if ( copy_from_guest(&grdm.map, arg, 1) ||
                  !compat_handle_okay(grdm.map.buffer, grdm.map.nr_entries) )
                 return -EFAULT;
 
@@ -395,7 +395,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
             if ( !rc && grdm.map.nr_entries < grdm.used_entries )
                 rc = -ENOBUFS;
             grdm.map.nr_entries = grdm.used_entries;
-            if ( __copy_to_guest(compat, &grdm.map, 1) )
+            if ( __copy_to_guest(arg, &grdm.map, 1) )
                 rc = -EFAULT;
 
             return rc;
@@ -406,7 +406,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
         {
             xen_pfn_t *xen_frame_list = NULL;
 
-            if ( copy_from_guest(&cmp.mar, compat, 1) )
+            if ( copy_from_guest(&cmp.mar, arg, 1) )
                 return -EFAULT;
 
             /* Marshal the frame list in the remainder of the xlat space. */
@@ -470,7 +470,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
             break;
         }
         default:
-            return compat_arch_memory_op(cmd, compat);
+            return compat_arch_memory_op(cmd, arg);
         }
 
         rc = do_memory_op(cmd, nat.hnd);
@@ -481,14 +481,14 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
                 cmp.vnuma.nr_vnodes = nat.vnuma->nr_vnodes;
                 cmp.vnuma.nr_vcpus = nat.vnuma->nr_vcpus;
                 cmp.vnuma.nr_vmemranges = nat.vnuma->nr_vmemranges;
-                if ( __copy_to_guest(compat, &cmp.vnuma, 1) )
+                if ( __copy_to_guest(arg, &cmp.vnuma, 1) )
                     rc = -EFAULT;
             }
             break;
         }
 
         cmd = 0;
-        if ( hypercall_xlat_continuation(&cmd, 2, 0x02, nat.hnd, compat) )
+        if ( hypercall_xlat_continuation(&cmd, 2, 0x02, nat.hnd, arg) )
         {
             BUG_ON(rc != __HYPERVISOR_memory_op);
             BUG_ON((cmd & MEMOP_CMD_MASK) != op);
@@ -573,7 +573,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
             }
 
             cmp.xchg.nr_exchanged = nat.xchg->nr_exchanged;
-            if ( __copy_field_to_guest(guest_handle_cast(compat,
+            if ( __copy_field_to_guest(guest_handle_cast(arg,
                                                          compat_memory_exchange_t),
                                        &cmp.xchg, nr_exchanged) )
                 rc = -EFAULT;
@@ -605,7 +605,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
             cmp.vnuma.nr_vnodes = nat.vnuma->nr_vnodes;
             cmp.vnuma.nr_vcpus = nat.vnuma->nr_vcpus;
             cmp.vnuma.nr_vmemranges = nat.vnuma->nr_vmemranges;
-            if ( __copy_to_guest(compat, &cmp.vnuma, 1) )
+            if ( __copy_to_guest(arg, &cmp.vnuma, 1) )
                 rc = -EFAULT;
             break;
 
@@ -618,7 +618,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
             {
                 ASSERT(split == 0 && rc == 0);
                 if ( __copy_field_to_guest(
-                         guest_handle_cast(compat,
+                         guest_handle_cast(arg,
                                            compat_mem_acquire_resource_t),
                          nat.mar, nr_frames) )
                     return -EFAULT;
@@ -707,7 +707,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
             if ( done < nat.mar->nr_frames )
                 return hypercall_create_continuation(
                     __HYPERVISOR_memory_op, "ih",
-                    op | (start_extent << MEMOP_EXTENT_SHIFT), compat);
+                    op | (start_extent << MEMOP_EXTENT_SHIFT), arg);
 
             /*
              * Well... Somethings gone wrong with the two levels of chunking.
@@ -728,7 +728,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
         cmd = op | (start_extent << MEMOP_EXTENT_SHIFT);
         if ( split > 0 && hypercall_preempt_check() )
             return hypercall_create_continuation(
-                __HYPERVISOR_memory_op, "ih", cmd, compat);
+                __HYPERVISOR_memory_op, "ih", cmd, arg);
     } while ( split > 0 );
 
     if ( unlikely(rc > INT_MAX) )
-- 
2.34.1


