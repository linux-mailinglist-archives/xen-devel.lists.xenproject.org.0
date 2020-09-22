Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E9A274816
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 20:25:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKmyU-0008Iv-Us; Tue, 22 Sep 2020 18:25:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J35V=C7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKmyT-0008GC-Vo
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 18:25:10 +0000
X-Inumbo-ID: 14f5c2a9-ff66-451f-8133-86acca0362d2
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14f5c2a9-ff66-451f-8133-86acca0362d2;
 Tue, 22 Sep 2020 18:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600799104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VX5HKcJ42GTdKN2aMeeGpC6A33K0f3RBxZiuzBNTlmw=;
 b=QsGwBhxVOY+k9LzkID4g/t49ovXcbQ16WfIioFAnGJNE2P/gMREm1S6j
 MwCSoJHNxEz1jdjA/CbXB6dYsKIdZg8y0wPY9dE7j2BPGbFkpsNkZx68W
 VhpwNAnZtLcHI+AkhRAo9lmbhOSE2ydJjqXcuUvSw0XJ6Jwhh6Ew9THC7 M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: tf2mZ/0twZBgK3V8kEmLi+CzQrtKTFxADKvq2XSj6uKVvcHAR+K1tcVaBtpozVfDlHPgq1Y9DQ
 0PNC+yVds4MrwjMw/u2T6IaSIDzxI1qiLCRWBTN3uZ0Dg/70t0wBV8NYkt2NH7wyA9tBoWEfjs
 gbvCj9kA83rIZud3e0cA/H8oSGbn6W3/FLFT57BwnOehape1Fyua8Z9Nlu0BlMckFiBs8QpTPN
 fxiiwiTSdrEePuuqO1Azvz6jXBLM8UO0J0GZmRa5OsIQcHc80v7CoUijTLseQy97Tx4tk2SVC/
 Szk=
X-SBRS: 2.7
X-MesageID: 27631631
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,291,1596513600"; d="scan'208";a="27631631"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
 Hubert Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
 <tamas@tklengyel.com>
Subject: [PATCH v2 08/11] xen/memory: Indent part of acquire_resource()
Date: Tue, 22 Sep 2020 19:24:41 +0100
Message-ID: <20200922182444.12350-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200922182444.12350-1-andrew.cooper3@citrix.com>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
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

Indent the middle of acquire_resource() inside a do {} while ( 0 ) loop.  This
is broken out specifically to make the following change readable.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
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
---
 xen/common/memory.c | 66 +++++++++++++++++++++++++++--------------------------
 1 file changed, 34 insertions(+), 32 deletions(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index c559935732..369154b7c0 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1087,44 +1087,46 @@ static int acquire_resource(
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
 
-    default:
-        rc = arch_acquire_resource(d, xmar.type, xmar.id, xmar.frame,
-                                   xmar.nr_frames, mfn_list);
-        break;
-    }
+        default:
+            rc = arch_acquire_resource(d, xmar.type, xmar.id, xmar.frame,
+                                       xmar.nr_frames, mfn_list);
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
-            rc = set_foreign_p2m_entry(currd, gfn_list[i],
-                                       _mfn(mfn_list[i]));
-            /* rc should be -EIO for any iteration other than the first */
-            if ( rc && i )
-                rc = -EIO;
+            for ( i = 0; !rc && i < xmar.nr_frames; i++ )
+            {
+                rc = set_foreign_p2m_entry(currd, gfn_list[i],
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


