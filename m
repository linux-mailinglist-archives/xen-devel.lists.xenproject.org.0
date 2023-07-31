Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4BE7695E3
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 14:16:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572972.897247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRoe-0007MS-5Q; Mon, 31 Jul 2023 12:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572972.897247; Mon, 31 Jul 2023 12:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQRod-0007Gp-LB; Mon, 31 Jul 2023 12:15:59 +0000
Received: by outflank-mailman (input) for mailman id 572972;
 Mon, 31 Jul 2023 12:15:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VuP2=DR=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qQRob-0003r6-TN
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 12:15:57 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00673a30-2f9c-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 14:15:56 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fe3c7f16bbso619289e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 05:15:56 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac2430a000000b004fbb1bc1ae0sm2028077lfh.163.2023.07.31.05.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 05:15:54 -0700 (PDT)
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
X-Inumbo-ID: 00673a30-2f9c-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690805755; x=1691410555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKqs7nnqnAqZUU+7Ywvxf/RqUSRtJt12JR8UMGzNweA=;
        b=ols1N8y4SdzG4xgNYq24Bjwkmi274DQHDrIhNrjG1U+kWelPknIJwF/LRU++vdHMQc
         Mf3jRxWxi8+zWEyak04fmZSAKClZkrHLj+F+cqR4FZX7U3+wXw/+zOX4GAL+A56uElFD
         T0i44b11AsVDGIVZz4UrtaZeAxZdi3ppfHAKpD3QTCw7rlQsv/unOTUo2hB3SwE9xLvK
         3NtyOa+zzvyzkpjIrw74flofN2Io+gRAEpHQ520WAXXU7PCrrpAAWQoKluD325Gt92iD
         KzxVmzVFoPHY9MCU150TrN5CBsCyxbM5sVBjKUAwKL3cwTiofCm2JVd7s1vGswqEj2uv
         vXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805755; x=1691410555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKqs7nnqnAqZUU+7Ywvxf/RqUSRtJt12JR8UMGzNweA=;
        b=K71iDFUvGeOWgEt5FVAQZY+6fYr+O7lH28rYyLVzPDQaesRF7YCYLpuNb/fXW5nqNW
         V+qq2ErzokynwDPGigZucP/a0puJxnnu17X8V4lKUmRv3CXgbotpa3OWmMgf4nyT8E3N
         VRIMkSMjsLRqU3sixgM/ZL5tihsYrACCBjiT8wAqmo/Kdmqx2PMhwInfdHf2lcrdqTcY
         umUQHu3FKW5v/pxflfzr7RIenvZrAswc0l1B5ucIK0EdKv4aH5r3P6jBePWrI+dv48/t
         tm3MwxfDlR6pEL5KdK18rG30BRibBSIdWpLmXJbRfRKEn/NvJ/y0Da7jo1aiZfL2VKZi
         DaMw==
X-Gm-Message-State: ABy/qLZiOk6qFnVLhWTt3Vu6hrSH+oLRzuooc8pXHxRiDe3g4bjuKNDN
	ZvOKgut7OEo5gg6cVee8lJevR9wwbVIr477s3yQ=
X-Google-Smtp-Source: APBJJlFQ8wjatPqFLCOvaNWX8BW9Midq9eZVdN6JmRM/NJRvRDq/8s8JyDoMNFvfobeeWdiIjm7BGw==
X-Received: by 2002:a05:6512:3da0:b0:4f4:c6ab:f119 with SMTP id k32-20020a0565123da000b004f4c6abf119mr6902072lfv.64.1690805755586;
        Mon, 31 Jul 2023 05:15:55 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [XEN PATCH v11 12/14] xen/arm: ffa: list current limitations
Date: Mon, 31 Jul 2023 14:15:34 +0200
Message-Id: <20230731121536.934239-13-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731121536.934239-1-jens.wiklander@linaro.org>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds comments with a list of unsupported FF-A interfaces and limitations
in the implemented FF-A interfaces.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---
v10->v11
- No changes
---
 xen/arch/arm/tee/ffa.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index eb4a58fec470..cfbabec81dd2 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -13,6 +13,37 @@
  *                https://developer.arm.com/documentation/den0077/e
  * TEEC-1.0C: TEE Client API Specification version 1.0c available at
  *            https://globalplatform.org/specs-library/tee-client-api-specification/
+ *
+ * Notes on the the current implementation.
+ *
+ * Unsupported FF-A interfaces:
+ * o FFA_MSG_POLL and FFA_MSG_SEND - deprecated in FF-A-1.1-REL0
+ * o FFA_MEM_RETRIEVE_* - Used when sharing memory from an SP to a VM
+ * o FFA_MEM_DONATE_* and FFA_MEM_LEND_* - Used when tranferring ownership
+ *   or access of a memory region
+ * o FFA_MSG_SEND2 and FFA_MSG_WAIT - Used for indirect messaging
+ * o FFA_MSG_YIELD
+ * o FFA_INTERRUPT - Used to report preemption
+ * o FFA_RUN
+ *
+ * Limitations in the implemented FF-A interfaces:
+ * o FFA_RXTX_MAP_*:
+ *   - Maps only one 4k page as RX and TX buffers
+ *   - Doesn't support forwarding this call on behalf of an endpoint
+ * o FFA_MEM_SHARE_*: only supports sharing
+ *   - from a VM to an SP
+ *   - with one borrower
+ *   - with the memory transaction descriptor in the RX/TX buffer
+ *   - normal memory
+ *   - at most 512 kB large memory regions
+ *   - at most 32 shared memory regions per guest
+ * o FFA_MSG_SEND_DIRECT_REQ:
+ *   - only supported from a VM to an SP
+ *
+ * There are some large locked sections with ffa_tx_buffer_lock and
+ * ffa_rx_buffer_lock. Especially the ffa_tx_buffer_lock spinlock used
+ * around share_shm() is a very large locked section which can let one VM
+ * affect another VM.
  */
 
 #include <xen/bitops.h>
-- 
2.34.1


