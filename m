Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 804C375F9F4
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 16:34:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569000.889285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNwdi-0002sj-DQ; Mon, 24 Jul 2023 14:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569000.889285; Mon, 24 Jul 2023 14:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNwdi-0002qV-A5; Mon, 24 Jul 2023 14:34:22 +0000
Received: by outflank-mailman (input) for mailman id 569000;
 Mon, 24 Jul 2023 14:34:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AOzI=DK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qNwdh-0002qP-N7
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 14:34:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cf2311f-2a2f-11ee-b23b-6b7b168915f2;
 Mon, 24 Jul 2023 16:34:20 +0200 (CEST)
Received: from nico.bugseng.com (unknown [37.162.132.135])
 by support.bugseng.com (Postfix) with ESMTPSA id E11814EE073E;
 Mon, 24 Jul 2023 16:34:18 +0200 (CEST)
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
X-Inumbo-ID: 2cf2311f-2a2f-11ee-b23b-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v2] efi: mechanical renaming to address MISRA C:2012 Rule 5.3
Date: Mon, 24 Jul 2023 16:26:07 +0200
Message-Id: <60e2908f5a6c8aec082b59b44a688c260805c7b2.1690208527.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 5.3 has the following headline:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope"

The function parameters renamed in this patch are hiding a variable defined
in an enclosing scope.

The following rename is made:
- s/cfg/file/
to distinguish from the variable 'cfg', which is hidden by the parameter inside
the modified functions.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/common/efi/boot.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 24169b7b50..79a654af69 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -528,10 +528,10 @@ static char * __init split_string(char *s)
     return NULL;
 }
 
-static char *__init get_value(const struct file *cfg, const char *section,
+static char *__init get_value(const struct file *file, const char *section,
                               const char *item)
 {
-    char *ptr = cfg->str, *end = ptr + cfg->size;
+    char *ptr = file->str, *end = ptr + file->size;
     size_t slen = section ? strlen(section) : 0, ilen = strlen(item);
     bool match = !slen;
 
@@ -821,9 +821,9 @@ static bool __init read_section(const EFI_LOADED_IMAGE *image,
     return true;
 }
 
-static void __init pre_parse(const struct file *cfg)
+static void __init pre_parse(const struct file *file)
 {
-    char *ptr = cfg->str, *end = ptr + cfg->size;
+    char *ptr = file->str, *end = ptr + file->size;
     bool start = true, comment = false;
 
     for ( ; ptr < end; ++ptr )
@@ -844,7 +844,7 @@ static void __init pre_parse(const struct file *cfg)
         else
             start = 0;
     }
-    if ( cfg->size && end[-1] )
+    if ( file->size && end[-1] )
          PrintStr(L"No newline at end of config file,"
                    " last line will be ignored.\r\n");
 }
-- 
2.34.1


