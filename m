Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DBD28F73E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:53:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7622.20178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6VO-0007kN-KD; Thu, 15 Oct 2020 16:53:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7622.20178; Thu, 15 Oct 2020 16:53:30 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6VN-0007fO-M5; Thu, 15 Oct 2020 16:53:29 +0000
Received: by outflank-mailman (input) for mailman id 7622;
 Thu, 15 Oct 2020 16:53:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kT6OI-0004yr-7O
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:46:10 +0000
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8dbf7494-b1e5-4da9-aef3-a0e8cd19873d;
 Thu, 15 Oct 2020 16:45:09 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id p15so3831734ljj.8
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:09 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Oct 2020 09:45:06 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kT6OI-0004yr-7O
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:46:10 +0000
X-Inumbo-ID: 8dbf7494-b1e5-4da9-aef3-a0e8cd19873d
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8dbf7494-b1e5-4da9-aef3-a0e8cd19873d;
	Thu, 15 Oct 2020 16:45:09 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id p15so3831734ljj.8
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sOB0KRQzNqQKgBnd+DVp46wCjPUsJTci+TWGlyq6IHk=;
        b=XsQT+M7/kBteWBIsYxbEXnOvjFm4tf1tIglvblWEBKCE9jmqGtNPZDxBa07y2Byl3c
         ZfUwLl/xvcX6t5yKY4qkB1ZR7JPmaZ9CYgFpyWrQ9AZKYmgRIlT50R6bdHiNPk1EEmv5
         tzEdjIrGeE9rjaO6NsbIg9Ssc+QvnMhesOD/GkOye1AINuo5IYqpBuM/VZH1SqIEIs/8
         iwKPbJdLd78LG/ZknnGhh3JuQP7xBCtHek9neMg7aSauD5ZwU16vluQMW7V+DfypYbMG
         nFcuIhqsX6YfEx6XmxxoKx/s/rDePKzSm5VR6GAsL+4IYlfncwX7Iv+bG100ly22a0Ce
         YVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sOB0KRQzNqQKgBnd+DVp46wCjPUsJTci+TWGlyq6IHk=;
        b=n8TPxujkZPn/VVVsKxLhnbaXjetwxQxcLn6knjxvzQGeF6UUpMMho5+V9i8UY86VCT
         ohWOd8PNHsWvN5cw87v41kx1ZAqH5rYIEh+EACe5lpbSNrT8lGzAtG+GWKc/mZkMSPM8
         xdAr/9XgYDDXVfja+sv+I/bHxvup25lP+UEc5KtAn6lUeJj7rriiudd7EJTtvLBEhCzZ
         XXUIAkxyP1QYjoQ4bzy/XtJVOCuQGU1lSFi3RwO98S0JnLlgcYXwYtocATklu3Vi60n/
         0cILCKonRu4QUuy2vsxYyaKOE/QQs04zWk1pizKtwc5yStmDiR1TF3jIKp0HaikMlwaD
         twaw==
X-Gm-Message-State: AOAM532+NQmMSGUXqckyorzUFz0Aiss28L3BjkzpsOsNFPcyrcAV7YJ2
	gt8THBMJyjTcxa67yLWENDBgEvZrwPAxIw==
X-Google-Smtp-Source: ABdhPJwZZv2XOIEHlMZjS7b2fFtS4U+URg/aCid+fgq+JXBnk2tT6Jv191S0C+c6pfQ/2P+NWZ6a5A==
X-Received: by 2002:a2e:8816:: with SMTP id x22mr1261041ljh.377.1602780307354;
        Thu, 15 Oct 2020 09:45:07 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2020 09:45:06 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Paul Durrant <paul@xen.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V2 14/23] arm/ioreq: Introduce arch specific bits for IOREQ/DM features
Date: Thu, 15 Oct 2020 19:44:25 +0300
Message-Id: <1602780274-29141-15-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>

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

Changes V2 -> V1:
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
---
 xen/arch/arm/Makefile           |   2 +
 xen/arch/arm/dm.c               |  34 ++++++++++
 xen/arch/arm/domain.c           |   9 +++
 xen/arch/arm/io.c               |  11 +++-
 xen/arch/arm/ioreq.c            | 141 ++++++++++++++++++++++++++++++++++++++++
 xen/arch/arm/traps.c            |  13 ++++
 xen/common/ioreq.c              |   1 +
 xen/include/asm-arm/domain.h    |   5 ++
 xen/include/asm-arm/hvm/ioreq.h | 109 +++++++++++++++++++++++++++++++
 xen/include/asm-arm/mmio.h      |   1 +
 xen/include/asm-arm/paging.h    |   4 ++
 11 files changed, 329 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/dm.c
 create mode 100644 xen/arch/arm/ioreq.c
 create mode 100644 xen/include/asm-arm/hvm/ioreq.h

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 296c5e6..c3ff454 100644
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
index 0000000..5d3da37
--- /dev/null
+++ b/xen/arch/arm/dm.c
@@ -0,0 +1,34 @@
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
+#include <xen/hypercall.h>
+
+int arch_dm_op(struct xen_dm_op *op, struct domain *d,
+               const struct dmop_args *op_args, bool *const_op)
+{
+    return -EOPNOTSUPP;
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
index 3b37f89..ba9b1fb 100644
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
@@ -694,6 +695,10 @@ int arch_domain_create(struct domain *d,
 
     ASSERT(config != NULL);
 
+#ifdef CONFIG_IOREQ_SERVER
+    ioreq_init(d);
+#endif
+
     /* p2m_init relies on some value initialized by the IOMMU subsystem */
     if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
         goto fail;
@@ -1012,6 +1017,10 @@ int domain_relinquish_resources(struct domain *d)
         if (ret )
             return ret;
 
+#ifdef CONFIG_IOREQ_SERVER
+        destroy_all_ioreq_servers(d);
+#endif
+
     PROGRESS(xen):
         ret = relinquish_memory(d, &d->xenpage_list);
         if ( ret )
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index ae7ef96..f44cfd4 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -23,6 +23,7 @@
 #include <asm/cpuerrata.h>
 #include <asm/current.h>
 #include <asm/mmio.h>
+#include <asm/hvm/ioreq.h>
 
 #include "decode.h"
 
@@ -123,7 +124,15 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
 
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
index 0000000..da5ceac
--- /dev/null
+++ b/xen/arch/arm/ioreq.c
@@ -0,0 +1,141 @@
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
+    register_t r = v->io.io_req.data;
+
+    /* We are done with the IO */
+    v->io.io_req.state = STATE_IOREQ_NONE;
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
+    switch ( vio->io_req.state )
+    {
+    case STATE_IOREQ_NONE:
+        break;
+
+    case STATE_IORESP_READY:
+        return IO_HANDLED;
+
+    default:
+        gdprintk(XENLOG_ERR, "wrong state %u\n", vio->io_req.state);
+        return IO_ABORT;
+    }
+
+    s = select_ioreq_server(v->domain, &p);
+    if ( !s )
+        return IO_UNHANDLED;
+
+    if ( !info->dabt.valid )
+        return IO_ABORT;
+
+    vio->io_req = p;
+
+    rc = send_ioreq(s, &p, 0);
+    if ( rc != IO_RETRY || v->domain->is_shutting_down )
+        vio->io_req.state = STATE_IOREQ_NONE;
+    else if ( !ioreq_needs_completion(&vio->io_req) )
+        rc = IO_HANDLED;
+    else
+        vio->io_completion = IO_mmio_completion;
+
+    return rc;
+}
+
+bool ioreq_complete_mmio(void)
+{
+    struct vcpu *v = current;
+    struct cpu_user_regs *regs = guest_cpu_user_regs();
+    const union hsr hsr = { .bits = regs->hsr };
+    paddr_t addr = v->io.io_req.addr;
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
index 8f40d0e..b154837 100644
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
@@ -1384,6 +1385,9 @@ static arm_hypercall_t arm_hypercall_table[] = {
 #ifdef CONFIG_HYPFS
     HYPERCALL(hypfs_op, 5),
 #endif
+#ifdef CONFIG_IOREQ_SERVER
+    HYPERCALL(dm_op, 3),
+#endif
 };
 
 #ifndef NDEBUG
@@ -1955,6 +1959,9 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
             case IO_HANDLED:
                 advance_pc(regs, hsr);
                 return;
+            case IO_RETRY:
+                /* finish later */
+                return;
             case IO_UNHANDLED:
                 /* IO unhandled, try another way to handle it. */
                 break;
@@ -2253,6 +2260,12 @@ static void check_for_vcpu_work(void)
 {
     struct vcpu *v = current;
 
+#ifdef CONFIG_IOREQ_SERVER
+    local_irq_enable();
+    handle_io_completion(v);
+    local_irq_disable();
+#endif
+
     if ( likely(!v->arch.need_flush_to_ram) )
         return;
 
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 8612159..bcd4961 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -18,6 +18,7 @@
 
 #include <xen/ctype.h>
 #include <xen/domain.h>
+#include <xen/domain_page.h>
 #include <xen/event.h>
 #include <xen/init.h>
 #include <xen/irq.h>
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 6819a3b..d4c3da5 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -10,6 +10,7 @@
 #include <asm/gic.h>
 #include <asm/vgic.h>
 #include <asm/vpl011.h>
+#include <public/hvm/dm_op.h>
 #include <public/hvm/params.h>
 
 struct hvm_domain
@@ -17,6 +18,8 @@ struct hvm_domain
     uint64_t              params[HVM_NR_PARAMS];
 };
 
+#define ioreq_params(d, i) ((d)->arch.hvm.params[i])
+
 #ifdef CONFIG_ARM_64
 enum domain_type {
     DOMAIN_32BIT,
@@ -262,6 +265,8 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
 
 #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
 
+#define has_vpci(d)    ({ (void)(d); false; })
+
 #endif /* __ASM_DOMAIN_H__ */
 
 /*
diff --git a/xen/include/asm-arm/hvm/ioreq.h b/xen/include/asm-arm/hvm/ioreq.h
new file mode 100644
index 0000000..9f59f23
--- /dev/null
+++ b/xen/include/asm-arm/hvm/ioreq.h
@@ -0,0 +1,109 @@
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
+#include <xen/ioreq.h>
+
+#include <public/hvm/ioreq.h>
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
+static inline void arch_destroy_ioreq_server(struct ioreq_server *s)
+{
+}
+
+static inline void msix_write_completion(struct vcpu *v)
+{
+}
+
+static inline bool arch_io_completion(enum io_completion io_completion)
+{
+    ASSERT_UNREACHABLE();
+    return true;
+}
+
+static inline int ioreq_server_get_type_addr(const struct domain *d,
+                                             const ioreq_t *p,
+                                             uint8_t *type,
+                                             uint64_t *addr)
+{
+    if ( p->type != IOREQ_TYPE_COPY && p->type != IOREQ_TYPE_PIO )
+        return -EINVAL;
+
+    *type = (p->type == IOREQ_TYPE_PIO) ?
+             XEN_DMOP_IO_RANGE_PORT : XEN_DMOP_IO_RANGE_MEMORY;
+    *addr = p->addr;
+
+    return 0;
+}
+
+static inline void arch_ioreq_init(struct domain *d)
+{
+}
+
+static inline bool arch_ioreq_destroy(struct domain *d)
+{
+    return true;
+}
+
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
diff --git a/xen/include/asm-arm/paging.h b/xen/include/asm-arm/paging.h
index 6d1a000..0550c55 100644
--- a/xen/include/asm-arm/paging.h
+++ b/xen/include/asm-arm/paging.h
@@ -4,6 +4,10 @@
 #define paging_mode_translate(d)              (1)
 #define paging_mode_external(d)               (1)
 
+static inline void paging_mark_pfn_dirty(struct domain *d, pfn_t pfn)
+{
+}
+
 #endif /* XEN_PAGING_H */
 
 /*
-- 
2.7.4


