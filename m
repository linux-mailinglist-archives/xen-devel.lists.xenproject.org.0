Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA7923AC48
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 20:22:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2f5r-0008FL-Vh; Mon, 03 Aug 2020 18:21:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XyPB=BN=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k2f5r-0008F4-6E
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 18:21:51 +0000
X-Inumbo-ID: 30e6dd89-d5b6-11ea-90c4-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30e6dd89-d5b6-11ea-90c4-bc764e2007e4;
 Mon, 03 Aug 2020 18:21:48 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id v15so16439298lfg.6
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2020 11:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0pU51lNIwHO5FoiBaR+EgnZXTe7Q2y5dW6t5E4s4GE0=;
 b=L5rF3KgsFvlVDo98woCwm4BaIz0k1rw0Xb4mS4wjytQGLduPEYVmvXPlKnzl5eD2Dt
 69gVtlQ8s8gZWWofa3fLHq4aL5utJswNMUyS2ioZ1zlUww0TmLKNjvdEdtjxQsu+W1ql
 MPHYGq4ODov5OkpZidV2htaLqN4fd9SEFRtLZg+dzR9wg9th5Byi581AqwmrGxa2AZwt
 u7AmKOlKST+qcTugoOtBDlf64kf5jTnwlKdXeN4BloHGgsYj4+Nak6/TUiF17YQRuCh/
 cRllifyG/soLz5YAOIqLQIjNE2g7N8APkwQKZ83PhuLUnG6cR6eEiIztphqniRDOcrMV
 J5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0pU51lNIwHO5FoiBaR+EgnZXTe7Q2y5dW6t5E4s4GE0=;
 b=MaoLHE2n+wYmR8bbgaohtGEKt4bjeE3iDE50wbSO2kRQqbXxGkmAoJJ91gJo4GSLQZ
 yLwZAkVDwlJFyIKZnMo4J6XKh+EYIzK7sXlC+8dMd2KywPv+MrE6FtbRakgvzirvvhJd
 mvn6vw1uecXxO7sD87ybTqnoTHm+F/1ejBaovtg1oY89gFRDUlDHmItq7yuooxiLzf/L
 ZIhInek8Iwcy9BQBEvdTrJ+naOceYRpzkx6Bf8K9MkXp65HkCwyPt7a//HMd8jWQAWum
 sGXmwQybZiQH79J4kqVDkfj9RbHX+sQS6XnerDx2Yx6lp32GkLgANARiYFVRU3wV8+5w
 GoHg==
X-Gm-Message-State: AOAM530KSeaJoAKS/KkfSim2faUjENTxG+Ho7bv7yyrbn5d015glBE5I
 tBxw1yh+ITVL2FFIOvYS9jrMZXA0Gkg=
X-Google-Smtp-Source: ABdhPJxAh1cGoaamlcK3AxiJn33g5R3UYun+leBRiIIdErmvieI0n2cMaaIqQ9LXWTrYBOFj3QtFNg==
X-Received: by 2002:a05:6512:5c7:: with SMTP id
 o7mr9496108lfo.124.1596478906122; 
 Mon, 03 Aug 2020 11:21:46 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h18sm4486730ljk.7.2020.08.03.11.21.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Aug 2020 11:21:45 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [RFC PATCH V1 02/12] hvm/dm: Make x86's DM feature common
Date: Mon,  3 Aug 2020 21:21:18 +0300
Message-Id: <1596478888-23030-3-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

As a lot of x86 code can be re-used on Arm later on, this patch
splits devicemodel support into common and arch specific parts.

This support is going to be used on Arm to be able run device
emulator outside of Xen hypervisor.

Please note, this is a split/cleanup of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 xen/arch/x86/hvm/dm.c       | 287 +++-----------------------------------------
 xen/common/hvm/Makefile     |   1 +
 xen/common/hvm/dm.c         | 287 ++++++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/hypercall.h |  12 ++
 4 files changed, 319 insertions(+), 268 deletions(-)
 create mode 100644 xen/common/hvm/dm.c

diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index 70adb27..fb1ff09 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -29,13 +29,6 @@
 
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
@@ -337,148 +330,20 @@ static int inject_event(struct domain *d,
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
@@ -522,36 +387,10 @@ static int dm_op(const struct dmop_args *op_args)
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
@@ -567,7 +406,7 @@ static int dm_op(const struct dmop_args *op_args)
     case XEN_DMOP_set_pci_intx_level:
     {
         const struct xen_dm_op_set_pci_intx_level *data =
-            &op.u.set_pci_intx_level;
+            &op->u.set_pci_intx_level;
 
         rc = set_pci_intx_level(d, data->domain, data->bus,
                                 data->device, data->intx,
@@ -578,7 +417,7 @@ static int dm_op(const struct dmop_args *op_args)
     case XEN_DMOP_set_isa_irq_level:
     {
         const struct xen_dm_op_set_isa_irq_level *data =
-            &op.u.set_isa_irq_level;
+            &op->u.set_isa_irq_level;
 
         rc = set_isa_irq_level(d, data->isa_irq, data->level);
         break;
@@ -587,7 +426,7 @@ static int dm_op(const struct dmop_args *op_args)
     case XEN_DMOP_set_pci_link_route:
     {
         const struct xen_dm_op_set_pci_link_route *data =
-            &op.u.set_pci_link_route;
+            &op->u.set_pci_link_route;
 
         rc = hvm_set_pci_link_route(d, data->link, data->isa_irq);
         break;
@@ -596,19 +435,19 @@ static int dm_op(const struct dmop_args *op_args)
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
@@ -621,7 +460,7 @@ static int dm_op(const struct dmop_args *op_args)
     case XEN_DMOP_inject_event:
     {
         const struct xen_dm_op_inject_event *data =
-            &op.u.inject_event;
+            &op->u.inject_event;
 
         rc = -EINVAL;
         if ( data->pad0 || data->pad1 )
@@ -634,7 +473,7 @@ static int dm_op(const struct dmop_args *op_args)
     case XEN_DMOP_inject_msi:
     {
         const struct xen_dm_op_inject_msi *data =
-            &op.u.inject_msi;
+            &op->u.inject_msi;
 
         rc = -EINVAL;
         if ( data->pad )
@@ -647,7 +486,7 @@ static int dm_op(const struct dmop_args *op_args)
     case XEN_DMOP_remote_shutdown:
     {
         const struct xen_dm_op_remote_shutdown *data =
-            &op.u.remote_shutdown;
+            &op->u.remote_shutdown;
 
         domain_shutdown(d, data->reason);
         rc = 0;
@@ -656,7 +495,7 @@ static int dm_op(const struct dmop_args *op_args)
 
     case XEN_DMOP_relocate_memory:
     {
-        struct xen_dm_op_relocate_memory *data = &op.u.relocate_memory;
+        struct xen_dm_op_relocate_memory *data = &op->u.relocate_memory;
         struct xen_add_to_physmap xatp = {
             .domid = op_args->domid,
             .size = data->size,
@@ -679,7 +518,7 @@ static int dm_op(const struct dmop_args *op_args)
             data->size -= rc;
             data->src_gfn += rc;
             data->dst_gfn += rc;
-            const_op = false;
+            *const_op = false;
             rc = -ERESTART;
         }
         break;
@@ -688,7 +527,7 @@ static int dm_op(const struct dmop_args *op_args)
     case XEN_DMOP_pin_memory_cacheattr:
     {
         const struct xen_dm_op_pin_memory_cacheattr *data =
-            &op.u.pin_memory_cacheattr;
+            &op->u.pin_memory_cacheattr;
 
         if ( data->pad )
         {
@@ -706,94 +545,6 @@ static int dm_op(const struct dmop_args *op_args)
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
 
diff --git a/xen/common/hvm/Makefile b/xen/common/hvm/Makefile
index 326215d..335fcc9 100644
--- a/xen/common/hvm/Makefile
+++ b/xen/common/hvm/Makefile
@@ -1 +1,2 @@
+obj-y += dm.o
 obj-y += ioreq.o
diff --git a/xen/common/hvm/dm.c b/xen/common/hvm/dm.c
new file mode 100644
index 0000000..09e9542
--- /dev/null
+++ b/xen/common/hvm/dm.c
@@ -0,0 +1,287 @@
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
+#include <xen/hvm/ioreq.h>
+#include <xen/hypercall.h>
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
diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
index 655acc7..19f509f 100644
--- a/xen/include/xen/hypercall.h
+++ b/xen/include/xen/hypercall.h
@@ -150,6 +150,18 @@ do_dm_op(
     unsigned int nr_bufs,
     XEN_GUEST_HANDLE_PARAM(xen_dm_op_buf_t) bufs);
 
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
 #ifdef CONFIG_HYPFS
 extern long
 do_hypfs_op(
-- 
2.7.4


