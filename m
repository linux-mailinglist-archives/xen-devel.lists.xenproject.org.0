Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0748A2650A0
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 22:23:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGT61-0004Xk-45; Thu, 10 Sep 2020 20:23:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQLO=CT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kGT5y-0004JK-TJ
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 20:23:02 +0000
X-Inumbo-ID: 14069bda-2f1a-43ac-b402-eec6382d30c3
Received: from mail-lj1-x233.google.com (unknown [2a00:1450:4864:20::233])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14069bda-2f1a-43ac-b402-eec6382d30c3;
 Thu, 10 Sep 2020 20:22:37 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id y4so9844540ljk.8
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 13:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bu1J/F0NHXKl2Tb4gSoQJVz0UaPT+FGQeedT/aukqso=;
 b=HS4p/XNlFgowylhpiurzPY2HUs2tj+/flsH2PA7jPdahCZL+A8J1SPhoqgbAhFJkz/
 CaC7wWsRE7bm/zhsNxgvKmOjhSXA3uLDN3BfAkLHIofqo0oZtePxAB5OIfWirH6uwlZ+
 bPI3Rz68T6JyOegPb4n4OP7387kALhDYUujz6CJ3zsOiLpQAHtrTYz3lBn7zO3yREWLD
 g9ZZUJb0Agy0JgL+P+XNyxBxCtgrXv8JrKVWYghMhtNoa2u9buBmN6mNvR75Dn3kNoFa
 8Cg5I1QTHYuviX8Scfk/EHFnk4gOP0lO0o3vSSqvg343ym0eRwj3gpjM5i5/apHIWA9t
 Ry2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bu1J/F0NHXKl2Tb4gSoQJVz0UaPT+FGQeedT/aukqso=;
 b=W5uyOhsvMoLXen1dO2zeagC0qjNdemRRkmKCM6KpjZvPytnGXlQWNT84jo7anCdIUV
 H0xqy4BbpiTDXt3b82hqg1v8+4Vsza2YLh8gIX9ye2CfG49Zbb+3xkSIt+gZI7IK3x6g
 nMNf652PtbVPpBUBVoOE/PhTtgt4ap1hQ9diG7qOEITYuy/1QbdzllMbFIQxvqgtEiDM
 sp2ECrAjcB+wFtQnSEeXzJp9m4+xZPrGyzacpI6Z18tp4W8bSf+c0xkVRuT8YtAi2V4S
 4J5vpgahdhGyN9ksRJH3WbeX6Ty+mbrNgNX8amsUTTomX2rQSWGyZqLUR5HS+ec58iWK
 KH6A==
X-Gm-Message-State: AOAM533s+j48w/Cq+rO2PY/HyQqIbNIQqxS9YKlo7Ltx3dIgGWZtaYNN
 jHyx9keyarhKGGt1ACI0j2NWzr+ue0Ndlg==
X-Google-Smtp-Source: ABdhPJzjJTrD9DiPENFOFtoUsveC3BhBJGd/W1ic00ceSkoB9C1mjFXmzdYVinrNcbfPbvbkKKzJgw==
X-Received: by 2002:a2e:a175:: with SMTP id u21mr5127696ljl.7.1599769355790;
 Thu, 10 Sep 2020 13:22:35 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u5sm1584375lfq.17.2020.09.10.13.22.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 13:22:34 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Julien Grall <julien.grall@arm.com>
Subject: [PATCH V1 07/16] xen/dm: Make x86's DM feature common
Date: Thu, 10 Sep 2020 23:22:01 +0300
Message-Id: <1599769330-17656-8-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

As a lot of x86 code can be re-used on Arm later on, this patch
splits devicemodel support into common and arch specific parts.

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
---
---
 xen/arch/x86/hvm/dm.c       | 287 +++-----------------------------------------
 xen/common/Makefile         |   1 +
 xen/common/dm.c             | 287 ++++++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/hypercall.h |  12 ++
 xen/include/xsm/dummy.h     |   4 +-
 xen/include/xsm/xsm.h       |   6 +-
 xen/xsm/dummy.c             |   2 +-
 xen/xsm/flask/hooks.c       |   5 +-
 8 files changed, 327 insertions(+), 277 deletions(-)
 create mode 100644 xen/common/dm.c

diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index 5ce484a..6ae535e 100644
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
@@ -338,148 +331,20 @@ static int inject_event(struct domain *d,
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
@@ -523,36 +388,10 @@ static int dm_op(const struct dmop_args *op_args)
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
@@ -568,7 +407,7 @@ static int dm_op(const struct dmop_args *op_args)
     case XEN_DMOP_set_pci_intx_level:
     {
         const struct xen_dm_op_set_pci_intx_level *data =
-            &op.u.set_pci_intx_level;
+            &op->u.set_pci_intx_level;
 
         rc = set_pci_intx_level(d, data->domain, data->bus,
                                 data->device, data->intx,
@@ -579,7 +418,7 @@ static int dm_op(const struct dmop_args *op_args)
     case XEN_DMOP_set_isa_irq_level:
     {
         const struct xen_dm_op_set_isa_irq_level *data =
-            &op.u.set_isa_irq_level;
+            &op->u.set_isa_irq_level;
 
         rc = set_isa_irq_level(d, data->isa_irq, data->level);
         break;
@@ -588,7 +427,7 @@ static int dm_op(const struct dmop_args *op_args)
     case XEN_DMOP_set_pci_link_route:
     {
         const struct xen_dm_op_set_pci_link_route *data =
-            &op.u.set_pci_link_route;
+            &op->u.set_pci_link_route;
 
         rc = hvm_set_pci_link_route(d, data->link, data->isa_irq);
         break;
@@ -597,19 +436,19 @@ static int dm_op(const struct dmop_args *op_args)
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
@@ -622,7 +461,7 @@ static int dm_op(const struct dmop_args *op_args)
     case XEN_DMOP_inject_event:
     {
         const struct xen_dm_op_inject_event *data =
-            &op.u.inject_event;
+            &op->u.inject_event;
 
         rc = -EINVAL;
         if ( data->pad0 || data->pad1 )
@@ -635,7 +474,7 @@ static int dm_op(const struct dmop_args *op_args)
     case XEN_DMOP_inject_msi:
     {
         const struct xen_dm_op_inject_msi *data =
-            &op.u.inject_msi;
+            &op->u.inject_msi;
 
         rc = -EINVAL;
         if ( data->pad )
@@ -648,7 +487,7 @@ static int dm_op(const struct dmop_args *op_args)
     case XEN_DMOP_remote_shutdown:
     {
         const struct xen_dm_op_remote_shutdown *data =
-            &op.u.remote_shutdown;
+            &op->u.remote_shutdown;
 
         domain_shutdown(d, data->reason);
         rc = 0;
@@ -657,7 +496,7 @@ static int dm_op(const struct dmop_args *op_args)
 
     case XEN_DMOP_relocate_memory:
     {
-        struct xen_dm_op_relocate_memory *data = &op.u.relocate_memory;
+        struct xen_dm_op_relocate_memory *data = &op->u.relocate_memory;
         struct xen_add_to_physmap xatp = {
             .domid = op_args->domid,
             .size = data->size,
@@ -680,7 +519,7 @@ static int dm_op(const struct dmop_args *op_args)
             data->size -= rc;
             data->src_gfn += rc;
             data->dst_gfn += rc;
-            const_op = false;
+            *const_op = false;
             rc = -ERESTART;
         }
         break;
@@ -689,7 +528,7 @@ static int dm_op(const struct dmop_args *op_args)
     case XEN_DMOP_pin_memory_cacheattr:
     {
         const struct xen_dm_op_pin_memory_cacheattr *data =
-            &op.u.pin_memory_cacheattr;
+            &op->u.pin_memory_cacheattr;
 
         if ( data->pad )
         {
@@ -707,94 +546,6 @@ static int dm_op(const struct dmop_args *op_args)
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
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 8df2b6e..5cf7208 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
 obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
+obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domctl.o
 obj-y += domain.o
 obj-y += event_2l.o
diff --git a/xen/common/dm.c b/xen/common/dm.c
new file mode 100644
index 0000000..060731d
--- /dev/null
+++ b/xen/common/dm.c
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
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 5f6f842..c0813c0 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -723,14 +723,14 @@ static XSM_INLINE int xsm_pmu_op (XSM_DEFAULT_ARG struct domain *d, unsigned int
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
index a80bcf3..2a9b39d 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -177,8 +177,8 @@ struct xsm_operations {
     int (*ioport_permission) (struct domain *d, uint32_t s, uint32_t e, uint8_t allow);
     int (*ioport_mapping) (struct domain *d, uint32_t s, uint32_t e, uint8_t allow);
     int (*pmu_op) (struct domain *d, unsigned int op);
-    int (*dm_op) (struct domain *d);
 #endif
+    int (*dm_op) (struct domain *d);
     int (*xen_version) (uint32_t cmd);
     int (*domain_resource_map) (struct domain *d);
 #ifdef CONFIG_ARGO
@@ -688,13 +688,13 @@ static inline int xsm_pmu_op (xsm_default_t def, struct domain *d, unsigned int
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
index d4cce68..e3afd06 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -148,8 +148,8 @@ void __init xsm_fixup_ops (struct xsm_operations *ops)
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
index a314bf8..645192a 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1662,14 +1662,13 @@ static int flask_pmu_op (struct domain *d, unsigned int op)
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
@@ -1872,8 +1871,8 @@ static struct xsm_operations flask_ops = {
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


