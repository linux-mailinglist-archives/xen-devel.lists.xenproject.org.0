Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D75F89992B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 11:15:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701167.1095416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsfev-0000sM-4h; Fri, 05 Apr 2024 09:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701167.1095416; Fri, 05 Apr 2024 09:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsfeu-0000cy-NZ; Fri, 05 Apr 2024 09:14:52 +0000
Received: by outflank-mailman (input) for mailman id 701167;
 Fri, 05 Apr 2024 09:14:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUTm=LK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rsfer-0007WZ-Vk
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 09:14:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f375b6da-f32c-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 11:14:48 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id DBAA64EE0749;
 Fri,  5 Apr 2024 11:14:47 +0200 (CEST)
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
X-Inumbo-ID: f375b6da-f32c-11ee-a1ef-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH v2 7/9] xen/xsm: address violation of MISRA C Rule 16.2
Date: Fri,  5 Apr 2024 11:14:35 +0200
Message-Id: <7fbb80bf62fc2e5f91a89375134622366c0b3891.1712305581.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712305581.git.nicola.vetrini@bugseng.com>
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the switch so that a violation of
MISRA C Rule 16.2 is resolved (A switch label shall only be used
when the most closely-enclosing compound statement is the body of
a switch statement).
Note that the switch clause ending with the pseudo
keyword "fallthrough" is an allowed exception to Rule 16.3.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
The second switch is not the best in terms of readability, so it may
be best to deviate this particular instance.
---
 xen/include/xsm/dummy.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 88039fdd227c..84d3a8ed1c94 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -83,17 +83,17 @@ static always_inline int xsm_default_action(
         return 0;
     case XSM_TARGET:
         if ( evaluate_nospec(src == target) )
-        {
             return 0;
+        fallthrough;
     case XSM_XS_PRIV:
-            if ( evaluate_nospec(is_xenstore_domain(src)) )
-                return 0;
-        }
-        /* fall through */
+        if ( (action == XSM_XS_PRIV) &&
+             evaluate_nospec(is_xenstore_domain(src)) )
+            return 0;
+        fallthrough;
     case XSM_DM_PRIV:
         if ( target && evaluate_nospec(src->target == target) )
             return 0;
-        /* fall through */
+        fallthrough;
     case XSM_PRIV:
         if ( is_control_domain(src) )
             return 0;
-- 
2.34.1


