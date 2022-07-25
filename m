Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ECD5803A9
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 19:51:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374742.606910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG2EB-0004F6-HA; Mon, 25 Jul 2022 17:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374742.606910; Mon, 25 Jul 2022 17:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG2EB-0004Cm-ER; Mon, 25 Jul 2022 17:50:47 +0000
Received: by outflank-mailman (input) for mailman id 374742;
 Mon, 25 Jul 2022 17:50:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=htba=X6=citrix.com=prvs=198305c53=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oG2EA-0004Ce-0S
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 17:50:46 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d5bdcf7-0c42-11ed-bd2d-47488cf2e6aa;
 Mon, 25 Jul 2022 19:50:44 +0200 (CEST)
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
X-Inumbo-ID: 4d5bdcf7-0c42-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658771444;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WISRva/7OJYvlUnuWZvJyWPyAeP97N5JN+mLOlGSdzM=;
  b=hrQrPQzs9GJVfCk4fe9L7GdRfP/A0aFJb2QNzqGU5bKvGkBKbJp0YBEg
   Fbhiyd+knrstn8g/gNqO3+Ku3vvv7U3XupMCn6VSSkX3cnPG3VUlYZ11s
   BZJej9Lv9y2bNuZyKstJP3Knn88wJNitANLknem5DKTrgU6lEp8jGMgP7
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76380120
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QxvQv646aA6FMbXoHhzTVAxRtEPHchMFZxGqfqrLsTDasY5as4F+v
 mofCGGHbqnZNmHzL9p/Ydu/9BgDu8XVz9MwQFE6pHswHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yM6jclkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimUc3l48sfrZ8ksw5qmq4lv0g3RlDRx1lA6G/5UqJMp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+AsBOtiNqtC0qupvXAdJHAathZ5dlqPgqo
 DlFncTYpQ7EpcQgksxFO/VTO3kW0aGrZNYriJVw2CCe5xSuTpfi/xlhJBsTMNUipcgoPXpL8
 u4RBw1QSRrYwO3jldpXSsE07igiBMziPYdZsXB81zDJS/0hRPgvQY2Tu4Uehm1pwJkTQ7COP
 KL1ahI2BPjESzRJNk0aF9QVm+Cwi2OkWzZZtEiUtew85G27IAlZj+a2YIKMIITiqcN9o37Fv
 U/o337AHksWE9Ch7yS53CiUr7qa9c/8cN1LT+DpnhJwu3Wx7GEODBwdVXOgvOK0zEW5Xrp3K
 UMO/TE1hbMv70HtRd74NzWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnNAybSwn0
 BmOhdyBONB0mOTLEzTHrO7S9G7sf3hORYMfWcMaZVEg7oHZ/69ssgnKScRqP5PoqdeuXj6ll
 lhmsxMCa6UvYd8jjvvmrQya32z3/PAlXSZuuFyJAzvNAhdRIdf8Otf2sQWzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF52LJ9k4DMlWfhsBDyr9UWaBj
 LXvkQ1Q/oRPG3ChcLV6ZYm8Y+xzk/WwS4S6CaqENooXCnSUSONg1Hg1DXN8Iki3yBR8+U3BE
 czznTmQ4YYyVv08kWveqxY12r433CEurV7uqWTA503+idK2OS/KIYrpxXPUMYjVGovY/1iOm
 zueXuPWoyhivBrWOHCPqdBJcwFVfBDWx/ne8qRqSwJKGSI+cElJNhMb6ep4E2C5t8y5Ttv1w
 0w=
IronPort-HdrOrdr: A9a23:5DGMXqMSl6LXzMBcTs+jsMiBIKoaSvp037Eqv3oRdfUzSL3/qy
 nOpoV96faaskdzZJhNo7+90cq7MBfhHPxOkOss1N6ZNWGM0gbFEGgL1/qa/9SKIU3DH4Bmu5
 uIC5IObeHNMQ==
X-IronPort-AV: E=Sophos;i="5.93,193,1654574400"; 
   d="scan'208";a="76380120"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH] x86/pv: Inject #GP for implicit grant unmaps
Date: Mon, 25 Jul 2022 18:50:13 +0100
Message-ID: <20220725175013.893-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is a debug behaviour to identify buggy kernels.  Crashing the domain is
the most unhelpful thing to do, because it discards the relevant context.

Instead, inject #GP[0] like other permission errors in x86.  In particular,
this lets the kernel provide a backtrace that's actually helpful to a
developer trying to figure out what's going wrong.

As a bugfix, this always injects #GP[0] to current, not l1e_owner.  It is not
l1e_owner's fault if dom0 using superpowers triggers an implicit unmap.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>

This is a prerequisite to investigating
https://github.com/QubesOS/qubes-issues/issues/7631 which is looking like an
error in Linux's gntdev driver.
---
 xen/arch/x86/mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 5b81d5fbdbb2..b3393385ffb6 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1232,7 +1232,7 @@ void put_page_from_l1e(l1_pgentry_t l1e, struct domain *l1e_owner)
         gdprintk(XENLOG_WARNING,
                  "Attempt to implicitly unmap a granted PTE %" PRIpte "\n",
                  l1e_get_intpte(l1e));
-        domain_crash(l1e_owner);
+        pv_inject_hw_exception(TRAP_gp_fault, 0);
     }
 #endif
 
-- 
2.11.0


