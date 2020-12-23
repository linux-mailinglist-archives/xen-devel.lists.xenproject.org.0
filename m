Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8037E2E1F81
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 17:35:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58500.102966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks76a-0000dy-3o; Wed, 23 Dec 2020 16:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58500.102966; Wed, 23 Dec 2020 16:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks76Z-0000d8-Uf; Wed, 23 Dec 2020 16:35:15 +0000
Received: by outflank-mailman (input) for mailman id 58500;
 Wed, 23 Dec 2020 16:35:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ifz=F3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ks76Y-0000XT-GZ
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 16:35:14 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3ad9b30-209e-4365-9cc7-725099a7b43b;
 Wed, 23 Dec 2020 16:35:09 +0000 (UTC)
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
X-Inumbo-ID: a3ad9b30-209e-4365-9cc7-725099a7b43b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608741309;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CMpXZjooSuf3izRShMQsyPS9IRnkTZlUjBWpT0DP1So=;
  b=hyMzwOKMxhA7UCo9DlwYJC2DFqp9rSHIDpxPc11vpwMf84PtzBXTncYf
   XpCP3S7c+Mut+3AKwVu9IGne4AughogITLj/yvfIDSaYa5V+GgisqNzJQ
   ygLAfEcKNBiwgOq5u6zO8+Cjk/QjEmeZSPI4f39XIWjiGAlpgsGPi2ZiE
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 4KLhY6pCuhQiyyEWtLF4uW9Mh8tQVFNJ9+5WzDNSLa9nzav2Dps4WOqWJigTKdRvXNSRos3a4s
 UxB1L2Te3Mp2B6BzUBPZ7/g/KZLzKBDpPOIewPyGCwOG908PeIxFr/IUc84xTZKAvOeuSaXQmt
 n5yQl8v2A33a+/FRVCgTgQ1REP2EcWbbn9aQCbzgxsQOhPp0YvQquKNycOSipMqgdkwDOT0jdI
 TIvmyvKIt5B1Mpsp7XdZKd/C6iV/CIB4swA5d4I29r0M5grsAzkRk8C/YwcqY5W71+JJJDviGK
 mGI=
X-SBRS: 5.2
X-MesageID: 34085173
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,441,1599537600"; 
   d="scan'208";a="34085173"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH 2/4] xen/evtchn: Switch to dmalloc
Date: Wed, 23 Dec 2020 16:34:40 +0000
Message-ID: <20201223163442.8840-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201223163442.8840-1-andrew.cooper3@citrix.com>
References: <20201223163442.8840-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This causes memory allocations to be tied to domain in question.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>

RFC: Likely more to convert.  This is just a minimal attempt.
---
 xen/common/event_channel.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 4a48094356..f0ca0933e3 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -16,6 +16,7 @@
 
 #include "event_channel.h"
 
+#include <xen/dmalloc.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/errno.h>
@@ -153,7 +154,7 @@ static struct evtchn *alloc_evtchn_bucket(struct domain *d, unsigned int port)
     struct evtchn *chn;
     unsigned int i;
 
-    chn = xzalloc_array(struct evtchn, EVTCHNS_PER_BUCKET);
+    chn = dzalloc_array(d, struct evtchn, EVTCHNS_PER_BUCKET);
     if ( !chn )
         return NULL;
 
@@ -182,7 +183,7 @@ static void free_evtchn_bucket(struct domain *d, struct evtchn *bucket)
     for ( i = 0; i < EVTCHNS_PER_BUCKET; i++ )
         xsm_free_security_evtchn(bucket + i);
 
-    xfree(bucket);
+    dfree(d, bucket);
 }
 
 int evtchn_allocate_port(struct domain *d, evtchn_port_t port)
@@ -204,7 +205,7 @@ int evtchn_allocate_port(struct domain *d, evtchn_port_t port)
 
         if ( !group_from_port(d, port) )
         {
-            grp = xzalloc_array(struct evtchn *, BUCKETS_PER_GROUP);
+            grp = dzalloc_array(d, struct evtchn *, BUCKETS_PER_GROUP);
             if ( !grp )
                 return -ENOMEM;
             group_from_port(d, port) = grp;
@@ -1488,7 +1489,7 @@ int evtchn_init(struct domain *d, unsigned int max_port)
     write_atomic(&d->active_evtchns, 0);
 
 #if MAX_VIRT_CPUS > BITS_PER_LONG
-    d->poll_mask = xzalloc_array(unsigned long, BITS_TO_LONGS(d->max_vcpus));
+    d->poll_mask = dzalloc_array(d, unsigned long, BITS_TO_LONGS(d->max_vcpus));
     if ( !d->poll_mask )
     {
         free_evtchn_bucket(d, d->evtchn);
@@ -1545,13 +1546,12 @@ void evtchn_destroy_final(struct domain *d)
             continue;
         for ( j = 0; j < BUCKETS_PER_GROUP; j++ )
             free_evtchn_bucket(d, d->evtchn_group[i][j]);
-        xfree(d->evtchn_group[i]);
+        dfree(d, d->evtchn_group[i]);
     }
     free_evtchn_bucket(d, d->evtchn);
 
 #if MAX_VIRT_CPUS > BITS_PER_LONG
-    xfree(d->poll_mask);
-    d->poll_mask = NULL;
+    DFREE(d, d->poll_mask);
 #endif
 }
 
-- 
2.11.0


