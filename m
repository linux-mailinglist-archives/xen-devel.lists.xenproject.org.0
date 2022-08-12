Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B93675914DA
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 19:35:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385821.621578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMYXy-0005FA-9L; Fri, 12 Aug 2022 17:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385821.621578; Fri, 12 Aug 2022 17:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMYXy-0005CY-6F; Fri, 12 Aug 2022 17:34:10 +0000
Received: by outflank-mailman (input) for mailman id 385821;
 Fri, 12 Aug 2022 17:34:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hyho=YQ=citrix.com=prvs=2169cd8bb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oMYXw-0005CS-Qm
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 17:34:08 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6182de2-1a64-11ed-924f-1f966e50362f;
 Fri, 12 Aug 2022 19:34:06 +0200 (CEST)
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
X-Inumbo-ID: f6182de2-1a64-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660325646;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=21FwaPHJw4CnmbhoINqS1ZwiJVXEkaVCTRaLsZ2601E=;
  b=FYAHLJwKKrzptY51Kbt0EiKIjsdUsq7No0E8kgc7OMQ7nkesKllE6YG1
   mUhM9EKZPJLM/cXpRIVCaX1fhtNjKyGQ/7pt1JQcTC8Uv2DQq+out153c
   McTsg8xUuMp7aopAu6pg1NJjMPIgFjsliI7lhnQHneYgw5gYl0Rc67LLV
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77734063
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2fN/m66Ibxz5LbwDh8IVegxRtFHHchMFZxGqfqrLsTDasY5as4F+v
 jRNUD2EOfneY2uheNBxYNm+pBkH6pPWzNQwGlRpr3hjHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yM6jclkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimUc3l48sfrZ8ks/5a6q4lv0g3RlDRx1lA6G/5UqJMp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+AsBOtiNqtC0qupvXAdJHAathZ5dlqPgqo
 DlFncTYpQ7EpcQgksxFO/VTO3kW0aGrZNYriJVw2CCe5xSuTpfi/xlhJEYtOIwSx99bPUcU1
 uEScAIRZRukue3jldpXSsE07igiBMziPYdZsXB81zDJS/0hRPgvQY2Tu4Uehm1pwJkTQ7COP
 KL1ahI2BPjESzRJNk0aF9QVm+Cwi2OkWzZZtEiUtew85G27IAlZj+eya4aNJIfiqcN9n2ak/
 Hjj+UHAUi4IJMHC2TG0ry2cmbqa9c/8cN1LT+DpnhJwu3WMwkQDBRtQUkG0ydGboEOjX9NUK
 2QP5zEj66M18SSDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJgOtc/R/6pVwH2Zzk
 AbUwZW5XlSDrYF5V1qa7bKVpw6LFRQzd0wfb3c2UQAOxOfs9dRbYg30cjpzLEKkpoSrR2mqk
 27a/XVWa6Y71pBSifjilbzTq3f1/8WSEFZojunCdjj9hj6VcrJJcGBBBbLzyf9bZLiUQVCa1
 JTvs5jPtbteZX1hecHkfQnsIF1Kz6zcWNEkqQQzd6TNDhz0k5JZQahe4StlOGBiOdsedDnib
 Sf74F0PvMYOYib6N/AnOupd7vjGKoC+fekJq9iONoYeCnSPXFbvEN5Sib64gDm2zRlEfVAXM
 paHa8e8ZUsn5VBc5GPvH481jO50rh3SMEuJGvgXOTz7jufFDJNUIJ9ZWGazghcRtfnV/ViKo
 okAaqNnCXx3CYXDX8UeyqZLRXhiEJTxLcmtwyCLXoZv+jZbJVw=
IronPort-HdrOrdr: A9a23:TR9V5K2ryysm5eQ/StQVNAqjBLwkLtp133Aq2lEZdPRUGvb4qy
 nIpoV86faUskd3ZJhOo6HiBEDtexzhHP1OkO0s1NWZLWvbUQKTRekIh+aP/9SJIVyGygc378
 ddmsZFZuEYdWIK6PrH3A==
X-IronPort-AV: E=Sophos;i="5.93,233,1654574400"; 
   d="scan'208";a="77734063"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/traps: Make nmi_show_execution_state() more useful
Date: Fri, 12 Aug 2022 18:33:22 +0100
Message-ID: <20220812173322.2222-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

 * Always emit current.  It's critically important.
 * Do not render (0000000000000000) for the symbol in guest context.  It's
   just line-noise.  Instead, explicitly identify which Xen vs guest context.
 * Try to tabulate the data, because there is often lots of it.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/traps.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index b713ef7e77ce..95ef59c93bcd 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -768,8 +768,14 @@ static int cf_check nmi_show_execution_state(
     if ( opt_show_all )
         show_execution_state(regs);
     else
-        printk(XENLOG_ERR "CPU%d @ %04x:%08lx (%pS)\n", cpu, regs->cs,
-               regs->rip, guest_mode(regs) ? NULL : _p(regs->rip));
+    {
+        if ( guest_mode(regs) )
+            printk(XENLOG_ERR "CPU%d\t%pv\t%04x:%p in guest\n",
+                   cpu, current, regs->cs, _p(regs->rip));
+        else
+            printk(XENLOG_ERR "CPU%d\t%pv\t%04x:%p in Xen: %pS\n",
+                   cpu, current, regs->cs, _p(regs->rip), _p(regs->rip));
+    }
     cpumask_clear_cpu(cpu, &show_state_mask);
 
     return 1;
-- 
2.11.0


