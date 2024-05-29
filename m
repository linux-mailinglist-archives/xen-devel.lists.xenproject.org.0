Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0410E8D2E18
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 09:26:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731498.1137050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDhL-0004G6-9g; Wed, 29 May 2024 07:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731498.1137050; Wed, 29 May 2024 07:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDhL-0004Ch-6K; Wed, 29 May 2024 07:26:11 +0000
Received: by outflank-mailman (input) for mailman id 731498;
 Wed, 29 May 2024 07:26:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+wO=NA=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1sCDhJ-0003Qb-2E
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 07:26:09 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b79f8de9-1d8c-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 09:26:08 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2e95a1eff78so22859931fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 00:26:08 -0700 (PDT)
Received: from localhost.localdomain ([2001:2043:5e37:9d00:b09:3200:dd72:cfc8])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5296ee4a58fsm1182353e87.67.2024.05.29.00.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 00:26:06 -0700 (PDT)
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
X-Inumbo-ID: b79f8de9-1d8c-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716967567; x=1717572367; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XH0hx5FhOx9XD5Quim9d/dWx8ptFKhc8V8iHDPJ7zTg=;
        b=apGCZuFr314QW5S7oM+Ji2IjCiTkVcm76gRDB0ig0ePZFb2lUj/2Ao+JG3aMpkpTP/
         I4LYBMQbLfNLcFmSKcwrsvkZ5+2KOc6FKbyOL/yhsb1F5F9WiDcPixHSR2LQbvBkii1W
         CY9gw55nFQki/HVz6Te0iZ6z1AngEmxGU85EefXN8sbgsKNq3MWUGnUC4cQKr2malIAp
         1+1krxV6tANNUgllzaj1Oh5qsM9bs+4MRkHTEH2q83X7t/BOIZ+mO0Zn5uR5xDG5Ymfh
         Q7lsSJFxFAFV0HnJqW81P+HlSC2FhjFCKnYn+RVy1XtvnkDNOk2PL53KmkSEAdeMxtny
         yqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716967567; x=1717572367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XH0hx5FhOx9XD5Quim9d/dWx8ptFKhc8V8iHDPJ7zTg=;
        b=tDbM54x4c9pvDm+z7rt4N6DFrvzLZUvPvAaHQfVYfTdUmHyN1i0A3M6mBTMFm10jj4
         7mAN8FMFL1rYNd37MLrFqAy5FRjKDy6rrOwZT6+Dg1n7XYKPm4sDzlB2VlbaNEfS/56n
         WbJkaDqtpgx5O5bEVUa/9bxbrg9pcw2IplvlvHT7SFtA2UONg7dn4uN9VvNzBjAbqgem
         BKtkieScplpqBLd8ukfYeKZ5vBRFx9oWKLDjjHR94cQFGvKbKnoFyD24UwyEgPpn8tn3
         6IRzEenoXWJ2ylt1kzGkWW2eCENBeLt+aLb7/vv5vfQ9zYVz9QqK69vl+T6outHmBy87
         80vQ==
X-Gm-Message-State: AOJu0YwFqRgYzF6pmdSq+9JodT9KBfJANxMiSvdI1SEo/wCAwHjWEJcn
	L+6wkelQ/BtN0OklDmWncYXcvHeXgDfFvbU/La/8oQ74AOca6XmYGKmKvRVdmSJ9NXkAlPGFchV
	QWhM=
X-Google-Smtp-Source: AGHT+IFIoBrKT/kDs3uPPD+xIx8y8di16Jqchsw2ABXeJEk1y0F6sSFegq5DQBoH4LL32mpv6TxtmQ==
X-Received: by 2002:a19:ad4a:0:b0:529:4864:9c17 with SMTP id 2adb3069b0e04-52967463e64mr12099898e87.57.1716967567404;
        Wed, 29 May 2024 00:26:07 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v5 3/7] xen/arm: ffa: simplify ffa_handle_mem_share()
Date: Wed, 29 May 2024 09:25:55 +0200
Message-Id: <20240529072559.2486986-4-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529072559.2486986-1-jens.wiklander@linaro.org>
References: <20240529072559.2486986-1-jens.wiklander@linaro.org>
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


