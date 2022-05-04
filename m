Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BE951970E
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:50:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320330.540999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7t4-0005MT-6F; Wed, 04 May 2022 05:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320330.540999; Wed, 04 May 2022 05:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7t4-0005KQ-3M; Wed, 04 May 2022 05:49:22 +0000
Received: by outflank-mailman (input) for mailman id 320330;
 Wed, 04 May 2022 05:49:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=536T=VM=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1nm7t1-0005KK-Ul
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 05:49:20 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efe7d668-cb6d-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 07:49:18 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id x17so540720lfa.10
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 22:49:18 -0700 (PDT)
Received: from jade.urgonet (h-79-136-84-253.A175.priv.bahnhof.se.
 [79.136.84.253]) by smtp.gmail.com with ESMTPSA id
 t7-20020ac24c07000000b0047255d210f7sm1116784lfq.38.2022.05.03.22.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 22:49:16 -0700 (PDT)
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
X-Inumbo-ID: efe7d668-cb6d-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hnuRMXxh5aQGAD1Jx6BN0KvTPVXOtPiamofA9IF2SH4=;
        b=Lo85xaqPggn9ooAYY+cHhZ3i0SF/lO7zTZFn6zxJtV3orxZPMiasR4zs+B/CBT7c5f
         y7kionomVlhujBfeARorySQBgbGKCoBF5mee7k7hgHIYvA+gwP1HJiZCkuZ7Ugfg9o/k
         kLxl5vMOAUKzbrJivafe6dw+fcWm6b/8tMenIrbSKTbxgiccRi/OPW7ONb/bY6MJuDE7
         FBfeD1VlJKmWLJy1OvvmPpDBKoda+JjRu2kfuApWiZh4HOy7rJqMAy3nT5Ns1/E5r2pt
         uJq4ysd9XrpfLjq4pf6Tgs3Vo77bljtwyvrMVsFesGBjFUxvgHrW+FGE0S5kQTEhik2v
         zWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hnuRMXxh5aQGAD1Jx6BN0KvTPVXOtPiamofA9IF2SH4=;
        b=R9RuVb2EUuGPtlFAgRv2eTuD3ycXt7wbqzDVIp7XYvCA9P69r0MyicA8wVkbyNQ9CH
         mT8L/FHUGPYqG10DcFDzvpgO7lhc2mzXeCeWojUvVfygSSjHaqPImNideYWcAaS0fSoR
         dXnZyiW5PNzNEHJNa3X7zZAdR/wIJ248bWKa1lvwBazjFiaqzzcBeMKwq34wMpoy1UoP
         AGEeNHZelJSQ4/BzT7sl4LMS+hFLpcTarpu4tJsus5HMvnrNgImhF5SIMQ7BNFlWyy7C
         Fso91wL9BCzcnrjgNsh67ele8GIqI14TLc/+XaEOYEfF6c7Xg1Q156HYF6fV9QX/x+I0
         JgEA==
X-Gm-Message-State: AOAM533ligtReN8x78+7SdfdjAjdaYK/a+pLpdsILd4YiHSoiKkbDQUR
	9N3HDZNHAivtfSwf/wuSzxw0S/ZtRUyVRw==
X-Google-Smtp-Source: ABdhPJzfPaIq44pZy65eLPYJDGAlkEn8nDBePwG0XSIDFOBmAsrqAjHTt5Ke5wFv5ZvmAxl+Eg/IWw==
X-Received: by 2002:a05:6512:128f:b0:473:a2ec:5df6 with SMTP id u15-20020a056512128f00b00473a2ec5df6mr5696351lfs.196.1651643357330;
        Tue, 03 May 2022 22:49:17 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] optee: immediately free RPC buffers that are released by OP-TEE
Date: Wed,  4 May 2022 07:49:12 +0200
Message-Id: <287f81d7cec66b5ef1f8f3f61679b9593e2b81d4.1651643156.git.jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit fixes a case overlooked in [1].

There are two kinds of shared memory buffers used by OP-TEE:
1. Normal payload buffer
2. Internal command structure buffers

The internal command structure buffers are represented with a shadow
copy internally in Xen since this buffer can contain physical addresses
that may need to be translated between real physical address and guest
physical address without leaking information to the guest.

[1] fixes the problem when releasing the normal payload buffers. The
internal command structure buffers must be released in the same way.
Failure to follow this order opens a window where the guest has freed
the shared memory but Xen is still tracking the buffer.

During this window the guest may happen to recycle this particular
shared memory in some other thread and try to use it. Xen will block
this which will lead to spurious failures to register a new shared
memory block.

Fix this by freeing the internal command structure buffers first before
informing the guest that the buffer can be freed.

[1] 5b13eb1d978e ("optee: immediately free buffers that are released by OP-TEE")

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/optee.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index 8a39fe33b0ef..539a862fd185 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -1149,6 +1149,11 @@ static int handle_rpc_return(struct optee_domain *ctx,
             call->rpc_data_cookie = 0;
         }
         unmap_domain_page(shm_rpc->xen_arg);
+    } else if ( call->rpc_op == OPTEE_SMC_RPC_FUNC_FREE ) {
+        uint64_t cookie = regpair_to_uint64(get_user_reg(regs, 1),
+                                            get_user_reg(regs, 2));
+
+        free_shm_rpc(ctx, cookie);
     }
 
     return ret;
@@ -1598,13 +1603,6 @@ static void handle_rpc(struct optee_domain *ctx, struct cpu_user_regs *regs)
     case OPTEE_SMC_RPC_FUNC_ALLOC:
         handle_rpc_func_alloc(ctx, regs, call);
         return;
-    case OPTEE_SMC_RPC_FUNC_FREE:
-    {
-        uint64_t cookie = regpair_to_uint64(call->rpc_params[0],
-                                            call->rpc_params[1]);
-        free_shm_rpc(ctx, cookie);
-        break;
-    }
     case OPTEE_SMC_RPC_FUNC_FOREIGN_INTR:
         break;
     case OPTEE_SMC_RPC_FUNC_CMD:
-- 
2.31.1


