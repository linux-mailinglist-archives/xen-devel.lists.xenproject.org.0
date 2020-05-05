Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CB51C51DD
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 11:26:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVtpB-0002Nz-Ko; Tue, 05 May 2020 09:25:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWWA=6T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jVtpA-0002Nr-4E
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 09:25:12 +0000
X-Inumbo-ID: 513e6bc8-8eb2-11ea-ae69-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 513e6bc8-8eb2-11ea-ae69-bc764e2007e4;
 Tue, 05 May 2020 09:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588670711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=99RC9b/V5iDp9O+PzyOxH6obFMvEPeacU7D+AkWN0Os=;
 b=XagVZvfwgcfPeUU4ZzdnaL9Eel0kRwwb/r+cYlTZ/st2NFQQUm9V3/eM
 n476cwPgTqJ0/gqa9tBsFg5E292nxvKDKO3TZIduUB+hvCtt63ogKFvSJ
 rwbD21GZdX+FB8kkQcgdVBiQrwir28fcS3C4eHV/jtHx89hcdCwXtcYD3 Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TD3bVff+XQLNCZ8KBoB6hjmooAXQEDkX6Gn0aFn4jTtOJisDJ/bFX3Dxvbu9o+Z+gO/BKzzUR/
 xDN35BPvxwC9lLBsgzEFUQHERy5MsSE/lL5rsqMEaPWZ+chNA/PbiAhIsqAM5wUGoVBhTO9Cl2
 IKeYmqSjfATz+UeRvAe415Ma+Jhc4pWJ0dWea9QAq6cWF+zBD4PQKCOmfFkX9JEMg/CS7H1jUY
 fgVunq1SpSotYzSe5lXMtF4FSH+PlGhYFF9fuavT2rdJWgNNlI3ZKrAxzpus2RB4BfynIJlioW
 T1M=
X-SBRS: 2.7
X-MesageID: 17012785
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,354,1583211600"; d="scan'208";a="17012785"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH 1/3] x86/mm: do not attempt to convert _PAGE_GNTTAB to a
 boolean
Date: Tue, 5 May 2020 11:24:52 +0200
Message-ID: <20200505092454.9161-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200505092454.9161-1-roger.pau@citrix.com>
References: <20200505092454.9161-1-roger.pau@citrix.com>
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

Remove the conversion of _PAGE_GNTTAB to a boolean, since the and
operation performed afterwards will already return false if the value
of the macro is 0.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 355c50ff91..27069d2451 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1236,7 +1236,7 @@ void put_page_from_l1e(l1_pgentry_t l1e, struct domain *l1e_owner)
      * (Note that the undestroyable active grants are not a security hole in
      * Xen. All active grants can safely be cleaned up when the domain dies.)
      */
-    if ( _PAGE_GNTTAB && (l1e_get_flags(l1e) & _PAGE_GNTTAB) &&
+    if ( (l1e_get_flags(l1e) & _PAGE_GNTTAB) &&
          !l1e_owner->is_shutting_down && !l1e_owner->is_dying )
     {
         gdprintk(XENLOG_WARNING,
-- 
2.26.2


