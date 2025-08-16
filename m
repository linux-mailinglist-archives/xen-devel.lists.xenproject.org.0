Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 524FDB28D59
	for <lists+xen-devel@lfdr.de>; Sat, 16 Aug 2025 13:21:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1084446.1443597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unExx-0006Mh-Dv; Sat, 16 Aug 2025 11:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1084446.1443597; Sat, 16 Aug 2025 11:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unExx-0006K6-As; Sat, 16 Aug 2025 11:20:53 +0000
Received: by outflank-mailman (input) for mailman id 1084446;
 Sat, 16 Aug 2025 11:20:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UO4R=24=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1unExw-0006Jf-6x
 for xen-devel@lists.xenproject.org; Sat, 16 Aug 2025 11:20:52 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1113acd7-7a93-11f0-a328-13f23c93f187;
 Sat, 16 Aug 2025 13:20:51 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45a1abf5466so14764555e9.0
 for <xen-devel@lists.xenproject.org>; Sat, 16 Aug 2025 04:20:51 -0700 (PDT)
Received: from MinisforumBD795m.citrite.net
 ([2a02:1748:f7df:8cb1:3992:b1e9:da8a:3f30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a27ec6b71sm13852325e9.10.2025.08.16.04.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 04:20:50 -0700 (PDT)
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
X-Inumbo-ID: 1113acd7-7a93-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1755343251; x=1755948051; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WfLnf5/kvCLxvLOEfumWxUHPhaPlVs8I4oO2kdVd+M=;
        b=LLQThDwUqjnplM/TESg62YCQZHjTwCzdqLtdNiKRmPVtDRIXhpWlOPEmtlqyTVpB/L
         CrNy6dZJcpjTD3nc8A+2efqgeoFyZ6psZglYAaCDZbo3dgQO0z4eOfJlJ/S18+eD/bgT
         VqhavyxEgG9Q9j/+UjPz0zWTMbFdfumse41Dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755343251; x=1755948051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5WfLnf5/kvCLxvLOEfumWxUHPhaPlVs8I4oO2kdVd+M=;
        b=M/P0ptWKFNRKcVJjUPzDEKSX7xsnIvEH+Va4IBMa/aRoFK0qsMzESi2+le6wa3HKQ/
         rxKv4C1S7FMj2+GX3uySYrDRbwq9Mb3CBY52Ytz1nXO885dD5l8P9H7VusQ/BUP3/IH8
         irrqYIj684vO70mK/u424YEo8c5/YP+1MOT6mr5Als9r0Eg16mwpgCtajzmQ3i0NVoZP
         SAJrcMiXntlUBh/YpA7nbyN8WG3V/+0PB+BiWlp+f13en6eJrTX+nDMNjg0BO9Vye5Cg
         c3NUPh+p6XTN4iBo/q6NcquQnDwUYaMFUePc5cve5Vox7EgucmuGPXw+ea3zYr/UF4bg
         LqNA==
X-Gm-Message-State: AOJu0YxvqMCyTBEqbDHpNwZRHenTo/wulEUpvYioGcW4ULP6UlTqSJA5
	zgBnc3rQoEPsaa0UqARHyT5OvSikaAczYQRMxIkN2YL5bDc4BnAp6cEgcaNoHuzYhMenL9ebmHl
	JeFhMf+c=
X-Gm-Gg: ASbGncs429WUsPzqvlpMLTpif8xOKbtXkgMDnwr/TiMvpUpbhsMaN2eIoP/kNfOJSz1
	Uzjyb7NEWFCvsKSjGP+QSPeh6xTUppomSaQLt5qgPQ3/DN5TN++TOrqcFgnBS72W9d6fbyH6o1d
	WN7NxgTH1idijEpmjWIaHR7CFRrSxQqEam4nz7Dfqoj9QUPfTCPVZNNUIvPX7WODM38u3O17g77
	zkjl6ClW2ZJNqBlpQGMdmuQtRa9fy+FubzIJYyaqk60EbkrgaErarvRIZbi7kpTILI8fc7pwTCo
	9pOvDhSU4DokahAS54zYANup7aFkwz2fGaeoUWK3xCGesoHvvSexMQcJrPHHQC3grOfJSz3FwlH
	KO76CkzeBhBhtsvokVN/zfqAdP2gWN5XE6q96lh8tjU/LyNlW+Kx6XicHFZ9NE99mpg==
X-Google-Smtp-Source: AGHT+IEzPs9FkQ63BOLIzEufxuBLYDjBbOgrJbqFTH4gdP1GhoFRqjout6kGca2aCgD/lZWY9mSK7Q==
X-Received: by 2002:a05:600c:8b05:b0:459:eeee:2759 with SMTP id 5b1f17b1804b1-45a1b6c7e20mr80482885e9.14.1755343250703;
        Sat, 16 Aug 2025 04:20:50 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Subject: [PATCH v2 1/7] xen/page_alloc: Simplify domain_adjust_tot_pages for future changes
Date: Sat, 16 Aug 2025 13:19:27 +0200
Message-ID: <5f417fea5ca8e4da0d4b9679103c3eff4bc92900.1755341947.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755341947.git.bernhard.kaindl@cloud.com>
References: <cover.1755341947.git.bernhard.kaindl@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

domain_adjust_tot_pages() is used to update the domain's total pages
after allocating and freeing memory.

Simplify the design for updating it for single and even more so
for multi-node claims regarding the case where we could have
allocated more memory than we had claims left.

Replace it with min() to avoid reducing the outstadings claims
by more than we had left to claim:

When domain memory is freed, we skip changing the claim. Thus, this
only handles reducing the claims after allocating. So, min() is fine.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/common/page_alloc.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index ec9dec365e..e1ac22b9ed 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -510,8 +510,14 @@ static unsigned long avail_heap_pages(
     return free_pages;
 }
 
+/*
+ * Update the total number of pages and outstanding claims of a domain.
+ * - When pages were freed, we do not increase outstanding claims.
+ */
 unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
 {
+    unsigned long adjustment;
+
     ASSERT(rspin_is_locked(&d->page_alloc_lock));
     d->tot_pages += pages;
 
@@ -519,23 +525,22 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
      * can test d->outstanding_pages race-free because it can only change
      * if d->page_alloc_lock and heap_lock are both held, see also
      * domain_set_outstanding_pages below
+     *
+     * If the domain has no outstanding claims (or we freed pages instead),
+     * we don't update outstanding claims and skip the claims adjustment.
      */
     if ( !d->outstanding_pages || pages <= 0 )
         goto out;
 
     spin_lock(&heap_lock);
     BUG_ON(outstanding_claims < d->outstanding_pages);
-    if ( d->outstanding_pages < pages )
-    {
-        /* `pages` exceeds the domain's outstanding count. Zero it out. */
-        outstanding_claims -= d->outstanding_pages;
-        d->outstanding_pages = 0;
-    }
-    else
-    {
-        outstanding_claims -= pages;
-        d->outstanding_pages -= pages;
-    }
+    /*
+     * Reduce claims by outstanding claims or pages (whichever is smaller):
+     * If allocated > outstanding, reduce the claims only by outstanding pages.
+     */
+    adjustment = min(d->outstanding_pages, (unsigned int)pages);
+    d->outstanding_pages -= adjustment;
+    outstanding_claims -= adjustment;
     spin_unlock(&heap_lock);
 
 out:
-- 
2.43.0


