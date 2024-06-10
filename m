Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D52A9901B6E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 08:54:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736901.1142963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGYug-000217-Fu; Mon, 10 Jun 2024 06:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736901.1142963; Mon, 10 Jun 2024 06:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGYug-0001t9-92; Mon, 10 Jun 2024 06:53:54 +0000
Received: by outflank-mailman (input) for mailman id 736901;
 Mon, 10 Jun 2024 06:53:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FMhB=NM=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1sGYue-0001oX-Qm
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 06:53:52 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31cd4f37-26f6-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 08:53:51 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a6ef64b092cso224166366b.1
 for <xen-devel@lists.xenproject.org>; Sun, 09 Jun 2024 23:53:51 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f1e6795b9sm107981966b.174.2024.06.09.23.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jun 2024 23:53:49 -0700 (PDT)
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
X-Inumbo-ID: 31cd4f37-26f6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718002430; x=1718607230; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Injz1eHKMU34CsdRACoEV/3/mGn5muvQCz5MmACq6o4=;
        b=c1zGfPGabAngaLO0Mv+Fenz9hpoP4iVVtsnrPeTaPzQaa2LQ16QIRK0J63MpdYYoNw
         i+uND7RC1vR3NS4XdHEEflTCmyf8/negg3+zh4u+gZmlgRayc++Hfq1SGUefYJlXN8vS
         khLiRYBuZGObm1TbWQQe4bRySkGmkT0usBUw3Niamnuvf9cJGKCatM27w1bJJSR932B7
         rdHwJdhfFPkG+Anb/7kEgvtcEtwGayn98N1EGOziHhYXygQ8DPp0nahrdjk8afuVGsoH
         vgZ1vdMVh08khBCj3pzkvyMbEQQlCPavBpBGyViomvT/VxqlbqWfEodDiLKlGgg6E7LJ
         6dyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718002430; x=1718607230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Injz1eHKMU34CsdRACoEV/3/mGn5muvQCz5MmACq6o4=;
        b=YYTUKhnYc0UbARAi/QQMoYlvFkOWqfyhN6JdMQVRfPUbQaKHAtVzX178uGYlbcHKDM
         GhULVAo6yG6l6JP3DryF8nZ+V42QMveZ+lE0Uu+3nkvG3KaFFPoQ99s/+odwk6/iNKT9
         3d4V8WpmZRgb91r2EWJn332hgWY99bLPMpIx0RTZsgW3pBZig6mD8BS+FIXonCyuqvRB
         tVW2MBRdn0eFoUX7yfGUrGYobSSrbnti/9jHCm/5s4L71FbDcMvc4Smxt9GMMpvnTKZB
         RXX7dsciqAWY6sLtxwW471h+kiN4kjszE/gOxJkx/RnXQ3Pdvx5R9tk+TMiAMEAbiQju
         OjFw==
X-Gm-Message-State: AOJu0Yy4PuT6Sm2x1aIuLXQuYG/lJT5dBM4DU9GYNd0KAtX+q/RE9XBE
	nfReEn1pcXTKg9ddd23WAbBxBMEXqjbHq+dOTdGYOfwkgpRh+YfkSxR2IFZ0erHLfKgbaNYk8bd
	b4Gk=
X-Google-Smtp-Source: AGHT+IGMHCd19V2Ca1l7FaUhJpfnKwGOHKc5HQE5b6x+izr2N0yEBtHEkS4HKkyYX7r9eBBn5Pjgmw==
X-Received: by 2002:a17:906:7b87:b0:a6f:9ee:bd47 with SMTP id a640c23a62f3a-a6f09ef34d0mr300998766b.58.1718002429948;
        Sun, 09 Jun 2024 23:53:49 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v6 2/7] xen/arm: ffa: use ACCESS_ONCE()
Date: Mon, 10 Jun 2024 08:53:38 +0200
Message-Id: <20240610065343.2594943-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610065343.2594943-1-jens.wiklander@linaro.org>
References: <20240610065343.2594943-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace read_atomic() with ACCESS_ONCE() to match the intended use, that
is, to prevent the compiler from (via optimization) reading shared
memory more than once.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa_shm.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
index eed9ad2d2986..75a5b66aeb4c 100644
--- a/xen/arch/arm/tee/ffa_shm.c
+++ b/xen/arch/arm/tee/ffa_shm.c
@@ -7,6 +7,7 @@
 #include <xen/sizes.h>
 #include <xen/types.h>
 #include <xen/mm.h>
+#include <xen/lib.h>
 #include <xen/list.h>
 #include <xen/spinlock.h>
 
@@ -171,8 +172,8 @@ static int get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
 
     for ( n = 0; n < range_count; n++ )
     {
-        page_count = read_atomic(&range[n].page_count);
-        addr = read_atomic(&range[n].address);
+        page_count = ACCESS_ONCE(range[n].page_count);
+        addr = ACCESS_ONCE(range[n].address);
         for ( m = 0; m < page_count; m++ )
         {
             if ( pg_idx >= shm->page_count )
@@ -527,13 +528,13 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
         goto out_unlock;
 
     mem_access = ctx->tx + trans.mem_access_offs;
-    if ( read_atomic(&mem_access->access_perm.perm) != FFA_MEM_ACC_RW )
+    if ( ACCESS_ONCE(mem_access->access_perm.perm) != FFA_MEM_ACC_RW )
     {
         ret = FFA_RET_NOT_SUPPORTED;
         goto out_unlock;
     }
 
-    region_offs = read_atomic(&mem_access->region_offs);
+    region_offs = ACCESS_ONCE(mem_access->region_offs);
     if ( sizeof(*region_descr) + region_offs > frag_len )
     {
         ret = FFA_RET_NOT_SUPPORTED;
@@ -541,8 +542,8 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
     }
 
     region_descr = ctx->tx + region_offs;
-    range_count = read_atomic(&region_descr->address_range_count);
-    page_count = read_atomic(&region_descr->total_page_count);
+    range_count = ACCESS_ONCE(region_descr->address_range_count);
+    page_count = ACCESS_ONCE(region_descr->total_page_count);
 
     if ( !page_count )
     {
@@ -557,7 +558,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
         goto out_unlock;
     }
     shm->sender_id = trans.sender_id;
-    shm->ep_id = read_atomic(&mem_access->access_perm.endpoint_id);
+    shm->ep_id = ACCESS_ONCE(mem_access->access_perm.endpoint_id);
 
     /*
      * Check that the Composite memory region descriptor fits.
-- 
2.34.1


