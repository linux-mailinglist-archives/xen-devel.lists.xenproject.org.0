Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 644BD632633
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 15:38:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446652.702356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox7vb-0005DA-Bu; Mon, 21 Nov 2022 14:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446652.702356; Mon, 21 Nov 2022 14:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox7vb-00059x-89; Mon, 21 Nov 2022 14:37:43 +0000
Received: by outflank-mailman (input) for mailman id 446652;
 Mon, 21 Nov 2022 14:37:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5PF=3V=citrix.com=prvs=31798088b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ox7vZ-0004fJ-0C
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 14:37:41 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c986450-69aa-11ed-8fd2-01056ac49cbb;
 Mon, 21 Nov 2022 15:37:39 +0100 (CET)
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
X-Inumbo-ID: 0c986450-69aa-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669041459;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=EOhf4hatGmnjIQxVt5++g1lD6WQQosxGmgv1LZ7z5fo=;
  b=eK1oDvPIwQeJ3+BpO+YBHJriaQEyNvEj0RYVsw7PoepQm9lvhGnLRGlA
   Pv2bGAecv1JYIrfMdMpiv5/97bdX6p6YZB+Cwj6C/ZAfhTnul/jO1GoTJ
   YQlMRrqvxColqPviJetjAhg6LZYUeCXBD5lI09tDzkmyE9oId/KNe7r8/
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 85675817
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xqAwXqgw6BT1X8eHNW5fg4G2X161VxAKZh0ujC45NGQN5FlHY01je
 htvW2rTa67fMWqkftp/PI21pBsGuZfTytFqSVNq+ypmQiMb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5QWHzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ0LgoKd0mJp9uwybK+S8xChMsPHPnSadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQthbF+
 D2brz2mav0cHPKuyRTb9lzrvcqMjQnkab0MNue39sc/1TV/wURMUUZLBDNXu8KRhlalXtNDK
 2Qd4ic0sbUp70uvU8X8WBuj5nWDu3Y0WdNWH/cr9QKlxa/d4gLfDW8BJhZhZdo8pYkJTDol/
 laTmpXiAjkHmK2YTzeR+6mZqRu2ODMJNikSaCkcVwwH7tL/5oYpgXrnQtlvHaGvh/XpCDrwx
 HaMtyF4iLIN5fPnzI3iowqB2Wj14MGUEEhlvW07Q15J8CtVYrSiftWiyWHd5PZFLaO3TFatj
 Eg9zp32AP81MbmBkymEQeMoFb6v5uqYPDC0vWODD6XN5Bz2pSf9INk4DCVWYR4wb51aIWOBj
 Fr741s52XNFAJe9gUabiaqVAt9i86XvHM+Nuhv8PosXOcgZmONqEUhTia+sM4PFyhJEfUQD1
 XCzL66R4Y4yU/gP8dZPb751PH9C7nlWKZnvbZ761Q+79rGVeWSYT7wIWHPXML5pvf3V+l6Jr
 Y4DXydv9/m4eLSvChQ7DKZJdQxaRZTFLc2eRzNrmh6rfVM9RTBJ5w75yrI9YY1195m5Zc+Rl
 kxQmyZwljLCuJEwAV/UMS8yMO+zA8sXQLBSFXVEAGtEEkMLOe6HhJrzvbNuFVX73ISPFcJJc
 sQ=
IronPort-HdrOrdr: A9a23:6m9Yhazw/I1oH7Nsel14KrPwLL1zdoMgy1knxilNoRw8SKOlfq
 GV7ZImPHDP6Qr5NEtMpTnEAtjjfZq+z+8T3WByB9eftWDd0QPCRr2Kr7GSpgEIcxeOktK1vp
 0PT0ERMrHN5CBB/KXH3DU=
X-IronPort-AV: E=Sophos;i="5.96,181,1665460800"; 
   d="scan'208";a="85675817"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>, Jason
 Andryuk <jandryuk@gmail.com>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH 2/2] xen/flask: Wire up XEN_DOMCTL_{get,set}_paging_mempool_size
Date: Mon, 21 Nov 2022 14:37:31 +0000
Message-ID: <20221121143731.27545-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221121143731.27545-1-andrew.cooper3@citrix.com>
References: <20221121143731.27545-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

These were overlooked in the original patch, and noticed by OSSTest which does
run some Flask tests.

Fixes: 22b20bd98c02 ("xen: Introduce non-broken hypercalls for the paging mempool size")
Suggested-by: Daniel Smith <dpsmith@apertussolutions.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
CC: Daniel Smith <dpsmith@apertussolutions.com>
CC: Jason Andryuk <jandryuk@gmail.com>
CC: Henry Wang <Henry.Wang@arm.com>

It should be noted that the original XSA-409 fix broke Flask on ARM but no
testing noticed.  c/s 7c3bbd940dd8 ("xen/arm, libxl: Revert
XEN_DOMCTL_shadow_op; use p2m mempool hypercalls") "fixes" the original
breakage and introduced this breakage instead.

For 4.17.  It's a fix for an issue that OSSTest is currently blocking as a
regression.
---
 tools/flask/policy/modules/dom0.te  | 3 ++-
 tools/flask/policy/modules/xen.if   | 2 +-
 xen/xsm/flask/hooks.c               | 6 ++++++
 xen/xsm/flask/policy/access_vectors | 4 ++++
 4 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/flask/policy/modules/dom0.te b/tools/flask/policy/modules/dom0.te
index f710ff9941c0..f1dcff48e227 100644
--- a/tools/flask/policy/modules/dom0.te
+++ b/tools/flask/policy/modules/dom0.te
@@ -35,7 +35,8 @@ allow dom0_t dom0_t:domain {
 	setvcpucontext max_vcpus setaffinity getaffinity getscheduler
 	getdomaininfo getvcpuinfo getvcpucontext setdomainmaxmem setdomainhandle
 	setdebugging hypercall settime setaddrsize getaddrsize trigger
-	getpodtarget setpodtarget set_misc_info set_virq_handler
+	getpodtarget setpodtarget getpagingmempool setpagingmempool set_misc_info
+	set_virq_handler
 };
 allow dom0_t dom0_t:domain2 {
 	set_cpu_policy gettsc settsc setscheduler set_vnumainfo
diff --git a/tools/flask/policy/modules/xen.if b/tools/flask/policy/modules/xen.if
index 424daab6a022..6b7b7d403ab4 100644
--- a/tools/flask/policy/modules/xen.if
+++ b/tools/flask/policy/modules/xen.if
@@ -92,7 +92,7 @@ define(`manage_domain', `
 	allow $1 $2:domain { getdomaininfo getvcpuinfo getaffinity
 			getaddrsize pause unpause trigger shutdown destroy
 			setaffinity setdomainmaxmem getscheduler resume
-			setpodtarget getpodtarget };
+			setpodtarget getpodtarget getpagingmempool setpagingmempool };
     allow $1 $2:domain2 set_vnumainfo;
 ')
 
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 391aec4dc221..78225f68c15c 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -822,6 +822,12 @@ static int cf_check flask_domctl(struct domain *d, int cmd)
     case XEN_DOMCTL_get_cpu_policy:
         return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__GET_CPU_POLICY);
 
+    case XEN_DOMCTL_get_paging_mempool_size:
+        return current_has_perm(d, SECCLASS_DOMAIN, DOMAIN__GETPAGINGMEMPOOL);
+
+    case XEN_DOMCTL_set_paging_mempool_size:
+        return current_has_perm(d, SECCLASS_DOMAIN, DOMAIN__SETPAGINGMEMPOOL);
+
     default:
         return avc_unknown_permission("domctl", cmd);
     }
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
index 6359c7fc8757..4e6710a63e1b 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -180,6 +180,10 @@ class domain
     set_misc_info
 # XEN_DOMCTL_set_virq_handler
     set_virq_handler
+# XEN_DOMCTL_get_paging_mempool_size
+    getpagingmempool
+# XEN_DOMCTL_set_paging_mempool_size
+    setpagingmempool
 }
 
 # This is a continuation of class domain, since only 32 permissions can be
-- 
2.11.0


