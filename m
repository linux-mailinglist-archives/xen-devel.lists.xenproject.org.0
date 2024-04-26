Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C688B333E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 10:47:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712548.1113301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0HEz-0007oh-1y; Fri, 26 Apr 2024 08:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712548.1113301; Fri, 26 Apr 2024 08:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0HEy-0007jG-Rf; Fri, 26 Apr 2024 08:47:32 +0000
Received: by outflank-mailman (input) for mailman id 712548;
 Fri, 26 Apr 2024 08:47:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1vyS=L7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1s0HEw-0007Se-T4
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 08:47:30 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dbd6b58-03a9-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 10:47:30 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-51acb95b892so2376444e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 01:47:30 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 qu20-20020a170907111400b00a5242ec4573sm10339211ejb.29.2024.04.26.01.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 01:47:28 -0700 (PDT)
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
X-Inumbo-ID: 9dbd6b58-03a9-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714121249; x=1714726049; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Injz1eHKMU34CsdRACoEV/3/mGn5muvQCz5MmACq6o4=;
        b=igM2VAkVPM4/6NANE7aZ6TLehdACnkARw0BHHcu5r8/Vq2AMXAT0KzH1zoE0/J7n2b
         PD1zGoV0JmgI4WAlgmImkkSNiAjKEbzPtV8qVPfJJfTNEWhD4+eJOEqyBeWxXP56GCpl
         93V60eWZIR5YqEcp/km9v/hCWJDAzQTAXyUEW0Sex/5L52DDn8xYNTJFhlWsRQYg7L9B
         EInqFL0pQLmJ087REVBHlAiA9kadmo1g7Gwj2Wbk4nGMbDlt3ex0Pv40zXiX1egRPfbH
         ol0kj0kfQKMPjtoNWoMt8ktSKiWUi6mb4is/1W/4uNYMssiUUNMS/a50lGeD6ZmSaoHL
         OZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714121249; x=1714726049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Injz1eHKMU34CsdRACoEV/3/mGn5muvQCz5MmACq6o4=;
        b=vsmyCI9nXrLUad2F19q9BwSX3D2OtwIhNeFvzUGKhuJspDe3tOJ9zU/ktUxjCVS41F
         ts+xcM6h+2qHZkiOGNMHZcPWO0zr/f3TX2p6vL+ojsuP1jjUhu1iADZLYa+m4m58f4QJ
         iV9ymGFD9Voss/ziq0e4wmQsSfbCluRwU98sNZRCFsZWqMpucMBix9fly2m2mQF/C4QA
         rJ+NhmbwZMr2RUgUqog1dgUcj6M/kfs92N+eVRjRqw4sZEHj2cm8OgYBtJVhriU8ioUf
         C7iZxMpG0hg00oXLy2+nDsB1+35On0GcsoJMdVifPQ1/Wt7hcqeAPMUQl5qnfbfiXJDK
         kteQ==
X-Gm-Message-State: AOJu0YwudLsvTvq0yAcOUb1sQxue3zZrJhYpFE4nk6DbYDbqCRsJLwuJ
	KqPNr3/7RhYpX88iDaArPsECuU/aEm5yH0I4BFPJI3onWKjbRXI7u0bSvHj6X/55GTgB1w2GoBJ
	8
X-Google-Smtp-Source: AGHT+IF12xWOO76mUX1Wf/VnAFoEUe7G4Wnd7/Djm+bzZ2IGef+t3GKceVxPeqA4MGRisIGUh5cv9w==
X-Received: by 2002:a19:7412:0:b0:51b:ce76:7813 with SMTP id v18-20020a197412000000b0051bce767813mr1759542lfe.58.1714121249205;
        Fri, 26 Apr 2024 01:47:29 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v3 2/5] xen/arm: ffa: use ACCESS_ONCE()
Date: Fri, 26 Apr 2024 10:47:20 +0200
Message-Id: <20240426084723.4149648-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240426084723.4149648-1-jens.wiklander@linaro.org>
References: <20240426084723.4149648-1-jens.wiklander@linaro.org>
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


