Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C45A645F64E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 22:24:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233495.405168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqigp-0007bW-7O; Fri, 26 Nov 2021 21:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233495.405168; Fri, 26 Nov 2021 21:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqigp-0007YL-1c; Fri, 26 Nov 2021 21:23:27 +0000
Received: by outflank-mailman (input) for mailman id 233495;
 Fri, 26 Nov 2021 21:23:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqigm-00072N-Lo
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 21:23:24 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 151e8664-4eff-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 22:23:23 +0100 (CET)
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
X-Inumbo-ID: 151e8664-4eff-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637961803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TxAJc2n5PichyDyTiJejXWJBeWozzwZwjnnnvWmbitg=;
  b=UvsiO30K7HZMrHMaI1Uear0VAHI09ThoO88IPK0nMiX/KM+vjROmrEgk
   sMbOoTCjf3sKV7V5UhVjn1VmkWTEYL/V9m+2ZCX5rPxTRR3f0a2lU44jJ
   5nJiJ/jkG84Qp3g+o/VTrh2ysN1PRIfG3AZuHFvwQSSPJ/+DIuTSRLY66
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 5f1fTgV3jtzARWkmShZjdlhoOKf4lvyJweJmWy4u7qpfnvwb0QMoTHutJpiVy1tLruQ0kLowCX
 QANQhL2DgUSCXKh9WyZpoqozyoVupj1HXeYYuo2hR22FSGVvCwgqu5UFHwup9MOJ7B46EhQeF9
 n8G1BZKiBSEcxYICY2ayPaW9CJHDL+iGAuU1RxGuFgFxZCNqz6T7x7KoehoXd8vGpRruUb5Z3K
 ZwBKD6JBOAESxEuwgZKoZt2YM91d+am4OENkHEErOU4lptzsndHUdolZ/DYx2MYmci5ClvLH+W
 qyrfBG5ypP5uslCM13GbEetK
X-SBRS: 5.1
X-MesageID: 58217721
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Sicw26IlZVfo7LouFE+RHJIlxSXFcZb7ZxGr2PjKsXjdYENSgTNWy
 GBOWG/SPvaMa2b1KIx2aN7k8UwGsZ/UxoVgGwJlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es5xbZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2skot+z
 O4TsqaAVD0bBoL8or0veDVxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gpg3JkRQqyHD
 yYfQWVQL0maWzlMA2gOGdU4ktelr1r4MDIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wh
 EjL4mD4CREyL8GExHyO9XfErv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCsmxNHVN5rTeoA2By3+JL70zzANEMoZ2sUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZo87SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFRON7Ni2+AswGzARN8wGCxFAHpU
 J8swZX20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Lv2AjfRoyaJxaJlcFh
 XM/XysLv/e/21PwMMdKj3+ZUZx2ncAM6/y5PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1ulAv7GMGgpzz6gOX2WZJgYepcWLd4Rrtit/3sTcS82
 4s3CvZmPD0DCrCjOXeOrtZIRb3IRFBiba3LRwVsXrbrCmJb9KsJUZc9GJstJN5ombp7jODN8
 i3vU0NU0gOn13bGNR+LejZob7a2BcRzqncyPCoNO1e02id8PdbzvflHL5ZnL6M68OFDzOJvS
 6VXccu3HfkSGC/M/C4QbMehodU6Jgirnw+HIwGsfCM7I8x7XwXM99K9Jlnv+SACAzCZr8w7p
 7H8hArXTYBaH1ZpDdrMaeLpxFS05CBPlOV3VkrOA99SZESzr9Q6d32v1qc6epheJw/Cyz2W0
 xetLS0Z/eSd8ZUo9NTphLyfq9v7GeVJAUcHTXLQ6qy7NHeG8zP7k5NASuuBYRvUSHjwpPe5f
 exQwvzxbK8HkVJNv9YuGrpn1/tjtd7mprscxQV4BnTbKV+sD+o4cHWB2MBOsIxLx6NY5lTqC
 h7epIECNOXbIt7hHX4QOBEhP7aK2vwjkzXP6eg4fRfh7yht8bvbCUhfMnFgUsCGwGeZ5G/9/
 dochQ==
IronPort-HdrOrdr: A9a23:EISlL61TjzCrMG8ePL4QGQqjBIgkLtp133Aq2lEZdPRUGvb4qy
 nIpoVi6faUskdpZJhOo6HiBEDtexzhHNtOkO0s1NSZLW/bUQmTXeNfBOLZqlWKcUCTygce79
 YGT0EXMqyKMbEQt6bHCWeDferIuOP3lZyVuQ==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58217721"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/4] x86/altcall: Check and optimise altcall targets
Date: Fri, 26 Nov 2021 21:22:55 +0000
Message-ID: <20211126212258.7550-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126212258.7550-1-andrew.cooper3@citrix.com>
References: <20211126212258.7550-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When converting indirect to direct calls, there is no need to execute endbr64
instructions.  Detect and optimise this case, leaving a warning in the case
that no endbr64 was found, as it likely indicates a build error.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/alternative.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index ec24692e9595..5ae4c80d5119 100644
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
@@ -279,6 +280,27 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
 
                 if ( dest )
                 {
+                    /*
+                     * When building for CET-IBT, all function pointer targets
+                     * should have an endbr64 instruction.
+                     *
+                     * If this is not the case, leave a warning because
+                     * something is wrong with the build.
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


