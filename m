Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B498AC5AC
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 09:37:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709714.1108698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryoEy-0006kr-SK; Mon, 22 Apr 2024 07:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709714.1108698; Mon, 22 Apr 2024 07:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryoEy-0006hf-Ob; Mon, 22 Apr 2024 07:37:28 +0000
Received: by outflank-mailman (input) for mailman id 709714;
 Mon, 22 Apr 2024 07:37:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALvU=L3=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1ryoEx-0006Sb-Dc
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 07:37:27 +0000
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [2607:f8b0:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29856638-007b-11ef-8b06-e9908f64f69c;
 Mon, 22 Apr 2024 09:37:25 +0200 (CEST)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6eced6fd98aso3860280b3a.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 00:37:25 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 x37-20020a056a000be500b006edcceffcb0sm7221726pfu.161.2024.04.22.00.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 00:37:23 -0700 (PDT)
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
X-Inumbo-ID: 29856638-007b-11ef-8b06-e9908f64f69c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713771444; x=1714376244; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VzeWK8x82YxZO3FACx+2RlqRVfXhRtSExk4PP34ai4=;
        b=BRr1HZgeHXiJ1xOcD0StlhMj3Uk9dgUU1qFGyQPIgRQFKCxTvjNEc6dpiWjrjnvAVw
         8dPyU/hjaUkj97IQrH+0xkRZKKZlnvR6ND/2IWV4mn7KH2rJQ75zfOpIj/uGTAFLwUYb
         uQrzF9d6Dh+S8N/YhQFzHNxdBKF6NSeYIEHtKGZEvZT9DWVEPEWotAFimWtmYWimWaYH
         glw51+rXIZYl//y9p/Myr7o2woo+0v7bfzQYvQAy3A+x5HYInWoaXBbnLhRSXvy71GqU
         kL146qmi499geBvrlmIoegq5OK1EgBzKcx/HnQarxoMLtYBDNO8bo6z3Wowg/kGhv++P
         6HRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713771444; x=1714376244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2VzeWK8x82YxZO3FACx+2RlqRVfXhRtSExk4PP34ai4=;
        b=d0dglx+FKwCRu9PeMtJ9h7eGW0+7Si8U9Fp4fnxUkqIDN6y+KdDteHco9mxo32+dnv
         oxZlJPi9NXl1UVEb4OuD+7VkjVhOZhS37aRP57LAlhgt81ue7g0QSNooSbNRB37z4jK+
         TKYpZCj3nSpkG0eCG569pa4v6Zl+CCWwmKaVAdffK5Yji9G1USjsG0aDPTrbsuji/2jH
         Z+leX5jS/dX2J7Jn0oaNu/fHADi9UDBrIeHb5J3PezD4NwH69exY0AUdMp1aWODvxRO5
         ntbRQN7A5xIbvP+wTZNayYdrBZDl9y36TbcFueUZvUFd1XVfm/P6jeJtZQmYVhBj4z2X
         yqIw==
X-Gm-Message-State: AOJu0Yzjfpxznv1UCVCnhJKjplVcGNrEkV7lmzI5buEfgDDUdbCMZV4A
	iUdusbq7hMZaA4C/ySxCAjNK2URZIHZRaTRlyhOTEJhRT9BOB6VEYb22idn4+Fu3k9DIs8FvGgw
	t
X-Google-Smtp-Source: AGHT+IHvzUzQnmPOJwLqCNPYatbb81JlKVMMSj7eh2f/KL7gdQ+7f2dkOyd1cR6AGmf3KGwkBYHq8Q==
X-Received: by 2002:a05:6a20:43a7:b0:1ad:a8d:dc6d with SMTP id i39-20020a056a2043a700b001ad0a8ddc6dmr6800017pzl.8.1713771443904;
        Mon, 22 Apr 2024 00:37:23 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v2 1/5] xen/arm: ffa: refactor ffa_handle_call()
Date: Mon, 22 Apr 2024 09:37:04 +0200
Message-Id: <20240422073708.3663529-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240422073708.3663529-1-jens.wiklander@linaro.org>
References: <20240422073708.3663529-1-jens.wiklander@linaro.org>
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


