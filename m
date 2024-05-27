Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DC08D04C3
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 16:53:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730808.1136049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBbj7-0005dz-6M; Mon, 27 May 2024 14:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730808.1136049; Mon, 27 May 2024 14:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBbj7-0005cb-1F; Mon, 27 May 2024 14:53:29 +0000
Received: by outflank-mailman (input) for mailman id 730808;
 Mon, 27 May 2024 14:53:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uY6H=M6=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sBbj5-00056W-BA
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 14:53:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df545d30-1c38-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 16:53:26 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id AE69A4EE0744;
 Mon, 27 May 2024 16:53:25 +0200 (CEST)
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
X-Inumbo-ID: df545d30-1c38-11ef-90a1-e314d9c70b13
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
Subject: [XEN PATCH 4/4] x86/traps: address violation of MISRA C Rule 8.4
Date: Mon, 27 May 2024 16:53:19 +0200
Message-Id: <9d33b2c2aeb59ca67136ed1b65c06e6ef4fd1ed8.1716814609.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716814609.git.nicola.vetrini@bugseng.com>
References: <cover.1716814609.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 8.4 states: "A compatible declaration shall be visible when
an object or function with external linkage is defined".

The function do_general_protection is either used is asm code
or only within this unit, so there is no risk of this getting
out of sync with its definition, but the function must remain
extern.

Therefore, this function is deviated using a comment-based deviation.
No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/traps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 468a03608102..9906e874d593 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1257,6 +1257,7 @@ void asmlinkage do_int3(struct cpu_user_regs *regs)
     pv_inject_hw_exception(X86_EXC_BP, X86_EVENT_NO_EC);
 }
 
+/* SAF-1-safe */
 void do_general_protection(struct cpu_user_regs *regs)
 {
 #ifdef CONFIG_PV
-- 
2.34.1


