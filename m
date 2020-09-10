Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E557F2650A2
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 22:23:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGT69-0004eF-SA; Thu, 10 Sep 2020 20:23:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQLO=CT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kGT68-0004JK-Tf
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 20:23:12 +0000
X-Inumbo-ID: 1c1b7a3f-7fc0-4042-af50-4a7389492074
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c1b7a3f-7fc0-4042-af50-4a7389492074;
 Thu, 10 Sep 2020 20:22:41 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id a22so9837052ljp.13
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 13:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0AtIGA45dPzpwGTPTn9t1nBIiSSHdr95t+OpAf4Cgq0=;
 b=Fbg2C1lQQHMub319oNFt7Fud0L09Zb7TcCPEYv4wI62gaTqzeYFNv+K/TTzPTLeEIE
 sEH1Yub1OZy4WHcGz84jbXrWyUFfy2fV/nkYLk3o/1FiOBXVVLnlxf6c8rezvt+WpjE5
 rjJoDBXQ03n1HmeqjspEmoBeniSVxNj6D+ax3bIbaeNmHmpo2pmRQwJe1QMXfwPEoqKb
 jXdVxrAHZJCvU0GkeX+1+x3tJpxF4mif2ElCnXhudbNbC1VIrrcbQh3nuamx3OuvB25L
 wLcjkZ53UMsq3ztk7cMn6YTvCQqAsAG7uOvZ/tvw+NRMpdT5uV5+Wt/VPGX5l2HR1Dxk
 /NcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0AtIGA45dPzpwGTPTn9t1nBIiSSHdr95t+OpAf4Cgq0=;
 b=ttcG4EVDWpsF1mOVX1F3ysbPz8tC/Uy5EGfnpfm8rG8+yEwZvfxfl84HOaIGHLaxdP
 iMXXsPqbrRRfC9VizJkw7PsdxhhKrJ994fiGS/c4EBCoiWSogjDYfLszKIKHKLn+YVTe
 PcUkm7wwMLIThH8dvF9uBMosWkO5m7Nil//YIb3V63vMV/9r89/IVkDX39EE6iQrCQFH
 6bL2SAnvNtmiJKS2HT8rwgGVAGnf2itUIatxgKFNGQBX9ThL1envaa2iYjOa0LF0qIra
 rMPLCEz9VWpH4D1Shee6ImVZ54A9lv102adfRcxUc65NObmj2eyFSEGa/ZWlbQpZe7LW
 QtKw==
X-Gm-Message-State: AOAM532OWCemXSmLNtRdwoQMk+me0gM/kccqb4STBHk5t3HVlSxf/C2R
 jthtguMr6WWef2z9GMdsAW8UFh35Wb+Xsw==
X-Google-Smtp-Source: ABdhPJxClCODib2or4R1LXAHjJAqZTzfGrwbrz56vYJh860a9aP5OwtKFmNOd/tfwXJ2wOVwsN2aow==
X-Received: by 2002:a05:651c:327:: with SMTP id
 b7mr5234887ljp.140.1599769359183; 
 Thu, 10 Sep 2020 13:22:39 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u5sm1584375lfq.17.2020.09.10.13.22.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 13:22:38 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
Subject: [PATCH V1 09/16] arm/ioreq: Introduce arch specific bits for IOREQ/DM
 features
Date: Thu, 10 Sep 2020 23:22:03 +0300
Message-Id: <1599769330-17656-10-git-send-email-olekstysh@gmail.com>
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

This patch adds basic IOREQ/DM support on Arm. The subsequent
patches will improve functionality, add remaining bits as well as
address several TODOs.

Please note, the "PIO handling" TODO is expected to left unaddressed
for the current series. It is not an big issue for now while Xen
doesn't have support for vPCI on Arm. On Arm64 they are only used
for PCI IO Bar and we would probably want to expose them to emulator
as PIO access to make a DM completely arch-agnostic. So "PIO handling"
should be implemented when we add support for vPCI.

Please note, at the moment build on Arm32 is broken (see cmpxchg
usage in hvm_send_buffered_ioreq()) due to the lack of cmpxchg_64
support on Arm32. There is a patch on review to address this issue:
https://patchwork.kernel.org/patch/11715559/

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
---
---
 xen/arch/arm/Kconfig            |   1 +
 xen/arch/arm/Makefile           |   2 +
 xen/arch/arm/dm.c               |  33 ++++++++++
 xen/arch/arm/domain.c           |   9 +++
 xen/arch/arm/io.c               |  11 +++-
 xen/arch/arm/ioreq.c            | 142 ++++++++++++++++++++++++++++++++++++++++
 xen/arch/arm/traps.c            |  32 +++++++--
 xen/include/asm-arm/domain.h    |  46 +++++++++++++
 xen/include/asm-arm/hvm/ioreq.h | 108 ++++++++++++++++++++++++++++++
 xen/include/asm-arm/mmio.h      |   1 +
 xen/include/asm-arm/paging.h    |   4 ++
 11 files changed, 384 insertions(+), 5 deletions(-)
 create mode 100644 xen/arch/arm/dm.c
 create mode 100644 xen/arch/arm/ioreq.c
 create mode 100644 xen/include/asm-arm/hvm/ioreq.h

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 2777388..8264cd6 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -21,6 +21,7 @@ config ARM
 	select HAS_PASSTHROUGH
 	select HAS_PDX
 	select IOMMU_FORCE_PT_SHARE
+	select IOREQ_SERVER
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 7e82b21..617fa3e 100644
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
index 0000000..eb20344
--- /dev/null
+++ b/xen/arch/arm/dm.c
@@ -0,0 +1,33 @@
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
index 3116932..043db3f 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -14,6 +14,7 @@
 #include <xen/grant_table.h>
 #include <xen/hypercall.h>
 #include <xen/init.h>
+#include <xen/ioreq.h>
 #include <xen/lib.h>
 #include <xen/livepatch.h>
 #include <xen/sched.h>
@@ -681,6 +682,10 @@ int arch_domain_create(struct domain *d,
 
     ASSERT(config != NULL);
 
+#ifdef CONFIG_IOREQ_SERVER
+    hvm_ioreq_init(d);
+#endif
+
     /* p2m_init relies on some value initialized by the IOMMU subsystem */
     if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
         goto fail;
@@ -999,6 +1004,10 @@ int domain_relinquish_resources(struct domain *d)
         if (ret )
             return ret;
 
+#ifdef CONFIG_IOREQ_SERVER
+        hvm_destroy_all_ioreq_servers(d);
+#endif
+
     PROGRESS(xen):
         ret = relinquish_memory(d, &d->xenpage_list);
         if ( ret )
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index ae7ef96..adc9de7 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -16,6 +16,7 @@
  * GNU General Public License for more details.
  */
 
+#include <xen/ioreq.h>
 #include <xen/lib.h>
 #include <xen/spinlock.h>
 #include <xen/sched.h>
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
index 0000000..e493c5b
--- /dev/null
+++ b/xen/arch/arm/ioreq.c
@@ -0,0 +1,142 @@
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
+#include <public/hvm/ioreq.h>
+
+#include <asm/traps.h>
+
+enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
+{
+    const union hsr hsr = { .bits = regs->hsr };
+    const struct hsr_dabt dabt = hsr.dabt;
+    /* Code is similar to handle_read */
+    uint8_t size = (1 << dabt.size) * 8;
+    register_t r = v->arch.hvm.hvm_io.io_req.data;
+
+    /* We are done with the IO */
+    v->arch.hvm.hvm_io.io_req.state = STATE_IOREQ_NONE;
+
+    /* XXX: Do we need to take care of write here ? */
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
+    struct hvm_vcpu_io *vio = &v->arch.hvm.hvm_io;
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
+    struct hvm_ioreq_server *s = NULL;
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
+    s = hvm_select_ioreq_server(v->domain, &p);
+    if ( !s )
+        return IO_UNHANDLED;
+
+    if ( !info->dabt.valid )
+        return IO_ABORT;
+
+    vio->io_req = p;
+
+    rc = hvm_send_ioreq(s, &p, 0);
+    if ( rc != IO_RETRY || v->domain->is_shutting_down )
+        vio->io_req.state = STATE_IOREQ_NONE;
+    else if ( !hvm_ioreq_needs_completion(&vio->io_req) )
+        rc = IO_HANDLED;
+    else
+        vio->io_completion = HVMIO_mmio_completion;
+
+    return rc;
+}
+
+bool ioreq_handle_complete_mmio(void)
+{
+    struct vcpu *v = current;
+    struct cpu_user_regs *regs = guest_cpu_user_regs();
+    const union hsr hsr = { .bits = regs->hsr };
+    paddr_t addr = v->arch.hvm.hvm_io.io_req.addr;
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
index 8f40d0e..121942c 100644
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
@@ -1955,9 +1959,14 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
             case IO_HANDLED:
                 advance_pc(regs, hsr);
                 return;
+            case IO_RETRY:
+                /* finish later */
+                return;
             case IO_UNHANDLED:
                 /* IO unhandled, try another way to handle it. */
                 break;
+            default:
+                ASSERT_UNREACHABLE();
             }
         }
 
@@ -2249,12 +2258,23 @@ static void check_for_pcpu_work(void)
  * Process pending work for the vCPU. Any call should be fast or
  * implement preemption.
  */
-static void check_for_vcpu_work(void)
+static bool check_for_vcpu_work(void)
 {
     struct vcpu *v = current;
 
+#ifdef CONFIG_IOREQ_SERVER
+    bool handled;
+
+    local_irq_enable();
+    handled = handle_hvm_io_completion(v);
+    local_irq_disable();
+
+    if ( !handled )
+        return true;
+#endif
+
     if ( likely(!v->arch.need_flush_to_ram) )
-        return;
+        return false;
 
     /*
      * Give a chance for the pCPU to process work before handling the vCPU
@@ -2265,6 +2285,8 @@ static void check_for_vcpu_work(void)
     local_irq_enable();
     p2m_flush_vm(v);
     local_irq_disable();
+
+    return false;
 }
 
 /*
@@ -2277,8 +2299,10 @@ void leave_hypervisor_to_guest(void)
 {
     local_irq_disable();
 
-    check_for_vcpu_work();
-    check_for_pcpu_work();
+    do
+    {
+        check_for_pcpu_work();
+    } while ( check_for_vcpu_work() );
 
     vgic_sync_to_lrs();
 
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 6819a3b..d1c48d7 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -11,10 +11,27 @@
 #include <asm/vgic.h>
 #include <asm/vpl011.h>
 #include <public/hvm/params.h>
+#include <public/hvm/dm_op.h>
+#include <public/hvm/ioreq.h>
+
+#define MAX_NR_IOREQ_SERVERS 8
 
 struct hvm_domain
 {
     uint64_t              params[HVM_NR_PARAMS];
+
+    /* Guest page range used for non-default ioreq servers */
+    struct {
+        unsigned long base;
+        unsigned long mask;
+        unsigned long legacy_mask; /* indexed by HVM param number */
+    } ioreq_gfn;
+
+    /* Lock protects all other values in the sub-struct and the default */
+    struct {
+        spinlock_t              lock;
+        struct hvm_ioreq_server *server[MAX_NR_IOREQ_SERVERS];
+    } ioreq_server;
 };
 
 #ifdef CONFIG_ARM_64
@@ -91,6 +108,28 @@ struct arch_domain
 #endif
 }  __cacheline_aligned;
 
+enum hvm_io_completion {
+    HVMIO_no_completion,
+    HVMIO_mmio_completion,
+    HVMIO_pio_completion
+};
+
+struct hvm_vcpu_io {
+    /* I/O request in flight to device model. */
+    enum hvm_io_completion io_completion;
+    ioreq_t                io_req;
+
+    /*
+     * HVM emulation:
+     *  Linear address @mmio_gla maps to MMIO physical frame @mmio_gpfn.
+     *  The latter is known to be an MMIO frame (not RAM).
+     *  This translation is only valid for accesses as per @mmio_access.
+     */
+    struct npfec        mmio_access;
+    unsigned long       mmio_gla;
+    unsigned long       mmio_gpfn;
+};
+
 struct arch_vcpu
 {
     struct {
@@ -204,6 +243,11 @@ struct arch_vcpu
      */
     bool need_flush_to_ram;
 
+    struct hvm_vcpu
+    {
+        struct hvm_vcpu_io hvm_io;
+    } hvm;
+
 }  __cacheline_aligned;
 
 void vcpu_show_execution_state(struct vcpu *);
@@ -262,6 +306,8 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
 
 #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
 
+#define has_vpci(d)    ({ (void)(d); false; })
+
 #endif /* __ASM_DOMAIN_H__ */
 
 /*
diff --git a/xen/include/asm-arm/hvm/ioreq.h b/xen/include/asm-arm/hvm/ioreq.h
new file mode 100644
index 0000000..1c34df0
--- /dev/null
+++ b/xen/include/asm-arm/hvm/ioreq.h
@@ -0,0 +1,108 @@
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
+#include <public/hvm/ioreq.h>
+#include <public/hvm/dm_op.h>
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
+bool ioreq_handle_complete_mmio(void);
+
+static inline bool handle_pio(uint16_t port, unsigned int size, int dir)
+{
+    /*
+     * TODO: For Arm64, the main user will be PCI. So this should be
+     * implemented when we add support for vPCI.
+     */
+    BUG();
+    return true;
+}
+
+static inline int arch_hvm_destroy_ioreq_server(struct hvm_ioreq_server *s)
+{
+    return 0;
+}
+
+static inline void msix_write_completion(struct vcpu *v)
+{
+}
+
+static inline bool arch_handle_hvm_io_completion(
+    enum hvm_io_completion io_completion)
+{
+    ASSERT_UNREACHABLE();
+}
+
+static inline int hvm_get_ioreq_server_range_type(struct domain *d,
+                                                  ioreq_t *p,
+                                                  uint8_t *type,
+                                                  uint64_t *addr)
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
+static inline void arch_hvm_ioreq_init(struct domain *d)
+{
+}
+
+static inline void arch_hvm_ioreq_destroy(struct domain *d)
+{
+}
+
+#define IOREQ_IO_HANDLED     IO_HANDLED
+#define IOREQ_IO_UNHANDLED   IO_UNHANDLED
+#define IOREQ_IO_RETRY       IO_RETRY
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


