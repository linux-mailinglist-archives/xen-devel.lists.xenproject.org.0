Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FDA722477
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 13:24:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543668.848833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q68J2-0004Y6-WD; Mon, 05 Jun 2023 11:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543668.848833; Mon, 05 Jun 2023 11:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q68J2-0004Vi-SX; Mon, 05 Jun 2023 11:23:24 +0000
Received: by outflank-mailman (input) for mailman id 543668;
 Mon, 05 Jun 2023 11:23:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wlJc=BZ=citrix.com=prvs=5133c6164=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q68J0-0004Va-Km
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 11:23:22 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5eb033ca-0393-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 13:23:19 +0200 (CEST)
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
X-Inumbo-ID: 5eb033ca-0393-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685964199;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xMWwc7ruxiKsokgY30UvR+SISuvY+KPwAdNvK0+OIA8=;
  b=UP0MvYWNWJ1szFUZrC9rfqdpUu5UMvGmAFxYqOkfj3pPmXB7gDcAZtge
   9PoFAV0FiPapjo4R9DQrWJ60xSXPei4y+F5NhzJsG3Wkm5vhC4U8Zsqpg
   yvWMhTOqmkJs2W3nNZlW3QGiAn/hptgl5gKjuH+Bqqep2MEEjndzU7oN8
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110364386
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:dP5MLKAzmwmb/xVW/93jw5YqxClBgxIJ4kV8jS/XYbTApD4m0WEAm
 mIaCmvSbq2PZjCnc9pyPIzj9E0GvpGGyoUyQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1A4gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw5LpJKENq6
 NMjNyE8NC/enry6/oPgRbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4XSHpsJxRbGz
 o7A10TSHyAEJPy79TaYqEOlqMLCpCb6Q6tHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaGtBMBX9tbE8Uh9RqAjKHT5m6xHXMYRzRMbNgnss4eRjEw0
 FKN2dTzClRHr7m9WX+bsLCOoluaOzURLGIETT8JS00C+daLiL80ihXDX9NyCpmfh9f+GSzz6
 z2SpS14jLIW5eYB2r+n51nBj3Spr4LQUw8uzgzNWySu6QYRWWK+T9X2sx6Bt68GddvHCADb5
 xDohvRy8sgQUa+ktgiQb94SDYDz2KucbjHisAVgSsxJGyuWx1aveoVZ4TdbLUhvM9oZdTKBX
 HI/qT+997cIYiL0MPYfj5aZTp1zkPO+TYiNuuX8NIImX3RnSOOQEMiCj2a01nulrkUjmLpX1
 XyzIZf1ViZy5UiKIVOLqwYhPV0DnHtWKYD7H8qTI/GbPV22OhaopU8tagfmUwzAxPrsTP/p2
 9heLdCW7B5UTffzZCLamaZKcwBXfCBgWMCq9ZMJHgJmHuaBMDt4Y8I9PJt7I9A190irvrmgE
 o6Btr9wlwOk2CyvxfSiYXF/crL/NauTXlpiVRHAyW2AgiB5Ca72tfd3SnfCVeV/nACV5aIuH
 qZtlgTpKqgndwkrDBxBNcei8NU9KEzw7e9MVgL8CAUCk1dbb1Sh0rfZksHHrUHi0gLfWRMCn
 oCd
IronPort-HdrOrdr: A9a23:78HNtq+A83bRj/b3WAVuk+DWI+orL9Y04lQ7vn2ZKCY4TiX8ra
 uTdZsguiMc5Ax+ZJhDo7C90di7IE80nKQdieN9AV7IZniEhILHFvAG0aLShxHmBi3i5qp8+M
 5bAsxD4QTLfDpHsfo=
X-Talos-CUID: 9a23:3JNtQWysA1oTQT1qAj+sBgUKRv4MUFnA40zPMn7iNjtwFrGreASfrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3ADaLvjg+LVdLsiG+5lFNd5x+Qf+dD/pWwGGAprZk?=
 =?us-ascii?q?b4fiNGwF9AjKclx3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,217,1681185600"; 
   d="scan'208";a="110364386"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>
Subject: [PATCH v2] xen: Fix incorrect taint constant
Date: Mon, 5 Jun 2023 12:23:03 +0100
Message-ID: <20230605112303.1764183-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Insecure is the word being looked for here.  Especially given the nature of
the sole caller, and the (correct) comment next to it.

Also update the taint marker from 'U' to 'I' for consistency; this isn't
expected to impact anyone in practice.

Fixes: 82c0d3d491cc ("xen: Add an unsecure Taint type")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>

v2:
 * Fix commmit message
 * Update comment ahead of print_tainted()
 * Change the emitted char from 'U' to 'I'
---
 xen/arch/arm/cpuerrata.c | 2 +-
 xen/common/kernel.c      | 4 ++--
 xen/include/xen/lib.h    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index 1abacfe5bb67..d0658aedb6aa 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -695,7 +695,7 @@ void __init enable_errata_workarounds(void)
                     "**** Only trusted guests should be used.                             ****\n");
 
         /* Taint the machine has being insecure */
-        add_taint(TAINT_MACHINE_UNSECURE);
+        add_taint(TAINT_MACHINE_INSECURE);
     }
 #endif
 }
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index f7b1f65f373c..b8b845763d9d 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -343,8 +343,8 @@ unsigned int tainted;
  *  'C' - Console output is synchronous.
  *  'E' - An error (e.g. a machine check exceptions) has been injected.
  *  'H' - HVM forced emulation prefix is permitted.
+ *  'I' - Platform is insecure (usually due to an errata on the platform).
  *  'M' - Machine had a machine check experience.
- *  'U' - Platform is unsecure (usually due to an errata on the platform).
  *  'S' - Out of spec CPU (One core has a feature incompatible with others).
  *
  *      The string is overwritten by the next call to print_taint().
@@ -354,7 +354,7 @@ char *print_tainted(char *str)
     if ( tainted )
     {
         snprintf(str, TAINT_STRING_MAX_LEN, "Tainted: %c%c%c%c%c%c",
-                 tainted & TAINT_MACHINE_UNSECURE ? 'U' : ' ',
+                 tainted & TAINT_MACHINE_INSECURE ? 'I' : ' ',
                  tainted & TAINT_MACHINE_CHECK ? 'M' : ' ',
                  tainted & TAINT_SYNC_CONSOLE ? 'C' : ' ',
                  tainted & TAINT_ERROR_INJECT ? 'E' : ' ',
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index e914ccade095..75ae7489b9f0 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -201,7 +201,7 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c);
 #define TAINT_MACHINE_CHECK             (1u << 1)
 #define TAINT_ERROR_INJECT              (1u << 2)
 #define TAINT_HVM_FEP                   (1u << 3)
-#define TAINT_MACHINE_UNSECURE          (1u << 4)
+#define TAINT_MACHINE_INSECURE          (1u << 4)
 #define TAINT_CPU_OUT_OF_SPEC           (1u << 5)
 extern unsigned int tainted;
 #define TAINT_STRING_MAX_LEN            20

base-commit: 67fdffef9246c82cecd8db28838ed09e79e2528a
-- 
2.30.2


