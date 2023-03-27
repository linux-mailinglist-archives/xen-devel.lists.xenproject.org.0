Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BF46CAF01
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 21:42:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515457.798377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgsix-0003nR-Be; Mon, 27 Mar 2023 19:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515457.798377; Mon, 27 Mar 2023 19:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgsix-0003iD-5b; Mon, 27 Mar 2023 19:41:47 +0000
Received: by outflank-mailman (input) for mailman id 515457;
 Mon, 27 Mar 2023 19:41:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kO+W=7T=citrix.com=prvs=443697bea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pgsiv-0002j7-Dt
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 19:41:45 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65bdbad7-ccd7-11ed-b464-930f4c7d94ae;
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
X-Inumbo-ID: 65bdbad7-ccd7-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679946102;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LsekXLTw0DjPTzJsgqE8jFzXfBBPFxBP5u5EwDgnQTo=;
  b=PsKJoU5VoM6ym3ON0I2H/5duSvBza1Q1OIi0J9EYG51NS2kONfizgEQP
   AKtlDCf/H0wK5Bo6TdhSVNWyk4IRFOuiqmvwPn7qhPiaKOBtU/vRy/nyN
   kJVvevfwbNo4URNcd86KKxH0tBMqNYMAJQ4I3V5YneEX1v6dCbXB5jZ22
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103008790
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:LMLZAqktGizZl7cFfGK/wRzo5gyMJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbWGqCPq7ZNmumL4skPYS/8E1QsZGGmodmHAM+/i48FSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5gCGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 e0ydBsVcC+Eu9CN/Z6wVvVTv8gRE/C+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQth/A/
 TqerzuoWnn2MvS7+COb8HeiodXVkAO4BIs9U6KAyMB11Qj7Kms7V0RNCArTTeOCol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4Mcc39QWMwar8+BuCCy4PSTspQMMinN87Q3otz
 FDhoj/yLWUx6vvPEyvbr+rK62roYkD5MFPuewcVZ1cu+8fcp70BtS/jRcp/L5e5vOLMTGSYL
 y+xkMQuu1kCpZdViPTlow2d2GrESovhFVBsuFiONo6xxkYgPdP+OdT1gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hO0yT5FWyoyGsiTHqFyPosdz7ze
 1P0sghM/pJVN3bCRfYpPNPgV516lve6S4yNuhXogjxmOMAZmOivoklTibO4hTixwCDAb4lmU
 XtkTSpcJSlDUvk2pNZHb+wczaUq1kgD+I8nfriil07P+ePHNBaopUItbAPmRvon95mNvAi92
 48Zb6NmPT0DCryhCsQWmKZPRW03wY8TXMmv8JYLL77Se2KL2ggJUpfs/F/oQKQ994w9qwsC1
 ivVtpNwoLYnuUD6FA==
IronPort-HdrOrdr: A9a23:iClWU63um1A9Kjec2YfYpQqjBHUkLtp133Aq2lEZdPRUGvbo8f
 xG/c566faQsl0ssR4b+OxoVJPwJE80lqQFmLX5X43SJDUO0VHARO4N0WKL+UyaJ8SUzJ846U
 4PSdkYNPTASXVBoILdxiLQKbodKd+8mpyAtKPl400oZydMRIFP0zxQNya8NQlNaDQuP+tbKL
 OsosVGoja7eWcadK2Aa0UtVfTYutvOmInHTHc9dnwa1DU=
X-IronPort-AV: E=Sophos;i="5.98,295,1673931600"; 
   d="scan'208";a="103008790"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Sergey Dyasli
	<sergey.dyasli@citrix.com>
Subject: [PATCH 3/5] x86/ucode: Fold early_microcode_update_cpu() into early_microcode_init()
Date: Mon, 27 Mar 2023 20:41:24 +0100
Message-ID: <20230327194126.3573997-4-andrew.cooper3@citrix.com>
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
 xen/arch/x86/cpu/microcode/core.c | 70 +++++++++++++++----------------
 1 file changed, 33 insertions(+), 37 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 3d23e3ed7ee4..4d2a896fe78d 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -804,45 +804,12 @@ int __init microcode_init_cache(unsigned long *module_map,
     return rc;
 }
 
-/* BSP calls this function to parse ucode blob and then apply an update. */
-static int __init early_microcode_update_cpu(void)
-{
-    const void *data = NULL;
-    size_t len;
-    struct microcode_patch *patch;
-
-    if ( ucode_blob.size )
-    {
-        len = ucode_blob.size;
-        data = ucode_blob.data;
-    }
-    else if ( ucode_mod.mod_end )
-    {
-        len = ucode_mod.mod_end;
-        data = bootstrap_map(&ucode_mod);
-    }
-
-    if ( !data )
-        return -ENOMEM;
-
-    patch = ucode_ops.cpu_request_microcode(data, len, false);
-    if ( IS_ERR(patch) )
-    {
-        printk(XENLOG_WARNING "Parsing microcode blob error %ld\n",
-               PTR_ERR(patch));
-        return PTR_ERR(patch);
-    }
-
-    if ( !patch )
-        return -ENOENT;
-
-    return microcode_update_cpu(patch);
-}
-
 int __init early_microcode_init(unsigned long *module_map,
                                 const struct multiboot_info *mbi)
 {
     const struct cpuinfo_x86 *c = &boot_cpu_data;
+    struct microcode_patch *patch;
+    struct ucode_mod_blob blob = {};
     int rc = 0;
 
     switch ( c->x86_vendor )
@@ -868,8 +835,37 @@ int __init early_microcode_init(unsigned long *module_map,
 
     ucode_ops.collect_cpu_info();
 
-    if ( ucode_mod.mod_end || ucode_blob.size )
-        rc = early_microcode_update_cpu();
+    if ( ucode_blob.data )
+    {
+        blob = ucode_blob;
+    }
+    else if ( ucode_mod.mod_end )
+    {
+        blob.data = bootstrap_map(&ucode_mod);
+        blob.size = ucode_mod.mod_end;
+    }
+
+    if ( !blob.data )
+        return 0;
+
+    patch = ucode_ops.cpu_request_microcode(blob.data, blob.size, false);
+    if ( IS_ERR(patch) )
+    {
+        rc = PTR_ERR(patch);
+        printk(XENLOG_WARNING "Parsing microcode blob error %d\n", rc);
+        goto out;
+    }
+
+    if ( !patch )
+    {
+        rc = -ENOENT;
+        goto out;
+    }
+
+    rc = microcode_update_cpu(patch);
+
+ out:
+    bootstrap_map(NULL);
 
     return rc;
 }
-- 
2.30.2


