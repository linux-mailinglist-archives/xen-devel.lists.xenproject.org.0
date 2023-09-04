Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAB4791A32
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 16:59:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595291.928810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdB2k-0008L2-3z; Mon, 04 Sep 2023 14:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595291.928810; Mon, 04 Sep 2023 14:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdB2j-0008IY-W0; Mon, 04 Sep 2023 14:59:09 +0000
Received: by outflank-mailman (input) for mailman id 595291;
 Mon, 04 Sep 2023 14:59:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vW96=EU=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qdB2i-0008IS-OW
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 14:59:09 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 976d12fe-4b33-11ee-9b0d-b553b5be7939;
 Mon, 04 Sep 2023 16:59:05 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5007616b756so2628623e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Sep 2023 07:59:05 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 x17-20020ac25dd1000000b004f8555f7aa1sm1776516lfq.52.2023.09.04.07.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 07:59:03 -0700 (PDT)
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
X-Inumbo-ID: 976d12fe-4b33-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693839544; x=1694444344; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DETKmXdreaA56VxK1iMyBUC33tuEXPpiM3LXEY1tnSQ=;
        b=dfIw89eJJ++Oghgq/vpthtcAKE7NkDWOB1xUJl2RlmbflTtnaXgtdym8weVLtHAnFK
         QrNeMyffODObwCVrVXfELLA2h5r0KQOpHpcubd7SVybsCiJrpQjL2a8zNCD7A8vaxfQk
         pVu1bx9+SDcMCKYB4lj+RU/T0wG3w19ChjNSKrE5ns/RPH3h6JbSbTpLI6VaCzaxJLXE
         3mhpV+25xuQpUku4T242IQ27nRUNvQN/n0MpYkf3hyLyjwlldbGReqnwwuIvh7ZfDF8G
         ys1MgRX8EeqPgRoIn+jQGZwzJkyGiua3tCBlqa9vHSxUCYTvHppdiqG11BhrH6tnU0a8
         G2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693839544; x=1694444344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DETKmXdreaA56VxK1iMyBUC33tuEXPpiM3LXEY1tnSQ=;
        b=deHlLUTrnuqQPP0xlaQmAybdXXGEOL/hhphvqZ7+nV4i9YRykq3eqSDHyEkqv7XqNz
         GHGgXQczqLcSqKr5qpLA0UuC0iM0MvHprnkYBXGggM/4OcyQ6okKrPE7LN56TAsCBjO+
         IkZsV0Ac/Sii/SN0ErU7ztOGnFE13RhUizxSLI33j1PXCwBKodLYE6MUEUHIysjBof2M
         qWPSJyWX3wcYNJDnZdIsfB2Xum9PHm2oF2a62u93EpcFgARj7bVrmy0DJLzLzQe1eP+h
         mJ56AhnRnquke9BhADX7we09YFjZ6Xfk8vJWBew9whjjSeE0nnTRHET1ah4K5lQ7Tev0
         hm2Q==
X-Gm-Message-State: AOJu0Yxz6efxPyRlbnqEj/E1pLWSLDct6Q6E3h486sga3b0cWj/eDUQz
	DwOE89r820kH3FGmWtMyxp16CZdtSD/rdzijKhM=
X-Google-Smtp-Source: AGHT+IEhWv35Vh5ZFMbh4tfTmuPJLZjlMeJjdFcjsDT3Qgn/uXG/LGGWSyWfzJZIL4b9dht3XKAsnQ==
X-Received: by 2002:a05:6512:114d:b0:500:b5db:990c with SMTP id m13-20020a056512114d00b00500b5db990cmr9223219lfg.57.1693839544061;
        Mon, 04 Sep 2023 07:59:04 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] xen/arm: ffa: fix guest map RX/TX error code
Date: Mon,  4 Sep 2023 16:58:14 +0200
Message-Id: <20230904145814.2534808-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FFA_RXTX_MAP is currently limited to mapping only one 4k page for each
RX and TX buffer. If a guest tries to map more than one page, an error
is returned. Until this patch, we have been using FFA_RET_NOT_SUPPORTED.
However, that error code is reserved in the FF-A specification to report
that the function is not implemented. Of all the other defined error
codes, the least bad is FFA_RET_INVALID_PARAMETERS, so use that instead.

Fixes: 38d81e7ccb11 ("xen/arm: ffa: support mapping guest RX/TX buffers")
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 802b2dbb1d36..183528d13388 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -706,7 +706,7 @@ static uint32_t handle_rxtx_map(uint32_t fid, register_t tx_addr,
     {
         printk(XENLOG_ERR "ffa: RXTX_MAP: error: %u pages requested (limit %u)\n",
                page_count, FFA_MAX_RXTX_PAGE_COUNT);
-        return FFA_RET_NOT_SUPPORTED;
+        return FFA_RET_INVALID_PARAMETERS;
     }
 
     /* Already mapped */
-- 
2.34.1


