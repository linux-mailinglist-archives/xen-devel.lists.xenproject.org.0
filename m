Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7118AC5AE
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 09:37:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709715.1108708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryoF4-000727-7Q; Mon, 22 Apr 2024 07:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709715.1108708; Mon, 22 Apr 2024 07:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryoF4-000704-4T; Mon, 22 Apr 2024 07:37:34 +0000
Received: by outflank-mailman (input) for mailman id 709715;
 Mon, 22 Apr 2024 07:37:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALvU=L3=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1ryoF2-0006Sb-Hv
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 07:37:32 +0000
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [2607:f8b0:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ca9e7a7-007b-11ef-8b06-e9908f64f69c;
 Mon, 22 Apr 2024 09:37:30 +0200 (CEST)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3c7510d1bacso978487b6e.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 00:37:30 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 x37-20020a056a000be500b006edcceffcb0sm7221726pfu.161.2024.04.22.00.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 00:37:28 -0700 (PDT)
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
X-Inumbo-ID: 2ca9e7a7-007b-11ef-8b06-e9908f64f69c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713771449; x=1714376249; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Injz1eHKMU34CsdRACoEV/3/mGn5muvQCz5MmACq6o4=;
        b=EScPsunjKNdnDcAmcoaxTaN4DSWv8HaeAmTfbx6WonRnRB91JLa6+/7Qx/X0e9j6bO
         +D1B2/5bwqXgiWR3qNtLiMZfSgNsAprz2GeCss9/BC8zPYq16ZrogW5bQ+jMnF5wLnb4
         kPg4PmCwEsLsoQ/d77/9B1hzBzCsQGNFug0eyXc9JcMmfsXUuotlkgD13CoGgzU/Tr/u
         /FcoTPYk16+1warChZog1ikoCUi7CkzGnkFEqv6RCivyIEmma1wQCVcfiJ5WVAbIJyet
         cXSf8/qOqQ1HuSGvaPAmnm78hog9SZRAjTbItisWStYxgFJNB8CkjdD0E9Ahm2qd+SYp
         50qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713771449; x=1714376249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Injz1eHKMU34CsdRACoEV/3/mGn5muvQCz5MmACq6o4=;
        b=kn3kjAzOu+I9v82NklGcc5POnzTPYy879sexjmfNag4CBTrLzT/ngo7ZiKVjZC4VyX
         AchaglcSLm4p8Gt1D9ll+fayIi22lXZaZRh/ijH4Jvu1bplIzPI0P2RzOZIP396aAmIt
         DJRFWLCDdmZPOOroIlfLiXGhdqLeFpQtUfOQx8SV+6ccubQFXZwOVK8lmDvJ2/UN7Dcy
         nCw41n9b2Zp5Hxg/3yq24JAv2W3W5UBxLrDPXCVb1Q8l39+ONzwa+52feut+r3z4eUof
         NT3VIDCwf9oE3brCXeUS5cx0WBGtdnj9/bbjZJ3x0HQODVv840vkAkkOPJXv5Xe3Hxqy
         0Jkg==
X-Gm-Message-State: AOJu0Yxl230nivfqwO1XFHCAi8AY50h65QxwVW1pIudIbkoPEa+DlkpU
	hjAlwIVzvbQ1jUF6kwBqsrsy4NuvYKeqVPR7H6W2ku8prYT65br49cif+yOsYuTPO2dOXEC669O
	N
X-Google-Smtp-Source: AGHT+IF8/Yq3GWuUme2jfU/Tj71Y6yTYZXpvsfQH19JqEaP37CxWt4rB7tdPh7TwB//e/GI2cqHXjw==
X-Received: by 2002:a05:6808:b16:b0:3c5:e2dc:8a6a with SMTP id s22-20020a0568080b1600b003c5e2dc8a6amr10635627oij.24.1713771449345;
        Mon, 22 Apr 2024 00:37:29 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v2 2/5] xen/arm: ffa: use ACCESS_ONCE()
Date: Mon, 22 Apr 2024 09:37:05 +0200
Message-Id: <20240422073708.3663529-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240422073708.3663529-1-jens.wiklander@linaro.org>
References: <20240422073708.3663529-1-jens.wiklander@linaro.org>
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


