Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A018089157F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 10:12:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699281.1092019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq8H5-0001jP-PA; Fri, 29 Mar 2024 09:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699281.1092019; Fri, 29 Mar 2024 09:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq8H5-0001gK-Jh; Fri, 29 Mar 2024 09:11:47 +0000
Received: by outflank-mailman (input) for mailman id 699281;
 Fri, 29 Mar 2024 09:11:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LGMC=LD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rq8H4-0000ww-5C
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 09:11:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cfe1f74-edac-11ee-a1ef-f123f15fe8a2;
 Fri, 29 Mar 2024 10:11:44 +0100 (CET)
Received: from nico.bugseng.com (unknown [176.206.12.122])
 by support.bugseng.com (Postfix) with ESMTPSA id 0A5614EE0748;
 Fri, 29 Mar 2024 10:11:44 +0100 (CET)
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
X-Inumbo-ID: 5cfe1f74-edac-11ee-a1ef-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v3 4/7] x86/hvm: address violations of MISRA C Rule 20.7
Date: Fri, 29 Mar 2024 10:11:32 +0100
Message-Id: <ae50d853bbf20a74d2693a5d52f36d216c59213f.1711700095.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711700095.git.nicola.vetrini@bugseng.com>
References: <cover.1711700095.git.nicola.vetrini@bugseng.com>
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
 xen/arch/x86/hvm/domain.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
index 7f6e362a702e..b96cf93dd0ef 100644
--- a/xen/arch/x86/hvm/domain.c
+++ b/xen/arch/x86/hvm/domain.c
@@ -132,9 +132,9 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
     s = (struct segment_register)                                           \
         { 0, { (r)->s ## _ar }, (r)->s ## _limit, (r)->s ## _base };        \
     /* Set accessed / busy bit for present segments. */                     \
-    if ( s.p )                                                              \
-        s.type |= (x86_seg_##s != x86_seg_tr ? 1 : 2);                      \
-    check_segment(&s, x86_seg_ ## s); })
+    if ( (s).p )                                                            \
+        (s).type |= (x86_seg_##s != x86_seg_tr ? 1 : 2);                    \
+    check_segment(&(s), x86_seg_ ## s); })
 
         rc = SEG(cs, regs);
         rc |= SEG(ds, regs);
-- 
2.34.1


