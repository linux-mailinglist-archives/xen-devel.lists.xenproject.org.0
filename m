Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FD666A6B0
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jan 2023 00:09:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477559.740349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGTAJ-00080e-GG; Fri, 13 Jan 2023 23:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477559.740349; Fri, 13 Jan 2023 23:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGTAJ-0007wo-Bc; Fri, 13 Jan 2023 23:08:51 +0000
Received: by outflank-mailman (input) for mailman id 477559;
 Fri, 13 Jan 2023 23:08:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bX0/=5K=citrix.com=prvs=37021d3d6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pGTAH-00076h-6T
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 23:08:49 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a90c6ee-9397-11ed-b8d0-410ff93cb8f0;
 Sat, 14 Jan 2023 00:08:47 +0100 (CET)
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
X-Inumbo-ID: 3a90c6ee-9397-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673651328;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=+mZ+HqjQOoRFKxUB1RXhTht2/NOUz4Dnfis5QIqIl1c=;
  b=F2BfhEMMJjLiLCGUpO80x3909EiczBsfFutDj35rwomIihvDa+7N6nGa
   9873YTsJvMqMjVeBNgl8NF7AKGuBgI0n/hpi6sy34HpUptFidal8Yoofj
   tCAYBPHlZicxC7irlFQBPrZ0wzCyS6ANF+gdnY+DuXwAIqY+62I9nAKVu
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 92558111
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Um1A0a/vE11O5zuEa7xwDrUDo36TJUtcMsCJ2f8bNWPcYEJGY0x3y
 WoeUGrTPveNMDP2fY11bYzj/R4HucDVx4BnTgM4qi88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmPKkQ5AO2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklp6
 OUjBxkjfyrTuKHx2pOWTOhWockKeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0ExBvF9
 jufpgwVBDlLGMWWkiim40m1g/LmkQzFCaIQObeRo6sCbFq7mTVIVUx+uUGAieKilke0VtZbK
 koV0ikjt64/8AqsVNaVdwK8iG6JuFgbQdU4O+8n7ACAzILE7gDfAXILJhZjQtE7sM49RRQxy
 0SE2djuAFRHoLCTDH6Q6LqQhTezIjQOa38PYzceSgkI6MWlp5s85i8jVf46TvTz1IesX2itn
 XbT9nNWa6gvYdAj8Liixn/urSOW9qeKCRQUywPWZEWox1YsDGK6XLBE+WQ3/N4ZctnCEwbf4
 CNd8ySNxLtQVM/QzURhVM1IRej0vKjdbVUwlHY1R/EcGyKRF2lPlGy6yBV3Pw9XP8kNYlcFi
 2eD6FoKtPe/0JZHBJKbgr5d6Oxwl8AM7fy/CpjpgiNmO/CdjjOv8iB0flK31GvwikUqmqxXE
 c7FLp3yVipKWPw3lWHeqwIhPVgDn3BW+I8ubcqjk0TPPUS2ORZ5tovpwHPRN7tkvctoUS3e8
 spFNtvi9vmseLSWX8UjyqZKdQpiBSFiVfjLRzl/KrbrzvxORDtwVJc8ANoJJ+RYokiivr6Wo
 CDlCxIGkASXaL+uAVziV02PoYjHBf5XxU/X9wR1Vbp08xDPubqS0Zo=
IronPort-HdrOrdr: A9a23:xVet46uF6x1ysNnF9Yw0eF6I7skDeNV00zEX/kB9WHVpm62j+/
 xG+c5x6faaslkssR0b9+xoWpPhfZqsz/9ICOAqVN/JMTUO01HYT72Kg7GSpgHIKmnT8fNcyL
 clU4UWMqyVMbGit7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.97,215,1669093200"; 
   d="scan'208";a="92558111"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: [PATCH v2 5/5] xen/version: Misc style fixes
Date: Fri, 13 Jan 2023 23:08:35 +0000
Message-ID: <20230113230835.29356-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230113230835.29356-1-andrew.cooper3@citrix.com>
References: <20230113230835.29356-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 xen/common/kernel.c  | 11 +++++------
 xen/common/version.c |  4 ++--
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 7ab410ac7c28..f1d4a66d8885 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -1,6 +1,6 @@
 /******************************************************************************
  * kernel.c
- * 
+ *
  * Copyright (c) 2002-2005 K A Fraser
  */
 
@@ -540,7 +540,7 @@ static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
 long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
-    bool_t deny = !!xsm_xen_version(XSM_OTHER, cmd);
+    bool deny = xsm_xen_version(XSM_OTHER, cmd);
 
     switch ( cmd )
     {
@@ -584,7 +584,7 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             return -EFAULT;
         return 0;
     }
-    
+
     case XENVER_platform_parameters:
     {
         const struct vcpu *curr = current;
@@ -623,9 +623,8 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         }
 
         return 0;
-        
     }
-    
+
     case XENVER_changeset:
     {
         xen_changeset_info_t chgset;
@@ -652,7 +651,7 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             if ( VM_ASSIST(d, pae_extended_cr3) )
                 fi.submap |= (1U << XENFEAT_pae_pgdir_above_4gb);
             if ( paging_mode_translate(d) )
-                fi.submap |= 
+                fi.submap |=
                     (1U << XENFEAT_writable_page_tables) |
                     (1U << XENFEAT_auto_translated_physmap);
             if ( is_hardware_domain(d) )
diff --git a/xen/common/version.c b/xen/common/version.c
index d32013520863..8e738672debe 100644
--- a/xen/common/version.c
+++ b/xen/common/version.c
@@ -209,11 +209,11 @@ void __init xen_build_init(void)
             }
         }
     }
-#endif
+#endif /* CONFIG_X86 */
     if ( !rc )
         printk(XENLOG_INFO "build-id: %*phN\n", build_id_len, build_id_p);
 }
-#endif
+#endif /* BUILD_ID */
 /*
  * Local variables:
  * mode: C
-- 
2.11.0


