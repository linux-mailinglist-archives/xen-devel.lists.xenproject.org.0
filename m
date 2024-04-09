Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F0C89DF4E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 17:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702501.1097582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruDWb-0005Zb-1k; Tue, 09 Apr 2024 15:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702501.1097582; Tue, 09 Apr 2024 15:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruDWa-0005X2-Ry; Tue, 09 Apr 2024 15:36:40 +0000
Received: by outflank-mailman (input) for mailman id 702501;
 Tue, 09 Apr 2024 15:36:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n+OA=LO=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1ruDWZ-0005IN-41
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 15:36:39 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3be7998-f686-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 17:36:37 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a44665605f3so658896566b.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 08:36:37 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 gs44-20020a1709072d2c00b00a46a3ad035esm5849000ejc.179.2024.04.09.08.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 08:36:35 -0700 (PDT)
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
X-Inumbo-ID: f3be7998-f686-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712676996; x=1713281796; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tq93WPQosnJ9mNzaU1t6RTCuYLzdJLsCMqw2tR2kTUc=;
        b=dn0myULHZ1TQtYEf4eDWraP2MQK56OXDIPpGPR7qc2i8HV1OeYHFRIoM5Cv5L9f6Le
         HRRtMYSh8rr1bEydGfsxCaHqEJ21+X/Ul7y8TTv3Ryp+nSh1a9XCU8pYyOzYHbYb9ld5
         IKVjFo71hXXxaR823NoQffiKwUmlUiT7NnZUKaUMwN3TMH3OciwVkJeMAN13E7I47eRJ
         30xTUa8hBqdNjsoBUzmsbIf8Xm1AB3njIGfZHuBP02M5ynTgHoWbFP7w45+fbJ/YhuLD
         FO8rdq52UGKy/12FmN8nTshuHhlykBY/JTqSL2tMMoAZpUM9WCBoZ7Biugljhi2Ox8i6
         0/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712676996; x=1713281796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tq93WPQosnJ9mNzaU1t6RTCuYLzdJLsCMqw2tR2kTUc=;
        b=pRVd9UaIBQsDnTSGNHfxNhXeJkdOZ2JkWtQS51XsvyEacp16uf+pvBCfWv317vSnGp
         Z8QxJkkV72B/8cp6ww1bRzae6WmtH4fsYWLs1z9OAs/liLmUFnuaaydyqkxbSEOkpwsX
         HLlOnnB3xL7tOM4WrY5HH8x4EQi+ipBt9UCgBit3+NmJjm5SfphF1SK3MX+pfDHWB8C3
         rU3g73DgRZUHaE66pxXvYk8PKdtj9CKNQWCTKwVCRjdBHZe2WC8onxUml9hH5FekoqOZ
         ig/xeHIMBwvmP6tDz6XqrS9Sn8r7qW5D8Rquj44NAmNJua95h4jQ9NhSRXVBu2+0HbWF
         ciRg==
X-Gm-Message-State: AOJu0YyV7bXLwJQzP20bJq5jg3R0ADd2/TblVhNxRSxw9fsyq87jJXoQ
	YUkM5z8U2du7vsK4aQgmB60/BqvqjFNs1V+ST9wY0nqYTrGyU80VWmRxv+aC9kH87yOpVoe2ieh
	Z
X-Google-Smtp-Source: AGHT+IHzQ4aNK0bOM68T+jvL5+0yoYRMd3y8CZAcEIbSCHRQw5E/IvmNyJidSpMF2jN5u6WxxPPjtQ==
X-Received: by 2002:a17:906:fb8d:b0:a51:986c:79dd with SMTP id lr13-20020a170906fb8d00b00a51986c79ddmr7613505ejb.27.1712676996347;
        Tue, 09 Apr 2024 08:36:36 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v1 1/5] xen/arm: ffa: refactor ffa_handle_call()
Date: Tue,  9 Apr 2024 17:36:26 +0200
Message-Id: <20240409153630.2026584-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409153630.2026584-1-jens.wiklander@linaro.org>
References: <20240409153630.2026584-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactors the large switch block in ffa_handle_call() to use common code
for the simple case where it's either an error code or success with no
further parameters.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 8665201e34a9..5209612963e1 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -273,18 +273,10 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     case FFA_RXTX_MAP_64:
         e = ffa_handle_rxtx_map(fid, get_user_reg(regs, 1),
 				get_user_reg(regs, 2), get_user_reg(regs, 3));
-        if ( e )
-            ffa_set_regs_error(regs, e);
-        else
-            ffa_set_regs_success(regs, 0, 0);
-        return true;
+        break;
     case FFA_RXTX_UNMAP:
         e = ffa_handle_rxtx_unmap();
-        if ( e )
-            ffa_set_regs_error(regs, e);
-        else
-            ffa_set_regs_success(regs, 0, 0);
-        return true;
+        break;
     case FFA_PARTITION_INFO_GET:
         e = ffa_handle_partition_info_get(get_user_reg(regs, 1),
                                           get_user_reg(regs, 2),
@@ -299,11 +291,7 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
         return true;
     case FFA_RX_RELEASE:
         e = ffa_handle_rx_release();
-        if ( e )
-            ffa_set_regs_error(regs, e);
-        else
-            ffa_set_regs_success(regs, 0, 0);
-        return true;
+        break;
     case FFA_MSG_SEND_DIRECT_REQ_32:
     case FFA_MSG_SEND_DIRECT_REQ_64:
         handle_msg_send_direct_req(regs, fid);
@@ -316,17 +304,19 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
         e = ffa_handle_mem_reclaim(regpair_to_uint64(get_user_reg(regs, 2),
                                                      get_user_reg(regs, 1)),
                                    get_user_reg(regs, 3));
-        if ( e )
-            ffa_set_regs_error(regs, e);
-        else
-            ffa_set_regs_success(regs, 0, 0);
-        return true;
+        break;
 
     default:
         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
         ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
         return true;
     }
+
+    if ( e )
+        ffa_set_regs_error(regs, e);
+    else
+        ffa_set_regs_success(regs, 0, 0);
+    return true;
 }
 
 static int ffa_domain_init(struct domain *d)
-- 
2.34.1


