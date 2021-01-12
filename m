Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8C42F3AFF
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 20:49:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65956.116936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzPf8-00067h-4s; Tue, 12 Jan 2021 19:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65956.116936; Tue, 12 Jan 2021 19:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzPf8-00067B-0h; Tue, 12 Jan 2021 19:49:06 +0000
Received: by outflank-mailman (input) for mailman id 65956;
 Tue, 12 Jan 2021 19:49:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh5d=GP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kzPf6-00066z-8q
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 19:49:04 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d94a7a39-d39c-4a0c-9503-0f7739b2ab27;
 Tue, 12 Jan 2021 19:49:02 +0000 (UTC)
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
X-Inumbo-ID: d94a7a39-d39c-4a0c-9503-0f7739b2ab27
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610480942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CF1phv5+4uaV/bWMrtFd3nwHuj3efZew367gbS9TIow=;
  b=YJw0ODRweGkFOZmrH887XO7M7S2EF0XXtXaL+NNG3lLUq5Dh7OKFJxP7
   mURKUc/I4BPT6Y+CxbUJRy8pSm4EORZxdAj+KPUBGfk0dGkM2LSDpPC0J
   5JdotnPoshk3x+mmPNPNqaZazHu7UwJr+wxTipHUwaCNYV2RP9StG2Y0a
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: VPwpiSJwy7LLJcU6VbtVdFXN+Z8gRxPCOspOF8ZEIXVaERgIHiPnoRHACmqQoCmQT+rR8h81IG
 V34oSOgb/l4N1UNqSUfnlYTWe2grAAQcoNbsPLkrvIPYW34OluIoSvSMtnNpsc6Hrj/Fk00dh6
 r8Ojk2mHuNtiGWb7EZhe4hB0O83kKzGVpvbQI4KF0qjgXhqTFObyGFqiRGc7cHKxF6W+YciEV6
 e7RrLiN1izbFjv9hi0oUiEJ4dLsq4IHReL635JaIE1ZQM1BxAKcq4sJgGVVGCqhbCvTtrVL326
 3YQ=
X-SBRS: 5.2
X-MesageID: 36235809
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,342,1602561600"; 
   d="scan'208";a="36235809"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Hubert Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
	<tamas@tklengyel.com>
Subject: [PATCH v3 6/7] xen/memory: Indent part of acquire_resource()
Date: Tue, 12 Jan 2021 19:48:40 +0000
Message-ID: <20210112194841.1537-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210112194841.1537-1-andrew.cooper3@citrix.com>
References: <20210112194841.1537-1-andrew.cooper3@citrix.com>
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
---
 xen/common/memory.c | 66 +++++++++++++++++++++++++++--------------------------
 1 file changed, 34 insertions(+), 32 deletions(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index beefa6a313..fd30eefa2e 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1127,44 +1127,46 @@ static int acquire_resource(
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


