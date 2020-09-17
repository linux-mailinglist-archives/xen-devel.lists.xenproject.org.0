Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DAA26DFDC
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 17:41:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIw2C-0003UI-Gs; Thu, 17 Sep 2020 15:41:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t+a8=C2=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kIw2B-0003Ts-GZ
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 15:41:19 +0000
X-Inumbo-ID: 982583e6-9090-45cd-a74f-9fe08c7fd87e
Received: from mx1a.swcp.com (unknown [216.184.2.64])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 982583e6-9090-45cd-a74f-9fe08c7fd87e;
 Thu, 17 Sep 2020 15:41:14 +0000 (UTC)
Received: from ame7.swcp.com (ame7.swcp.com [216.184.2.70])
 by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 08HFfDlw024942
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2020 09:41:13 -0600
Received-SPF: neutral (ame7.swcp.com: 62.251.112.184 is neither permitted nor
 denied by domain of hudson@trmm.net) receiver=ame7.swcp.com;
 client-ip=62.251.112.184; helo=diamond.fritz.box;
 envelope-from=hudson@trmm.net;
 x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with
 libspf2-1.2.10; 
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
 by ame7.swcp.com (8.15.2/8.15.2) with ESMTP id 08HFesRM024558
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2020 09:41:10 -0600 (MDT)
 (envelope-from hudson@trmm.net)
X-Authentication-Warning: ame7.swcp.com: Host 62-251-112-184.ip.xs4all.nl
 [62.251.112.184] claimed to be diamond.fritz.box
From: Trammell Hudson <hudson@trmm.net>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 1/5] efi/boot.c: Make file->ptr const void*
Date: Thu, 17 Sep 2020 11:40:44 -0400
Message-Id: <20200917154048.1140580-2-hudson@trmm.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200917154048.1140580-1-hudson@trmm.net>
References: <20200917154048.1140580-1-hudson@trmm.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.83
X-Greylist: Message whitelisted by DRAC access database, not delayed by
 milter-greylist-4.6.2 (ame7.swcp.com [216.184.2.128]);
 Thu, 17 Sep 2020 09:41:11 -0600 (MDT)
X-Virus-Scanned: clamav-milter 0.100.2 at ame7
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ame7.swcp.com
X-Spam-Status: No, hits=0.7 tests=NO_RECEIVED,NO_RELAYS,SPF_NEUTRAL
 version=3.4.2
X-Spam-Level: 
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Other than the config file parser that edits the image inplace,
no other users of the file sections requires write access to the
data.

Signed-off-by: Trammell Hudson <hudson@trmm.net>
---
 xen/common/efi/boot.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 0ac80e47bb..157fe0e8c5 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -41,7 +41,7 @@
 
 typedef EFI_STATUS
 (/* _not_ EFIAPI */ *EFI_SHIM_LOCK_VERIFY) (
-    IN VOID *Buffer,
+    IN const VOID *Buffer,
     IN UINT32 Size);
 
 typedef struct {
@@ -104,7 +104,8 @@ struct file {
     UINTN size;
     union {
         EFI_PHYSICAL_ADDRESS addr;
-        void *ptr;
+        char *str;
+        const void *ptr;
     };
 };
 
@@ -592,7 +593,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
             efi_arch_handle_module(file, name, options);
         }
 
-        ret = FileHandle->Read(FileHandle, &file->size, file->ptr);
+        ret = FileHandle->Read(FileHandle, &file->size, file->str);
         if ( !EFI_ERROR(ret) && file->size != size )
             ret = EFI_ABORTED;
         if ( EFI_ERROR(ret) )
@@ -616,7 +617,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
 
 static void __init pre_parse(const struct file *cfg)
 {
-    char *ptr = cfg->ptr, *end = ptr + cfg->size;
+    char *ptr = cfg->str, *end = ptr + cfg->size;
     bool start = true, comment = false;
 
     for ( ; ptr < end; ++ptr )
@@ -645,7 +646,7 @@ static void __init pre_parse(const struct file *cfg)
 static char *__init get_value(const struct file *cfg, const char *section,
                               const char *item)
 {
-    char *ptr = cfg->ptr, *end = ptr + cfg->size;
+    char *ptr = cfg->str, *end = ptr + cfg->size;
     size_t slen = section ? strlen(section) : 0, ilen = strlen(item);
     bool match = !slen;
 
-- 
2.25.1


