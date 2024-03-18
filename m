Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DB487E8FE
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 12:54:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694609.1083495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmBZ5-0001Le-Qt; Mon, 18 Mar 2024 11:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694609.1083495; Mon, 18 Mar 2024 11:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmBZ5-0001HD-Mk; Mon, 18 Mar 2024 11:54:03 +0000
Received: by outflank-mailman (input) for mailman id 694609;
 Mon, 18 Mar 2024 11:54:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QoDm=KY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rmBZ4-0001F3-UO
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 11:54:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35d9b533-e51e-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 12:54:01 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 92BBE4EE0745;
 Mon, 18 Mar 2024 12:54:00 +0100 (CET)
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
X-Inumbo-ID: 35d9b533-e51e-11ee-afdd-a90da7624cb6
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH 03/10] xen/xsm: add parentheses to comply with MISRA C Rule 20.7
Date: Mon, 18 Mar 2024 12:53:46 +0100
Message-Id: <4eeb9be581e3fa07378f5a7deb23c9066474638b.1710762555.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710762555.git.nicola.vetrini@bugseng.com>
References: <cover.1710762555.git.nicola.vetrini@bugseng.com>
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
 xen/include/xsm/dummy.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 8671af1ba4d3..88039fdd227c 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -58,7 +58,7 @@ void __xsm_action_mismatch_detected(void);
 
 #define XSM_DEFAULT_ARG /* */
 #define XSM_DEFAULT_VOID void
-#define XSM_ASSERT_ACTION(def) xsm_default_t action = def; (void)action
+#define XSM_ASSERT_ACTION(def) xsm_default_t action = (def); (void)action
 
 #else /* CONFIG_XSM */
 
@@ -71,7 +71,7 @@ void __xsm_action_mismatch_detected(void);
 #define XSM_INLINE always_inline
 #define XSM_DEFAULT_ARG xsm_default_t action,
 #define XSM_DEFAULT_VOID xsm_default_t action
-#define XSM_ASSERT_ACTION(def) LINKER_BUG_ON(def != action)
+#define XSM_ASSERT_ACTION(def) LINKER_BUG_ON((def) != action)
 
 #endif /* CONFIG_XSM */
 
-- 
2.34.1


