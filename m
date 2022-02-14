Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64594B50CE
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 13:57:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271579.466074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJauX-0001p1-6v; Mon, 14 Feb 2022 12:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271579.466074; Mon, 14 Feb 2022 12:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJauX-0001mO-1c; Mon, 14 Feb 2022 12:56:57 +0000
Received: by outflank-mailman (input) for mailman id 271579;
 Mon, 14 Feb 2022 12:56:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJauU-0001Wb-T7
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 12:56:55 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 937cf4b1-8d95-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 13:56:52 +0100 (CET)
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
X-Inumbo-ID: 937cf4b1-8d95-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843412;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1CKl1xVTrEiSTs3I4IXapDMOKGH0W00+m3pdXMEQ9Q4=;
  b=SW39No1f+WAJGY8o3q2fanQ1l0mIvM83jDXYDrIhxKJiDSj4Znl2hmxT
   voCljibNd9Eu4nYoHLAbwrBOxV9Hoz5q5Nj/4ysPNg+ygXlyQkHyiFT+B
   e9Zm3rJ8wxu6HWdgyfou999UCiiKK8zGvrB95erV69Lp3rwCdXCrS7DAW
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: yiPOqDVw2uctAGuI2F6hqobxrJFB39GaQS3Gr4BUngEVXC8oBY5Lh1AqovGOM0unhmWINmJEf2
 UAabnTPv4oC+vZGTp02PDmTfz3gmUSjTQ6JYkDIN1xGnW25qRC0huXnPoY5O9an8arj5SJNn2H
 sADA2f3HsQzhNcPhLkGhz32UIl6zd0Ta5FFkm1q1z0HD6I/2tfaYR2e4BTnfTG0JOrTlBPSwwk
 ykMnc8wUoS6GJD7jk7PwyD8zphewqoQFy3ifaP8+H0uKozUGjtbRUCgTiGofefShypP9IGqQa1
 /UlTK/FNGIMJhalFMgorY/et
X-SBRS: 5.1
X-MesageID: 63591330
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Xf0rk6xvglxnJ/pLb3t6t+cLwSrEfRIJ4+MujC+fZmUNrF6WrkVRz
 2tOCmDUMquCYWfyLosiPYnipEgA7Z7czIBnHFRsqiAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbdl2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9wy6
 tZ2tsKAc14sMaTzoMARUgl5CS4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY2JsTTK+FP
 JJxhTxHfSXYUw9/Gw0rB5s1n8q3rWvGUTh7kQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krk1WnkBhARNPSE1CGItHmrg4fnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDYQGPhTKO5k2DvUz6Xd3D69CmkUbyROPYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLTfbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP/D2BLwQKChRqlEGp+ZgPf1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zpyL8LdANvWknfx0B3iM4ldjBO
 hG7hO+szMULYCvCgVFfP+pd9PjGPYC/TI+4B5g4n/JFY4RrdR/vwc2dTRX44owZq2B1yftXE
 c7CKa6EVC9GYYw6nGveb7pMitcDm3FhrV4/sLimlnxLJ5LFPyXLIVrEWXPTBt0EAFSs/lmLr
 YYFapfiJtc2eLSWXxQ7OLU7dTgiRUXXz7iswyCOXuLccAdgBk87DPrdneEod4B/xvwHnebU5
 HCtHERfzQOn13HALAyLbFFlaa/uAskj/S5qY3R0MAb6wWUnbKau8LwbK8k9c444+bEx1vVzV
 fQEJZmNW6wdVjTd9j0BRpDht4g+Jg+zjAeDMnP9MjgydpJtXSLT/drgcle9/SUCFHPv58A/v
 6ehxkXQRp9aH1ZuC8PfafSOyVKtvCdCxLIuDhWQetQKIRfi6olnLSD1n8QbGcBUJEWR3Cae2
 iaXHQwc+bvHrbgq/YSbnquDtYqoTbdzRxIIA2nB4L+qHiDG5W7/k5RYWeOFcD2BBmP5/KKuO
 bdcw/3maaBVmV9Lt8x3EqpxzLJ47Nzq/ucIwgNhFXTNTlKqFrI/fSXWgZgR7vVAlu1DpA+7e
 kOT4d0La7yGNfTsHEMVOAd4PP+I0usZm2WK4Pk4SKkgCPSbIFZTvZ1uAiSx
IronPort-HdrOrdr: A9a23:FrYif6Dvp+uPM8/lHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo7v
 xG/c5rsyMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 9dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="63591330"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/7] x86/altcall: Check and optimise altcall targets
Date: Mon, 14 Feb 2022 12:56:27 +0000
Message-ID: <20220214125632.24563-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125632.24563-1-andrew.cooper3@citrix.com>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When converting indirect to direct calls, there is no need to execute endbr64
instructions.  Detect and optimise this case, leaving a warning in the case
that no endbr64 was found, as it likely indicates a build error.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/alternative.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index ec24692e9595..65537fe1f0bd 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -18,6 +18,7 @@
 #include <xen/delay.h>
 #include <xen/types.h>
 #include <asm/apic.h>
+#include <asm/endbr.h>
 #include <asm/processor.h>
 #include <asm/alternative.h>
 #include <xen/init.h>
@@ -279,6 +280,28 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
 
                 if ( dest )
                 {
+                    /*
+                     * When building for CET-IBT, all function pointer targets
+                     * should have an endbr64 instruction.
+                     *
+                     * If this is not the case, leave a warning because
+                     * something is probably wrong with the build.  A CET-IBT
+                     * enabled system might have exploded already.
+                     *
+                     * Otherwise, skip the endbr64 instruction.  This is a
+                     * marginal perf improvement which saves on instruction
+                     * decode bandwidth.
+                     */
+                    if ( IS_ENABLED(CONFIG_HAS_CC_CET_IBT) )
+                    {
+                        if ( is_endbr64(dest) )
+                            dest += 4;
+                        else
+                            printk(XENLOG_WARNING
+                                   "altcall %ps dest %ps has no endbr64\n",
+                                   orig, dest);
+                    }
+
                     disp = dest - (orig + 5);
                     ASSERT(disp == (int32_t)disp);
                     *(int32_t *)(buf + 1) = disp;
-- 
2.11.0


