Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3803C69F801
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 16:34:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499543.770758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr88-0002MP-LV; Wed, 22 Feb 2023 15:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499543.770758; Wed, 22 Feb 2023 15:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr88-0002En-8u; Wed, 22 Feb 2023 15:34:04 +0000
Received: by outflank-mailman (input) for mailman id 499543;
 Wed, 22 Feb 2023 15:34:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvgA=6S=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pUr85-0001MC-6h
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 15:34:01 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5466f783-b2c6-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 16:34:00 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id m6so10601696lfq.5
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 07:34:00 -0800 (PST)
Received: from localhost.localdomain (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q9-20020ac25289000000b004db0d26adb4sm927746lfm.182.2023.02.22.07.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:34:00 -0800 (PST)
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
X-Inumbo-ID: 5466f783-b2c6-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=daCXmezi75zgDEVaU54najSvdry1ZvL/v784GcKBNIM=;
        b=r8/bfWS5zxacR3bGf35cbhZHARGEdjT5DmuvT3lTG7ZqVQpv8gjMCyEsMth1VaAQ9/
         2FikkF1y4tF41RUHKkqLyZt8DBE1K4FEABM6GXx07QoGTw5heKZwFgojECn2LHaZBxEy
         5GlWAOOlphjbZ+r+mkbVaHlJCwLDWlzZiXaGkESTk2kuPgiYXRYShC6y/wXXO5ARQF2L
         5Pkz6V/C4RmjPB+3zwEUpaimm0UBwUaJju7dtVvmNN0/epxtkF3gTdVYa5AuTFH6fKbM
         ZPOVDl4Vedq8I7CvapjlQprNWfY3x3WqQQIpAbuvgNQwlwUSrcfc5R6S8b6bSJNoafZr
         dXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=daCXmezi75zgDEVaU54najSvdry1ZvL/v784GcKBNIM=;
        b=SmyspjUt14CUVenSviS4kfNFIASHc/KN8Rpb+/Cs2HiJn7ng+emJSuRAJO9lOLkIla
         3eg2R/6mPTwOqatlZyWo0m2mtrar1OZlkb4Hf/DXrPceKGcNx4g9hNsxOtoHttuhbiba
         F/xJ+MZfBWxyr45sOQZBevu4VyUT1CB55XsC3wERJQ4QgdYjrwN3lSDmXVRlasXuj31K
         L6pJuGvRt6vPxMFTT+xBhH3dpRoAa/I5JUWcy5FxJvLBf55w14B5Nb0S9Os0E+lTIlGP
         A0iektnR7QKsQVnmjKg7NFz++qhhinX2ItT/13KMl0D6Hblma+DhYhjSnLFQYrelQrZX
         0WuA==
X-Gm-Message-State: AO0yUKVSfN5W3voHoo1G80p4BnU+jOCm9lbZo3lzf8mRQFOqWLAnVxj4
	lD9J8Di7blqp1Q+GJn6HR9sVWRsGmGI8vJ1N+8o=
X-Google-Smtp-Source: AK7set93muUJIEST07jzhhKMCkgsqD+Eb2DfvRNAehJS1K297RREfCeyvjA9vIOjRgr5rCQkNWg07g==
X-Received: by 2002:ac2:5a05:0:b0:4b5:8f03:a2bc with SMTP id q5-20020ac25a05000000b004b58f03a2bcmr3022146lfn.9.1677080040361;
        Wed, 22 Feb 2023 07:34:00 -0800 (PST)
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
Subject: [XEN PATCH v7 07/20] xen/arm: ffa: add defines for framework direct request/response messages
Date: Wed, 22 Feb 2023 16:33:04 +0100
Message-Id: <904055064f4b4e4514acf1e64751672eca045c05.1677079672.git.jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677079671.git.jens.wiklander@linaro.org>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds defines for framework direct request/response messages.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/tee/ffa.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index f4562ed2defc..d04bac9cc47f 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -56,6 +56,15 @@
 #define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
                                                  FFA_MY_VERSION_MINOR)
 
+/* Framework direct request/response */
+#define FFA_MSG_FLAG_FRAMEWORK          BIT(31, U)
+#define FFA_MSG_TYPE_MASK               0xFFU;
+#define FFA_MSG_PSCI                    0x0U
+#define FFA_MSG_SEND_VM_CREATED         0x4U
+#define FFA_MSG_RESP_VM_CREATED         0x5U
+#define FFA_MSG_SEND_VM_DESTROYED       0x6U
+#define FFA_MSG_RESP_VM_DESTROYED       0x7U
+
 /*
  * Flags used for the FFA_PARTITION_INFO_GET return message:
  * BIT(0): Supports receipt of direct requests
-- 
2.34.1


