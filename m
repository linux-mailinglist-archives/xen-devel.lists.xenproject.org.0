Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 005A11D60C4
	for <lists+xen-devel@lfdr.de>; Sat, 16 May 2020 14:23:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZvpz-0001a2-KR; Sat, 16 May 2020 12:22:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H74w=66=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jZvpy-0001Zx-NK
 for xen-devel@lists.xenproject.org; Sat, 16 May 2020 12:22:42 +0000
X-Inumbo-ID: eff7eeea-976f-11ea-b07b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eff7eeea-976f-11ea-b07b-bc764e2007e4;
 Sat, 16 May 2020 12:22:41 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7gniSrxD044gQrv0A2IdFq/CQ6dICUMU3MO34jajP54ad8PV7+kNE95XKhEWNHCc776SeKjHOh
 PZhSj8hJvacu3IvAtcxIoAaZ0AACf7cv+c3HSNZEvApQURFV/Lc7sxQaYDwR3PAVlwlKmNFm0J
 lDEcqygUH4v7bXvrVGDjdQL6edovO0dcoxMAsbIGEjO88wfKeRaE/N6ey9af1VoBgae++QBfnh
 g4mZtvvCgSMM0tRsfUJYlySbIiRp1jWuFu9XyOrNZj58N44dQCx+JCf/qCFXtPOIPODLV94UIq
 QxE=
X-SBRS: 2.7
X-MesageID: 17694874
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,398,1583211600"; d="scan'208";a="17694874"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/hvm: Fix memory leaks in hvm_copy_context_and_params()
Date: Sat, 16 May 2020 13:22:21 +0100
Message-ID: <20200516122221.5434-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Any error from hvm_save() or hvm_set_param() leaks the c.data allocation.

Spotted by Coverity.

Fixes: 353744830 "x86/hvm: introduce hvm_copy_context_and_params"
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>

This was the XenServer internal Coverity.  The public one doesn't appear to
have spotted the issue, so no Coverity-ID tag for the fix.
---
 xen/arch/x86/hvm/hvm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 814b7020d8..0a3797ef6e 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5318,7 +5318,7 @@ int hvm_copy_context_and_params(struct domain *dst, struct domain *src)
         return -ENOMEM;
 
     if ( (rc = hvm_save(src, &c)) )
-        return rc;
+        goto out;
 
     for ( i = 0; i < HVM_NR_PARAMS; i++ )
     {
@@ -5328,11 +5328,13 @@ int hvm_copy_context_and_params(struct domain *dst, struct domain *src)
             continue;
 
         if ( (rc = hvm_set_param(dst, i, value)) )
-            return rc;
+            goto out;
     }
 
     c.cur = 0;
     rc = hvm_load(dst, &c);
+
+ out:
     vfree(c.data);
 
     return rc;
-- 
2.11.0


