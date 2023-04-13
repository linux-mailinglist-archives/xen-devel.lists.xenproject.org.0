Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 341E16E0786
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 09:16:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520467.808110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBQ-0003It-St; Thu, 13 Apr 2023 07:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520467.808110; Thu, 13 Apr 2023 07:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBQ-0003A1-K2; Thu, 13 Apr 2023 07:15:52 +0000
Received: by outflank-mailman (input) for mailman id 520467;
 Thu, 13 Apr 2023 07:15:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmrBO-0001gr-LB
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 07:15:50 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 043dabf0-d9cb-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 09:15:49 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id u12so154018lfu.5
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 00:15:49 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 n12-20020ac2490c000000b004dc83d04840sm181354lfi.79.2023.04.13.00.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 00:15:48 -0700 (PDT)
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
X-Inumbo-ID: 043dabf0-d9cb-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681370148; x=1683962148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7kR9rwQGILBw8tLRM1a/b6iPghICXgNju4KgQlDbBQ=;
        b=XkCTd+94xqCLh7P6D6XNMY/dneEGpJmdtidCJu6cK4qLOm4YDvaAwSa7WVeCDWKGPu
         +MTs6jMcap41uebOt1s38dHYurwDB3UZXB8eF6gKf/e2siAfgT4ZDWn/UtGMC0xe5PJQ
         xuMUF4UN9RMqnVfKg6aDM+G6bApMh3recCTS4qdHgkZHTIxfXrqP+NKFtksT31Nf5VNE
         GrwYr+1O+5mOSGReSqtMtlVDvBWBaR1XSgnll0v57TBFrf8/dOswCmSBg2xPz7ve6qGh
         VPlfcx7d35srxBkV8RxFmjn2cNCxW5OxnI+jLGQnjJ3PHyxIfJSX7Wt06JWr1V5PKK6S
         DSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370148; x=1683962148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7kR9rwQGILBw8tLRM1a/b6iPghICXgNju4KgQlDbBQ=;
        b=Tzv7InO/UqQw2Ra0ERmLzhf37TmEEN+etsiUJ7Vw1fejOTGMlfXsjOJz6uo1JTEpdV
         ED6d5R+tPMC5qWd/bCCSCWBC416NXaRYr66ndazMrfcwh6sQtsnF4W+Mp6PCE1860KdY
         CVKDYRn14us36YIsFuVXjU+YNGUfp5AkpqZR1fUZkmctXFRoEhKs6Mh0qW5P2YyJEtwJ
         50itJ8odkS+z4iuOmRPl72VptJcK0QgO2gKkg9H+hQgFHL7yAdDzuSRv5JCljz3sfop/
         Y92IYX9Q5kflUDHRg+rBgYTD2swAUFU0dlqRZcg5zW5Ux8Q8516rQsumgN+jJfoYSI5R
         CR8w==
X-Gm-Message-State: AAQBX9dcH2MEuyCvr2TFtOp97fE1sHO4ZltHIDK3huyKv4lpdtfkPuBo
	e85axPV2mrEvY8hdU91OvQShAfrqoAx9/g+XvEs=
X-Google-Smtp-Source: AKy350Z7CY4MuGRuwwnHSScNY/LH434Frkw+9N7zWTQ1lAI4TZU2KZM8qPHQmQHr3wLFJgimUoc4bQ==
X-Received: by 2002:ac2:5dcd:0:b0:4ec:9df9:f11a with SMTP id x13-20020ac25dcd000000b004ec9df9f11amr690577lfq.9.1681370148638;
        Thu, 13 Apr 2023 00:15:48 -0700 (PDT)
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
Subject: [XEN PATCH v8 07/22] xen/arm: ffa: enforce dependency on 4k pages
Date: Thu, 13 Apr 2023 09:14:09 +0200
Message-Id: <20230413071424.3273490-8-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413071424.3273490-1-jens.wiklander@linaro.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a BUILD_BUG_ON() to assert the dependency on 4k pages in the FF-A
mediator since the current implementation only works if Xen page size is
the same as the FFA page size.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index cf7b7545aa03..90ed71cbfda3 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -57,6 +57,16 @@
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
 /*
  * Flags and field values used for the MSG_SEND_DIRECT_REQ/RESP:
  * BIT(31): Framework or partition message
@@ -256,6 +266,17 @@ static bool ffa_probe(void)
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


