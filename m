Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6451F7480FF
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 11:35:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558885.873405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyv0-0006mm-43; Wed, 05 Jul 2023 09:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558885.873405; Wed, 05 Jul 2023 09:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyuz-0006ez-TC; Wed, 05 Jul 2023 09:35:25 +0000
Received: by outflank-mailman (input) for mailman id 558885;
 Wed, 05 Jul 2023 09:35:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hy0b=CX=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qGyux-0005bC-Ps
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 09:35:23 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43416c5a-1b17-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 11:35:22 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b6ff1ad155so5535491fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 02:35:22 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q22-20020a2e84d6000000b002b6d8cfb6d2sm2910625ljh.140.2023.07.05.02.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:35:21 -0700 (PDT)
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
X-Inumbo-ID: 43416c5a-1b17-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688549721; x=1691141721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqoldXxWy8H0mye06Jm+vbzYDtmZMz3z5RdS7rzJXrI=;
        b=yuMft45L04JztcnXQTMuUwXg3C+yuWG+iQk+uWUOKI7ixbPrY4+Q0OtD2WIC3VcOHm
         hzAen+5zXi4+pOrHM32vexT8/Yo6/9Td83Xw38T7vHQUvMJXFUGam/6QZp4dX/TtEzG6
         pl4QEO9mT6UawuiXag/RAULeGICoAF6GigS2113JMmLWmdlhO/B53XiOKlt0Ry1uOJrL
         Nr8D/q88n18lAg2YaDHjh2P5aNwoBsPyvgjCIkz5HJPzgj/whtdIOC4CwRL2lMoqaas6
         DNsvuP3izvZxL6BVQGgew9OTCYu9a6EArjs7ttEKqx/adWk7r7Zrxta0TaQTvX7j4k1T
         5BDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688549721; x=1691141721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqoldXxWy8H0mye06Jm+vbzYDtmZMz3z5RdS7rzJXrI=;
        b=evXomomsPq5z2RohGEpEbp4qT9uSDY7LdQBhZJMLWXm0eU6ri+009/6gJ6yzXa9bge
         5dyslFbjdrHDEQqepQRSzhTegbyOkS+maxplddUerupFkVV+b0LiZMy0hIILE55W8wjp
         +oOzWJzF+z1PPAbJMmLu4T9RdkNoEXE9gnHKOGaGMR29EX6D9CbWCRwlwyK1dilhz+Yr
         Qr+fL6teW1u/+4I25uuNqwYGW1wBGFOVadj4vf3VkdOXqt3Rwj3RPGGnBBXXxvlsWdpD
         hlTYUbcklLHZsO+V0BXxWy0UijIVBajkYkZTJRUJQjJ716PMp7RRS4YW7XmmFlSG0fXj
         IdbQ==
X-Gm-Message-State: ABy/qLZdcaIsvsE+KC16hx/pYxmFp3jBqhHOFnBXzH7keaJSd/HV5zzd
	PTF8jXIGTwqWFmT/Yd6ayWbrO33fBS8mGMYPnG0=
X-Google-Smtp-Source: APBJJlHXrPKLZ1T6BqR2/M0Cyskz25seyh+y7ryNtyh9dtB3tHMVIFKLFAy9H0tdDCA4prZi9cIcGw==
X-Received: by 2002:a05:651c:10ab:b0:2b6:9e1d:cd0f with SMTP id k11-20020a05651c10ab00b002b69e1dcd0fmr717756ljn.12.1688549721596;
        Wed, 05 Jul 2023 02:35:21 -0700 (PDT)
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
Subject: [XEN PATCH v9 05/24] xen/arm: ffa: add remaining SMC function IDs
Date: Wed,  5 Jul 2023 11:34:14 +0200
Message-Id: <20230705093433.2514898-6-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705093433.2514898-1-jens.wiklander@linaro.org>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
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


