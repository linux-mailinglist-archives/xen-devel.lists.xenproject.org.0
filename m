Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407807695E1
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 14:16:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572970.897227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoa-0006a0-R4; Mon, 31 Jul 2023 12:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572970.897227; Mon, 31 Jul 2023 12:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoa-0006Rz-9E; Mon, 31 Jul 2023 12:15:56 +0000
Received: by outflank-mailman (input) for mailman id 572970;
 Mon, 31 Jul 2023 12:15:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VuP2=DR=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qQRoY-0003r0-AW
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 12:15:54 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fee65c95-2f9b-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 14:15:53 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f954d7309fso5499468e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 05:15:53 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac2430a000000b004fbb1bc1ae0sm2028077lfh.163.2023.07.31.05.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 05:15:52 -0700 (PDT)
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
X-Inumbo-ID: fee65c95-2f9b-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690805753; x=1691410553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4vSjtYXla7KgcWjbel3A+vRKKWcV7JLHovFCdSLbtg=;
        b=Z8pYQvEZVC1Z3Epa1PSdfPQ4kTcwio3hoQ/rKCmzlfp7teuipYKhOMcq6E95EaOZ9A
         JsHKlMfjqzThJb4Rg+J/LISRj2R2QLaCC5AvznHwr4svMOSdgF8DiUlVbcHeA9qH4tj9
         GjSIsTN5yTygaafkhb9AMeqwjeWJgsXK6V8nB9Nq9Om5riuFkPDSBBgxzUMcF5wWnp/O
         bpKba0kJm6D7v0dJ2r1eoPHJ3sSTkJQ3i/wDKtN/O60yZVeWKLMlG8cTrFXddW9bt4DA
         ho3gCeUBzL5Kl4R8TrIATVLQXIg0DHeWzBVACgGknXRXL5K30aYwo537mW3LlzEMOt/v
         YGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805753; x=1691410553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4vSjtYXla7KgcWjbel3A+vRKKWcV7JLHovFCdSLbtg=;
        b=hUQXmD30s1MJSnc08B1+d0RSFoTe4JAj4Ly3nxZnwN2P+W5d/EupWaTrT5PiitNA4h
         NelKZ3v5Il/RfVnocPxL9ygkovK3vUr+XDhSVz+IRXa8m3nGbklWPYLumgBNyS9nr+KE
         r4MUNoDXUJkIfGjW6SuvLhMfll3vRVhAF1xkmw7X9loPbvjOT+vP/7a2AlssR/k4q7Z1
         cSsJNvADOqSRn5sCdwA7HY1HdoRzypcJCjmqyc8CDkiEkr1PmV4vjKB5DuD24oaRPI70
         385mxgGnlofqiP992l1wXeTEnONfU1c+DfwVX9MQrKy5gFulR9ihv+Iptf1twm9uhZ96
         +FOg==
X-Gm-Message-State: ABy/qLZbJGvemw07vEGyT99y8nfINM3zmmt2wDC9J1XEP1UpoPjMS1K4
	lK60BG3lvuyLSXLphpS0jm36MZgnWjlIw/spgyo=
X-Google-Smtp-Source: APBJJlGcyr+7aeiaGR8us8V2/Q5tdSMajkMdzYPMDVuV4rkMvRbZjxFRnnARAAPA2I0ZLR5B7Mr3/g==
X-Received: by 2002:ac2:58e8:0:b0:4fb:fb4e:7580 with SMTP id v8-20020ac258e8000000b004fbfb4e7580mr2872942lfo.8.1690805753285;
        Mon, 31 Jul 2023 05:15:53 -0700 (PDT)
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
Subject: [XEN PATCH v11 10/14] xen/arm: ffa: add support to reclaim shared memory
Date: Mon, 31 Jul 2023 14:15:32 +0200
Message-Id: <20230731121536.934239-11-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731121536.934239-1-jens.wiklander@linaro.org>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
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
v10->v11
- No changes
---
 xen/arch/arm/tee/ffa.c | 53 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 74e3ef50091e..75700938c444 100644
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
@@ -1283,6 +1289,43 @@ out_set_ret:
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
@@ -1344,6 +1387,15 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
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
@@ -1581,6 +1633,7 @@ static bool ffa_probe(void)
          !check_mandatory_feature(FFA_MEM_SHARE_64) ||
          !check_mandatory_feature(FFA_RXTX_UNMAP) ||
          !check_mandatory_feature(FFA_MEM_SHARE_32) ||
+         !check_mandatory_feature(FFA_MEM_RECLAIM) ||
          !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
         return false;
 
-- 
2.34.1


