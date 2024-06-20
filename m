Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A65809106C8
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 15:52:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744513.1151620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKICp-0001TM-HL; Thu, 20 Jun 2024 13:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744513.1151620; Thu, 20 Jun 2024 13:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKICp-0001Ns-4x; Thu, 20 Jun 2024 13:52:03 +0000
Received: by outflank-mailman (input) for mailman id 744513;
 Thu, 20 Jun 2024 13:52:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPla=NW=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sKICm-0008AK-S6
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 13:52:00 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42cf13a2-2f0c-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 15:51:58 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [78.208.165.219])
 by support.bugseng.com (Postfix) with ESMTPSA id 619DB4EE0738;
 Thu, 20 Jun 2024 15:51:57 +0200 (CEST)
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
X-Inumbo-ID: 42cf13a2-2f0c-11ef-b4bb-af5377834399
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>
Subject: [XEN PATCH 07/13] x86/hvm: address violations of MISRA C Rule 16.3
Date: Thu, 20 Jun 2024 15:51:41 +0200
Message-Id: <ee3c18c1a4cf6836d3d5e991908c6ae4ebda6b74.1718890095.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <10af9145252a2f5c31ea0f13cbb67cbe76a8ba3a.1718890095.git.federico.serafini@bugseng.com>
References: <10af9145252a2f5c31ea0f13cbb67cbe76a8ba3a.1718890095.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 16.3 states that "An unconditional `break' statement shall
terminate every switch-clause".

Add pseudo keyword fallthrough and missing break statement
to address violations of the rule.

As a defensive measure, return -EOPNOTSUPP in case an unreachable return
statement is reached.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/hvm/emulate.c   | 3 +++
 xen/arch/x86/hvm/hvm.c       | 6 ++++++
 xen/arch/x86/hvm/hypercall.c | 1 +
 xen/arch/x86/hvm/irq.c       | 1 +
 4 files changed, 11 insertions(+)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 02e378365b..6d0fba9285 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
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
@@ -2803,6 +2805,7 @@ void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
     default:
         ctx.set_context = (kind == EMUL_KIND_SET_CONTEXT_DATA);
         rc = hvm_emulate_one(&ctx, VIO_no_completion);
+        break;
     }
 
     switch ( rc )
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 7f4b627b1f..c263e562ff 100644
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
@@ -5283,6 +5287,8 @@ void hvm_get_segment_register(struct vcpu *v, enum x86_segment seg,
          * %cs and %tr are unconditionally present.  SVM ignores these present
          * bits and will happily run without them set.
          */
+        fallthrough;
+
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
-- 
2.34.1


