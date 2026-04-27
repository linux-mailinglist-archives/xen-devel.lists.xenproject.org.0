Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBwlCXJA72lP/QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 12:54:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD24D4714FE
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 12:54:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294783.1571533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHJbP-00079U-EO; Mon, 27 Apr 2026 10:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294783.1571533; Mon, 27 Apr 2026 10:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHJbP-00077X-9w; Mon, 27 Apr 2026 10:54:11 +0000
Received: by outflank-mailman (input) for mailman id 1294783;
 Mon, 27 Apr 2026 10:54:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wHJbN-0006pf-SB
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 10:54:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHJbN-004Ir6-8B
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 12:54:09 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ef4051-5cb7-0a2a0a5109dd-0a2a4503c4b8-0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 12:54:09 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ef4051-672d-0a2a45030019-d1558033c86d-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 12:54:09 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso84864145e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 03:54:09 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a5c4b9e8dsm116133355e9.7.2026.04.27.03.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2026 03:54:07 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777287248; x=1777892048; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVb1my+fIjS7vfPgLx5O5td6PHPVJPTF5pUCPqufxWI=;
        b=NXqJPzU1nN0S4FsDtr+l5Puecwi8NQKusSBbu2duK8M7zOcIU/mMc8+I912A5CJwpj
         kZxVIgXM4uC2clS4KEfQqshT3qpe06dEaBxcHjXogSNQscr2uBf1W6i2zEaEHXovzm1b
         ZdumLkUHaYJgivL3eiiTNkbsVE+y0de4BKEjlrn88IO1lnCchjUwn4Rh81AFQdIyXX+I
         zhKKFkC3sOpKxejAL1Xavj1rIWeJNaJ4ITypgTr5ksDg8gyni4X/EYXNtujdtTOFkpz7
         KrxmyhZHQa+iY3SctOCkV9P5mcGH2mEdH+Z+eq+dhQ9B/b38hV03P9WU9VvHcniY6mqV
         a9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777287248; x=1777892048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RVb1my+fIjS7vfPgLx5O5td6PHPVJPTF5pUCPqufxWI=;
        b=K8JNr0BC/AOKJFx4fTrC+c5GYeGGXk7eK1qzucc5cm+uMFT1UEqevZPpcPMbdCo6Yi
         q41Z/nu9lp47PkbNwKN6HLzhl1q7vEZkSHIg8DBeay4EUDJdHC2LK8ytegFeFoLrO95h
         qlwVSvxyUCPezFt1+gunT6JlO9PV0c0EaJH4vMwomP6x6zKLAmvLSVFz9vBrE9YaArGH
         +42Gd59RXAe4M6iWR5ACawA3Xi5vNHcCIlPSXTy4ZJiTSmmRRdtmhE6atGzJ6MIYFl6z
         DlOXDWBT9K77n8vbwNyJjvtmTmJpRkwvKfkxr0faHsjCp1aFlZn3SLBpBp27ErnevzcJ
         KpKA==
X-Gm-Message-State: AOJu0YyNwyYeWO6b+KvuaBjjjoBuaCaKxvYEmQ87gBotWUfiQPd12gj0
	FAfj21V0lt9M7v0Nf3uUdymckW6+s+6Rf8bCZc61D2AElQ2raYvqTjYxKg4B1OzC
X-Gm-Gg: AeBDieu76PgTa1ihBT9JAccAe1gSqLUxdnFdB84K7i/zW5Ak20vBo/adsRJWDZVEY4n
	2mB/nFpLvqExrLszoE6YAURAqAPTIaXHKTLaJLSeNLArOmeSPDs4DtYqb1F+5cKh1AdU9c9NLsz
	hTNo9KDZs7jKpm06XE/RIOrMmcXdi9AjhYAihDpC2kU8SACjjN0ZRjFqQ4RI2+kNpQ603KzTe//
	9f3N4dG71pVgdpqqojNbCN7RP0/TwTjXJtdKSRv1BMbs07BQnRN1WYcuDUSpx7EQzzbF8KDL62l
	a1hmNEIdPJFz6jHRzwhU7a5lPf1mqmgyi9dKo+DxR5wApRMUbtzrLYEghnMyk3jBOu/FISAylqU
	jvjTm5K9knIelw0QZAZf80lBffWYuquUrx/vQQpKbGmTD/8YCPdzcKXjvNmxJdmpBMFBWdtU0sx
	oo8prenD9UDGnEhIk/mMrqXR7VqyNZfEMRgB7r8TPaI2qGbDIPzRtqT4wZRcqwGRicLcH2sdvy0
	686isdL50ftNQc=
X-Received: by 2002:a05:600c:a08c:b0:48a:563c:c8c0 with SMTP id 5b1f17b1804b1-48a563cd176mr361650105e9.7.1777287248180;
        Mon, 27 Apr 2026 03:54:08 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v2 7/7] tools/lib/call: cache up to 4 pages in hypercall bounce buffers
Date: Mon, 27 Apr 2026 11:53:32 +0100
Message-ID: <20260427105338.99792-8-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427105338.99792-1-frediano.ziglio@cloud.com>
References: <20260427105338.99792-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1777287249-2A378938-ABA77346/0/0
X-purgate-type: clean
X-purgate-size: 4933
X-Rspamd-Queue-Id: CD24D4714FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

From: Edwin Török <edwin.torok@citrix.com>

During migration there are a lot of mmap/munmap calls,
because `xc_get_pfn_type_batch` exceeds the default hypercall bounce
buffer cache size, and needs to allocate every time it is called.

`munmap` is slow, especially in a PV Dom0 (takes an emulation fault),
so is best avoided.

Eventually it'd be good if the memory pool from  xmalloc_tlsf.c
was reused here, but for now make it handle the commonly encountered
sizes (so far up to 4 pages).

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/call/buffer.c  | 28 +++++++++++++++++-----------
 tools/libs/call/core.c    |  3 ++-
 tools/libs/call/private.h |  8 +++++---
 3 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/tools/libs/call/buffer.c b/tools/libs/call/buffer.c
index 2579b8c71986..15d2f98a6b71 100644
--- a/tools/libs/call/buffer.c
+++ b/tools/libs/call/buffer.c
@@ -56,13 +56,13 @@ static void *cache_alloc(xencall_handle *xcall, size_t nr_pages)
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
@@ -84,10 +84,10 @@ static int cache_free(xencall_handle *xcall, void *p, size_t nr_pages)
     xcall->buffer_total_releases++;
     xcall->buffer_current_allocations--;
 
-    if ( nr_pages == 1 &&
-         xcall->buffer_cache_nr < BUFFER_CACHE_SIZE )
+    if ( nr_pages && nr_pages < ARRAY_SIZE(xcall->buffer_cache) &&
+         xcall->buffer_cache_nr[nr_pages-1] < BUFFER_CACHE_SIZE )
     {
-        xcall->buffer_cache[xcall->buffer_cache_nr++] = p;
+        xcall->buffer_cache[nr_pages-1][xcall->buffer_cache_nr[nr_pages-1]++] = p;
         rc = 1;
     }
 
@@ -108,17 +108,23 @@ void buffer_release_cache(xencall_handle *xcall)
     DBGPRINTF("current allocations:%d maximum allocations:%d",
               xcall->buffer_current_allocations,
               xcall->buffer_maximum_allocations);
-    DBGPRINTF("cache current size:%d",
-              xcall->buffer_cache_nr);
+    for ( unsigned i = 0; i < ARRAY_SIZE(xcall->buffer_cache_nr); ++i )
+    {
+        DBGPRINTF("cache current size[%u pages]:%d", i+1,
+                xcall->buffer_cache_nr[i]);
+    }
     DBGPRINTF("cache hits:%d misses:%d toobig:%d",
               xcall->buffer_cache_hits,
               xcall->buffer_cache_misses,
               xcall->buffer_cache_toobig);
 
-    while ( xcall->buffer_cache_nr > 0 )
+    for ( unsigned i = 0; i < ARRAY_SIZE(xcall->buffer_cache_nr); ++i )
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
index 02c4f8e1aefa..dd8877c1a0bd 100644
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
index 9c3aa432efe2..8e6a20897534 100644
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
2.53.0


