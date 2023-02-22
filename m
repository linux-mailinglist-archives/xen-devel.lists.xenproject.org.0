Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AFC69F807
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 16:34:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499544.770770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr89-0002bo-VK; Wed, 22 Feb 2023 15:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499544.770770; Wed, 22 Feb 2023 15:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr89-0002QV-8v; Wed, 22 Feb 2023 15:34:05 +0000
Received: by outflank-mailman (input) for mailman id 499544;
 Wed, 22 Feb 2023 15:34:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvgA=6S=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pUr85-0001MH-Ns
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 15:34:01 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 536c2c77-b2c6-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 16:33:59 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id f18so10543953lfa.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 07:34:00 -0800 (PST)
Received: from localhost.localdomain (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q9-20020ac25289000000b004db0d26adb4sm927746lfm.182.2023.02.22.07.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:33:59 -0800 (PST)
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
X-Inumbo-ID: 536c2c77-b2c6-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oaAb7ukOE/W1jF7n380+WVov1wWGPwFJcHBGgA4I42A=;
        b=PsIcsB1eAGAv31fKhzszD8BPuis7RyhebinM1YoSHMcMlhsPv+l5LRETNGSJgaWiOE
         vfoFQQNo+Z592qPRDlV+kqKb+5E8EmzMz3+Txwwqg0txE7h9x6COb81lmSwWOTM0USuI
         pHUguVHJU/s/rLl+H9m4QFmRWR9TEydGMFyNVTxCBHM4EGex5yO6/bSbIrHATk9ZSLjA
         qFav1IYaJG30zWOgLqi6BNAjnWGFgjnakHyII6qasFKHHEkH0GU6jqXA1JLxjKAiu4Y/
         Kazw2LNaosSD0z8bJimwxf96wgDm1Iuo/ckhKILeffwCrxz6bWlTmpNZIeIax34OB5i6
         mwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oaAb7ukOE/W1jF7n380+WVov1wWGPwFJcHBGgA4I42A=;
        b=kqWLteWdKuPfHwK2AWvsT3rrjkxT0Tx0y1Hk1KQQ6gJmoxeMcpXJeWvX1i1WLPdk/P
         Mh9gkYhUSWN1JkpnFiHlbCJL/o1v+1kTEYyW913NasSuhMKtmzNoBl1ciqzOkaUo1WTr
         m33rM08EmdALegp3K7MPgNTHcYHPrDNs+Am/i19xiO8l21u/6pl1y0uAERMOv8kYsBHo
         1fc3mi4NstKd2XTc5RMhaEPcxOKQW+3pzqwSZOB9uQIIgW4kdZyk2n1t297Xos4jTHKP
         te8hgNT3UbEkiAEbsYx+kE6Ngk9cM4NTss7CmlVXycSLBwyGs+K165ouKdNi7Hc4BuoQ
         /gGA==
X-Gm-Message-State: AO0yUKWxFtO/tdT1c0Qhqwp0LDdZWI566P0bNoXGY8BfZ5CaVSlr/+yd
	PYKUfrZnbpxbHIMutPUSxKgJkvsZVYzTBTGK4oo=
X-Google-Smtp-Source: AK7set/BrU6GpxdvnsexBpdAumv70/Z+G4UeQ/FoCu2NxcHU8B/LeNDcv7Ablb5ZYe6LLtZazjYCTQ==
X-Received: by 2002:ac2:5ece:0:b0:4dd:9aec:e468 with SMTP id d14-20020ac25ece000000b004dd9aece468mr1184919lfq.58.1677080039581;
        Wed, 22 Feb 2023 07:33:59 -0800 (PST)
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
Subject: [XEN PATCH v7 06/20] xen/arm: ffa: add flags for FFA_PARTITION_INFO_GET
Date: Wed, 22 Feb 2023 16:33:03 +0100
Message-Id: <a3f70753dc853c2fb81efad72321ec00accf3f27.1677079672.git.jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677079671.git.jens.wiklander@linaro.org>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Defines flags used for the function FFA_PARTITION_INFO_GET.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index aa6cdbe0a4f9..f4562ed2defc 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -56,6 +56,32 @@
 #define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
                                                  FFA_MY_VERSION_MINOR)
 
+/*
+ * Flags used for the FFA_PARTITION_INFO_GET return message:
+ * BIT(0): Supports receipt of direct requests
+ * BIT(1): Can send direct requests
+ * BIT(2): Can send and receive indirect messages
+ * BIT(3): Supports receipt of notifications
+ * BIT(4-5): Partition ID is a PE endpoint ID
+ */
+#define FFA_PART_PROP_DIRECT_REQ_RECV   BIT(0, U)
+#define FFA_PART_PROP_DIRECT_REQ_SEND   BIT(1, U)
+#define FFA_PART_PROP_INDIRECT_MSGS     BIT(2, U)
+#define FFA_PART_PROP_RECV_NOTIF        BIT(3, U)
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


