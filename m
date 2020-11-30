Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C452C823E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:32:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40831.73852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgUA-0001Em-Ap; Mon, 30 Nov 2020 10:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40831.73852; Mon, 30 Nov 2020 10:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgUA-0001Dz-3a; Mon, 30 Nov 2020 10:32:46 +0000
Received: by outflank-mailman (input) for mailman id 40831;
 Mon, 30 Nov 2020 10:32:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avKr=FE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kjgU9-0000Uu-D0
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:32:45 +0000
Received: from mail-lj1-x233.google.com (unknown [2a00:1450:4864:20::233])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79765296-9490-4b12-9b66-dbbc61d640c0;
 Mon, 30 Nov 2020 10:32:08 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id t22so17072185ljk.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Nov 2020 02:32:08 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 136sm2399393lfb.62.2020.11.30.02.32.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 02:32:06 -0800 (PST)
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
X-Inumbo-ID: 79765296-9490-4b12-9b66-dbbc61d640c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jmfuLLn6VZhTTj/XRd0e2QYAXx4n0t7Wv41UBmA+aUQ=;
        b=DkMEJ+/hAYMWc7ygU6SikW0OL+fcT2FOueY1DqxM1hhwt0kDHOxr3zPTGvTqfthyTb
         EONZ2ugtLWdlijN3cV6fljiPYD0lKvWOEBq9DHgWqVF6QoiHULR2qgUSL0cEGP51czEG
         AwmD+9ScD4j9mIBzfNcbG9KSOjMp86DLPscfkitArneWhumOMaigj/4ymithTdjzh8fX
         Gv6MQBRNaKhXZt8jxLca7UOuTgwlTPzKmNeBBIcU8xpxYLVv83gDw7rn3xip4iefM4Si
         oQSog4d87s4+LSB0RDCVmuIvNly9AVKOF8cxn1gPPQh0qbE0T3EAwnNCKSpJER62/hc7
         npjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jmfuLLn6VZhTTj/XRd0e2QYAXx4n0t7Wv41UBmA+aUQ=;
        b=cW4EcR3islnK2sA0y9WP/g7nNqTYjtfsp9+gbpL7W041and1gYMdgcXl/FRj/wg7z5
         j+aoVYjX0EdEhhqqEpCzeEWlqVfXsk26aLXm4Ejgl5iPnq/CTzuxWpCepcHpp/F/m1B4
         yiO/yLdDc46wFafK586hn1mFYeUa0YoxQyoqokg8ufUIYkn9/6O7CIXzdCVZYOh8NIVM
         EAbtyOzOe6pKLNwtnck0+ASpm5Yo1VWMGdHTGvg664BlPKoyGt8pxZZJJ892O/eTn5Gq
         CMTx29ZY9kcjUrcEIoWV7JypIf9ii75omkiuZO8cqm8m1BcJblzf7G85bJGRciZZA4Le
         uBsg==
X-Gm-Message-State: AOAM533ne1LEublDo2mDwLXUZxbss0zAf04il9MhVltave497JiEzZKX
	iRN6W+cRIkcQeIuM/5q8kBkxdthMq57u9w==
X-Google-Smtp-Source: ABdhPJxG/YFNMEt3pHjJaZUIojgOCRGKzKOKXPksO1pbmwPbAjKmp2ZkXAI13wN8Co2FqBbyfqmrjA==
X-Received: by 2002:a2e:814a:: with SMTP id t10mr9735200ljg.30.1606732327338;
        Mon, 30 Nov 2020 02:32:07 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V3 09/23] xen/dm: Make x86's DM feature common
Date: Mon, 30 Nov 2020 12:31:24 +0200
Message-Id: <1606732298-22107-10-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>

From: Julien Grall <julien.grall@arm.com>

As a lot of x86 code can be re-used on Arm later on, this patch
splits devicemodel support into common and arch specific parts.

The common DM feature is supposed to be built with IOREQ_SERVER
option enabled (as well as the IOREQ feature), which is selected
for x86's config HVM for now.

Also update XSM code a bit to let DM op be used on Arm.

This support is going to be used on Arm to be able run device
emulator outside of Xen hypervisor.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - update XSM, related changes were pulled from:
     [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for IOREQ/DM features

Changes V1 -> V2:
   - update the author of a patch
   - update patch description
   - introduce xen/dm.h and move definitions here

Changes V2 -> V3:
   - no changes
---
---
 xen/arch/x86/hvm/dm.c   | 291 ++++--------------------------------------------
 xen/common/Makefile     |   1 +
 xen/common/dm.c         | 291 ++++++++++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/dm.h    |  44 ++++++++
 xen/include/xsm/dummy.h |   4 +-
 xen/include/xsm/xsm.h   |   6 +-
 xen/xsm/dummy.c         |   2 +-
 xen/xsm/flask/hooks.c   |   5 +-
 8 files changed, 364 insertions(+), 280 deletions(-)
 create mode 100644 xen/common/dm.c
 create mode 100644 xen/include/xen/dm.h

diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index 71f5ca4..35f860a 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -16,6 +16,7 @@
 
 #include <xen/event.h>
 #include <xen/guest_access.h>
+#include <xen/dm.h>
 #include <xen/hypercall.h>
 #include <xen/nospec.h>
 #include <xen/sched.h>
@@ -29,13 +30,6 @@
 
 #include <public/hvm/hvm_op.h>
 
-struct dmop_args {
-    domid_t domid;
-    unsigned int nr_bufs;
-    /* Reserve enough buf elements for all current hypercalls. */
-    struct xen_dm_op_buf buf[2];
-};
-
 static bool _raw_copy_from_guest_buf_offset(void *dst,
                                             const struct dmop_args *args,
                                             unsigned int buf_idx,
@@ -338,148 +332,20 @@ static int inject_event(struct domain *d,
     return 0;
 }
 
-static int dm_op(const struct dmop_args *op_args)
+int arch_dm_op(struct xen_dm_op *op, struct domain *d,
+               const struct dmop_args *op_args, bool *const_op)
 {
-    struct domain *d;
-    struct xen_dm_op op;
-    bool const_op = true;
     long rc;
-    size_t offset;
-
-    static const uint8_t op_size[] = {
-        [XEN_DMOP_create_ioreq_server]              = sizeof(struct xen_dm_op_create_ioreq_server),
-        [XEN_DMOP_get_ioreq_server_info]            = sizeof(struct xen_dm_op_get_ioreq_server_info),
-        [XEN_DMOP_map_io_range_to_ioreq_server]     = sizeof(struct xen_dm_op_ioreq_server_range),
-        [XEN_DMOP_unmap_io_range_from_ioreq_server] = sizeof(struct xen_dm_op_ioreq_server_range),
-        [XEN_DMOP_set_ioreq_server_state]           = sizeof(struct xen_dm_op_set_ioreq_server_state),
-        [XEN_DMOP_destroy_ioreq_server]             = sizeof(struct xen_dm_op_destroy_ioreq_server),
-        [XEN_DMOP_track_dirty_vram]                 = sizeof(struct xen_dm_op_track_dirty_vram),
-        [XEN_DMOP_set_pci_intx_level]               = sizeof(struct xen_dm_op_set_pci_intx_level),
-        [XEN_DMOP_set_isa_irq_level]                = sizeof(struct xen_dm_op_set_isa_irq_level),
-        [XEN_DMOP_set_pci_link_route]               = sizeof(struct xen_dm_op_set_pci_link_route),
-        [XEN_DMOP_modified_memory]                  = sizeof(struct xen_dm_op_modified_memory),
-        [XEN_DMOP_set_mem_type]                     = sizeof(struct xen_dm_op_set_mem_type),
-        [XEN_DMOP_inject_event]                     = sizeof(struct xen_dm_op_inject_event),
-        [XEN_DMOP_inject_msi]                       = sizeof(struct xen_dm_op_inject_msi),
-        [XEN_DMOP_map_mem_type_to_ioreq_server]     = sizeof(struct xen_dm_op_map_mem_type_to_ioreq_server),
-        [XEN_DMOP_remote_shutdown]                  = sizeof(struct xen_dm_op_remote_shutdown),
-        [XEN_DMOP_relocate_memory]                  = sizeof(struct xen_dm_op_relocate_memory),
-        [XEN_DMOP_pin_memory_cacheattr]             = sizeof(struct xen_dm_op_pin_memory_cacheattr),
-    };
-
-    rc = rcu_lock_remote_domain_by_id(op_args->domid, &d);
-    if ( rc )
-        return rc;
-
-    if ( !is_hvm_domain(d) )
-        goto out;
-
-    rc = xsm_dm_op(XSM_DM_PRIV, d);
-    if ( rc )
-        goto out;
-
-    offset = offsetof(struct xen_dm_op, u);
-
-    rc = -EFAULT;
-    if ( op_args->buf[0].size < offset )
-        goto out;
-
-    if ( copy_from_guest_offset((void *)&op, op_args->buf[0].h, 0, offset) )
-        goto out;
-
-    if ( op.op >= ARRAY_SIZE(op_size) )
-    {
-        rc = -EOPNOTSUPP;
-        goto out;
-    }
-
-    op.op = array_index_nospec(op.op, ARRAY_SIZE(op_size));
-
-    if ( op_args->buf[0].size < offset + op_size[op.op] )
-        goto out;
-
-    if ( copy_from_guest_offset((void *)&op.u, op_args->buf[0].h, offset,
-                                op_size[op.op]) )
-        goto out;
-
-    rc = -EINVAL;
-    if ( op.pad )
-        goto out;
-
-    switch ( op.op )
-    {
-    case XEN_DMOP_create_ioreq_server:
-    {
-        struct xen_dm_op_create_ioreq_server *data =
-            &op.u.create_ioreq_server;
-
-        const_op = false;
-
-        rc = -EINVAL;
-        if ( data->pad[0] || data->pad[1] || data->pad[2] )
-            break;
-
-        rc = hvm_create_ioreq_server(d, data->handle_bufioreq,
-                                     &data->id);
-        break;
-    }
 
-    case XEN_DMOP_get_ioreq_server_info:
+    switch ( op->op )
     {
-        struct xen_dm_op_get_ioreq_server_info *data =
-            &op.u.get_ioreq_server_info;
-        const uint16_t valid_flags = XEN_DMOP_no_gfns;
-
-        const_op = false;
-
-        rc = -EINVAL;
-        if ( data->flags & ~valid_flags )
-            break;
-
-        rc = hvm_get_ioreq_server_info(d, data->id,
-                                       (data->flags & XEN_DMOP_no_gfns) ?
-                                       NULL : &data->ioreq_gfn,
-                                       (data->flags & XEN_DMOP_no_gfns) ?
-                                       NULL : &data->bufioreq_gfn,
-                                       &data->bufioreq_port);
-        break;
-    }
-
-    case XEN_DMOP_map_io_range_to_ioreq_server:
-    {
-        const struct xen_dm_op_ioreq_server_range *data =
-            &op.u.map_io_range_to_ioreq_server;
-
-        rc = -EINVAL;
-        if ( data->pad )
-            break;
-
-        rc = hvm_map_io_range_to_ioreq_server(d, data->id, data->type,
-                                              data->start, data->end);
-        break;
-    }
-
-    case XEN_DMOP_unmap_io_range_from_ioreq_server:
-    {
-        const struct xen_dm_op_ioreq_server_range *data =
-            &op.u.unmap_io_range_from_ioreq_server;
-
-        rc = -EINVAL;
-        if ( data->pad )
-            break;
-
-        rc = hvm_unmap_io_range_from_ioreq_server(d, data->id, data->type,
-                                                  data->start, data->end);
-        break;
-    }
-
     case XEN_DMOP_map_mem_type_to_ioreq_server:
     {
         struct xen_dm_op_map_mem_type_to_ioreq_server *data =
-            &op.u.map_mem_type_to_ioreq_server;
+            &op->u.map_mem_type_to_ioreq_server;
         unsigned long first_gfn = data->opaque;
 
-        const_op = false;
+        *const_op = false;
 
         rc = -EOPNOTSUPP;
         if ( !hap_enabled(d) )
@@ -523,36 +389,10 @@ static int dm_op(const struct dmop_args *op_args)
         break;
     }
 
-    case XEN_DMOP_set_ioreq_server_state:
-    {
-        const struct xen_dm_op_set_ioreq_server_state *data =
-            &op.u.set_ioreq_server_state;
-
-        rc = -EINVAL;
-        if ( data->pad )
-            break;
-
-        rc = hvm_set_ioreq_server_state(d, data->id, !!data->enabled);
-        break;
-    }
-
-    case XEN_DMOP_destroy_ioreq_server:
-    {
-        const struct xen_dm_op_destroy_ioreq_server *data =
-            &op.u.destroy_ioreq_server;
-
-        rc = -EINVAL;
-        if ( data->pad )
-            break;
-
-        rc = hvm_destroy_ioreq_server(d, data->id);
-        break;
-    }
-
     case XEN_DMOP_track_dirty_vram:
     {
         const struct xen_dm_op_track_dirty_vram *data =
-            &op.u.track_dirty_vram;
+            &op->u.track_dirty_vram;
 
         rc = -EINVAL;
         if ( data->pad )
@@ -568,7 +408,7 @@ static int dm_op(const struct dmop_args *op_args)
     case XEN_DMOP_set_pci_intx_level:
     {
         const struct xen_dm_op_set_pci_intx_level *data =
-            &op.u.set_pci_intx_level;
+            &op->u.set_pci_intx_level;
 
         rc = set_pci_intx_level(d, data->domain, data->bus,
                                 data->device, data->intx,
@@ -579,7 +419,7 @@ static int dm_op(const struct dmop_args *op_args)
     case XEN_DMOP_set_isa_irq_level:
     {
         const struct xen_dm_op_set_isa_irq_level *data =
-            &op.u.set_isa_irq_level;
+            &op->u.set_isa_irq_level;
 
         rc = set_isa_irq_level(d, data->isa_irq, data->level);
         break;
@@ -588,7 +428,7 @@ static int dm_op(const struct dmop_args *op_args)
     case XEN_DMOP_set_pci_link_route:
     {
         const struct xen_dm_op_set_pci_link_route *data =
-            &op.u.set_pci_link_route;
+            &op->u.set_pci_link_route;
 
         rc = hvm_set_pci_link_route(d, data->link, data->isa_irq);
         break;
@@ -597,19 +437,19 @@ static int dm_op(const struct dmop_args *op_args)
     case XEN_DMOP_modified_memory:
     {
         struct xen_dm_op_modified_memory *data =
-            &op.u.modified_memory;
+            &op->u.modified_memory;
 
         rc = modified_memory(d, op_args, data);
-        const_op = !rc;
+        *const_op = !rc;
         break;
     }
 
     case XEN_DMOP_set_mem_type:
     {
         struct xen_dm_op_set_mem_type *data =
-            &op.u.set_mem_type;
+            &op->u.set_mem_type;
 
-        const_op = false;
+        *const_op = false;
 
         rc = -EINVAL;
         if ( data->pad )
@@ -622,7 +462,7 @@ static int dm_op(const struct dmop_args *op_args)
     case XEN_DMOP_inject_event:
     {
         const struct xen_dm_op_inject_event *data =
-            &op.u.inject_event;
+            &op->u.inject_event;
 
         rc = -EINVAL;
         if ( data->pad0 || data->pad1 )
@@ -635,7 +475,7 @@ static int dm_op(const struct dmop_args *op_args)
     case XEN_DMOP_inject_msi:
     {
         const struct xen_dm_op_inject_msi *data =
-            &op.u.inject_msi;
+            &op->u.inject_msi;
 
         rc = -EINVAL;
         if ( data->pad )
@@ -648,7 +488,7 @@ static int dm_op(const struct dmop_args *op_args)
     case XEN_DMOP_remote_shutdown:
     {
         const struct xen_dm_op_remote_shutdown *data =
-            &op.u.remote_shutdown;
+            &op->u.remote_shutdown;
 
         domain_shutdown(d, data->reason);
         rc = 0;
@@ -657,7 +497,7 @@ static int dm_op(const struct dmop_args *op_args)
 
     case XEN_DMOP_relocate_memory:
     {
-        struct xen_dm_op_relocate_memory *data = &op.u.relocate_memory;
+        struct xen_dm_op_relocate_memory *data = &op->u.relocate_memory;
         struct xen_add_to_physmap xatp = {
             .domid = op_args->domid,
             .size = data->size,
@@ -680,7 +520,7 @@ static int dm_op(const struct dmop_args *op_args)
             data->size -= rc;
             data->src_gfn += rc;
             data->dst_gfn += rc;
-            const_op = false;
+            *const_op = false;
             rc = -ERESTART;
         }
         break;
@@ -689,7 +529,7 @@ static int dm_op(const struct dmop_args *op_args)
     case XEN_DMOP_pin_memory_cacheattr:
     {
         const struct xen_dm_op_pin_memory_cacheattr *data =
-            &op.u.pin_memory_cacheattr;
+            &op->u.pin_memory_cacheattr;
 
         if ( data->pad )
         {
@@ -707,97 +547,6 @@ static int dm_op(const struct dmop_args *op_args)
         break;
     }
 
-    if ( (!rc || rc == -ERESTART) &&
-         !const_op && copy_to_guest_offset(op_args->buf[0].h, offset,
-                                           (void *)&op.u, op_size[op.op]) )
-        rc = -EFAULT;
-
- out:
-    rcu_unlock_domain(d);
-
-    return rc;
-}
-
-#include <compat/hvm/dm_op.h>
-
-CHECK_dm_op_create_ioreq_server;
-CHECK_dm_op_get_ioreq_server_info;
-CHECK_dm_op_ioreq_server_range;
-CHECK_dm_op_set_ioreq_server_state;
-CHECK_dm_op_destroy_ioreq_server;
-CHECK_dm_op_track_dirty_vram;
-CHECK_dm_op_set_pci_intx_level;
-CHECK_dm_op_set_isa_irq_level;
-CHECK_dm_op_set_pci_link_route;
-CHECK_dm_op_modified_memory;
-CHECK_dm_op_set_mem_type;
-CHECK_dm_op_inject_event;
-CHECK_dm_op_inject_msi;
-CHECK_dm_op_map_mem_type_to_ioreq_server;
-CHECK_dm_op_remote_shutdown;
-CHECK_dm_op_relocate_memory;
-CHECK_dm_op_pin_memory_cacheattr;
-
-int compat_dm_op(domid_t domid,
-                 unsigned int nr_bufs,
-                 XEN_GUEST_HANDLE_PARAM(void) bufs)
-{
-    struct dmop_args args;
-    unsigned int i;
-    int rc;
-
-    if ( nr_bufs > ARRAY_SIZE(args.buf) )
-        return -E2BIG;
-
-    args.domid = domid;
-    args.nr_bufs = array_index_nospec(nr_bufs, ARRAY_SIZE(args.buf) + 1);
-
-    for ( i = 0; i < args.nr_bufs; i++ )
-    {
-        struct compat_dm_op_buf cmp;
-
-        if ( copy_from_guest_offset(&cmp, bufs, i, 1) )
-            return -EFAULT;
-
-#define XLAT_dm_op_buf_HNDL_h(_d_, _s_) \
-        guest_from_compat_handle((_d_)->h, (_s_)->h)
-
-        XLAT_dm_op_buf(&args.buf[i], &cmp);
-
-#undef XLAT_dm_op_buf_HNDL_h
-    }
-
-    rc = dm_op(&args);
-
-    if ( rc == -ERESTART )
-        rc = hypercall_create_continuation(__HYPERVISOR_dm_op, "iih",
-                                           domid, nr_bufs, bufs);
-
-    return rc;
-}
-
-long do_dm_op(domid_t domid,
-              unsigned int nr_bufs,
-              XEN_GUEST_HANDLE_PARAM(xen_dm_op_buf_t) bufs)
-{
-    struct dmop_args args;
-    int rc;
-
-    if ( nr_bufs > ARRAY_SIZE(args.buf) )
-        return -E2BIG;
-
-    args.domid = domid;
-    args.nr_bufs = array_index_nospec(nr_bufs, ARRAY_SIZE(args.buf) + 1);
-
-    if ( copy_from_guest_offset(&args.buf[0], bufs, 0, args.nr_bufs) )
-        return -EFAULT;
-
-    rc = dm_op(&args);
-
-    if ( rc == -ERESTART )
-        rc = hypercall_create_continuation(__HYPERVISOR_dm_op, "iih",
-                                           domid, nr_bufs, bufs);
-
     return rc;
 }
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index c0e91c4..460f214 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
 obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
+obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
 obj-y += event_2l.o
 obj-y += event_channel.o
diff --git a/xen/common/dm.c b/xen/common/dm.c
new file mode 100644
index 0000000..36e01a2
--- /dev/null
+++ b/xen/common/dm.c
@@ -0,0 +1,291 @@
+/*
+ * Copyright (c) 2016 Citrix Systems Inc.
+ * Copyright (c) 2019 Arm ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/guest_access.h>
+#include <xen/dm.h>
+#include <xen/hypercall.h>
+#include <xen/ioreq.h>
+#include <xen/nospec.h>
+
+static int dm_op(const struct dmop_args *op_args)
+{
+    struct domain *d;
+    struct xen_dm_op op;
+    long rc;
+    bool const_op = true;
+    const size_t offset = offsetof(struct xen_dm_op, u);
+
+    static const uint8_t op_size[] = {
+        [XEN_DMOP_create_ioreq_server]              = sizeof(struct xen_dm_op_create_ioreq_server),
+        [XEN_DMOP_get_ioreq_server_info]            = sizeof(struct xen_dm_op_get_ioreq_server_info),
+        [XEN_DMOP_map_io_range_to_ioreq_server]     = sizeof(struct xen_dm_op_ioreq_server_range),
+        [XEN_DMOP_unmap_io_range_from_ioreq_server] = sizeof(struct xen_dm_op_ioreq_server_range),
+        [XEN_DMOP_set_ioreq_server_state]           = sizeof(struct xen_dm_op_set_ioreq_server_state),
+        [XEN_DMOP_destroy_ioreq_server]             = sizeof(struct xen_dm_op_destroy_ioreq_server),
+        [XEN_DMOP_track_dirty_vram]                 = sizeof(struct xen_dm_op_track_dirty_vram),
+        [XEN_DMOP_set_pci_intx_level]               = sizeof(struct xen_dm_op_set_pci_intx_level),
+        [XEN_DMOP_set_isa_irq_level]                = sizeof(struct xen_dm_op_set_isa_irq_level),
+        [XEN_DMOP_set_pci_link_route]               = sizeof(struct xen_dm_op_set_pci_link_route),
+        [XEN_DMOP_modified_memory]                  = sizeof(struct xen_dm_op_modified_memory),
+        [XEN_DMOP_set_mem_type]                     = sizeof(struct xen_dm_op_set_mem_type),
+        [XEN_DMOP_inject_event]                     = sizeof(struct xen_dm_op_inject_event),
+        [XEN_DMOP_inject_msi]                       = sizeof(struct xen_dm_op_inject_msi),
+        [XEN_DMOP_map_mem_type_to_ioreq_server]     = sizeof(struct xen_dm_op_map_mem_type_to_ioreq_server),
+        [XEN_DMOP_remote_shutdown]                  = sizeof(struct xen_dm_op_remote_shutdown),
+        [XEN_DMOP_relocate_memory]                  = sizeof(struct xen_dm_op_relocate_memory),
+        [XEN_DMOP_pin_memory_cacheattr]             = sizeof(struct xen_dm_op_pin_memory_cacheattr),
+    };
+
+    rc = rcu_lock_remote_domain_by_id(op_args->domid, &d);
+    if ( rc )
+        return rc;
+
+    if ( !is_hvm_domain(d) )
+        goto out;
+
+    rc = xsm_dm_op(XSM_DM_PRIV, d);
+    if ( rc )
+        goto out;
+
+    rc = -EFAULT;
+    if ( op_args->buf[0].size < offset )
+        goto out;
+
+    if ( copy_from_guest_offset((void *)&op, op_args->buf[0].h, 0, offset) )
+        goto out;
+
+    if ( op.op >= ARRAY_SIZE(op_size) )
+    {
+        rc = -EOPNOTSUPP;
+        goto out;
+    }
+
+    op.op = array_index_nospec(op.op, ARRAY_SIZE(op_size));
+
+    if ( op_args->buf[0].size < offset + op_size[op.op] )
+        goto out;
+
+    if ( copy_from_guest_offset((void *)&op.u, op_args->buf[0].h, offset,
+                                op_size[op.op]) )
+        goto out;
+
+    rc = -EINVAL;
+    if ( op.pad )
+        goto out;
+
+    switch ( op.op )
+    {
+    case XEN_DMOP_create_ioreq_server:
+    {
+        struct xen_dm_op_create_ioreq_server *data =
+            &op.u.create_ioreq_server;
+
+        const_op = false;
+
+        rc = -EINVAL;
+        if ( data->pad[0] || data->pad[1] || data->pad[2] )
+            break;
+
+        rc = hvm_create_ioreq_server(d, data->handle_bufioreq,
+                                     &data->id);
+        break;
+    }
+
+    case XEN_DMOP_get_ioreq_server_info:
+    {
+        struct xen_dm_op_get_ioreq_server_info *data =
+            &op.u.get_ioreq_server_info;
+        const uint16_t valid_flags = XEN_DMOP_no_gfns;
+
+        const_op = false;
+
+        rc = -EINVAL;
+        if ( data->flags & ~valid_flags )
+            break;
+
+        rc = hvm_get_ioreq_server_info(d, data->id,
+                                       (data->flags & XEN_DMOP_no_gfns) ?
+                                       NULL : (unsigned long *)&data->ioreq_gfn,
+                                       (data->flags & XEN_DMOP_no_gfns) ?
+                                       NULL : (unsigned long *)&data->bufioreq_gfn,
+                                       &data->bufioreq_port);
+        break;
+    }
+
+    case XEN_DMOP_map_io_range_to_ioreq_server:
+    {
+        const struct xen_dm_op_ioreq_server_range *data =
+            &op.u.map_io_range_to_ioreq_server;
+
+        rc = -EINVAL;
+        if ( data->pad )
+            break;
+
+        rc = hvm_map_io_range_to_ioreq_server(d, data->id, data->type,
+                                              data->start, data->end);
+        break;
+    }
+
+    case XEN_DMOP_unmap_io_range_from_ioreq_server:
+    {
+        const struct xen_dm_op_ioreq_server_range *data =
+            &op.u.unmap_io_range_from_ioreq_server;
+
+        rc = -EINVAL;
+        if ( data->pad )
+            break;
+
+        rc = hvm_unmap_io_range_from_ioreq_server(d, data->id, data->type,
+                                                  data->start, data->end);
+        break;
+    }
+
+    case XEN_DMOP_set_ioreq_server_state:
+    {
+        const struct xen_dm_op_set_ioreq_server_state *data =
+            &op.u.set_ioreq_server_state;
+
+        rc = -EINVAL;
+        if ( data->pad )
+            break;
+
+        rc = hvm_set_ioreq_server_state(d, data->id, !!data->enabled);
+        break;
+    }
+
+    case XEN_DMOP_destroy_ioreq_server:
+    {
+        const struct xen_dm_op_destroy_ioreq_server *data =
+            &op.u.destroy_ioreq_server;
+
+        rc = -EINVAL;
+        if ( data->pad )
+            break;
+
+        rc = hvm_destroy_ioreq_server(d, data->id);
+        break;
+    }
+
+    default:
+        rc = arch_dm_op(&op, d, op_args, &const_op);
+    }
+
+    if ( (!rc || rc == -ERESTART) &&
+         !const_op && copy_to_guest_offset(op_args->buf[0].h, offset,
+                                           (void *)&op.u, op_size[op.op]) )
+        rc = -EFAULT;
+
+ out:
+    rcu_unlock_domain(d);
+
+    return rc;
+}
+
+#ifdef CONFIG_COMPAT
+#include <compat/hvm/dm_op.h>
+
+CHECK_dm_op_create_ioreq_server;
+CHECK_dm_op_get_ioreq_server_info;
+CHECK_dm_op_ioreq_server_range;
+CHECK_dm_op_set_ioreq_server_state;
+CHECK_dm_op_destroy_ioreq_server;
+CHECK_dm_op_track_dirty_vram;
+CHECK_dm_op_set_pci_intx_level;
+CHECK_dm_op_set_isa_irq_level;
+CHECK_dm_op_set_pci_link_route;
+CHECK_dm_op_modified_memory;
+CHECK_dm_op_set_mem_type;
+CHECK_dm_op_inject_event;
+CHECK_dm_op_inject_msi;
+CHECK_dm_op_map_mem_type_to_ioreq_server;
+CHECK_dm_op_remote_shutdown;
+CHECK_dm_op_relocate_memory;
+CHECK_dm_op_pin_memory_cacheattr;
+
+int compat_dm_op(domid_t domid,
+                 unsigned int nr_bufs,
+                 XEN_GUEST_HANDLE_PARAM(void) bufs)
+{
+    struct dmop_args args;
+    unsigned int i;
+    int rc;
+
+    if ( nr_bufs > ARRAY_SIZE(args.buf) )
+        return -E2BIG;
+
+    args.domid = domid;
+    args.nr_bufs = array_index_nospec(nr_bufs, ARRAY_SIZE(args.buf) + 1);
+
+    for ( i = 0; i < args.nr_bufs; i++ )
+    {
+        struct compat_dm_op_buf cmp;
+
+        if ( copy_from_guest_offset(&cmp, bufs, i, 1) )
+            return -EFAULT;
+
+#define XLAT_dm_op_buf_HNDL_h(_d_, _s_) \
+        guest_from_compat_handle((_d_)->h, (_s_)->h)
+
+        XLAT_dm_op_buf(&args.buf[i], &cmp);
+
+#undef XLAT_dm_op_buf_HNDL_h
+    }
+
+    rc = dm_op(&args);
+
+    if ( rc == -ERESTART )
+        rc = hypercall_create_continuation(__HYPERVISOR_dm_op, "iih",
+                                           domid, nr_bufs, bufs);
+
+    return rc;
+}
+#endif
+
+long do_dm_op(domid_t domid,
+              unsigned int nr_bufs,
+              XEN_GUEST_HANDLE_PARAM(xen_dm_op_buf_t) bufs)
+{
+    struct dmop_args args;
+    int rc;
+
+    if ( nr_bufs > ARRAY_SIZE(args.buf) )
+        return -E2BIG;
+
+    args.domid = domid;
+    args.nr_bufs = array_index_nospec(nr_bufs, ARRAY_SIZE(args.buf) + 1);
+
+    if ( copy_from_guest_offset(&args.buf[0], bufs, 0, args.nr_bufs) )
+        return -EFAULT;
+
+    rc = dm_op(&args);
+
+    if ( rc == -ERESTART )
+        rc = hypercall_create_continuation(__HYPERVISOR_dm_op, "iih",
+                                           domid, nr_bufs, bufs);
+
+    return rc;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/dm.h b/xen/include/xen/dm.h
new file mode 100644
index 0000000..ef15edf
--- /dev/null
+++ b/xen/include/xen/dm.h
@@ -0,0 +1,44 @@
+/*
+ * Copyright (c) 2016 Citrix Systems Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __XEN_DM_H__
+#define __XEN_DM_H__
+
+#include <xen/sched.h>
+
+struct dmop_args {
+    domid_t domid;
+    unsigned int nr_bufs;
+    /* Reserve enough buf elements for all current hypercalls. */
+    struct xen_dm_op_buf buf[2];
+};
+
+int arch_dm_op(struct xen_dm_op *op,
+               struct domain *d,
+               const struct dmop_args *op_args,
+               bool *const_op);
+
+#endif /* __XEN_DM_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 7ae3c40..5c61d8e 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -707,14 +707,14 @@ static XSM_INLINE int xsm_pmu_op (XSM_DEFAULT_ARG struct domain *d, unsigned int
     }
 }
 
+#endif /* CONFIG_X86 */
+
 static XSM_INLINE int xsm_dm_op(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-#endif /* CONFIG_X86 */
-
 #ifdef CONFIG_ARGO
 static XSM_INLINE int xsm_argo_enable(const struct domain *d)
 {
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 7bd03d8..91ecff4 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -176,8 +176,8 @@ struct xsm_operations {
     int (*ioport_permission) (struct domain *d, uint32_t s, uint32_t e, uint8_t allow);
     int (*ioport_mapping) (struct domain *d, uint32_t s, uint32_t e, uint8_t allow);
     int (*pmu_op) (struct domain *d, unsigned int op);
-    int (*dm_op) (struct domain *d);
 #endif
+    int (*dm_op) (struct domain *d);
     int (*xen_version) (uint32_t cmd);
     int (*domain_resource_map) (struct domain *d);
 #ifdef CONFIG_ARGO
@@ -682,13 +682,13 @@ static inline int xsm_pmu_op (xsm_default_t def, struct domain *d, unsigned int
     return xsm_ops->pmu_op(d, op);
 }
 
+#endif /* CONFIG_X86 */
+
 static inline int xsm_dm_op(xsm_default_t def, struct domain *d)
 {
     return xsm_ops->dm_op(d);
 }
 
-#endif /* CONFIG_X86 */
-
 static inline int xsm_xen_version (xsm_default_t def, uint32_t op)
 {
     return xsm_ops->xen_version(op);
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index 9e09512..8bdffe7 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -147,8 +147,8 @@ void __init xsm_fixup_ops (struct xsm_operations *ops)
     set_to_dummy_if_null(ops, ioport_permission);
     set_to_dummy_if_null(ops, ioport_mapping);
     set_to_dummy_if_null(ops, pmu_op);
-    set_to_dummy_if_null(ops, dm_op);
 #endif
+    set_to_dummy_if_null(ops, dm_op);
     set_to_dummy_if_null(ops, xen_version);
     set_to_dummy_if_null(ops, domain_resource_map);
 #ifdef CONFIG_ARGO
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 19b0d9e..11784d7 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1656,14 +1656,13 @@ static int flask_pmu_op (struct domain *d, unsigned int op)
         return -EPERM;
     }
 }
+#endif /* CONFIG_X86 */
 
 static int flask_dm_op(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_HVM, HVM__DM);
 }
 
-#endif /* CONFIG_X86 */
-
 static int flask_xen_version (uint32_t op)
 {
     u32 dsid = domain_sid(current->domain);
@@ -1865,8 +1864,8 @@ static struct xsm_operations flask_ops = {
     .ioport_permission = flask_ioport_permission,
     .ioport_mapping = flask_ioport_mapping,
     .pmu_op = flask_pmu_op,
-    .dm_op = flask_dm_op,
 #endif
+    .dm_op = flask_dm_op,
     .xen_version = flask_xen_version,
     .domain_resource_map = flask_domain_resource_map,
 #ifdef CONFIG_ARGO
-- 
2.7.4


