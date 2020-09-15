Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A67E26AB3F
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 19:55:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIF9q-00028k-At; Tue, 15 Sep 2020 17:54:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UWTi=CY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kIF9p-00028f-D4
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 17:54:21 +0000
X-Inumbo-ID: b5078672-ffb9-4dc7-aeac-bf9d97f1c738
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5078672-ffb9-4dc7-aeac-bf9d97f1c738;
 Tue, 15 Sep 2020 17:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600192460;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cYgBo/legRsmshzadjlD/9u0F4bjdpl5whL/oK3wf5Q=;
 b=UROpqpA4+TZ3HOi134gdzm7f9JaW8qtD0rvPo1KXWytqLcyNUlrfXD08
 YmeE3sYJ5eVibgxSZKob25TeXAQxgwHQMwSho3dOStPE9sHkJRfDOKz6e
 Wir9GXgoheUyG0m0bioj2Htk+VpJ71ikLlSgZV28NbLjW2gqXeFGQomh9 E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: puOSgV0rpfkqzd0vZVPnNk79HLXGm5UGSYps9mX2ER5YWeQwtd4XP+QhIPTJQqBrQrZ4Me0ga9
 C6h9xwVopDzcfdF6+ujzoSf0YTaXoGlIX+1vohrtO/S0LpWpOqYaUmTfz7MeJVhznjmCphFvz2
 ku6mHy8DMGN2jtQ9PlTFoX2QYMBlsTXiuvbz1dCdSYpvBWw2RZ2/uwQdzz79ZbFOwJicFJi2r9
 97k2i766C23T8f97yvrHdYJt0NabQMm8Hcm5c8VfSvOJZw8g1U1DpllATxUpgILpbql8wsKOtK
 rYE=
X-SBRS: 2.7
X-MesageID: 26760908
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,430,1592884800"; d="scan'208";a="26760908"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/mm: Simplify expression in set_gpfn_from_mfn()
Date: Tue, 15 Sep 2020 18:53:55 +0100
Message-ID: <20200915175355.32361-1-andrew.cooper3@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Coverity points out that the "d &&" is redundant.

Fixes: c9476c4ad72 ("x86: don't override INVALID_M2P_ENTRY with SHARED_M2P_ENTRY")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/x86_64/mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 0d1aadbfce..4c0a3a275c 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1336,7 +1336,7 @@ void set_gpfn_from_mfn(unsigned long mfn, unsigned long pfn)
     {
         const struct domain *d = page_get_owner(mfn_to_page(_mfn(mfn)));
 
-        if ( d && (d == dom_cow) )
+        if ( d == dom_cow )
             entry = SHARED_M2P_ENTRY;
     }
 
-- 
2.11.0


