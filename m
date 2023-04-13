Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE666E0783
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 09:16:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520475.808184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBa-0005VG-Ul; Thu, 13 Apr 2023 07:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520475.808184; Thu, 13 Apr 2023 07:16:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBZ-0005Jb-Tu; Thu, 13 Apr 2023 07:16:01 +0000
Received: by outflank-mailman (input) for mailman id 520475;
 Thu, 13 Apr 2023 07:15:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmrBX-0001gr-B5
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 07:15:59 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 096abe3f-d9cb-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 09:15:57 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id u12so154417lfu.5
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 00:15:57 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 n12-20020ac2490c000000b004dc83d04840sm181354lfi.79.2023.04.13.00.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 00:15:57 -0700 (PDT)
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
X-Inumbo-ID: 096abe3f-d9cb-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681370157; x=1683962157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ul/1FA/L6eAJ4JFgbgtNcnhIDZBc/H8WlYcLQZsgqf4=;
        b=gt9n3iyMe7ujsjYVCsHKczv2GRF+eCg0yIseZ/d3zg7kq7p0mXW7qumqQ4m3zom+4s
         sgFc1hD5ZxXD5D4hgjHNHJAe+WWFSi4rGZMU4BICPkyUT3+mCg+IGbyWvyiHpsNvNvbR
         PCyk7QuUpfkeG1of60PFJ6umYlFrBo4V85VB7igwQ0rDpgwViKLOyecfqv0iA1zZuIbf
         ebNKYsqSycPoAXUa1ZsLPjVxGUuGN44qerYrHAXJ9DeEr9eeSwDL/KAA0cwGnMl5ZpYN
         0Gwt2TWjFGMmBmyOp9OZjIkZsbnuGw8SEcecI9sohJBJBgexCOttwJgcdMxgjXsGexF/
         Ou1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370157; x=1683962157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ul/1FA/L6eAJ4JFgbgtNcnhIDZBc/H8WlYcLQZsgqf4=;
        b=BlqrqzacRnodGiGgjL6rNmCFfXXZSbiUPcBqNNsqriwbrJG+IL1JPbOcuLWiZ/yUnH
         yPyQpsSuFE0/7mpgna8GY4YUHycbzD9Gu8bfwvAgWN+Jdhzt4AmvYpI1B5WWhT5Tukg8
         InQHdS7WYG2EzXm2hEKC85HhLY4v76kkRwyIX25dHIu6g+2/izE1ytPYoB7VCs4cqPI4
         kwqCT+fZGH35n7aYUMOY0kMWAW4dBBrDxLCPmvZTFCo1qjL8jZbSRYSHRwivx9RNj/NG
         j3YDoCrW1XiFQ4mPuNudFcqfqJTVyvTlaeKVIAFMm4esqV9G3+omjDbSfgrKPfUz6QDZ
         MORw==
X-Gm-Message-State: AAQBX9epkTs4zDOOCR/xaIcpcd8GDvqAo7wVHxM2Dzwis05+n3qmjwPd
	BINCkL2z68EInMXlrqJumlQjotPmX4b/b/KXXg8=
X-Google-Smtp-Source: AKy350bZfh7qZ51cjeaR08/Y3OCAVeKqhEC41a1zdISPOxbkbb1wGKx3EkXrHZZ5gvKNgbhX2ITudQ==
X-Received: by 2002:a19:f017:0:b0:4e8:4b58:bfbd with SMTP id p23-20020a19f017000000b004e84b58bfbdmr615879lfc.10.1681370157386;
        Thu, 13 Apr 2023 00:15:57 -0700 (PDT)
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
Subject: [XEN PATCH v8 18/22] xen/arm: ffa: add support to reclaim shared memory
Date: Thu, 13 Apr 2023 09:14:20 +0200
Message-Id: <20230413071424.3273490-19-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413071424.3273490-1-jens.wiklander@linaro.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
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
index 438e0b21d1ea..47ff899eca32 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -535,6 +535,12 @@ static int32_t ffa_mem_share(uint32_t tot_len, uint32_t frag_len,
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
@@ -1256,6 +1262,43 @@ out_set_ret:
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
@@ -1317,6 +1360,15 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
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
@@ -1534,6 +1586,7 @@ static bool ffa_probe(void)
          !check_mandatory_feature(FFA_MEM_SHARE_64) ||
          !check_mandatory_feature(FFA_RXTX_UNMAP) ||
          !check_mandatory_feature(FFA_MEM_SHARE_32) ||
+         !check_mandatory_feature(FFA_MEM_RECLAIM) ||
          !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
         return false;
 
-- 
2.34.1


