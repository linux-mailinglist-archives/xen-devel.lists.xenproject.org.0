Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A9389DF52
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 17:37:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702502.1097587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruDWb-0005f5-Ae; Tue, 09 Apr 2024 15:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702502.1097587; Tue, 09 Apr 2024 15:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruDWb-0005Zp-5n; Tue, 09 Apr 2024 15:36:41 +0000
Received: by outflank-mailman (input) for mailman id 702502;
 Tue, 09 Apr 2024 15:36:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n+OA=LO=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1ruDWZ-0005IN-Oz
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 15:36:39 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4456e89-f686-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 17:36:38 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a5200202c1bso73898366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 08:36:38 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 gs44-20020a1709072d2c00b00a46a3ad035esm5849000ejc.179.2024.04.09.08.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 08:36:37 -0700 (PDT)
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
X-Inumbo-ID: f4456e89-f686-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712676997; x=1713281797; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2oUmASxTp+9g/nhjEeQPRm9Cad1umKqLTvyNY/+uRUE=;
        b=E+guPPP4NS6AjQTZ5xJbP015XBPfd+EXo9xJGDnzZWWTxfJgskyeX17wV4cGYdf7NC
         dB9gvH9Ij/6OUGF/9VUNe1EA1gSVLzqzd9oAbrFh2t9/CtOUt/PZp0mLWQ19p/uuZzZo
         f99ZMPea97mEQU574Z+4S3NYFoH2C1QkwGQC42WkOQpm9/He0+kkWjvcsJ6WGHuiQC15
         cVSEwP5IvBKXviPuAm++ZdqLyiLoOaQ2X463f1M0B2TAaOj0gCGH8qjMYCFbXisTvy2K
         fZi4dsWjp7f79T/ms7UF7ItWNJRo9UhgzBPeKMD6Hei5ltfn+qg4buV2/wwbTBernPoM
         1Ceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712676997; x=1713281797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2oUmASxTp+9g/nhjEeQPRm9Cad1umKqLTvyNY/+uRUE=;
        b=tqOwrThUUTDekfCQ+29BaxCtO87fxfkLMIqlH0nmPlHY+6F16oDw/DLi6LYCxK4M4+
         L9g5o2jblm0gG06goKYhjPpdiKWPGp9F1QmjyYAaOnONKLxsBfXlVfQ9n9UkUd8S7Kcr
         2uvgvwsulXCfgFrVxobRuDV59KRygArRVSNx52DxJfBz4h7J1v8dCQslis0+73swINSH
         ywX4G+2u3g4xwVzXTkjdRZE5kCmdBf38Te3c82I8Fqd621TSwQKdIkuXb9+DzrxQvyJL
         4Lwd4gM6V2Ax6Mm+8CmfXffgjzlJ65R9ipUv1w6NgeOLLgs52fg3QFkr8QhLvsvrekfK
         QBzA==
X-Gm-Message-State: AOJu0Yy0/Lb4RzaCew8a2RdJB3NWihxNn8MsTLGC5CBz9eNWyR3EIUt3
	M7Cd2CIrW1S7nqGe9arrlEK36TCyuu5f5Wiwrec0xC1fnLFkk2ugr+iiV7rXMHBoqMVlp5j+OCK
	s
X-Google-Smtp-Source: AGHT+IGbto1wNOCGSVxLb+C98WA2o9ISJr0k/9kSL+BzB/yrxIQfwl4kANp2eL8ONh7P0r3LzcNXAQ==
X-Received: by 2002:a17:907:72c4:b0:a46:dd30:7cb5 with SMTP id du4-20020a17090772c400b00a46dd307cb5mr11754671ejc.76.1712676997351;
        Tue, 09 Apr 2024 08:36:37 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v1 2/5] xen/arm: ffa: use ACCESS_ONCE()
Date: Tue,  9 Apr 2024 17:36:27 +0200
Message-Id: <20240409153630.2026584-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409153630.2026584-1-jens.wiklander@linaro.org>
References: <20240409153630.2026584-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace read_atomic() with ACCESS_ONCE() to match the intended use, that
is, to prevent the compiler from (via optimization) reading shared
memory more than once.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
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


