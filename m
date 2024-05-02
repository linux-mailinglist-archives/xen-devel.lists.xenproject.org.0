Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BFB8B9CEE
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 16:57:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715878.1117854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Xrh-0008BV-Uc; Thu, 02 May 2024 14:56:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715878.1117854; Thu, 02 May 2024 14:56:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Xrh-00088w-R2; Thu, 02 May 2024 14:56:53 +0000
Received: by outflank-mailman (input) for mailman id 715878;
 Thu, 02 May 2024 14:56:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZceG=MF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1s2Xrg-0007uZ-5F
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 14:56:52 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 355ec5b0-0894-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 16:56:51 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-572adaa172cso557118a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 07:56:51 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 i15-20020a0564020f0f00b005726dceb2easm621919eda.20.2024.05.02.07.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 07:56:49 -0700 (PDT)
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
X-Inumbo-ID: 355ec5b0-0894-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714661811; x=1715266611; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VzeWK8x82YxZO3FACx+2RlqRVfXhRtSExk4PP34ai4=;
        b=FW5wAuh6FO40tbiFPWsahhPfdYQpptM8uZZ7bMX9IVW9fzP5enIV+jx70BaT0MNnpO
         nKPnm44seVjWLsNwho0Uc5o6uPyDcGcNvj5iJHG/kOoq+ZIZdZULsEwO19jYMIsjZXOO
         IeweHMarW6g7mT+LAZEiryLd3XkX8It9f08CpfkE0EDBDhe3iCyhYbJ8zfwmyDcEI0pQ
         37j+G33YXzZ9gmzHZMY7bNyQFzeaUvVUbsivL/qdAxYk+FkjHnoLhynGYBO/jzaNJUOX
         skq8LHzz5Cn999cj4RZ/hIJRRqXjQmyu/xOJgAHgDh8s+HSYt3czG5UH1dbCli6uG6lJ
         nQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714661811; x=1715266611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2VzeWK8x82YxZO3FACx+2RlqRVfXhRtSExk4PP34ai4=;
        b=adi5Y2k/Pve3LXWKE4pSGEq7KqyXSK1MsVSzY5suyNIcz42sStozFpViNP/He9TuEm
         tNDPGfny+YlbxLe1Fx83J8GZuE4UlRA0yEWGMOqPf9QODMi1njh7VLN/wvIxaAmQ01bk
         vbhhB4cgiUGRkTk2NMUc+7+HVYn04PIMqJ9cL2eZAH7EY3UcBqepioAV1g6DgE+TPLb4
         1Pa3O+dtpUIqHnZlf0aqHJNSIDob1ywpfzgbTGptR41Qx5kQTtHdJN0aWIgJCFs0+jHP
         YmQrd/ex5oYL1guQt+THaaBqF2eNsM5Uhb39fpXXwhsw4RxDSI3NlbQD3Mupjf24aLhT
         9D0A==
X-Gm-Message-State: AOJu0YyFXu8HDYW/tAOHd0JceDrBRfjUW4vtsJ3IihrNtfedaw2M8PI8
	Ldju4KW6A/GVApvewcRzmvojAuYzYOPzIxko0NNeVjkuY9lvpbdXg+qa4M5TWuvaNga5djJvZee
	b
X-Google-Smtp-Source: AGHT+IG4PNAt8sZmx/Xvf451yAjWAXkcpUe0VMrJTcWHf4v9vwpgHknG1PyFhplfqM4XnRBS6+qB/Q==
X-Received: by 2002:a50:8ad6:0:b0:571:da40:22d9 with SMTP id k22-20020a508ad6000000b00571da4022d9mr2338474edk.10.1714661810749;
        Thu, 02 May 2024 07:56:50 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v4 1/5] xen/arm: ffa: refactor ffa_handle_call()
Date: Thu,  2 May 2024 16:56:41 +0200
Message-Id: <20240502145645.1201613-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502145645.1201613-1-jens.wiklander@linaro.org>
References: <20240502145645.1201613-1-jens.wiklander@linaro.org>
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


