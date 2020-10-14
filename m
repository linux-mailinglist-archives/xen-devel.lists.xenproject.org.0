Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C3B28E422
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 18:15:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6854.18003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSjQP-0004CW-VM; Wed, 14 Oct 2020 16:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6854.18003; Wed, 14 Oct 2020 16:14:49 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSjQP-0004CA-S1; Wed, 14 Oct 2020 16:14:49 +0000
Received: by outflank-mailman (input) for mailman id 6854;
 Wed, 14 Oct 2020 16:14:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JG+m=DV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kSjQO-0004C5-MX
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 16:14:48 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f5ef3c6f-8320-4c70-94c2-87b521c2e66e;
 Wed, 14 Oct 2020 16:14:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83DB8D6E;
 Wed, 14 Oct 2020 09:14:47 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.198.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC7313F71F;
 Wed, 14 Oct 2020 09:14:46 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JG+m=DV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kSjQO-0004C5-MX
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 16:14:48 +0000
X-Inumbo-ID: f5ef3c6f-8320-4c70-94c2-87b521c2e66e
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id f5ef3c6f-8320-4c70-94c2-87b521c2e66e;
	Wed, 14 Oct 2020 16:14:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83DB8D6E;
	Wed, 14 Oct 2020 09:14:47 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.198.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC7313F71F;
	Wed, 14 Oct 2020 09:14:46 -0700 (PDT)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] tools/xenmpd: Fix gcc10 snprintf warning
Date: Wed, 14 Oct 2020 17:14:29 +0100
Message-Id: <005bd16161fe803e9c2805bddc440db31c46169b.1602692002.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1

Add a check for snprintf return code and ignore the entry if we get an
error. This should in fact never happen and is more a trick to make gcc
happy and prevent compilation errors.

This is solving the following gcc warning when compiling for arm32 host
platforms with optimization activated:
xenpmd.c:92:37: error: '%s' directive output may be truncated writing
between 4 and 2147483645 bytes into a region of size 271
[-Werror=format-truncation=]

This is also solving the following Debian bug:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=970802

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 tools/xenpmd/xenpmd.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c
index 35fd1c931a..12b82cf43e 100644
--- a/tools/xenpmd/xenpmd.c
+++ b/tools/xenpmd/xenpmd.c
@@ -102,6 +102,7 @@ FILE *get_next_battery_file(DIR *battery_dir,
     FILE *file = 0;
     struct dirent *dir_entries;
     char file_name[284];
+    int ret;
     
     do 
     {
@@ -111,11 +112,15 @@ FILE *get_next_battery_file(DIR *battery_dir,
         if ( strlen(dir_entries->d_name) < 4 )
             continue;
         if ( battery_info_type == BIF ) 
-            snprintf(file_name, sizeof(file_name), BATTERY_INFO_FILE_PATH,
+            ret = snprintf(file_name, sizeof(file_name), BATTERY_INFO_FILE_PATH,
                      dir_entries->d_name);
         else 
-            snprintf(file_name, sizeof(file_name), BATTERY_STATE_FILE_PATH,
+            ret = snprintf(file_name, sizeof(file_name), BATTERY_STATE_FILE_PATH,
                      dir_entries->d_name);
+        /* This should not happen but is needed to pass gcc checks */
+        if (ret < 0)
+            continue;
+        file_name[sizeof(file_name) - 1] = '\0';
         file = fopen(file_name, "r");
     } while ( !file );
 
-- 
2.17.1


