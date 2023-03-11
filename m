Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 935D26B5821
	for <lists+xen-devel@lfdr.de>; Sat, 11 Mar 2023 04:58:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508645.783512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paqMe-000845-SD; Sat, 11 Mar 2023 03:57:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508645.783512; Sat, 11 Mar 2023 03:57:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paqMe-00082B-PE; Sat, 11 Mar 2023 03:57:48 +0000
Received: by outflank-mailman (input) for mailman id 508645;
 Sat, 11 Mar 2023 03:57:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YOt7=7D=yandex.ru=isaikin-dmitry@srs-se1.protection.inumbo.net>)
 id 1paqMd-000824-20
 for xen-devel@lists.xenproject.org; Sat, 11 Mar 2023 03:57:47 +0000
Received: from forward106j.mail.yandex.net (forward106j.mail.yandex.net
 [2a02:6b8:0:801:2::109])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dda5d619-bfc0-11ed-956e-85ef70e17bfa;
 Sat, 11 Mar 2023 04:57:40 +0100 (CET)
Received: from myt5-0b9dd93077fa.qloud-c.yandex.net
 (myt5-0b9dd93077fa.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1723:0:640:b9d:d930])
 by forward106j.mail.yandex.net (Yandex) with ESMTP id 424D06BD6847;
 Sat, 11 Mar 2023 06:57:37 +0300 (MSK)
Received: by myt5-0b9dd93077fa.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id YvV5xDKdaGk1-5XJAuz1V; Sat, 11 Mar 2023 06:57:36 +0300
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
X-Inumbo-ID: dda5d619-bfc0-11ed-956e-85ef70e17bfa
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1678507056;
	bh=25PD64yC72TNM7aOPywmC1U4uP/4jHnQ+w7kRXvd99M=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=vsx6nHdfWpKA5I5isgu5bq9fEboanlhV2vNCXg6w5bmwHasPoRueRAGSxY4hox3bD
	 HW49gCF11LcHYkFB4XJ2iNvkBj7a+NSqfIalXlCPl6hE2C9u5d8mK2MfSXUU0UOzf9
	 nIM8++zvfrj7G4DzcWTDeHWNuyD/1I3Bpv3HIZzg=
Authentication-Results: myt5-0b9dd93077fa.qloud-c.yandex.net; dkim=pass header.i=@yandex.ru
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Anton Belousov <abelousov@ptsecurity.com>
Subject: [XEN PATCH] x86/monitor: Add new monitor event to catch I/O instructions
Date: Sat, 11 Mar 2023 06:57:32 +0300
Message-Id: <3f577545b8ee6846ff98c4411cdc96dfe1412b3e.1678505295.git.isaikin-dmitry@yandex.ru>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds monitor support for I/O instructions.

Signed-off-by: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
Signed-off-by: Anton Belousov <abelousov@ptsecurity.com>
---
 tools/include/xenctrl.h                |  1 +
 tools/libs/ctrl/xc_monitor.c           | 13 +++++++++++++
 xen/arch/x86/hvm/hvm.c                 |  5 +++++
 xen/arch/x86/hvm/monitor.c             | 21 +++++++++++++++++++++
 xen/arch/x86/hvm/vmx/vmx.c             |  2 ++
 xen/arch/x86/include/asm/domain.h      |  1 +
 xen/arch/x86/include/asm/hvm/monitor.h |  3 +++
 xen/arch/x86/include/asm/hvm/support.h |  3 +++
 xen/arch/x86/include/asm/monitor.h     |  3 ++-
 xen/arch/x86/monitor.c                 | 13 +++++++++++++
 xen/include/public/domctl.h            |  1 +
 xen/include/public/vm_event.h          | 10 ++++++++++
 12 files changed, 75 insertions(+), 1 deletion(-)

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
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 0c81e2afc7..72c9f65626 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3484,6 +3484,11 @@ int hvm_vmexit_cpuid(struct cpu_user_regs *regs, unsigned int inst_len)
     return hvm_monitor_cpuid(inst_len, leaf, subleaf);
 }
 
+void hvm_io_instruction_intercept(uint16_t port, int dir, unsigned int bytes, unsigned int string_ins)
+{
+    hvm_monitor_io_instruction(port, dir, bytes, string_ins);
+}
+
 void hvm_rdtsc_intercept(struct cpu_user_regs *regs)
 {
     msr_split(regs, hvm_get_guest_tsc(current));
diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
index a11cd76f4d..f8b11d1de9 100644
--- a/xen/arch/x86/hvm/monitor.c
+++ b/xen/arch/x86/hvm/monitor.c
@@ -233,6 +233,27 @@ int hvm_monitor_cpuid(unsigned long insn_length, unsigned int leaf,
     return monitor_traps(curr, 1, &req);
 }
 
+void hvm_monitor_io_instruction(uint16_t port, int dir,
+                                unsigned int bytes, unsigned int string_ins)
+{
+    struct vcpu *curr = current;
+    struct arch_domain *ad = &curr->domain->arch;
+    vm_event_request_t req = {};
+
+    if ( !ad->monitor.io_enabled )
+        return;
+
+    req.reason = VM_EVENT_REASON_IO_INSTRUCTION;
+    req.u.io_instruction.data_size = bytes;
+    req.u.io_instruction.port = port;
+    req.u.io_instruction.dir = dir;
+    req.u.io_instruction.string_ins = string_ins;
+
+    set_npt_base(curr, &req);
+
+    monitor_traps(curr, true, &req);
+}
+
 void hvm_monitor_interrupt(unsigned int vector, unsigned int type,
                            unsigned int err, uint64_t cr2)
 {
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 278b829f73..a64c5078c5 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4579,6 +4579,8 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
             uint16_t port = (exit_qualification >> 16) & 0xFFFF;
             int bytes = (exit_qualification & 0x07) + 1;
             int dir = (exit_qualification & 0x08) ? IOREQ_READ : IOREQ_WRITE;
+            int str_ins = (exit_qualification & 0x10) ? 1 : 0;
+            hvm_io_instruction_intercept(port, dir, bytes, str_ins);
             if ( handle_pio(port, bytes, dir) )
                 update_guest_eip(); /* Safe: IN, OUT */
         }
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
index 639f6dfa37..22d2b366a6 100644
--- a/xen/arch/x86/include/asm/hvm/monitor.h
+++ b/xen/arch/x86/include/asm/hvm/monitor.h
@@ -54,6 +54,9 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t pfec,
 int hvm_monitor_vmexit(unsigned long exit_reason,
                        unsigned long exit_qualification);
 
+void hvm_monitor_io_instruction(uint16_t port, int dir,
+                                unsigned int bytes, unsigned int string_ins);
+
 #endif /* __ASM_X86_HVM_MONITOR_H__ */
 
 /*
diff --git a/xen/arch/x86/include/asm/hvm/support.h b/xen/arch/x86/include/asm/hvm/support.h
index 6b583738ec..ecb2b9ecb8 100644
--- a/xen/arch/x86/include/asm/hvm/support.h
+++ b/xen/arch/x86/include/asm/hvm/support.h
@@ -157,6 +157,9 @@ int __must_check hvm_msr_read_intercept(
 int __must_check hvm_msr_write_intercept(
     unsigned int msr, uint64_t msr_content, bool may_defer);
 
+void hvm_io_instruction_intercept(uint16_t port, int dir,
+                                  unsigned int bytes, unsigned int string_ins);
+
 #endif /* __ASM_X86_HVM_SUPPORT_H__ */
 
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
index 0035c26e12..86e4cdba7c 100644
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
 
+struct vm_event_io_instruction {
+    uint32_t data_size;
+    uint32_t port;
+    uint32_t dir;
+    uint32_t string_ins;
+};
+
 typedef struct vm_event_st {
     uint32_t version;   /* VM_EVENT_INTERFACE_VERSION */
     uint32_t flags;     /* VM_EVENT_FLAG_* */
@@ -409,6 +418,7 @@ typedef struct vm_event_st {
         struct vm_event_debug                 debug_exception;
         struct vm_event_cpuid                 cpuid;
         struct vm_event_vmexit                vmexit;
+        struct vm_event_io_instruction        io_instruction;
         union {
             struct vm_event_interrupt_x86     x86;
         } interrupt;
-- 
2.39.2


