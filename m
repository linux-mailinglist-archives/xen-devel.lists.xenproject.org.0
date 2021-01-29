Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 562AF308366
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 02:50:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77590.140668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Iv4-0005Mm-Cl; Fri, 29 Jan 2021 01:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77590.140668; Fri, 29 Jan 2021 01:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Iv4-0005Ls-8b; Fri, 29 Jan 2021 01:49:54 +0000
Received: by outflank-mailman (input) for mailman id 77590;
 Fri, 29 Jan 2021 01:49:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5Iv2-0004da-Km
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 01:49:52 +0000
Received: from mail-lj1-x233.google.com (unknown [2a00:1450:4864:20::233])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dda93437-14bc-4471-8d1c-4080cfd29bbb;
 Fri, 29 Jan 2021 01:49:16 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id f11so8719127ljm.8
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 17:49:16 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z128sm1840238lfa.72.2021.01.28.17.49.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 17:49:14 -0800 (PST)
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
X-Inumbo-ID: dda93437-14bc-4471-8d1c-4080cfd29bbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OkRuzTYfFyATpx+gTS9Zxr9CCrLjwbVBY9lHD95giVQ=;
        b=lM7gn7Wa09Qx0WKh9Z84QKV88fnhC3ekleZ9mDLU1mKiEooluJOHn9znu2dGUsLB3x
         JmwoD/EItATdVrrDZGUWE1VlqeUhmEZSrXyYf4QCeEGOdCABXrQPOibuAIeclJeM32/K
         YRbS3NSnM9woS0NU2o4BRc/4RKUOHdiiIB5tSk/Gz7e5ownk3k8bUm4AQmIbG5cWNjDe
         vt34rPLQfjwqe+M/xYVcmSlEgTnUH5Acihki8Qqt4oKSgIpOR4SSGXKOd0s7Pcy3ce3f
         USUiKkJTkEiVw6aVPyGTIJ54sZXiRDImi6TOEJui6CB7I6nSeNdMeMXepY/3znGPO9RC
         CM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OkRuzTYfFyATpx+gTS9Zxr9CCrLjwbVBY9lHD95giVQ=;
        b=S3Gz7x7lbO98jYviEQ0ePKszKqh361MGuc3LuexaXJ8hhEnj/+ubNB/8jZiK5SgL0B
         YYgglS6KR183F4BxKhnf3QZ2aYbAxP+lVcEkzPllUhvbbz6PLjt9yqNCQfM4vQH+jGuw
         upVhZE9HJfNrSkJXxYLU3+NYczYF3+0Kg/BRWPrR1lXcFlFJ8psAZ2wB30gDp5WRuF0d
         L2nKT84GmEACaR/+9Q+htJZsLDkoMfgG4qqyea4y+m/2pI/imhBRhvdhvoCQzXb/txhm
         A52xaYxVZhAcBz9uA1JAz5iEcIsI/ODsiZZ4o4W/G/e+Rb8140TkZSaxPw1Rfc1F9pSy
         +oag==
X-Gm-Message-State: AOAM533AuIosY63z7A4hGUjRzm66FKzdrVjZahskR5mMpgo77N3mfpHS
	rFUgO5tlLIdR6Jm5iHmNkDHzSv+tIHy8uA==
X-Google-Smtp-Source: ABdhPJw2ytivzUITiyzeYB4bPZ2LtbCegWM6yF+2AOBZpNnmYdzm+6J5oEN/7eyXuY14tVaUydRjWQ==
X-Received: by 2002:a2e:8008:: with SMTP id j8mr1151325ljg.461.1611884954642;
        Thu, 28 Jan 2021 17:49:14 -0800 (PST)
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
Subject: [PATCH V6 09/24] xen/ioreq: Make x86's IOREQ related dm-op handling common
Date: Fri, 29 Jan 2021 03:48:37 +0200
Message-Id: <1611884932-1851-10-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>

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
- Code duplication. Both arches have to duplicate dm_op(), etc.

Make the corresponding functions static and rename them according
to the new naming scheme (including dropping the "hvm" prefixes).

Introduce common dm.c file as a resting place for the do_dm_op()
(which is identical for both Arm and x86) to minimize code duplication.
The common DM feature is supposed to be built with IOREQ_SERVER
option enabled (as well as the IOREQ feature), which is selected
for x86's config HVM for now.

Also update XSM code a bit to let dm-op be used on Arm.

This support is going to be used on Arm to be able run device
emulator outside of Xen hypervisor.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

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

Changes V3 -> V4:
   - rework to have the top level dm-op handling arch-specific
   - update patch subject/description, was "xen/dm: Make x86's DM feature common"
   - make a few functions static in common ioreq.c

Changes V4 -> V5:
   - update patch description
   - add Jan's A-b
   - drop the 'hvm_' prefixes of touched functions and rename them
     instead of doing that in patch #12
   - add common dm.c to keep do_dm_op(), make dm_op() global

Changes V5 -> V6:
   - include xen/types.h, public/xen.h and public/hvm/dm_op.h
     by common dm.h instead of xen/sched.h
   - add Paul's R-b
---
---
 xen/arch/x86/hvm/dm.c   | 132 ++--------------------------------------------
 xen/common/Makefile     |   1 +
 xen/common/dm.c         |  55 +++++++++++++++++++
 xen/common/ioreq.c      | 137 ++++++++++++++++++++++++++++++++++++++++++------
 xen/include/xen/dm.h    |  44 ++++++++++++++++
 xen/include/xen/ioreq.h |  21 ++------
 xen/include/xsm/dummy.h |   4 +-
 xen/include/xsm/xsm.h   |   6 +--
 xen/xsm/dummy.c         |   2 +-
 xen/xsm/flask/hooks.c   |   5 +-
 10 files changed, 238 insertions(+), 169 deletions(-)
 create mode 100644 xen/common/dm.c
 create mode 100644 xen/include/xen/dm.h

diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index d3e2a9e..5bc172a 100644
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
@@ -338,7 +332,7 @@ static int inject_event(struct domain *d,
     return 0;
 }
 
-static int dm_op(const struct dmop_args *op_args)
+int dm_op(const struct dmop_args *op_args)
 {
     struct domain *d;
     struct xen_dm_op op;
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
@@ -486,8 +415,8 @@ static int dm_op(const struct dmop_args *op_args)
             break;
 
         if ( first_gfn == 0 )
-            rc = hvm_map_mem_type_to_ioreq_server(d, data->id,
-                                                  data->type, data->flags);
+            rc = ioreq_server_map_mem_type(d, data->id,
+                                           data->type, data->flags);
         else
             rc = 0;
 
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
 
@@ -776,31 +679,6 @@ int compat_dm_op(domid_t domid,
     return rc;
 }
 
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
-    return rc;
-}
-
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 2e3c234..71c1d46 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
 obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
+obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
 obj-y += event_2l.o
 obj-y += event_channel.o
diff --git a/xen/common/dm.c b/xen/common/dm.c
new file mode 100644
index 0000000..2d1d98c
--- /dev/null
+++ b/xen/common/dm.c
@@ -0,0 +1,55 @@
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
+#include <xen/dm.h>
+#include <xen/guest_access.h>
+#include <xen/hypercall.h>
+#include <xen/nospec.h>
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
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 4cb26e6..84bce36 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -223,7 +223,7 @@ static int hvm_alloc_ioreq_mfn(struct ioreq_server *s, bool buf)
     {
         /*
          * If a guest frame has already been mapped (which may happen
-         * on demand if hvm_get_ioreq_server_info() is called), then
+         * on demand if ioreq_server_get_info() is called), then
          * allocating a page is not permitted.
          */
         if ( !gfn_eq(iorp->gfn, INVALID_GFN) )
@@ -591,8 +591,8 @@ static void hvm_ioreq_server_deinit(struct ioreq_server *s)
     put_domain(s->emulator);
 }
 
-int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
-                            ioservid_t *id)
+static int ioreq_server_create(struct domain *d, int bufioreq_handling,
+                               ioservid_t *id)
 {
     struct ioreq_server *s;
     unsigned int i;
@@ -647,7 +647,7 @@ int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
     return rc;
 }
 
-int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
+static int ioreq_server_destroy(struct domain *d, ioservid_t id)
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
+static int ioreq_server_get_info(struct domain *d, ioservid_t id,
+                                 unsigned long *ioreq_gfn,
+                                 unsigned long *bufioreq_gfn,
+                                 evtchn_port_t *bufioreq_port)
 {
     struct ioreq_server *s;
     int rc;
@@ -787,7 +787,7 @@ int hvm_get_ioreq_server_frame(struct domain *d, ioservid_t id,
     return rc;
 }
 
-int hvm_map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
+static int ioreq_server_map_io_range(struct domain *d, ioservid_t id,
                                      uint32_t type, uint64_t start,
                                      uint64_t end)
 {
@@ -839,9 +839,9 @@ int hvm_map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
     return rc;
 }
 
-int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
-                                         uint32_t type, uint64_t start,
-                                         uint64_t end)
+static int ioreq_server_unmap_io_range(struct domain *d, ioservid_t id,
+                                       uint32_t type, uint64_t start,
+                                       uint64_t end)
 {
     struct ioreq_server *s;
     struct rangeset *r;
@@ -899,8 +899,8 @@ int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
  * Support for the emulation of read operations can be added when an ioreq
  * server has such requirement in the future.
  */
-int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
-                                     uint32_t type, uint32_t flags)
+int ioreq_server_map_mem_type(struct domain *d, ioservid_t id,
+                              uint32_t type, uint32_t flags)
 {
     struct ioreq_server *s;
     int rc;
@@ -934,8 +934,8 @@ int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
     return rc;
 }
 
-int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
-                               bool enabled)
+static int ioreq_server_set_state(struct domain *d, ioservid_t id,
+                                  bool enabled)
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
+        rc = ioreq_server_create(d, data->handle_bufioreq,
+                                 &data->id);
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
+        rc = ioreq_server_get_info(d, data->id,
+                                   (data->flags & XEN_DMOP_no_gfns) ?
+                                   NULL : (unsigned long *)&data->ioreq_gfn,
+                                   (data->flags & XEN_DMOP_no_gfns) ?
+                                   NULL : (unsigned long *)&data->bufioreq_gfn,
+                                   &data->bufioreq_port);
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
+        rc = ioreq_server_map_io_range(d, data->id, data->type,
+                                       data->start, data->end);
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
+        rc = ioreq_server_unmap_io_range(d, data->id, data->type,
+                                         data->start, data->end);
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
+        rc = ioreq_server_set_state(d, data->id, !!data->enabled);
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
+        rc = ioreq_server_destroy(d, data->id);
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
index 0000000..6bb8b6b
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
+#include <xen/types.h>
+
+#include <public/xen.h>
+#include <public/hvm/dm_op.h>
+
+struct dmop_args {
+    domid_t domid;
+    unsigned int nr_bufs;
+    /* Reserve enough buf elements for all current hypercalls. */
+    struct xen_dm_op_buf buf[2];
+};
+
+int dm_op(const struct dmop_args *op_args);
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
index 5a6c11d..60e864d 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -87,25 +87,10 @@ bool hvm_io_pending(struct vcpu *v);
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
-int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
-                                     uint32_t type, uint32_t flags);
-int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
-                               bool enabled);
+int ioreq_server_map_mem_type(struct domain *d, ioservid_t id,
+                              uint32_t type, uint32_t flags);
 
 int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v);
 void hvm_all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu *v);
@@ -119,6 +104,8 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered);
 
 void hvm_ioreq_init(struct domain *d);
 
+int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op);
+
 bool arch_ioreq_complete_mmio(void);
 bool arch_vcpu_ioreq_completion(enum hvm_io_completion io_completion);
 int arch_ioreq_server_map_pages(struct ioreq_server *s);
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index fa40e88..10739e7 100644
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


