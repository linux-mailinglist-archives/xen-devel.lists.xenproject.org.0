Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA6C77DED1
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:32:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584524.915457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDpO-0001U6-Rt; Wed, 16 Aug 2023 10:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584524.915457; Wed, 16 Aug 2023 10:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDpO-0001SI-ML; Wed, 16 Aug 2023 10:32:38 +0000
Received: by outflank-mailman (input) for mailman id 584524;
 Wed, 16 Aug 2023 10:32:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDe2-0003R9-J2
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:54 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 941e491d-3c1e-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 12:20:52 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fea0640d7aso23331595e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:52 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:51 -0700 (PDT)
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
X-Inumbo-ID: 941e491d-3c1e-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181252; x=1692786052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlljDGp2nh4y5C8UpAHlSWUpyUARLNFYBgRU10ZUwnY=;
        b=B/MFHTQ5OALu/4Yq8NWmj5Xt0L8GZt2TC32CyImb97PJyB6Jr9+Q44gzS2b/76MW8t
         0EdxenwpuuFYqjBilybQP9a8A8ZdELUFPixuI9idiCUhbzAAhpq+bjS2/eIS7QDABBF8
         nyUpXOV4tJoP2Ir0cc/VyOzhr+Ya2S7c3n1z3Tjz2V8a1FnflZgnHn+venjxIrOROxn2
         gy00LPr9J8A4EWlD6lNWvbDz1e0S3mB5hJZX9LalqOpFnApWDR4EGJyj/1e7fSKP1Jxb
         g9d6O9G6frKKPgRwbm2JZ9dLFWv/srTJ7DF2+tKjDXquQ0BLHj2ZOQSYmfLwzB5vaqyH
         WcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181252; x=1692786052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlljDGp2nh4y5C8UpAHlSWUpyUARLNFYBgRU10ZUwnY=;
        b=b1d0dZ9wi8hpu/V1JZJQqbFhS9SxaqXtLQbVLRglwVWGyBBDDieIWv57ht+tHwj1c0
         ZIVUa1UopN2HCFEjlRm/ruxVKf+ihUJI2oNRGBgn4dfnAPad7GTtDvLoGAaMO7+JrBA8
         Wlx9gSKUTEj3nT1ODgNPJoA3kGO/6DQkBkWOTT5OtFh9QJgFuDawkw/tq58pmx4BjJn7
         fSsMsR46FwKRg4/q2/BGYDh5WHGv1PNGTE96V40+h70/vOz+bMzGNcT9Uurb75Y4yBfq
         LHRSwrqRUbLfZhwrB0ZqdKGT19OZp/i2/9Qwyn0evEOTuESBvt1ySv17ZHtu0V66L/v/
         ZR8A==
X-Gm-Message-State: AOJu0YzDTGT+N/fdPFvo/GXI1WQXHJ6nClAkxYwoze1QI3NhWQx4xQdC
	hLQ4mu+9IzZnSoTnPeCtyIau/ha3dz5KNJPQ
X-Google-Smtp-Source: AGHT+IFl9XxbenCxJDhQSULrwEfLZdnXiEEdpia3zWB8FaT7qYaROfqssC9pZ21DaM4MImDgAZA0KQ==
X-Received: by 2002:adf:e5cb:0:b0:317:5b1b:1a40 with SMTP id a11-20020adfe5cb000000b003175b1b1a40mr1177086wrn.49.1692181252006;
        Wed, 16 Aug 2023 03:20:52 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 45/57] xen/riscv: add definition of __read_mostly
Date: Wed, 16 Aug 2023 13:19:58 +0300
Message-ID: <e11462a0dd6e71884aa114493d75674411e26701.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/cache.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/riscv/include/asm/cache.h b/xen/arch/riscv/include/asm/cache.h
index 69573eb051..94bd94db53 100644
--- a/xen/arch/riscv/include/asm/cache.h
+++ b/xen/arch/riscv/include/asm/cache.h
@@ -3,4 +3,6 @@
 #ifndef _ASM_RISCV_CACHE_H
 #define _ASM_RISCV_CACHE_H
 
+#define __read_mostly __section(".data.read_mostly")
+
 #endif /* _ASM_RISCV_CACHE_H */
-- 
2.41.0


