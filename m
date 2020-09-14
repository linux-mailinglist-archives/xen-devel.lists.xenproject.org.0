Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE57268A57
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 13:51:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHn0E-0005dT-OM; Mon, 14 Sep 2020 11:50:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lZiK=CX=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kHn0D-0005d7-3T
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 11:50:33 +0000
X-Inumbo-ID: bd3c7e2a-3c03-4373-b8ff-56af66f527d4
Received: from mx1a.swcp.com (unknown [216.184.2.64])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd3c7e2a-3c03-4373-b8ff-56af66f527d4;
 Mon, 14 Sep 2020 11:50:29 +0000 (UTC)
Received: from ame7.swcp.com (ame7.swcp.com [216.184.2.70])
 by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 08EBoR8a013961;
 Mon, 14 Sep 2020 05:50:27 -0600
Received-SPF: neutral (ame7.swcp.com: 62.251.112.184 is neither permitted nor
 denied by domain of hudson@trmm.net) receiver=ame7.swcp.com;
 client-ip=62.251.112.184; helo=diamond.fritz.box;
 envelope-from=hudson@trmm.net;
 x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with
 libspf2-1.2.10; 
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
 by ame7.swcp.com (8.15.2/8.15.2) with ESMTP id 08EBoFiI022702;
 Mon, 14 Sep 2020 05:50:24 -0600 (MDT) (envelope-from hudson@trmm.net)
X-Authentication-Warning: ame7.swcp.com: Host 62-251-112-184.ip.xs4all.nl
 [62.251.112.184] claimed to be diamond.fritz.box
From: Trammell Hudson <hudson@trmm.net>
To: xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 wl@xen.org
Subject: [PATCH v4 1/4] efi/boot.c: add file.need_to_free
Date: Mon, 14 Sep 2020 07:50:10 -0400
Message-Id: <20200914115013.814079-2-hudson@trmm.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200914115013.814079-1-hudson@trmm.net>
References: <20200914115013.814079-1-hudson@trmm.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.83
X-Greylist: Message whitelisted by DRAC access database, not delayed by
 milter-greylist-4.6.2 (ame7.swcp.com [216.184.2.128]);
 Mon, 14 Sep 2020 05:50:26 -0600 (MDT)
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

The config file, kernel, initrd, etc should only be freed if they
are allocated with the UEFI allocator.

Signed-off-by: Trammell Hudson <hudson@trmm.net>
---
 xen/common/efi/boot.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 4022a672c9..7156139174 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -102,6 +102,7 @@ union string {
 
 struct file {
     UINTN size;
+    bool need_to_free;
     union {
         EFI_PHYSICAL_ADDRESS addr;
         void *ptr;
@@ -279,13 +280,13 @@ void __init noreturn blexit(const CHAR16 *str)
     if ( !efi_bs )
         efi_arch_halt();
 
-    if ( cfg.addr )
+    if ( cfg.addr && cfg.need_to_free )
         efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
-    if ( kernel.addr )
+    if ( kernel.addr && kernel.need_to_free )
         efi_bs->FreePages(kernel.addr, PFN_UP(kernel.size));
-    if ( ramdisk.addr )
+    if ( ramdisk.addr && ramdisk.need_to_free )
         efi_bs->FreePages(ramdisk.addr, PFN_UP(ramdisk.size));
-    if ( xsm.addr )
+    if ( xsm.addr && xsm.need_to_free )
         efi_bs->FreePages(xsm.addr, PFN_UP(xsm.size));
 
     efi_arch_blexit();
@@ -572,6 +573,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
                          HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
         ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
                                     PFN_UP(size), &file->addr);
+        file->need_to_free = true;
     }
     if ( EFI_ERROR(ret) )
     {
-- 
2.25.1


