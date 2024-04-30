Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C2A8B7D9E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 18:51:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715052.1116507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgV-0004Kk-7m; Tue, 30 Apr 2024 16:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715052.1116507; Tue, 30 Apr 2024 16:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgV-0004J7-3j; Tue, 30 Apr 2024 16:50:27 +0000
Received: by outflank-mailman (input) for mailman id 715052;
 Tue, 30 Apr 2024 16:50:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7/Z8=MD=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s1qgT-0003oO-Ic
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 16:50:25 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdb105fa-0711-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 18:50:25 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-516d264d0e4so10924e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 09:50:25 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a197012000000b0051d9149a2cesm917564lfc.84.2024.04.30.09.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:50:23 -0700 (PDT)
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
X-Inumbo-ID: bdb105fa-0711-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714495824; x=1715100624; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fl7u/xU9kjPK32PHrP3OybWWMA4e16GqaL6Xbstmvbo=;
        b=GHhjqpPSU4kT7Um5onInyv/0qvcJl2zA2c1xkaf/qeq1ZkLjW/hbwXJHt5mZ7OQo+a
         m9v1BeTZA7V/fpwSIOFb4aHyC1NFXzvvVNCkYfugEHaNX8a8BJRzn0nB0qu7dFLf8VP+
         mcr8saXq0H5AqcWzah9soVrtaivnyeuTraY06weik3fSC3d/FrXOPhRSTs0c+bzhyhdH
         11eh3WQETYNg8NKGlGmucBkw1ADhq1kQc08Ug4AvHPiwArrINQjJd1FGJzTiMTD3VnBQ
         8cZqBshbJ1SF3Cwpg2AxseL4/+eI5BfVNzcaJm5hL5jofmFqtXfU2+POfMdMl5KBqRW5
         XtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714495824; x=1715100624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fl7u/xU9kjPK32PHrP3OybWWMA4e16GqaL6Xbstmvbo=;
        b=mTMuhlIRWVoEZltI4+2YaDwh5XAg4sdY3qJkZhDTV564Tx/H/df9j049jmfCnjWmsJ
         viYvFHR7W8Ax0qPWeInRbpcR0NR/mRIr8QxfZ9pE9hSkK20OV2KPUlblL6phxxja1u3c
         m1kZOee2sFaHIJoQis3skcZpSTWn0MKI5CP1+9etyoTE2Sab3s2QbAjzCCZYiRFEU+KI
         JIEY9/aXql0SaLj24fpTUvYRIOwatMHq+hrizk2fZt1/nslZ9meOx2zSzcdzWSDfWcd9
         Vae4+xIwWUcVNJEzk8xzR7UB11ZSzjqdl4SfeevQz7jnXMAS96EM9jzwbqbj5HxKQ/t9
         mz+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXonagH/5sTaxwLVMHy3ZyWkHQGsVDkSrAyZa0+tY58el4la0Z4qj4nCvA5KaNOh3xuELe18PLmLM96b0Tbzl7CfZDIYih7AKjAdR1tww4=
X-Gm-Message-State: AOJu0YwPlEaPuJ91Mu65byYzx3gpQMV+Z1mc4YkS86kRDO1MkHkzl0jV
	au2EItUCGriWGj7qobxRMvMlQ0avXfy91Fpl7N7Q9iCbYjhdv1h6
X-Google-Smtp-Source: AGHT+IEr1VKCghuiim9RyIssq8iqWzgedXC6VPdssb/073WGO5FTX1lD3Adw0P8JM08/qNMg1AdtBQ==
X-Received: by 2002:ac2:5f01:0:b0:51d:6630:b83f with SMTP id 1-20020ac25f01000000b0051d6630b83fmr89702lfq.17.1714495824584;
        Tue, 30 Apr 2024 09:50:24 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 08/17] xen: mapcache: Refactor xen_invalidate_map_cache_entry_unlocked
Date: Tue, 30 Apr 2024 18:49:30 +0200
Message-Id: <20240430164939.925307-9-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240430164939.925307-1-edgar.iglesias@gmail.com>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add MapCache argument to xen_invalidate_map_cache_entry_unlocked.
This is in preparation for supporting multiple map caches.

No functional changes.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-mapcache.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 6e758eff94..34454da2f6 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -420,7 +420,8 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
     return xen_ram_addr_from_mapcache_single(mapcache, ptr);
 }
 
-static void xen_invalidate_map_cache_entry_unlocked(uint8_t *buffer)
+static void xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
+                                                    uint8_t *buffer)
 {
     MapCacheEntry *entry = NULL, *pentry = NULL;
     MapCacheRev *reventry;
@@ -428,7 +429,7 @@ static void xen_invalidate_map_cache_entry_unlocked(uint8_t *buffer)
     hwaddr size;
     int found = 0;
 
-    QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
+    QTAILQ_FOREACH(reventry, &mc->locked_entries, next) {
         if (reventry->vaddr_req == buffer) {
             paddr_index = reventry->paddr_index;
             size = reventry->size;
@@ -438,7 +439,7 @@ static void xen_invalidate_map_cache_entry_unlocked(uint8_t *buffer)
     }
     if (!found) {
         trace_xen_invalidate_map_cache_entry_unlocked_not_found(buffer);
-        QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
+        QTAILQ_FOREACH(reventry, &mc->locked_entries, next) {
             trace_xen_invalidate_map_cache_entry_unlocked_found(
                 reventry->paddr_index,
                 reventry->vaddr_req
@@ -446,15 +447,15 @@ static void xen_invalidate_map_cache_entry_unlocked(uint8_t *buffer)
         }
         return;
     }
-    QTAILQ_REMOVE(&mapcache->locked_entries, reventry, next);
+    QTAILQ_REMOVE(&mc->locked_entries, reventry, next);
     g_free(reventry);
 
-    if (mapcache->last_entry != NULL &&
-        mapcache->last_entry->paddr_index == paddr_index) {
-        mapcache->last_entry = NULL;
+    if (mc->last_entry != NULL &&
+        mc->last_entry->paddr_index == paddr_index) {
+        mc->last_entry = NULL;
     }
 
-    entry = &mapcache->entry[paddr_index % mapcache->nr_buckets];
+    entry = &mc->entry[paddr_index % mc->nr_buckets];
     while (entry && (entry->paddr_index != paddr_index || entry->size != size)) {
         pentry = entry;
         entry = entry->next;
@@ -488,7 +489,7 @@ static void xen_invalidate_map_cache_entry_bh(void *opaque)
     XenMapCacheData *data = opaque;
 
     mapcache_lock(mapcache);
-    xen_invalidate_map_cache_entry_unlocked(data->buffer);
+    xen_invalidate_map_cache_entry_unlocked(mapcache, data->buffer);
     mapcache_unlock(mapcache);
 
     aio_co_wake(data->co);
@@ -506,7 +507,7 @@ void coroutine_mixed_fn xen_invalidate_map_cache_entry(uint8_t *buffer)
         qemu_coroutine_yield();
     } else {
         mapcache_lock(mapcache);
-        xen_invalidate_map_cache_entry_unlocked(buffer);
+        xen_invalidate_map_cache_entry_unlocked(mapcache, buffer);
         mapcache_unlock(mapcache);
     }
 }
-- 
2.40.1


