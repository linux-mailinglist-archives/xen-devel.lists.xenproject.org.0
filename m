Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 432072F3C0A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 22:59:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66099.117380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRh7-0004Vv-Ft; Tue, 12 Jan 2021 21:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66099.117380; Tue, 12 Jan 2021 21:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRh6-0004T1-Vl; Tue, 12 Jan 2021 21:59:16 +0000
Received: by outflank-mailman (input) for mailman id 66099;
 Tue, 12 Jan 2021 21:59:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OoN1=GP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kzRbl-0002PK-Hk
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 21:53:45 +0000
Received: from mail-wm1-x32f.google.com (unknown [2a00:1450:4864:20::32f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72c4ed1e-048c-43a9-9c5d-6ecfae4a8588;
 Tue, 12 Jan 2021 21:53:03 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id r4so3488392wmh.5
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 13:53:03 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 138sm6574053wma.41.2021.01.12.13.53.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Jan 2021 13:53:01 -0800 (PST)
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
X-Inumbo-ID: 72c4ed1e-048c-43a9-9c5d-6ecfae4a8588
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=V6c4AwWccq5AwOz6uz4L90kbcmiGc+PgMzq6WugoC5U=;
        b=GYeATYSOQwWksPAySe1H1S29HcnzA2clzVyjNIEXNg/ld4QdN6BZu7O9thY8l+tVcb
         041KJpqVsq8JIqc2zhhXbru9uf1g7FAFgM2kX+zDKXwdY5zcIri+xSGPAyC+R5WNvsZV
         /naOOaKk6gJWv8yCstequoUagm+kbB16lv5Jyof25OPJpkyEOp3cpTEEr/HpJox2SXo/
         3/Uu3W97qgHsD7s609kJuvfhhpT0+Yd0+Fs520+Rsbp0gz9sC9/Eq0souJGdLe+/OJRR
         81+EjY+681/kFbc6x/YiiDm30UbV0wUNJ7gDFMzRyCDxPEP0FeXMnRMt5EY50KbFCGhI
         RZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=V6c4AwWccq5AwOz6uz4L90kbcmiGc+PgMzq6WugoC5U=;
        b=afb+0h7qnYIus/7X99zRETrJkFSu7mLHrAGaR8icEhdWwrKxnzMhcmBPJysgQVunfD
         QMBH5LhnXVr2iMOrcS2B8HDIq5K3/ZHngxxT2xNyJGSrElVYUYjZiqUbNfEogUhytock
         BG43FDmfxGKXsvvSa4jwUZacM6u13Q2iTINga/X8+oaTUJgZ8BN4LVlGVXvxVZ4cdi90
         iu2BKQOy31JMxkoAK9LQSDggjKmxmMvhyIKhJhnc/OWaWmseOzTA1kUbMSOpCjVIvhxb
         na2onF7hiGHASg7idxivhgGLwaMfjyFjeCijRYbFIZsPYHmTFtoOhxzTqusPUE0WQ0Lq
         C07Q==
X-Gm-Message-State: AOAM533sJphhcf497dYajQuMHOZw9ETnU3VsoPL0N4F4PPRM+VKMIBqw
	0NGJeSe4gpZ3eVj0MVUD1/BiK1FTUmoiNg==
X-Google-Smtp-Source: ABdhPJx/XAwMEQPQNZ6o7RiqFLm8QKpxBPka5y6cvywGuBqRWfsQKqPFC/cp+ZbQ0Wtw2OeY47dqtA==
X-Received: by 2002:a7b:c1c6:: with SMTP id a6mr1125167wmj.23.1610488382168;
        Tue, 12 Jan 2021 13:53:02 -0800 (PST)
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
	Paul Durrant <paul@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V4 09/24] xen/ioreq: Make x86's IOREQ related dm-op handling common
Date: Tue, 12 Jan 2021 23:52:17 +0200
Message-Id: <1610488352-18494-10-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>

From: Julien Grall <julien.grall@arm.com>

As a lot of x86 code can be re-used on Arm later on, this patch
moves the IOREQ related dm-op handling to the common code.

The idea is to have the top level dm-op handling arch-specific
and call into ioreq_server_dm_op() for otherwise unhandled ops.
Pros:
- More natural than doing it other way around (top level dm-op
handling common).
- Leave compat_dm_op() in x86 code.
Cons:
- Code duplication. Both arches have to duplicate do_dm_op(), etc.

Also update XSM code a bit to let dm-op be used on Arm.

This support is going to be used on Arm to be able run device
emulator outside of Xen hypervisor.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

***
I decided to leave common dm.h to keep struct dmop_args declaration
(to be included by Arm's dm.c), alternatively we could avoid
introducing new header by moving the declaration into the existing
header, but failed to find a suitable one which context would fit.
***

Changes RFC -> V1:
   - update XSM, related changes were pulled from:
     [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for IOREQ/DM features

Changes V1 -> V2:
   - update the author of a patch
   - update patch description
   - introduce xen/dm.h and move definitions here

Changes V2 -> V3:
   - no changes

Changes V3 -> V4:
   - rework to have the top level dm-op handling arch-specific
   - update patch subject/description, was "xen/dm: Make x86's DM feature common"
   - make a few functions static in common ioreq.c
---
 xen/arch/x86/hvm/dm.c   | 101 +-----------------------------------
 xen/common/ioreq.c      | 135 ++++++++++++++++++++++++++++++++++++++++++------
 xen/include/xen/dm.h    |  39 ++++++++++++++
 xen/include/xen/ioreq.h |  17 +-----
 xen/include/xsm/dummy.h |   4 +-
 xen/include/xsm/xsm.h   |   6 +--
 xen/xsm/dummy.c         |   2 +-
 xen/xsm/flask/hooks.c   |   5 +-
 8 files changed, 171 insertions(+), 138 deletions(-)
 create mode 100644 xen/include/xen/dm.h

diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index d3e2a9e..dc8e47d 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -16,6 +16,7 @@
 
 #include <xen/event.h>
 #include <xen/guest_access.h>
+#include <xen/dm.h>
 #include <xen/hypercall.h>
 #include <xen/ioreq.h>
 #include <xen/nospec.h>
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
@@ -408,71 +402,6 @@ static int dm_op(const struct dmop_args *op_args)
 
     switch ( op.op )
     {
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
-
-    case XEN_DMOP_get_ioreq_server_info:
-    {
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
@@ -523,32 +452,6 @@ static int dm_op(const struct dmop_args *op_args)
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
@@ -703,7 +606,7 @@ static int dm_op(const struct dmop_args *op_args)
     }
 
     default:
-        rc = -EOPNOTSUPP;
+        rc = ioreq_server_dm_op(&op, d, &const_op);
         break;
     }
 
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index a319c88..72b5da0 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -591,8 +591,8 @@ static void hvm_ioreq_server_deinit(struct ioreq_server *s)
     put_domain(s->emulator);
 }
 
-int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
-                            ioservid_t *id)
+static int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
+                                   ioservid_t *id)
 {
     struct ioreq_server *s;
     unsigned int i;
@@ -647,7 +647,7 @@ int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
     return rc;
 }
 
-int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
+static int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
 {
     struct ioreq_server *s;
     int rc;
@@ -689,10 +689,10 @@ int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
     return rc;
 }
 
-int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
-                              unsigned long *ioreq_gfn,
-                              unsigned long *bufioreq_gfn,
-                              evtchn_port_t *bufioreq_port)
+static int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
+                                     unsigned long *ioreq_gfn,
+                                     unsigned long *bufioreq_gfn,
+                                     evtchn_port_t *bufioreq_port)
 {
     struct ioreq_server *s;
     int rc;
@@ -787,9 +787,9 @@ int hvm_get_ioreq_server_frame(struct domain *d, ioservid_t id,
     return rc;
 }
 
-int hvm_map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
-                                     uint32_t type, uint64_t start,
-                                     uint64_t end)
+static int hvm_map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
+                                            uint32_t type, uint64_t start,
+                                            uint64_t end)
 {
     struct ioreq_server *s;
     struct rangeset *r;
@@ -839,9 +839,9 @@ int hvm_map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
     return rc;
 }
 
-int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
-                                         uint32_t type, uint64_t start,
-                                         uint64_t end)
+static int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
+                                                uint32_t type, uint64_t start,
+                                                uint64_t end)
 {
     struct ioreq_server *s;
     struct rangeset *r;
@@ -934,8 +934,8 @@ int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
     return rc;
 }
 
-int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
-                               bool enabled)
+static int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
+                                      bool enabled)
 {
     struct ioreq_server *s;
     int rc;
@@ -1279,6 +1279,111 @@ void hvm_ioreq_init(struct domain *d)
     arch_ioreq_domain_init(d);
 }
 
+int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op)
+{
+    long rc;
+
+    switch ( op->op )
+    {
+    case XEN_DMOP_create_ioreq_server:
+    {
+        struct xen_dm_op_create_ioreq_server *data =
+            &op->u.create_ioreq_server;
+
+        *const_op = false;
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
+            &op->u.get_ioreq_server_info;
+        const uint16_t valid_flags = XEN_DMOP_no_gfns;
+
+        *const_op = false;
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
+            &op->u.map_io_range_to_ioreq_server;
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
+            &op->u.unmap_io_range_from_ioreq_server;
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
+            &op->u.set_ioreq_server_state;
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
+            &op->u.destroy_ioreq_server;
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
+        rc = -EOPNOTSUPP;
+        break;
+    }
+
+    return rc;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/dm.h b/xen/include/xen/dm.h
new file mode 100644
index 0000000..2c9952d
--- /dev/null
+++ b/xen/include/xen/dm.h
@@ -0,0 +1,39 @@
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
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index bc79c37..7a90873 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -85,25 +85,10 @@ bool hvm_io_pending(struct vcpu *v);
 bool handle_hvm_io_completion(struct vcpu *v);
 bool is_ioreq_server_page(struct domain *d, const struct page_info *page);
 
-int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
-                            ioservid_t *id);
-int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id);
-int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
-                              unsigned long *ioreq_gfn,
-                              unsigned long *bufioreq_gfn,
-                              evtchn_port_t *bufioreq_port);
 int hvm_get_ioreq_server_frame(struct domain *d, ioservid_t id,
                                unsigned long idx, mfn_t *mfn);
-int hvm_map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
-                                     uint32_t type, uint64_t start,
-                                     uint64_t end);
-int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
-                                         uint32_t type, uint64_t start,
-                                         uint64_t end);
 int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
                                      uint32_t type, uint32_t flags);
-int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
-                               bool enabled);
 
 int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v);
 void hvm_all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v);
@@ -117,6 +102,8 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered);
 
 void hvm_ioreq_init(struct domain *d);
 
+int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op);
+
 bool arch_ioreq_complete_mmio(void);
 bool arch_vcpu_ioreq_completion(enum hvm_io_completion io_completion);
 int arch_ioreq_server_map_pages(struct ioreq_server *s);
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


