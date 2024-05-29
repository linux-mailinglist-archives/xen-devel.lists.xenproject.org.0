Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6010B8D2E17
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 09:26:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731497.1137040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDhJ-0003zP-UJ; Wed, 29 May 2024 07:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731497.1137040; Wed, 29 May 2024 07:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDhJ-0003v9-PP; Wed, 29 May 2024 07:26:09 +0000
Received: by outflank-mailman (input) for mailman id 731497;
 Wed, 29 May 2024 07:26:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+wO=NA=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1sCDhI-0002xp-Or
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 07:26:08 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5c3aa7e-1d8c-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 09:26:05 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52b6ccfdf28so6718e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 00:26:06 -0700 (PDT)
Received: from localhost.localdomain ([2001:2043:5e37:9d00:b09:3200:dd72:cfc8])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5296ee4a58fsm1182353e87.67.2024.05.29.00.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 00:26:04 -0700 (PDT)
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
X-Inumbo-ID: b5c3aa7e-1d8c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716967565; x=1717572365; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Injz1eHKMU34CsdRACoEV/3/mGn5muvQCz5MmACq6o4=;
        b=qsR57bksHdfVIS5ZgWF3GPCxGYE8lK0+trTmrCkCSVGiejL6rCS/NttsludEcpQjEF
         PyWJEMKtHvA21IMjCII4vr5eAaIvHbLr8oQ9OaCrt+FSDNSj4dRdA7Fd9LwWACCxnFe9
         l8wAsNRPJcavjHJPBS7lNDZGlo97oTdct0z9kVNeTbdpUqyfXnEhtPr1vUnlNYYs5HuS
         hf0LHzQv0QbDSaiJeahyAa0e+cW4d/lSEtJi2rXyDAoz0lav6CcfUQnVFs5X+xTlihQG
         h0mCsH9xmgYQVi4KTtE6likulUB6bHywx8Hii8WYhhTDWzqJUvur1gJ81MyBhPpFVOEx
         5Gtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716967565; x=1717572365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Injz1eHKMU34CsdRACoEV/3/mGn5muvQCz5MmACq6o4=;
        b=aQxL1JTBCjJ6HymiCQ3XVGRi6XjlE4TFCVS46CxGDg5RTPo4ajx1fDEliR6rF3pxLh
         rAb1HtnpD32TC+7y6fJSdAFLV9UQn4Ut8x+9O6aIODhMlyyh7ntW4tJ3ObECTqYN2K1q
         3WRTmCjpTn0NkbD4+emkmkTZX/qt4nAesgBQR/rqHd78zbUFKEFuiARFxjkNmXmMKuCr
         cYUi9ufur1rPPIDUrLOnY06FHShoTpZ/cYoUooaEacMHrYpxzOmzpcZzl2+Vnr+m6kjS
         GYJcy8qfc+U3kOX80tq0OZ5Jhac22UEJKwy/67EOVKZBp1aW+TRgx3d+JhcNXAasF2L9
         eO8A==
X-Gm-Message-State: AOJu0Ywngn9R1gWxOrbF2s98067GZn+kXTenfmzgnlW3N/pLANSAacX5
	Xqp8KXjzx37FZzjCO6bun3NVqHEY8DZJZUAxfYUIsilDI9f4Jh+bCgMXiQ/dpIXjRWKu9VYvcX1
	18BQ=
X-Google-Smtp-Source: AGHT+IG4us99S6HJMmw1BnNMPCNiTcik3IIzYpyfmcLKgmcqg3Zk8NHoh84cKeLXUs6K75aOamqMZw==
X-Received: by 2002:a05:6512:4cc:b0:51e:f2bb:158a with SMTP id 2adb3069b0e04-52966ca8c0fmr8792474e87.64.1716967565550;
        Wed, 29 May 2024 00:26:05 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v5 2/7] xen/arm: ffa: use ACCESS_ONCE()
Date: Wed, 29 May 2024 09:25:54 +0200
Message-Id: <20240529072559.2486986-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529072559.2486986-1-jens.wiklander@linaro.org>
References: <20240529072559.2486986-1-jens.wiklander@linaro.org>
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


