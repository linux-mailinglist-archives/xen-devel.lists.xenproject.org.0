Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E04F748106
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 11:35:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558901.873522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyvK-0003UP-QS; Wed, 05 Jul 2023 09:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558901.873522; Wed, 05 Jul 2023 09:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyvK-0003Nu-H1; Wed, 05 Jul 2023 09:35:46 +0000
Received: by outflank-mailman (input) for mailman id 558901;
 Wed, 05 Jul 2023 09:35:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hy0b=CX=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qGyvH-0006bq-Jy
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 09:35:43 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fbbcc8e-1b17-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 11:35:43 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b6afc1ceffso106242191fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 02:35:43 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q22-20020a2e84d6000000b002b6d8cfb6d2sm2910625ljh.140.2023.07.05.02.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:35:41 -0700 (PDT)
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
X-Inumbo-ID: 4fbbcc8e-1b17-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688549742; x=1691141742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qJzaSd0HvmBntjUGVzcYap0wvkw2yCzYdORcW1H2Eg=;
        b=ipq/A2Hi2yQUmOcd+UZDrLei6lggYX4sIgnIVHJKc77vrX5poi1Yzzassr7SKrPsnm
         OyhOSngsjtiuR81fAvKtsl1tVmmxfFVuGBBRFSbys7HttK9RFwmoncVPBCK8JHR1vZmU
         SojLhvTT7T2PVQ4kUGa8QlVqc4guEqO3hIjyMVKKnLftmS0f1zn931MCTMzcCepRBDHA
         mwr9GCscYEZA1iumyDG2vffm1NeyA4SMcOZ6QiSLwwC+w2acvCt7D1m0V5mQsqMqyQjf
         Y/4h5UQ8Am8erHTFAt2LXWK2+VFTyoC5a9OjipK3wd/EMG3p5YtCc3zkitATsYMuhJei
         Mr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688549742; x=1691141742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qJzaSd0HvmBntjUGVzcYap0wvkw2yCzYdORcW1H2Eg=;
        b=aOEmrC6xX6kFEP9iO21Yv8iDGLrRG0DAgpcfdb/e8U07LdAKjP+zk0XB/dA2XZio3K
         G+VibI0jQvUFCvpoULLObfAUFKKQh7ZN2gFeG8bP1FSmU+UerqIop7WqzHqOuPmeVG8e
         V1sHwGUwKmXaXO+UctXFrGyOsrYv5MVJ7k/V6VuUvpGYX1crwvGPBzuhkQH9tN+OiCet
         iIDKrcn0f3RrKWfbBvmxM96Ha91d9R5jtUuphiH+e3qNBWedpNP0ARJwb6WywJYFohnr
         8hKQmAQ9O/Ls+x+dZQY670EqmkRm23Crcga8NSIdoNAKmAeM9GefE3MCE1GuM2bXcR9o
         jejQ==
X-Gm-Message-State: ABy/qLaz5n0d9Kt/CEaVSs6SKBWUlR5cEGf80NDPuGbwIfmgL6sDrBOV
	zh/oUtfDmwjSi6I8W/zxzZcJ49mz+g0Ey3KtL1E=
X-Google-Smtp-Source: APBJJlHUJBWSzdcUQruJ6Mrl2LWhLifbL4Yl9LecwWQlfhdSBsxllBSZTar7jy7JAcWGb/JRz/hnQA==
X-Received: by 2002:a2e:3515:0:b0:2b6:d89e:74e2 with SMTP id z21-20020a2e3515000000b002b6d89e74e2mr8243482ljz.7.1688549742487;
        Wed, 05 Jul 2023 02:35:42 -0700 (PDT)
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
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [XEN PATCH v9 23/24] tools: add Arm FF-A mediator
Date: Wed,  5 Jul 2023 11:34:32 +0200
Message-Id: <20230705093433.2514898-24-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705093433.2514898-1-jens.wiklander@linaro.org>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a new "ffa" value to the Enumeration "tee_type" to indicate if a
guest is trusted to use FF-A.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---
 tools/include/libxl.h            | 5 +++++
 tools/libs/light/libxl_arm.c     | 3 +++
 tools/libs/light/libxl_types.idl | 3 ++-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index cac641a7eba2..bf1a49e5d687 100644
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
index 35f76dfc21e4..e155c68989aa 100644
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
index 9e48bb772646..65600e17429e 100644
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


