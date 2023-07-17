Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF84755CD9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:27:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564223.881651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIde-00087T-Dc; Mon, 17 Jul 2023 07:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564223.881651; Mon, 17 Jul 2023 07:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIde-00085A-9v; Mon, 17 Jul 2023 07:27:22 +0000
Received: by outflank-mailman (input) for mailman id 564223;
 Mon, 17 Jul 2023 07:27:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xV9D=DD=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qLIYH-0005A9-1Z
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:21:49 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9694654b-2472-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 09:21:46 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fa16c6a85cso6408915e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 00:21:46 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004f846cd74bcsm2658938lfp.245.2023.07.17.00.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 00:21:45 -0700 (PDT)
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
X-Inumbo-ID: 9694654b-2472-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578506; x=1692170506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qJzaSd0HvmBntjUGVzcYap0wvkw2yCzYdORcW1H2Eg=;
        b=bBv/vmUt5SNAWbNmektXXpQU68OgYJMFj9Lheo0Cv+SgScp36E7O4c0upQrmA0z3rm
         wFsCZ57FCQgA0vPdclX1rRZJvVCRu9miuA3mIT4FrJ1m/FQTWxifrrDAsGFZG6eUcqdr
         ZaXS0CCnU8eOZhwtIoDnVjozFblA5x0YsnGEG0Gykv4jAqvx8RWXIaX8wI14ag6lnxxh
         iXuO4/06s+I3F8UnnWxWzp62qvH//VTBBslojTtjIckZWhkxJal3ZzGl2xvX9I/HeeDK
         CqiQ89TKB3tYF1WIbhpTcoVHgnOzWO6lkB/SJplWftOakVU7245HLhsUSuPf8G/EDFme
         qPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578506; x=1692170506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qJzaSd0HvmBntjUGVzcYap0wvkw2yCzYdORcW1H2Eg=;
        b=i/aCpzojBGxJrxqqkDDO2mVfLgh/2M6XPur5fDc9894EIeSDsuZ33n+Rs3W6CqbEwo
         885Nwk1KHMX6iUFQbsYq0e+g9nm6MQZHrU6NqWZzef84UYRWzlJmjJfy4I8VSRkh+Yrx
         j5BIIycC6sI87dOUWhJqaKv+vOoNCyh1U0WvCBN7ucA3dfPY0hkYFmn59/I84Nl7uBVQ
         6iScbNTFrGVICtJEYJFHtPYog0Ajy1CU3c2G6dc+zt/7cU/57OTA6CBNBKudgi2rBKhU
         Y5fnI78uIGRGUodYzSNkLGSNUm9cSUDfB3mSiD79sdoI7rXh4cW0wPzy1x5pPrM2DKsE
         qe+A==
X-Gm-Message-State: ABy/qLZwc8AmD9hQ3RN+GRvLYNr54m9mj0LG84fWjmyWetSSA3OtTI3t
	KTe2MVRl6fKwyT+lgiuRqVBKtr3aJnd7p2zU5So=
X-Google-Smtp-Source: APBJJlGEm67PfXIWh5OJLABNeapeV4BEyEPcBP/UnOrbUV7hZV+9sFHqBlvBiUkXZdSu8Jpm7rjLuA==
X-Received: by 2002:a05:6512:3d22:b0:4f8:752f:df48 with SMTP id d34-20020a0565123d2200b004f8752fdf48mr8572366lfv.29.1689578505960;
        Mon, 17 Jul 2023 00:21:45 -0700 (PDT)
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
Subject: [XEN PATCH v10 23/24] tools: add Arm FF-A mediator
Date: Mon, 17 Jul 2023 09:21:06 +0200
Message-Id: <20230717072107.753304-24-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717072107.753304-1-jens.wiklander@linaro.org>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
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


