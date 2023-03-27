Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A13A76CAF02
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 21:42:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515458.798388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgsiy-000466-Ol; Mon, 27 Mar 2023 19:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515458.798388; Mon, 27 Mar 2023 19:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgsiy-00041s-Kb; Mon, 27 Mar 2023 19:41:48 +0000
Received: by outflank-mailman (input) for mailman id 515458;
 Mon, 27 Mar 2023 19:41:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kO+W=7T=citrix.com=prvs=443697bea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pgsiw-0002j7-Du
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 19:41:46 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66e52436-ccd7-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 21:41:43 +0200 (CEST)
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
X-Inumbo-ID: 66e52436-ccd7-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679946103;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A4IRiksY66q+14P3ogmWDrkQ7IqWvKWCQhasxkw28Ak=;
  b=LAkwARIq+I+QU2FFcMsqWq/v0WT3eHmyvBn7MTt8YQXs1KVZBQ21PHqS
   CvTngYcwlBvRg/zcnZBH80ntUDmpoGKcL7l6tYXQ/eXQOCZ2NBFBgxcwQ
   EGKSrZjJ+Q1bKkhzbKUilXQehUJvDsiKm9fY+M4rAmFSBhEYMdZhzZ1K2
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103008793
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:T2PxKa/qUbeyCuyvy2XTDrUDjX6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GQZDDvUOfuCNmP8c48iPt639k0GscSBnddhSwNopCw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqoU5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklf3
 6AzMC4yaSyxvN+ay66nddBgtPsaeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0Mxh3A/
 jKZrj+R7hcyOO2Ylgil3mKXr7HjoQW4f7MgFJmo6as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZebPQ2uclwQiYlv
 mJlhPuwW2Yp6ufMDyvAqPHN92ja1TUpwXEqdAVYZhMb3N7fkroOohnTUulaHJyKt4igcd3v+
 AxmvBTSlp1K05Faifvmpwuf696/jsOXF1Bov207Skrgt1okP9D9OuRE/HCBtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFBz3oRZPhagKvFlDyL1VGsgFYyT1R
 0TYpBlc4pReVFPzM/AmMt7oW591l/a4fTgAahwyRoAWCnSWXFHvwc2TTRTIgzCFfLYEyMnTx
 qt3ge7zVC1HWMyLPRK9RvsH0K9D+x3SMVj7HMihpzz+iOr2WZJgYetdWHOUcPsD5b+JyC2Mt
 Y432z2il08OD4UTo0D/reYuELz9BSFiXMus95UHJ7frz8gPMDhJNsI9CIgJI+RN95m5XM+Rl
 p1hcie0EGbCuEA=
IronPort-HdrOrdr: A9a23:Ss6r4qMpffVyZcBcTgajsMiBIKoaSvp037Eqv3oBLyC9E/b5qy
 nKpp8mPHDP6Qr5NEtQ/OxoW5PwOE80l6QFmbX5VI3KNGaJhILBFvAY0WKI+UyFJ8SRzJ876Y
 5QN4VFJZnXK3MSt6rHCQ+DeeoI8Z283Jrtr8H44FdCcTpDVoFHyENCJjvzKDwUeCB2QZU4EZ
 aH5tlKvVObFEg/ZNigG38AU/PiirTw5fDbXSI=
X-IronPort-AV: E=Sophos;i="5.98,295,1673931600"; 
   d="scan'208";a="103008793"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Sergey Dyasli
	<sergey.dyasli@citrix.com>
Subject: [PATCH 2/5] x86/ucode: Fold early_update_cache() into microcode_init_cache()
Date: Mon, 27 Mar 2023 20:41:23 +0100
Message-ID: <20230327194126.3573997-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
References: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

It is not valid to retain a bootstrap_map() across returning back to
__start_xen(), but various pointers get stashed across calls.

Begin to address this by folding early_update_cache() into it's single caller,
rearranging the exit path to always invalidate the mapping.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Sergey Dyasli <sergey.dyasli@citrix.com>
---
 xen/arch/x86/cpu/microcode/core.c | 54 +++++++++++++++++--------------
 1 file changed, 29 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 11c471cc3f83..3d23e3ed7ee4 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -755,47 +755,51 @@ int microcode_update_one(void)
     return microcode_update_cpu(NULL);
 }
 
-static int __init early_update_cache(const void *data, size_t len)
+int __init microcode_init_cache(unsigned long *module_map,
+                                const struct multiboot_info *mbi)
 {
     int rc = 0;
     struct microcode_patch *patch;
+    struct ucode_mod_blob blob = {};
 
-    if ( !data )
-        return -ENOMEM;
+    if ( ucode_scan )
+        /* Need to rescan the modules because they might have been relocated */
+        microcode_scan_module(module_map, mbi);
+
+    if ( ucode_mod.mod_end )
+    {
+        blob.data = bootstrap_map(&ucode_mod);
+        blob.size = ucode_mod.mod_end;
+    }
+    else if ( ucode_blob.size )
+    {
+        blob = ucode_blob;
+    }
 
-    patch = parse_blob(data, len);
+    if ( !blob.data )
+        return 0;
+
+    patch = parse_blob(blob.data, blob.size);
     if ( IS_ERR(patch) )
     {
-        printk(XENLOG_WARNING "Parsing microcode blob error %ld\n",
-               PTR_ERR(patch));
-        return PTR_ERR(patch);
+        rc = PTR_ERR(patch);
+        printk(XENLOG_WARNING "Parsing microcode blob error %d\n", rc);
+        goto out;
     }
 
     if ( !patch )
-        return -ENOENT;
+    {
+        rc = -ENOENT;
+        goto out;
+    }
 
     spin_lock(&microcode_mutex);
     rc = microcode_update_cache(patch);
     spin_unlock(&microcode_mutex);
     ASSERT(rc);
 
-    return rc;
-}
-
-int __init microcode_init_cache(unsigned long *module_map,
-                                const struct multiboot_info *mbi)
-{
-    int rc = 0;
-
-    if ( ucode_scan )
-        /* Need to rescan the modules because they might have been relocated */
-        microcode_scan_module(module_map, mbi);
-
-    if ( ucode_mod.mod_end )
-        rc = early_update_cache(bootstrap_map(&ucode_mod),
-                                ucode_mod.mod_end);
-    else if ( ucode_blob.size )
-        rc = early_update_cache(ucode_blob.data, ucode_blob.size);
+ out:
+    bootstrap_map(NULL);
 
     return rc;
 }
-- 
2.30.2


