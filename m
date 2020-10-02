Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BA928111D
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 13:18:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1957.5828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOJ5K-000291-KI; Fri, 02 Oct 2020 11:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1957.5828; Fri, 02 Oct 2020 11:18:46 +0000
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
	id 1kOJ5K-00028G-FY; Fri, 02 Oct 2020 11:18:46 +0000
Received: by outflank-mailman (input) for mailman id 1957;
 Fri, 02 Oct 2020 11:18:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U/dH=DJ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kOJ5J-00023m-11
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 11:18:45 +0000
Received: from mx1a.swcp.com (unknown [216.184.2.64])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 825efd7e-2a1d-408d-bf97-5299f161be0c;
 Fri, 02 Oct 2020 11:18:41 +0000 (UTC)
Received: from ame7.swcp.com (ame7.swcp.com [216.184.2.70])
 by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 092BIdD6016914;
 Fri, 2 Oct 2020 05:18:39 -0600
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
 by ame7.swcp.com (8.15.2/8.15.2) with ESMTP id 092BIOXp008607;
 Fri, 2 Oct 2020 05:18:36 -0600 (MDT) (envelope-from hudson@trmm.net)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=U/dH=DJ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
	id 1kOJ5J-00023m-11
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 11:18:45 +0000
X-Inumbo-ID: 825efd7e-2a1d-408d-bf97-5299f161be0c
Received: from mx1a.swcp.com (unknown [216.184.2.64])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 825efd7e-2a1d-408d-bf97-5299f161be0c;
	Fri, 02 Oct 2020 11:18:41 +0000 (UTC)
Received: from ame7.swcp.com (ame7.swcp.com [216.184.2.70])
	by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 092BIdD6016914;
	Fri, 2 Oct 2020 05:18:39 -0600
Received-SPF: neutral (ame7.swcp.com: 62.251.112.184 is neither permitted nor denied by domain of hudson@trmm.net) receiver=ame7.swcp.com; client-ip=62.251.112.184; helo=diamond.fritz.box; envelope-from=hudson@trmm.net; x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with libspf2-1.2.10;
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
	by ame7.swcp.com (8.15.2/8.15.2) with ESMTP id 092BIOXp008607;
	Fri, 2 Oct 2020 05:18:36 -0600 (MDT)
	(envelope-from hudson@trmm.net)
X-Authentication-Warning: ame7.swcp.com: Host 62-251-112-184.ip.xs4all.nl [62.251.112.184] claimed to be diamond.fritz.box
From: Trammell Hudson <hudson@trmm.net>
To: xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
        wl@xen.org
Subject: [PATCH v9 2/4] efi/boot.c: add handle_file_info()
Date: Fri,  2 Oct 2020 07:18:20 -0400
Message-Id: <20201002111822.42142-3-hudson@trmm.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201002111822.42142-1-hudson@trmm.net>
References: <20201002111822.42142-1-hudson@trmm.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.83
X-Greylist: Message whitelisted by DRAC access database, not delayed by milter-greylist-4.6.2 (ame7.swcp.com [216.184.2.128]); Fri, 02 Oct 2020 05:18:38 -0600 (MDT)
X-Virus-Scanned: clamav-milter 0.100.2 at ame7
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ame7.swcp.com
X-Spam-Status: No, hits=0.7 tests=NO_RECEIVED,NO_RELAYS,SPF_NEUTRAL
	version=3.4.2
X-Spam-Level: 

Add a separate function to display the address ranges used by
the files and call `efi_arch_handle_module()` on the modules.

Signed-off-by: Trammell Hudson <hudson@trmm.net>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/common/efi/boot.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 9d6dc8ff4f..bd629eb658 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -547,6 +547,22 @@ static char * __init split_string(char *s)
     return NULL;
 }
 
+static void __init handle_file_info(const CHAR16 *name,
+                                    const struct file *file, const char *options)
+{
+    if ( file == &cfg )
+        return;
+
+    PrintStr(name);
+    PrintStr(L": ");
+    DisplayUint(file->addr, 2 * sizeof(file->addr));
+    PrintStr(L"-");
+    DisplayUint(file->addr + file->size, 2 * sizeof(file->addr));
+    PrintStr(newline);
+
+    efi_arch_handle_module(file, name, options);
+}
+
 static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
                              struct file *file, const char *options)
 {
@@ -591,16 +607,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
     {
         file->need_to_free = true;
         file->size = size;
-        if ( file != &cfg )
-        {
-            PrintStr(name);
-            PrintStr(L": ");
-            DisplayUint(file->addr, 2 * sizeof(file->addr));
-            PrintStr(L"-");
-            DisplayUint(file->addr + size, 2 * sizeof(file->addr));
-            PrintStr(newline);
-            efi_arch_handle_module(file, name, options);
-        }
+        handle_file_info(name, file, options);
 
         ret = FileHandle->Read(FileHandle, &file->size, file->str);
         if ( !EFI_ERROR(ret) && file->size != size )
-- 
2.25.1


