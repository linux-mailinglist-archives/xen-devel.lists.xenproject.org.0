Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 002BA8D6F57
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2024 12:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734113.1140332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDLnR-0006ag-Qz; Sat, 01 Jun 2024 10:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734113.1140332; Sat, 01 Jun 2024 10:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDLnR-0006Xx-Kq; Sat, 01 Jun 2024 10:17:09 +0000
Received: by outflank-mailman (input) for mailman id 734113;
 Sat, 01 Jun 2024 10:17:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmUY=ND=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sDLnQ-0006UI-CG
 for xen-devel@lists.xenproject.org; Sat, 01 Jun 2024 10:17:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17728f2e-2000-11ef-b4bb-af5377834399;
 Sat, 01 Jun 2024 12:17:05 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 54FFC4EE0748;
 Sat,  1 Jun 2024 12:17:02 +0200 (CEST)
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
X-Inumbo-ID: 17728f2e-2000-11ef-b4bb-af5377834399
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
Subject: [XEN PATCH 2/5] x86/domain: deviate violation of MISRA C Rule 20.12
Date: Sat,  1 Jun 2024 12:16:53 +0200
Message-Id: <a8fe5f64e46e8980e1740583d59b95f88270f426.1717236930.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717236930.git.nicola.vetrini@bugseng.com>
References: <cover.1717236930.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.12 states: "A macro parameter used as an operand to
the # or ## operators, which is itself subject to further macro replacement,
shall only be used as an operand to these operators".

In this case, builds where CONFIG_COMPAT=y the fpu_ctxt
macro is used both as a regular macro argument and as an operand for
stringification in the expansion of CHECK_FIELD_.
This is deviated using a SAF-x-safe comment.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/domain.c | 1 +
 xen/arch/x86/domctl.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 536542841ef5..ccadfe0c9e70 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1084,6 +1084,7 @@ void arch_domain_creation_finished(struct domain *d)
 #ifdef CONFIG_COMPAT
 #define xen_vcpu_guest_context vcpu_guest_context
 #define fpu_ctxt fpu_ctxt.x
+/* SAF-6-safe Rule 20.12 expansion of macro fpu_ctxt with CONFIG_COMPAT */
 CHECK_FIELD_(struct, vcpu_guest_context, fpu_ctxt);
 #undef fpu_ctxt
 #undef xen_vcpu_guest_context
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 9a72d57333e9..335aedf46d03 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1326,6 +1326,7 @@ long arch_do_domctl(
 #ifdef CONFIG_COMPAT
 #define xen_vcpu_guest_context vcpu_guest_context
 #define fpu_ctxt fpu_ctxt.x
+/* SAF-6-safe Rule 20.12 expansion of macro fpu_ctxt with CONFIG_COMPAT */
 CHECK_FIELD_(struct, vcpu_guest_context, fpu_ctxt);
 #undef fpu_ctxt
 #undef xen_vcpu_guest_context
-- 
2.34.1


