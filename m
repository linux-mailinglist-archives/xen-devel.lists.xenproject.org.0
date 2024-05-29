Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2921E8D2E16
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 09:26:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731496.1137029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDhI-0003i5-K3; Wed, 29 May 2024 07:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731496.1137029; Wed, 29 May 2024 07:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDhI-0003fk-Go; Wed, 29 May 2024 07:26:08 +0000
Received: by outflank-mailman (input) for mailman id 731496;
 Wed, 29 May 2024 07:26:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+wO=NA=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1sCDhH-0002xp-Oo
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 07:26:07 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b49b26a9-1d8c-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 09:26:03 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5295eb47b48so2163324e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 00:26:04 -0700 (PDT)
Received: from localhost.localdomain ([2001:2043:5e37:9d00:b09:3200:dd72:cfc8])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5296ee4a58fsm1182353e87.67.2024.05.29.00.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 00:26:02 -0700 (PDT)
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
X-Inumbo-ID: b49b26a9-1d8c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716967564; x=1717572364; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VzeWK8x82YxZO3FACx+2RlqRVfXhRtSExk4PP34ai4=;
        b=UF1xwjfU11jMAoruWrPSOaPXIXLOW9FovPzSabYrt0ugV5KA0mOb4BQqD3O1DNojl1
         cDYNMvxOUtOjjSYFRDmo6LuyLV0F9lg1/EB7G49yQ86Qu2AdAGoteK32HKlkfuGkHOUc
         bPottUM5iY/qJdBEayPr4KwtF9tJOssTNii/Bvp2j3OFty1YF7ipoXHX3H3MnpXSFwiz
         4cr3kBjMsIGd5wpFlGvxaJ9zk5fxq0JZAM2XuT/Zt9HdajCW0YyKlMRaGZ01vxywhi2a
         rrehQkzlxwT0jTdBfqnuubZTd8TpOCj8fwpWY3W8PlfEe+BHmA+AIdyXpVrYPWUXdQuD
         zALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716967564; x=1717572364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2VzeWK8x82YxZO3FACx+2RlqRVfXhRtSExk4PP34ai4=;
        b=o6wV/5svJxALnVMTh/ziVE1oM/M3JzCFb7pnS4SAgEiDZEZqTLM/SpVc9aSq2HylKq
         T0Qk7jh8oInSAGcY2gdvQXCxD2tXK782Bx3Mj2USxhquq7yjfQFPYjCYUA1ypCUCvKSJ
         ygKMdfwfOQjXolMh2I0KyqcvhE1U97venPWNTgSFaxDzrIXlN1r5XErv6Bwa5fGSGEsK
         YYo1H9FCwTSsu0wh4ImAFv9kwYQMicBSP7dWKM4fDYT50YXZpGXy4BY/wiJWt6uXsXbx
         iIdK127xilcmISUTTYcDdInI7qUmlahhSmHQ9PLO3RTtm4c55PpjdL6SRbejI1W/tBr/
         9REg==
X-Gm-Message-State: AOJu0YxS9DpYipRdb6/YNMyU1eZY98us/2d+x6+igh+VIfjllph+AFBr
	7uWXdlxKUHzxiBpYzh+0sCJ/U8CUgkwZCUukQhTcUOeZd264mX1Hl4Svdp9G5ByYgq1M18H6OXL
	D0wM=
X-Google-Smtp-Source: AGHT+IHUammB1br6gC/kNEl2MIJXLC3DblISLU4GACqDN+CQ2EGDJncNtdswHtQjYuXcwxxcJqhvRg==
X-Received: by 2002:a19:6a17:0:b0:529:c0c6:faad with SMTP id 2adb3069b0e04-529c0c6fbcamr1133747e87.28.1716967563718;
        Wed, 29 May 2024 00:26:03 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v5 1/7] xen/arm: ffa: refactor ffa_handle_call()
Date: Wed, 29 May 2024 09:25:53 +0200
Message-Id: <20240529072559.2486986-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529072559.2486986-1-jens.wiklander@linaro.org>
References: <20240529072559.2486986-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactors the large switch block in ffa_handle_call() to use common code
for the simple case where it's either an error code or success with no
further parameters.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
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


