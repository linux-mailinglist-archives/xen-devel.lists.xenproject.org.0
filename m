Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92538810E7B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 11:32:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653841.1020498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDMXo-0001zA-4e; Wed, 13 Dec 2023 10:32:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653841.1020498; Wed, 13 Dec 2023 10:32:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDMXo-0001vu-1H; Wed, 13 Dec 2023 10:32:48 +0000
Received: by outflank-mailman (input) for mailman id 653841;
 Wed, 13 Dec 2023 10:32:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ptd6=HY=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1rDMXm-0001vk-Kf
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 10:32:46 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f442b278-99a2-11ee-98e9-6d05b1d4d9a1;
 Wed, 13 Dec 2023 11:32:45 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a1db6c63028so778803766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 02:32:45 -0800 (PST)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 ty8-20020a170907c70800b00a1e026ac542sm7652383ejc.10.2023.12.13.02.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 02:32:44 -0800 (PST)
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
X-Inumbo-ID: f442b278-99a2-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702463565; x=1703068365; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dk0Swo1pvH4Yil7NubYxKLwP+gfqZz/ud6scZNaZ/gw=;
        b=imRyJwbI6Wwg87oOQM28jNRiNGGh/hDeKWytG6uR38GGDoMQNRDs2W+yTABhmJxQS4
         EiFlHLAzAGIBSWEMjJdmzKtTRJnJj6KHtYkwzTTGjA/2egSJ98DSfmb5/KWyUQxqDyGb
         SCyhJQbXrfpXOmjG6QVvUCwBU47YawsinIH0riKfvd4Nlq8FoeYTZHj5KLFu385V9y0P
         yMePs9WZOA8TFTNbrhUu1TgasIpcSO86ukJ+ZqqViqIVLSTO8gZ1Ekx9DLaNP0mp6crM
         G7fg26Ly7GQOcSxOtRyd3Rp4qUu3VOfGPMrlNZ3LbXN+wHKHtPW9Ma3GspduhlnZUkmd
         nyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702463565; x=1703068365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dk0Swo1pvH4Yil7NubYxKLwP+gfqZz/ud6scZNaZ/gw=;
        b=nd4tnxhGl7bOOiuSvAsALX/oQZYIx7P3wRT/qFdo4ARpD1s3ja+wyY+kobinprhd9n
         kphgIvtkDpld3bYzkBdvJbj5NTCFq8I4ZvtCnfw4IzuriQMqOHYh+sx8qNO2nfaQ0Pu8
         XxmHsijLUf3ATihsS+IEtVlTRrs1LkmqYRAil07zPLk0gFBYpgKFpVj1JmT5I8EnRvyI
         mxjydmtWZh43yBSgODupFfNTVSmQAcLxd4fChBcF2UxSL6awmsqM0IP+0Dqm2qDQ8f44
         zoc9d9A4akQixcAuEIEgG0CRGwRDQat+iOT9CWLYAao9UASPvGnaULIVJfVI7PiCPleG
         /AHg==
X-Gm-Message-State: AOJu0YzHLUwwj/7eecKchFyOIR83hlkXaAzBfahGsh05ODajXREEEhJN
	gM/CeuxDZ3halBV84+TlSvhxf5UJZqQlLQr6f/k=
X-Google-Smtp-Source: AGHT+IHvfV+uEmYCbEM3+HEyzqaMMVy0ebJ/kLQHHqDQpdXRieCq5RB4G36wi4Iyly4+54CUBsImcA==
X-Received: by 2002:a17:907:9623:b0:a18:8d66:b3a5 with SMTP id gb35-20020a170907962300b00a188d66b3a5mr4426624ejc.36.1702463564936;
        Wed, 13 Dec 2023 02:32:44 -0800 (PST)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH] xen/arm: ffa: return FFA_RET_NOT_SUPPORTED on unhandled calls
Date: Wed, 13 Dec 2023 11:32:41 +0100
Message-Id: <20231213103241.2346813-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Until now has an unsupported FF-A request been reported back with
ARM_SMCCC_ERR_UNKNOWN_FUNCTION in register x0. A FF-A caller would
rather expect FFA_ERROR in x0 and FFA_RET_NOT_SUPPORTED in x2 so update
ffa_handle_call() to return true and with the cpu_user_regs updated.

Fixes: 38846de2176b ("xen/arm: tee: add a primitive FF-A mediator")
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 183528d13388..98905fec7967 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -1477,7 +1477,8 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
 
     default:
         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
-        return false;
+        set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
+        return true;
     }
 }
 
-- 
2.34.1


