Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5DB8B9CEF
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 16:57:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715879.1117863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Xrl-0008RO-65; Thu, 02 May 2024 14:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715879.1117863; Thu, 02 May 2024 14:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Xrl-0008Oi-2m; Thu, 02 May 2024 14:56:57 +0000
Received: by outflank-mailman (input) for mailman id 715879;
 Thu, 02 May 2024 14:56:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZceG=MF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1s2Xrj-0008Nr-VK
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 14:56:55 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36ae0eb3-0894-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 16:56:53 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a58ebdd8b64so697119766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 07:56:53 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 i15-20020a0564020f0f00b005726dceb2easm621919eda.20.2024.05.02.07.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 07:56:51 -0700 (PDT)
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
X-Inumbo-ID: 36ae0eb3-0894-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714661812; x=1715266612; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Injz1eHKMU34CsdRACoEV/3/mGn5muvQCz5MmACq6o4=;
        b=w8Bc0/IDV4vUvWfkLoImEK9miZxMLSwIKmWLQXHsN8yDDIWyiJu1+LurdkNbsjyxxH
         awPvRauHGFD3eQL8PYYfildBMfVS1PpL8euszyl94Xfya66JcPRohyS7qjJJbhE+LmiI
         jptlRDq2al1eErZEjNlMwKniQzvyZ2+NWuJpTm3m7Eww1Z5MP755VeeTcKc62EjXsGVB
         zY4fKkC1Y5LQu6CVJIWpopZe9aW6eCI3ittSvKm3hhJGPlG/JisLt1YWCP/7L2pOIhi8
         ryKe7EtoJYLtFegPL3oy7Sl+41tDrLzKkADQenFR953heTm71lCPpS2mKWyRJRnOVnNw
         b/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714661812; x=1715266612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Injz1eHKMU34CsdRACoEV/3/mGn5muvQCz5MmACq6o4=;
        b=tFOKKMtcGZ59yTZgJCzY6K0vH+ftUtEiJaB/ztxVhIvFfORpxKf/03f6g86t/HSrAI
         VvHAivBVwFFsE/unzs4PVAEhGQbqRFYzmOCzeAET6a+9uVxfAIlIHXIrD4HtgSdz5HKR
         KMhjtGcTFSy0/nfZjZpC/mtKUd6xsNTG3bBcFO2b1fJXWxi45xxw679M6LXXbpgSUNb3
         c/3PwUPD7BCM6SO7tw3Xu9FYrSard1a9YBOK7s1d2o1YktxdMUSysYAzThwebg1oQC96
         9oZoPaLmYyc2s6z+AB0GiSQlVtCKNsBThao/gmdZz7L5eG4GNbuuE1ibOVZCUbf1SjNW
         cWhg==
X-Gm-Message-State: AOJu0YzRhDGjTARIvyZbA0VO71hmv3JqmLWWFMA71APqHl1aXhuu43MR
	NC+Df42JPn9FjTwTq49YuLv7xdz5e1pX4CbL8jg8b/io0rtWQBo+7cfW/I5n+dipVea+PqWA1eM
	c
X-Google-Smtp-Source: AGHT+IG7UqvYZtt6Bo69ToLIf6CpiL0D2ojKKHUUFQFlcGZ729buhKvFkmi0kpX8z5ksuzb1kcj64Q==
X-Received: by 2002:a50:c31d:0:b0:56e:2b31:b111 with SMTP id a29-20020a50c31d000000b0056e2b31b111mr4073339edb.7.1714661812744;
        Thu, 02 May 2024 07:56:52 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v4 2/5] xen/arm: ffa: use ACCESS_ONCE()
Date: Thu,  2 May 2024 16:56:42 +0200
Message-Id: <20240502145645.1201613-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502145645.1201613-1-jens.wiklander@linaro.org>
References: <20240502145645.1201613-1-jens.wiklander@linaro.org>
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


