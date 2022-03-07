Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 389634D0925
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 22:03:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286419.485929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRKVJ-0000dV-Ek; Mon, 07 Mar 2022 21:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286419.485929; Mon, 07 Mar 2022 21:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRKVJ-0000bP-Be; Mon, 07 Mar 2022 21:02:53 +0000
Received: by outflank-mailman (input) for mailman id 286419;
 Mon, 07 Mar 2022 21:02:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NfF=TS=citrix.com=prvs=058fb9784=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nRKVH-0000bJ-V8
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 21:02:51 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f190700a-9e59-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 22:02:50 +0100 (CET)
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
X-Inumbo-ID: f190700a-9e59-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646686970;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pNlGbt4V5HJ0PnyQXkAlvafTRuvpg8Xp8j8Gs8biWjk=;
  b=D/yym/7lOVtRXKoJ5asTE8k7lT/VSi87GsTmzNrT6ZRZrnu0DnRV6vIj
   EdRHFVNuIs9+/7TWnAAYLhN/0gyGswgnL/pbz79wiJxvBybGSkUtKaXVv
   SF+5R4/hYeaTJkOsA6kY/OXnVHX7bfqRBZjMAWvhvtkTM4I4sHm3gjtZM
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 67998639
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4YUFdqOO208u6NTvrR2il8FynXyQoLVcMsEvi/4bfWQNrUom02AFn
 GAZXDyCa6mKamXwKNokPo/go09X78TTm4Q2QAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi2tEw2rBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z0
 ch0p6KMGQIVL4qRu94fbyhlPyBhIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQQqePN
 5RCOFKDajzfOB9WBHYVJqsRs9e6mV77TQ9mkV2a8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u10bTDwweNdef4SGY6X/qjejK9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc8NNKv8E1FGI9rvzviWjBFQ1cxJAd8Nz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbo1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNOtTABbvzt68owGOlor+p5
 iBsdy+2trxmMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8iehk2YptfIG+0O
 yc/XD+9ArcJZxNGioctP+qM5zkCl/C8RbwJqNiOBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WlOniHqdNIdAtSRZX5bLivw/Fqmie4ClIOMAkc5zX5mO1Jl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23:TpbXV6BgdpSbzNPlHemg55DYdb4zR+YMi2TC1yhKJyC9Ffbo8P
 xG/c5rsSMc5wxwZJhNo7y90cq7MBbhHPxOkOos1N6ZNWGM0gaVxelZnO3fKlbbehEWmNQz6U
 4ZSdkdNOHN
X-IronPort-AV: E=Sophos;i="5.90,163,1643691600"; 
   d="scan'208";a="67998639"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/kexec: Use noreturn attributes, and drop unreachable code
Date: Mon, 7 Mar 2022 21:02:10 +0000
Message-ID: <20220307210210.4261-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

kexec_reloc() does not return.  Plumbing this property upwards lets us mark
machine_kexec() and machine_reboot_kexec() noreturn too.  This in turn lets us
drop some unreachable BUG()/return statements.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/machine_kexec.h | 7 ++++---
 xen/arch/x86/machine_kexec.c             | 5 ++---
 xen/common/kexec.c                       | 5 -----
 xen/include/xen/kexec.h                  | 4 ++--
 4 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/include/asm/machine_kexec.h b/xen/arch/x86/include/asm/machine_kexec.h
index d4880818c1d9..81fe95e091d1 100644
--- a/xen/arch/x86/include/asm/machine_kexec.h
+++ b/xen/arch/x86/include/asm/machine_kexec.h
@@ -4,10 +4,11 @@
 #define KEXEC_RELOC_FLAG_COMPAT 0x1 /* 32-bit image */
 
 #ifndef __ASSEMBLY__
+#include <xen/compiler.h>
 
-extern void kexec_reloc(unsigned long reloc_code, unsigned long reloc_pt,
-                        unsigned long ind_maddr, unsigned long entry_maddr,
-                        unsigned long flags);
+extern void noreturn kexec_reloc(
+    unsigned long reloc_code, unsigned long reloc_pt, unsigned long ind_maddr,
+    unsigned long entry_maddr, unsigned long flags);
 
 extern const char kexec_reloc_end[];
 
diff --git a/xen/arch/x86/machine_kexec.c b/xen/arch/x86/machine_kexec.c
index d83aa4e7e93b..d9b839f46401 100644
--- a/xen/arch/x86/machine_kexec.c
+++ b/xen/arch/x86/machine_kexec.c
@@ -138,15 +138,14 @@ void machine_kexec_unload(struct kexec_image *image)
     /* no-op. kimage_free() frees all control pages. */
 }
 
-void machine_reboot_kexec(struct kexec_image *image)
+void noreturn machine_reboot_kexec(struct kexec_image *image)
 {
     BUG_ON(smp_processor_id() != 0);
     smp_send_stop();
     machine_kexec(image);
-    BUG();
 }
 
-void machine_kexec(struct kexec_image *image)
+void noreturn machine_kexec(struct kexec_image *image)
 {
     int i;
     unsigned long reloc_flags = 0;
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index a2ffb6530cff..0c85f6171a98 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -391,8 +391,6 @@ void kexec_crash(enum crash_reason reason)
     kexec_crash_save_cpu();
     machine_crash_shutdown();
     machine_kexec(kexec_image[KEXEC_IMAGE_CRASH_BASE + pos]);
-
-    BUG();
 }
 
 static long cf_check kexec_reboot(void *_image)
@@ -403,9 +401,6 @@ static long cf_check kexec_reboot(void *_image)
 
     kexec_common_shutdown();
     machine_reboot_kexec(image);
-
-    BUG();
-    return 0;
 }
 
 static void cf_check do_crashdump_trigger(unsigned char key)
diff --git a/xen/include/xen/kexec.h b/xen/include/xen/kexec.h
index e66eb6a8e593..ff3531586a21 100644
--- a/xen/include/xen/kexec.h
+++ b/xen/include/xen/kexec.h
@@ -48,8 +48,8 @@ int machine_kexec_add_page(struct kexec_image *image, unsigned long vaddr,
 int machine_kexec_load(struct kexec_image *image);
 void machine_kexec_unload(struct kexec_image *image);
 void machine_kexec_reserved(xen_kexec_reserve_t *reservation);
-void machine_reboot_kexec(struct kexec_image *image);
-void machine_kexec(struct kexec_image *image);
+void noreturn machine_reboot_kexec(struct kexec_image *image);
+void noreturn machine_kexec(struct kexec_image *image);
 void kexec_crash(enum crash_reason reason);
 void kexec_crash_save_cpu(void);
 struct crash_xen_info *kexec_crash_save_info(void);
-- 
2.11.0


