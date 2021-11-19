Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7C1456FCF
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 14:44:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227951.394399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4Br-0000Sp-3Z; Fri, 19 Nov 2021 13:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227951.394399; Fri, 19 Nov 2021 13:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4Bq-0000Px-Vx; Fri, 19 Nov 2021 13:44:30 +0000
Received: by outflank-mailman (input) for mailman id 227951;
 Fri, 19 Nov 2021 13:44:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kvWs=QG=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mo4Bp-0000Pm-Iz
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 13:44:29 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf75a8c5-493e-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 14:44:27 +0100 (CET)
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
X-Inumbo-ID: cf75a8c5-493e-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637329467;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8gzb+RjcBp+fvaX5Uw6nHwqjnmxvrj4+nHvVFlvmWQw=;
  b=HqKQDbON8Hhr/iH5NL6+jRnUJ7XH9GecNXuYI9URSCCY8a25K+bdCLTV
   BE7yxRBLUO9ayXbEr3EBjy91mAyc7Ja4lW5EVvb8ElqEOIjof/BOu7xLf
   vwUnbh9Yufx7T3k1Ud3gE8OrkPMr0+/rIlOf3LHzWi7yydvaYaMgC3mMn
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 7cMpZqhf7chRG0om382q0thZdl12EA2gqks17noy6+a1253QW8jdKqE/fjtv3L+f+D1tscSDYd
 bqIf6hmYKW0/j6DZzJ6SC5hkQfYqM+Ux0ufKOC2tUK2yA8QuZwofwQK9We+ENt2n+XN26id2W9
 jpcFIfkr9sxDQNNaweAiG2qW/xWexTEFvHysgmnXZXqN4Ek7gYG+EUPHupTAbR8tGt6xFc7V0K
 xYvzkQ1BrqDkttlR/V0bSpPtbJqV3HBjvRpN+UZ8sENqbkmBWkAEiepIggQhq6ZRURXojxhVyC
 fcmLhp3mld61zaZ9RCJsSvl8
X-SBRS: 5.1
X-MesageID: 60208877
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KlaVLaOQ8IQebcjvrR1okMFynXyQoLVcMsEvi/4bfWQNrUp31DdTz
 mBJUWnSOf/eYDbxKt1xa4iz/UhSuJWDnIVrTwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Esyw7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoyyVw9RJx
 exrjIW5FUAVb5PzgN0TUQYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgm9q3pAeQqm2i
 8wxUjddK03gPEB0B0pIJpACpsWOmUTkWmgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m66j
 G/b+2XyAjkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvladokIYY9dpNdQj4V3K9vvq3B6gCGobG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnF447SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCslO+ZJhKTysDA3CMqsyq7DEzFtW
 1BexaCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9sPum8mdRc0b5ZYEdMMX
 KM1kVkMjHO0FCH0BZKbnqrrU5h6pUQePYqNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3BvrUuOFMuT50n2jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid940kFDbClPHCIqdV7wJJjBSFTOK0aYvd/LoarSjeK0kl7YxMI6b9+KYFjgYpPkeLEo
 iO0VkNCkQKtjnzbMwSaLHtkbeq3D5p4qHs6Ow0qPEqphCd/Mdr+sv9HestlZ6Qj+cxi0eVwE
 6sPdfKfD6kdUT/A4TkcM8Xw9dQwaBSxiAuSFCO5ezxjLYV4TgnE94a8LAvi/SUDFAStss46r
 +Hy3w/XW8NbFQ9jENzXeLSkyFbo5SoRn+d7Xk3pJNhPeRqzrNg2enKp1vJuepMCMxTOwDeex
 j26OxZAqLmfuZIx/fnImbuA89WjHdxhExcIBGLc97u3a3XXpzLx3Y9aXe+UVjnBT2eoqr66b
 OBYwvygYv0KmFFG79h1H7pxlP9s4tLuo/lRzxh+HWWNZFOuU+syLn6D1MhJl6tM2r4G5lfmB
 hPRooFXaeeTJcfoMF8NPw50PO2M2MYdliTW8flocl7x4zV6/ebfXEhfV/VWZPex8Feh3FsZ/
 Noc
IronPort-HdrOrdr: A9a23:JOQbKKOku3+HHsBcTs+jsMiBIKoaSvp037Eqv3oRdfUzSL3/qy
 nOpoV96faaskdzZJhNo7+90cq7MBfhHPxOkOss1N6ZNWGM0gbFEGgL1/qa/9SKIU3DH4Bmu5
 uIC5IObeHNMQ==
X-IronPort-AV: E=Sophos;i="5.87,247,1631592000"; 
   d="scan'208";a="60208877"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jane Malalane
	<jane.malalane@citrix.com>
Subject: [PATCH] x86/dom0: Fix command line parsing issues with dom0_nodes=
Date: Fri, 19 Nov 2021 13:44:16 +0000
Message-ID: <20211119134416.1110-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is a simple comma separated list, so use the normal form.

 * Don't cease processing subsequent elements on an error
 * Do report -EINVAL for things like `dom0_nodes=4foo`
 * Don't opencode the cmdline_strcmp() helper

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jane Malalane <jane.malalane@citrix.com>
---
 xen/arch/x86/dom0_build.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index fe24e11b37fb..5a7441ed5b79 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -169,30 +169,37 @@ bool __initdata dom0_affinity_relaxed;
 
 static int __init parse_dom0_nodes(const char *s)
 {
+    const char *ss;
+    int rc = 0;
+
     do {
+        ss = strchr(s, ',');
+        if ( !ss )
+            ss = strchr(s, '\0');
+
         if ( isdigit(*s) )
         {
+            const char *endp;
+
             if ( dom0_nr_pxms >= ARRAY_SIZE(dom0_pxms) )
-                return -E2BIG;
-            dom0_pxms[dom0_nr_pxms] = simple_strtoul(s, &s, 0);
-            if ( !*s || *s == ',' )
-                ++dom0_nr_pxms;
+                rc = -E2BIG;
+            else if ( (dom0_pxms[dom0_nr_pxms] = simple_strtoul(s, &endp, 0),
+                       endp != ss) )
+                rc = -EINVAL;
+            else
+                dom0_nr_pxms++;
         }
-        else if ( !strncmp(s, "relaxed", 7) && (!s[7] || s[7] == ',') )
-        {
+        else if ( !cmdline_strcmp(s, "relaxed") )
             dom0_affinity_relaxed = true;
-            s += 7;
-        }
-        else if ( !strncmp(s, "strict", 6) && (!s[6] || s[6] == ',') )
-        {
+        else if ( !cmdline_strcmp(s, "strict") )
             dom0_affinity_relaxed = false;
-            s += 6;
-        }
         else
-            return -EINVAL;
-    } while ( *s++ == ',' );
+            rc = -EINVAL;
 
-    return s[-1] ? -EINVAL : 0;
+        s = ss + 1;
+    } while ( *ss );
+
+    return rc;
 }
 custom_param("dom0_nodes", parse_dom0_nodes);
 
-- 
2.11.0


