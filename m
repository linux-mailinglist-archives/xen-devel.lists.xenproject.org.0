Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31625901B6C
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 08:54:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736900.1142957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGYug-0001tu-7d; Mon, 10 Jun 2024 06:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736900.1142957; Mon, 10 Jun 2024 06:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGYug-0001r0-38; Mon, 10 Jun 2024 06:53:54 +0000
Received: by outflank-mailman (input) for mailman id 736900;
 Mon, 10 Jun 2024 06:53:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FMhB=NM=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1sGYue-0001oX-DX
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 06:53:52 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30aa8c65-26f6-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 08:53:49 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a6efae34c83so189671266b.0
 for <xen-devel@lists.xenproject.org>; Sun, 09 Jun 2024 23:53:49 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f1e6795b9sm107981966b.174.2024.06.09.23.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jun 2024 23:53:47 -0700 (PDT)
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
X-Inumbo-ID: 30aa8c65-26f6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718002428; x=1718607228; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VzeWK8x82YxZO3FACx+2RlqRVfXhRtSExk4PP34ai4=;
        b=cYsfA46SHwpPnhzK1vOVQX3W3bmDYPSgg4XnVWEIWo9UKzr2jjItSjdHom0gRbXmlk
         a/t4kOXTzxmY/jdrvGS69i/5UUZ1V/rSnZz/QF+QUTBhBXuhkZ0d2fEjQCVAr+MUwLss
         6nPc6UuCRWX4MHH74B3MJgWp9DdsZp0+anxG1maJ8B+fdRXNCPMAcYLnmpnI93iX6jOC
         moluf+21qrjf0g/jCb1BBgrxRXsqiue9a95VESH8/4iaZTv2hgtv47thf3tEGxpqDOVW
         sQ5P8bamOshepzCCg9AfzuHVnsm84S6TdFI3Czv0OoqEHPFSvVzBbtUXinDZ3NejeD7z
         RRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718002428; x=1718607228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2VzeWK8x82YxZO3FACx+2RlqRVfXhRtSExk4PP34ai4=;
        b=e9ZzU1FNeb3dMYgHMbJkn7TRNDMpgXZ5ZbRyeqX0/8FY+TyptNNO9OkSqmYI2yu7yW
         CdvKbysUn2b5uoTX1p1V/YdFu+KQDsC+v2YWhUEyLJNH71DD6QwE+PmgCFrjgBgbpk+Q
         3Lxu9Ynf22Alf+7BDv1GG5iYV9Ubq1ENuwUi/W8kiDb7lSvPlVapLigOllD7TqVQzDcO
         QEY+28H5iAbielTPk5lxLM19sxIb4rRkU0SZn12O5h3+7fk4kUUwlwIG7KGM0J/s9jZI
         WE458BarE5fvPSc2f4KISkVitipulTZEX5+AMsBgknhyK3lUoJADn4EstzgeKf7Npka8
         5+0Q==
X-Gm-Message-State: AOJu0Yx7Mw7fYYGCY5696jAEGOM0GgmpHQ9BjH5j1mTqTeSySrFAmIwI
	Z0url6ngzjd6QvnTJn/Tvq9zY35MmcIfvl7Mv0YBeFFuZzA66WP96sF65afqJf6mRKuWaNFjwxs
	l59A=
X-Google-Smtp-Source: AGHT+IFksq917houloNmrm5lAA40EHRgPJB3pWIU+MWKx9Za4TcrtnD1C83f+jBsjtwQ38ngh3ac0g==
X-Received: by 2002:a17:906:ca0f:b0:a6f:1d50:bf1e with SMTP id a640c23a62f3a-a6f1d50c0a1mr115807866b.43.1718002428347;
        Sun, 09 Jun 2024 23:53:48 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v6 1/7] xen/arm: ffa: refactor ffa_handle_call()
Date: Mon, 10 Jun 2024 08:53:37 +0200
Message-Id: <20240610065343.2594943-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610065343.2594943-1-jens.wiklander@linaro.org>
References: <20240610065343.2594943-1-jens.wiklander@linaro.org>
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


