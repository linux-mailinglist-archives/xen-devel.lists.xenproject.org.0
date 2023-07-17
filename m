Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 689D4755CAE
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564179.881517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIY0-0006z6-1D; Mon, 17 Jul 2023 07:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564179.881517; Mon, 17 Jul 2023 07:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIXz-0006uM-Rn; Mon, 17 Jul 2023 07:21:31 +0000
Received: by outflank-mailman (input) for mailman id 564179;
 Mon, 17 Jul 2023 07:21:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xV9D=DD=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qLIXx-0005A3-8H
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:21:29 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c049270-2472-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 09:21:28 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fbf09a9139so6406620e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 00:21:28 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004f846cd74bcsm2658938lfp.245.2023.07.17.00.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 00:21:27 -0700 (PDT)
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
X-Inumbo-ID: 8c049270-2472-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578488; x=1692170488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYcDkH+NYTJEg4WTYuKdvOgpJpdPrLrE00Jo/az+PMc=;
        b=qeEQVTU/uIhG8giLV5/dRxCZSgeeq27GxFS1BpEHcNfafLbkqtZw2O6dbThI/1u5WC
         xHvUYXV0OOfO5n/+j/S+JHu6jOatAEp65GcNRyuMrOiVxnGQu1t8vh5Q+JYyqd33UmQH
         gD/vwXQuAE4g0o5omSj3feSh4rO3U6fn6P0ivkkmIXBRJuwQGmvP/fqjR32zPmDqE65R
         VTVU/44a2FritFQR4J/8IbJCyeINhM1GBftaLYAIZXxN5BkNlwONsYpq8VzFWVJ86eWY
         E2CSq1BNnNkCdG8mX/eIrhURo1OXak79JVSMsj0IW1hHcus/wt2jZoohyuiaDS3joSo6
         7gfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578488; x=1692170488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYcDkH+NYTJEg4WTYuKdvOgpJpdPrLrE00Jo/az+PMc=;
        b=QnZQhvwWr+wUeRHqorR1W5owq/8sHGBETMv1wNwuG3ffGx3QwGmdiwLPQcOwJrMX0W
         DHhTJvanuUt1C6q+GGSlqixpG9lWoDCyiLBOIt0894woZnbn7jkOwNr7+jP4mUzkZu5T
         z4MIHfyywuZqLNrXreEhCIv/lafEj4SjRfqLRYI/tcRP74iYtVjqdEeFaIFoDZ/lQZ5s
         1h92ryymmeO/GoHamc18twPbbn88+t0QScrJQ5TWrg1zyxtt7CkSLTrskPTlQBcqk8CM
         8VNH3Wb2gRbtLK1NitlNYZZEv+70OwELCyRFL+jKvlu2mXLteRB8CYNRezKmPb9wl/cR
         8PAQ==
X-Gm-Message-State: ABy/qLYskJUO7lQQcC7IIHSc6alHdaHtAGAQt4O59G4oUSp7BqlS3Phu
	N1WsWOVqtoSF7mYP4fwTZSMBKfoByvcoRzv8wxQ=
X-Google-Smtp-Source: APBJJlFH+UTCquq5aztcb0YP7Hsbl7pIWV1DEcjUzXSobzinHuk8hvDcwyb7CKsP9C3Gndp2YEx/jQ==
X-Received: by 2002:a05:6512:3d89:b0:4fd:c23b:959d with SMTP id k9-20020a0565123d8900b004fdc23b959dmr749729lfv.34.1689578488247;
        Mon, 17 Jul 2023 00:21:28 -0700 (PDT)
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
Subject: [XEN PATCH v10 07/24] xen/arm: ffa: add defines for framework direct request/response messages
Date: Mon, 17 Jul 2023 09:20:50 +0200
Message-Id: <20230717072107.753304-8-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717072107.753304-1-jens.wiklander@linaro.org>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
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


