Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B858B7D91
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 18:50:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715057.1116553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgY-0005O0-Ks; Tue, 30 Apr 2024 16:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715057.1116553; Tue, 30 Apr 2024 16:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgY-0005Fw-Ai; Tue, 30 Apr 2024 16:50:30 +0000
Received: by outflank-mailman (input) for mailman id 715057;
 Tue, 30 Apr 2024 16:50:28 +0000
Received: from [94.247.172.50] (helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7/Z8=MD=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s1qgW-0003oL-Sw
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 16:50:28 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc8309ef-0711-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 18:50:23 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2db101c11beso69152331fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 09:50:23 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 d18-20020ac24c92000000b0051bbba4541bsm2593600lfl.165.2024.04.30.09.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:50:21 -0700 (PDT)
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
X-Inumbo-ID: bc8309ef-0711-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714495823; x=1715100623; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1t+fSrRYl5L3yQvPVldSqnOrtZxoJXX623JAMweDjXA=;
        b=I9Z5CReJxpo12aMXxcmq761o+9fQdvNXjP3/UODDLL794TidUhWbvhuj+JNBYcXi82
         AigNbNhqflp+nejy9rznB3nH+9f8UXVCILQS7ozv+PJi20cx8CGPq6B4IO/sFc/I40vL
         CIH+SNQ0Vvz7h30LVeBdmoyKtOCGsXCNX2CJRCjT5ZxN9csumeTI8C5Q6+ru7eCSno+3
         tTlWs9XQIQnEUyCd73U6gi3scPWqItAz9yiGVC4MSnB4uh3zoSIOiapUiyx+/K9CvS1v
         tMbc59kielf2BjHN4PT8l2mtMzOiOAWqh20qjO9FnB8krbvmIzUwapunFkHRVCVTOXFf
         DJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714495823; x=1715100623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1t+fSrRYl5L3yQvPVldSqnOrtZxoJXX623JAMweDjXA=;
        b=QwwTzG3KME1vDuKFn3wzos4vADHP9YWX+KGhSh3s3BlaLg9iwuugzfI8kyif75zOvk
         tW4+DXJ9wDiyhvqmS6p8eI4GQw/mEU+B9pij5XqNcHVAgtegZPOHalqSC4l+H7UHY9D4
         xU/jjFfSXuIJKW8R8LcppSek7XmiSvAOvJTcH3D1TMMU1UZeFPplPprT0pzv144OY477
         zsPm7FKTbTZ8cfYTj7l8NboG1H1+5xokRhMe7smOMxpTIxoo/HLALfvUMG/eJkHaQEcc
         D7MwZn/81PLAncESgUTGluKhBHNs9NmB/8b7baVt9dZGAAVZrBTUfaBz2hG6Osk/4t/r
         GsQw==
X-Forwarded-Encrypted: i=1; AJvYcCWvs3ZcXioRVSDc7VPpHoscgc1hpxMHuwTUk85EUGGisZqKJI9AeI+4hOrZNYsn1d7PEZDG1bTTQYPXuhN0S7NbY0a+c+Ri6eBGP2dt6ig=
X-Gm-Message-State: AOJu0YwcnSipqit3TNfPiMteGYQejXwJ8sX9HJbHNnykGzjKs0FBXJYh
	YuFNbK/2AI3rL6lmmGXmPxvMq4TyOschgegOAOeI6WLtg+LBqxuR
X-Google-Smtp-Source: AGHT+IH8tNB+OMEEjfoZnK00fenwXOTSLhumxvmYC1KCq8f4Ohl2Q8/E13IsvLGqDP3McXiamSkmOA==
X-Received: by 2002:a05:6512:3d23:b0:51d:682d:c2ab with SMTP id d35-20020a0565123d2300b0051d682dc2abmr35470lfv.32.1714495822602;
        Tue, 30 Apr 2024 09:50:22 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 07/17] xen: mapcache: Refactor xen_replace_cache_entry_unlocked
Date: Tue, 30 Apr 2024 18:49:29 +0200
Message-Id: <20240430164939.925307-8-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240430164939.925307-1-edgar.iglesias@gmail.com>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add MapCache argument to xen_replace_cache_entry_unlocked in
preparation for supporting multiple map caches.

No functional change.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-mapcache.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index d2deff70c8..6e758eff94 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -556,7 +556,8 @@ void xen_invalidate_map_cache(void)
     mapcache_unlock(mapcache);
 }
 
-static uint8_t *xen_replace_cache_entry_unlocked(hwaddr old_phys_addr,
+static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
+                                                 hwaddr old_phys_addr,
                                                  hwaddr new_phys_addr,
                                                  hwaddr size)
 {
@@ -578,7 +579,7 @@ static uint8_t *xen_replace_cache_entry_unlocked(hwaddr old_phys_addr,
         cache_size += MCACHE_BUCKET_SIZE - (cache_size % MCACHE_BUCKET_SIZE);
     }
 
-    entry = &mapcache->entry[address_index % mapcache->nr_buckets];
+    entry = &mc->entry[address_index % mc->nr_buckets];
     while (entry && !(entry->paddr_index == address_index &&
                       entry->size == cache_size)) {
         entry = entry->next;
@@ -614,7 +615,8 @@ uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
     uint8_t *p;
 
     mapcache_lock(mapcache);
-    p = xen_replace_cache_entry_unlocked(old_phys_addr, new_phys_addr, size);
+    p = xen_replace_cache_entry_unlocked(mapcache, old_phys_addr,
+                                         new_phys_addr, size);
     mapcache_unlock(mapcache);
     return p;
 }
-- 
2.40.1


