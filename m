Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE9F8B7D93
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 18:50:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715054.1116520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgW-0004Ze-8D; Tue, 30 Apr 2024 16:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715054.1116520; Tue, 30 Apr 2024 16:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgV-0004Rv-Up; Tue, 30 Apr 2024 16:50:27 +0000
Received: by outflank-mailman (input) for mailman id 715054;
 Tue, 30 Apr 2024 16:50:26 +0000
Received: from [94.247.172.50] (helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7/Z8=MD=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s1qgU-0003oL-Sr
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 16:50:26 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8959ab7-0711-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 18:50:16 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2e049cfe645so88171fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 09:50:16 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a2e9992000000b002d43737e2d7sm4149404lji.30.2024.04.30.09.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:50:14 -0700 (PDT)
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
X-Inumbo-ID: b8959ab7-0711-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714495816; x=1715100616; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIVDaUdlQrWMVCAAwSwRQuE7c0313SXxgYK41vL15nU=;
        b=B8gkTf++nosRLAD1kYAg10sBmcwVa5ypMEgmjGLDuAX32jNHABdSZuMuE7TuM/a2rE
         5IiaiFBWqThJ5F9mg8ZU+rlWgf/W8xwkWTZug2jhUOrfrkoIFp5bXU12JETI1UrhfCl7
         fWI9l1+52nz8q4pNI+TUUsdeQz5+9Tdzl6LnMFs4XGbm+5WhGfZmW0PTUu3tp8lXVPdJ
         k8BEjX/FrAvPPmcUEztFLy5El34t+6uLHFgZdepbnDI5mtuB34fZ0SnrE5lx7WVP2pPY
         9yIu5p6gszD+2hadgBGnogd6mCYGYoUdevpO87cYxrzapKCCKK2h2posK5g3QP/J1vj2
         ptPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714495816; x=1715100616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIVDaUdlQrWMVCAAwSwRQuE7c0313SXxgYK41vL15nU=;
        b=d+idKuhHQi1XOUMwezFprvfENQgW3RNOkyq4Rc5InxUqSTltJ/nVFW/uf22t5r4SRs
         RLOG1GcgzAG7j8BZMq/ygX4ZVsa1QVgeJfrfPd3crthULfWJoEy5JTyzWT+yWor3sqPb
         E1ZPPGLF3lAvzeLB67GOtpoARpWVha9juoZyhMRxJSuV0EybcCumcud21R3aGAMDU8Pt
         0/sYqrdHSQ6mu9XoaJoVUUTm789nk8NfFIhYni6A4EU1NfyCqq4nVyAbONkPDDii4TSY
         G9sKOek1ndKKTpfR/lWJVnHzLe/o/khnKYRiTnlz6YWuc2lraoOIwmLFwedFJLx+DVvO
         ajVw==
X-Forwarded-Encrypted: i=1; AJvYcCXjZEl9AFXHgGQ+Ytl+XGAQAhp0D2hSmBMEhz1psrNlQpiv5ZVYAz6w8mrGVjoVcV29oyUucmnMvBY0b8f/IjBSSgycMzOJqi2Otedyuvw=
X-Gm-Message-State: AOJu0YxODipoV14NcrqujGCTnY7NuvDOgwSVBTVah0I6LlT7UCVg1Grq
	EOBJmwfThm1ry4SeCjQPWpn21CJewJoK1HBZcL3PkUSHo0lpW4/7
X-Google-Smtp-Source: AGHT+IEhqhmi+/uuFz1Fbog5DE/AV1r+HDsD1UwlwkpNuWJf7wobBS9AqtJFN1Xw/CHLkbbpd70bvw==
X-Received: by 2002:a2e:bc0a:0:b0:2d8:4c1d:10fc with SMTP id b10-20020a2ebc0a000000b002d84c1d10fcmr1419744ljf.18.1714495816046;
        Tue, 30 Apr 2024 09:50:16 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 03/17] xen: mapcache: Refactor lock functions for multi-instance
Date: Tue, 30 Apr 2024 18:49:25 +0200
Message-Id: <20240430164939.925307-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240430164939.925307-1-edgar.iglesias@gmail.com>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Make the lock functions take MapCache * as argument. This is
in preparation for supporting multiple caches.

No functional changes.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-mapcache.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index b7cefb78f7..3f11562075 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -74,14 +74,14 @@ typedef struct MapCache {
 
 static MapCache *mapcache;
 
-static inline void mapcache_lock(void)
+static inline void mapcache_lock(MapCache *mc)
 {
-    qemu_mutex_lock(&mapcache->lock);
+    qemu_mutex_lock(&mc->lock);
 }
 
-static inline void mapcache_unlock(void)
+static inline void mapcache_unlock(MapCache *mc)
 {
-    qemu_mutex_unlock(&mapcache->lock);
+    qemu_mutex_unlock(&mc->lock);
 }
 
 static inline int test_bits(int nr, int size, const unsigned long *addr)
@@ -369,9 +369,9 @@ uint8_t *xen_map_cache(hwaddr phys_addr, hwaddr size,
 {
     uint8_t *p;
 
-    mapcache_lock();
+    mapcache_lock(mapcache);
     p = xen_map_cache_unlocked(phys_addr, size, lock, dma);
-    mapcache_unlock();
+    mapcache_unlock(mapcache);
     return p;
 }
 
@@ -384,7 +384,7 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
     ram_addr_t raddr;
     int found = 0;
 
-    mapcache_lock();
+    mapcache_lock(mapcache);
     QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
         if (reventry->vaddr_req == ptr) {
             paddr_index = reventry->paddr_index;
@@ -394,7 +394,7 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
         }
     }
     if (!found) {
-        mapcache_unlock();
+        mapcache_unlock(mapcache);
         return RAM_ADDR_INVALID;
     }
 
@@ -409,7 +409,7 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
         raddr = (reventry->paddr_index << MCACHE_BUCKET_SHIFT) +
              ((unsigned long) ptr - (unsigned long) entry->vaddr_base);
     }
-    mapcache_unlock();
+    mapcache_unlock(mapcache);
     return raddr;
 }
 
@@ -480,9 +480,9 @@ static void xen_invalidate_map_cache_entry_bh(void *opaque)
 {
     XenMapCacheData *data = opaque;
 
-    mapcache_lock();
+    mapcache_lock(mapcache);
     xen_invalidate_map_cache_entry_unlocked(data->buffer);
-    mapcache_unlock();
+    mapcache_unlock(mapcache);
 
     aio_co_wake(data->co);
 }
@@ -498,9 +498,9 @@ void coroutine_mixed_fn xen_invalidate_map_cache_entry(uint8_t *buffer)
                                 xen_invalidate_map_cache_entry_bh, &data);
         qemu_coroutine_yield();
     } else {
-        mapcache_lock();
+        mapcache_lock(mapcache);
         xen_invalidate_map_cache_entry_unlocked(buffer);
-        mapcache_unlock();
+        mapcache_unlock(mapcache);
     }
 }
 
@@ -512,7 +512,7 @@ void xen_invalidate_map_cache(void)
     /* Flush pending AIO before destroying the mapcache */
     bdrv_drain_all();
 
-    mapcache_lock();
+    mapcache_lock(mapcache);
 
     QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
         if (!reventry->dma) {
@@ -546,7 +546,7 @@ void xen_invalidate_map_cache(void)
 
     mapcache->last_entry = NULL;
 
-    mapcache_unlock();
+    mapcache_unlock(mapcache);
 }
 
 static uint8_t *xen_replace_cache_entry_unlocked(hwaddr old_phys_addr,
@@ -606,8 +606,8 @@ uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
 {
     uint8_t *p;
 
-    mapcache_lock();
+    mapcache_lock(mapcache);
     p = xen_replace_cache_entry_unlocked(old_phys_addr, new_phys_addr, size);
-    mapcache_unlock();
+    mapcache_unlock(mapcache);
     return p;
 }
-- 
2.40.1


