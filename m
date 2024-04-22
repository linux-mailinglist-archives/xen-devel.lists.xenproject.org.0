Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A268AC5AF
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 09:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709716.1108719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryoFA-0007Pv-Gp; Mon, 22 Apr 2024 07:37:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709716.1108719; Mon, 22 Apr 2024 07:37:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryoFA-0007Ml-CU; Mon, 22 Apr 2024 07:37:40 +0000
Received: by outflank-mailman (input) for mailman id 709716;
 Mon, 22 Apr 2024 07:37:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALvU=L3=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1ryoF8-0006Sb-7T
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 07:37:38 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ff3fed5-007b-11ef-8b06-e9908f64f69c;
 Mon, 22 Apr 2024 09:37:36 +0200 (CEST)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6ed20fb620fso3360073b3a.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 00:37:36 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 x37-20020a056a000be500b006edcceffcb0sm7221726pfu.161.2024.04.22.00.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 00:37:34 -0700 (PDT)
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
X-Inumbo-ID: 2ff3fed5-007b-11ef-8b06-e9908f64f69c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713771455; x=1714376255; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XH0hx5FhOx9XD5Quim9d/dWx8ptFKhc8V8iHDPJ7zTg=;
        b=tidflhVmpDXLNQbwn/3bs3/zrUwhmiIQI6CfTEw8wIG0G0EVZ8TMRD+ArxuoHns53J
         cwcmNjgZ0hNr6PJCFS9mjGfzjApUWz4zz5kpkGrsnMHCGkKWFW0ku/IyT/EGZqMROMmq
         U7tvEBvefLwmOm89zhI6zKixAinqkvYnS0ypnK4yqixwrFl1sMEiTN0bQk4NvBi7rEC+
         fX3JWYjZsvtOfzcKfP2M3VQHTvXv0zy96J6WfM20EsMhbmABpU/lbVBW49KAVK61EbEV
         6L4OyN1SJScxNXcMd0svy6ZUlqyPO62WRiGtkO5b3JtTkgPr7H2i/IBfQJudMFuVe3tK
         H9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713771455; x=1714376255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XH0hx5FhOx9XD5Quim9d/dWx8ptFKhc8V8iHDPJ7zTg=;
        b=CFC4WOrxxblFUcyU16nWmUYEbXE3qKyWdF8o/f/2l19JOeoTpdsqvbsS+Ta1IiTNGr
         Zs+nJ1BS1XgzqQTzkb3ir7HW7W8lI3suZtFdK+Gga6Hx2meQs1guE4bbyNEVHGdHMiFG
         FkzAm5/Vu/HtMosNsvHGx9sywRhBooytiNAgfGkA1+IfKN0L5UCUB19aTHlEgR/p7rMX
         Mh1Sq9a+7HjtkNPqeqInCsRkxOcqFo8kw98Ks4PrrPV7xjCLEvPUjS7Af7A/+LaNRWy5
         iXXBdnVOwtLUOlIo5Jl63QEjc6zs0pPk+cuU7k9JsulDW56g7GD46C2D5BKzvskJRuVu
         H7XA==
X-Gm-Message-State: AOJu0YxDww9T3iP8MzWaFmvpHgg8PuZ+5pp0MGm3IJwaioZJhdIOhaBV
	sn/S0+oieyDc2xW2QOegRj51IgI4oiRLDmjejevk4lb5F33hqv1NwXKSKV39+AF0BJMEN35CN67
	Q
X-Google-Smtp-Source: AGHT+IGka8NQ9dDC8A6vYPkgAjXKykEfW2GOONxsXMsWFGAv2DdLMChwEDD2uno7UHsIXu15nuUq3A==
X-Received: by 2002:a05:6a00:1906:b0:6ea:aaf5:9e00 with SMTP id y6-20020a056a00190600b006eaaaf59e00mr10590326pfi.33.1713771454705;
        Mon, 22 Apr 2024 00:37:34 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v2 3/5] xen/arm: ffa: simplify ffa_handle_mem_share()
Date: Mon, 22 Apr 2024 09:37:06 +0200
Message-Id: <20240422073708.3663529-4-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240422073708.3663529-1-jens.wiklander@linaro.org>
References: <20240422073708.3663529-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify ffa_handle_mem_share() by removing the start_page_idx and
last_page_idx parameters from get_shm_pages() and check that the number
of pages matches expectations at the end of get_shm_pages().

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
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


