Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7506BBCC8
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 19:55:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510186.787478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcWHD-0005Pi-S6; Wed, 15 Mar 2023 18:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510186.787478; Wed, 15 Mar 2023 18:55:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcWHD-0005N1-Ol; Wed, 15 Mar 2023 18:55:07 +0000
Received: by outflank-mailman (input) for mailman id 510186;
 Wed, 15 Mar 2023 18:55:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r4wR=7H=yandex.ru=isaikin-dmitry@srs-se1.protection.inumbo.net>)
 id 1pcWHC-0005Mt-DS
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 18:55:07 +0000
Received: from forward200c.mail.yandex.net (forward200c.mail.yandex.net
 [178.154.239.221]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e54c993c-c362-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 19:55:04 +0100 (CET)
Received: from sas2-dd6f205a74fe.qloud-c.yandex.net
 (sas2-dd6f205a74fe.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bc8b:0:640:dd6f:205a])
 by forward200c.mail.yandex.net (Yandex) with ESMTP id B7B44600C0;
 Wed, 15 Mar 2023 21:55:01 +0300 (MSK)
Received: by sas2-dd6f205a74fe.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id vsoP1mNcXiE1-APrTxy8t; Wed, 15 Mar 2023 21:55:00 +0300
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
X-Inumbo-ID: e54c993c-c362-11ed-87f5-c1b5be75604c
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1678906500;
	bh=OpbQt9Za9z5rMQkiswJ54XOXHpD2LGZVIvqaU+ccqLY=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=QEqfgLmdU/91MfPzaQMRGvJcV4lMwM6+RyfTmP+e8LR2AV9bHThttPOzbXvuh5MwH
	 VKLZ/D1G+ZzV3TVqW7G/8bu16a34/nfG+WeQrDbWioK30GuRjZ4bs7QKW/qLyeS+1G
	 D5rGhUeRnAfsl4tCGAu1auKjv+IDK3rahjysK8os=
Authentication-Results: sas2-dd6f205a74fe.qloud-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
To: xen-devel@lists.xenproject.org
Cc: Dmitry Isaykin <isaikin-dmitry@yandex.ru>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Anton Belousov <abelousov@ptsecurity.com>
Subject: [XEN PATCH v2] x86/monitor: Add new monitor event to catch I/O instructions
Date: Wed, 15 Mar 2023 21:54:54 +0300
Message-Id: <aab9c8ae059d5f584516d0b6466e57ce0981dadc.1678904818.git.isaikin-dmitry@yandex.ru>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds monitor support for I/O instructions.

Signed-off-by: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
Signed-off-by: Anton Belousov <abelousov@ptsecurity.com>
---
Changes in v2:
 * Handled INS and OUTS instructions too
 * Added I/O monitoring support for AMD
 * Rename functions and structures (remove "_instruction" part)
 * Reorder parameters of hvm_monitor_io to match handle_pio's order
 * Change type of string_ins parameter to bool
 * Change vm_event_io structure
 * Handle monitor_traps's return status
---
 tools/include/xenctrl.h                |  1 +
 tools/libs/ctrl/xc_monitor.c           | 13 ++++++++
 xen/arch/x86/hvm/monitor.c             | 21 +++++++++++++
 xen/arch/x86/hvm/svm/svm.c             | 25 +++++++++++-----
 xen/arch/x86/hvm/vmx/vmx.c             | 41 ++++++++++++++++++--------
 xen/arch/x86/include/asm/domain.h      |  1 +
 xen/arch/x86/include/asm/hvm/monitor.h |  3 ++
 xen/arch/x86/include/asm/monitor.h     |  3 +-
 xen/arch/x86/monitor.c                 | 13 ++++++++
 xen/include/public/domctl.h            |  1 +
 xen/include/public/vm_event.h          | 10 +++++++
 11 files changed, 110 insertions(+), 22 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 23037874d3..05967ecc92 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2102,6 +2102,7 @@ int xc_monitor_emul_unimplemented(xc_interface *xch, uint32_t domain_id,
                                   bool enable);
 int xc_monitor_vmexit(xc_interface *xch, uint32_t domain_id, bool enable,
                       bool sync);
+int xc_monitor_io(xc_interface *xch, uint32_t domain_id, bool enable);
 /**
  * This function enables / disables emulation for each REP for a
  * REP-compatible instruction.
diff --git a/tools/libs/ctrl/xc_monitor.c b/tools/libs/ctrl/xc_monitor.c
index c5fa62ff30..3cb96f444f 100644
--- a/tools/libs/ctrl/xc_monitor.c
+++ b/tools/libs/ctrl/xc_monitor.c
@@ -261,6 +261,19 @@ int xc_monitor_vmexit(xc_interface *xch, uint32_t domain_id, bool enable,
     return do_domctl(xch, &domctl);
 }
 
+int xc_monitor_io(xc_interface *xch, uint32_t domain_id, bool enable)
+{
+    DECLARE_DOMCTL;
+
+    domctl.cmd = XEN_DOMCTL_monitor_op;
+    domctl.domain = domain_id;
+    domctl.u.monitor_op.op = enable ? XEN_DOMCTL_MONITOR_OP_ENABLE
+                                    : XEN_DOMCTL_MONITOR_OP_DISABLE;
+    domctl.u.monitor_op.event = XEN_DOMCTL_MONITOR_EVENT_IO;
+
+    return do_domctl(xch, &domctl);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
index a11cd76f4d..ff958b6c05 100644
--- a/xen/arch/x86/hvm/monitor.c
+++ b/xen/arch/x86/hvm/monitor.c
@@ -346,6 +346,27 @@ int hvm_monitor_vmexit(unsigned long exit_reason,
     return monitor_traps(curr, ad->monitor.vmexit_sync, &req);
 }
 
+int hvm_monitor_io(uint16_t port, unsigned int bytes,
+                   int dir, bool string_ins)
+{
+    struct vcpu *curr = current;
+    struct arch_domain *ad = &curr->domain->arch;
+    vm_event_request_t req = {};
+
+    if ( !ad->monitor.io_enabled )
+        return 0;
+
+    req.reason = VM_EVENT_REASON_IO_INSTRUCTION;
+    req.u.io.data_size = bytes;
+    req.u.io.port = port;
+    req.u.io.dir = dir;
+    req.u.io.string_ins = string_ins;
+
+    set_npt_base(curr, &req);
+
+    return monitor_traps(curr, true, &req);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index a43bcf2e92..49225f48a7 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2939,17 +2939,26 @@ void svm_vmexit_handler(void)
         break;
 
     case VMEXIT_IOIO:
-        if ( (vmcb->exitinfo1 & (1u<<2)) == 0 )
+     {
+        uint16_t port = (vmcb->exitinfo1 >> 16) & 0xFFFF;
+        int bytes = ((vmcb->exitinfo1 >> 4) & 0x07);
+        int dir = (vmcb->exitinfo1 & 1) ? IOREQ_READ : IOREQ_WRITE;
+        bool string_ins = (vmcb->exitinfo1 & (1u<<2));
+        int rc = hvm_monitor_io(port, bytes, dir, string_ins);
+        if ( rc < 0 )
+            goto unexpected_exit_type;
+        if ( !rc )
         {
-            uint16_t port = (vmcb->exitinfo1 >> 16) & 0xFFFF;
-            int bytes = ((vmcb->exitinfo1 >> 4) & 0x07);
-            int dir = (vmcb->exitinfo1 & 1) ? IOREQ_READ : IOREQ_WRITE;
-            if ( handle_pio(port, bytes, dir) )
-                __update_guest_eip(regs, vmcb->exitinfo2 - vmcb->rip);
+            if ( !string_ins )
+            {
+                if ( handle_pio(port, bytes, dir) )
+                    __update_guest_eip(regs, vmcb->exitinfo2 - vmcb->rip);
+            }
+            else if ( !hvm_emulate_one_insn(x86_insn_is_portio, "port I/O") )
+                hvm_inject_hw_exception(TRAP_gp_fault, 0);
         }
-        else if ( !hvm_emulate_one_insn(x86_insn_is_portio, "port I/O") )
-            hvm_inject_hw_exception(TRAP_gp_fault, 0);
         break;
+    }
 
     case VMEXIT_CR0_READ ... VMEXIT_CR15_READ:
     case VMEXIT_CR0_WRITE ... VMEXIT_CR15_WRITE:
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 278b829f73..a7d7f288fb 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4566,23 +4566,38 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         break;
 
     case EXIT_REASON_IO_INSTRUCTION:
+    {
+        uint16_t port;
+        int bytes, dir;
+        bool string_ins;
+        int rc;
+
         __vmread(EXIT_QUALIFICATION, &exit_qualification);
-        if ( exit_qualification & 0x10 )
-        {
-            /* INS, OUTS */
-            if ( !hvm_emulate_one_insn(x86_insn_is_portio, "port I/O") )
-                hvm_inject_hw_exception(TRAP_gp_fault, 0);
-        }
-        else
+
+        port = (exit_qualification >> 16) & 0xFFFF;
+        bytes = (exit_qualification & 0x07) + 1;
+        dir = (exit_qualification & 0x08) ? IOREQ_READ : IOREQ_WRITE;
+        string_ins = (exit_qualification & 0x10);
+        rc = hvm_monitor_io(port, bytes, dir, string_ins);
+        if ( rc < 0 )
+            goto exit_and_crash;
+        if ( !rc )
         {
-            /* IN, OUT */
-            uint16_t port = (exit_qualification >> 16) & 0xFFFF;
-            int bytes = (exit_qualification & 0x07) + 1;
-            int dir = (exit_qualification & 0x08) ? IOREQ_READ : IOREQ_WRITE;
-            if ( handle_pio(port, bytes, dir) )
-                update_guest_eip(); /* Safe: IN, OUT */
+            if ( exit_qualification & 0x10 )
+            {
+                /* INS, OUTS */
+                if ( !hvm_emulate_one_insn(x86_insn_is_portio, "port I/O") )
+                    hvm_inject_hw_exception(TRAP_gp_fault, 0);
+            }
+            else
+            {
+                /* IN, OUT */
+                if ( handle_pio(port, bytes, dir) )
+                    update_guest_eip(); /* Safe: IN, OUT */
+            }
         }
         break;
+    }
 
     case EXIT_REASON_INVD:
     case EXIT_REASON_WBINVD:
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index b5354c3677..86bd3493e6 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -428,6 +428,7 @@ struct arch_domain
         unsigned int descriptor_access_enabled                             : 1;
         unsigned int guest_request_userspace_enabled                       : 1;
         unsigned int emul_unimplemented_enabled                            : 1;
+        unsigned int io_enabled                                            : 1;
         /*
          * By default all events are sent.
          * This is used to filter out pagefaults.
diff --git a/xen/arch/x86/include/asm/hvm/monitor.h b/xen/arch/x86/include/asm/hvm/monitor.h
index 639f6dfa37..fc35490a8d 100644
--- a/xen/arch/x86/include/asm/hvm/monitor.h
+++ b/xen/arch/x86/include/asm/hvm/monitor.h
@@ -54,6 +54,9 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t pfec,
 int hvm_monitor_vmexit(unsigned long exit_reason,
                        unsigned long exit_qualification);
 
+int hvm_monitor_io(uint16_t port, unsigned int bytes,
+                   int dir, bool string_ins);
+
 #endif /* __ASM_X86_HVM_MONITOR_H__ */
 
 /*
diff --git a/xen/arch/x86/include/asm/monitor.h b/xen/arch/x86/include/asm/monitor.h
index d8d54c5f23..96e6a9d0d8 100644
--- a/xen/arch/x86/include/asm/monitor.h
+++ b/xen/arch/x86/include/asm/monitor.h
@@ -90,7 +90,8 @@ static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
                     (1U << XEN_DOMCTL_MONITOR_EVENT_WRITE_CTRLREG) |
                     (1U << XEN_DOMCTL_MONITOR_EVENT_EMUL_UNIMPLEMENTED) |
                     (1U << XEN_DOMCTL_MONITOR_EVENT_INGUEST_PAGEFAULT) |
-                    (1U << XEN_DOMCTL_MONITOR_EVENT_VMEXIT));
+                    (1U << XEN_DOMCTL_MONITOR_EVENT_VMEXIT) |
+                    (1U << XEN_DOMCTL_MONITOR_EVENT_IO));
 
     if ( hvm_is_singlestep_supported() )
         capabilities |= (1U << XEN_DOMCTL_MONITOR_EVENT_SINGLESTEP);
diff --git a/xen/arch/x86/monitor.c b/xen/arch/x86/monitor.c
index 30ca71432c..d4857faf8a 100644
--- a/xen/arch/x86/monitor.c
+++ b/xen/arch/x86/monitor.c
@@ -346,6 +346,19 @@ int arch_monitor_domctl_event(struct domain *d,
         break;
     }
 
+    case XEN_DOMCTL_MONITOR_EVENT_IO:
+    {
+        bool old_status = ad->monitor.io_enabled;
+
+        if ( unlikely(old_status == requested_status) )
+            return -EEXIST;
+
+        domain_pause(d);
+        ad->monitor.io_enabled = requested_status;
+        domain_unpause(d);
+        break;
+    }
+
     default:
         /*
          * Should not be reached unless arch_monitor_get_capabilities() is
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 51be28c3de..7280e9f968 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1063,6 +1063,7 @@ struct xen_domctl_psr_cmt_op {
 /* Enabled by default */
 #define XEN_DOMCTL_MONITOR_EVENT_INGUEST_PAGEFAULT     11
 #define XEN_DOMCTL_MONITOR_EVENT_VMEXIT                12
+#define XEN_DOMCTL_MONITOR_EVENT_IO                    13
 
 struct xen_domctl_monitor_op {
     uint32_t op; /* XEN_DOMCTL_MONITOR_OP_* */
diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
index 0035c26e12..1e4b6063f5 100644
--- a/xen/include/public/vm_event.h
+++ b/xen/include/public/vm_event.h
@@ -160,6 +160,8 @@
 #define VM_EVENT_REASON_EMUL_UNIMPLEMENTED      14
 /* VMEXIT */
 #define VM_EVENT_REASON_VMEXIT                  15
+/* IN/OUT Instruction executed */
+#define VM_EVENT_REASON_IO_INSTRUCTION          16
 
 /* Supported values for the vm_event_write_ctrlreg index. */
 #define VM_EVENT_X86_CR0    0
@@ -388,6 +390,13 @@ struct vm_event_vmexit {
     } arch;
 };
 
+struct vm_event_io {
+    uint32_t data_size;
+    uint16_t port;
+    uint8_t  dir; /* IOREQ_READ or IOREQ_WRITE */
+    uint8_t  string_ins;
+};
+
 typedef struct vm_event_st {
     uint32_t version;   /* VM_EVENT_INTERFACE_VERSION */
     uint32_t flags;     /* VM_EVENT_FLAG_* */
@@ -409,6 +418,7 @@ typedef struct vm_event_st {
         struct vm_event_debug                 debug_exception;
         struct vm_event_cpuid                 cpuid;
         struct vm_event_vmexit                vmexit;
+        struct vm_event_io                    io;
         union {
             struct vm_event_interrupt_x86     x86;
         } interrupt;
-- 
2.39.2


