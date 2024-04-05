Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F05899929
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 11:15:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701165.1095405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsfet-0000TA-SY; Fri, 05 Apr 2024 09:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701165.1095405; Fri, 05 Apr 2024 09:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsfet-0000P6-Ex; Fri, 05 Apr 2024 09:14:51 +0000
Received: by outflank-mailman (input) for mailman id 701165;
 Fri, 05 Apr 2024 09:14:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUTm=LK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rsfer-0007WZ-En
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 09:14:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f32b95bd-f32c-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 11:14:48 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 5167C4EE0747;
 Fri,  5 Apr 2024 11:14:47 +0200 (CEST)
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
X-Inumbo-ID: f32b95bd-f32c-11ee-a1ef-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2 6/9] x86/hvm: address violations of MISRA C Rule 16.2
Date: Fri,  5 Apr 2024 11:14:34 +0200
Message-Id: <165d61fab77c0b6613b78e0091195753fe9cd2cc.1712305581.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712305581.git.nicola.vetrini@bugseng.com>
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the switch so that a violation of
MISRA C Rule 16.2 is resolved (a switch label should be immediately
enclosed in the compound statement of the switch).

The switch clause ending with the pseudo
keyword "fallthrough" is an allowed exception to Rule 16.3.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/hvm/hypercall.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index eeb73e1aa5d0..2801d75d89f1 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -119,12 +119,12 @@ int hvm_hypercall(struct cpu_user_regs *regs)
             (mode == 8 ? regs->rdi : regs->ebx) == HVMOP_guest_request_vm_event )
             break;
 
-        if ( unlikely(hvm_get_cpl(curr)) )
-        {
+        if ( !unlikely(hvm_get_cpl(curr)) )
+            break;
+        fallthrough;
     default:
-            regs->rax = -EPERM;
-            return HVM_HCALL_completed;
-        }
+        regs->rax = -EPERM;
+        return HVM_HCALL_completed;
     case 0:
         break;
     }
-- 
2.34.1


