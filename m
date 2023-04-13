Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0357F6E077A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 09:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520462.808055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBM-0001sM-Fe; Thu, 13 Apr 2023 07:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520462.808055; Thu, 13 Apr 2023 07:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBM-0001mg-9j; Thu, 13 Apr 2023 07:15:48 +0000
Received: by outflank-mailman (input) for mailman id 520462;
 Thu, 13 Apr 2023 07:15:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmrBL-0001gq-7R
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 07:15:47 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 027433b3-d9cb-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 09:15:46 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id 26so1146103lfq.11
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 00:15:46 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 n12-20020ac2490c000000b004dc83d04840sm181354lfi.79.2023.04.13.00.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 00:15:45 -0700 (PDT)
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
X-Inumbo-ID: 027433b3-d9cb-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681370145; x=1683962145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvHKHuXznPMzD/YrdwjpNkW0g0k7uCPv2OF4tumTIDg=;
        b=DxBHQVm8UihnJHYKIUCIRR4mhys8QHkTlgKUvBv8RJDmjDYQTMTPuDqqbViOSBsbn2
         TNVIM8CmIpsufjdLysMS5NUS4UnMM5V/uwkNyVXARSx0YudIWg47FsTbgoiUHhKGzk3i
         /j0A6GHghGov3HPZGsQSdoKqlqR3bH34EeaysF2xnw5mjSTa1CzzPYQ+LoQsutJ7NPkm
         6jQGzFuqFkX0M/O44D7zzJS3Y0vrkJB4s05OQBzsCMDuO+ThxyZlM1inrgAZwLbKPMF/
         iFZPHdsAekJLRjDwylEiL1Jswv+jzPIiPlylHHf0VQR5MJ9dXMtSfVePZ2PtzRhGlflx
         CJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370145; x=1683962145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvHKHuXznPMzD/YrdwjpNkW0g0k7uCPv2OF4tumTIDg=;
        b=IEZXGBrwI4SCipDzuZ7WcbEU9GOYlKr77+YwzGTGYg4MvvTH/qlsJXieUzftyYSsbw
         jleNGuGrJNogSBvSfiKt8EEimCVscvj/Qgf6ov3V1PeIHkHHoeHzow4zpc+xJC0XbUDR
         cJQvSWxV9eNLqdrzaPYkwO2Rq+1Fz1XrEio+4GEDHJDflFmWXlpGQIb1kWrT+sPeA3gJ
         pkEA80J5qgRI3im59hQYXEan/hVPu+V3vaZxkGicbqvW/MtyVDQgYwd/LgpMO4E0cu+h
         jsTRfghPXh8P8npSR3zqyADurHW/sWx7/MR9TQz359X3RAjMG+Ri6reVqW7iscaRVN1h
         omDA==
X-Gm-Message-State: AAQBX9fdkFzylwaxLpvgcLSP3X6mwzU0fT4zQXS+taD9t8po/RoWn3QQ
	odBKi9OCwH7njn5J6svPr/x26vb+NNZkOf405tk=
X-Google-Smtp-Source: AKy350a8U/l3Qa0bSPOl21Sj+Fuz5NilmrG2kLfKY3kCeRxYyC5CV0tP0CCqVlw1bSHkvy9bxluygQ==
X-Received: by 2002:ac2:43bc:0:b0:4ea:f526:5bea with SMTP id t28-20020ac243bc000000b004eaf5265beamr386992lfl.27.1681370145684;
        Thu, 13 Apr 2023 00:15:45 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH v8 03/22] tools: add Arm FF-A mediator
Date: Thu, 13 Apr 2023 09:14:05 +0200
Message-Id: <20230413071424.3273490-4-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413071424.3273490-1-jens.wiklander@linaro.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a new "ffa" value to the Enumeration "tee_type" to indicate if a
guest is trusted to use FF-A.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 tools/include/libxl.h            | 5 +++++
 tools/libs/light/libxl_arm.c     | 3 +++
 tools/libs/light/libxl_types.idl | 3 ++-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index cfa1a191318c..7c48e8d8472e 100644
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
  * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
  * 'soft reset' for domains and there is 'soft_reset' shutdown reason
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index ddc7b2a15975..601890dda1ce 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -205,6 +205,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
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
index c10292e0d7e3..1a680d0f8839 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -520,7 +520,8 @@ libxl_gic_version = Enumeration("gic_version", [
 
 libxl_tee_type = Enumeration("tee_type", [
     (0, "none"),
-    (1, "optee")
+    (1, "optee"),
+    (2, "ffa"),
     ], init_val = "LIBXL_TEE_TYPE_NONE")
 
 libxl_rdm_reserve = Struct("rdm_reserve", [
-- 
2.34.1


