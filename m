Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DE1755CB5
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:22:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564194.881618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIYH-0002lg-Aa; Mon, 17 Jul 2023 07:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564194.881618; Mon, 17 Jul 2023 07:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIYG-0002JR-M8; Mon, 17 Jul 2023 07:21:48 +0000
Received: by outflank-mailman (input) for mailman id 564194;
 Mon, 17 Jul 2023 07:21:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xV9D=DD=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qLIYA-0005A3-Rw
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:21:42 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 940e4892-2472-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 09:21:42 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fdb3f66fd6so2316152e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 00:21:42 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004f846cd74bcsm2658938lfp.245.2023.07.17.00.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 00:21:41 -0700 (PDT)
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
X-Inumbo-ID: 940e4892-2472-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578501; x=1692170501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWua/aGnhgeAUqYKtQ1Lf4Q/vc2pnAQzQP1lQqZFLOs=;
        b=bRjF4qKlC8vQak3a4DLbOBqDwDc1E6uXtGEPEfJ1xjeRdPixyi+QSuS8In7gooenqa
         5LM1ti6GdGiCYor3Hvgi7Vyfr6ehTbnawBDdjY80hwpzONoTF3Cdx5AACoIcMWqaL4cV
         ts1xjZXyWW/cBGhjPqcVVusxsaZFUtYG8CGyRv/68JMesrhA2tooS7Bmaaet/FxSsEVU
         r1ITlSP+YIgA69lr/c1y9F3QtKHiWnccgNzBESM90J+sFGLrKRZBMWJ46NGHOqoiLCcQ
         Bw0oJbQBKeYHDdq1+iH2PHH6BqmJ5ExHGZC5fCOh1ObEXIJ8I5p0Ex+OUHuct9qH1rBu
         3sMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578501; x=1692170501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWua/aGnhgeAUqYKtQ1Lf4Q/vc2pnAQzQP1lQqZFLOs=;
        b=OFqaXwSbOMIODu0ChlMMYVrd3fwP7jammi9KTCuTd5JsMFPvjgAYxQ70kdQHSSB4EG
         Ctpa6mbZ9XZR4EjhPYXyysdlNuzyfFh4Z6j1O3WiMmBwLTNEAt7IckC3yVw05TOyaPco
         NJOoLoQU/5quGtGc+U5s+61xFaWg2wfiT3z5JZrOdRjoqrJEg3+zpzAE9GNYFyCTGf5e
         kpxovXJMB9knErpeBKUl5R2D+8v3fp51LySncZG/sBhbRCnVkwvauj3xfGahYGLZ2sfn
         vR+qX0pIsKBT4XccrxbzChwScnWTciymPAO8n447pcmB9a5aTk3lm/zUtCH5ixaXKYoG
         UZ8A==
X-Gm-Message-State: ABy/qLYRol0ELno2Dm+ZtqLJuREQHZyUMbQ8/m9iIqonas+dS5y8RYw2
	26XnVR2rq3Al9ybrfeSnijryf9D0H6D7e37oUAQ=
X-Google-Smtp-Source: APBJJlFGgqFk90LEx9JDGoSMAlQiXMj+Tu7SBoByp/VnNfNwMZZkYSroesEVWBr3gChieyYidLnpBA==
X-Received: by 2002:ac2:5973:0:b0:4f8:770f:1b0b with SMTP id h19-20020ac25973000000b004f8770f1b0bmr7012547lfp.33.1689578501722;
        Mon, 17 Jul 2023 00:21:41 -0700 (PDT)
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
Subject: [XEN PATCH v10 19/24] xen/arm: ffa: add support to reclaim shared memory
Date: Mon, 17 Jul 2023 09:21:02 +0200
Message-Id: <20230717072107.753304-20-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717072107.753304-1-jens.wiklander@linaro.org>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
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


