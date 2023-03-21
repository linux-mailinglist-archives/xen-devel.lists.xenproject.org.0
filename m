Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D966C3389
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 14:59:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512654.792710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pecW6-0002Jn-K1; Tue, 21 Mar 2023 13:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512654.792710; Tue, 21 Mar 2023 13:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pecW6-0002H4-Gk; Tue, 21 Mar 2023 13:59:10 +0000
Received: by outflank-mailman (input) for mailman id 512654;
 Tue, 21 Mar 2023 13:59:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xciR=7N=yandex.ru=isaikin-dmitry@srs-se1.protection.inumbo.net>)
 id 1pecW4-0002Ec-2G
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 13:59:08 +0000
Received: from forward107j.mail.yandex.net (forward107j.mail.yandex.net
 [5.45.198.252]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8afe5b26-c7f0-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 14:59:06 +0100 (CET)
Received: from mail-nwsmtp-smtp-production-main-90.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-90.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:4584:0:640:afb7:0])
 by forward107j.mail.yandex.net (Yandex) with ESMTP id C41A5884B46;
 Tue, 21 Mar 2023 16:59:03 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-90.myt.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id 0xpUErRRfSw0-6HwIeWGh; 
 Tue, 21 Mar 2023 16:59:02 +0300
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
X-Inumbo-ID: 8afe5b26-c7f0-11ed-87f5-c1b5be75604c
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1679407142;
	bh=x4oFSUpFOoascCBkAa0+7rS1W1m1rJ362Mp4iq7EZzw=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=KwFynVWEPmX8zRj5DUuTr6CJEJCEFibz84ROoVKeD4/SuVKnH5wGbCUiGurW/zW8a
	 0WIM3gVVXkDBeUsf0mrwEYWPEO9jjwm+SUv+rh7j6BRzSjPntpEfyJH3GPxhKFj8Nk
	 biTsCZOCMLHFA7iYIIFZZo6jHCqQuq/3tt8uE/y8=
Authentication-Results: mail-nwsmtp-smtp-production-main-90.myt.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
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
Subject: [XEN PATCH v5] x86/monitor: Add new monitor event to catch I/O instructions
Date: Tue, 21 Mar 2023 16:58:58 +0300
Message-Id: <7bd5ec4ff75ea0157d782f8820db1d17b6ad1289.1679406554.git.isaikin-dmitry@yandex.ru>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds monitor support for I/O instructions.

Signed-off-by: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
Signed-off-by: Anton Belousov <abelousov@ptsecurity.com>
---
Changes in v5:
 * Rebase on staging

Changes in v4:
 * Avoid the use of fixed-width types
 * Document vm_event_io structure fields
 * Untie vm-event interface from ioreq one

Changes in v3:
 * Rebase on staging
 * Refactor branch logic on monitor_traps response

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
 tools/libs/ctrl/xc_monitor.c           | 13 +++++++++++++
 xen/arch/x86/hvm/monitor.c             | 21 +++++++++++++++++++++
 xen/arch/x86/hvm/svm/svm.c             |  9 +++++++++
 xen/arch/x86/hvm/vmx/vmx.c             |  7 +++++++
 xen/arch/x86/include/asm/domain.h      |  1 +
 xen/arch/x86/include/asm/hvm/monitor.h |  3 +++
 xen/arch/x86/include/asm/monitor.h     |  3 ++-
 xen/arch/x86/monitor.c                 | 13 +++++++++++++
 xen/include/public/domctl.h            |  1 +
 xen/include/public/vm_event.h          | 10 ++++++++++
 11 files changed, 81 insertions(+), 1 deletion(-)

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
index a11cd76f4d..4f500beaf5 100644
--- a/xen/arch/x86/hvm/monitor.c
+++ b/xen/arch/x86/hvm/monitor.c
@@ -346,6 +346,27 @@ int hvm_monitor_vmexit(unsigned long exit_reason,
     return monitor_traps(curr, ad->monitor.vmexit_sync, &req);
 }
 
+int hvm_monitor_io(unsigned int port, unsigned int bytes,
+                   bool in, bool str)
+{
+    struct vcpu *curr = current;
+    struct arch_domain *ad = &curr->domain->arch;
+    vm_event_request_t req = {
+        .reason = VM_EVENT_REASON_IO_INSTRUCTION,
+        .u.io.bytes = bytes,
+        .u.io.port = port,
+        .u.io.in = in,
+        .u.io.str = str,
+    };
+
+    if ( !ad->monitor.io_enabled )
+        return 0;
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
index bfe03316de..02563e4b70 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2939,6 +2939,15 @@ void svm_vmexit_handler(void)
         break;
 
     case VMEXIT_IOIO:
+        rc = hvm_monitor_io(vmcb->ei.io.port,
+                            vmcb->ei.io.bytes,
+                            vmcb->ei.io.in,
+                            vmcb->ei.io.str);
+        if ( rc < 0 )
+            goto unexpected_exit_type;
+        if ( rc )
+            break;
+
         if ( !vmcb->ei.io.str )
         {
             if ( handle_pio(vmcb->ei.io.port,
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 78ac9ece6f..bc7d36aa03 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4574,10 +4574,17 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
             };
         } io_qual;
         unsigned int bytes;
+        int rc;
 
         __vmread(EXIT_QUALIFICATION, &io_qual.raw);
         bytes = io_qual.size + 1;
 
+        rc = hvm_monitor_io(io_qual.port, bytes, io_qual.in, io_qual.str);
+        if ( rc < 0 )
+            goto exit_and_crash;
+        if ( rc )
+            break;
+
         if ( io_qual.str )
         {
             if ( !hvm_emulate_one_insn(x86_insn_is_portio, "port I/O") )
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 7bc126587d..29027ffd29 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -435,6 +435,7 @@ struct arch_domain
         unsigned int descriptor_access_enabled                             : 1;
         unsigned int guest_request_userspace_enabled                       : 1;
         unsigned int emul_unimplemented_enabled                            : 1;
+        unsigned int io_enabled                                            : 1;
         /*
          * By default all events are sent.
          * This is used to filter out pagefaults.
diff --git a/xen/arch/x86/include/asm/hvm/monitor.h b/xen/arch/x86/include/asm/hvm/monitor.h
index 639f6dfa37..6884f38d73 100644
--- a/xen/arch/x86/include/asm/hvm/monitor.h
+++ b/xen/arch/x86/include/asm/hvm/monitor.h
@@ -54,6 +54,9 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t pfec,
 int hvm_monitor_vmexit(unsigned long exit_reason,
                        unsigned long exit_qualification);
 
+int hvm_monitor_io(unsigned int port, unsigned int bytes,
+                   bool in, bool str);
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
index 0035c26e12..3a86f0e208 100644
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
+    uint32_t bytes; /* size of access */
+    uint16_t port;  /* port number */
+    uint8_t  in;    /* direction (0 = OUT, 1 = IN) */
+    uint8_t  str;   /* string instruction (0 = not string, 1 = string) */
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


