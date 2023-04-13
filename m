Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 031F16E0782
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 09:16:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520469.808130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBT-0003pQ-GE; Thu, 13 Apr 2023 07:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520469.808130; Thu, 13 Apr 2023 07:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBS-0003in-SJ; Thu, 13 Apr 2023 07:15:54 +0000
Received: by outflank-mailman (input) for mailman id 520469;
 Thu, 13 Apr 2023 07:15:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmrBP-0001gr-PC
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 07:15:51 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04d9ebc3-d9cb-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 09:15:50 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id i6so6145839lfp.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 00:15:50 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 n12-20020ac2490c000000b004dc83d04840sm181354lfi.79.2023.04.13.00.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 00:15:49 -0700 (PDT)
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
X-Inumbo-ID: 04d9ebc3-d9cb-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681370149; x=1683962149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xdtgtks0Z+0OQgcElk/gBwu5R5RBnZenMx5onSQ1voY=;
        b=pCCHs+6Bq8GYnAbcHC07R7jVm1hYJMLtVTHERhDWKLdVIDcQUDt8p+ovEdZg90KOMF
         U7ikJbSTPvG8WwfYE2yJzKe6Sn8HTuV9XZw5KJShNA3lrW4KF58SZu+KBwrFaa5H38Ow
         aupikAeEB3nBQMonVVpV0oQrYW3HZDD3X/dKWCquf27RNt39OVWuphK4LUyAG85qNDq4
         zvo6ydDk0GF+rYM0anyskX5B8LIV/JpxfB2oQ5Xm9iOYkr2e0wWUR2rjG81K7TOJoz6I
         Sh8FSpb9+k4Cnln8+AM3a2BocKbGq606CPIrx71oRf0ufxgE//vnlkvrqGzyFu9upJb6
         IcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370149; x=1683962149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xdtgtks0Z+0OQgcElk/gBwu5R5RBnZenMx5onSQ1voY=;
        b=Sl0VyrA2jr7H0GXtE8vcOJt3ySJvHqREiFE74GBXX225YYe2aBu1+WK2hbLYPMlwVN
         iW1oTTCno4w/aJ8PPUMYjnYNhYWfkwNKaF0gJWPiHEMCk33GYabMDvsGVuroaNl5pxPs
         d+jnl4AzsaXaNwHAeIqyEQIpu5wFWYQ603LXz/aURFrespoARyqH+oFIr9o3XdUEQAMd
         Z8dsr4CDRDHRoVkRmkSs8oFlylIzELeZqpkndH+74adgof38RPSiSXir6wOp4cs4gQ4S
         u6JpbpykUTO01VHf4hyPP3GFmnwXnFXT0XlzNJOyWvfVst2yHJSQ1ur83sL01HM/5lir
         /qMg==
X-Gm-Message-State: AAQBX9ei0QsGl2SBuCcR4TW182GBuMV3sUxeR8Xh7WIxuI/g7sDL32Y/
	/ADk/tMSGvOMkYz1d3idnBEJlEeiLPG96qesMis=
X-Google-Smtp-Source: AKy350YzDtXtY7GPdfoFCSuzwqUBv5NtAssSt/D/m1g+loRAlXuUWXfnFaxlPX9CUMS+xBFkbVlYWg==
X-Received: by 2002:ac2:50cd:0:b0:4ec:8615:303e with SMTP id h13-20020ac250cd000000b004ec8615303emr495805lfm.33.1681370149673;
        Thu, 13 Apr 2023 00:15:49 -0700 (PDT)
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
Subject: [XEN PATCH v8 08/22] xen/arm: ffa: add support for FFA_ID_GET
Date: Thu, 13 Apr 2023 09:14:10 +0200
Message-Id: <20230413071424.3273490-9-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413071424.3273490-1-jens.wiklander@linaro.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for the FF-A function FFA_ID_GET to return the ID of the
calling client.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 90ed71cbfda3..f129879c5b81 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -181,6 +181,12 @@ static bool ffa_get_version(uint32_t *vers)
     return true;
 }
 
+static uint16_t get_vm_id(const struct domain *d)
+{
+    /* +1 since 0 is reserved for the hypervisor in FF-A */
+    return d->domain_id + 1;
+}
+
 static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
                      register_t v2, register_t v3, register_t v4, register_t v5,
                      register_t v6, register_t v7)
@@ -195,6 +201,12 @@ static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
         set_user_reg(regs, 7, v7);
 }
 
+static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
+                             uint32_t w3)
+{
+    set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
+}
+
 static void handle_version(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
@@ -224,6 +236,9 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     case FFA_VERSION:
         handle_version(regs);
         return true;
+    case FFA_ID_GET:
+        set_regs_success(regs, get_vm_id(d), 0);
+        return true;
 
     default:
         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
@@ -237,6 +252,12 @@ static int ffa_domain_init(struct domain *d)
 
     if ( !ffa_version )
         return -ENODEV;
+     /*
+      * We can't use that last possible domain ID or get_vm_id() would cause
+      * an overflow.
+      */
+    if ( d->domain_id >= UINT16_MAX)
+        return -ERANGE;
 
     ctx = xzalloc(struct ffa_ctx);
     if ( !ctx )
-- 
2.34.1


