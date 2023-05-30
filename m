Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C6571672D
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 17:35:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541245.843793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q41NO-0004WF-PH; Tue, 30 May 2023 15:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541245.843793; Tue, 30 May 2023 15:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q41NO-0004UO-MP; Tue, 30 May 2023 15:35:10 +0000
Received: by outflank-mailman (input) for mailman id 541245;
 Tue, 30 May 2023 15:35:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8xzU=BT=citrix.com=prvs=507ffd061=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q41NN-0004UG-H9
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 15:35:09 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dd2d7ad-feff-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 17:35:08 +0200 (CEST)
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
X-Inumbo-ID: 8dd2d7ad-feff-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685460907;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EfDPiNQKXMBH56kJ48EMjpQnPshW7bpXihgAYM2vFb4=;
  b=AsBQKgXWK95L2/Ah9HKKdM31AoVnz3//DBT9G7tNTnn9ULjEigVpP67J
   WkWWA55Ek4DKdHDjAtEQO9yKPDem6tRm986CxT+WWtLyvO3yjc8+ZEYa2
   EjgMDSVDNjmfCFAHyf+lDFuzidne7Of2pUfntF6R1sNfP6/fV6OmsnBOZ
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110275639
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:s6TmKKJdUKLnryIwFE+Rx5UlxSXFcZb7ZxGr2PjKsXjdYENS1zRRy
 zcYXmHUOqvcY2rzLtglPd61o00Au56Dy4c3TFNlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4wdmPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4uE3FO8
 qE+dQo1ZwihwPubwO6Zaclz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHJ0PwRvG/
 TOuE2LRPkkkNdu1kDm+9km92+TgrQr8G9gYG+jtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTErOz8QS6O1TY9dH0SZShZa1Y/29D7gsYqoxKTbPVDD/vg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yT7FWyzyGskTKuMDirjUWGBX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YhKVTXoXs0PRfKhwgBdXTAdolma
 P+mnTuEVy5GWcyLMhLqLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtaTOzghQCxPrc+m39q
 o8PX/ZmPj0DCIUSlAGLq99MRb3LRFBnba3LRzt/Lbffc1Y2QTFwUZc8A9oJIuRYokicrc+Ql
 lnVZ6OS4AGXaaHvQelSVk1eVQ==
IronPort-HdrOrdr: A9a23:uQHET6PTcib268BcTs+jsMiBIKoaSvp037BL7SxMoHluGfBw+P
 rAoB1273HJYVQqOE3I6OrgBEDoexq1n/NICOIqTNSftWfdyQ6VBbAnwYz+wyDxXw3Sn9QtsZ
 uIqpIOauHNMQ==
X-Talos-CUID: 9a23:NSkGCGwJrL6AVvKSBFGhBgVNCNAldSD7kU3oKleaTn9ESOG3an+PrfY=
X-Talos-MUID: 9a23:iO7eWQXpjs4UJhfq/AO0ujBlHp5r2KCVGR0GvqUvvIrePyMlbg==
X-IronPort-AV: E=Sophos;i="6.00,204,1681185600"; 
   d="scan'208";a="110275639"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/spec-ctrl: Update hardware hints
Date: Tue, 30 May 2023 16:34:52 +0100
Message-ID: <20230530153452.1123823-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

 * Rename IBRS_ALL to EIBRS.  EIBRS is the term that everyone knows, and this
   makes ARCH_CAPS_EIBRS match the X86_FEATURE_EIBRS form.
 * Print RRSBA too, which is also a hint about behaviour.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/msr-index.h | 2 +-
 xen/arch/x86/spec_ctrl.c             | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 082fb2e0d9ae..12aeb1a93909 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -67,7 +67,7 @@
 
 #define MSR_ARCH_CAPABILITIES               0x0000010a
 #define  ARCH_CAPS_RDCL_NO                  (_AC(1, ULL) <<  0)
-#define  ARCH_CAPS_IBRS_ALL                 (_AC(1, ULL) <<  1)
+#define  ARCH_CAPS_EIBRS                    (_AC(1, ULL) <<  1)
 #define  ARCH_CAPS_RSBA                     (_AC(1, ULL) <<  2)
 #define  ARCH_CAPS_SKIP_L1DFL               (_AC(1, ULL) <<  3)
 #define  ARCH_CAPS_SSB_NO                   (_AC(1, ULL) <<  4)
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 50d467f74cf8..cd5ea6aa52d9 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -409,10 +409,11 @@ static void __init print_details(enum ind_thunk thunk)
      * Hardware read-only information, stating immunity to certain issues, or
      * suggestions of which mitigation to use.
      */
-    printk("  Hardware hints:%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
+    printk("  Hardware hints:%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
            (caps & ARCH_CAPS_RDCL_NO)                        ? " RDCL_NO"        : "",
-           (caps & ARCH_CAPS_IBRS_ALL)                       ? " IBRS_ALL"       : "",
+           (caps & ARCH_CAPS_EIBRS)                          ? " EIBRS"          : "",
            (caps & ARCH_CAPS_RSBA)                           ? " RSBA"           : "",
+           (caps & ARCH_CAPS_RRSBA)                          ? " RRSBA"          : "",
            (caps & ARCH_CAPS_SKIP_L1DFL)                     ? " SKIP_L1DFL"     : "",
            (e8b  & cpufeat_mask(X86_FEATURE_SSB_NO)) ||
            (caps & ARCH_CAPS_SSB_NO)                         ? " SSB_NO"         : "",
-- 
2.30.2


