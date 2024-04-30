Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7458B7D97
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 18:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715055.1116527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgW-0004f5-Ht; Tue, 30 Apr 2024 16:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715055.1116527; Tue, 30 Apr 2024 16:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgW-0004YJ-B7; Tue, 30 Apr 2024 16:50:28 +0000
Received: by outflank-mailman (input) for mailman id 715055;
 Tue, 30 Apr 2024 16:50:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7/Z8=MD=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s1qgV-0003oO-1H
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 16:50:27 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be96d88a-0711-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 18:50:26 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5196fe87775so6618119e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 09:50:26 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a197518000000b00518b91e8fd7sm4495626lfe.235.2024.04.30.09.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:50:25 -0700 (PDT)
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
X-Inumbo-ID: be96d88a-0711-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714495826; x=1715100626; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kom/SHDfVUZpmIZv8oD+sehGVIlmksQJn6703to5aOw=;
        b=SV0KzIh0CZMuRJRNmROrp7uDRNRHphfeW6alYywSBbSBtIt+2iooagzErGW7R2F9lF
         1419QQJGPVHm0kh34cyb12zdGVPRblEE5sEO0bOZdkYiXnlBa3x/ZXyIs+O9F/txoRe/
         FDISxM4Nsd4fYSi4zn75y1kHAyyQkQ2fBTyLFx6Ci4q4LaeD9kwpexuSpdUy8VAuF27p
         ZozmHzxrHC0VlrLFU2YX3DcPdxDoDmtZM69bsDGf3QAWwZSKfvnh4A6aNhdoVQh0dRF0
         gvUozpfM12xogzixpWcxnGnmu8ENC1ifqHnrCUhRWjIczuu6Wv152w9xj9LumGF5/ZA2
         k3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714495826; x=1715100626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kom/SHDfVUZpmIZv8oD+sehGVIlmksQJn6703to5aOw=;
        b=Mo3GS0r8Ulw24Fk9tK/IIRfOmH4H1PF0FckLKexzsEru3Yi/xVl5NknQGn3bFTYAe1
         2dvFWGv1cc8PENZxUI976uffhKADH3iX9qOFaew1m2xM7r1tKrdQ/Qc+pPd8iFmhm2Gi
         /lCUnDteH9KTRAW2fZ6iNUn5rvV5eNaJb4G0nwxMUpRusICdrCGa9mh3LKvX2KygzAX4
         9xTZXz5piCebs7ohLUATFHddmIfUC/Y359zEql56wJVN7JGbHGG6fAQgNnCH34voxhAw
         95syM1/wjnmuc18X6HbYaBiHxUBGOEwBbbL8W7fpzfsEVPupzKQGTiKY9PfqbUXNow4u
         woIA==
X-Forwarded-Encrypted: i=1; AJvYcCXyFRgonfsffjeN2LOt3+PSzYT1q0krF+SWcqFniy/eywiqXRTHCd/v1unUGsbibdcmOQHcGrjUyliT3QPck0o0GS76TVcRZkmK/ZeqizI=
X-Gm-Message-State: AOJu0YzSF631bGVMM2yoYj0usUXSRdw0voBv/wKNiNtGk8Ih1pwDDSbO
	jpssq4DFfHCKUN38bcWP+UOe/jcOvdakfEGhLp+k6iJddZVMvKlYVD7n5UKX
X-Google-Smtp-Source: AGHT+IFL7xixQZzyY4IgwLtRiYEyYk+uUHOVAzj9b5xqr6eOpzsgiDsvBW99qrlkBchrQCMFWP2fRg==
X-Received: by 2002:ac2:5a50:0:b0:51c:f898:60cb with SMTP id r16-20020ac25a50000000b0051cf89860cbmr15984lfn.35.1714495826099;
        Tue, 30 Apr 2024 09:50:26 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 09/17] xen: mapcache: Break out xen_invalidate_map_cache_single()
Date: Tue, 30 Apr 2024 18:49:31 +0200
Message-Id: <20240430164939.925307-10-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240430164939.925307-1-edgar.iglesias@gmail.com>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Break out xen_invalidate_map_cache_single().

No functional changes.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-mapcache.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 34454da2f6..dd08cd296b 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -512,17 +512,14 @@ void coroutine_mixed_fn xen_invalidate_map_cache_entry(uint8_t *buffer)
     }
 }
 
-void xen_invalidate_map_cache(void)
+static void xen_invalidate_map_cache_single(MapCache *mc)
 {
     unsigned long i;
     MapCacheRev *reventry;
 
-    /* Flush pending AIO before destroying the mapcache */
-    bdrv_drain_all();
-
-    mapcache_lock(mapcache);
+    mapcache_lock(mc);
 
-    QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
+    QTAILQ_FOREACH(reventry, &mc->locked_entries, next) {
         if (!reventry->dma) {
             continue;
         }
@@ -530,8 +527,8 @@ void xen_invalidate_map_cache(void)
                                        reventry->vaddr_req);
     }
 
-    for (i = 0; i < mapcache->nr_buckets; i++) {
-        MapCacheEntry *entry = &mapcache->entry[i];
+    for (i = 0; i < mc->nr_buckets; i++) {
+        MapCacheEntry *entry = &mc->entry[i];
 
         if (entry->vaddr_base == NULL) {
             continue;
@@ -552,9 +549,17 @@ void xen_invalidate_map_cache(void)
         entry->valid_mapping = NULL;
     }
 
-    mapcache->last_entry = NULL;
+    mc->last_entry = NULL;
 
-    mapcache_unlock(mapcache);
+    mapcache_unlock(mc);
+}
+
+void xen_invalidate_map_cache(void)
+{
+    /* Flush pending AIO before destroying the mapcache */
+    bdrv_drain_all();
+
+    xen_invalidate_map_cache_single(mapcache);
 }
 
 static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
-- 
2.40.1


