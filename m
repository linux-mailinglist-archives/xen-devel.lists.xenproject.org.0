Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4FF4B516B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:17:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271983.466772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbE5-000768-CU; Mon, 14 Feb 2022 13:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271983.466772; Mon, 14 Feb 2022 13:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbE5-0006vj-5c; Mon, 14 Feb 2022 13:17:09 +0000
Received: by outflank-mailman (input) for mailman id 271983;
 Mon, 14 Feb 2022 13:17:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb4W-0008IH-3o
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:07:16 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07836415-8d97-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:07:15 +0100 (CET)
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
X-Inumbo-ID: 07836415-8d97-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644844035;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=jps309UDFtvBnS2vB6J17zehQG0mfCWoSwDISbfAtm8=;
  b=WkuQcdxDcNY2e0oa0OuLTpkOrEvR4Spbijk1YRlzjPkITWY2AXz69vCk
   Eu48qIUarVrFhHR8vBrxSHVtNrF2cWpxJf3tA8mox0OYqsd2qm6q8zemh
   lIiulFDG7ELVSB4V/ZXB35Ym4A7kISoUMAQ32vS0h+xtdEdcukV+2G0Li
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ko5IQb6bZCnugSJnIDF7eW4dHGG87aQ4j7t+iJ8PKixd8YXLxGStcqqRJ079tgSQbu1uCvS29m
 cmwCzXTcqn0BIlQ6fKCJNjAMPzVETEUYaIz0SS81HaCvT4E55eCrhZKHn95eAi7XhSIwoPIcyh
 DR+UWluqr0Bt9E4r+sq+WycE6ZMYUH2SnySRKW/eFfhSuEkXYw4TKl4Qp404/DPJOE4lAtNp9O
 EmovnB4DBZeS9BJdNLQ7YBEZR13yCi70pRJkxb0ALd3gKfZHWryp89un8+9/frkbEXXE/aPFQQ
 mjvCPs7YHaq64ntxY1DwCasM
X-SBRS: 5.1
X-MesageID: 64554392
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FD0i26leoa/36sBGXLEXd0jo5gyZIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJDWiOPPrfYjT8eYslboTi90sCscPWx4UySAtk+C0wFSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2Nc02YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PMVjJ2tZiwiB5Hv3+A3VwZHDQZ3B7ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6qDO
 pZCOGAHgBLoShllY3MFAYMFwfr4wXTBTid9q2+enP9ii4TU5FMoi+W8WDbPQfSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTZW4JPOTmrLgw2gTVnzFNTk1NPbemnRWnomjmYtNCB
 GcfwxYN6qwY8FO0UP70ZQLt9RZooSUgc9ZXFuQ77iSExazV/xuVCwA4c9JRVDA1nJRoHGJ3j
 zdli/usXGUy6+PNFRpx45/J9WvaBMQDEYMVicbopyMh6sKrnow8hwmnoj1LQP/s1Y2d9d0dL
 lm3QMkCa1c70JRjO0aTpwmvb9eQSn/hFFBd2+kvdjj5hj6Vnab8D2BS1XDV7OxbMKGSRUSbs
 X4PlqC2tb5SUc7dxHHQGLxWRtlFAspp1xWG3zZS82QJrWzxqxZPg6gMiN2BGKuZGpldImK4C
 KMikQhQ+IVSLBOXgVxfOOqM5zAR5fG4T7zND6mMBvIXO8QZXFLXrUlGOB/Lt0iwwRdErE3KE
 crCGSpaJS1BUvoPIfvfb7p17ILHMQhgmTKNFcijlUzPPHj3TCf9dIrp+WCmNogRhJ5oai2Mr
 I432xKix0oNXevgTDPQ9IJPf1kGIWJiXcL9qtBNd/7FKQ1jQTlzB/jUyLInWopkg6UKybuYo
 iDjAhdVmAjlmHnKCQSWcXQ/Ornhaoly8CAgNis2MFf2h3V6OdSz7L0SfoccdKU88LAx1uZ9S
 vQIIp3SAvlGRjnd1S4aaJ3x8N5reBix3FrcNCu5ejkvOZVnQlWRqNPjewLu8ggIDza26pRi8
 +HxiFuDTMNaFQp4DcvQZPa+9H+LvCAQyLBoQk/FAthPY0GwooJkHDP8060sKMYWJBSdmjbDj
 1SKAQ0VrPXmqpMu9IWbnriNqoqkHrcsHkdeGGWHv7+6OTODozimyI5EFu2JYSrcRCX//6D7P
 bdZyPT1MfsmmldWstUjT+Y3nPxmv9a/9aVHyglEHWnQawX5A7xtFXCKwM1Tu/Af3bReowa3B
 hqC99Qy1W9l4y85/Ir9/DYYU9k=
IronPort-HdrOrdr: A9a23:Dc6u8qGNS2/7soq6pLqE6seALOsnbusQ8zAXP0AYc3Jom62j5r
 mTdZsgtSMc5Ax8ZJhko6HkBEDiewK7yXcW2/hzAV7KZmCP0wHEEGgh1/qH/9SJIVyYygc378
 ZdmsZFZ+EYdWIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64554392"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 62/70] x86/alternatives: Clear CR4.CET when clearing CR0.WP
Date: Mon, 14 Feb 2022 12:51:19 +0000
Message-ID: <20220214125127.17985-63-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

This allows us to have CET active much earlier in boot.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/alternative.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 436047abe021..ec24692e9595 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -333,9 +333,13 @@ static int __init cf_check nmi_apply_alternatives(
      */
     if ( !(alt_done & alt_todo) )
     {
-        unsigned long cr0;
+        unsigned long cr0, cr4;
 
         cr0 = read_cr0();
+        cr4 = read_cr4();
+
+        if ( cr4 & X86_CR4_CET )
+            write_cr4(cr4 & ~X86_CR4_CET);
 
         /* Disable WP to allow patching read-only pages. */
         write_cr0(cr0 & ~X86_CR0_WP);
@@ -345,6 +349,9 @@ static int __init cf_check nmi_apply_alternatives(
 
         write_cr0(cr0);
 
+        if ( cr4 & X86_CR4_CET )
+            write_cr4(cr4);
+
         alt_done |= alt_todo;
     }
 
-- 
2.11.0


