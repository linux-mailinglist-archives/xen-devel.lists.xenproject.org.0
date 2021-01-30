Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9585A309192
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 03:59:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78635.143157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5gTo-0000bp-2V; Sat, 30 Jan 2021 02:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78635.143157; Sat, 30 Jan 2021 02:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5gTn-0000bI-VA; Sat, 30 Jan 2021 02:59:19 +0000
Received: by outflank-mailman (input) for mailman id 78635;
 Sat, 30 Jan 2021 02:59:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bynp=HB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5gTl-0000YD-Q1
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 02:59:17 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87103295-8722-45fe-93e4-48523448dbf0;
 Sat, 30 Jan 2021 02:59:11 +0000 (UTC)
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
X-Inumbo-ID: 87103295-8722-45fe-93e4-48523448dbf0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611975551;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e4zMx+E+sDkOfYsWc3uNfBOCqVtwp50q1FWC0/NfoFo=;
  b=b9vwW3kMlln51eXd5+Nus27Sw9HkQVzrAIu0r3XqrywbQBiLvbZ6YLZB
   vCS0SvAHWQX+tcBdw8Tk+/CHWKGh2Sh3lPJtyqZa/dB7nwd2ZP1H3doIB
   IE8kkWDeuIK8/wCQ9XxGxxgk72z6CFlTaxVDDEjD3v2WyDHnNp2pzQ3ov
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: fqRQ838jlXUOr6w4phFw7DfsVTtBRBeYx8Xnm+yrR/TKqNA2A/wK0OHKNcCzza04s0Td7dHxBO
 ttfg7cDc/HG/fvUc1QzLL6dLXqWJ+5nKph0gM5EdcO7YYl+8JVGN399eO8B/92BTLInGLDiCzP
 gXaOkmrIQbKsmgXwU8OZsqZlYR1g0bDJX9EhhznPA1TwYAMt0JJHVtYqxV9f+8mpgYtLbwEvX4
 +0oZ94AqZOaXUBXzCw7WH46K8xNcdGWBEt9nljsLz3iq3lEymqRo4Cju18YBXsLTiednGO6Q1D
 13M=
X-SBRS: 5.1
X-MesageID: 36195184
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,387,1602561600"; 
   d="scan'208";a="36195184"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Hubert Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
	<tamas@tklengyel.com>
Subject: [PATCH v8 05/16] xen/memory: Indent part of acquire_resource()
Date: Sat, 30 Jan 2021 02:58:41 +0000
Message-ID: <20210130025852.12430-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210130025852.12430-1-andrew.cooper3@citrix.com>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Indent the middle of acquire_resource() inside a do {} while ( 0 ) loop.  This
is broken out specifically to make the following change readable.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Paul Durrant <paul@xen.org>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
CC: Tamas K Lengyel <tamas@tklengyel.com>

v8:
 * Rebase over ARM/IOREQ series.
---
 xen/common/memory.c | 72 +++++++++++++++++++++++++++--------------------------
 1 file changed, 37 insertions(+), 35 deletions(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 9fb34eb4d0..01cab7e493 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1187,48 +1187,50 @@ static int acquire_resource(
         goto out;
     }
 
-    switch ( xmar.type )
-    {
-    case XENMEM_resource_grant_table:
-        rc = gnttab_acquire_resource(d, xmar.id, xmar.frame, xmar.nr_frames,
-                                     mfn_list);
-        break;
+    do {
+        switch ( xmar.type )
+        {
+        case XENMEM_resource_grant_table:
+            rc = gnttab_acquire_resource(d, xmar.id, xmar.frame, xmar.nr_frames,
+                                         mfn_list);
+            break;
 
-    case XENMEM_resource_ioreq_server:
-        rc = acquire_ioreq_server(d, xmar.id, xmar.frame, xmar.nr_frames,
-                                  mfn_list);
-        break;
+        case XENMEM_resource_ioreq_server:
+            rc = acquire_ioreq_server(d, xmar.id, xmar.frame, xmar.nr_frames,
+                                      mfn_list);
+            break;
 
-    default:
-        rc = -EOPNOTSUPP;
-        break;
-    }
+        default:
+            rc = -EOPNOTSUPP;
+            break;
+        }
 
-    if ( rc )
-        goto out;
+        if ( rc )
+            goto out;
 
-    if ( !paging_mode_translate(currd) )
-    {
-        if ( copy_to_guest(xmar.frame_list, mfn_list, xmar.nr_frames) )
-            rc = -EFAULT;
-    }
-    else
-    {
-        xen_pfn_t gfn_list[ARRAY_SIZE(mfn_list)];
-        unsigned int i;
+        if ( !paging_mode_translate(currd) )
+        {
+            if ( copy_to_guest(xmar.frame_list, mfn_list, xmar.nr_frames) )
+                rc = -EFAULT;
+        }
+        else
+        {
+            xen_pfn_t gfn_list[ARRAY_SIZE(mfn_list)];
+            unsigned int i;
 
-        if ( copy_from_guest(gfn_list, xmar.frame_list, xmar.nr_frames) )
-            rc = -EFAULT;
+            if ( copy_from_guest(gfn_list, xmar.frame_list, xmar.nr_frames) )
+                rc = -EFAULT;
 
-        for ( i = 0; !rc && i < xmar.nr_frames; i++ )
-        {
-            rc = set_foreign_p2m_entry(currd, d, gfn_list[i],
-                                       _mfn(mfn_list[i]));
-            /* rc should be -EIO for any iteration other than the first */
-            if ( rc && i )
-                rc = -EIO;
+            for ( i = 0; !rc && i < xmar.nr_frames; i++ )
+            {
+                rc = set_foreign_p2m_entry(currd, d, gfn_list[i],
+                                           _mfn(mfn_list[i]));
+                /* rc should be -EIO for any iteration other than the first */
+                if ( rc && i )
+                    rc = -EIO;
+            }
         }
-    }
+    } while ( 0 );
 
  out:
     rcu_unlock_domain(d);
-- 
2.11.0


