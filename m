Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF766748101
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 11:35:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558897.873494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyvF-0001o0-AN; Wed, 05 Jul 2023 09:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558897.873494; Wed, 05 Jul 2023 09:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyvE-0001fe-TD; Wed, 05 Jul 2023 09:35:40 +0000
Received: by outflank-mailman (input) for mailman id 558897;
 Wed, 05 Jul 2023 09:35:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hy0b=CX=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qGyvD-0006bq-IQ
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 09:35:39 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d117840-1b17-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 11:35:38 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b63e5f94f1so6622001fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 02:35:38 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q22-20020a2e84d6000000b002b6d8cfb6d2sm2910625ljh.140.2023.07.05.02.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:35:37 -0700 (PDT)
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
X-Inumbo-ID: 4d117840-1b17-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688549738; x=1691141738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWua/aGnhgeAUqYKtQ1Lf4Q/vc2pnAQzQP1lQqZFLOs=;
        b=t2lANbONfVCUPmioMdbT5ugJNIAtFeNHJLUO0BudbmZENdOHcp6cnWKOZNcWSPSe44
         FyH6gNeEgGbD5gYkrf282Wg5SQ5hNOMS7IkqvNPTKzitGaF1FnFzBik7MwpbCDVMWTkm
         mt04bNyxh3zxd6HrUNl1iLEAsu71tPIseuxgrVU+6rDKUjgZNiRAP+HO25O1IMGiCmrC
         PsRFLeqQrfOc+4DGK1AuRDHqPLhHSaN+gT8z77/HTSEJAH8ZGIWkcIhKDGYz+MNzw+My
         Sj5Ms0hiSkVmlG3wdoToYh/vGgHh/0xZe22M9yMH1r1Mzz2APH2IfI+v0ctxQUcW0ym5
         Sigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688549738; x=1691141738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWua/aGnhgeAUqYKtQ1Lf4Q/vc2pnAQzQP1lQqZFLOs=;
        b=hlO8TwgEOjX7giNOouqHY1KEq6rJlAuy+ZKAC2a6jCUN9mlADzFD0WQRfu8uZIzlp1
         08Fk85+BN3vRcvyGi+t7oWmJiUK6tmyTZVDhY7wr2FZDgDg3eJyILwvqFaO/BRRdBrC2
         7N52+qP3+7YsQgCLfhfjbOU13waoHKj/q0NaOGkY7Aq5MFWdQ7GxaBfYxNbDpi4eN3mL
         s+MZdz+0NW1EwJK9Rji3qcLUd91P5r5VjZeh2e1XiB+1lyNIkgmA2/XYu+JT3qynhyuF
         IpIDFNqaX+mLhI1QcGzKghLiwPCeehmvXEiPP7UIIFRn5/Wub6RKfzSL/bxE8IGjK0DY
         auXw==
X-Gm-Message-State: ABy/qLb+8S6ntcrih1XzZ/S6kfWGLmDcx66eeCmFSd47OwbDtlSflKdh
	CBdf8TY9FaYmEMn+K5CzlxeaxlYigR9U7/IJTZ8=
X-Google-Smtp-Source: APBJJlGIsl0hv181Iy7TeYWQi9ltmrfQxnPlGaqu1gvAxtnhqtpqsv2Zkq7ZEC1I47eH29T1HbLyXA==
X-Received: by 2002:a2e:3c04:0:b0:2b6:b849:c893 with SMTP id j4-20020a2e3c04000000b002b6b849c893mr578326lja.26.1688549738005;
        Wed, 05 Jul 2023 02:35:38 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand.Marquis@arm.com,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH v9 19/24] xen/arm: ffa: add support to reclaim shared memory
Date: Wed,  5 Jul 2023 11:34:28 +0200
Message-Id: <20230705093433.2514898-20-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705093433.2514898-1-jens.wiklander@linaro.org>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support to reclaim memory previously shared with FFA_MEM_SHARE.

A memory region that doesn't need to be shared any longer can be
reclaimed with FFA_MEM_RECLAIM once the SP doesn't use it any longer.
This is checked by the SPMC and not in control of the mediator.

Adds a check that the SP supports the needed FF-A feature
FFA_MEM_RECLAIM.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c | 53 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index f3eb84a8e9b7..c623c51168b9 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -538,6 +538,12 @@ static int32_t ffa_mem_share(uint32_t tot_len, uint32_t frag_len,
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
@@ -1278,6 +1284,43 @@ out_set_ret:
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
@@ -1339,6 +1382,15 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     case FFA_MEM_SHARE_64:
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
@@ -1573,6 +1625,7 @@ static bool ffa_probe(void)
          !check_mandatory_feature(FFA_MEM_SHARE_64) ||
          !check_mandatory_feature(FFA_RXTX_UNMAP) ||
          !check_mandatory_feature(FFA_MEM_SHARE_32) ||
+         !check_mandatory_feature(FFA_MEM_RECLAIM) ||
          !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
         return false;
 
-- 
2.34.1


