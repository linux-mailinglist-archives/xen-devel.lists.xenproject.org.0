Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCEF69F805
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 16:34:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499545.770783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr8A-0002pF-Ud; Wed, 22 Feb 2023 15:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499545.770783; Wed, 22 Feb 2023 15:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr8A-0002c4-6E; Wed, 22 Feb 2023 15:34:06 +0000
Received: by outflank-mailman (input) for mailman id 499545;
 Wed, 22 Feb 2023 15:34:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvgA=6S=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pUr87-0001MH-B7
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 15:34:03 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5461d2c2-b2c6-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 16:34:00 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id bp25so10676489lfb.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 07:34:01 -0800 (PST)
Received: from localhost.localdomain (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q9-20020ac25289000000b004db0d26adb4sm927746lfm.182.2023.02.22.07.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:34:00 -0800 (PST)
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
X-Inumbo-ID: 5461d2c2-b2c6-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6KguU5fKyIYZ3B6fRSfTmGKEYTHZutvCnKPhrDpB1io=;
        b=YQ7QaUw2xSr0uhygfwAIAPTnrqAX0QSAeZ638gQy98K6yT9B0ioUdpuyfD/GEtFt34
         E/q0d6XP2L3ipHWJwhkjyR7Sfq08lY5CYYj9oLtjj86uVPLOe6wmrFCCUiSmNwMc8d4w
         bLdQmsYNKgnSuQ1e2GmC2kCPGuLo9KM5IPf/rJ7iNEpy2L7nacLcUPXj4a32DtpSjmqx
         Ww4Slve+itnWYK3BK8k3cBJhIngJrnUd7FigQzG6zTc6HCeeMRsM8JI3VSUi4p6fVZNs
         XkNR0Fw0hv1Y4AXvWq+xFYJtG8ujcRIr8RDF9i1z2cgHl81oZColGEa8Nq8oA6Mvj7FI
         3ItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6KguU5fKyIYZ3B6fRSfTmGKEYTHZutvCnKPhrDpB1io=;
        b=GS+WVJftdXyfPCPi+XgF5RV0EKWljbVdcTnBM2G3QRRXPRDgsnHNxiso/YGmG9YQuy
         0kcdC91wKKXCLXS51eK0fqOChWdinjZvNnAfqe++VPLbu+0aO9nvgCnGrIEenuA0wn6E
         qiyA3jDOiYJaIvTeuxjFo3lQ/EL7bvP8mg0FkER72xyeLMrWhCFDEhrOgcKt3Cd6ei18
         O+v8kbwOtVF67SNXBUXn4dhWF+Rz+S7UsD5Ibuk07TcHAsEnR5X9gAPR53Eu1ItdyMfs
         QcQxtka34HrCCq/tRobBUSSE+auiNodU/5vF0GOPmG0mm2xlWjFXaU5CskU9LyDgpOgt
         Jyxw==
X-Gm-Message-State: AO0yUKXG2DmIMr0I2QmmJx6AGsf1/RSUTjaJmqUQdYB1ojKSBcKvF30W
	Ytc1WoOO9wk07qG3KGFgwWFd2Wsaq0scD04Dvwk=
X-Google-Smtp-Source: AK7set/xYReyFarccwfkMjZIxvACnhtNCeZqDqdQl+pSNBAcE7+gyQOEvXc3nFfTscS6Ntnj2sDjTw==
X-Received: by 2002:ac2:43b3:0:b0:4dc:4b05:485c with SMTP id t19-20020ac243b3000000b004dc4b05485cmr2784611lfl.50.1677080041130;
        Wed, 22 Feb 2023 07:34:01 -0800 (PST)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH v7 08/20] xen/arm: ffa: note dependency on 4k pages
Date: Wed, 22 Feb 2023 16:33:05 +0100
Message-Id: <6c0ef5d2174bfa8c25aeb94395160ab9d863b63a.1677079672.git.jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677079671.git.jens.wiklander@linaro.org>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a BUILD_BUG_ON() to assert the dependency on 4k pages in the FF-A
mediator.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index d04bac9cc47f..8b0b80ce1ff5 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -56,6 +56,16 @@
 #define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
                                                  FFA_MY_VERSION_MINOR)
 
+/*
+ * The FF-A specification explicitly works with 4K pages as a measure of
+ * memory size, for example, FFA_RXTX_MAP takes one parameter "RX/TX page
+ * count" which is the number of contiguous 4K pages allocated. Xen may use
+ * a different page size depending on the configuration to avoid confusion
+ * with PAGE_SIZE use a special define when it's a page size as in the FF-A
+ * specification.
+ */
+#define FFA_PAGE_SIZE                   SZ_4K
+
 /* Framework direct request/response */
 #define FFA_MSG_FLAG_FRAMEWORK          BIT(31, U)
 #define FFA_MSG_TYPE_MASK               0xFFU;
@@ -242,6 +252,17 @@ static bool ffa_probe(void)
     unsigned int major_vers;
     unsigned int minor_vers;
 
+    /*
+     * FF-A often works in units of 4K pages and currently it's assumed
+     * that we can map memory using that granularity. See also the comment
+     * above the FFA_PAGE_SIZE define.
+     *
+     * It is possible to support a PAGE_SIZE larger than 4K in Xen, but
+     * until that is fully handled in this code make sure that we only use
+     * 4K page sizes.
+     */
+    BUILD_BUG_ON(PAGE_SIZE != FFA_PAGE_SIZE);
+
     /*
      * psci_init_smccc() updates this value with what's reported by EL-3
      * or secure world.
-- 
2.34.1


