Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DCE27D5A0
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 20:18:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341.1017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNKC6-00014C-KU; Tue, 29 Sep 2020 18:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341.1017; Tue, 29 Sep 2020 18:17:42 +0000
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
	id 1kNKC6-00013f-GD; Tue, 29 Sep 2020 18:17:42 +0000
Received: by outflank-mailman (input) for mailman id 341;
 Tue, 29 Sep 2020 18:17:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/JXF=DG=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kNKC5-000131-8Y
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 18:17:41 +0000
Received: from mx1a.swcp.com (unknown [216.184.2.64])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7ace055-43ed-4dd9-8aed-47484aca99f0;
 Tue, 29 Sep 2020 18:17:39 +0000 (UTC)
Received: from ame7.swcp.com (ame7.swcp.com [216.184.2.70])
 by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 08TIHchD004940;
 Tue, 29 Sep 2020 12:17:38 -0600
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
 by ame7.swcp.com (8.15.2/8.15.2) with ESMTP id 08TIHJkr051120;
 Tue, 29 Sep 2020 12:17:35 -0600 (MDT) (envelope-from hudson@trmm.net)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/JXF=DG=trmm.net=hudson@srs-us1.protection.inumbo.net>)
	id 1kNKC5-000131-8Y
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 18:17:41 +0000
X-Inumbo-ID: c7ace055-43ed-4dd9-8aed-47484aca99f0
Received: from mx1a.swcp.com (unknown [216.184.2.64])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c7ace055-43ed-4dd9-8aed-47484aca99f0;
	Tue, 29 Sep 2020 18:17:39 +0000 (UTC)
Received: from ame7.swcp.com (ame7.swcp.com [216.184.2.70])
	by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 08TIHchD004940;
	Tue, 29 Sep 2020 12:17:38 -0600
Received-SPF: neutral (ame7.swcp.com: 62.251.112.184 is neither permitted nor denied by domain of hudson@trmm.net) receiver=ame7.swcp.com; client-ip=62.251.112.184; helo=diamond.fritz.box; envelope-from=hudson@trmm.net; x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with libspf2-1.2.10;
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
	by ame7.swcp.com (8.15.2/8.15.2) with ESMTP id 08TIHJkr051120;
	Tue, 29 Sep 2020 12:17:35 -0600 (MDT)
	(envelope-from hudson@trmm.net)
X-Authentication-Warning: ame7.swcp.com: Host 62-251-112-184.ip.xs4all.nl [62.251.112.184] claimed to be diamond.fritz.box
From: Trammell Hudson <hudson@trmm.net>
To: xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
        wl@xen.org
Subject: [PATCH v7 3/5] efi/boot.c: wrap PrintStr/PrintErr to allow const CHAR16* arguments
Date: Tue, 29 Sep 2020 14:17:15 -0400
Message-Id: <20200929181717.1596965-4-hudson@trmm.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200929181717.1596965-1-hudson@trmm.net>
References: <20200929181717.1596965-1-hudson@trmm.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.83
X-Greylist: Message whitelisted by DRAC access database, not delayed by milter-greylist-4.6.2 (ame7.swcp.com [216.184.2.128]); Tue, 29 Sep 2020 12:17:37 -0600 (MDT)
X-Virus-Scanned: clamav-milter 0.100.2 at ame7
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ame7.swcp.com
X-Spam-Status: No, hits=0.7 tests=NO_RECEIVED,NO_RELAYS,SPF_NEUTRAL
	version=3.4.2
X-Spam-Level: 

This patch wraps the EFI OutputString() method so that they can be
called with const arguments.  The OutputString method does not modify
its argument, although the prototype is missing const, so it is necssary
to cast away the const when calling it.

Signed-off-by: Trammell Hudson <hudson@trmm.net>
---
 xen/common/efi/boot.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 93cfeba7e1..fc2ea80e43 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -151,10 +151,16 @@ static struct file __initdata cfg;
 static struct file __initdata kernel;
 static struct file __initdata ramdisk;
 static struct file __initdata xsm;
-static CHAR16 __initdata newline[] = L"\r\n";
+static const CHAR16 __initconst newline[] = L"\r\n";
 
-#define PrintStr(s) StdOut->OutputString(StdOut, s)
-#define PrintErr(s) StdErr->OutputString(StdErr, s)
+static void __init PrintStr(const CHAR16 *s)
+{
+    StdOut->OutputString(StdOut, (CHAR16 *)s );
+}
+static void __init PrintErr(const CHAR16 *s)
+{
+    StdErr->OutputString(StdErr, (CHAR16 *)s );
+}
 
 /*
  * Include architecture specific implementation here, which references the
@@ -275,7 +281,7 @@ static bool __init match_guid(const EFI_GUID *guid1, const EFI_GUID *guid2)
 void __init noreturn blexit(const CHAR16 *str)
 {
     if ( str )
-        PrintStr((CHAR16 *)str);
+        PrintStr(str);
     PrintStr(newline);
 
     if ( !efi_bs )
@@ -540,7 +546,7 @@ static char * __init split_string(char *s)
     return NULL;
 }
 
-static void __init handle_file_info(CHAR16 *name,
+static void __init handle_file_info(const CHAR16 *name,
                                     const struct file *file, const char *options)
 {
     if ( file == &cfg )
@@ -562,7 +568,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
     EFI_FILE_HANDLE FileHandle = NULL;
     UINT64 size;
     EFI_STATUS ret;
-    CHAR16 *what = NULL;
+    const CHAR16 *what = NULL;
 
     if ( !name )
         PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
-- 
2.25.1


