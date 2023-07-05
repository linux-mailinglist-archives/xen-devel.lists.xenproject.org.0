Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 168FE7480FB
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 11:35:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558888.873418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyv1-000795-7f; Wed, 05 Jul 2023 09:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558888.873418; Wed, 05 Jul 2023 09:35:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyv1-00070r-20; Wed, 05 Jul 2023 09:35:27 +0000
Received: by outflank-mailman (input) for mailman id 558888;
 Wed, 05 Jul 2023 09:35:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hy0b=CX=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qGyuz-0005bC-UC
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 09:35:25 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 448c732a-1b17-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 11:35:24 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b701e1ca63so1940111fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 02:35:24 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q22-20020a2e84d6000000b002b6d8cfb6d2sm2910625ljh.140.2023.07.05.02.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:35:23 -0700 (PDT)
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
X-Inumbo-ID: 448c732a-1b17-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688549723; x=1691141723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYcDkH+NYTJEg4WTYuKdvOgpJpdPrLrE00Jo/az+PMc=;
        b=qdNF81NI4N83t2hYr2K2/bAjBK98JgWSuVIgkhQ6MKSDlmTk/7HEmdS8MIGirJKx8c
         RXrrV93GMmrpNQc55W4LUOULiPsp2SYRrH60pjdBJmYJkHBZz+klwRRUvA4XVsQsfsbQ
         IIzgsVG8LrjKp+R/Ke50nUVEMNr8OqykmbhMMZMPBoB6uIHZ93JBgi8jmkwcOu7t3bsL
         UQKhwKk886ChWnazba94QK1l3J8+GAjB5dk/8RMolLFRER/OFCpywr8XBSpmSV95gmBF
         JsvSjfFBJVKVfANMSTWGNuaR8gVZbd+Q6do1RcXAV1mqLwcnMHteq2fuZPNk70W4uePy
         wtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688549723; x=1691141723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYcDkH+NYTJEg4WTYuKdvOgpJpdPrLrE00Jo/az+PMc=;
        b=K6AjGh84POW/LDmoxnBJ+Qd6RGrdQQhm/4NyGW8ZdKYEPYbVvc0VjDSiML7YiCKhRO
         G/OUqea25QI38gGFuRtYqx2qsbL4e6oaJ67xxbHyhkMjo7c5FngsBFfqjESAKqe3FVus
         yGNfkmH8Dm25hql3zUvFizybSNN2ld7qMVgCZ33dLS8PLPqksf1Q4xOH7wBQrSx1smdR
         PwgTlCygQ7CU0vfeJSg2q92YHrNkWUg51ZNNr/N26rFAUTIpjnH21Ut6G+eGf2uf72kP
         HhLS7LT+FpiL1pcnr5arIEViweOxCNw9IUUrT/TDNblJ8P6o3YHqBob0JuqYml+JAGhL
         571A==
X-Gm-Message-State: ABy/qLY7Jj6MsS7oJ1yv3/dcC2w1BVPCtT4JmLeC9Lrv6gHWk9ngjYfQ
	A4vmi7BrKOsi9Q2iG0vSZdQ9/MedjG3NErtVKds=
X-Google-Smtp-Source: APBJJlGNmiJkwe/ZlBCen5VK7sAfo8dxwOkxD55c0uqBvg2uz6iWiUfGl7wn+2u6butwESe1L0ktwg==
X-Received: by 2002:a2e:9bd6:0:b0:2b5:95a8:4126 with SMTP id w22-20020a2e9bd6000000b002b595a84126mr10320701ljj.52.1688549723757;
        Wed, 05 Jul 2023 02:35:23 -0700 (PDT)
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
Subject: [XEN PATCH v9 07/24] xen/arm: ffa: add defines for framework direct request/response messages
Date: Wed,  5 Jul 2023 11:34:16 +0200
Message-Id: <20230705093433.2514898-8-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705093433.2514898-1-jens.wiklander@linaro.org>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to DEN0077A version 1.1 REL0, section 18.3, Table 18.{21, 25,
26, 27, 28}, add defines for framework direct request/response messages.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---
 xen/arch/arm/tee/ffa.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index c1dead73d1f2..56a0a10c1e99 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -57,6 +57,19 @@
 #define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
                                                  FFA_MY_VERSION_MINOR)
 
+/*
+ * Flags and field values used for the MSG_SEND_DIRECT_REQ/RESP:
+ * BIT(31): Framework or partition message
+ * BIT(7-0): Message type for frameworks messages
+ */
+#define FFA_MSG_FLAG_FRAMEWORK          BIT(31, U)
+#define FFA_MSG_TYPE_MASK               0xFFU;
+#define FFA_MSG_PSCI                    0x0U
+#define FFA_MSG_SEND_VM_CREATED         0x4U
+#define FFA_MSG_RESP_VM_CREATED         0x5U
+#define FFA_MSG_SEND_VM_DESTROYED       0x6U
+#define FFA_MSG_RESP_VM_DESTROYED       0x7U
+
 /*
  * Flags to determine partition properties in FFA_PARTITION_INFO_GET return
  * message:
-- 
2.34.1


