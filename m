Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8A97695E4
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 14:16:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572973.897261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoh-00088W-2L; Mon, 31 Jul 2023 12:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572973.897261; Mon, 31 Jul 2023 12:16:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRog-0007yg-DG; Mon, 31 Jul 2023 12:16:02 +0000
Received: by outflank-mailman (input) for mailman id 572973;
 Mon, 31 Jul 2023 12:15:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VuP2=DR=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qQRod-0003r6-IG
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 12:15:59 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0151d164-2f9c-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 14:15:58 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fe1c285690so5939120e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 05:15:57 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac2430a000000b004fbb1bc1ae0sm2028077lfh.163.2023.07.31.05.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 05:15:56 -0700 (PDT)
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
X-Inumbo-ID: 0151d164-2f9c-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690805757; x=1691410557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6DPe1jvY7rersaps1H4x8200JLUC6kxOQle79BMJ3w=;
        b=YbLBt51bWU+HuvJn0TGGLBvRUUFEFj5hJsHmr2IEOTqZQgX7SG0kfH8Iw81tSDTIEz
         r00BSXSJYyrW4ADR6kcRlxZjKRvqQvK0JXKt+8YfBu0RaByt/FVzj4SrTPNZWXlhoVmc
         JlGd8kzNh/W4NRAZI1vhfDoDfq4k4RnZEJUt4aMDeGaDKqdCRdMBx652qXuYCy83wMrO
         Lyk/vmkgbInZnr4MKRN+8aPFBIxRAJv9+3edSuRAWyqBWpwR7ZMg7ZfFmwrpPMCJByLx
         WALNsJ555CFMF6Zr/teDX3t+Sy3r0wqt6xgy69+of5NUhQ3rqZ0IV23cZc7YVSZBS3ya
         mS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805757; x=1691410557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6DPe1jvY7rersaps1H4x8200JLUC6kxOQle79BMJ3w=;
        b=dItDanE+P6xbdcC6YqFIOF0rNKV2fSpUach6GjR8fGq0eYCDsF0PwQfPVp/CV6NxXP
         xPqUdJKwOUzy1vAKY+dnYC1whYzzYT7QqP+A/QO/d81By/j9MW/kYhJP/d1R/gj3w+se
         kdKQaub2sEuJVTJOajLwljBSbcfn7uJbjQAyvZmeuLAbX42Ah2yXRlbsSq3Eg2XFptOy
         Zxh83YSBtS3BfFwHDr7rQGawmCTLG0OOHPCsNb4yjkl5Yi+/uy7GrHLgPUcuHOb/5/9N
         9Bukmd4iThjh6jDGfIUBCyH/sihuP8ASmw9cXYmgTdlqwnpw76yEkkQDE2NaafSIYK0f
         5ucA==
X-Gm-Message-State: ABy/qLbDAU4WMtmjwwFeWlL+afEwbYNMTNFIg2KSG5daVPQCSgZSw4AL
	q/ijnTJi2vhR751n2jV9+chXIwCTaxhcW6+xCso=
X-Google-Smtp-Source: APBJJlFKmXITZt0r4z+c/dlQvrr59iXjr59ZLc8lpfQIsDNZB7RFSH42uxv9CLuKatYEqcpZcBvRFA==
X-Received: by 2002:a05:6512:3e7:b0:4fe:79c:7269 with SMTP id n7-20020a05651203e700b004fe079c7269mr5159360lfq.67.1690805756910;
        Mon, 31 Jul 2023 05:15:56 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [XEN PATCH v11 13/14] tools: add Arm FF-A mediator
Date: Mon, 31 Jul 2023 14:15:35 +0200
Message-Id: <20230731121536.934239-14-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731121536.934239-1-jens.wiklander@linaro.org>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a new "ffa" value to the Enumeration "tee_type" to indicate if a
guest is trusted to use FF-A.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---
v10->v11
- No changes
---
 tools/include/libxl.h            | 5 +++++
 tools/libs/light/libxl_arm.c     | 3 +++
 tools/libs/light/libxl_types.idl | 3 ++-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index f3975ecc021f..bcf290de2446 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -283,6 +283,11 @@
  */
 #define LIBXL_HAVE_BUILDINFO_ARCH_ARM_TEE 1
 
+/*
+ * arch_arm.tee field in libxl_domain_build_info has ffa value.
+ */
+#define LIBXL_HAVE_BUILDINFO_ARCH_ARM_TEE_FFA 1
+
 /*
  * libxl_domain_build_info has the arch_arm.sve_vl field.
  */
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index f98e1affa294..15391917748c 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -207,6 +207,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     case LIBXL_TEE_TYPE_OPTEE:
         config->arch.tee_type = XEN_DOMCTL_CONFIG_TEE_OPTEE;
         break;
+    case LIBXL_TEE_TYPE_FFA:
+        config->arch.tee_type = XEN_DOMCTL_CONFIG_TEE_FFA;
+        break;
     default:
         LOG(ERROR, "Unknown TEE type %d",
             d_config->b_info.tee);
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index b524d1578bd1..3bd66291afd4 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -520,7 +520,8 @@ libxl_gic_version = Enumeration("gic_version", [
 
 libxl_tee_type = Enumeration("tee_type", [
     (0, "none"),
-    (1, "optee")
+    (1, "optee"),
+    (2, "ffa"),
     ], init_val = "LIBXL_TEE_TYPE_NONE")
 
 libxl_sve_type = Enumeration("sve_type", [
-- 
2.34.1


