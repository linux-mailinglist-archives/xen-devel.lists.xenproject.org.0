Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AF886CCEA
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 16:28:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687193.1070248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiKT-0000QB-TR; Thu, 29 Feb 2024 15:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687193.1070248; Thu, 29 Feb 2024 15:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiKT-0000OP-Q5; Thu, 29 Feb 2024 15:28:13 +0000
Received: by outflank-mailman (input) for mailman id 687193;
 Thu, 29 Feb 2024 15:28:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ot4I=KG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rfiKS-00087e-Nk
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 15:28:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26432195-d717-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 16:28:12 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.196])
 by support.bugseng.com (Postfix) with ESMTPSA id 7886A4EE074E;
 Thu, 29 Feb 2024 16:28:11 +0100 (CET)
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
X-Inumbo-ID: 26432195-d717-11ee-afd8-a90da7624cb6
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
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 05/10] xen/perfc: address violations of MISRA C Rule 20.7
Date: Thu, 29 Feb 2024 16:27:57 +0100
Message-Id: <3418c09bb8c4ceeceb66334191adfad190954f56.1709219010.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709219010.git.nicola.vetrini@bugseng.com>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
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
 xen/common/perfc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/common/perfc.c b/xen/common/perfc.c
index 7400667bf0c4..02f4fc8fe032 100644
--- a/xen/common/perfc.c
+++ b/xen/common/perfc.c
@@ -10,10 +10,10 @@
 #include <public/sysctl.h>
 #include <asm/perfc.h>
 
-#define PERFCOUNTER( var, name )              { name, TYPE_SINGLE, 0 },
-#define PERFCOUNTER_ARRAY( var, name, size )  { name, TYPE_ARRAY,  size },
-#define PERFSTATUS( var, name )               { name, TYPE_S_SINGLE, 0 },
-#define PERFSTATUS_ARRAY( var, name, size )   { name, TYPE_S_ARRAY,  size },
+#define PERFCOUNTER( var, name )              { (name), TYPE_SINGLE, 0 },
+#define PERFCOUNTER_ARRAY( var, name, size )  { (name), TYPE_ARRAY,  (size) },
+#define PERFSTATUS( var, name )               { (name), TYPE_S_SINGLE, 0 },
+#define PERFSTATUS_ARRAY( var, name, size )   { (name), TYPE_S_ARRAY,  (size) },
 static const struct {
     const char *name;
     enum { TYPE_SINGLE, TYPE_ARRAY,
-- 
2.34.1


