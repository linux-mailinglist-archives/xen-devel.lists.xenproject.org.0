Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 132FA768EE7
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 09:34:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572771.896836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQNQH-0000af-Ax; Mon, 31 Jul 2023 07:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572771.896836; Mon, 31 Jul 2023 07:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQNQH-0000Tz-5W; Mon, 31 Jul 2023 07:34:33 +0000
Received: by outflank-mailman (input) for mailman id 572771;
 Mon, 31 Jul 2023 07:34:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wefb=DR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qQNQF-000873-I9
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 07:34:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aff1dfba-2f74-11ee-b254-6b7b168915f2;
 Mon, 31 Jul 2023 09:34:31 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 68ED14EE0743;
 Mon, 31 Jul 2023 09:34:29 +0200 (CEST)
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
X-Inumbo-ID: aff1dfba-2f74-11ee-b254-6b7b168915f2
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 4/4] x86emul: remove local variable to address MISRA C:2012 Rule 5.3
Date: Mon, 31 Jul 2023 09:33:41 +0200
Message-Id: <d9ab52ae16d3c9a780403906db52b42f24c1e60a.1690788513.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690788513.git.nicola.vetrini@bugseng.com>
References: <cover.1690788513.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The local variable removed by this commit shadowed another declared in
an outer scope and thus violates Rule 5.3. It was introduced as part of
a refactoring by commit abf5fb62f73d0dbeabc6a8cd6dbb55174b36c8d1.

No functional changes.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/x86_emulate/x86_emulate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index f811c1c76b..60bd2f8d8e 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -8408,8 +8408,6 @@ x86_emulate(
         generate_exception(X86_EXC_MF);
     if ( stub_exn.info.fields.trapnr == X86_EXC_XM )
     {
-        unsigned long cr4;
-
         if ( !ops->read_cr || ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
             cr4 = X86_CR4_OSXMMEXCPT;
         generate_exception(cr4 & X86_CR4_OSXMMEXCPT ? X86_EXC_XM : X86_EXC_UD);
-- 
2.34.1


