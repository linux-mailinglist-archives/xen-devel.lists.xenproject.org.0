Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC2793F086
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 11:00:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766469.1176965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYMEv-0000q6-NB; Mon, 29 Jul 2024 09:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766469.1176965; Mon, 29 Jul 2024 09:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYMEv-0000lx-H5; Mon, 29 Jul 2024 09:00:21 +0000
Received: by outflank-mailman (input) for mailman id 766469;
 Mon, 29 Jul 2024 09:00:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tqVw=O5=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sYMEt-0000Lt-Qu
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 09:00:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa8265b0-4d88-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 11:00:18 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-87-20-207-105.retail.telecomitalia.it [87.20.207.105])
 by support.bugseng.com (Postfix) with ESMTPSA id 3A3014EE075E;
 Mon, 29 Jul 2024 11:00:18 +0200 (CEST)
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
X-Inumbo-ID: fa8265b0-4d88-11ef-bc01-fd08da9f4363
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v5 5/8] x86/hvm: address violations of MISRA C Rule 16.3
Date: Mon, 29 Jul 2024 11:00:06 +0200
Message-Id: <6814760ce9c58faad6ab3a3b17196d3fccc23b43.1722239813.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722239813.git.federico.serafini@bugseng.com>
References: <cover.1722239813.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 16.3 states that "An unconditional `break' statement shall
terminate every switch-clause".

Add pseudo keyword fallthrough or missing break statement
to address violations of the rule.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v5:
- separate mechanical changes from the ones that report an error to the caller
  (see patch 6 of this series).
Changes in v4:
- do not separate different parts of HVM in different patches;
- re-arrange fallthrough positioning to comply with Coverity.
Changes in v3:
- squashed here modifications of pmtimer.c;
- no blank line after fallthrough;
- better indentation of fallthrough.
---
 xen/arch/x86/hvm/emulate.c   | 11 ++++++-----
 xen/arch/x86/hvm/hvm.c       |  1 +
 xen/arch/x86/hvm/hypercall.c |  2 +-
 xen/arch/x86/hvm/irq.c       |  1 +
 xen/arch/x86/hvm/pmtimer.c   |  1 +
 xen/arch/x86/hvm/svm/svm.c   |  2 ++
 xen/arch/x86/hvm/vlapic.c    |  1 +
 xen/arch/x86/hvm/vmx/vmx.c   |  3 ++-
 xen/arch/x86/hvm/vmx/vvmx.c  |  1 +
 xen/arch/x86/hvm/vpic.c      |  1 +
 xen/arch/x86/hvm/vpt.c       |  3 +--
 11 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 02e378365b..135aa6fc22 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -339,7 +339,7 @@ static int hvmemul_do_io(
     }
     case X86EMUL_UNIMPLEMENTED:
         ASSERT_UNREACHABLE();
-        /* Fall-through */
+        fallthrough;
     default:
         BUG();
     }
@@ -396,8 +396,7 @@ static int hvmemul_acquire_page(unsigned long gmfn, struct page_info **page)
 
     default:
         ASSERT_UNREACHABLE();
-        /* Fallthrough */
-
+        fallthrough;
     case -EINVAL:
         return X86EMUL_UNHANDLEABLE;
     }
@@ -2764,6 +2763,7 @@ int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla)
         /* fallthrough */
     default:
         hvm_emulate_writeback(&ctxt);
+        break;
     }
 
     return rc;
@@ -2799,10 +2799,11 @@ void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
         memcpy(hvio->mmio_insn, curr->arch.vm_event->emul.insn.data,
                hvio->mmio_insn_bytes);
     }
-    /* Fall-through */
+        fallthrough;
     default:
         ctx.set_context = (kind == EMUL_KIND_SET_CONTEXT_DATA);
         rc = hvm_emulate_one(&ctx, VIO_no_completion);
+        break;
     }
 
     switch ( rc )
@@ -2818,7 +2819,7 @@ void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
     case X86EMUL_UNIMPLEMENTED:
         if ( hvm_monitor_emul_unimplemented() )
             return;
-        /* fall-through */
+        fallthrough;
     case X86EMUL_UNHANDLEABLE:
         hvm_dump_emulation_state(XENLOG_G_DEBUG, "Mem event", &ctx, rc);
         hvm_inject_hw_exception(trapnr, errcode);
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 7f4b627b1f..1d32f473a4 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5283,6 +5283,7 @@ void hvm_get_segment_register(struct vcpu *v, enum x86_segment seg,
          * %cs and %tr are unconditionally present.  SVM ignores these present
          * bits and will happily run without them set.
          */
+        fallthrough;
     case x86_seg_cs:
         reg->p = 1;
         break;
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 7fb3136f0c..c1bd17571e 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -110,7 +110,7 @@ int hvm_hypercall(struct cpu_user_regs *regs)
     {
     case 8:
         eax = regs->rax;
-        /* Fallthrough to permission check. */
+        fallthrough;
     case 4:
     case 2:
         if ( currd->arch.monitor.guest_request_userspace_enabled &&
diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 210cebb0e6..1eab44defc 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -282,6 +282,7 @@ static void hvm_set_callback_irq_level(struct vcpu *v)
             __hvm_pci_intx_assert(d, pdev, pintx);
         else
             __hvm_pci_intx_deassert(d, pdev, pintx);
+        break;
     default:
         break;
     }
diff --git a/xen/arch/x86/hvm/pmtimer.c b/xen/arch/x86/hvm/pmtimer.c
index 97099ac305..87a7a01c9f 100644
--- a/xen/arch/x86/hvm/pmtimer.c
+++ b/xen/arch/x86/hvm/pmtimer.c
@@ -185,6 +185,7 @@ static int cf_check handle_evt_io(
                 gdprintk(XENLOG_WARNING, 
                          "Bad ACPI PM register write: %x bytes (%x) at %x\n", 
                          bytes, *val, port);
+                break;
             }
         }
         /* Fix up the SCI state to match the new register state */
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 988250dbc1..92bb10c504 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -681,6 +681,7 @@ static void cf_check svm_get_segment_register(
         ASSERT_UNREACHABLE();
         domain_crash(v->domain);
         *reg = (struct segment_register){};
+        break;
     }
 }
 
@@ -2416,6 +2417,7 @@ static void cf_check svm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
         printk(XENLOG_G_ERR "%s(%pv, 0x%08x, 0x%016"PRIx64") Bad register\n",
                __func__, v, reg, val);
         domain_crash(d);
+        break;
     }
 }
 
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 9cfc82666a..2ec9594271 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -367,6 +367,7 @@ static void vlapic_accept_irq(struct vcpu *v, uint32_t icr_low)
         gdprintk(XENLOG_ERR, "TODO: unsupported delivery mode in ICR %x\n",
                  icr_low);
         domain_crash(v->domain);
+        break;
     }
 }
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index f16faa6a61..46911c3e1c 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2745,6 +2745,7 @@ static void cf_check vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
         printk(XENLOG_G_ERR "%s(%pv, 0x%08x, 0x%016"PRIx64") Bad register\n",
                __func__, v, reg, val);
         domain_crash(d);
+        break;
     }
     vmx_vmcs_exit(v);
 }
@@ -3393,7 +3394,7 @@ static int cf_check vmx_msr_read_intercept(
         *msr_content |= MSR_IA32_MISC_ENABLE_BTS_UNAVAIL |
                        MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL;
         /* Perhaps vpmu will change some bits. */
-        /* FALLTHROUGH */
+        fallthrough;
     case MSR_P6_PERFCTR(0)...MSR_P6_PERFCTR(7):
     case MSR_P6_EVNTSEL(0)...MSR_P6_EVNTSEL(3):
     case MSR_CORE_PERF_FIXED_CTR0...MSR_CORE_PERF_FIXED_CTR2:
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 39290c9861..c05e0e9326 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -2768,6 +2768,7 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs,
         gprintk(XENLOG_ERR, "Unhandled nested vmexit: reason %u\n",
                 exit_reason);
         domain_crash(v->domain);
+        break;
     }
 
     return ( nvcpu->nv_vmexit_pending == 1 );
diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index 7c3b5c7254..6427b08086 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -309,6 +309,7 @@ static void vpic_ioport_write(
             if ( !(vpic->init_state & 8) )
                 break; /* CASCADE mode: wait for write to ICW3. */
             /* SNGL mode: fall through (no ICW3). */
+            fallthrough;
         case 2:
             /* ICW3 */
             vpic->init_state++;
diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index e1d6845a28..5e7b9a9f66 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -119,8 +119,7 @@ static int pt_irq_masked(struct periodic_time *pt)
 
         gsi = hvm_isa_irq_to_gsi(pt->irq);
     }
-
-    /* Fallthrough to check if the interrupt is masked on the IO APIC. */
+        fallthrough;
     case PTSRC_ioapic:
     {
         int mask = vioapic_get_mask(v->domain, gsi);
-- 
2.34.1


