Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 281DA8B333B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 10:47:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712549.1113308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0HEz-0007zI-Gw; Fri, 26 Apr 2024 08:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712549.1113308; Fri, 26 Apr 2024 08:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0HEz-0007sw-C0; Fri, 26 Apr 2024 08:47:33 +0000
Received: by outflank-mailman (input) for mailman id 712549;
 Fri, 26 Apr 2024 08:47:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1vyS=L7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1s0HEy-0007Se-7m
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 08:47:32 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e941b30-03a9-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 10:47:31 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2dd6a7ae2dcso28622501fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 01:47:31 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 qu20-20020a170907111400b00a5242ec4573sm10339211ejb.29.2024.04.26.01.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 01:47:30 -0700 (PDT)
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
X-Inumbo-ID: 9e941b30-03a9-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714121250; x=1714726050; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XH0hx5FhOx9XD5Quim9d/dWx8ptFKhc8V8iHDPJ7zTg=;
        b=xzwqqh7qJSL3GCd03CS3YDPhxH0b5JoVRzM4NKOjGKz5UqdKuS1ZHCnqibB1s1Nrr7
         IBWcNPkcfs5sPGJZQcUBQqvFUxGUv+YhWUsOZwudTWVEfgh6jIDrPb3dyRu2WvWK0Xdm
         c3dx1FcSgFpmA117+/InSBrayvlrrenm/zI4QpsmS2xDv0uLt/lqpwQck7gjtjj9WCdR
         Q77LBB1hDvOWhgUUCGWiavIW7UcZkYAuYKta6MiRNPBgg3SeUYzLXhP5cNuvjA2VJu0O
         N970ICXyozjIo1aKSBY6fA9HucBn8+xFfMvnlu9KYhg1q3ZMSvQXvu8zUNUShx3FYMDI
         e4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714121251; x=1714726051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XH0hx5FhOx9XD5Quim9d/dWx8ptFKhc8V8iHDPJ7zTg=;
        b=V9wB5isQnHmmcdGQ78JEpC4nR0pYjJ9Kt2EODe59V6Zk6EpL+cbJfHxiHr9qOdzdxf
         j5n+EN4SlfA9wEDUKbVqqRArXA6BYLXSIz/O7aM+NOpz0+G+sHz8fynwBEJFhu/ID2Z4
         NVbPnsglGivhYL++vfi2/5qzyMjhOBasLOb+QZqhyO9riZufyFAA7cofJ8HOsHyM4H4H
         I8rzeDeT8ptvfRBISSvDo1bNvPaUvsVlS02dV62PkiZcqdpJFm0UtJoDX6To8uZ2btwC
         nOn3pePUaVfvS0DyuSlR6Pjwm4qOqBJhVOgcMXWE7YCASaz+us58Ne/n8gLkrr3u/j09
         R5gg==
X-Gm-Message-State: AOJu0Yw6kFfg7ByKVqsJNpD4lvkJ5MsQhv4WgiLYSigaYHp3CGAnp9U8
	7nvGVRiGhCgGPB+kDnXT20CakNqYwmhSbDfl2jUjKdu44wBpNSe/uWUKhgcSUXtCkzk/Tlwo6gO
	0
X-Google-Smtp-Source: AGHT+IF3i2V4C8IrT0xG1QtMBdatvGwAt1q9obgLDlgBD01dAWvBGKrSS4ch3yan9selOlL5uX1L8g==
X-Received: by 2002:a05:651c:151:b0:2de:22b2:ab3d with SMTP id c17-20020a05651c015100b002de22b2ab3dmr1530149ljd.7.1714121250750;
        Fri, 26 Apr 2024 01:47:30 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v3 3/5] xen/arm: ffa: simplify ffa_handle_mem_share()
Date: Fri, 26 Apr 2024 10:47:21 +0200
Message-Id: <20240426084723.4149648-4-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240426084723.4149648-1-jens.wiklander@linaro.org>
References: <20240426084723.4149648-1-jens.wiklander@linaro.org>
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


