Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C497480F8
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 11:35:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558889.873427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyv1-0007H5-Oc; Wed, 05 Jul 2023 09:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558889.873427; Wed, 05 Jul 2023 09:35:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyv1-00079y-ID; Wed, 05 Jul 2023 09:35:27 +0000
Received: by outflank-mailman (input) for mailman id 558889;
 Wed, 05 Jul 2023 09:35:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hy0b=CX=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qGyv0-0006bq-1E
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 09:35:26 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4544a2c6-1b17-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 11:35:25 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b6ef64342aso37113401fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 02:35:25 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q22-20020a2e84d6000000b002b6d8cfb6d2sm2910625ljh.140.2023.07.05.02.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:35:24 -0700 (PDT)
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
X-Inumbo-ID: 4544a2c6-1b17-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688549725; x=1691141725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuV8RapENruJ9yIpnO0p4qSE4ssdvVfnP6i34l3RXw0=;
        b=Rnpt5EUPE7G9VmG1WJ9myyfK62kUeDWU2Vb0eOVWtZy7XRGFsPUzyLZMWY4UlT1TNG
         +FfboeWU7NqJXuboGxrfAWeS/LqhH9ElxSA6t8GE/gYBjL8u6+WGK+hpBPzq/d1/++4y
         /jx5IPwq+ABREzb4uqJ3F1bihd+xaEtiOMq7l/NI7OnMghcFPH/NbpQhiUVmH+tBm2dL
         kT2oHqnMiWs2IVlpWpbMTQSGRE1L+sL10UMYlQa09n7YGzo9zNOb0ePHgUF/OOAgMUeJ
         jgcoD7vkSkuyVJPn8ndAGnOrf2sU0wrXXhHZnDB9l9BjczuTAG5evWnpjZlncKiIV6M+
         AJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688549725; x=1691141725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuV8RapENruJ9yIpnO0p4qSE4ssdvVfnP6i34l3RXw0=;
        b=MnRJbcbsxofbyFxhgtkTi2keBTPzJlyrOrdginXqV35cwazqUJBWRiQA7P00lG/DkI
         uzspx8yLWpR3E8LO+Siux81BuqjEJyQIQlRlsxCwvLJJT5xJQJQpuBaxfyyRB+/p8ybz
         gXW3RmPAyitXapLxxoQRaEMF1m9QB7fpNLKaPuHuC+Noe+NQ9gdYwIWIZJPAE8ZNk9p4
         GIiJmbEzOn0si6gGBxSiFMNfFS9pRbwtiwlZpcvDLEVzkhZdoI1y1pQr2ushGHroDL+D
         TuFRkhxKIpiBqOuyZAavtxvanQL/TCKsQhKIXr4yyiCRuYMe3cOGSBT455JetOmLQKox
         /vKQ==
X-Gm-Message-State: ABy/qLZix9BAUpda8GGURMSBhEwa/YfAcX3OhbPZDxJ0wft/kFHTex8J
	DENCyjv+AucHR+uRFQXPgvxLIEACgYHzwe8vGXk=
X-Google-Smtp-Source: APBJJlEyQ1nAz45G88ONDZMf7naLt9F5A+CYbW+n20mlO7bNWFVpw/GB4ieBlNRKLv4M4/XRSSXylg==
X-Received: by 2002:a2e:9657:0:b0:2b6:faaa:fb53 with SMTP id z23-20020a2e9657000000b002b6faaafb53mr2604114ljh.26.1688549724911;
        Wed, 05 Jul 2023 02:35:24 -0700 (PDT)
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
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [XEN PATCH v9 08/24] xen/arm: ffa: enforce dependency on 4k pages
Date: Wed,  5 Jul 2023 11:34:17 +0200
Message-Id: <20230705093433.2514898-9-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705093433.2514898-1-jens.wiklander@linaro.org>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a BUILD_BUG_ON() to assert the dependency on 4k pages in the FF-A
mediator since the current implementation only works if Xen page size is
the same as the FFA page size.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---
 xen/arch/arm/tee/ffa.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 56a0a10c1e99..f0a2715d4bbf 100644
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
@@ -261,6 +271,17 @@ static bool ffa_probe(void)
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


