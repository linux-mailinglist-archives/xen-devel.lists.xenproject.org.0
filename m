Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCC7755CAB
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564178.881503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIXy-0006Vo-Ia; Mon, 17 Jul 2023 07:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564178.881503; Mon, 17 Jul 2023 07:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIXy-0006Qg-AE; Mon, 17 Jul 2023 07:21:30 +0000
Received: by outflank-mailman (input) for mailman id 564178;
 Mon, 17 Jul 2023 07:21:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xV9D=DD=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qLIXw-0005A9-9x
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:21:28 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ab55b1a-2472-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 09:21:26 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso6448768e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 00:21:26 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004f846cd74bcsm2658938lfp.245.2023.07.17.00.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 00:21:25 -0700 (PDT)
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
X-Inumbo-ID: 8ab55b1a-2472-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578486; x=1692170486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqoldXxWy8H0mye06Jm+vbzYDtmZMz3z5RdS7rzJXrI=;
        b=k5s9hWg0UjMMBvk2rvqYEsCQ+9oVoo/BjP4XJxw9Qn74sKitjmiunmrrj84bOCM5oL
         JUO9qNu9Y0n1xrx8RoDajzyAIW37ENS0WNnlOq8Bd7Qcs/02Tu6Tf6dQBlW2/a+qs8CS
         36ZuvxaSe8ElAWll3npoltLAnrgRHw1mZH2hY4+3xcPjrfAvjpvwusio5Uh9wjJJhnC3
         isUwYLq/hFMXjE5NkUdYXJp9XMoVaTYyvvh6HbIZawOjtoDZt0i7yi+qiMkDF3HNbUdC
         HWNds8NH+JkohvFg3b2jdblQZ2b8Sr1hTlqiTK5Hj751ZnOoYoP/4V9BBr1rQFYJX0Z1
         6hXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578486; x=1692170486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqoldXxWy8H0mye06Jm+vbzYDtmZMz3z5RdS7rzJXrI=;
        b=WyzOU3kEaPWiepOpr+iGR10dc4Lgu+EE73Ik3cYvd1YncmpoOXBbMjFz4eLOy4ORt0
         YAQH7jT1UUnurT1Fp9f2K0Kb7v/2RkFVMGFPefCnJjLmm7+V+5T5enDx3S/r1RAr4L6N
         7fnXmH7cQFTuOwWLPJt3MM99XGgpZUYZcXUvw9Q1Gu1P5diGOQnYlNM9FNebB77/3HdO
         b9dsz9d16adv6bCez1AyVrYDGgSNEZTJ+JKucVFPViB1TGDX9Urm8CHWiWetuBEuY3eQ
         dZCg8V4rs9jMV8X+i+BUZdo+RPkUER5X4HPtP/eGxFqnR1LvbQd+6u2gAj+uI0wfdOGz
         0GiA==
X-Gm-Message-State: ABy/qLaT7xUlh58aof3HF3oPMecrd6JlKPl4OfhdhKccLQVzv7k67IIr
	oSYLZvwkfTCSsPADA0JBO90+vWOt2U2DXn/l1qM=
X-Google-Smtp-Source: APBJJlFsPVqb1ZKW99UCUnllvrT3Wz1ecmkenPUbmhg7YarNaX6cyia4T22tYLKgNzCZYPDh/tRMog==
X-Received: by 2002:ac2:4c0b:0:b0:4fb:73ba:5d9c with SMTP id t11-20020ac24c0b000000b004fb73ba5d9cmr6460037lfq.17.1689578485988;
        Mon, 17 Jul 2023 00:21:25 -0700 (PDT)
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
Subject: [XEN PATCH v10 05/24] xen/arm: ffa: add remaining SMC function IDs
Date: Mon, 17 Jul 2023 09:20:48 +0200
Message-Id: <20230717072107.753304-6-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717072107.753304-1-jens.wiklander@linaro.org>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds the remaining SMC function IDs from FF-A 1.1 specification,
DEN0077A version 1.1 REL0.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---
 xen/arch/arm/tee/ffa.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 927c4d33a380..2296e3115beb 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -60,7 +60,41 @@
 /* Function IDs */
 #define FFA_ERROR                       0x84000060U
 #define FFA_SUCCESS_32                  0x84000061U
+#define FFA_SUCCESS_64                  0xC4000061U
+#define FFA_INTERRUPT                   0x84000062U
 #define FFA_VERSION                     0x84000063U
+#define FFA_FEATURES                    0x84000064U
+#define FFA_RX_ACQUIRE                  0x84000084U
+#define FFA_RX_RELEASE                  0x84000065U
+#define FFA_RXTX_MAP_32                 0x84000066U
+#define FFA_RXTX_MAP_64                 0xC4000066U
+#define FFA_RXTX_UNMAP                  0x84000067U
+#define FFA_PARTITION_INFO_GET          0x84000068U
+#define FFA_ID_GET                      0x84000069U
+#define FFA_SPM_ID_GET                  0x84000085U
+#define FFA_MSG_WAIT                    0x8400006BU
+#define FFA_MSG_YIELD                   0x8400006CU
+#define FFA_RUN                         0x8400006DU
+#define FFA_MSG_SEND2                   0x84000086U
+#define FFA_MSG_SEND_DIRECT_REQ_32      0x8400006FU
+#define FFA_MSG_SEND_DIRECT_REQ_64      0xC400006FU
+#define FFA_MSG_SEND_DIRECT_RESP_32     0x84000070U
+#define FFA_MSG_SEND_DIRECT_RESP_64     0xC4000070U
+#define FFA_MEM_DONATE_32               0x84000071U
+#define FFA_MEM_DONATE_64               0xC4000071U
+#define FFA_MEM_LEND_32                 0x84000072U
+#define FFA_MEM_LEND_64                 0xC4000072U
+#define FFA_MEM_SHARE_32                0x84000073U
+#define FFA_MEM_SHARE_64                0xC4000073U
+#define FFA_MEM_RETRIEVE_REQ_32         0x84000074U
+#define FFA_MEM_RETRIEVE_REQ_64         0xC4000074U
+#define FFA_MEM_RETRIEVE_RESP           0x84000075U
+#define FFA_MEM_RELINQUISH              0x84000076U
+#define FFA_MEM_RECLAIM                 0x84000077U
+#define FFA_MEM_FRAG_RX                 0x8400007AU
+#define FFA_MEM_FRAG_TX                 0x8400007BU
+#define FFA_MSG_SEND                    0x8400006EU
+#define FFA_MSG_POLL                    0x8400006AU
 
 struct ffa_ctx {
     /* FF-A version used by the guest */
-- 
2.34.1


