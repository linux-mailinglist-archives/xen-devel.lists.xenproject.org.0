Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A875C3E8053
	for <lists+xen-devel@lfdr.de>; Tue, 10 Aug 2021 19:48:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165456.302355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDVrF-0002qo-4a; Tue, 10 Aug 2021 17:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165456.302355; Tue, 10 Aug 2021 17:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDVrF-0002oD-0q; Tue, 10 Aug 2021 17:48:09 +0000
Received: by outflank-mailman (input) for mailman id 165456;
 Tue, 10 Aug 2021 17:48:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3edG=NB=citrix.com=Kevin.Stefanov@srs-us1.protection.inumbo.net>)
 id 1mDVrD-0002nf-Lt
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 17:48:07 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1dee9bf4-fa03-11eb-9fe8-12813bfff9fa;
 Tue, 10 Aug 2021 17:48:06 +0000 (UTC)
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
X-Inumbo-ID: 1dee9bf4-fa03-11eb-9fe8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628617686;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Asef4CShufBTIlaP0RTU0oOP4w0Yf/it6Q71w/xhv/Q=;
  b=a7j1QcvR8SlrrmFVjSVLQ9BA9xEhO41e0B2oVVIRpVQZ2aQeYQ3kUl5a
   E+9OKqjt1vJAPO3yOH+u7H0TKQJ/HJHh8cCu83Z2DwYwzIhTmbnNzg6RQ
   B3Cw8LdO6yTViKpIdKG+j4/TJCI1v9XwTpcj9xtLp2VZWfwZwkpGFPdmx
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: vbKjvOztIZYo3BhL1sTVMoT2jCjrNTlicI1KycVgdZp3WVJxuACQA6jI7l/Vsfrn0FEUjypKSt
 LSf1CCqTixdXG0UftzKVL/Obg3+ThOi1TvRGR5euAjvtpxM+3Cx/gcejfA/DXCMiXXc7lOSHEe
 qLPamh1NtJy1GQ7txE1pQd92Qyhv6HvCelDZuXxNoudasyxXjS0fFEdFHid7r2shu2+3kIh8wr
 q1cZrkaBH5z8MnpBYrDySt7qCAcKxOGHsy9xEjWEEeobkxA24C3f9g97/9MDOtL1YiVD587+0i
 WzvnmyYXA8up6Wu0T07fuynN
X-SBRS: 5.1
X-MesageID: 50128459
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:YRZEEatbhrbO8Odkcc5PIm7x7skC3IMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H5BEDyewKmyXcV2/hdAV7GZmXbUQSTXeVfBOfZogEIXheOj9K1tp
 0QP5SWaueAamSS5PySiGbXLz9j+qjgzEnCv5a8854Zd3AOV0gW1XYaNu/0KC1LbTgDIaB8OI
 uX58JBqTblU28QdN6HCn4MWPWGj8HXlbr9CCR2SSIP2U2rt3eF+bT6Gx+X0lM1SDVU24ov9m
 DDjkjQ+rijifem0RXRvlWjrqi+2eGRiuerNvb8yPT9GQ+czzpAo74RH4FqiQpF491HLmxa1+
 Uk7S1QefiboEmhBF1d6SGdpjUIlgxepEMKgGXo/UfLsIj3Qik3BNFGgp8cehzF61A4tNU5y6
 5T2XmF3qAnRC8osR6NkOQgbSsa4HZcYEBS4dI7njhaS88TebVRpYsQ8AdcF4oBBjvz7MQiHP
 N1BM/R6f5KeRfCBkqp9VVH0ZipRDA+Dx2GSk8Ntoic1CVXhmlwyw8dyNYElnkN+ZohQ91P5v
 jCMK5viLZSJ/VmJZ5VFaMEW4+6G2bNSRXDPCabJknmDrgOPzbXp5v+8NwOlZWXkVwzve4Pcb
 H6IRllXEIJCjzT4Py1re92G0r2MRqAtBzWu7Bjzok8vKHgT7z2NiDGQEwykqKb0oYiPvE=
X-IronPort-AV: E=Sophos;i="5.84,310,1620705600"; 
   d="scan'208";a="50128459"
From: Kevin Stefanov <kevin.stefanov@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Kevin Stefanov <kevin.stefanov@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: [PATCH 1/2] xen/kexec: Remove use of TRUE/FALSE
Date: Tue, 10 Aug 2021 18:47:36 +0100
Message-ID: <20210810174737.56297-2-kevin.stefanov@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210810174737.56297-1-kevin.stefanov@citrix.com>
References: <20210810174737.56297-1-kevin.stefanov@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Whilst fixing this, also changed bool_t to bool.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
---
 xen/common/kexec.c      | 6 +++---
 xen/include/xen/kexec.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index ebeee6405a..938cbb8005 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -35,7 +35,7 @@
 #include <compat/kexec.h>
 #endif
 
-bool_t kexecing = FALSE;
+bool kexecing;
 
 /* Memory regions to store the per cpu register state etc. on a crash. */
 typedef struct { Elf_Note * start; size_t size; } crash_note_range_t;
@@ -383,7 +383,7 @@ void kexec_crash(enum crash_reason reason)
     if ( !test_bit(KEXEC_IMAGE_CRASH_BASE + pos, &kexec_flags) )
         return;
 
-    kexecing = TRUE;
+    kexecing = true;
 
     if ( kexec_common_shutdown() != 0 )
         return;
@@ -399,7 +399,7 @@ static long kexec_reboot(void *_image)
 {
     struct kexec_image *image = _image;
 
-    kexecing = TRUE;
+    kexecing = true;
 
     kexec_common_shutdown();
     machine_reboot_kexec(image);
diff --git a/xen/include/xen/kexec.h b/xen/include/xen/kexec.h
index 9f7a912e97..02dc889334 100644
--- a/xen/include/xen/kexec.h
+++ b/xen/include/xen/kexec.h
@@ -17,7 +17,7 @@ typedef struct xen_kexec_reserve {
 extern xen_kexec_reserve_t kexec_crash_area;
 extern paddr_t kexec_crash_area_limit;
 
-extern bool_t kexecing;
+extern bool kexecing;
 
 void set_kexec_crash_area_size(u64 system_ram);
 
-- 
2.25.1


