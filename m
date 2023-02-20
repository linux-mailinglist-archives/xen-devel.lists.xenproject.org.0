Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D2A69D450
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 20:47:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498351.769196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUC82-0001v8-2P; Mon, 20 Feb 2023 19:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498351.769196; Mon, 20 Feb 2023 19:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUC81-0001rl-Vx; Mon, 20 Feb 2023 19:47:13 +0000
Received: by outflank-mailman (input) for mailman id 498351;
 Mon, 20 Feb 2023 19:47:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT8u=6Q=citrix.com=prvs=408b4b2b9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pUC80-0001rf-5t
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 19:47:12 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b23a48b-b157-11ed-93b5-47a8fe42b414;
 Mon, 20 Feb 2023 20:47:08 +0100 (CET)
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
X-Inumbo-ID: 5b23a48b-b157-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676922428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ozmrT0xsF9T2UPZ0eCR4FeQWVNqHXbEoi8spot3TtxA=;
  b=JSqgews5QXcv/KlA8+0Y3m8haXat6Y1kcI6dUjZdlH+ADugB6aEIm8v6
   q5q/dUPf73dtYrST6zVeWl2BSH4oXeycJ5LCOpVtaEuSe792e82fPklLY
   A0/6maeTzWfhAJGOa64tU7USQaCbb55jd3CRRLBnkMNclqfZ/XUQPfhap
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97796898
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:OQvNBqCEez9KdRVW/z/jw5YqxClBgxIJ4kV8jS/XYbTApGt31DEFn
 DdJXW7Xbq3bMWCnftEibd+2pkJQ7ZDQyoJjQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GlC5gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw1N14PTlkz
 v4hBTktah6DnMWN5pmwc7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9K4PVFJsFzxbwS
 mTu9lnBKyomJMakxRmHqVPwoNXhhGDjcddHfFG/3qEz2wDCroAJMzUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiFyuswMYWtFQO/Yn8wzLwa3Riy6GAkAUQzgHb8Yp3PLaXhRzi
 AXPxYmwQ2Uy7vvMEyn1GqqoQS2aFxMaETcoXi09YAIl59fju6YIqDnEd4M2eEKqteHdFTb1y
 jGMiSExgbQPkMIGv5mGEUD7byGE/caQEFNsjunDdif8t14iOtb5D2C9wQKDhcusOrp1WbVoU
 JIsv8GFpN4DApiW/MBmaLVcRer5jxpp3dC1vLKOI3XD327wk5JAVdoKiN2bGKuOGp9dEQIFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQPcYgLV/frH43Phb4M4XRfK8Ey/xXB
 HtmWZz0USZy5VpPkVJauNvxIZd0n3tjlAs/tLjwzgi90Kr2WZJmYe5tDbd6VchgtPnsiFyMo
 75i2z6il003vBvWPnOGrub+7DkicRAGOHwBg5YJL77eclU6SThJ5j246epJRrGJVp99zo/gl
 kxRkGcBoLYjrRUr8Tm3V00=
IronPort-HdrOrdr: A9a23:A1uTNKCpRMHEJJPlHels55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dWpk7MvLcJxxRt+GS2njdLz4jquP3jZxBU43lvgtQpQIBUdAe0+9gYDzrdXGf3GN9dOEE/J
 z33Lsgm9LxEU5nF/hSHxM+LpD+m+E=
X-IronPort-AV: E=Sophos;i="5.97,313,1669093200"; 
   d="scan'208";a="97796898"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] xen/ioapic: Don't use local_irq_restore() to disable irqs
Date: Mon, 20 Feb 2023 19:47:01 +0000
Message-ID: <20230220194702.2260181-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230220194702.2260181-1-andrew.cooper3@citrix.com>
References: <20230220194702.2260181-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Despite its name, the irq{save,restore}() APIs are only intended to
conditionally disable and re-enable interrupts.

IO-APIC's timer_irq_works() violates this intention.  As it is init code,
switch to simple irq enable/disable().

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

This is a logical equivelent to Linux's 058df195c2 "x86/ioapic: Cleanup the
timer_works() irqflags mess", but we've diverged far enough for the patch to
not be remotely relevant.
---
 xen/arch/x86/io_apic.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 9b8a972cf570..199098fa3e0f 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1502,15 +1502,14 @@ static void __init setup_ioapic_ids_from_mpc(void)
  */
 static int __init timer_irq_works(void)
 {
-    unsigned long t1, flags;
+    unsigned long t1;
 
     t1 = ACCESS_ONCE(pit0_ticks);
 
-    local_save_flags(flags);
     local_irq_enable();
     /* Let ten ticks pass... */
     mdelay((10 * 1000) / HZ);
-    local_irq_restore(flags);
+    local_irq_disable();
 
     /*
      * Expect a few ticks at least, to be sure some possible
-- 
2.30.2


