Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 821FB8B7D98
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 18:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715051.1116498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgP-00045Q-VO; Tue, 30 Apr 2024 16:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715051.1116498; Tue, 30 Apr 2024 16:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgP-00042l-Sa; Tue, 30 Apr 2024 16:50:21 +0000
Received: by outflank-mailman (input) for mailman id 715051;
 Tue, 30 Apr 2024 16:50:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7/Z8=MD=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s1qgO-0003oO-8D
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 16:50:20 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba7eca0e-0711-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 18:50:19 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-516d2600569so7363224e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 09:50:19 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 y26-20020ac2421a000000b0051aada24366sm4312545lfh.66.2024.04.30.09.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:50:18 -0700 (PDT)
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
X-Inumbo-ID: ba7eca0e-0711-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714495819; x=1715100619; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHpYiWdb1lRh1fu1PHA0f9wMvB4Yb/LL+pZsTJlPtLc=;
        b=CP4wnhEgxWoYJDFkX1dZuB35ZWnoJ5OWn0NNf6gJc3Clh9I8iRRV00ck3K5NpwWUi1
         Z7WNsmF6nitJVzlsuCcuPqSLKVCTDgcAbsjlwhN1iPDGC10DAt9vdn9p2SQdpFZqM204
         jLhmAx2AnbQpjQrd+mQUu4TwYyzXR9JrRlKwE5MBnZ1Y9I8QmQfM/F1FLSjJTpHNfL+W
         lNhKF18/l/wAA+iyjKkuREKgkAr2PCZRjHah+6y8THQ9+E0NoCC0lMyVGN+oCAywPTT1
         KHgTKqGDvgKAq7yj41k1ZqVVRwFACPUHrYuW1eX0l6odnKkUkWTd+3kDTIAo4OTgmXrl
         1UEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714495819; x=1715100619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHpYiWdb1lRh1fu1PHA0f9wMvB4Yb/LL+pZsTJlPtLc=;
        b=HPC900EL+DkO3B15lW+Qpeg3byzBC0KNKJbLby4FxjkdZf3dS5t+58jbZIYegVVeuV
         lLD9sOycqOtHgAyTSpBOK69FnidGhQ2ZLd7Nltvxi0NOG2yy6wdgTDe2fX89dOahxsKu
         IiE3NFd8829GEoCtAzWrCfEdRl1J4fjEk84t99gFB/y7CUSx6Y6pBIwFto/G2dbNMvYb
         Z5Q8JeiNZVEsrx1o56abRszfo7LcWx/hT7iWtvLXJVm03sGoeWUlq8F3xRu65LwQasTz
         OGlSTNa2A8im5Tj+6Dszy0e+GaSD8xFXY5Iu+26JP9ekpDkCJQWjfhLvkaZ4vZQ2n8Qa
         pxHA==
X-Forwarded-Encrypted: i=1; AJvYcCX67xOcchdI97JkO/V+mg+nMCoVlakA+SAlnymPcElBBgqEmqN1KBjYZb0dmNUQVAX2Toqr6S+8sAbJ8eWy92T7l50OhX/pzQQkfc1NL2E=
X-Gm-Message-State: AOJu0YzVZhN3POhzFdq1gJ+8MqO3AzusQN+m3yT0w2aitj2th+GHCt3F
	NDe7jiKa9Db3dPxvt7JViSk3BKsO5ixwBiuG1GcM9dHtI295bzT3
X-Google-Smtp-Source: AGHT+IEpEAlJbJJD0/i+Lg344tcB9Tgltle5Mn6nu5CvyosHwr7HnsfYB92Ti4D7O/r40axqDFX0Iw==
X-Received: by 2002:a05:6512:3981:b0:51b:f224:7025 with SMTP id j1-20020a056512398100b0051bf2247025mr20846lfu.59.1714495819141;
        Tue, 30 Apr 2024 09:50:19 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 05/17] xen: mapcache: Refactor xen_remap_bucket for multi-instance
Date: Tue, 30 Apr 2024 18:49:27 +0200
Message-Id: <20240430164939.925307-6-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240430164939.925307-1-edgar.iglesias@gmail.com>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add MapCache argument to xen_remap_bucket in preparation
to support multiple map caches.

No functional changes.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-mapcache.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 896021d86f..326a9b61ca 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -139,7 +139,8 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
     mapcache->entry = g_malloc0(size);
 }
 
-static void xen_remap_bucket(MapCacheEntry *entry,
+static void xen_remap_bucket(MapCache *mc,
+                             MapCacheEntry *entry,
                              void *vaddr,
                              hwaddr size,
                              hwaddr address_index,
@@ -313,14 +314,14 @@ tryagain:
     if (!entry) {
         entry = g_new0(MapCacheEntry, 1);
         pentry->next = entry;
-        xen_remap_bucket(entry, NULL, cache_size, address_index, dummy);
+        xen_remap_bucket(mc, entry, NULL, cache_size, address_index, dummy);
     } else if (!entry->lock) {
         if (!entry->vaddr_base || entry->paddr_index != address_index ||
                 entry->size != cache_size ||
                 !test_bits(address_offset >> XC_PAGE_SHIFT,
                     test_bit_size >> XC_PAGE_SHIFT,
                     entry->valid_mapping)) {
-            xen_remap_bucket(entry, NULL, cache_size, address_index, dummy);
+            xen_remap_bucket(mc, entry, NULL, cache_size, address_index, dummy);
         }
     }
 
@@ -587,7 +588,7 @@ static uint8_t *xen_replace_cache_entry_unlocked(hwaddr old_phys_addr,
 
     trace_xen_replace_cache_entry_dummy(old_phys_addr, new_phys_addr);
 
-    xen_remap_bucket(entry, entry->vaddr_base,
+    xen_remap_bucket(mapcache, entry, entry->vaddr_base,
                      cache_size, address_index, false);
     if (!test_bits(address_offset >> XC_PAGE_SHIFT,
                 test_bit_size >> XC_PAGE_SHIFT,
-- 
2.40.1


