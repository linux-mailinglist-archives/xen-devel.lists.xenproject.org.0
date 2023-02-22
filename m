Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0D869F800
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 16:34:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499541.770743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr87-0001zi-9G; Wed, 22 Feb 2023 15:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499541.770743; Wed, 22 Feb 2023 15:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr86-0001nu-R2; Wed, 22 Feb 2023 15:34:02 +0000
Received: by outflank-mailman (input) for mailman id 499541;
 Wed, 22 Feb 2023 15:34:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvgA=6S=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pUr84-0001MC-6N
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 15:34:00 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5368d821-b2c6-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 16:33:59 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id k14so9541428lfj.7
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 07:33:59 -0800 (PST)
Received: from localhost.localdomain (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q9-20020ac25289000000b004db0d26adb4sm927746lfm.182.2023.02.22.07.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:33:58 -0800 (PST)
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
X-Inumbo-ID: 5368d821-b2c6-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KI1veJQCzcrc4867Mx0BfEZYRjuokQrrKibNDvguIjM=;
        b=b9ez+PWmP+J9IWGA/jmj+YSV97dCG8tsXUG6IOwBaO5H6cJ/qSpfYTAeagM9q8rBcx
         ybA9pfqW/XGjTmxj3MckoVjI4diyDvI0KJpi/udWoV8OMCLPWC17UwAt6hQfHqTqB7hA
         yXcaEBquUsyPSJ4F59x8YSDyAkcFXqkYRgFNjAjnL/HRkGMlsUO3TIumNXkb+tXhkjTO
         OlLvZo/sQWK9dj20yMPPvv/n8eQnpIAKYZnsWNjyh5UWrp6OatcUxVErrot0NtzETC1Q
         /dg0qdr4mQHAoVk6/x3GtLkhK0RiciNZyKLF2YmUgarE6dpWqdP3CxJBjwmhQriEEWE2
         DgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KI1veJQCzcrc4867Mx0BfEZYRjuokQrrKibNDvguIjM=;
        b=3PDda9sz6rIx3l+JGIqryRwoFHtCqW07hs3LiJz/DgA6R3IL6gGftWOx4/rZt4BLuH
         Jje/gWFZDk1a5w4US0Ch3S+V+FAu8SqZabJZoxO/IlsNAUSrK2vR1iH4c7cdOuj5Uhzc
         4Z4TLJk6X7Wrgmu3eMc+iFmPB1O4UrPHrl3y2tkagobYWxkQ3fM7Qvlthk0W3bYb/HVv
         KRo4A/LLuu023Zgtd8VDDdhx+cfwKZMyn2pz19TVuae3ZcVcyZY+oT/fD+VMxhRTTtDi
         lF80eOCEbeizTTFfmiYL8ZwrAkXkVgEUdYr+ShXp6Q3dGDpzpsW+eBmZyWOgaL56yUZo
         YVEA==
X-Gm-Message-State: AO0yUKUaBALXt1B7z9civ0g0OnGmCeWacf9hWUeP4/mR+mJXgYYf5s8P
	j6Dzd5OgFW0tpixfJETOBf2jMJSfjmA1RL2PmHM=
X-Google-Smtp-Source: AK7set8mGAbfiuOZUZFXo+60NODykwSWgKjBA3+5AeEojv6aoHvq/0M/OGv8C5ap23Is/KGNmJDyEg==
X-Received: by 2002:a19:ac4d:0:b0:4dc:8409:b214 with SMTP id r13-20020a19ac4d000000b004dc8409b214mr3389448lfc.21.1677080038697;
        Wed, 22 Feb 2023 07:33:58 -0800 (PST)
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
Subject: [XEN PATCH v7 05/20] xen/arm: ffa: add remaining SMC function IDs
Date: Wed, 22 Feb 2023 16:33:02 +0100
Message-Id: <aed4b3a97e7ab2db85fc53fd157de82e0a1be8cb.1677079672.git.jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677079671.git.jens.wiklander@linaro.org>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds the remaining SMC function IDs from FF-A 1.1 specification.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 824153c9303a..aa6cdbe0a4f9 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -59,7 +59,41 @@
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
+#define FFA_MSG_RUN                     0x8400006DU
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
     uint32_t guest_vers;
-- 
2.34.1


