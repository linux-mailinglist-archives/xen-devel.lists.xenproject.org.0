Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2BB876316
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 12:21:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690223.1076038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riYHt-00077o-5L; Fri, 08 Mar 2024 11:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690223.1076038; Fri, 08 Mar 2024 11:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riYHt-00074W-2I; Fri, 08 Mar 2024 11:21:17 +0000
Received: by outflank-mailman (input) for mailman id 690223;
 Fri, 08 Mar 2024 11:21:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PBuc=KO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1riYHr-00067H-Fd
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 11:21:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8c7a6ae-dd3d-11ee-a1ee-f123f15fe8a2;
 Fri, 08 Mar 2024 12:21:13 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 938824EE0751;
 Fri,  8 Mar 2024 12:21:12 +0100 (CET)
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
X-Inumbo-ID: f8c7a6ae-dd3d-11ee-a1ee-f123f15fe8a2
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
Subject: [XEN PATCH v2 4/7] xen/param: address violations of MISRA C Rule 20.7
Date: Fri,  8 Mar 2024 12:21:01 +0100
Message-Id: <6ad91190bd777ee76d94efbe71341a38dbcdb428.1709896401.git.nicola.vetrini@bugseng.com>
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
 xen/include/xen/param.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/xen/include/xen/param.h b/xen/include/xen/param.h
index 13607e0e50e0..1bdbab34ab1f 100644
--- a/xen/include/xen/param.h
+++ b/xen/include/xen/param.h
@@ -45,42 +45,42 @@ extern const struct kernel_param __setup_start[], __setup_end[];
 #define TEMP_NAME(base) _TEMP_NAME(base, __LINE__)
 
 #define custom_param(_name, _var) \
-    __setup_str __setup_str_##_var[] = _name; \
+    __setup_str __setup_str_##_var[] = (_name); \
     __kparam __setup_##_var = \
         { .name = __setup_str_##_var, \
           .type = OPT_CUSTOM, \
-          .par.func = _var }
+          .par.func = (_var) }
 #define boolean_param(_name, _var) \
-    __setup_str __setup_str_##_var[] = _name; \
+    __setup_str __setup_str_##_var[] = (_name); \
     __kparam __setup_##_var = \
         { .name = __setup_str_##_var, \
           .type = OPT_BOOL, \
           .len = sizeof(_var) + \
                  BUILD_BUG_ON_ZERO(sizeof(_var) != sizeof(bool)), \
-          .par.var = &_var }
+          .par.var = &(_var) }
 #define integer_param(_name, _var) \
-    __setup_str __setup_str_##_var[] = _name; \
+    __setup_str __setup_str_##_var[] = (_name); \
     __kparam __setup_##_var = \
         { .name = __setup_str_##_var, \
           .type = OPT_UINT, \
           .len = sizeof(_var), \
-          .par.var = &_var }
+          .par.var = &(_var) }
 #define size_param(_name, _var) \
-    __setup_str __setup_str_##_var[] = _name; \
+    __setup_str __setup_str_##_var[] = (_name); \
     __kparam __setup_##_var = \
         { .name = __setup_str_##_var, \
           .type = OPT_SIZE, \
           .len = sizeof(_var), \
-          .par.var = &_var }
+          .par.var = &(_var) }
 #define string_param(_name, _var) \
-    __setup_str __setup_str_##_var[] = _name; \
+    __setup_str __setup_str_##_var[] = (_name); \
     __kparam __setup_##_var = \
         { .name = __setup_str_##_var, \
           .type = OPT_STR, \
           .len = sizeof(_var), \
-          .par.var = &_var }
+          .par.var = &(_var) }
 #define ignore_param(_name)                 \
-    __setup_str TEMP_NAME(__setup_str_ign)[] = _name;    \
+    __setup_str TEMP_NAME(__setup_str_ign)[] = (_name);  \
     __kparam TEMP_NAME(__setup_ign) =                    \
         { .name = TEMP_NAME(__setup_str_ign),            \
           .type = OPT_IGNORE }
-- 
2.34.1


