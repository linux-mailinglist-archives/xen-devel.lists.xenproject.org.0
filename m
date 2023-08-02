Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D883976D036
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 16:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574981.900717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCzw-0000YX-OP; Wed, 02 Aug 2023 14:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574981.900717; Wed, 02 Aug 2023 14:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCzw-0000J0-Iq; Wed, 02 Aug 2023 14:38:48 +0000
Received: by outflank-mailman (input) for mailman id 574981;
 Wed, 02 Aug 2023 14:38:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YIS5=DT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRCzt-0007ap-U6
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 14:38:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48220271-3142-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 16:38:44 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 95DD24EE0742;
 Wed,  2 Aug 2023 16:38:43 +0200 (CEST)
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
X-Inumbo-ID: 48220271-3142-11ee-8613-37d641c3527e
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
Subject: [XEN PATCH 09/11] x86/xstate: moved BUILD_BUG_ON to address MISRA C:2012 Rule 2.1
Date: Wed,  2 Aug 2023 16:38:15 +0200
Message-Id: <4cdcd0a9f99109463686420d6c3fc6681d215d99.1690985045.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690985045.git.nicola.vetrini@bugseng.com>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Variable declarations between a switch statement guard and before
any case label are unreachable code, and hence violate Rule 2.1:
"A project shall not contain unreachable code".

Therefore the variable declarations are moved in the smallest enclosing
scope, near other variable definitions.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/xstate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 92496f3795..cb2b9e720c 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -396,9 +396,10 @@ void xrstor(struct vcpu *v, uint64_t mask)
      */
     for ( prev_faults = faults = 0; ; prev_faults = faults )
     {
+        BUILD_BUG_ON(sizeof(faults) != 4); /* Clang doesn't support %z in asm. */
+
         switch ( __builtin_expect(ptr->fpu_sse.x[FPU_WORD_SIZE_OFFSET], 8) )
         {
-            BUILD_BUG_ON(sizeof(faults) != 4); /* Clang doesn't support %z in asm. */
 #define _xrstor(insn) \
         asm volatile ( "1: .byte " insn "\n" \
                        "3:\n" \
-- 
2.34.1


