Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7691991EAEE
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 00:45:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751882.1159992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOPlC-0005v2-AB; Mon, 01 Jul 2024 22:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751882.1159992; Mon, 01 Jul 2024 22:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOPlC-0005sI-6G; Mon, 01 Jul 2024 22:44:34 +0000
Received: by outflank-mailman (input) for mailman id 751882;
 Mon, 01 Jul 2024 22:44:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K0KN=OB=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sOPlA-0005qM-9u
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 22:44:32 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79e4c322-37fb-11ef-a59d-41c015c667e1;
 Tue, 02 Jul 2024 00:44:29 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52caebc6137so2912186e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 15:44:29 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab27b8csm1586825e87.139.2024.07.01.15.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 15:44:25 -0700 (PDT)
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
X-Inumbo-ID: 79e4c322-37fb-11ef-a59d-41c015c667e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719873869; x=1720478669; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sf82CyGT2KHh8k/j9sWHzVKPUD8ck5NskBySCFiD0JQ=;
        b=KK8iPbhwTnLo5zXaeW6u7c8YMHh/MGjizsgbx3F/CAcBiGAzp1k5AyrvA0pUJAEpoI
         Vs/DUqQ+vQTf+k0SHsQjMYlttBq1SKOVJMMv7Eo4GKcdStrzwu244WouqL+bzMRuHiFe
         8LVYnmhizL4hH/AOmAB3f3Cmny4CB82rDJGgj0MGomWaHQD3/UhSkCexzk25/ClgSoZ0
         /eruCY7/Qi892xNL7zGP697XeN3DnG7J5BRhXHG8YLv5x0voRz5RHzCAzeq0cD8xnX3t
         gNxcfTSmfvw2DqMtFcrQquESi+9ApzuOZqOwl2GPXssz06DIQ3+KYWkaYchk0g79ofjv
         q8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719873869; x=1720478669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sf82CyGT2KHh8k/j9sWHzVKPUD8ck5NskBySCFiD0JQ=;
        b=wLavzjObE7xEpvKrwU2jNWMzNsKo46jaJpbxCzjwJAIaJ+oBRkjED1Y7fuAEVBQWvJ
         Ofgn7lW6a5G9rwz9BdGRpcHS1RHsL5rpWqzemB7e0E1ED5hRDp/lQRRfJQFloKEwxjPq
         sTSQbv9mkZLA94LP5Y4D7aQ3j1zounjl9woOjEXikKqb00LVUtwzmxn2XgVQ5c8DUXFX
         9D6xDl78SDuVjFtN6D2xANtPNQYkoMQTvpnl9R/K0VVatPDXKhhizggsypzJX+k2uTdT
         HfA6pkKmCbx1+Tq5BvKAvO7Z6RPRuvOG3RmvqyJ3Gs/rPq1mm9zOkdZ+rzIrAVOaHb87
         k7Qg==
X-Forwarded-Encrypted: i=1; AJvYcCU/zrQcqfwI0/uaQzw9SbLSZ342MTMFraBG0WpUnyhq6dLmVci6gpcsI0K+FqTK65KFCWHMT58NwP8OroVla7Jvdda8SfO+JQ8mtHIrPYo=
X-Gm-Message-State: AOJu0Yw2lDE/sw0QzkLh5vIrYGSucN66frzXUVt3j88wASi7hA3Bkws4
	iNZuUrJBccKSo41+mr49R0xjLUnP1N7+ymn7YQe55HUcDzhX0RbC
X-Google-Smtp-Source: AGHT+IHWKetgrLPhxdzv9x0e7HCZWLzAzA+Cb1d+CG0m2IxNg7Q00FAe96b6YrkGhExYpUzmQX4I4Q==
X-Received: by 2002:a05:6512:3b2c:b0:52e:7f16:96b6 with SMTP id 2adb3069b0e04-52e82687e16mr4837805e87.37.1719873867477;
        Mon, 01 Jul 2024 15:44:27 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v1 2/2] xen: mapcache: Fix unmapping of first entries in buckets
Date: Tue,  2 Jul 2024 00:44:21 +0200
Message-ID: <20240701224421.1432654-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240701224421.1432654-1-edgar.iglesias@gmail.com>
References: <20240701224421.1432654-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

This fixes the clobbering of the entry->next pointer when
unmapping the first entry in a bucket of a mapcache.

Fixes: 123acd816d ("xen: mapcache: Unmap first entries in buckets")
Reported-by: Anthony PERARD <anthony.perard@vates.tech>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-mapcache.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 5f23b0adbe..18ba7b1d8f 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -597,7 +597,17 @@ static void xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
         pentry->next = entry->next;
         g_free(entry);
     } else {
-        memset(entry, 0, sizeof *entry);
+        /*
+         * Invalidate mapping but keep entry->next pointing to the rest
+         * of the list.
+         *
+         * Note that lock is already zero here, otherwise we don't unmap.
+         */
+        entry->paddr_index = 0;
+        entry->vaddr_base = NULL;
+        entry->valid_mapping = NULL;
+        entry->flags = 0;
+        entry->size = 0;
     }
 }
 
-- 
2.43.0


