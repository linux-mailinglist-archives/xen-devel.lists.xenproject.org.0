Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7438A737326
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:47:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552161.862079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfQi-0008Id-LY; Tue, 20 Jun 2023 17:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552161.862079; Tue, 20 Jun 2023 17:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfQi-0008Fq-I3; Tue, 20 Jun 2023 17:46:12 +0000
Received: by outflank-mailman (input) for mailman id 552161;
 Tue, 20 Jun 2023 17:46:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qnc8=CI=citrix.com=prvs=5286b1552=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qBfQg-0008Fk-UV
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:46:11 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5537f468-0f92-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 19:46:08 +0200 (CEST)
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
X-Inumbo-ID: 5537f468-0f92-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687283167;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rGnvM14ixfWPA7glURMM/F1hOUiXveqgD8w1TAFs4DI=;
  b=AyJk/65X4gV99IxoYa+pnLBDbvcEq1ljq+fkwzH9HD3PmE/DWZ4eKw9v
   SuuJLUu/55SnkQrD8ZXuZdSZqh2n8+o6wmwxMjhGi9tRtXAXlf8u2mGUV
   spP1DcG8wi/QRq+6iRrO6y3K0t/0LwJJOLrU/YpkNxObVNBKbkgm0hJJu
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112833466
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:O2A/Z6wc0iIfSE8Z5ol6t+c2xirEfRIJ4+MujC+fZmUNrF6WrkVSy
 mVJDW2ObPnZa2X9c9h3PYmw8UoDusCExoVgGVQ4rSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgP6gT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWpx9
 tggFQ1QUiiGosuzzIP8du9lutt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwMxBbD/
 T6YoQwVBDlHG4Gx6GqV2Uj1odbMoRr7WKQwFZ2Ro6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sZiFFQMwrsokxXzNC6
 7OSt4q3X3o16uTTEC/DsO7O9lteJBT5M0cJWiwgdTY4vuXbpaQaix7+CeplGZKq24id9S7L/
 9yakMQvr+xN3ZFRh//hpAuvbyGE/caQEFNsjunDdif8t14iOtb4D2C9wQKDhcusOrp1WbVoU
 JIsv8GFpN4DApiW/MBmaLVcRer5jxpp3dC1vLKOI3XC3273k5JbVdoMiAyS3W8wWir+RRfnY
 VXIpSRa74JJMX2hYMdfOtzhVJ17nPWwRYm5CJg4i+aihLArKWdrGwk0PyatM53FyhBwwcnTx
 7/GGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvuqWPTlnyaPU6lTCfNE98taQLeBt3VGYvY+G05B
 f4DbZrVo/ieOcWiChTqHXk7dwFWdyRrW86nwyGVH8baSjdb9KgaI6e56dscl0ZNxsy5Ss+gE
 qmBZ3Jl
IronPort-HdrOrdr: A9a23:ZhdMOqAVWYwBO5/lHemW55DYdb4zR+YMi2TDgXoBLiC9Ffbo9P
 xG/c566faasl0ssR0b8+xoW5PgfZq/z/FICNIqTNOftWDd0QOVxedZgLcKqAePJ8SRzIJgPQ
 gLSdkZNDVdZ2IK7/oTQWODYrMd/OU=
X-Talos-CUID: 9a23:MdlciG8J0+skREz0Qh+Vv0UrGeQdT0CA8E/VBma9BVcudLucdUDFrQ==
X-Talos-MUID: 9a23:DcpC+wYyG+cUfeBT6hCxqhAyJOxSuoOXC3w0kZUgmcikHHkl
X-IronPort-AV: E=Sophos;i="6.00,257,1681185600"; 
   d="scan'208";a="112833466"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/vpmu: Simplify is_pmc_quirk
Date: Tue, 20 Jun 2023 18:45:56 +0100
Message-ID: <20230620174556.3898824-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This should be static, and there's no need for a separate (non-init, even)
function to perform a simple equality test.  Drop the is_ prefix which is
gramatically questionable, and make it __ro_after_init.

Leave a TODO, because the behaviour is definitely wrong to be applied to ~all
modern Intel CPUs, and has been raised on xen-devel previously without
conclusion.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu/vpmu_intel.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 35e350578b84..0291481da22e 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -91,22 +91,14 @@ static const unsigned int regs_off =
  * 1 (or another value != 0) into it.
  * There exist no errata and the real cause of this behaviour is unknown.
  */
-bool_t __read_mostly is_pmc_quirk;
-
-static void check_pmc_quirk(void)
-{
-    if ( current_cpu_data.x86 == 6 )
-        is_pmc_quirk = 1;
-    else
-        is_pmc_quirk = 0;    
-}
+static bool __ro_after_init pmc_quirk;
 
 static void handle_pmc_quirk(u64 msr_content)
 {
     int i;
     u64 val;
 
-    if ( !is_pmc_quirk )
+    if ( !pmc_quirk )
         return;
 
     val = msr_content;
@@ -791,8 +783,9 @@ static int cf_check core2_vpmu_do_interrupt(struct cpu_user_regs *regs)
     rdmsrl(MSR_CORE_PERF_GLOBAL_STATUS, msr_content);
     if ( msr_content )
     {
-        if ( is_pmc_quirk )
+        if ( pmc_quirk )
             handle_pmc_quirk(msr_content);
+
         core2_vpmu_cxt->global_status |= msr_content;
         msr_content &= ~global_ovf_ctrl_mask;
         wrmsrl(MSR_CORE_PERF_GLOBAL_OVF_CTRL, msr_content);
@@ -967,7 +960,8 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
               sizeof(uint64_t) * fixed_pmc_cnt +
               sizeof(struct xen_pmu_cntr_pair) * arch_pmc_cnt;
 
-    check_pmc_quirk();
+    /* TODO: This is surely wrong. */
+    pmc_quirk = current_cpu_data.x86 == 6;
 
     if ( sizeof(struct xen_pmu_data) + sizeof(uint64_t) * fixed_pmc_cnt +
          sizeof(struct xen_pmu_cntr_pair) * arch_pmc_cnt > PAGE_SIZE )
-- 
2.30.2


