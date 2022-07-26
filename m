Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52932581320
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 14:26:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375185.607511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGJdE-0002qZ-5m; Tue, 26 Jul 2022 12:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375185.607511; Tue, 26 Jul 2022 12:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGJdE-0002o3-2E; Tue, 26 Jul 2022 12:25:48 +0000
Received: by outflank-mailman (input) for mailman id 375185;
 Tue, 26 Jul 2022 12:25:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DB1L=X7=citrix.com=prvs=199b7977f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oGJdC-0002nx-Os
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 12:25:46 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1144932d-0cde-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 14:25:45 +0200 (CEST)
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
X-Inumbo-ID: 1144932d-0cde-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658838345;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JAcIuNG8+PUHD1HCk4H7xnYNap+DfbC0IKbljashmyk=;
  b=I4mx5yWhEHvRoDjY7Z6AIRkQw619lAv9nrOitQuQ32AZSMl+IRyU8p9H
   WiMaNmgs6JsxyCIUaFf7iScVKcwGr+3Iy///dG0Sjdz1KHkgKPeJ9za34
   yDC1kCz2uekJQatMMCmhojD/pyUg38ONF4ZueGv5WcAfvJH4CgA23rosd
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 79209859
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DZMJLqnfKLnhvy321fLVTMTo5gzoJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJUWCFPfyCYDT0Kt51OoXno00P6JPcxtdkTAY+r3xkFSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk3466v4GlwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2k1MoRI/NZ6Rlhsy
 uA7EiAKSD2BxPiplefTpulE3qzPLeHuNYIb/Hph0SvYHbAtRpWrr6fivIECmm1q34YXQKiYN
 5FxhTlHNXwsZzVmPFsNBY14t+CvnnTlKBVTqU6PpLpx6G/WpOB0+Oe8aoKEKoHbLSlTth6er
 1vD5D6mOw0xPcCmwmGro1uTpPCayEsXX6pNTeblp5aGmma72Wg7GBAQE1yhrpGRqGSzRtZeI
 Ew84Tc1oO4580nDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZ8hMcO7ZFsA2Zwj
 xnQwo2vVWcHXKCppWy19bid/TWCNG8sD1AeRhUUSi0o4Zr5v9Rm5v7QdeqPAJJZn/WsR2ygk
 2jS9nNn71kApZVVjvvmpDgrlxrp/8GUFVBtu207S0r/tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBN7faVUweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPuc8MYyfzPf8oPtzZ5yEWIU/ITI+NaxwpRoAWPsgZmPGvp0mCmnJ8L0iyyRNxwMnTy
 L+QcNq2DGZyNJmLOAGeHr5FuZd2l39W+I8mbcqkp/hR+ebBOSX9pHZsGAfmU93VG4ve+lSIo
 o4BZpfbo/idOcWnChTqHUcoBQhiBRAG6Vre8qS7qsbrztJaJVwc
IronPort-HdrOrdr: A9a23:CfIHgao2YQlgm7UvRu9XrMUaV5oneYIsimQD101hICG8cqSj+f
 xG+85rsiMc6QxhPE3I9urhBEDtex/hHP1OkOws1NWZLWrbUQKTRekIh+bfKlXbakvDH4VmtJ
 uIHZIQNDSJNykZsfrH
X-IronPort-AV: E=Sophos;i="5.93,193,1654574400"; 
   d="scan'208";a="79209859"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/tboot: Drop mfn_in_guarded_stack()
Date: Tue, 26 Jul 2022 13:25:21 +0100
Message-ID: <20220726122521.16091-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

To support CET Shadow Stacks, guard pages changed from being holes to being
read-only.  As such, they can be read.

Moreover, they should be included in the integrity check.

Fixes: 60016604739b ("x86/shstk: Rework the stack layout to support shadow stacks")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/tboot.c | 33 +--------------------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
index fe1abfdf08ff..03098450f788 100644
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -242,29 +242,6 @@ static void tboot_gen_domain_integrity(const uint8_t key[TB_KEY_SIZE],
     memset(&ctx, 0, sizeof(ctx));
 }
 
-/*
- * For stack overflow detection in debug build, a guard page is set up.
- * This fn is used to detect whether a page is in the guarded pages for
- * the above reason.
- */
-static int mfn_in_guarded_stack(unsigned long mfn)
-{
-    void *p;
-    int i;
-
-    for ( i = 0; i < nr_cpu_ids; i++ )
-    {
-        if ( !stack_base[i] )
-            continue;
-        p = (void *)((unsigned long)stack_base[i] + STACK_SIZE -
-                     PRIMARY_STACK_SIZE - PAGE_SIZE);
-        if ( mfn == virt_to_mfn(p) )
-            return -1;
-    }
-
-    return 0;
-}
-
 static void tboot_gen_xenheap_integrity(const uint8_t key[TB_KEY_SIZE],
                                         vmac_t *mac)
 {
@@ -288,15 +265,7 @@ static void tboot_gen_xenheap_integrity(const uint8_t key[TB_KEY_SIZE],
             continue; /* skip tboot and its page tables */
 
         if ( is_page_in_use(page) && is_special_page(page) )
-        {
-            void *pg;
-
-            if ( mfn_in_guarded_stack(mfn) )
-                continue; /* skip guard stack, see memguard_guard_stack() in mm.c */
-
-            pg = mfn_to_virt(mfn);
-            vmac_update((uint8_t *)pg, PAGE_SIZE, &ctx);
-        }
+            vmac_update(mfn_to_virt(mfn), PAGE_SIZE, &ctx);
     }
     *mac = vmac(NULL, 0, nonce, NULL, &ctx);
 
-- 
2.11.0


