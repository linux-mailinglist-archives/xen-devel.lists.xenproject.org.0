Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE53B7480FA
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 11:35:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558887.873413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyv0-0006xz-Qt; Wed, 05 Jul 2023 09:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558887.873413; Wed, 05 Jul 2023 09:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyv0-0006qn-IJ; Wed, 05 Jul 2023 09:35:26 +0000
Received: by outflank-mailman (input) for mailman id 558887;
 Wed, 05 Jul 2023 09:35:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hy0b=CX=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qGyuy-0006bq-VN
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 09:35:24 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43dcee0b-1b17-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 11:35:23 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f9fdb0ef35so10482796e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 02:35:23 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q22-20020a2e84d6000000b002b6d8cfb6d2sm2910625ljh.140.2023.07.05.02.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:35:22 -0700 (PDT)
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
X-Inumbo-ID: 43dcee0b-1b17-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688549722; x=1691141722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wSiWqYej8EPgULt6otzEwmKVlaIAponcAwfHuOJ0rA=;
        b=r35PHpmueX5C+pIp9nZqViEJktUKqKWBtarwFHhL2i/AgPHEvBdFC8KyHwyTlDrcou
         AssVt2fcoTsmlb4xWImJkUl55hUSUufnAX4NLjvrWqBrY+IZDWwOXKdv+DGCWZPEDjaz
         hsMz/TzFYAvkPLFRRk7yhOC708tUCZXG11u6GQLX2IXRyM7rZ1dyphwMJkFRlUW21yIQ
         xSp6pVbY9HYqwrGd/6pwordftglJ8zOMB2PJPGxW5kX7Eq6/i1DfLUip4OpsOZ33XLC5
         ii2IyefzvcBuiOkjGEsdiKXBbjgZVapiVwSll0CPkiYY21moDwhwF+5zd8IrY3lEmJq8
         HB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688549722; x=1691141722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4wSiWqYej8EPgULt6otzEwmKVlaIAponcAwfHuOJ0rA=;
        b=fq//tjTb/zbxQU8oFBeXsq0cr1A1/nUrWJU1YYZkjBi6xfSU9UabOU7An6habjIhTi
         OAyjnwMd07z/wh779DiU8fAPSlitqlSmqgYaVi+1Z57XcUWFHlcz7zlyE48tSxJgOhhO
         VyypjYbzqzMyV+h8OKcBzDgm3rW3EInY8OL9e8XvmxCbjk/5+mqEtK8yRdyuJMXJAOq7
         SrmVYjBZ0ZwnAI/1/2gq1fBwmzOMHa0hLBvqw6tu5+sUBMOy3G6DLY0PZZJHZ83oO90n
         Dgttg5z5ZdS33fSRezPV3491wkbzxOrXxqC9iiUtt9zxVVoc02kxumO/Xn24TBbzS7Xt
         SR7Q==
X-Gm-Message-State: ABy/qLbhNa2eu/XaTiK8Mu0N9hGATf4H8QR4Vk2boOANpTqnwlYl57t+
	CQbm18qJssWeOPI2xZ9VyU30t8BQmIc6MmisjCI=
X-Google-Smtp-Source: APBJJlGqOGGKofqtcuqgQggNsgp6inqP9Q8bZx6Tf0C0P7PTqa8fNrFX6V4UqNchZuYg84fwbvJ70w==
X-Received: by 2002:a2e:860e:0:b0:2b6:e2e4:7d9a with SMTP id a14-20020a2e860e000000b002b6e2e47d9amr7134910lji.38.1688549722702;
        Wed, 05 Jul 2023 02:35:22 -0700 (PDT)
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
Subject: [XEN PATCH v9 06/24] xen/arm: ffa: add flags for FFA_PARTITION_INFO_GET
Date: Wed,  5 Jul 2023 11:34:15 +0200
Message-Id: <20230705093433.2514898-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705093433.2514898-1-jens.wiklander@linaro.org>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to DEN0077A version 1.1 REL0, section 13.8, defines
flags used for the function FFA_PARTITION_INFO_GET.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---
 xen/arch/arm/tee/ffa.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 2296e3115beb..c1dead73d1f2 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -57,6 +57,40 @@
 #define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
                                                  FFA_MY_VERSION_MINOR)
 
+/*
+ * Flags to determine partition properties in FFA_PARTITION_INFO_GET return
+ * message:
+ * BIT(0): Supports receipt of direct requests
+ * BIT(1): Can send direct requests
+ * BIT(2): Can send and receive indirect messages
+ * BIT(3): Supports receipt of notifications
+ * BIT(4-5): Partition ID is a PE endpoint ID
+ * BIT(6): Partition must be informed about each VM that is created by
+ *         the Hypervisor
+ * BIT(7): Partition must be informed about each VM that is destroyed by
+ *         the Hypervisor
+ * BIT(8): Partition runs in the AArch64 execution state else AArch32
+ *         execution state
+ */
+#define FFA_PART_PROP_DIRECT_REQ_RECV   BIT(0, U)
+#define FFA_PART_PROP_DIRECT_REQ_SEND   BIT(1, U)
+#define FFA_PART_PROP_INDIRECT_MSGS     BIT(2, U)
+#define FFA_PART_PROP_RECV_NOTIF        BIT(3, U)
+#define FFA_PART_PROP_IS_TYPE_MASK      (3U << 4)
+#define FFA_PART_PROP_IS_PE_ID          (0U << 4)
+#define FFA_PART_PROP_IS_SEPID_INDEP    (1U << 4)
+#define FFA_PART_PROP_IS_SEPID_DEP      (2U << 4)
+#define FFA_PART_PROP_IS_AUX_ID         (3U << 4)
+#define FFA_PART_PROP_NOTIF_CREATED     BIT(6, U)
+#define FFA_PART_PROP_NOTIF_DESTROYED   BIT(7, U)
+#define FFA_PART_PROP_AARCH64_STATE     BIT(8, U)
+
+/*
+ * Flag used as parameter to FFA_PARTITION_INFO_GET to return partition
+ * count only.
+ */
+#define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)
+
 /* Function IDs */
 #define FFA_ERROR                       0x84000060U
 #define FFA_SUCCESS_32                  0x84000061U
-- 
2.34.1


