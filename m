Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C818B7961
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 16:28:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714937.1116352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1oT8-0007f6-7p; Tue, 30 Apr 2024 14:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714937.1116352; Tue, 30 Apr 2024 14:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1oT8-0007dN-40; Tue, 30 Apr 2024 14:28:30 +0000
Received: by outflank-mailman (input) for mailman id 714937;
 Tue, 30 Apr 2024 14:28:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BF+G=MD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1s1oT6-00077h-8X
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 14:28:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8efd52b-06fd-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 16:28:27 +0200 (CEST)
Received: from nico.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id BB4C04EE0754;
 Tue, 30 Apr 2024 16:28:25 +0200 (CEST)
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
X-Inumbo-ID: e8efd52b-06fd-11ef-909b-e314d9c70b13
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Anthony PERARD <anthony@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v2 2/3] xen/unaligned: address violation of MISRA C Rule 20.7
Date: Tue, 30 Apr 2024 16:28:15 +0200
Message-Id: <ec56516020d15cf20419b8bdf6f01fc365c52126.1714487169.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714487169.git.nicola.vetrini@bugseng.com>
References: <cover.1714487169.git.nicola.vetrini@bugseng.com>
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
Somewhat surprisingly, the change in the tools directory is also needed, otherwise
some CI build jobs fail (see e.g. [1]). This is not undefined behaviour
as long as the two definitions are kept in sync, following section
6.10.3p2 of the C99 standard, but having the definition in common-macros.h
is still a potential problem.

[1] https://gitlab.com/xen-project/people/bugseng/xen/-/jobs/6742878558
---
 tools/include/xen-tools/common-macros.h | 2 +-
 xen/include/xen/unaligned.h             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index 07aed92684b5..60912225cb7a 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -102,7 +102,7 @@
 
 #define put_unaligned_t(type, val, ptr) do {                        \
     struct { type x; } __packed *ptr_ = (typeof(ptr_))(ptr);        \
-    ptr_->x = val;                                                  \
+    ptr_->x = (val);                                                \
 } while (0)
 
 #define get_unaligned(ptr)      get_unaligned_t(typeof(*(ptr)), ptr)
diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h
index 3eda0ece1199..2e8238d45c54 100644
--- a/xen/include/xen/unaligned.h
+++ b/xen/include/xen/unaligned.h
@@ -19,7 +19,7 @@
 
 #define put_unaligned_t(type, val, ptr) do {				\
 	struct { type x; } __packed *ptr_ = (typeof(ptr_))(ptr);	\
-	ptr_->x = val;							\
+	ptr_->x = (val);							\
 } while (0)
 
 #define get_unaligned(ptr)	get_unaligned_t(typeof(*(ptr)), ptr)
-- 
2.34.1


