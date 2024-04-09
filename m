Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4415F89DF4D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 17:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702504.1097598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruDWb-0005pc-QX; Tue, 09 Apr 2024 15:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702504.1097598; Tue, 09 Apr 2024 15:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruDWb-0005kU-Ma; Tue, 09 Apr 2024 15:36:41 +0000
Received: by outflank-mailman (input) for mailman id 702504;
 Tue, 09 Apr 2024 15:36:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n+OA=LO=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1ruDWa-0005IN-P5
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 15:36:40 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4da0e13-f686-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 17:36:39 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a519eae91d1so553105666b.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 08:36:39 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 gs44-20020a1709072d2c00b00a46a3ad035esm5849000ejc.179.2024.04.09.08.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 08:36:38 -0700 (PDT)
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
X-Inumbo-ID: f4da0e13-f686-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712676998; x=1713281798; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8OCgwxfFNBl0g/LFD7KGefGi5I0NjNvh/BY8PRWmBI=;
        b=G/QzDv2s9Qtf0wUCYr8OL9nTWgFvBwYh2sA/xKsd2kqNDE4L/YKGfPsUpEvtuQdCuy
         xYeVtNpCuUY8i893qQ02Qb3/l+JsXObnOrYiHOr8Eeg7Bbi6rlilIjv2OQMBXxnJ49oh
         fXtDoszs3FAyWFM719yq+gAknab3N7ibbJIuvIEmz33BuzCluVOU1alHa6Dmpwa+8M2g
         l0kvHFxRN4YZ+LJcDVUgC+gdtR2nzOpW0Y0WnUj80EtRgT+SedjI7stYLx8DyV5tX0ft
         wD2/4W/yUU28qOYmQy8la8jM/XNFvwgkc5leCiedcOvrusFMa7lua0bTCZBLVjQfIoOw
         lRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712676998; x=1713281798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8OCgwxfFNBl0g/LFD7KGefGi5I0NjNvh/BY8PRWmBI=;
        b=VY7tMpb/yKFIrTOvRFTKWJlEGeRnm8fuXRqwoSxBOl6MCiYYlzDSLJMKNWzx/tI7VP
         D/K1vc351Rn5xIkpgbIQeVVWRThZp8tbaVMWScChCXXj9BNZjbiVN3Wpx/3YSLKqRjjo
         JztgGcjdWY4oFS7yanLBigzNDZPHswiyhkJDcI8zlVj2RpxHAfeulZhks3WZhnQa0Qm9
         DJjZkY37xZFBIUfbFaFPbNImMV29QNWZ1dJ8Yi8GER3nbNhdv4kc75kWxpte1TYjxdmb
         OyvBfdeRTVhGZuyq0NV+6ohER+q9F79VmXqVL3saD8fO8uoiq6JW7Vg2FfYRgonjYEp7
         6qyg==
X-Gm-Message-State: AOJu0YzAQ5Rq23V9hQV04r6ShhH5Fe97l84i+1PPGHRqhUi1rLkBH5cT
	VeDy02HDJwqn1T1sxU+HN5SOGs/hq0Xh6yXuusDc9Y30KdXOUD3/ofGDmQhHtNveK0MG7+gjMxv
	a
X-Google-Smtp-Source: AGHT+IEV6VmAkaioQ3AY4tx0PhOMRDHEhLjTgJ4V/HabB0Lb33pB1LlO5vHf9bOM8u8CsFT7cXzTQw==
X-Received: by 2002:a17:907:7b88:b0:a51:a488:8fb8 with SMTP id ne8-20020a1709077b8800b00a51a4888fb8mr8848674ejc.70.1712676998350;
        Tue, 09 Apr 2024 08:36:38 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v1 3/5] xen/arm: ffa: simplify ffa_handle_mem_share()
Date: Tue,  9 Apr 2024 17:36:28 +0200
Message-Id: <20240409153630.2026584-4-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409153630.2026584-1-jens.wiklander@linaro.org>
References: <20240409153630.2026584-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify ffa_handle_mem_share() by removing the start_page_idx and
last_page_idx parameters from get_shm_pages() and check that the number
of pages matches expectations at the end of get_shm_pages().

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa_shm.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
index 75a5b66aeb4c..370d83ec5cf8 100644
--- a/xen/arch/arm/tee/ffa_shm.c
+++ b/xen/arch/arm/tee/ffa_shm.c
@@ -159,10 +159,9 @@ static int32_t ffa_mem_reclaim(uint32_t handle_lo, uint32_t handle_hi,
  */
 static int get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
                          const struct ffa_address_range *range,
-                         uint32_t range_count, unsigned int start_page_idx,
-                         unsigned int *last_page_idx)
+                         uint32_t range_count)
 {
-    unsigned int pg_idx = start_page_idx;
+    unsigned int pg_idx = 0;
     gfn_t gfn;
     unsigned int n;
     unsigned int m;
@@ -191,7 +190,9 @@ static int get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
         }
     }
 
-    *last_page_idx = pg_idx;
+    /* The ranges must add up */
+    if ( pg_idx < shm->page_count )
+            return FFA_RET_INVALID_PARAMETERS;
 
     return FFA_RET_OK;
 }
@@ -460,7 +461,6 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
     struct ffa_shm_mem *shm = NULL;
-    unsigned int last_page_idx = 0;
     register_t handle_hi = 0;
     register_t handle_lo = 0;
     int ret = FFA_RET_DENIED;
@@ -570,15 +570,9 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
         goto out;
     }
 
-    ret = get_shm_pages(d, shm, region_descr->address_range_array, range_count,
-                        0, &last_page_idx);
+    ret = get_shm_pages(d, shm, region_descr->address_range_array, range_count);
     if ( ret )
         goto out;
-    if ( last_page_idx != shm->page_count )
-    {
-        ret = FFA_RET_INVALID_PARAMETERS;
-        goto out;
-    }
 
     /* Note that share_shm() uses our tx buffer */
     spin_lock(&ffa_tx_buffer_lock);
-- 
2.34.1


