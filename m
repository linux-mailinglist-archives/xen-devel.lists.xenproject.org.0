Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBA28B7D9F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 18:51:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715050.1116488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgO-0003qN-Nk; Tue, 30 Apr 2024 16:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715050.1116488; Tue, 30 Apr 2024 16:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgO-0003oZ-Kw; Tue, 30 Apr 2024 16:50:20 +0000
Received: by outflank-mailman (input) for mailman id 715050;
 Tue, 30 Apr 2024 16:50:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7/Z8=MD=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s1qgN-0003oO-Bz
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 16:50:19 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9969a07-0711-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 18:50:18 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2dac77cdf43so75645131fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 09:50:18 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 b20-20020a2e8954000000b002de1f99164csm2505323ljk.59.2024.04.30.09.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:50:16 -0700 (PDT)
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
X-Inumbo-ID: b9969a07-0711-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714495818; x=1715100618; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRQG1XAsOj2ShCk3Z8R9KMtS/JhvbfkQx/NMqL6gExE=;
        b=BIrsbAq2AFIajidX8ZlJMr510TnGVF9lbzuSogUmnbg4QHKN90mp3qLP+IvvecL1yt
         +SX1BkSWd6uCDFct/mclKSL1LM5OWCD1sv/2g3jgjnKLMPlVNU/qaV5DBVdbputkTl3w
         l5ZN7rKocmgSC7rwvD2K1mp772MFqTHVPLwz8FhYYNPdLPCEzWdtf+4ZMHFQAmQiTXBt
         SVUIslgldRwlSoqTvgRD4TcikpX8njYqDprf0/EAWl1qZ+egbwf40bYSxF4V3y1q4Tw/
         onhl4Q5hUfaVT64fNAm8/6lCj6+4aljYt6L3/PhRpkzUobTlVoCTwgqg9yRungwXv+vi
         koeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714495818; x=1715100618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RRQG1XAsOj2ShCk3Z8R9KMtS/JhvbfkQx/NMqL6gExE=;
        b=bMZUDdgHXGuHc5pPfT0KkfKBY2iN0sV8n3FFy0nZwhW1cZK2mo3oAF1lOBI166I2aW
         nj2gc17MKKofEenlXFC+lrclkOKZP8jtpsre/Rcz90frv4rd30jE6GV55AzGjk9tgY5o
         7wptiVmixC68sXgLXlnbU8tZ4ATAuuiBVyYlGhTnApKZLhAg4tVsLV9qbdCvkky6UmOn
         Xbam1h/elCjH/yB6HgJwyzC2dCVjm9T/H/scXqNHI+7lgIad+bZL/rpLg6MUW5IC2lio
         ek8bflx7AoI454ICUvxgf5qKOz4phbdsPFAEHdnctGNM1meeMsLIddvxAqOccF/W4V5U
         FxSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6ZKjWGbArE0ww8NWpP7SDWz/MqEt6M2A2nhPhuDgKMPvdWrlfV1Vpj6fG60Ny4oTHLWa1tXkO/cRdrR/yx5xATPXDilAU3htjPX/BYtA=
X-Gm-Message-State: AOJu0YxaK76NP7rzZNFBZLc4Gnru9l5A4Bq9Gz7r9MilDc7+w4OZhp7N
	UjkOZK3G8S7dgrSBTKVNTXw9snD8n0tLO1bCcElohiKex81ixZUZ
X-Google-Smtp-Source: AGHT+IE34gVM99Avj5+WmVE3KuiSoituQU+AW25n3ZdTsIBUm8HTeWHDkI6iQxAgmbV9XWek/HUgxw==
X-Received: by 2002:a2e:9516:0:b0:2d8:63a2:50d2 with SMTP id f22-20020a2e9516000000b002d863a250d2mr213248ljh.6.1714495817622;
        Tue, 30 Apr 2024 09:50:17 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 04/17] xen: mapcache: Refactor xen_map_cache for multi-instance
Date: Tue, 30 Apr 2024 18:49:26 +0200
Message-Id: <20240430164939.925307-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240430164939.925307-1-edgar.iglesias@gmail.com>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Make xen_map_cache take a MapCache as argument. This is in
prepaparation to support multiple map caches.

No functional changes.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-mapcache.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 3f11562075..896021d86f 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -240,7 +240,8 @@ static void xen_remap_bucket(MapCacheEntry *entry,
     g_free(err);
 }
 
-static uint8_t *xen_map_cache_unlocked(hwaddr phys_addr, hwaddr size,
+static uint8_t *xen_map_cache_unlocked(MapCache *mc,
+                                       hwaddr phys_addr, hwaddr size,
                                        uint8_t lock, bool dma)
 {
     MapCacheEntry *entry, *pentry = NULL,
@@ -269,16 +270,16 @@ tryagain:
         test_bit_size = XC_PAGE_SIZE;
     }
 
-    if (mapcache->last_entry != NULL &&
-        mapcache->last_entry->paddr_index == address_index &&
+    if (mc->last_entry != NULL &&
+        mc->last_entry->paddr_index == address_index &&
         !lock && !size &&
         test_bits(address_offset >> XC_PAGE_SHIFT,
                   test_bit_size >> XC_PAGE_SHIFT,
-                  mapcache->last_entry->valid_mapping)) {
+                  mc->last_entry->valid_mapping)) {
         trace_xen_map_cache_return(
-            mapcache->last_entry->vaddr_base + address_offset
+            mc->last_entry->vaddr_base + address_offset
         );
-        return mapcache->last_entry->vaddr_base + address_offset;
+        return mc->last_entry->vaddr_base + address_offset;
     }
 
     /* size is always a multiple of MCACHE_BUCKET_SIZE */
@@ -291,7 +292,7 @@ tryagain:
         cache_size = MCACHE_BUCKET_SIZE;
     }
 
-    entry = &mapcache->entry[address_index % mapcache->nr_buckets];
+    entry = &mc->entry[address_index % mc->nr_buckets];
 
     while (entry && (lock || entry->lock) && entry->vaddr_base &&
             (entry->paddr_index != address_index || entry->size != cache_size ||
@@ -326,10 +327,10 @@ tryagain:
     if(!test_bits(address_offset >> XC_PAGE_SHIFT,
                 test_bit_size >> XC_PAGE_SHIFT,
                 entry->valid_mapping)) {
-        mapcache->last_entry = NULL;
+        mc->last_entry = NULL;
 #ifdef XEN_COMPAT_PHYSMAP
-        if (!translated && mapcache->phys_offset_to_gaddr) {
-            phys_addr = mapcache->phys_offset_to_gaddr(phys_addr, size);
+        if (!translated && mc->phys_offset_to_gaddr) {
+            phys_addr = mc->phys_offset_to_gaddr(phys_addr, size);
             translated = true;
             goto tryagain;
         }
@@ -342,7 +343,7 @@ tryagain:
         return NULL;
     }
 
-    mapcache->last_entry = entry;
+    mc->last_entry = entry;
     if (lock) {
         MapCacheRev *reventry = g_new0(MapCacheRev, 1);
         entry->lock++;
@@ -352,16 +353,16 @@ tryagain:
             abort();
         }
         reventry->dma = dma;
-        reventry->vaddr_req = mapcache->last_entry->vaddr_base + address_offset;
-        reventry->paddr_index = mapcache->last_entry->paddr_index;
+        reventry->vaddr_req = mc->last_entry->vaddr_base + address_offset;
+        reventry->paddr_index = mc->last_entry->paddr_index;
         reventry->size = entry->size;
-        QTAILQ_INSERT_HEAD(&mapcache->locked_entries, reventry, next);
+        QTAILQ_INSERT_HEAD(&mc->locked_entries, reventry, next);
     }
 
     trace_xen_map_cache_return(
-        mapcache->last_entry->vaddr_base + address_offset
+        mc->last_entry->vaddr_base + address_offset
     );
-    return mapcache->last_entry->vaddr_base + address_offset;
+    return mc->last_entry->vaddr_base + address_offset;
 }
 
 uint8_t *xen_map_cache(hwaddr phys_addr, hwaddr size,
@@ -370,7 +371,7 @@ uint8_t *xen_map_cache(hwaddr phys_addr, hwaddr size,
     uint8_t *p;
 
     mapcache_lock(mapcache);
-    p = xen_map_cache_unlocked(phys_addr, size, lock, dma);
+    p = xen_map_cache_unlocked(mapcache, phys_addr, size, lock, dma);
     mapcache_unlock(mapcache);
     return p;
 }
-- 
2.40.1


