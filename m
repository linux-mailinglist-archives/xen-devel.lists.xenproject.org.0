Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8CC901B6D
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 08:54:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736902.1142980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGYui-0002ZA-La; Mon, 10 Jun 2024 06:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736902.1142980; Mon, 10 Jun 2024 06:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGYui-0002Vt-Hx; Mon, 10 Jun 2024 06:53:56 +0000
Received: by outflank-mailman (input) for mailman id 736902;
 Mon, 10 Jun 2024 06:53:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FMhB=NM=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1sGYug-0001oX-J9
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 06:53:54 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32e3b659-26f6-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 08:53:53 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a6ef8e62935so228092266b.3
 for <xen-devel@lists.xenproject.org>; Sun, 09 Jun 2024 23:53:53 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f1e6795b9sm107981966b.174.2024.06.09.23.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jun 2024 23:53:50 -0700 (PDT)
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
X-Inumbo-ID: 32e3b659-26f6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718002432; x=1718607232; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XH0hx5FhOx9XD5Quim9d/dWx8ptFKhc8V8iHDPJ7zTg=;
        b=lLIYtpGn4JjIP1moIj/qS+1o2d58yQNtFpIXoNNsDH73mx4rqOOLqxEPI+qgiSI7hC
         95AIt8fxyhj1lXu98iKMDINzdvgoKYY+fiIY3AZdyJ5EFS4uLg9ZjqrQWtEX7O5xOUny
         SRaD0rJqX4Qlc2cICZ0XLOyjp6fI7x5DbqzT2hT+Z+5l7QFQlg/lwmThGnUrbblblY6F
         DqXpVYSwsHJLLK9uPreBl3yZi3XRzE+FjaeRgPhTVDULIuk5L+UOhXjHJ2Zs9cHzu9nW
         Dl/F0wh+QsJ5PLdVryLPpf4FeGRoObmzdh0s58EOPTzXp+WerohVtYyDpFO2J3IFDGHR
         SbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718002432; x=1718607232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XH0hx5FhOx9XD5Quim9d/dWx8ptFKhc8V8iHDPJ7zTg=;
        b=k0fhwsZ3LSSf4kH3KlL0gF+YB8GHj5aoN1nIQX0NEnsxFw6+IcNaE9NtBorpDpvT8r
         USSwMu/4Pmoar0FIjc4tPn8dI1RUK/iiDkgKaolDgp4zKTeT3cJDVwMtGbx26xqpNQiW
         QL/LMBvQ730uGSwANllHM0wkrjmNxFZmsZQIK7WWNUhzhYR8W++9tX/VyzmaWA44iri1
         3TXThWe0cBAiIUGHholX1exJmPI+OcDXZKfc6JOOMCZ3yJrsv2O+YPW8CL6tnt9I2Xao
         2YdyjuZ4vRFmOE7IdgZPkDL3lxPjkL62HqU8ZI+R4A4W4ZW3Y1t8K/WfpLAhrTSImJnu
         k4zg==
X-Gm-Message-State: AOJu0Yz7trcAhjQQId7k9j83LHThx1K87wjEoTE5oAfwJNSMLlBv2JT4
	m2qKbggWa8GgtAmrxmKjtpeF4HcpVTLMeYGy4SoHgCKpBJfRd38aP0a1HCpEVYpb+ApopyuOvjo
	HWoI=
X-Google-Smtp-Source: AGHT+IFarHqSdGAqU5TZnBn1sJgCv2O8vReWZ1tFvpOuZd/60yHNPdDl8basOLuUVpHD3bVWJ7BmSg==
X-Received: by 2002:a17:906:80ca:b0:a6f:1004:dc30 with SMTP id a640c23a62f3a-a6f1004e1f0mr310918866b.65.1718002431882;
        Sun, 09 Jun 2024 23:53:51 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v6 3/7] xen/arm: ffa: simplify ffa_handle_mem_share()
Date: Mon, 10 Jun 2024 08:53:39 +0200
Message-Id: <20240610065343.2594943-4-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610065343.2594943-1-jens.wiklander@linaro.org>
References: <20240610065343.2594943-1-jens.wiklander@linaro.org>
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


