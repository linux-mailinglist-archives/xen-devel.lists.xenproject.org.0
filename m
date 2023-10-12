Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEB17C7172
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 17:29:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615845.957391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqxcb-00085z-6G; Thu, 12 Oct 2023 15:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615845.957391; Thu, 12 Oct 2023 15:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqxcb-000829-08; Thu, 12 Oct 2023 15:29:09 +0000
Received: by outflank-mailman (input) for mailman id 615845;
 Thu, 12 Oct 2023 15:29:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oWZW=F2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qqxcZ-0006QC-0H
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 15:29:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1429e5d5-6914-11ee-9b0e-b553b5be7939;
 Thu, 12 Oct 2023 17:29:05 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id A206E4EE074B;
 Thu, 12 Oct 2023 17:29:04 +0200 (CEST)
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
X-Inumbo-ID: 1429e5d5-6914-11ee-9b0e-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH][for-next v2 6/8] x86/mce: Move MC_NCLASSES into the enum mctelem_class
Date: Thu, 12 Oct 2023 17:28:50 +0200
Message-Id: <6622a2ec7079f86b73ae420e1e840d3d35ffb3a0.1697123806.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697123806.git.nicola.vetrini@bugseng.com>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definition of MC_NCLASSES contained a violation of MISRA C:2012
Rule 10.1, therefore by moving it as an enumeration constant resolves the
violation and makes it more resilient to possible additions to that enum.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Note that the use of an enum constant as operand to [ ] and != is allowed
by the Rule.
---
 xen/arch/x86/cpu/mcheck/mctelem.c | 2 --
 xen/arch/x86/cpu/mcheck/mctelem.h | 5 +++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mctelem.c b/xen/arch/x86/cpu/mcheck/mctelem.c
index 329ac20faf96..77a4d1d5ff48 100644
--- a/xen/arch/x86/cpu/mcheck/mctelem.c
+++ b/xen/arch/x86/cpu/mcheck/mctelem.c
@@ -64,8 +64,6 @@ struct mctelem_ent {
 
 #define MC_NENT (MC_URGENT_NENT + MC_NONURGENT_NENT)
 
-#define	MC_NCLASSES		(MC_NONURGENT + 1)
-
 #define	COOKIE2MCTE(c)		((struct mctelem_ent *)(c))
 #define	MCTE2COOKIE(tep)	((mctelem_cookie_t)(tep))
 
diff --git a/xen/arch/x86/cpu/mcheck/mctelem.h b/xen/arch/x86/cpu/mcheck/mctelem.h
index d4eba53ae0e5..21b251847bc0 100644
--- a/xen/arch/x86/cpu/mcheck/mctelem.h
+++ b/xen/arch/x86/cpu/mcheck/mctelem.h
@@ -55,8 +55,9 @@
 typedef struct mctelem_cookie *mctelem_cookie_t;
 
 typedef enum mctelem_class {
-	MC_URGENT,
-	MC_NONURGENT
+    MC_URGENT,
+    MC_NONURGENT,
+    MC_NCLASSES
 } mctelem_class_t;
 
 extern void mctelem_init(unsigned int);
-- 
2.34.1


