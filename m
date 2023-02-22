Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D27A69F838
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 16:39:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499642.770926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUrD3-0004DA-6f; Wed, 22 Feb 2023 15:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499642.770926; Wed, 22 Feb 2023 15:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUrD3-00047w-2X; Wed, 22 Feb 2023 15:39:09 +0000
Received: by outflank-mailman (input) for mailman id 499642;
 Wed, 22 Feb 2023 15:39:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvgA=6S=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pUr8G-0001MH-3p
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 15:34:12 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59bb165a-b2c6-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 16:34:09 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id w27so10583974lfu.4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 07:34:10 -0800 (PST)
Received: from localhost.localdomain (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q9-20020ac25289000000b004db0d26adb4sm927746lfm.182.2023.02.22.07.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:34:09 -0800 (PST)
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
X-Inumbo-ID: 59bb165a-b2c6-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7KfqryCuiLTxh6V7wTFhyCR1D3Skcqadhm2jdw7Dpg=;
        b=buPVoqX4k+wFegkL/jsOQNHnwtRYALuPdIV2R1Q43tL4QfQQDMkPAsD6JccvuqSX/x
         p8yeHRPleXPwIEgmmkNjoYPQYfwv0nd3SmPWQqZQL6MZDj3jC3Zy8ybOHQnwnMGVtImk
         pTF2ASVOte+CYmGMoJ2+4jCYS3Yix9eRfelaR4gJo8+AuC/KMtryLZ8YRFnqlQnMOWXx
         UF67Hd7yckN/L+EX0n16HaMXJpxmjKEgp6UZfYRzuBEb5tyAacSGKJrlfjmdB2wFk3Hb
         itts9MsS5hRC/qzHI3bNFXVp4D9gGWk9eDi/HHcaFGYLHhK4BzEcCugkOg5NXAWSNSXh
         HPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7KfqryCuiLTxh6V7wTFhyCR1D3Skcqadhm2jdw7Dpg=;
        b=VgpvMnuG3aNOp/IN2KwFOXIrSWH200eBEvlWkkTju1hb3c63ocBAKYap2hDUGksLKT
         cDHCXgIjVAilZmaavz3rUEOJlXr6MpCwIVmXpZDh2VvEoJqOxBEnmSew3XeHKHZuc9JE
         QBUwDPxf5AYKPubhtuViv43w+hOsGylmOLz1JSnf+lrAlLlOrbMtY7ceK1WeKpfGQ99A
         R1Izsij28Pd70oiHku1ZhG9xjpAo+vZZHlAfr9K6e1snAuXWiUN+OEOVFTdhjKdFEsMb
         As5P18C05YO0us0o8pc2K1W4PT6E3dxMzcHO4PZajQ9nDyT7XaWWfJOKQQB7Es+O+AsD
         R6SQ==
X-Gm-Message-State: AO0yUKVf4JAu+gw/TBbMaA2/OxbsH62krgg9/XDebKIdLZHWqZW4tvVy
	WNKXFZ0TvV9k0xxjaSBFIsFii0i1daWN508PURY=
X-Google-Smtp-Source: AK7set9AQLUVCBjm0EJ6SEfxAjBSS8LFZYBlQPJteDZtuDeT2rcECFkrQMoVQbHhHPG+EBuP2WABgg==
X-Received: by 2002:ac2:554f:0:b0:4db:664d:7bb0 with SMTP id l15-20020ac2554f000000b004db664d7bb0mr3094883lfk.47.1677080050152;
        Wed, 22 Feb 2023 07:34:10 -0800 (PST)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH v7 19/20] xen/arm: ffa: add support to reclaim shared memory
Date: Wed, 22 Feb 2023 16:33:16 +0100
Message-Id: <6dda7c17462221fac26f45a8663370952e37040d.1677079672.git.jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677079671.git.jens.wiklander@linaro.org>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support to reclaim memory previously shared with FFA_MEM_SHARE.

Adds a check that the SP supports the needed FF-A feature
FFA_MEM_RECLAIM.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 53 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index cdc286caf62c..3557edc455d0 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -512,6 +512,12 @@ static int32_t ffa_mem_share(uint32_t tot_len, uint32_t frag_len,
     }
 }
 
+static int32_t ffa_mem_reclaim(uint32_t handle_lo, uint32_t handle_hi,
+                               uint32_t flags)
+{
+    return ffa_simple_call(FFA_MEM_RECLAIM, handle_lo, handle_hi, flags, 0);
+}
+
 static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
                                       uint8_t msg)
 {
@@ -1238,6 +1244,43 @@ out_set_ret:
             set_regs_error(regs, ret);
 }
 
+static int handle_mem_reclaim(uint64_t handle, uint32_t flags)
+{
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
+    struct ffa_shm_mem *shm;
+    register_t handle_hi;
+    register_t handle_lo;
+    int ret;
+
+    spin_lock(&ctx->lock);
+    list_for_each_entry(shm, &ctx->shm_list, list)
+    {
+        if ( shm->handle == handle )
+            goto found_it;
+    }
+    shm = NULL;
+    ret = FFA_RET_INVALID_PARAMETERS;
+    goto out;
+found_it:
+
+    uint64_to_regpair(&handle_hi, &handle_lo, handle);
+    ret = ffa_mem_reclaim(handle_lo, handle_hi, flags);
+    if ( ret )
+    {
+        shm = NULL;
+        goto out;
+    }
+
+    list_del(&shm->list);
+
+out:
+    free_ffa_shm_mem(ctx, shm);
+    spin_unlock(&ctx->lock);
+
+    return ret;
+}
+
 static bool ffa_handle_call(struct cpu_user_regs *regs)
 {
     uint32_t fid = get_user_reg(regs, 0);
@@ -1305,6 +1348,15 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
 #endif
         handle_mem_share(regs);
         return true;
+    case FFA_MEM_RECLAIM:
+        e = handle_mem_reclaim(regpair_to_uint64(get_user_reg(regs, 2),
+                                                 get_user_reg(regs, 1)),
+                               get_user_reg(regs, 3));
+        if ( e )
+            set_regs_error(regs, e);
+        else
+            set_regs_success(regs, 0, 0);
+        return true;
 
     default:
         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
@@ -1508,6 +1560,7 @@ static bool ffa_probe(void)
 #endif
          !check_mandatory_feature(FFA_RXTX_UNMAP) ||
          !check_mandatory_feature(FFA_MEM_SHARE_32) ||
+         !check_mandatory_feature(FFA_MEM_RECLAIM) ||
          !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
         return false;
 
-- 
2.34.1


