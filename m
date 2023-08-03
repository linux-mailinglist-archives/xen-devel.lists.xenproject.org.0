Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB56176E58B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 12:23:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576178.902052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVUI-0005EO-I7; Thu, 03 Aug 2023 10:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576178.902052; Thu, 03 Aug 2023 10:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVUI-0005Ab-F3; Thu, 03 Aug 2023 10:23:22 +0000
Received: by outflank-mailman (input) for mailman id 576178;
 Thu, 03 Aug 2023 10:23:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYgs=DU=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qRVUG-0004Rp-NY
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 10:23:20 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c48b5c64-31e7-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 12:23:20 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id 7BA0A4EE0740;
 Thu,  3 Aug 2023 12:23:19 +0200 (CEST)
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
X-Inumbo-ID: c48b5c64-31e7-11ee-b268-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH 02/13] x86/svm: address violations of MISRA C:2012 Rule 7.3
Date: Thu,  3 Aug 2023 12:22:17 +0200
Message-Id: <2779c3b2cbe27d95274a4ab44f6b9c877e59e8bc.1691053438.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691053438.git.simone.ballarin@bugseng.com>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
states:
"The lowercase character 'l' shall not be used in a literal suffix".

Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.

The changes in this patch are mechanical.

Signed-off-by: Gianluca	Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/arch/x86/hvm/svm/svm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index b3845bdca7..01dd592d9b 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1077,7 +1077,7 @@ static void svm_guest_osvw_init(struct domain *d)
      * Guests should see errata 400 and 415 as fixed (assuming that
      * HLT and IO instructions are intercepted).
      */
-    svm->osvw.length = min(max(3ul, osvw_length), 64ul);
+    svm->osvw.length = min(max(3UL, osvw_length), 64UL);
     svm->osvw.status = osvw_status & ~6;
 
     /*
@@ -1652,7 +1652,7 @@ static void svm_do_nested_pgfault(struct vcpu *v,
     else if ( pfec & NPT_PFEC_in_gpt )
         npfec.kind = npfec_kind_in_gpt;
 
-    ret = hvm_hap_nested_page_fault(gpa, ~0ul, npfec);
+    ret = hvm_hap_nested_page_fault(gpa, ~0UL, npfec);
 
     if ( tb_init_done )
     {
-- 
2.34.1


