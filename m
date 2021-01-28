Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD83306D99
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 07:27:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76560.138171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l50lr-00078G-5e; Thu, 28 Jan 2021 06:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76560.138171; Thu, 28 Jan 2021 06:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l50lr-00077t-1j; Thu, 28 Jan 2021 06:27:11 +0000
Received: by outflank-mailman (input) for mailman id 76560;
 Thu, 28 Jan 2021 06:27:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cjbl=G7=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1l50lo-00077o-Lu
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 06:27:08 +0000
Received: from mail-ot1-x329.google.com (unknown [2607:f8b0:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 652e41a2-c8f7-4bca-af58-8f2a519d857b;
 Thu, 28 Jan 2021 06:27:06 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id 36so4222998otp.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jan 2021 22:27:06 -0800 (PST)
Received: from walnut.ice.pyrology.org (mobile-166-176-187-111.mycingular.net.
 [166.176.187.111])
 by smtp.gmail.com with ESMTPSA id y84sm965474oig.36.2021.01.27.22.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 22:27:04 -0800 (PST)
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
X-Inumbo-ID: 652e41a2-c8f7-4bca-af58-8f2a519d857b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=jXcOi3t3iNhKg24AB8K/qz6fgm6UeKoZAlvdh8MWLPs=;
        b=CuYUzG0CogoTg1e0yqrLzyOmnJHmaXICdwpTZ09EPYqF14qmhAuI8OVhLYxELXJrLW
         2VPJUQI0VHRztwh5Rkl/oDOyiQfdpH8fRhfjJmnxgyGtjqMc+pAsBe8Q4ABtelZDsohU
         XTYtn9GYendO6UBE6gaiD3Gw6l6z8d40XcbWYcqYMZk7U1XCKJO0XNE0FWklrpDOVMTI
         KBe/S29+EzAK5QTIunlgN9ldoRixdglrPPHJn9u+V6k/T9kX4yPRHGVz8yvP//29tPMg
         ycCFLhaMnVyP4pTee0q5IFjiA0S2VYaMUX1HD32o5fp893QcB6QFZaQxxVbZ2moxOJb+
         p/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=jXcOi3t3iNhKg24AB8K/qz6fgm6UeKoZAlvdh8MWLPs=;
        b=qnnB1yjYm04jTZuv4eYuXvo2oC7Uv8YtICc1zP1IrZ7OhxGKFDfxb4zt5TsSfNZuCF
         BGQ3pRHDAd7mNG9XG/2G5GlaJYchTXGTLGcmcoI4uja8CDItQfhHBF1oAc0RwZRQpt/6
         Ab/Hn2iKTAZRP9G5J6pnNL+DMUD8C3krLMlcVtx0wSn+VfSWLF07El3lLbcCXh4phuTa
         R9ZMtHF+2SngTJxVHdJ18xiJchBv+Iju48U+8vTzFAgxM/V0Lv3OBg6KNJH1h+ATVyBi
         7fE8sOxXgm3Ki2M+9PsCy9J2r2ZWQQgJTcNXXXG4TCVE3XpQGErKpctgczf3pvLVqdrd
         MG0Q==
X-Gm-Message-State: AOAM531BuAeDpicTHT4IXokG89oO2dXWxDTLThlYT9qSj8DYQ0vAjMoT
	4yjREuqlALDuPEeNXA4P1iC91CdXlt3JPQ==
X-Google-Smtp-Source: ABdhPJy8cGmGzx1YH5WQf39tWCfc9uKIqNP3MzNfIPaiFHciMTg4mO7iYz5gJ9xsxhM1TvETI8ytAQ==
X-Received: by 2002:a05:6830:2313:: with SMTP id u19mr10608421ote.321.1611815225198;
        Wed, 27 Jan 2021 22:27:05 -0800 (PST)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien.grall.oss@gmail.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Rich Persaud <persaur@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	openxt <openxt@googlegroups.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Julien Grall <jgrall@amazon.com>,
	James McKenzie <james@bromium.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Paul Durrant <pdurrant@amazon.co.uk>,
	Jean-Philippe Ouellet <jpo@vt.edu>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>
Subject: [XTF v2] Add Argo test
Date: Wed, 27 Jan 2021 22:26:35 -0800
Message-Id: <20210128062635.29677-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1

Simple test cases for the four Argo operations, register, unregister,
sendv and notify exercised with a single test domain.
Add infrastructure to access Argo: a 5-argument hypercall, number 39.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
v2:
- corrected the CC list. Apologies for the omissions in posting v1.

- update to use $(ALL_ENVIRONMENTS) in TEST-ENVS: pv32pae
  was unintentionally missing and all are wanted included.

 arch/x86/hypercall_page.S                |   2 +-
 arch/x86/include/arch/hypercall-x86_32.h |  13 +
 arch/x86/include/arch/hypercall-x86_64.h |  14 +
 docs/all-tests.dox                       |   2 +
 include/xen/argo.h                       | 255 ++++++++++++++++
 include/xen/xen.h                        |  11 +-
 include/xtf/hypercall.h                  |   8 +
 include/xtf/numbers.h                    |   5 +
 tests/argo/Makefile                      |   9 +
 tests/argo/main.c                        | 360 +++++++++++++++++++++++
 10 files changed, 677 insertions(+), 2 deletions(-)
 create mode 100644 include/xen/argo.h
 create mode 100644 tests/argo/Makefile
 create mode 100644 tests/argo/main.c

diff --git a/arch/x86/hypercall_page.S b/arch/x86/hypercall_page.S
index b77c1b9..cc6ddc2 100644
--- a/arch/x86/hypercall_page.S
+++ b/arch/x86/hypercall_page.S
@@ -59,7 +59,7 @@ DECLARE_HYPERCALL(sysctl)
 DECLARE_HYPERCALL(domctl)
 DECLARE_HYPERCALL(kexec_op)
 DECLARE_HYPERCALL(tmem_op)
-DECLARE_HYPERCALL(xc_reserved_op)
+DECLARE_HYPERCALL(argo_op)
 DECLARE_HYPERCALL(xenpmu_op)
 
 DECLARE_HYPERCALL(arch_0)
diff --git a/arch/x86/include/arch/hypercall-x86_32.h b/arch/x86/include/arch/hypercall-x86_32.h
index 34a7026..f372291 100644
--- a/arch/x86/include/arch/hypercall-x86_32.h
+++ b/arch/x86/include/arch/hypercall-x86_32.h
@@ -53,6 +53,19 @@
         (type)res;                                                      \
     })
 
+#define _hypercall32_5(type, hcall, a1, a2, a3, a4, a5)                 \
+    ({                                                                  \
+        long res, _a1 = (long)(a1), _a2 = (long)(a2), _a3 = (long)(a3), \
+            _a4 = (long)(a4), _a5 = (long)(a5);                         \
+        asm volatile (                                                  \
+            "call hypercall_page + %c[offset]"                          \
+            : "=a" (res), "+b" (_a1), "+c" (_a2), "+d" (_a3),           \
+              "+S" (_a4), "+D" (_a5)                                    \
+            : [offset] "i" (hcall * 32)                                 \
+            : "memory" );                                               \
+        (type)res;                                                      \
+    })
+
 #endif /* XTF_X86_32_HYPERCALL_H */
 
 /*
diff --git a/arch/x86/include/arch/hypercall-x86_64.h b/arch/x86/include/arch/hypercall-x86_64.h
index d283ad3..728bf74 100644
--- a/arch/x86/include/arch/hypercall-x86_64.h
+++ b/arch/x86/include/arch/hypercall-x86_64.h
@@ -53,6 +53,20 @@
         (type)res;                                                      \
     })
 
+#define _hypercall64_5(type, hcall, a1, a2, a3, a4, a5)                 \
+    ({                                                                  \
+        long res, _a1 = (long)(a1), _a2 = (long)(a2), _a3 = (long)(a3); \
+        register long _a4 asm ("r10") = (long)(a4);                     \
+        register long _a5 asm ("r8") = (long)(a5);                     \
+        asm volatile (                                                  \
+            "call hypercall_page + %c[offset]"                          \
+            : "=a" (res), "+D" (_a1), "+S" (_a2), "+d" (_a3),           \
+              "+r" (_a4), "+r" (_a5)                                    \
+            : [offset] "i" (hcall * 32)                                 \
+            : "memory" );                                               \
+        (type)res;                                                      \
+    })
+
 #endif /* XTF_X86_64_HYPERCALL_H */
 
 /*
diff --git a/docs/all-tests.dox b/docs/all-tests.dox
index 902fc44..bed674c 100644
--- a/docs/all-tests.dox
+++ b/docs/all-tests.dox
@@ -164,6 +164,8 @@ states.
 
 @section index-utility Utilities
 
+@subpage test-argo - Argo functionality test
+
 @subpage test-cpuid - Print CPUID information.
 
 @subpage test-fep - Test availability of HVM Forced Emulation Prefix.
diff --git a/include/xen/argo.h b/include/xen/argo.h
new file mode 100644
index 0000000..58ff439
--- /dev/null
+++ b/include/xen/argo.h
@@ -0,0 +1,255 @@
+/******************************************************************************
+ * Argo : Hypervisor-Mediated data eXchange
+ *
+ * Derived from v4v, the version 2 of v2v.
+ *
+ * Copyright (c) 2010, Citrix Systems
+ * Copyright (c) 2018-2019, BAE Systems
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
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
+#include "xen.h"
+
+#define XEN_ARGO_DOMID_ANY       DOMID_INVALID
+
+/* The maximum size of an Argo ring is defined to be: 16MB (0x1000000 bytes). */
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
+ * Caution is required if this value is increased: this determines the size of
+ * an array of xen_argo_iov_t structs on the hypervisor stack, so could cause
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
+     * Header space reserved for later use. Align the start of the ring to a
+     * multiple of the message slot size.
+     */
+    uint8_t reserved[56];
+    uint8_t ring[XEN_FLEX_ARRAY_DIM];
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
+    struct xen_argo_ring_data_ent data[XEN_FLEX_ARRAY_DIM];
+} xen_argo_ring_data_t;
+
+struct xen_argo_ring_message_header
+{
+    uint32_t len;
+    struct xen_argo_addr source;
+    uint32_t message_type;
+    uint8_t data[XEN_FLEX_ARRAY_DIM];
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
+ * Also used to reregister an existing ring (eg. after resume from hibernate).
+ *
+ * The first argument struct indicates the port number for the ring to register
+ * and the partner domain, if any, that is to be allowed to send to the ring.
+ * A wildcard (XEN_ARGO_DOMID_ANY) may be supplied instead of a partner domid,
+ * and if the hypervisor has wildcard sender rings enabled, this will allow
+ * any domain (XSM notwithstanding) to send to the ring.
+ *
+ * The second argument is an array of guest frame numbers and the third argument
+ * indicates the size of the array. This operation only supports 4K-sized pages.
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
+ * for the message being sent, which are used to find the destination ring:
+ * Xen first looks for a most-specific match with a registered ring with
+ *  (id.addr == dst) and (id.partner == sending_domain) ;
+ * if that fails, it then looks for a wildcard match (aka multicast receiver)
+ * where (id.addr == dst) and (id.partner == DOMID_ANY).
+ *
+ * For each iov entry, send iov_len bytes from iov_base to the destination ring.
+ * If insufficient space exists in the destination ring, it will return -EAGAIN
+ * and Xen will notify the caller when sufficient space becomes available.
+ *
+ * The message type is a 32-bit data field available to communicate message
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
+ * that there is space in the destination ring for this many bytes of payload.
+ * If the ring is too small for the requested space_required, it will set the
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
+ * XEN_ARGO_RING_EBUSY      too many domains waiting for available space signals
+ *
+ * arg1: XEN_GUEST_HANDLE(xen_argo_ring_data_t) ring_data (may be NULL)
+ * arg2: NULL
+ * arg3: 0 (ZERO)
+ * arg4: 0 (ZERO)
+ */
+#define XEN_ARGO_OP_notify              4
+
+#endif
diff --git a/include/xen/xen.h b/include/xen/xen.h
index 877f2f0..bcde4ad 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -49,7 +49,7 @@
 #define __HYPERVISOR_domctl               36
 #define __HYPERVISOR_kexec_op             37
 #define __HYPERVISOR_tmem_op              38
-#define __HYPERVISOR_xc_reserved_op       39 /* reserved for XenClient */
+#define __HYPERVISOR_argo_op              39
 #define __HYPERVISOR_xenpmu_op            40
 
 /* Architecture-specific hypercall definitions. */
@@ -66,6 +66,15 @@
 typedef uint16_t domid_t;
 #endif
 
+/* Define a variable length array (depends on compiler). */
+#if defined(__STDC_VERSION__) && __STDC_VERSION__ >= 199901L
+#define XEN_FLEX_ARRAY_DIM
+#elif defined(__GNUC__)
+#define XEN_FLEX_ARRAY_DIM  0
+#else
+#define XEN_FLEX_ARRAY_DIM  1 /* variable size */
+#endif
+
 #define DOMID_FIRST_RESERVED (0x7ff0U)
 #define DOMID_SELF (0x7ff0U)
 
diff --git a/include/xtf/hypercall.h b/include/xtf/hypercall.h
index acda592..2d3d7ee 100644
--- a/include/xtf/hypercall.h
+++ b/include/xtf/hypercall.h
@@ -13,6 +13,7 @@
 # define HYPERCALL2 _hypercall64_2
 # define HYPERCALL3 _hypercall64_3
 # define HYPERCALL4 _hypercall64_4
+# define HYPERCALL5 _hypercall64_5
 
 #elif defined(__i386__)
 
@@ -21,6 +22,7 @@
 # define HYPERCALL2 _hypercall32_2
 # define HYPERCALL3 _hypercall32_3
 # define HYPERCALL4 _hypercall32_4
+# define HYPERCALL5 _hypercall32_5
 
 #else
 # error Bad architecture for hypercalls
@@ -170,6 +172,12 @@ static inline long hypercall_sysctl(xen_sysctl_t *arg)
     return HYPERCALL1(long, __HYPERVISOR_sysctl, arg);
 }
 
+static inline long hypercall_argo_op(unsigned int cmd, void *arg1, void *arg2,
+                                     unsigned long arg3, unsigned long arg4)
+{
+    return HYPERCALL5(long, __HYPERVISOR_argo_op, cmd, arg1, arg2, arg3, arg4);
+}
+
 /*
  * Higher level hypercall helpers
  */
diff --git a/include/xtf/numbers.h b/include/xtf/numbers.h
index f5c73b7..b0b2c1b 100644
--- a/include/xtf/numbers.h
+++ b/include/xtf/numbers.h
@@ -52,6 +52,11 @@
  */
 #define _u(v) ((unsigned long)(v))
 
+/**
+ * Round up a number to the next integer
+ */
+#define roundup(x, y) ((((x) + ((y) - 1)) / (y)) * (y))
+
 #endif /* !__ASSEMBLY__ */
 #endif /* XTF_NUMBERS_H */
 
diff --git a/tests/argo/Makefile b/tests/argo/Makefile
new file mode 100644
index 0000000..51d72f3
--- /dev/null
+++ b/tests/argo/Makefile
@@ -0,0 +1,9 @@
+include $(ROOT)/build/common.mk
+
+NAME      := argo
+CATEGORY  := utility
+TEST-ENVS := $(ALL_ENVIRONMENTS)
+
+obj-perenv += main.o
+
+include $(ROOT)/build/gen.mk
diff --git a/tests/argo/main.c b/tests/argo/main.c
new file mode 100644
index 0000000..8eac3d2
--- /dev/null
+++ b/tests/argo/main.c
@@ -0,0 +1,360 @@
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
+#include <xtf/lib.h>
+#include <xen/argo.h>
+
+const char test_title[] = "Argo hypercall test";
+
+/*
+ * The current Linux Argo driver has a default ring size of 32 4k pages,
+ * so follow that for the test ring size.
+ */
+#define TEST_RING_NPAGES 32
+static uint8_t ring_buffer[PAGE_SIZE * TEST_RING_NPAGES] __page_aligned_bss;
+
+static int
+test_invalid_register_ring(void)
+{
+    int rc;
+
+    /* attempt an Argo call to register a ring with invalid arguments */
+    rc = hypercall_argo_op(XEN_ARGO_OP_register_ring, NULL, NULL,
+                           XEN_ARGO_MAX_RING_SIZE + 1, /* never allowed */
+                           0);
+    switch (rc) {
+        case -EINVAL: /* this is the response we are looking for */
+            return 0;
+
+        /* All below here are test exit conditions */
+        case 0:
+            xtf_failure("Fail: an invalid ring register op was not rejected\n");
+            break;
+        case -ENOSYS:
+            xtf_error("Error: Argo support has not been enabled in this hypervisor\n");
+            break;
+        case -EOPNOTSUPP:
+            xtf_error("Error: Argo is not enabled at runtime for this hypervisor\n");
+            break;
+        case -ENODEV:
+            xtf_error("Error: Argo is not enabled for this domain\n");
+            break;
+        case -EPERM:
+            xtf_failure("Fail: ring registration by this domain is not permitted\n");
+            break;
+        default:
+            xtf_failure("Fail: unknown error %d for invalid ring registration\n", rc);
+            break;
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
+    int rc;
+    /* buffer for populating a struct with a variable length array member */
+    uint8_t raw_buf[sizeof(xen_argo_ring_data_t) + 1 * sizeof(xen_argo_ring_data_ent_t)];
+    xen_argo_ring_data_t *p_ring_data;
+
+    p_ring_data = (xen_argo_ring_data_t *)&raw_buf;
+    p_ring_data->nent = 1;
+    p_ring_data->pad = 0;
+
+    p_ring_data->data[0].ring.domain_id = query_domid;
+    p_ring_data->data[0].ring.aport = query_port;
+    p_ring_data->data[0].ring.pad = 0;
+
+    p_ring_data->data[0].flags = 0;
+    p_ring_data->data[0].space_required = 0;
+    p_ring_data->data[0].max_message_size = 0;
+    p_ring_data->data[0].pad = 0;
+
+    rc = hypercall_argo_op(XEN_ARGO_OP_notify, p_ring_data, NULL, 0, 0);
+
+    switch (rc) {
+        case 0:
+            break;
+        case -ENODEV:
+            xtf_failure("Fail: Argo is not enabled for this domain\n");
+            return -1;
+        case -EFAULT:
+            xtf_failure("Fail: Memory fault performing notify test\n");
+            return -1;
+        default:
+            xtf_failure("Fail: Unexpected error code %d in notify test\n", rc);
+            return -1;
+    }
+
+    if ( !exists )
+    {
+        /* No currently-defined flags should be set for a non-existent ring */
+        if ( p_ring_data->data[0].flags )
+        {
+            xtf_failure("Fail: Non-existent ring reported as existing\n");
+            return -1;
+        }
+    }
+    else
+    {
+        if ( !(p_ring_data->data[0].flags & XEN_ARGO_RING_EXISTS) )
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
+#define TEST_RING_SIZE(npages) \
+        (XEN_ARGO_ROUNDUP((((PAGE_SIZE)*npages) - ARGO_RING_OVERHEAD)))
+
+static int
+test_register_ring(domid_t own_domid, xen_argo_port_t aport)
+{
+    int rc;
+    unsigned int i;
+    xen_argo_register_ring_t reg;
+    xen_argo_gfn_t gfns[TEST_RING_NPAGES];
+
+    reg.aport = aport;
+    reg.partner_id = own_domid;
+    reg.len = TEST_RING_SIZE(TEST_RING_NPAGES);
+    reg.pad = 0;
+
+    for ( i = 0; i < TEST_RING_NPAGES; i++ )
+        gfns[i] = virt_to_gfn(ring_buffer + (i * PAGE_SIZE));
+
+    rc = hypercall_argo_op(XEN_ARGO_OP_register_ring, &reg, &gfns,
+                           TEST_RING_NPAGES, XEN_ARGO_REGISTER_FLAG_FAIL_EXIST);
+    switch (rc) {
+        case 0:
+            return 0;
+
+        case -ENODEV:
+            xtf_failure("Fail: Argo is not enabled for this domain\n");
+            break;
+        case -EFAULT:
+            xtf_failure("Fail: Memory fault performing register ring test\n");
+            break;
+        default:
+            xtf_failure("Fail: Unexpected error code %d in register ring test\n", rc);
+            break;
+    }
+    return -1;
+}
+
+static int
+test_unregister_ring(domid_t partner_domid, xen_argo_port_t aport,
+                     bool exists)
+{
+    int rc;
+    xen_argo_register_ring_t unreg;
+
+    unreg.aport = aport;
+    unreg.partner_id = partner_domid;
+    unreg.pad = 0;
+
+    rc = hypercall_argo_op(XEN_ARGO_OP_unregister_ring, &unreg, NULL, 0, 0);
+
+    switch (rc) {
+        case 0:
+            if ( exists )
+                return 0;
+            xtf_failure("Fail: unexpected success unregistering non-existent ring\n");
+            return -1;
+
+        case -ENOENT:
+            if ( !exists )
+                return 0;
+            xtf_failure("Fail: unexpected ring not found when unregistering \n");
+            return -1;
+
+        default:
+            xtf_failure("Fail: Unexpected error code %d in unregister ring test\n", rc);
+            break;
+    }
+    return -1;
+}
+
+static int
+test_sendv(domid_t src_domid, xen_argo_port_t src_aport,
+           domid_t dst_domid, xen_argo_port_t dst_aport,
+           const char *msg_text, int msg_len, unsigned int msg_type)
+{
+    int rc;
+    xen_argo_send_addr_t send_addr;
+    xen_argo_iov_t iovs[1];
+    unsigned int niov;
+
+    send_addr.src.domain_id = src_domid;
+    send_addr.src.aport     = src_aport;
+    send_addr.src.pad       = 0;
+    send_addr.dst.domain_id = dst_domid;
+    send_addr.dst.aport     = dst_aport;
+    send_addr.dst.pad       = 0;
+
+    iovs[0].iov_hnd = (unsigned long)msg_text;
+    iovs[0].iov_len = msg_len;
+    iovs[0].pad = 0;
+    niov = 1;
+
+    rc = hypercall_argo_op(XEN_ARGO_OP_sendv, &send_addr, &iovs, niov, msg_type);
+
+    if ( rc != msg_len )
+    {
+        if ( rc < 0 )
+        {
+            xtf_failure("Fail: Unexpected error code %d in sendv test\n", rc);
+            return -1;
+        }
+        xtf_failure("Fail: Unexpected message size %d written in sendv test\n", rc);
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
+    int rc = 0;
+    xen_argo_ring_t *ringp = (xen_argo_ring_t *)ring_buffer;
+    struct xen_argo_ring_message_header *msg_hdr;
+    unsigned int sent_length;
+
+    if ( ringp->rx_ptr != 0 )
+    {
+        xtf_failure("Fail: receive pointer non-zero after sendv: %u\n",
+                    ringp->rx_ptr);
+        rc = -1;
+    }
+
+    if ( ringp->tx_ptr != XEN_ARGO_ROUNDUP(
+                sizeof(struct xen_argo_ring_message_header) + sent_msg_len) )
+    {
+        xtf_failure("Fail: transmit pointer incorrect after sendv: %u\n",
+                    ringp->rx_ptr);
+        rc = -1;
+    }
+
+    msg_hdr = (struct xen_argo_ring_message_header *)&(ringp->ring);
+
+    if ( msg_hdr->source.domain_id != src_domid )
+    {
+        xtf_failure("Fail: source domain id incorrect: %u, expected %u\n",
+                    msg_hdr->source.domain_id, src_domid);
+        rc = -1;
+    }
+
+    if ( msg_hdr->source.aport != src_aport )
+    {
+        xtf_failure("Fail: source domain port incorrect: %u, expected %u\n",
+                    msg_hdr->source.domain_id, src_aport);
+        rc = -1;
+    }
+
+    if ( msg_hdr->source.pad != 0 )
+    {
+        xtf_failure("Fail: source padding incorrect: %u, expected zero\n",
+                    msg_hdr->source.pad);
+        rc = -1;
+    }
+
+    if ( sent_msg_type != msg_hdr->message_type )
+    {
+        xtf_failure("Fail: message type incorrect: %u sent, %u received\n",
+                    sent_msg_type, msg_hdr->message_type);
+        rc = -1;
+    }
+
+    sent_length = sent_msg_len + sizeof(struct xen_argo_ring_message_header);
+    if ( sent_length != msg_hdr->len )
+    {
+        xtf_failure("Fail: received message length incorrect: "
+                    "%u sent is %u with header added, %u received\n",
+                    sent_msg_len, sent_length, msg_hdr->len);
+        rc = -1;
+    }
+
+    if ( strncmp((const char *)msg_hdr->data, sent_msg, sent_msg_len) )
+    {
+        xtf_failure("Fail: sent message got mangled\n");
+        rc = -1;
+    }
+
+    return rc;
+}
+
+static int
+clear_test_ring(void)
+{
+    memset(ring_buffer, 0, PAGE_SIZE * TEST_RING_NPAGES);
+    return 0;
+}
+
+void test_main(void)
+{
+    int own_domid;
+    xen_argo_port_t test_aport = 1;
+    const char simple_text[] = "a simple thing to send\n";
+    const unsigned int msg_type = 0x12345678;
+
+    /* First test validates for Argo availability to gate further testing */
+    if ( test_invalid_register_ring() )
+        return;
+
+    own_domid = xtf_get_domid();
+    if ( own_domid < 0 )
+        return xtf_error("Error: could not determine domid of the test domain\n");
+
+    if ( test_notify_for_one_ring(own_domid, test_aport, false) ||
+         test_unregister_ring(own_domid, test_aport, false) ||
+         clear_test_ring() ||
+         test_register_ring(own_domid, test_aport) ||
+         test_notify_for_one_ring(own_domid, test_aport, true) ||
+         test_unregister_ring(own_domid, test_aport, true) ||
+         test_notify_for_one_ring(own_domid, test_aport, false) ||
+         test_unregister_ring(own_domid, test_aport, false) ||
+         clear_test_ring() ||
+         test_register_ring(own_domid, test_aport) ||
+         test_sendv(own_domid, test_aport, own_domid, test_aport,
+                    simple_text, sizeof(simple_text), msg_type) ||
+         inspect_ring_after_first_single_sendv(own_domid, test_aport,
+                    simple_text, sizeof(simple_text), msg_type) ||
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
-- 
2.17.1


