Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cFn3Jgu0UmrwSQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jul 2026 23:22:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E78742EDC
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jul 2026 23:22:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="lyMN//Ky";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1360642.1613392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wif8l-0007kE-Tv; Sat, 11 Jul 2026 21:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1360642.1613392; Sat, 11 Jul 2026 21:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wif8l-0007hW-Qd; Sat, 11 Jul 2026 21:21:39 +0000
Received: by outflank-mailman (input) for mailman id 1360642;
 Sat, 11 Jul 2026 21:21:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wif8k-0007Uj-Pk
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2026 21:21:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wif8j-002lyX-Is
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2026 23:21:37 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a52b3c8-2eae-0a2a0a5409dd-0a2a4507a3a0-4
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 23:21:37 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <freddy77@gmail.com>)
 id 6a52b3e1-ac46-0a2a45070019-d155dd33a40f-3
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 23:21:37 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-4758bd3731bso1326941f8f.0
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 14:21:37 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1d8cdsm74809460f8f.1.2026.07.11.14.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jul 2026 14:21:36 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783804897; x=1784409697; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yDwLVp2T+0d9NzRyPiF1z4X+HynXJvUa2aJRE8bIVuE=;
        b=lyMN//Ky5+EBkXOjZSXcQP5Gc8zGSaH1IJK7/F/CJ/HU8PirQWMKmqMv4Nt2MMgXoz
         nlj8qoXPaX0TmZc6Tb7kUupIB9FxfR7yju24pyimb0W5rCd8MMPQC3J24d06P4DGxMtR
         nO0cAeQ80yRxIZsmtuFUqcAl/WfKcXPw3yygJ24p8azmHMUTFAPL16IqM2hSzwX3frMi
         im/EqDX6dsMOTqKNBiW80xPgkwU2zCf08xY0W+jJ/zJeyIoXx8Ql8JCiO6OI1Z9Y42Mf
         vECgXKCGYyJ0eZg79O2AaFvif2YwoYVoDONmK4xEGHHljJ2wZKd0flk/MPOUcgAqF1PX
         EGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783804897; x=1784409697;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDwLVp2T+0d9NzRyPiF1z4X+HynXJvUa2aJRE8bIVuE=;
        b=pw2INfSQ3+0pmDJjRVLqdRu559pOR5OwV2yBb0+eBLSkPaB4R/hW07wBVqWIUFRfq4
         /XaeKZzeymvChTARkDr0WcogseB4yg6PtPL3h9I8lneCxiRs4Ke8PYUBPF6YIerjMguF
         dpgPzLXyjiuRt1u+9s2IZTHK7Y0G/MslawD75b/kpOPiWlnqzxtu1OIwXgheSCrLXjwS
         wr8v0pBNvpHGtWu1ylWQxhxdeMAEG+LhQs3pV0pdZ4bNSzfJQPphn8m2CWU55GDgH1LV
         /FdFFWGHq9Us0iozraOEy3pLcZfREdQ7130mtzIn/tq1Q8xNGadvz9R7PaMnxfaHquci
         P+2w==
X-Gm-Message-State: AOJu0YzzJhe9zL/kWDB/e5dB7n5aNQAV6tFpv7rB3V0YmKgh9N4s9AJc
	WaSuzqIMgWRLHuA+WfQ3tCTEyUqP3FF736HUzKMFKBFbjG44UksNxDvh8DJRWa7M
X-Gm-Gg: AfdE7ckFNMlaKQ5wauoUScyopOFqb84U4qSYhvRugNDkc9Kl5VnM3AeHL2ct8ugif7F
	R6Rqdh7nHeBc1cWo3bl/mgpQMUtRhztsqhklqo/sqGS2FRCmSCQYy3mN6BT4DQxzqJ5S9HOlpZF
	/PrkLy7ym+MZFzouHFtgr6Vp3oCGJkuYa4JGYzYm3Wnleii/Ik27lKmO2Hz8pp4EDrB7nNNkgmb
	4bOogOXrak2qsKp2WoJUZpLp9NldRE5Tqa6aHMWDmV4wtG2EDB4P1LnBD9HuIYD2UtNR46S/9yh
	xA9PBMBcBt7MaQXYm2AOxgBizFEmnW9aUw7ON4aunEZmVjWY2cPwVr6J+aTgeADYqv8TwqZhaR/
	uerwNXQ/XVHsD5FByuSn9n3UL4ZYYDz+z1wlyP1/RoAa1j2KQb+/09uJQKfPq2Sbb+4MoqEQvTK
	/PefuQrF0U2OYRuIqR6Pj8WEFI1c1iCrjyW9rSDPTq3I9pZsXjI4XtwSmUUjhrBRVpqzGPe3Joo
	6op4fMTRYwYA4f1bcM=
X-Received: by 2002:a05:6000:2382:b0:472:1424:fc7c with SMTP id ffacd0b85a97d-47ef695ba2fmr10411461f8f.10.1783804896778;
        Sat, 11 Jul 2026 14:21:36 -0700 (PDT)
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
Subject: [PATCH v8 1/4] libs/call: cache up to 4 pages in hypercall bounce buffers
Date: Sat, 11 Jul 2026 22:21:25 +0100
Message-ID: <20260711212128.505727-2-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711212128.505727-1-frediano.ziglio@citrix.com>
References: <20260711212128.505727-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1783804897-D8E36201-76D78473/0/0
X-purgate-type: clean
X-purgate-size: 5606
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 47E78742EDC

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


