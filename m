Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5828177270B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 16:07:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578494.906019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0sq-00088m-Gf; Mon, 07 Aug 2023 14:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578494.906019; Mon, 07 Aug 2023 14:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0sq-00086S-Db; Mon, 07 Aug 2023 14:06:56 +0000
Received: by outflank-mailman (input) for mailman id 578494;
 Mon, 07 Aug 2023 14:06:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pf19=DY=citrix.com=prvs=57614ddda=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qT0sp-00086M-FY
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 14:06:55 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8a77e74-352b-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 16:06:54 +0200 (CEST)
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
X-Inumbo-ID: a8a77e74-352b-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691417214;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Lcj39dcakHvuWWa2TgBrCqBP6PmhlerS0mSmRoIchL4=;
  b=MpOnl7r41C/OkgaNnox+8SfHvbb7hhz5oxxY2Zmk+m1vEHm9Ca9buZIY
   HjZyBx2yk2zDXPz0oMRUFq2qT70VpYIGHX/0a5V2FyIJiq809gZ8Ci57H
   P4iNQlpifszf0xvUc256clBXuszvuUjjlM83nlpKYr3WdpM+X7yxscH53
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 121376940
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:4PFKZq29JY4ErNrM8/bD5fVxkn2cJEfYwER7XKvMYLTBsI5bp2NRx
 2MZWzvSPf/cZGqnf9siaNzk90wGsJbcytNrTQtrpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gxmOqgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfKGcJ/
 KBGBmk2SxWJuuzt6byDTNNziZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiHJ8MxRnG9
 z6el4j/KggUHu649mHCzk/22sbfrBv5QrMdKpTto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYeUddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQC1
 FCTmMjyLSdyq7DTQnWYnop4thvrZ3JTdzVbI3ZZE01cuYKLTJwPYgznZ9AkGfLroITOPDT6/
 j7RhSYGgY8Mgptev0mkxmzvjzWpr5nPawc64ATLQ26ohj9EiJ6Zi5+AsgaCs6sZRGqNZhzY5
 SVfxZDChAwbJcvV/BFhVtnhC11ACxytFDTHyWBiEJA6n9hG0y7yJNsAiN2SyaoADyrlRdMLS
 BWI0e+yzMUJVJdPUUOQS9zZNijS5fK8fekJr9iNBja0XrB/dRWc4AZlblOK0mbmnSAEyP9uY
 MzHL5bwUytDU8yLKQZaoM9Hi9cWKt0WnzuPFfgXMTz4uVZhWJJlYehcawbfBgzIxKiFvB/U4
 75i2ziikn1ivBnFSnCPq+Y7dAlaRUXX8Liq86S7gMbfeFs5cIzgYteNqY4cl3tNw/gIzruVr
 iHiMqKaoXKm7UD6xcyxQigLQNvSsVxX9xrX4QRE0Y6U5kUe
IronPort-HdrOrdr: A9a23:iMl2s6rLPp6dR6Ujn1YNWxQaV5oNeYIsimQD101hICG9JPbo7f
 xGuM5rrCMc7wxhPk3I+OrwX5VoJEm3yXcb2/hzAV7PZmnbUQiTXeVfBOnZsl/d8nbFh5ZgPM
 5bGsAUNDSaNykesS+V2miFOudl6MWb9rulnOLPpk0dNj2CqJsN0+66MGum+4FNKzWuzKBWKK
 ah
X-Talos-CUID: =?us-ascii?q?9a23=3AiYhwNGmsIorK3s8NsPLF1HrRgZ7XOVTbi36MfWH?=
 =?us-ascii?q?hMkNsQoCbEnaewKVejMU7zg=3D=3D?=
X-Talos-MUID: 9a23:T1e3qgba97pjq+BTrjHGthZdb4BU3v7yIVA8qZccisa6HHkl
X-IronPort-AV: E=Sophos;i="6.01,262,1684814400"; 
   d="scan'208";a="121376940"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH] libxl: Use XEN_LIB_DIR to store bootloader from pygrub
Date: Mon, 7 Aug 2023 15:06:19 +0100
Message-ID: <20230807140620.47221-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In osstest, the jobs using pygrub on arm64 on the branch linux-linus
started to fails with:
    [Errno 28] No space left on device
    Error writing temporary copy of ramdisk

This is because /var/run is small when dom0 has only 512MB to work
with, /var/run is only 40MB. The size of both kernel and ramdisk on
this jobs is now about 42MB, so not enough space in /var/run.

So, to avoid writing a big binairy in ramfs, we will use /var/lib
instead, like we already do when saving the device model state on
migration.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_bootloader.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_bootloader.c b/tools/libs/light/libxl_bootloader.c
index 1bc6e51827..108329b4a5 100644
--- a/tools/libs/light/libxl_bootloader.c
+++ b/tools/libs/light/libxl_bootloader.c
@@ -245,8 +245,8 @@ static void bootloader_cleanup(libxl__egc *egc, libxl__bootloader_state *bl)
 static void bootloader_setpaths(libxl__gc *gc, libxl__bootloader_state *bl)
 {
     uint32_t domid = bl->domid;
-    bl->outputdir = GCSPRINTF(XEN_RUN_DIR "/bootloader.%"PRIu32".d", domid);
-    bl->outputpath = GCSPRINTF(XEN_RUN_DIR "/bootloader.%"PRIu32".out", domid);
+    bl->outputdir = GCSPRINTF(XEN_LIB_DIR "/bootloader.%"PRIu32".d", domid);
+    bl->outputpath = GCSPRINTF(XEN_LIB_DIR "/bootloader.%"PRIu32".out", domid);
 }
 
 /* Callbacks */
-- 
Anthony PERARD


