Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A98887037
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 17:02:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696952.1088197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnhLO-0000lD-Cp; Fri, 22 Mar 2024 16:02:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696952.1088197; Fri, 22 Mar 2024 16:02:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnhLO-0000fF-7a; Fri, 22 Mar 2024 16:02:10 +0000
Received: by outflank-mailman (input) for mailman id 696952;
 Fri, 22 Mar 2024 16:02:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kYs8=K4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rnhLN-0000WB-Cf
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 16:02:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88dc9601-e865-11ee-afe0-a90da7624cb6;
 Fri, 22 Mar 2024 17:02:08 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id C955C4EE0C8D;
 Fri, 22 Mar 2024 17:02:06 +0100 (CET)
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
X-Inumbo-ID: 88dc9601-e865-11ee-afe0-a90da7624cb6
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH 02/11] xen/xsm: add parentheses to comply with MISRA C Rule 20.7
Date: Fri, 22 Mar 2024 17:01:51 +0100
Message-Id: <6cb601ef46a699f95eda0e10f4f9d15f1af4353e.1711118582.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711118582.git.nicola.vetrini@bugseng.com>
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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


