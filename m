Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A10AC8B9CF2
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 16:57:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715880.1117874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Xro-0000Hb-Ee; Thu, 02 May 2024 14:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715880.1117874; Thu, 02 May 2024 14:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Xro-0000Fn-9l; Thu, 02 May 2024 14:57:00 +0000
Received: by outflank-mailman (input) for mailman id 715880;
 Thu, 02 May 2024 14:56:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZceG=MF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1s2Xrn-0008Nr-9b
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 14:56:59 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39107826-0894-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 16:56:57 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-51f036e9f4dso1228115e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 07:56:57 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 i15-20020a0564020f0f00b005726dceb2easm621919eda.20.2024.05.02.07.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 07:56:54 -0700 (PDT)
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
X-Inumbo-ID: 39107826-0894-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714661817; x=1715266617; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XH0hx5FhOx9XD5Quim9d/dWx8ptFKhc8V8iHDPJ7zTg=;
        b=DDyb36gee6z8tn1gd7jBknUIJZzubBqhNVhopyBhnhH4b9LLKWnBxEb1T3IW4EzWkB
         qXga+JmkJeaeJfdfk9nZXNkf80oySwpcX8Xwlrm6hJpX2zteqWkFzQzasmPGlW7rYfIO
         bbChfZtjOVgAu7KR+Y81XxnYS1DrcMXNzStjgyxaKZpYsPvEcEohOUsnt0vygGY2VgSa
         ZUh7VVuR1KP6S1wDA4+sYTVpvbNxwF+IdU3U7nJWuHkbrbOaBYU/bucyJf1SNzk0u7zQ
         vn20OJMeHxGbvni6RZQ9pEAyQSW5Ql1hefSf4/GeirTgrUTqAxSjLYnxFejVnQHTiC2b
         T36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714661817; x=1715266617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XH0hx5FhOx9XD5Quim9d/dWx8ptFKhc8V8iHDPJ7zTg=;
        b=mOAJ4LFc0o7rmhhLwDxLppUUEIjL7swT2tjiODLdc8H5iuDPMqqiSXNPNG159pQCkz
         lRPoEOnddwjx6N6IVq9ox9z6Ml5/ern3S+NCqGtC1BtuLjc525T6m6BLGS1hPTygr0vz
         qz6PiGoOLYQkgqvC0amksJEQ7WqsQ4/4EZs42HhcxefaX08CpLpKEl94rO0wOj+EaQK4
         Wgwgqp0MOtdxlRpVzImImjp+XIBKjk9AUrZgUww4O6MCTXTaUm7t7T8Xrll7lrZMn30a
         OI/8O4yQe0vVxPkrhm1rxRvzW3tFjry2MyrKVKyxj/HZvyu3DSSDaSLxm4OypO6K33gP
         RRiA==
X-Gm-Message-State: AOJu0YzZ5rE9mLzgqQ4TljNva65hNrzZqoAHU00hz666ePtpBTsg5Jvr
	TzAvV2XOukfRFfdZzlQRSf9aajdv5TqZHgN3bJ/x02ynu3rVBTjWoyUweXgAdirakTGzRXQidvq
	B
X-Google-Smtp-Source: AGHT+IHHEuhDATstiao+d7av8I+qaU4G8o2hMWEhtg5W6T+i17G5D6mSLLfR3apAoOc64/z05QBEtA==
X-Received: by 2002:a19:6454:0:b0:51e:eac7:d69b with SMTP id b20-20020a196454000000b0051eeac7d69bmr36948lfj.27.1714661814547;
        Thu, 02 May 2024 07:56:54 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v4 3/5] xen/arm: ffa: simplify ffa_handle_mem_share()
Date: Thu,  2 May 2024 16:56:43 +0200
Message-Id: <20240502145645.1201613-4-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502145645.1201613-1-jens.wiklander@linaro.org>
References: <20240502145645.1201613-1-jens.wiklander@linaro.org>
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


