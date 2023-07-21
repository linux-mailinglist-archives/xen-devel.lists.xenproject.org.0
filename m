Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9374975CBAD
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 17:27:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567612.886890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMs1a-0003Fh-Qt; Fri, 21 Jul 2023 15:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567612.886890; Fri, 21 Jul 2023 15:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMs1a-0003Dx-O8; Fri, 21 Jul 2023 15:26:34 +0000
Received: by outflank-mailman (input) for mailman id 567612;
 Fri, 21 Jul 2023 15:26:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIrH=DH=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qMs1Z-0003Dp-TQ
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 15:26:33 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8619b04-27da-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 17:26:32 +0200 (CEST)
Received: from nico.bugseng.com (unknown [37.162.18.33])
 by support.bugseng.com (Postfix) with ESMTPSA id 7711E4EE0C89;
 Fri, 21 Jul 2023 17:26:30 +0200 (CEST)
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
X-Inumbo-ID: f8619b04-27da-11ee-b23a-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH] efi: mechanical renaming to address MISRA C:2012 Rule 5.3
Date: Fri, 21 Jul 2023 17:26:11 +0200
Message-Id: <4da442b03ba783b4db0e56614bed43ce882a32ae.1689953085.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 5.3 has the following headline:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope"

The function parameters renamed in this patch are hiding a variable defined
in an enclosing scope or a function identifier.

The following rename is made:
- s/cfg/config/
to distinguish from the variable 'cfg', which is hidden by the parameter inside
the modified functions.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/common/efi/boot.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 24169b7b50..233639f3bc 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -528,10 +528,10 @@ static char * __init split_string(char *s)
     return NULL;
 }
 
-static char *__init get_value(const struct file *cfg, const char *section,
+static char *__init get_value(const struct file *config, const char *section,
                               const char *item)
 {
-    char *ptr = cfg->str, *end = ptr + cfg->size;
+    char *ptr = config->str, *end = ptr + config->size;
     size_t slen = section ? strlen(section) : 0, ilen = strlen(item);
     bool match = !slen;
 
@@ -821,9 +821,9 @@ static bool __init read_section(const EFI_LOADED_IMAGE *image,
     return true;
 }
 
-static void __init pre_parse(const struct file *cfg)
+static void __init pre_parse(const struct file *config)
 {
-    char *ptr = cfg->str, *end = ptr + cfg->size;
+    char *ptr = config->str, *end = ptr + config->size;
     bool start = true, comment = false;
 
     for ( ; ptr < end; ++ptr )
@@ -844,7 +844,7 @@ static void __init pre_parse(const struct file *cfg)
         else
             start = 0;
     }
-    if ( cfg->size && end[-1] )
+    if ( config->size && end[-1] )
          PrintStr(L"No newline at end of config file,"
                    " last line will be ignored.\r\n");
 }
-- 
2.34.1


