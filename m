Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AFE1E6435
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 16:41:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeJi4-0006bx-0z; Thu, 28 May 2020 14:40:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNTM=7K=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jeJi3-0006bs-09
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 14:40:39 +0000
X-Inumbo-ID: 307906d6-a0f1-11ea-81bc-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 307906d6-a0f1-11ea-81bc-bc764e2007e4;
 Thu, 28 May 2020 14:40:35 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: sU2tFkgZwZH7RR6JIykLm+24ucLQq/ISXqXaqfdXSK70ubCNcimGSaTkRQMkKYPwvZoD9u3H3K
 u5lpE8lSe50tvxqDJRPca5ff+kY4wPKYjjPtVOEzxN72byOJ7XWeGF0b4qzmQIXWyktKCymmeI
 8Gn21imQ/6E6nwIuEVUqBemenlq9BZ/emfRDMHrqG0QUhr/j9Lg7u6UD8xB1hxXm+Mma5rOs30
 gdinRYU9Z3l5EurwvImTMwSoH4F/LWOIUlc71H8DJgh4H65E4gQnU8CaKlSEeLLm+cNc1VdSwK
 Boo=
X-SBRS: 2.7
X-MesageID: 18922173
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,445,1583211600"; d="scan'208";a="18922173"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 1/3] x86/mm: do not attempt to convert _PAGE_GNTTAB to a
 boolean
Date: Thu, 28 May 2020 16:40:21 +0200
Message-ID: <20200528144023.10814-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200528144023.10814-1-roger.pau@citrix.com>
References: <20200528144023.10814-1-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
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
---
Changes since v1:
 - Use a preprocessor conditional.
---
 xen/arch/x86/mm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 54980b4eb1..7bcac17e2e 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1236,7 +1236,8 @@ void put_page_from_l1e(l1_pgentry_t l1e, struct domain *l1e_owner)
      * (Note that the undestroyable active grants are not a security hole in
      * Xen. All active grants can safely be cleaned up when the domain dies.)
      */
-    if ( _PAGE_GNTTAB && (l1e_get_flags(l1e) & _PAGE_GNTTAB) &&
+#if _PAGE_GNTTAB
+    if ( (l1e_get_flags(l1e) & _PAGE_GNTTAB) &&
          !l1e_owner->is_shutting_down && !l1e_owner->is_dying )
     {
         gdprintk(XENLOG_WARNING,
@@ -1244,6 +1245,7 @@ void put_page_from_l1e(l1_pgentry_t l1e, struct domain *l1e_owner)
                  l1e_get_intpte(l1e));
         domain_crash(l1e_owner);
     }
+#endif
 
     /*
      * Remember we didn't take a type-count of foreign writable mappings
-- 
2.26.2


