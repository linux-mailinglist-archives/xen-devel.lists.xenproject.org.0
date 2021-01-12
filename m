Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B342F3C07
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 22:59:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66087.117318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRgu-0003s1-7c; Tue, 12 Jan 2021 21:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66087.117318; Tue, 12 Jan 2021 21:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRgt-0003pc-Aa; Tue, 12 Jan 2021 21:59:03 +0000
Received: by outflank-mailman (input) for mailman id 66087;
 Tue, 12 Jan 2021 21:59:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OoN1=GP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kzRcK-0002PK-Hx
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 21:54:20 +0000
Received: from mail-wm1-x32c.google.com (unknown [2a00:1450:4864:20::32c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90c5522e-26e6-4917-b699-90783bb57146;
 Tue, 12 Jan 2021 21:53:09 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id n16so2524460wmc.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 13:53:09 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 138sm6574053wma.41.2021.01.12.13.53.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Jan 2021 13:53:07 -0800 (PST)
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
X-Inumbo-ID: 90c5522e-26e6-4917-b699-90783bb57146
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ctJHynHYB61JLOWuXCjsQ1SiKOGqSkrVJrmKjemxi5I=;
        b=AuIUSAfQEzVauc7mnrzS8bjx01c7HufJJWAHcaKj37G6c7gZ2cS/MwW1wpZMc3Ga5k
         PHAHgsg8GqVdw76giytc55whAVa6VVhJR7UdkcBaN6fBfW7oDxYPP+XMilXzbMvty0ai
         qzc1iOVyvr+91vgXLY+lNG8SdwV8LWFsIwmlDSQQYDKqAepig1mHV7SUxoTvn1THqZgh
         cgpw9bFGj776pwWsC6Za1WJ4qeDtEfoLkK2lz7odMspxBF/zaqcmx7PSXkH9vvhNtQcR
         ktnlECv/9jtnlvrqlQeUpf7eP0hYFRumKgpSYJv3q6S9NST3nyXTTdn72anetlVJwQQ0
         oaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ctJHynHYB61JLOWuXCjsQ1SiKOGqSkrVJrmKjemxi5I=;
        b=W+RBYAJh26aG+8K9iz8A2pA47p1t/7PiRxhtiWHPaRajoylE8fcVQvbbdQ1rA16InH
         bYiNzAtUNk70IRRiUFq+9E1yNvRv0GRR98F9iSk7fEEJT8850eGDjrNDRrXZzx0unPfA
         bIJ47jmfNklY7XFL2sCdhqK0XjWWxu4V6A3O+yQtaIGVzp5ZJz+hVrId69NF9AcOBZhs
         KlQVqqPywZDCVhn5ath4qpV8OdCOO9WAaoc4bUBto3j9/ByY4MPSEsGdPzH6f32Z18ml
         /+lKfWCUR6s66oM9YwFSyRgt+lVq3uwPFpR9xppHsu2oM8qbvqqaEtYq4WBrBbIWDYt1
         CW8g==
X-Gm-Message-State: AOAM532JEGJ33FaH5OwmrZnGNEF7hdQT/IZSQjXEdnqM177BHB4Y9cYZ
	EuL2KCNey3dqWjc30KOh76smqR6M6FpUnA==
X-Google-Smtp-Source: ABdhPJwPmq5AMJcnqJE90DDTICTNkKFHsVHAEO2hOkRSZ4UzLfZ03Wk2z6CTmp4OCagZW8eeTfr/lQ==
X-Received: by 2002:a1c:4483:: with SMTP id r125mr1120439wma.80.1610488387898;
        Tue, 12 Jan 2021 13:53:07 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V4 14/24] arm/ioreq: Introduce arch specific bits for IOREQ/DM features
Date: Tue, 12 Jan 2021 23:52:22 +0200
Message-Id: <1610488352-18494-15-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Julien Grall <julien.grall@arm.com>

This patch adds basic IOREQ/DM support on Arm. The subsequent
patches will improve functionality and add remaining bits.

The IOREQ/DM features are supposed to be built with IOREQ_SERVER
option enabled, which is disabled by default on Arm for now.

Please note, the "PIO handling" TODO is expected to left unaddressed
for the current series. It is not an big issue for now while Xen
doesn't have support for vPCI on Arm. On Arm64 they are only used
for PCI IO Bar and we would probably want to expose them to emulator
as PIO access to make a DM completely arch-agnostic. So "PIO handling"
should be implemented when we add support for vPCI.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - was split into:
     - arm/ioreq: Introduce arch specific bits for IOREQ/DM features
     - xen/mm: Handle properly reference in set_foreign_p2m_entry() on Arm
   - update patch description
   - update asm-arm/hvm/ioreq.h according to the newly introduced arch functions:
     - arch_hvm_destroy_ioreq_server()
     - arch_handle_hvm_io_completion()
   - update arch files to include xen/ioreq.h
   - remove HVMOP plumbing
   - rewrite a logic to handle properly case when hvm_send_ioreq() returns IO_RETRY
   - add a logic to handle properly handle_hvm_io_completion() return value
   - rename handle_mmio() to ioreq_handle_complete_mmio()
   - move paging_mark_pfn_dirty() to asm-arm/paging.h
   - remove forward declaration for hvm_ioreq_server in asm-arm/paging.h
   - move try_fwd_ioserv() to ioreq.c, provide stubs if !CONFIG_IOREQ_SERVER
   - do not remove #ifdef CONFIG_IOREQ_SERVER in memory.c for guarding xen/ioreq.h
   - use gdprintk in try_fwd_ioserv(), remove unneeded prints
   - update list of #include-s
   - move has_vpci() to asm-arm/domain.h
   - add a comment (TODO) to unimplemented yet handle_pio()
   - remove hvm_mmio_first(last)_byte() and hvm_ioreq_(page/vcpu/server) structs
     from the arch files, they were already moved to the common code
   - remove set_foreign_p2m_entry() changes, they will be properly implemented
     in the follow-up patch
   - select IOREQ_SERVER for Arm instead of Arm64 in Kconfig
   - remove x86's realmode and other unneeded stubs from xen/ioreq.h
   - clafify ioreq_t p.df usage in try_fwd_ioserv()
   - set ioreq_t p.count to 1 in try_fwd_ioserv()

Changes V1 -> V2:
   - was split into:
     - arm/ioreq: Introduce arch specific bits for IOREQ/DM features
     - xen/arm: Stick around in leave_hypervisor_to_guest until I/O has completed
   - update the author of a patch
   - update patch description
   - move a loop in leave_hypervisor_to_guest() to a separate patch
   - set IOREQ_SERVER disabled by default
   - remove already clarified /* XXX */
   - replace BUG() by ASSERT_UNREACHABLE() in handle_pio()
   - remove default case for handling the return value of try_handle_mmio()
   - remove struct hvm_domain, enum hvm_io_completion, struct hvm_vcpu_io,
     struct hvm_vcpu from asm-arm/domain.h, these are common materials now
   - update everything according to the recent changes (IOREQ related function
     names don't contain "hvm" prefixes/infixes anymore, IOREQ related fields
     are part of common struct vcpu/domain now, etc)

Changes V2 -> V3:
   - update patch according the "legacy interface" is x86 specific
   - add dummy arch hooks
   - remove dummy paging_mark_pfn_dirty()
   - don’t include <xen/domain_page.h> in common ioreq.c
   - don’t include <public/hvm/ioreq.h> in arch ioreq.h
   - remove #define ioreq_params(d, i)

Changes V3 -> V4:
   - rebase
   - update patch according to the renaming IO_ -> VIO_ (io_ -> vio_)
     and misc changes to arch hooks
   - update patch according to the IOREQ related dm-op handling changes
   - don't include <xen/ioreq.h> from arch header
   - make all arch hooks out-of-line
   - add a comment above IOREQ_STATUS_* #define-s
---
 xen/arch/arm/Makefile           |   2 +
 xen/arch/arm/dm.c               | 122 +++++++++++++++++++++++
 xen/arch/arm/domain.c           |   9 ++
 xen/arch/arm/io.c               |  12 ++-
 xen/arch/arm/ioreq.c            | 213 ++++++++++++++++++++++++++++++++++++++++
 xen/arch/arm/traps.c            |  13 +++
 xen/include/asm-arm/domain.h    |   3 +
 xen/include/asm-arm/hvm/ioreq.h |  72 ++++++++++++++
 xen/include/asm-arm/mmio.h      |   1 +
 9 files changed, 446 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/dm.c
 create mode 100644 xen/arch/arm/ioreq.c
 create mode 100644 xen/include/asm-arm/hvm/ioreq.h

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 512ffdd..16e6523 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -13,6 +13,7 @@ obj-y += cpuerrata.o
 obj-y += cpufeature.o
 obj-y += decode.o
 obj-y += device.o
+obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
 obj-y += domain_build.init.o
 obj-y += domctl.o
@@ -27,6 +28,7 @@ obj-y += guest_atomics.o
 obj-y += guest_walk.o
 obj-y += hvm.o
 obj-y += io.o
+obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
 obj-y += irq.o
 obj-y += kernel.init.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
new file mode 100644
index 0000000..e6dedf4
--- /dev/null
+++ b/xen/arch/arm/dm.c
@@ -0,0 +1,122 @@
+/*
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
+#include <xen/dm.h>
+#include <xen/guest_access.h>
+#include <xen/hypercall.h>
+#include <xen/ioreq.h>
+#include <xen/nospec.h>
+
+static int dm_op(const struct dmop_args *op_args)
+{
+    struct domain *d;
+    struct xen_dm_op op;
+    bool const_op = true;
+    long rc;
+    size_t offset;
+
+    static const uint8_t op_size[] = {
+        [XEN_DMOP_create_ioreq_server]              = sizeof(struct xen_dm_op_create_ioreq_server),
+        [XEN_DMOP_get_ioreq_server_info]            = sizeof(struct xen_dm_op_get_ioreq_server_info),
+        [XEN_DMOP_map_io_range_to_ioreq_server]     = sizeof(struct xen_dm_op_ioreq_server_range),
+        [XEN_DMOP_unmap_io_range_from_ioreq_server] = sizeof(struct xen_dm_op_ioreq_server_range),
+        [XEN_DMOP_set_ioreq_server_state]           = sizeof(struct xen_dm_op_set_ioreq_server_state),
+        [XEN_DMOP_destroy_ioreq_server]             = sizeof(struct xen_dm_op_destroy_ioreq_server),
+    };
+
+    rc = rcu_lock_remote_domain_by_id(op_args->domid, &d);
+    if ( rc )
+        return rc;
+
+    rc = xsm_dm_op(XSM_DM_PRIV, d);
+    if ( rc )
+        goto out;
+
+    offset = offsetof(struct xen_dm_op, u);
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
+    rc = ioreq_server_dm_op(&op, d, &const_op);
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
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 18cafcd..8f55aba 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -15,6 +15,7 @@
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
 #include <xen/init.h>
+#include <xen/ioreq.h>
 #include <xen/lib.h>
 #include <xen/livepatch.h>
 #include <xen/sched.h>
@@ -696,6 +697,10 @@ int arch_domain_create(struct domain *d,
 
     ASSERT(config != NULL);
 
+#ifdef CONFIG_IOREQ_SERVER
+    ioreq_domain_init(d);
+#endif
+
     /* p2m_init relies on some value initialized by the IOMMU subsystem */
     if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
         goto fail;
@@ -1014,6 +1019,10 @@ int domain_relinquish_resources(struct domain *d)
         if (ret )
             return ret;
 
+#ifdef CONFIG_IOREQ_SERVER
+        ioreq_server_destroy_all(d);
+#endif
+
     PROGRESS(xen):
         ret = relinquish_memory(d, &d->xenpage_list);
         if ( ret )
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index ae7ef96..9814481 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -16,6 +16,7 @@
  * GNU General Public License for more details.
  */
 
+#include <xen/ioreq.h>
 #include <xen/lib.h>
 #include <xen/spinlock.h>
 #include <xen/sched.h>
@@ -23,6 +24,7 @@
 #include <asm/cpuerrata.h>
 #include <asm/current.h>
 #include <asm/mmio.h>
+#include <asm/hvm/ioreq.h>
 
 #include "decode.h"
 
@@ -123,7 +125,15 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
 
     handler = find_mmio_handler(v->domain, info.gpa);
     if ( !handler )
-        return IO_UNHANDLED;
+    {
+        int rc;
+
+        rc = try_fwd_ioserv(regs, v, &info);
+        if ( rc == IO_HANDLED )
+            return handle_ioserv(regs, v);
+
+        return rc;
+    }
 
     /* All the instructions used on emulated MMIO region should be valid */
     if ( !dabt.valid )
diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
new file mode 100644
index 0000000..3c4a24d
--- /dev/null
+++ b/xen/arch/arm/ioreq.c
@@ -0,0 +1,213 @@
+/*
+ * arm/ioreq.c: hardware virtual machine I/O emulation
+ *
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
+#include <xen/domain.h>
+#include <xen/ioreq.h>
+
+#include <asm/traps.h>
+
+#include <public/hvm/ioreq.h>
+
+enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
+{
+    const union hsr hsr = { .bits = regs->hsr };
+    const struct hsr_dabt dabt = hsr.dabt;
+    /* Code is similar to handle_read */
+    uint8_t size = (1 << dabt.size) * 8;
+    register_t r = v->io.req.data;
+
+    /* We are done with the IO */
+    v->io.req.state = STATE_IOREQ_NONE;
+
+    if ( dabt.write )
+        return IO_HANDLED;
+
+    /*
+     * Sign extend if required.
+     * Note that we expect the read handler to have zeroed the bits
+     * outside the requested access size.
+     */
+    if ( dabt.sign && (r & (1UL << (size - 1))) )
+    {
+        /*
+         * We are relying on register_t using the same as
+         * an unsigned long in order to keep the 32-bit assembly
+         * code smaller.
+         */
+        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
+        r |= (~0UL) << size;
+    }
+
+    set_user_reg(regs, dabt.reg, r);
+
+    return IO_HANDLED;
+}
+
+enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
+                             struct vcpu *v, mmio_info_t *info)
+{
+    struct vcpu_io *vio = &v->io;
+    ioreq_t p = {
+        .type = IOREQ_TYPE_COPY,
+        .addr = info->gpa,
+        .size = 1 << info->dabt.size,
+        .count = 1,
+        .dir = !info->dabt.write,
+        /*
+         * On x86, df is used by 'rep' instruction to tell the direction
+         * to iterate (forward or backward).
+         * On Arm, all the accesses to MMIO region will do a single
+         * memory access. So for now, we can safely always set to 0.
+         */
+        .df = 0,
+        .data = get_user_reg(regs, info->dabt.reg),
+        .state = STATE_IOREQ_READY,
+    };
+    struct ioreq_server *s = NULL;
+    enum io_state rc;
+
+    switch ( vio->req.state )
+    {
+    case STATE_IOREQ_NONE:
+        break;
+
+    case STATE_IORESP_READY:
+        return IO_HANDLED;
+
+    default:
+        gdprintk(XENLOG_ERR, "wrong state %u\n", vio->req.state);
+        return IO_ABORT;
+    }
+
+    s = ioreq_server_select(v->domain, &p);
+    if ( !s )
+        return IO_UNHANDLED;
+
+    if ( !info->dabt.valid )
+        return IO_ABORT;
+
+    vio->req = p;
+
+    rc = ioreq_send(s, &p, 0);
+    if ( rc != IO_RETRY || v->domain->is_shutting_down )
+        vio->req.state = STATE_IOREQ_NONE;
+    else if ( !ioreq_needs_completion(&vio->req) )
+        rc = IO_HANDLED;
+    else
+        vio->completion = VIO_mmio_completion;
+
+    return rc;
+}
+
+bool arch_ioreq_complete_mmio(void)
+{
+    struct vcpu *v = current;
+    struct cpu_user_regs *regs = guest_cpu_user_regs();
+    const union hsr hsr = { .bits = regs->hsr };
+    paddr_t addr = v->io.req.addr;
+
+    if ( try_handle_mmio(regs, hsr, addr) == IO_HANDLED )
+    {
+        advance_pc(regs, hsr);
+        return true;
+    }
+
+    return false;
+}
+
+bool arch_vcpu_ioreq_completion(enum vio_completion completion)
+{
+    ASSERT_UNREACHABLE();
+    return true;
+}
+
+/*
+ * The "legacy" mechanism of mapping magic pages for the IOREQ servers
+ * is x86 specific, so the following hooks don't need to be implemented on Arm:
+ * - arch_ioreq_server_map_pages
+ * - arch_ioreq_server_unmap_pages
+ * - arch_ioreq_server_enable
+ * - arch_ioreq_server_disable
+ */
+int arch_ioreq_server_map_pages(struct ioreq_server *s)
+{
+    return -EOPNOTSUPP;
+}
+
+void arch_ioreq_server_unmap_pages(struct ioreq_server *s)
+{
+}
+
+void arch_ioreq_server_enable(struct ioreq_server *s)
+{
+}
+
+void arch_ioreq_server_disable(struct ioreq_server *s)
+{
+}
+
+void arch_ioreq_server_destroy(struct ioreq_server *s)
+{
+}
+
+int arch_ioreq_server_map_mem_type(struct domain *d,
+                                   struct ioreq_server *s,
+                                   uint32_t flags)
+{
+    return -EOPNOTSUPP;
+}
+
+void arch_ioreq_server_map_mem_type_completed(struct domain *d,
+                                              struct ioreq_server *s,
+                                              uint32_t flags)
+{
+}
+
+bool arch_ioreq_server_destroy_all(struct domain *d)
+{
+    return true;
+}
+
+bool arch_ioreq_server_get_type_addr(const struct domain *d,
+                                     const ioreq_t *p,
+                                     uint8_t *type,
+                                     uint64_t *addr)
+{
+    if ( p->type != IOREQ_TYPE_COPY && p->type != IOREQ_TYPE_PIO )
+        return false;
+
+    *type = (p->type == IOREQ_TYPE_PIO) ?
+             XEN_DMOP_IO_RANGE_PORT : XEN_DMOP_IO_RANGE_MEMORY;
+    *addr = p->addr;
+
+    return true;
+}
+
+void arch_ioreq_domain_init(struct domain *d)
+{
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
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 22bd1bd..036b13f 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -21,6 +21,7 @@
 #include <xen/hypercall.h>
 #include <xen/init.h>
 #include <xen/iocap.h>
+#include <xen/ioreq.h>
 #include <xen/irq.h>
 #include <xen/lib.h>
 #include <xen/mem_access.h>
@@ -1385,6 +1386,9 @@ static arm_hypercall_t arm_hypercall_table[] = {
 #ifdef CONFIG_HYPFS
     HYPERCALL(hypfs_op, 5),
 #endif
+#ifdef CONFIG_IOREQ_SERVER
+    HYPERCALL(dm_op, 3),
+#endif
 };
 
 #ifndef NDEBUG
@@ -1956,6 +1960,9 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
             case IO_HANDLED:
                 advance_pc(regs, hsr);
                 return;
+            case IO_RETRY:
+                /* finish later */
+                return;
             case IO_UNHANDLED:
                 /* IO unhandled, try another way to handle it. */
                 break;
@@ -2254,6 +2261,12 @@ static void check_for_vcpu_work(void)
 {
     struct vcpu *v = current;
 
+#ifdef CONFIG_IOREQ_SERVER
+    local_irq_enable();
+    vcpu_ioreq_handle_completion(v);
+    local_irq_disable();
+#endif
+
     if ( likely(!v->arch.need_flush_to_ram) )
         return;
 
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 6819a3b..c235e5b 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -10,6 +10,7 @@
 #include <asm/gic.h>
 #include <asm/vgic.h>
 #include <asm/vpl011.h>
+#include <public/hvm/dm_op.h>
 #include <public/hvm/params.h>
 
 struct hvm_domain
@@ -262,6 +263,8 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
 
 #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
 
+#define has_vpci(d)    ({ (void)(d); false; })
+
 #endif /* __ASM_DOMAIN_H__ */
 
 /*
diff --git a/xen/include/asm-arm/hvm/ioreq.h b/xen/include/asm-arm/hvm/ioreq.h
new file mode 100644
index 0000000..19e1247
--- /dev/null
+++ b/xen/include/asm-arm/hvm/ioreq.h
@@ -0,0 +1,72 @@
+/*
+ * hvm.h: Hardware virtual machine assist interface definitions.
+ *
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
+#ifndef __ASM_ARM_HVM_IOREQ_H__
+#define __ASM_ARM_HVM_IOREQ_H__
+
+#ifdef CONFIG_IOREQ_SERVER
+enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v);
+enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
+                             struct vcpu *v, mmio_info_t *info);
+#else
+static inline enum io_state handle_ioserv(struct cpu_user_regs *regs,
+                                          struct vcpu *v)
+{
+    return IO_UNHANDLED;
+}
+
+static inline enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
+                                           struct vcpu *v, mmio_info_t *info)
+{
+    return IO_UNHANDLED;
+}
+#endif
+
+bool ioreq_complete_mmio(void);
+
+static inline bool handle_pio(uint16_t port, unsigned int size, int dir)
+{
+    /*
+     * TODO: For Arm64, the main user will be PCI. So this should be
+     * implemented when we add support for vPCI.
+     */
+    ASSERT_UNREACHABLE();
+    return true;
+}
+
+static inline void msix_write_completion(struct vcpu *v)
+{
+}
+
+/* This correlation must not be altered */
+#define IOREQ_STATUS_HANDLED     IO_HANDLED
+#define IOREQ_STATUS_UNHANDLED   IO_UNHANDLED
+#define IOREQ_STATUS_RETRY       IO_RETRY
+
+#endif /* __ASM_ARM_HVM_IOREQ_H__ */
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
diff --git a/xen/include/asm-arm/mmio.h b/xen/include/asm-arm/mmio.h
index 8dbfb27..7ab873c 100644
--- a/xen/include/asm-arm/mmio.h
+++ b/xen/include/asm-arm/mmio.h
@@ -37,6 +37,7 @@ enum io_state
     IO_ABORT,       /* The IO was handled by the helper and led to an abort. */
     IO_HANDLED,     /* The IO was successfully handled by the helper. */
     IO_UNHANDLED,   /* The IO was not handled by the helper. */
+    IO_RETRY,       /* Retry the emulation for some reason */
 };
 
 typedef int (*mmio_read_t)(struct vcpu *v, mmio_info_t *info,
-- 
2.7.4


