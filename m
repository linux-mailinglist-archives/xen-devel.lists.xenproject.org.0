Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 199EB91825E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:29:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748860.1156838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMShy-0004Fb-4C; Wed, 26 Jun 2024 13:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748860.1156838; Wed, 26 Jun 2024 13:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMShx-0004AH-Mk; Wed, 26 Jun 2024 13:29:09 +0000
Received: by outflank-mailman (input) for mailman id 748860;
 Wed, 26 Jun 2024 13:29:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+tE4=N4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sMShv-00030Q-Dz
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:29:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1011454f-33c0-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 15:29:07 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.214])
 by support.bugseng.com (Postfix) with ESMTPSA id 3907F4EE0758;
 Wed, 26 Jun 2024 15:29:06 +0200 (CEST)
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
X-Inumbo-ID: 1011454f-33c0-11ef-90a3-e314d9c70b13
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2 for-4.20 7/7] x86/traps: address violations of MISRA C Rule 20.7
Date: Wed, 26 Jun 2024 15:28:53 +0200
Message-Id: <7830b9bfbb0aec272376817eb20bbcbfebdf4044.1719407840.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719407840.git.nicola.vetrini@bugseng.com>
References: <cover.1719407840.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 9906e874d593..ee91fc56b125 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -123,7 +123,7 @@ unsigned int __ro_after_init ler_msr;
 const unsigned int nmi_cpu;
 
 #define stack_words_per_line 4
-#define ESP_BEFORE_EXCEPTION(regs) ((unsigned long *)regs->rsp)
+#define ESP_BEFORE_EXCEPTION(regs) ((unsigned long *)(regs)->rsp)
 
 void show_code(const struct cpu_user_regs *regs)
 {
-- 
2.34.1

