Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F218E917C7B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 11:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748590.1156401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOwu-0006DJ-Tq; Wed, 26 Jun 2024 09:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748590.1156401; Wed, 26 Jun 2024 09:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOwu-00064P-El; Wed, 26 Jun 2024 09:28:20 +0000
Received: by outflank-mailman (input) for mailman id 748590;
 Wed, 26 Jun 2024 09:28:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P08s=N4=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sMOws-0004l0-4Z
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 09:28:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b8dcf0b-339e-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 11:28:17 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [78.209.199.41])
 by support.bugseng.com (Postfix) with ESMTPSA id B85024EE0757;
 Wed, 26 Jun 2024 11:28:16 +0200 (CEST)
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
X-Inumbo-ID: 6b8dcf0b-339e-11ef-90a3-e314d9c70b13
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v3 07/12] x86/hvm: address violations of MISRA C Rule 16.3
Date: Wed, 26 Jun 2024 11:28:00 +0200
Message-Id: <87cfe4d3e75c3a7d4174393a31aaaf80e0e60633.1719383180.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719383180.git.federico.serafini@bugseng.com>
References: <cover.1719383180.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 16.3 states that "An unconditional `break' statement shall
terminate every switch-clause".

Add pseudo keyword fallthrough or missing break statement
to address violations of the rule.

As a defensive measure, return -EOPNOTSUPP in case an unreachable
return statement is reached.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v3:
- squashed here modifications of pmtimer.c;
- no blank line after fallthrough;
- better indentation of fallthrough.
---
 xen/arch/x86/hvm/emulate.c   | 9 ++++++---
 xen/arch/x86/hvm/hvm.c       | 5 +++++
 xen/arch/x86/hvm/hypercall.c | 1 +
 xen/arch/x86/hvm/irq.c       | 1 +
 xen/arch/x86/hvm/pmtimer.c   | 1 +
 5 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 02e378365b..f5dd08f510 100644
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
@@ -2674,6 +2674,7 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
 
     default:
         ASSERT_UNREACHABLE();
+        break;
     }
 
     if ( hvmemul_ctxt->ctxt.retire.singlestep )
@@ -2764,6 +2765,7 @@ int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla)
         /* fallthrough */
     default:
         hvm_emulate_writeback(&ctxt);
+        break;
     }
 
     return rc;
@@ -2798,11 +2800,12 @@ void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
         hvio->mmio_insn_bytes = sizeof(hvio->mmio_insn);
         memcpy(hvio->mmio_insn, curr->arch.vm_event->emul.insn.data,
                hvio->mmio_insn_bytes);
+        fallthrough;
     }
-    /* Fall-through */
     default:
         ctx.set_context = (kind == EMUL_KIND_SET_CONTEXT_DATA);
         rc = hvm_emulate_one(&ctx, VIO_no_completion);
+        break;
     }
 
     switch ( rc )
@@ -2818,7 +2821,7 @@ void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
     case X86EMUL_UNIMPLEMENTED:
         if ( hvm_monitor_emul_unimplemented() )
             return;
-        /* fall-through */
+        fallthrough;
     case X86EMUL_UNHANDLEABLE:
         hvm_dump_emulation_state(XENLOG_G_DEBUG, "Mem event", &ctx, rc);
         hvm_inject_hw_exception(trapnr, errcode);
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 7f4b627b1f..d7f195ba9a 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4919,6 +4919,8 @@ static int do_altp2m_op(
 
     default:
         ASSERT_UNREACHABLE();
+        rc = -EOPNOTSUPP;
+        break;
     }
 
  out:
@@ -5020,6 +5022,8 @@ static int compat_altp2m_op(
 
     default:
         ASSERT_UNREACHABLE();
+        rc = -EOPNOTSUPP;
+        break;
     }
 
     return rc;
@@ -5283,6 +5287,7 @@ void hvm_get_segment_register(struct vcpu *v, enum x86_segment seg,
          * %cs and %tr are unconditionally present.  SVM ignores these present
          * bits and will happily run without them set.
          */
+        fallthrough;
     case x86_seg_cs:
         reg->p = 1;
         break;
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 7fb3136f0c..2271afe02a 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -111,6 +111,7 @@ int hvm_hypercall(struct cpu_user_regs *regs)
     case 8:
         eax = regs->rax;
         /* Fallthrough to permission check. */
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
-- 
2.34.1


