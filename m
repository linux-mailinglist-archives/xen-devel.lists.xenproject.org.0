Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B08C4876314
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 12:21:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690221.1076016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riYHq-0006UY-IQ; Fri, 08 Mar 2024 11:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690221.1076016; Fri, 08 Mar 2024 11:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riYHq-0006Om-BI; Fri, 08 Mar 2024 11:21:14 +0000
Received: by outflank-mailman (input) for mailman id 690221;
 Fri, 08 Mar 2024 11:21:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PBuc=KO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1riYHo-00067S-Te
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 11:21:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f80cadda-dd3d-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 12:21:12 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 5DC274EE074E;
 Fri,  8 Mar 2024 12:21:10 +0100 (CET)
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
X-Inumbo-ID: f80cadda-dd3d-11ee-afda-a90da7624cb6
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
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 2/7] xen/include: address violations of MISRA C Rule 20.7
Date: Fri,  8 Mar 2024 12:20:59 +0100
Message-Id: <5be252bfb30682d33aecca11921dcdfcc17f9ae6.1709896401.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709896401.git.nicola.vetrini@bugseng.com>
References: <cover.1709896401.git.nicola.vetrini@bugseng.com>
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
Changes in v2:
- split from an earlier patch
---
 xen/include/xen/bug.h  | 2 +-
 xen/include/xen/init.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
index 2c45c462fc63..77fe1e1ba840 100644
--- a/xen/include/xen/bug.h
+++ b/xen/include/xen/bug.h
@@ -80,7 +80,7 @@ struct bug_frame {
     [bf_type]    "i" (type),                                                 \
     [bf_ptr]     "i" (ptr),                                                  \
     [bf_msg]     "i" (msg),                                                  \
-    [bf_line_lo] "i" ((line & ((1 << BUG_LINE_LO_WIDTH) - 1))                \
+    [bf_line_lo] "i" (((line) & ((1 << BUG_LINE_LO_WIDTH) - 1))              \
                       << BUG_DISP_WIDTH),                                    \
     [bf_line_hi] "i" (((line) >> BUG_LINE_LO_WIDTH) << BUG_DISP_WIDTH)
 
diff --git a/xen/include/xen/init.h b/xen/include/xen/init.h
index 1d7c0216bc80..0a4223833755 100644
--- a/xen/include/xen/init.h
+++ b/xen/include/xen/init.h
@@ -63,9 +63,9 @@ typedef int (*initcall_t)(void);
 typedef void (*exitcall_t)(void);
 
 #define presmp_initcall(fn) \
-    const static initcall_t __initcall_##fn __init_call("presmp") = fn
+    const static initcall_t __initcall_##fn __init_call("presmp") = (fn)
 #define __initcall(fn) \
-    const static initcall_t __initcall_##fn __init_call("1") = fn
+    const static initcall_t __initcall_##fn __init_call("1") = (fn)
 #define __exitcall(fn) \
     static exitcall_t __exitcall_##fn __exit_call = fn
 
-- 
2.34.1


