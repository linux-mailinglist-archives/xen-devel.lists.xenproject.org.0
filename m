Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E41F69F811
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 16:34:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499542.770750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr88-0002GS-38; Wed, 22 Feb 2023 15:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499542.770750; Wed, 22 Feb 2023 15:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr87-00024z-ON; Wed, 22 Feb 2023 15:34:03 +0000
Received: by outflank-mailman (input) for mailman id 499542;
 Wed, 22 Feb 2023 15:34:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvgA=6S=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pUr84-0001MH-La
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 15:34:00 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51ed4ceb-b2c6-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 16:33:56 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id m6so10601495lfq.5
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 07:33:57 -0800 (PST)
Received: from localhost.localdomain (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q9-20020ac25289000000b004db0d26adb4sm927746lfm.182.2023.02.22.07.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:33:56 -0800 (PST)
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
X-Inumbo-ID: 51ed4ceb-b2c6-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFm2TzWcNGWz8FKUUitzejc0u2aQwxYFeFHIlHq40P4=;
        b=GzxgN7BXbxo0+/tv1J0713rHL72vukYSwgLPf/P+YI0EbO88BD0N2mt9tsEc6yuqgF
         qEj0fifpnuzJYhfMWU8RXfcPezwCsDHddm6k4RBNibMtxs9op6/jrECuaKfTT7I4J02a
         DWqthWpQA1u4SpXUGpD/ARFbHmTN/j7AK58oQckLu9w9Ycnj6T2O4VkVaafp+p2SScMc
         WsXJRsp6sEDpaAINKRX1NDCnBCGIm01gBQ1xVJyq3qgmK32pgr9T/8p8m/YW18HlF/OH
         68FoBzYyObu5o0DLZts2/ZKRP5tuaHzZvf5kFlBwS152PpNiWb3HNvan9mwU/WNnDxnS
         FZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFm2TzWcNGWz8FKUUitzejc0u2aQwxYFeFHIlHq40P4=;
        b=eUx/Ra97c0jPV2kkEw1qZmM3RnlZaV4EWP4Gr28DwTkKa7JPO6zWmRve/Q5AOOQqQl
         NF1BCIAZXSniSjON4iKFDNL6KaBBMVmN1ZmlIg7B5AZ8tItC56dqQbhHQb9UhD2Uoo5k
         Q1XjbhschQeXLgRxedIFGloxW6XmPlviWlU33OM9PPlw7aVw/uO2lshcYspVRI71Dg/S
         y5pUC0A9SIKq1OeySIto12knQymECsRdJtnfVhlGqSEw/hUxUPJDbcjpDluU5UWsjjRh
         uIs3zT3UcEB92ZZX5PbikiIgLXstdAb/y0/0h7h1V+BgG7KrWi+pp/RghOrsK01tQbjc
         CnCw==
X-Gm-Message-State: AO0yUKXSpG5Y7XalpaeBGnSKu/xu13H+UhR2dzaCt4wK2mPb0n6jfFpQ
	gcM+MlJwRZRLu6KC7XpT8vU9W99vOTtcKxpSPdw=
X-Google-Smtp-Source: AK7set83a9EuQm3FIhZUxGYQNpN+Xliw3SPos9E5nhOpkX42RfqIIRGvaj5zAtDXQpR0Z7Rfgn5MBA==
X-Received: by 2002:ac2:4ad9:0:b0:4db:268a:4ec5 with SMTP id m25-20020ac24ad9000000b004db268a4ec5mr2962768lfp.52.1677080037078;
        Wed, 22 Feb 2023 07:33:57 -0800 (PST)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH v7 03/20] tools: add Arm FF-A mediator
Date: Wed, 22 Feb 2023 16:33:00 +0100
Message-Id: <ede0da127fe74526e6b401e6b44d1407fe28cb70.1677079672.git.jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677079671.git.jens.wiklander@linaro.org>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a new "ffa" value to the Enumeration "tee_type" to indicate if a
guest is trusted to use FF-A.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 tools/libs/light/libxl_arm.c     | 3 +++
 tools/libs/light/libxl_types.idl | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

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
index 0cfad8508dbd..64fb570bc19a 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -494,7 +494,8 @@ libxl_gic_version = Enumeration("gic_version", [
 
 libxl_tee_type = Enumeration("tee_type", [
     (0, "none"),
-    (1, "optee")
+    (1, "optee"),
+    (2, "ffa")
     ], init_val = "LIBXL_TEE_TYPE_NONE")
 
 libxl_rdm_reserve = Struct("rdm_reserve", [
-- 
2.34.1


