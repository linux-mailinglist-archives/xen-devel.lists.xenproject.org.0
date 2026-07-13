Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id unqMKTRPVWqFmgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 22:48:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F26B974F211
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 22:48:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=p5bS73IU;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1361929.1613959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjNZV-0005Ny-GX; Mon, 13 Jul 2026 20:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361929.1613959; Mon, 13 Jul 2026 20:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjNZV-0005Mr-Cp; Mon, 13 Jul 2026 20:48:13 +0000
Received: by outflank-mailman (input) for mailman id 1361929;
 Mon, 13 Jul 2026 20:48:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wjNZT-00059x-Rr
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 20:48:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjNZS-00FW6X-IN
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 22:48:10 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a554ed4-5cb7-0a2a0a5109dd-0a2a450cb27e-30
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 22:48:10 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <freddy77@gmail.com>)
 id 6a554f08-e897-0a2a450c0019-d1558035b036-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 22:48:09 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493b1710405so19353945e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 13:48:09 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49508724786sm23924255e9.3.2026.07.13.13.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 13:48:07 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783975688; x=1784580488; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wimWBVOYQqwPaXI8zWtV5Ue4b9r9c1tb/eSNhf7mAu8=;
        b=p5bS73IUQcRSU3oHBOSWwISXFxYSHtz5P+sL1XWoivaFnyl0oOUmkqdQwhlMMfUohH
         uUr7bO+u4Uqme/Se4P/DmSctrAjhaJ801F3wE7GAUM6dXjCKWdroMGwLvfUQz8fl6ni2
         AGoQskVCyvpRSE+3arVoIGVIAymGCHAKNbe5Q0mY6BRr1JqU1cOsunITyqBNAo65lfU/
         rk+BeTeSTajYob2KCQ2t4tEtket0hK1KHKRkWl8GC7jMwMGhWUgOCjq7EwQKOUm51WaN
         nspvihu1QobN2nMbM0ohaT6EYZAnE/oBRijjH+fsDRq8qH7inL6t7wsufZU/eLOb15gd
         038g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783975688; x=1784580488;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wimWBVOYQqwPaXI8zWtV5Ue4b9r9c1tb/eSNhf7mAu8=;
        b=RaP8xZqkHEBH46HZ/moFISpuIpGHIyMO4tdVZFURHLHZPRttW/AhoXyFUauwDC2J+5
         6bfqe+2+0GdpJREzqfbapjH520aiTVdmPZYm2y7FPBc/6eeo6HY2OAVp9HoSvkED8h+8
         oofPpLWSW+wFob/V6EPHtZxip93dicCx5kYxqTNw4c48a1E3iyfMqU8Ys30uZwmAgeQ5
         FrrAIW6lHPH+cJF0KBL2aoP2UZvBckv/gmAokJZpUpfPXXTkSekigBIysfzqnZ9RxFrw
         KcMKAJ5USm0jmDRv5MasHRsm579BSL8ebmFGx5EFn/VEqCTaarJ8NjYDJVWddxjf1/zw
         DUdw==
X-Gm-Message-State: AOJu0YxPJksb2iDYdLIc3ivwL7rCBUz4FBkREa+OKlDy25EOALKFqNoe
	hwRadVmUixrSm8x6hsDN5ObAiGrGfWCLnteFyrjhaHHEJcNV7/3LH81HwFxttX1bNCY=
X-Gm-Gg: AfdE7clccAQILj60TqSiu+pz9SidJmvdb2ZeGNx3EwHGDVb9lySNXOPhLNGYO9s5IKl
	JnX/deaPIKAokn4JOgj2Qwu6F3f89rZ280/p4QhiFNoMmCo2ZPe5Ws7fap4Nf1RQOHZqvu5UtNU
	W7GcRFb/EWgLjFkJnhpOttd3CMygHsnWbIucMdCdtXww1cptCSGF+3/rJblflfMHJzoGipvw1v6
	8/yZkSI+I0Bw1JfjJ2swdtzj67z7Qn/jbu7qZY5W7A4VGJFwxUGYgjo7tGFulMZDt3NDVe1IYoS
	TJWUzvvZhI8BPHJ3EnjQLws7Tym7GaDXHiSwP0yXGtiKapHx6lDfy6HkqIxKkHTrcStOaaLRclI
	W/iOBkfZ0So+SkUjCwjnt+ObpOHaR0cv9Q0q6Bsc19kH18OpPCxG17ePkrmTU1gP1XuKldRx6yt
	sgqwGuldbb5YkN7HaWj/pmPjUF2TmL5B1J3V7ysFeQdapc60vsSabbUyjpGc5onzv0+ybl0Um3Q
	owe31zTDcFsuUoZDck=
X-Received: by 2002:a05:600c:8119:b0:493:f744:e7d5 with SMTP id 5b1f17b1804b1-49518324f47mr8276255e9.38.1783975688441;
        Mon, 13 Jul 2026 13:48:08 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v9 1/4] libs/call: cache up to 4 pages in hypercall bounce buffers
Date: Mon, 13 Jul 2026 21:47:59 +0100
Message-ID: <20260713204802.105115-2-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713204802.105115-1-frediano.ziglio@citrix.com>
References: <20260713204802.105115-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1783975689-452FA6B2-A076A490/0/0
X-purgate-type: clean
X-purgate-size: 5706
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F26B974F211

From: Edwin Török <edwin.torok@citrix.com>

During migration there are a lot of mmap/munmap calls,
because xc_get_pfn_type_batch() exceeds the default hypercall bounce
buffer cache size, and needs to allocate every time it is called.

munmap() is slow, especially in a PV Dom0 (takes an emulation fault),
so is best avoided.

Eventually it'd be good if the memory pool from  xmalloc_tlsf.c
was reused here, but for now make it handle the commonly encountered
sizes (so far up to 4 pages).

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
Changes since v2:
- change prefix in subject.

Changes since v4:
- fix off-by-one bug.

Changes since v5:
- avoids potential buffer underflow if nr_pages is 0 calling cache_alloc.

Changes since v6:
- align changes made to cache_alloc to cache_free.

Changes since v7:
- use "unsigned int" instead of "unsigned".

Changes since v8:
- added Reviewed-by.
---
 tools/libs/call/buffer.c  | 34 +++++++++++++++++++++++-----------
 tools/libs/call/core.c    |  3 ++-
 tools/libs/call/private.h |  8 +++++---
 3 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/tools/libs/call/buffer.c b/tools/libs/call/buffer.c
index 155e4f9d43..b7d00185c4 100644
--- a/tools/libs/call/buffer.c
+++ b/tools/libs/call/buffer.c
@@ -49,6 +49,9 @@ static void *cache_alloc(xencall_handle *xcall, size_t nr_pages)
 {
     void *p = NULL;
 
+    if ( nr_pages == 0 )
+        return NULL;
+
     cache_lock(xcall);
 
     xcall->buffer_total_allocations++;
@@ -56,13 +59,13 @@ static void *cache_alloc(xencall_handle *xcall, size_t nr_pages)
     if ( xcall->buffer_current_allocations > xcall->buffer_maximum_allocations )
         xcall->buffer_maximum_allocations = xcall->buffer_current_allocations;
 
-    if ( nr_pages > 1 )
+    if ( nr_pages > ARRAY_SIZE(xcall->buffer_cache) )
     {
         xcall->buffer_cache_toobig++;
     }
-    else if ( xcall->buffer_cache_nr > 0 )
+    else if ( xcall->buffer_cache_nr[nr_pages-1] > 0 )
     {
-        p = xcall->buffer_cache[--xcall->buffer_cache_nr];
+        p = xcall->buffer_cache[nr_pages-1][--xcall->buffer_cache_nr[nr_pages-1]];
         xcall->buffer_cache_hits++;
     }
     else
@@ -79,15 +82,18 @@ static int cache_free(xencall_handle *xcall, void *p, size_t nr_pages)
 {
     int rc = 0;
 
+    if ( nr_pages == 0 )
+        return 0;
+
     cache_lock(xcall);
 
     xcall->buffer_total_releases++;
     xcall->buffer_current_allocations--;
 
-    if ( nr_pages == 1 &&
-         xcall->buffer_cache_nr < BUFFER_CACHE_SIZE )
+    if ( nr_pages && nr_pages <= ARRAY_SIZE(xcall->buffer_cache) &&
+         xcall->buffer_cache_nr[nr_pages-1] < BUFFER_CACHE_SIZE )
     {
-        xcall->buffer_cache[xcall->buffer_cache_nr++] = p;
+        xcall->buffer_cache[nr_pages-1][xcall->buffer_cache_nr[nr_pages-1]++] = p;
         rc = 1;
     }
 
@@ -108,17 +114,23 @@ void buffer_release_cache(xencall_handle *xcall)
     DBGPRINTF("current allocations:%d maximum allocations:%d",
               xcall->buffer_current_allocations,
               xcall->buffer_maximum_allocations);
-    DBGPRINTF("cache current size:%d",
-              xcall->buffer_cache_nr);
+    for ( unsigned int i = 0; i < ARRAY_SIZE(xcall->buffer_cache_nr); ++i )
+    {
+        DBGPRINTF("cache current size[%u pages]:%d", i+1,
+                xcall->buffer_cache_nr[i]);
+    }
     DBGPRINTF("cache hits:%d misses:%d toobig:%d",
               xcall->buffer_cache_hits,
               xcall->buffer_cache_misses,
               xcall->buffer_cache_toobig);
 
-    while ( xcall->buffer_cache_nr > 0 )
+    for ( unsigned int i = 0; i < ARRAY_SIZE(xcall->buffer_cache_nr); ++i )
     {
-        p = xcall->buffer_cache[--xcall->buffer_cache_nr];
-        osdep_free_pages(xcall, p, 1);
+        while ( xcall->buffer_cache_nr[i] > 0 )
+        {
+            p = xcall->buffer_cache[i][--xcall->buffer_cache_nr[i]];
+            osdep_free_pages(xcall, p, i + 1);
+        }
     }
 
     cache_unlock(xcall);
diff --git a/tools/libs/call/core.c b/tools/libs/call/core.c
index 02c4f8e1ae..dd8877c1a0 100644
--- a/tools/libs/call/core.c
+++ b/tools/libs/call/core.c
@@ -14,6 +14,7 @@
  */
 
 #include <stdlib.h>
+#include <string.h>
 
 #include "private.h"
 
@@ -44,7 +45,7 @@ xencall_handle *xencall_open(xentoollog_logger *logger, unsigned open_flags)
     xentoolcore__register_active_handle(&xcall->tc_ah);
 
     xcall->flags = open_flags;
-    xcall->buffer_cache_nr = 0;
+    memset(xcall->buffer_cache_nr, 0, sizeof(xcall->buffer_cache_nr));
 
     xcall->buffer_total_allocations = 0;
     xcall->buffer_total_releases = 0;
diff --git a/tools/libs/call/private.h b/tools/libs/call/private.h
index 9c3aa432ef..8e6a208975 100644
--- a/tools/libs/call/private.h
+++ b/tools/libs/call/private.h
@@ -31,13 +31,15 @@ struct xencall_handle {
     Xentoolcore__Active_Handle tc_ah;
 
     /*
-     * A simple cache of unused, single page, hypercall buffers
+     * A simple cache of unused, small, hypercall buffers
+     * buffer_cache[i]'s size is (i+1) pages
      *
      * Protected by a global lock.
      */
 #define BUFFER_CACHE_SIZE 4
-    int buffer_cache_nr;
-    void *buffer_cache[BUFFER_CACHE_SIZE];
+#define BUFFER_CACHE_NRPAGES 4
+    int buffer_cache_nr[BUFFER_CACHE_NRPAGES];
+    void *buffer_cache[BUFFER_CACHE_NRPAGES][BUFFER_CACHE_SIZE];
 
     /*
      * Hypercall buffer statistics. All protected by the global
-- 
2.43.0


