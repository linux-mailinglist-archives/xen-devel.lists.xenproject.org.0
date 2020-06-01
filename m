Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9151EA55E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 15:54:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfktY-0002Gh-Rz; Mon, 01 Jun 2020 13:54:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ele=7O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jfktX-0002GY-D6
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 13:54:27 +0000
X-Inumbo-ID: 67c38028-a40f-11ea-ab1d-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67c38028-a40f-11ea-ab1d-12813bfff9fa;
 Mon, 01 Jun 2020 13:54:26 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4qt90VmACEPxtLEgjd+wGQwkhHFgATKLovXG0ynly1zRDj7WrmW/W0blK63cKyHDinM669+Ubb
 FrfZMH+NTlS8oriz16y3K5dciQ/MBzZ+u58ZQw5J0RxIHnB8QD+S8TQghNeedCabEV1wUtu2uK
 FGpVh1l+MCYedB2sqm5iBL/IcpzmAF2xiJGROuN3Ix8gMMGQfoNDT8iIt6eHvgDa2SE2clruoV
 9xkn27QDFx+zpcB3v572iwdVAImHcD5KCZwf17uO001kYr9qd8L4ixhBqa6kKzMKS4EzFLb0si
 2Hc=
X-SBRS: 2.7
X-MesageID: 19215687
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,461,1583211600"; d="scan'208";a="19215687"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v3 1/2] x86/mm: do not attempt to convert _PAGE_GNTTAB to a
 boolean
Date: Mon, 1 Jun 2020 15:53:24 +0200
Message-ID: <20200601135325.34156-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200601135325.34156-1-roger.pau@citrix.com>
References: <20200601135325.34156-1-roger.pau@citrix.com>
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
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Clang 10 complains with:

mm.c:1239:10: error: converting the result of '<<' to a boolean always evaluates to true
      [-Werror,-Wtautological-constant-compare]
    if ( _PAGE_GNTTAB && (l1e_get_flags(l1e) & _PAGE_GNTTAB) &&
         ^
xen/include/asm/x86_64/page.h:161:25: note: expanded from macro '_PAGE_GNTTAB'
#define _PAGE_GNTTAB (1U<<22)
                        ^

Remove the conversion of _PAGE_GNTTAB to a boolean and instead use a
preprocessor conditional to check if _PAGE_GNTTAB is defined.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v2:
 - Add comment.

Changes since v1:
 - Use a preprocessor conditional.
---
 xen/arch/x86/mm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 53e3dcb2d4..e376fc7e8f 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1235,8 +1235,14 @@ void put_page_from_l1e(l1_pgentry_t l1e, struct domain *l1e_owner)
      *
      * (Note that the undestroyable active grants are not a security hole in
      * Xen. All active grants can safely be cleaned up when the domain dies.)
+     *
+     * NB: the preprocessor conditional is required in order to prevent clang's
+     * -Wtautological-constant-compare complaining about converting the result
+     * of a << into a bool is always true if it's evaluated directly in the if
+     * condition.
      */
-    if ( _PAGE_GNTTAB && (l1e_get_flags(l1e) & _PAGE_GNTTAB) &&
+#if _PAGE_GNTTAB
+    if ( (l1e_get_flags(l1e) & _PAGE_GNTTAB) &&
          !l1e_owner->is_shutting_down && !l1e_owner->is_dying )
     {
         gdprintk(XENLOG_WARNING,
@@ -1244,6 +1250,7 @@ void put_page_from_l1e(l1_pgentry_t l1e, struct domain *l1e_owner)
                  l1e_get_intpte(l1e));
         domain_crash(l1e_owner);
     }
+#endif
 
     /*
      * Remember we didn't take a type-count of foreign writable mappings
-- 
2.26.2


