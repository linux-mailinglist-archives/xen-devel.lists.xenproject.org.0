Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E97B9ABFED1
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 23:18:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992594.1376283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHqpH-0008BN-U6; Wed, 21 May 2025 21:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992594.1376283; Wed, 21 May 2025 21:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHqpH-00089o-QM; Wed, 21 May 2025 21:18:11 +0000
Received: by outflank-mailman (input) for mailman id 992594;
 Wed, 21 May 2025 21:18:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q6H9=YF=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uHqpG-000898-1A
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 21:18:10 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17137dc1-3689-11f0-a2fb-13f23c93f187;
 Wed, 21 May 2025 23:18:07 +0200 (CEST)
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
X-Inumbo-ID: 17137dc1-3689-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747862286; x=1748121486;
	bh=QuBV8JelOIY3LcKJnn2bVYDh86Bxi1+tDluV88gUXwU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ioR0tDvWHRIk1kFV7bMtVnSXAj7Yzlye3zbYe7GyeMj48JWL7UrTKsE9wSzDX1AXE
	 aUAK3NIOeIHNcrBltppPFUfVE/xxlF2OoDfXsgi4iGhnblSyREW/NxfaVr47kCcLrV
	 ht0rLaw6muu2ZQr4Kin7OtyLDcH5tTcuGkBvcsEoQJDg4nq+OD7u9wXC7Z8QK2/wlp
	 Tw9QTYqZNOQzNh9S0hcHAy56TEoTOdiV+0czk69nDVdmy8YaqrnUq7+Rwwlz8zGZwJ
	 Yk+/TtBmqPuAehGJ5hg1sNfkayLCF/EbCL8BVUBXVTkvaC7O/9fMosU3GhjYMtI4MC
	 rbN1D3qD496CQ==
Date: Wed, 21 May 2025 21:18:00 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, christopher.w.clark@gmail.com, dpsmith@apertussolutions.com, michal.orzel@amd.com, persaur@gmail.com, dmukhin@ford.com, Christopher Clark <christopher.clark6@baesystems.com>
Subject: [XTF PATCH v2 1/2] tests/argo: Add argo test suite
Message-ID: <20250521211742.2997890-2-dmukhin@ford.com>
In-Reply-To: <20250521211742.2997890-1-dmukhin@ford.com>
References: <20250521211742.2997890-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 5d1e9a5137bd239ea0938bc7b54331b8911e4f57
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Christopher Clark <christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Simple test cases for the four Argo operations, register, unregister,
sendv and notify exercised with a single test domain.
Add infrastructure to access Argo: a 5-argument hypercall, number 39.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Original XTF argo test:
  https://github.com/dozylynx/meta-argo/blob/master/recipes-extended/xen/xt=
f/0001-Add-Argo-test.patch
---
 docs/all-tests.dox      |   2 +
 include/xen/argo.h      | 259 +++++++++++++++++++++++++++++
 include/xtf/hypercall.h |   1 +
 include/xtf/numbers.h   |   5 +
 tests/argo/Makefile     |   9 +
 tests/argo/main.c       | 353 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 629 insertions(+)
 create mode 100644 include/xen/argo.h
 create mode 100644 tests/argo/Makefile
 create mode 100644 tests/argo/main.c

diff --git a/docs/all-tests.dox b/docs/all-tests.dox
index 566762c..1a7b4b7 100644
--- a/docs/all-tests.dox
+++ b/docs/all-tests.dox
@@ -178,6 +178,8 @@ states.
=20
 @section index-utility Utilities
=20
+@subpage test-argo - Argo functionality test
+
 @subpage test-cpuid - Print CPUID information.
=20
 @subpage test-fep - Test availability of HVM Forced Emulation Prefix.
diff --git a/include/xen/argo.h b/include/xen/argo.h
new file mode 100644
index 0000000..5ae2def
--- /dev/null
+++ b/include/xen/argo.h
@@ -0,0 +1,259 @@
+/*************************************************************************=
*****
+ * Argo : Hypervisor-Mediated data eXchange
+ *
+ * Derived from v4v, the version 2 of v2v.
+ *
+ * Copyright (c) 2010, Citrix Systems
+ * Copyright (c) 2018-2019, BAE Systems
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy
+ * of this software and associated documentation files (the "Software"), t=
o
+ * deal in the Software without restriction, including without limitation =
the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, an=
d/or
+ * sell copies of the Software, and to permit persons to whom the Software=
 is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included=
 in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
 THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef __XEN_PUBLIC_ARGO_H__
+#define __XEN_PUBLIC_ARGO_H__
+
+#define XEN_ARGO_DOMID_ANY       DOMID_INVALID
+
+/* The maximum size of an Argo ring is defined to be: 16MB (0x1000000 byte=
s). */
+#define XEN_ARGO_MAX_RING_SIZE  (0x1000000ULL)
+
+/* Fixed-width type for "argo port" number. Nothing to do with evtchns. */
+typedef uint32_t xen_argo_port_t;
+
+/* gfn type: 64-bit fixed-width on all architectures */
+typedef uint64_t xen_argo_gfn_t;
+
+/*
+ * XEN_ARGO_MAXIOV : maximum number of iovs accepted in a single sendv.
+ * Caution is required if this value is increased: this determines the siz=
e of
+ * an array of xen_argo_iov_t structs on the hypervisor stack, so could ca=
use
+ * stack overflow if the value is too large.
+ * The Linux Argo driver never passes more than two iovs.
+*/
+#define XEN_ARGO_MAXIOV          8U
+
+typedef struct xen_argo_iov
+{
+    unsigned long iov_hnd;
+    uint32_t iov_len;
+    uint32_t pad;
+} xen_argo_iov_t;
+
+typedef struct xen_argo_addr
+{
+    xen_argo_port_t aport;
+    domid_t domain_id;
+    uint16_t pad;
+} xen_argo_addr_t;
+
+typedef struct xen_argo_send_addr
+{
+    struct xen_argo_addr src;
+    struct xen_argo_addr dst;
+} xen_argo_send_addr_t;
+
+typedef struct xen_argo_ring
+{
+    /* Guests should use atomic operations to access rx_ptr */
+    uint32_t rx_ptr;
+    /* Guests should use atomic operations to access tx_ptr */
+    uint32_t tx_ptr;
+    /*
+     * Header space reserved for later use. Align the start of the ring to=
 a
+     * multiple of the message slot size.
+     */
+    uint8_t reserved[56];
+    uint8_t ring[];
+} xen_argo_ring_t;
+
+typedef struct xen_argo_register_ring
+{
+    xen_argo_port_t aport;
+    domid_t partner_id;
+    uint16_t pad;
+    uint32_t len;
+} xen_argo_register_ring_t;
+
+typedef struct xen_argo_unregister_ring
+{
+    xen_argo_port_t aport;
+    domid_t partner_id;
+    uint16_t pad;
+} xen_argo_unregister_ring_t;
+
+/* Messages on the ring are padded to a multiple of this size. */
+#define XEN_ARGO_MSG_SLOT_SIZE 0x10
+
+/*
+ * Notify flags
+ */
+/* Ring exists */
+#define XEN_ARGO_RING_EXISTS            (1U << 0)
+/* Ring is shared, not unicast */
+#define XEN_ARGO_RING_SHARED            (1U << 1)
+/* Ring is empty */
+#define XEN_ARGO_RING_EMPTY             (1U << 2)
+/* Sufficient space to queue space_required bytes might exist */
+#define XEN_ARGO_RING_SUFFICIENT        (1U << 3)
+/* Insufficient ring size for space_required bytes */
+#define XEN_ARGO_RING_EMSGSIZE          (1U << 4)
+/* Too many domains waiting for available space signals for this ring */
+#define XEN_ARGO_RING_EBUSY             (1U << 5)
+
+typedef struct xen_argo_ring_data_ent
+{
+    struct xen_argo_addr ring;
+    uint16_t flags;
+    uint16_t pad;
+    uint32_t space_required;
+    uint32_t max_message_size;
+} xen_argo_ring_data_ent_t;
+
+typedef struct xen_argo_ring_data
+{
+    uint32_t nent;
+    uint32_t pad;
+
+    /*
+     * The Xen headers have:
+     *   struct xen_argo_ring_data_ent data[];
+     * here.  It's useful for the hypervisor side of the interface, but re=
ally
+     * not for the client side.
+     */
+} xen_argo_ring_data_t;
+
+struct xen_argo_ring_message_header
+{
+    uint32_t len;
+    struct xen_argo_addr source;
+    uint32_t message_type;
+    uint8_t data[];
+};
+
+/*
+ * Hypercall operations
+ */
+
+/*
+ * XEN_ARGO_OP_register_ring
+ *
+ * Register a ring using the guest-supplied memory pages.
+ * Also used to reregister an existing ring (eg. after resume from hiberna=
te).
+ *
+ * The first argument struct indicates the port number for the ring to reg=
ister
+ * and the partner domain, if any, that is to be allowed to send to the ri=
ng.
+ * A wildcard (XEN_ARGO_DOMID_ANY) may be supplied instead of a partner do=
mid,
+ * and if the hypervisor has wildcard sender rings enabled, this will allo=
w
+ * any domain (XSM notwithstanding) to send to the ring.
+ *
+ * The second argument is an array of guest frame numbers and the third ar=
gument
+ * indicates the size of the array. This operation only supports 4K-sized =
pages.
+ *
+ * arg1: XEN_GUEST_HANDLE(xen_argo_register_ring_t)
+ * arg2: XEN_GUEST_HANDLE(xen_argo_gfn_t)
+ * arg3: unsigned long npages
+ * arg4: unsigned long flags (32-bit value)
+ */
+#define XEN_ARGO_OP_register_ring     1
+
+/* Register op flags */
+/*
+ * Fail exist:
+ * If set, reject attempts to (re)register an existing established ring.
+ * If clear, reregistration occurs if the ring exists, with the new ring
+ * taking the place of the old, preserving tx_ptr if it remains valid.
+ */
+#define XEN_ARGO_REGISTER_FLAG_FAIL_EXIST  0x1
+
+#ifdef __XEN__
+/* Mask for all defined flags. */
+#define XEN_ARGO_REGISTER_FLAG_MASK XEN_ARGO_REGISTER_FLAG_FAIL_EXIST
+#endif
+
+/*
+ * XEN_ARGO_OP_unregister_ring
+ *
+ * Unregister a previously-registered ring, ending communication.
+ *
+ * arg1: XEN_GUEST_HANDLE(xen_argo_unregister_ring_t)
+ * arg2: NULL
+ * arg3: 0 (ZERO)
+ * arg4: 0 (ZERO)
+ */
+#define XEN_ARGO_OP_unregister_ring     2
+
+/*
+ * XEN_ARGO_OP_sendv
+ *
+ * Send a list of buffers contained in iovs.
+ *
+ * The send address struct specifies the source and destination addresses
+ * for the message being sent, which are used to find the destination ring=
:
+ * Xen first looks for a most-specific match with a registered ring with
+ *  (id.addr =3D=3D dst) and (id.partner =3D=3D sending_domain) ;
+ * if that fails, it then looks for a wildcard match (aka multicast receiv=
er)
+ * where (id.addr =3D=3D dst) and (id.partner =3D=3D DOMID_ANY).
+ *
+ * For each iov entry, send iov_len bytes from iov_base to the destination=
 ring.
+ * If insufficient space exists in the destination ring, it will return -E=
AGAIN
+ * and Xen will notify the caller when sufficient space becomes available.
+ *
+ * The message type is a 32-bit data field available to communicate messag=
e
+ * context data (eg. kernel-to-kernel, rather than application layer).
+ *
+ * arg1: XEN_GUEST_HANDLE(xen_argo_send_addr_t) source and dest addresses
+ * arg2: XEN_GUEST_HANDLE(xen_argo_iov_t) iovs
+ * arg3: unsigned long niov
+ * arg4: unsigned long message type (32-bit value)
+ */
+#define XEN_ARGO_OP_sendv               3
+
+/*
+ * XEN_ARGO_OP_notify
+ *
+ * Asks Xen for information about other rings in the system.
+ *
+ * ent->ring is the xen_argo_addr_t of the ring you want information on.
+ * Uses the same ring matching rules as XEN_ARGO_OP_sendv.
+ *
+ * ent->space_required : if this field is not null then Xen will check
+ * that there is space in the destination ring for this many bytes of payl=
oad.
+ * If the ring is too small for the requested space_required, it will set =
the
+ * XEN_ARGO_RING_EMSGSIZE flag on return.
+ * If sufficient space is available, it will set XEN_ARGO_RING_SUFFICIENT
+ * and CANCEL any pending notification for that ent->ring; otherwise it
+ * will schedule a notification event and the flag will not be set.
+ *
+ * These flags are set by Xen when notify replies:
+ * XEN_ARGO_RING_EXISTS     ring exists
+ * XEN_ARGO_RING_SHARED     ring is registered for wildcard partner
+ * XEN_ARGO_RING_EMPTY      ring is empty
+ * XEN_ARGO_RING_SUFFICIENT sufficient space for space_required is there
+ * XEN_ARGO_RING_EMSGSIZE   space_required is too large for the ring size
+ * XEN_ARGO_RING_EBUSY      too many domains waiting for available space s=
ignals
+ *
+ * arg1: XEN_GUEST_HANDLE(xen_argo_ring_data_t) ring_data (may be NULL)
+ * arg2: NULL
+ * arg3: 0 (ZERO)
+ * arg4: 0 (ZERO)
+ */
+#define XEN_ARGO_OP_notify              4
+
+#endif
diff --git a/include/xtf/hypercall.h b/include/xtf/hypercall.h
index 0d33807..17975ba 100644
--- a/include/xtf/hypercall.h
+++ b/include/xtf/hypercall.h
@@ -33,6 +33,7 @@
 extern uint8_t hypercall_page[PAGE_SIZE];
=20
 /* All Xen ABI for includers convenience .*/
+#include <xen/argo.h>
 #include <xen/callback.h>
 #include <xen/elfnote.h>
 #include <xen/errno.h>
diff --git a/include/xtf/numbers.h b/include/xtf/numbers.h
index f5c73b7..b0b2c1b 100644
--- a/include/xtf/numbers.h
+++ b/include/xtf/numbers.h
@@ -52,6 +52,11 @@
  */
 #define _u(v) ((unsigned long)(v))
=20
+/**
+ * Round up a number to the next integer
+ */
+#define roundup(x, y) ((((x) + ((y) - 1)) / (y)) * (y))
+
 #endif /* !__ASSEMBLY__ */
 #endif /* XTF_NUMBERS_H */
=20
diff --git a/tests/argo/Makefile b/tests/argo/Makefile
new file mode 100644
index 0000000..c6b3113
--- /dev/null
+++ b/tests/argo/Makefile
@@ -0,0 +1,9 @@
+include $(ROOT)/build/common.mk
+
+NAME      :=3D argo
+CATEGORY  :=3D in-development
+TEST-ENVS :=3D $(ALL_ENVIRONMENTS)
+
+obj-perenv +=3D main.o
+
+include $(ROOT)/build/gen.mk
diff --git a/tests/argo/main.c b/tests/argo/main.c
new file mode 100644
index 0000000..fa54aed
--- /dev/null
+++ b/tests/argo/main.c
@@ -0,0 +1,353 @@
+/**
+ * @file tests/argo/main.c
+ * @ref test-argo
+ *
+ * @page test-argo argo
+ *
+ * @todo Docs for test-argo
+ *
+ * @see tests/argo/main.c
+ */
+#include <xtf.h>
+
+const char test_title[] =3D "Argo hypercall test";
+
+/*
+ * The current Linux Argo driver has a default ring size of 32 4k pages,
+ * so follow that for the test ring size.
+ */
+static uint8_t ring_buffer[32 * PAGE_SIZE] __page_aligned_bss;
+#define TEST_RING_NPAGES (sizeof(ring_buffer) / PAGE_SIZE)
+
+static int probe_for_argo(domid_t own_domid)
+{
+    /* Attempt an Argo call to register a ring with invalid arguments */
+    xen_argo_register_ring_t reg =3D {
+        .aport      =3D 1,
+        .partner_id =3D own_domid,
+        .len        =3D 1, /* A 1-byte ring is never allowed */
+    };
+    int rc =3D hypercall_argo_op(XEN_ARGO_OP_register_ring, &reg, NULL, 0,=
 0);
+
+    switch ( rc )
+    {
+    case -EINVAL: /* This is the response we are looking for */
+        return 0;
+
+        /* All below here are test exit conditions */
+    case -ENOSYS:
+        xtf_skip("Skip: Argo support has not been enabled in this hypervis=
or\n");
+        break;
+    case -EOPNOTSUPP:
+        xtf_skip("Skip: Argo is not enabled at runtime for this hypervisor=
\n");
+        break;
+    case -ENODEV:
+        xtf_skip("Skip: Argo is not enabled for this domain\n");
+        break;
+
+    case -EPERM:
+        xtf_failure("Fail: ring registration by this domain is not permitt=
ed\n");
+        break;
+    case 0:
+        xtf_failure("Fail: an invalid ring register op was not rejected\n"=
);
+        break;
+    default:
+        xtf_failure("Fail: unknown error %d for invalid ring registration\=
n", rc);
+        break;
+    }
+
+    return -1;
+}
+
+/* notify: asks Xen for information about rings */
+static int
+test_notify_for_one_ring(domid_t query_domid, xen_argo_port_t query_port,
+                         bool exists)
+{
+    struct {
+        xen_argo_ring_data_t data;
+        xen_argo_ring_data_ent_t ents[1];
+    } notify =3D {
+        .data =3D {
+            .nent =3D ARRAY_SIZE(notify.ents),
+        },
+        .ents =3D {
+            {
+                .ring =3D {
+                    .domain_id =3D query_domid,
+                    .aport     =3D query_port,
+                },
+            },
+        },
+    };
+    int rc =3D hypercall_argo_op(XEN_ARGO_OP_notify, &notify, NULL, 0, 0);
+
+    if ( rc )
+    {
+        xtf_failure("Fail: Unexpected error code %d in notify test\n", rc)=
;
+        return -1;
+    }
+
+    if ( !exists )
+    {
+        /* No currently-defined flags should be set for a non-existent rin=
g */
+        if ( notify.ents[0].flags )
+        {
+            xtf_failure("Fail: Non-existent ring reported as existing\n");
+            return -1;
+        }
+    }
+    else
+    {
+        if ( !(notify.ents[0].flags & XEN_ARGO_RING_EXISTS) )
+        {
+            xtf_failure("Fail: Ring not reported as existing\n");
+            return -1;
+        }
+    }
+
+    return 0;
+}
+
+/* See the Argo Linux device driver for similar use of these macros */
+#define XEN_ARGO_ROUNDUP(x) roundup((x), XEN_ARGO_MSG_SLOT_SIZE)
+#define ARGO_RING_OVERHEAD 80
+#define TEST_RING_SIZE(npages)                                      \
+    (XEN_ARGO_ROUNDUP((((PAGE_SIZE)*npages) - ARGO_RING_OVERHEAD)))
+
+static int
+test_register_ring(domid_t own_domid, xen_argo_port_t aport)
+{
+    unsigned int i;
+    xen_argo_register_ring_t reg =3D {
+        .aport      =3D aport,
+        .partner_id =3D own_domid,
+        .len        =3D TEST_RING_SIZE(TEST_RING_NPAGES),
+    };
+    xen_argo_gfn_t gfns[TEST_RING_NPAGES];
+
+    for ( i =3D 0; i < TEST_RING_NPAGES; i++ )
+        gfns[i] =3D virt_to_gfn(ring_buffer + (i * PAGE_SIZE));
+
+    int rc =3D hypercall_argo_op(XEN_ARGO_OP_register_ring, &reg, &gfns,
+                               TEST_RING_NPAGES, XEN_ARGO_REGISTER_FLAG_FA=
IL_EXIST);
+    switch ( rc )
+    {
+    case 0:
+        return 0;
+
+    case -ENODEV:
+        xtf_failure("Fail: Argo is not enabled for this domain\n");
+        break;
+    case -EFAULT:
+        xtf_failure("Fail: Memory fault performing register ring test\n");
+        break;
+    default:
+        xtf_failure("Fail: Unexpected error code %d in register ring test\=
n", rc);
+        break;
+    }
+    return -1;
+}
+
+static int
+test_unregister_ring(domid_t partner_domid, xen_argo_port_t aport,
+                     bool exists)
+{
+    xen_argo_register_ring_t unreg =3D {
+        .aport      =3D aport,
+        .partner_id =3D partner_domid,
+    };
+    int rc =3D hypercall_argo_op(XEN_ARGO_OP_unregister_ring, &unreg, NULL=
, 0, 0);
+
+    switch ( rc )
+    {
+    case 0:
+        if ( exists )
+            return 0;
+        xtf_failure("Fail: unexpected success unregistering non-existent r=
ing\n");
+        return -1;
+
+    case -ENOENT:
+        if ( !exists )
+            return 0;
+        xtf_failure("Fail: unexpected ring not found when unregistering \n=
");
+        return -1;
+
+    default:
+        xtf_failure("Fail: Unexpected error code %d in unregister ring tes=
t\n", rc);
+        break;
+    }
+    return -1;
+}
+
+static int
+test_sendv(domid_t src_domid, xen_argo_port_t src_aport,
+           domid_t dst_domid, xen_argo_port_t dst_aport,
+           const char *msg_text, size_t msg_len, unsigned int msg_type)
+{
+    xen_argo_send_addr_t send_addr =3D {
+        .src =3D {
+            .domain_id =3D src_domid,
+            .aport     =3D src_aport,
+        },
+        .dst =3D {
+            .domain_id =3D dst_domid,
+            .aport     =3D dst_aport,
+        },
+    };
+    xen_argo_iov_t iovs[] =3D {
+        {
+            .iov_hnd =3D _u(msg_text),
+            .iov_len =3D msg_len,
+        },
+    };
+    int rc =3D hypercall_argo_op(XEN_ARGO_OP_sendv, &send_addr,
+                               iovs, ARRAY_SIZE(iovs), msg_type);
+
+    if ( rc < 0 )
+    {
+        xtf_failure("Fail: Unexpected error code %d in sendv test\n", rc);
+        return -1;
+    }
+
+    if ( (size_t)rc !=3D msg_len )
+    {
+        xtf_failure("Fail: Unexpected message size %d written in sendv tes=
t\n", rc);
+        return -1;
+    }
+
+    return 0;
+}
+
+static int
+inspect_ring_after_first_single_sendv(domid_t src_domid,
+                                      xen_argo_port_t src_aport,
+                                      const char *sent_msg,
+                                      unsigned int sent_msg_len,
+                                      unsigned int sent_msg_type)
+{
+    int rc =3D 0;
+    xen_argo_ring_t *ringp =3D (xen_argo_ring_t *)ring_buffer;
+    struct xen_argo_ring_message_header *msg_hdr;
+    unsigned int sent_length;
+
+    if ( ringp->rx_ptr !=3D 0 )
+    {
+        xtf_failure("Fail: receive pointer non-zero after sendv: %u\n",
+                    ringp->rx_ptr);
+        rc =3D -1;
+    }
+
+    if ( ringp->tx_ptr !=3D XEN_ARGO_ROUNDUP(
+             sizeof(struct xen_argo_ring_message_header) + sent_msg_len) )
+    {
+        xtf_failure("Fail: transmit pointer incorrect after sendv: %u\n",
+                    ringp->rx_ptr);
+        rc =3D -1;
+    }
+
+    msg_hdr =3D (struct xen_argo_ring_message_header *)&(ringp->ring);
+
+    if ( msg_hdr->source.domain_id !=3D src_domid )
+    {
+        xtf_failure("Fail: source domain id incorrect: %u, expected %u\n",
+                    msg_hdr->source.domain_id, src_domid);
+        rc =3D -1;
+    }
+
+    if ( msg_hdr->source.aport !=3D src_aport )
+    {
+        xtf_failure("Fail: source domain port incorrect: %u, expected %u\n=
",
+                    msg_hdr->source.domain_id, src_aport);
+        rc =3D -1;
+    }
+
+    if ( msg_hdr->source.pad !=3D 0 )
+    {
+        xtf_failure("Fail: source padding incorrect: %u, expected zero\n",
+                    msg_hdr->source.pad);
+        rc =3D -1;
+    }
+
+    if ( sent_msg_type !=3D msg_hdr->message_type )
+    {
+        xtf_failure("Fail: message type incorrect: %u sent, %u received\n"=
,
+                    sent_msg_type, msg_hdr->message_type);
+        rc =3D -1;
+    }
+
+    sent_length =3D sent_msg_len + sizeof(struct xen_argo_ring_message_hea=
der);
+    if ( sent_length !=3D msg_hdr->len )
+    {
+        xtf_failure("Fail: received message length incorrect: "
+                    "%u sent is %u with header added, %u received\n",
+                    sent_msg_len, sent_length, msg_hdr->len);
+        rc =3D -1;
+    }
+
+    if ( strncmp((const char *)msg_hdr->data, sent_msg, sent_msg_len) )
+    {
+        xtf_failure("Fail: sent message got mangled\n");
+        rc =3D -1;
+    }
+
+    return rc;
+}
+
+static void clear_test_ring(void)
+{
+    memset(ring_buffer, 0, sizeof(ring_buffer));
+}
+
+void test_main(void)
+{
+    int own_domid;
+    xen_argo_port_t test_aport =3D 1;
+    const char simple_text[] =3D "a simple thing to send\n";
+    const unsigned int msg_type =3D 0x12345678;
+
+    own_domid =3D xtf_get_domid();
+    if ( own_domid < 0 )
+        return xtf_error("Error: could not determine domid of the test dom=
ain\n");
+
+    /* First test validates for Argo availability to gate further testing =
*/
+    if ( probe_for_argo(own_domid) )
+        return;
+
+    if ( test_notify_for_one_ring(own_domid, test_aport, false) ||
+         test_unregister_ring(own_domid, test_aport, false) )
+        return;
+
+    clear_test_ring();
+
+    if ( test_register_ring(own_domid, test_aport) ||
+         test_notify_for_one_ring(own_domid, test_aport, true) ||
+         test_unregister_ring(own_domid, test_aport, true) ||
+         test_notify_for_one_ring(own_domid, test_aport, false) ||
+         test_unregister_ring(own_domid, test_aport, false) )
+        return;
+
+    clear_test_ring();
+
+    if ( test_register_ring(own_domid, test_aport) ||
+         test_sendv(own_domid, test_aport, own_domid, test_aport,
+                    simple_text, strlen(simple_text), msg_type) ||
+         inspect_ring_after_first_single_sendv(
+             own_domid, test_aport, simple_text, strlen(simple_text), msg_=
type) ||
+         test_notify_for_one_ring(own_domid, test_aport, true) ||
+         test_unregister_ring(own_domid, test_aport, true) ||
+         test_unregister_ring(own_domid, test_aport, false) )
+        return;
+
+    xtf_success(NULL);
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
--=20
2.34.1



