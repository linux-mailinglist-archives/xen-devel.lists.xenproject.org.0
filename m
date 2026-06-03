Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GqLCH9kmIGqbxgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0BA637DB5
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=eQx3Lonu;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1326229.1591705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIg-0006JT-7z; Wed, 03 Jun 2026 13:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326229.1591705; Wed, 03 Jun 2026 13:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIg-0006F2-3r; Wed, 03 Jun 2026 13:06:26 +0000
Received: by outflank-mailman (input) for mailman id 1326229;
 Wed, 03 Jun 2026 13:06:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wUlIe-00061k-Er
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:06:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUlId-000siy-Rv
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:06:23 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026cf-e002-0a2a0a5209dd-0a2a450cc1bc-6
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:23 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026cf-62f1-0a2a450c0019-d155dd2abc2d-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:23 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-4601949975dso194027f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:06:23 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ec711sm7254825f8f.12.2026.06.03.06.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 06:06:22 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780491983; x=1781096783; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0qnwksAnVibKLEOmCRSNsa6uG3n6snRRRntsiizK/M=;
        b=eQx3LonuUXFrPzTyJAaIk/3pbaBYDEEpcxmhIYjJny+3+3mQcZ07V90CwONr13OaRX
         2RIfC0Ze2KXTAi9SdlaVTjkCgS1LxlAREJij80ZXMrfVDSo7d0X7zljF8UffnN7Tqshv
         3q2UQDJfaUFxhFO+ZHTTQvhfmyjgGa5wyQ5kah3qRs4yflJ8wiJz1JSv4qRY2S49DraQ
         R0ySKf8q9mrzXbgiq+p6sG+ckBQNg3RnjP0at48eXPg2LkEEfXRzGKX0FcvsLrxTNWFh
         8cPJ9ebAL/7KhX5mSPsdFLwXhm5ZufV6X1Jc7gfVFKSOyDSIveTk5gm1B1MI6sinRZG5
         SSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491983; x=1781096783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E0qnwksAnVibKLEOmCRSNsa6uG3n6snRRRntsiizK/M=;
        b=AP9RO2TNm8HIR8IUMHloCr9ceI2c6PulGxct+VJvR4qfse3h0Il8WbSe1Plvb/TOpF
         aWs8u96AM4s8LmHDfyrLtIjGWRx7PelySm7n5D1bPjA1MT1LC8Pp+VpRSFtpVXFFGG9X
         VdZ0DEr+AkFksG0NqCCMTjUjde87Jc1eFfPmcPy3UC+MYCLxoy7VGE9URB45wztjZUvF
         cgviu9dZwxlcuwqN/IzaOeWAT4MQRErcmsT4pRb3Qypmk+y6AB5t5h9bvKP4LOq3kouI
         HqN/nZP7F8AdfzpsnFd+wh7PX9NCg5y+5f3A467Sfp7+m06gv9SJVcyvd6ma+UwiDT/X
         eKsg==
X-Gm-Message-State: AOJu0Yzv0sltLaPDeirgh6/nrESO6SGD3CVCunzJmafMsiQjaKyiNoV0
	TgDKAphpcO7rUyUP0YNqsu2YNmSSJe8wtNxkYpfq2CGF/BaYut0ajImlVziA5UWW
X-Gm-Gg: Acq92OHFEPQOpTGsmjzcyAcCPlfkvi0cEM7ZgCn/bCMEjiAj1/3xD7OxIiUa9e0L8sZ
	bhCwrfQCQPkk/Z4ApDiCENPUW8e6nnU+7Ire4QhN2stKzDYIMTbMnAuqBuRbAGBu71rBBe0jHCc
	+OiVktEPDR4vOO7etWG+Wz6DzY7K+mvN1uPbmF5mXXD74SHXR4GqUbNT27jcVSnAvAS2iFQEnZo
	x6e+mduoMnggaAkONs7S7Pt4lY6c4SwTVT5Fe+EfePnr6eKGkGQ3kJgO4IH8pKmPiyXd3NE6LUw
	AGbZTvN+zcn0zr6mVpcZFoC8mlDGtFErz4nW26YfU1k5ZuhQgtU8sohUs9wMjoVeQS78Gz/n+uM
	Te85IOa1ZexIVmSXx75zHXD66QT+nfCYg7B3XneRLGoJTkI6DRlPtozhHXHB3yXbUjrxw0pAZJD
	gHCx0c71Xmo55hs5teW5LHorjq7lrUugBcLeXuxO4O40wgIdmbUTgW/x7mhTlNos02spezJ0Jb5
	/2Pu0vXdOGxH4D6OQmbgcymxb1vPlfsPv6L
X-Received: by 2002:a5d:4987:0:b0:451:3b12:9bca with SMTP id ffacd0b85a97d-46021831001mr3701447f8f.25.1780491983000;
        Wed, 03 Jun 2026 06:06:23 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v4 06/16] libs/call: cache up to 4 pages in hypercall bounce buffers
Date: Wed,  3 Jun 2026 14:05:53 +0100
Message-ID: <20260603130603.776452-7-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603130603.776452-1-frediano.ziglio@cloud.com>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1780491983-DAF72CF5-257ED0B1/0/0
X-purgate-type: clean
X-purgate-size: 4973
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 0F0BA637DB5

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
--
Changes since v2:
- change prefix in subject.
---
 tools/libs/call/buffer.c  | 28 +++++++++++++++++-----------
 tools/libs/call/core.c    |  3 ++-
 tools/libs/call/private.h |  8 +++++---
 3 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/tools/libs/call/buffer.c b/tools/libs/call/buffer.c
index 2579b8c719..15d2f98a6b 100644
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
2.54.0


