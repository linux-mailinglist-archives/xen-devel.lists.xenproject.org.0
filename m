Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2630E93F085
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 11:00:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766471.1176990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYMEx-0001YD-D7; Mon, 29 Jul 2024 09:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766471.1176990; Mon, 29 Jul 2024 09:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYMEx-0001Qs-95; Mon, 29 Jul 2024 09:00:23 +0000
Received: by outflank-mailman (input) for mailman id 766471;
 Mon, 29 Jul 2024 09:00:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tqVw=O5=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sYMEu-0000Lt-Qx
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 09:00:20 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fab3f2b0-4d88-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 11:00:19 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-87-20-207-105.retail.telecomitalia.it [87.20.207.105])
 by support.bugseng.com (Postfix) with ESMTPSA id 872954EE0761;
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
X-Inumbo-ID: fab3f2b0-4d88-11ef-bc01-fd08da9f4363
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v5 6/8] x86/hvm: add defensive statements in unreachable program points
Date: Mon, 29 Jul 2024 11:00:07 +0200
Message-Id: <a686f70406c33d689b040af5d4e14878cde8a36c.1722239813.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722239813.git.federico.serafini@bugseng.com>
References: <cover.1722239813.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As a defensive measure, make sure to signal an error to the caller
if an unreachable program point is reached.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/hvm/emulate.c  | 1 +
 xen/arch/x86/hvm/hvm.c      | 4 ++++
 xen/arch/x86/hvm/vmx/vmcs.c | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 135aa6fc22..b6ca5cb9d1 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2673,6 +2673,7 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt,
 
     default:
         ASSERT_UNREACHABLE();
+        return X86EMUL_UNHANDLEABLE;
     }
 
     if ( hvmemul_ctxt->ctxt.retire.singlestep )
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 1d32f473a4..d7f195ba9a 100644
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
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 9b6dc51f36..5787110a56 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1446,6 +1446,7 @@ struct vmx_msr_entry *vmx_find_msr(const struct vcpu *v, uint32_t msr,
 
     default:
         ASSERT_UNREACHABLE();
+        break;
     }
 
     if ( !start )
@@ -1598,6 +1599,7 @@ int vmx_del_msr(struct vcpu *v, uint32_t msr, enum vmx_msr_list_type type)
 
     default:
         ASSERT_UNREACHABLE();
+        return -EINVAL;
     }
 
     if ( !start )
-- 
2.34.1


