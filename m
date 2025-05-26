Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0DEAC3BF9
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 10:49:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997325.1378219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJTVG-0004y7-R4; Mon, 26 May 2025 08:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997325.1378219; Mon, 26 May 2025 08:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJTVG-0004wU-OD; Mon, 26 May 2025 08:48:14 +0000
Received: by outflank-mailman (input) for mailman id 997325;
 Mon, 26 May 2025 08:48:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uXNe=YK=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uJTVG-0004wO-1Y
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 08:48:14 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26ba3354-3a0e-11f0-b893-0df219b8e170;
 Mon, 26 May 2025 10:48:10 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-55324587a53so350691e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 May 2025 01:48:10 -0700 (PDT)
Received: from EPUAKYIW02F7.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55221dd8ebbsm681271e87.152.2025.05.26.01.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 01:48:08 -0700 (PDT)
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
X-Inumbo-ID: 26ba3354-3a0e-11f0-b893-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748249289; x=1748854089; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eYXbSvTNBknTdvjpQDxcbW9o3Gr73MB+dKdmFiZcULI=;
        b=dS3ZdhWsYlfxyuXOvS/zFftG6q1LvErBVvghHvaiMlVrzHFDtDEAIkmSfXThmn0KlZ
         vXTdKgsva5psN0A8e849NwRJUPhJTC4czx/nPix3oxavgibr0aDPRHak+KKWlHiUoRdK
         NrZx2bWFBCfi5a6iZXfl8kKFdyo6a9esPRSi62m4uAkj9nyY1IcBx6/fCIowKB6W4jJg
         3RbG3Qh4Jd2N7Qx0DetXu59cWtKNXM/CsXGMBhNb6kyxLB5ToeQkYcrv6n2jGRl9eMT1
         2DvV7l0u78HPlHkVh177B7D4gSQ6mtKn/LMvbwJ31wlMMli+sWTE1Qp3KWZOqj+1DT3w
         +Zdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748249289; x=1748854089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eYXbSvTNBknTdvjpQDxcbW9o3Gr73MB+dKdmFiZcULI=;
        b=kz80G7n9V/7uQN9YNcl03SipVNQ7YkplF50YIqJpBvA0huehf79NLb8+TRNwFoAaxK
         nKh/tIz9586WqORr92l+yWk1aBHgq9qWoN3YtTndXz586XkLaFfCwljwVNQpu/OF8OAl
         SaPBFj8yPaH+Madil4Mlnb6q5YOsTecpJqEua5QQ9O6UoUAHRj+2uGkBTqTusK7AzME2
         F0sl/4/va119JKFEax0voFr+sK8MAB0eom7lIAQND2+HuN2c0u6RCRlIZYhbLkV/V6a4
         KmA4igVWovEcIhXJZgAuXudEa9eHZDXrSbxRPTYgUTWANu0baz/BGwYKp0PVadYBwNLd
         wB+w==
X-Gm-Message-State: AOJu0YzYd+Dcbe4WK0S7gTey4GGnveBCTRN087pOodXr2NTVBSLkqGXo
	GI0kh7ljNIFI/nFqqWEzIYQJ5l48ubwIkxoMMMENtrPZd3lwv5sVoCMp1/7SXQ==
X-Gm-Gg: ASbGnctimLOAP79/VTA9Xe3hRRpWoBBVU7oWTkPKf8Z/SqDyehDvWVLWEaBSEZ1dR1y
	fqbL8WBHJifojSegexcvkcnGa+sMSkgPlGNaP8X8kIZFd+4XVTUwSUVG7r31v2s8boKRjvZ1enC
	5LaQizylFPXmhJExveKkqayc8hF+/GyGqLM0GX7vsrxW3l/y2eU+luAT+lssXgay/LYIvxdLWLU
	WVpACWDcx67777iNP3rypcxtifxtuHhY5G9MSAXDEPzUi+hTwr6XQJugbrq9t8BASaSzjKxpVm8
	2PATDjRy+ya6PvAzEk9n0u+lq9VV54JWx8lpe00s7lhHexiPL2Ih4qXjjK5j0+wFeKr5omyWRyI
	vv0mMZ4b9GKHLSgFjyAR/nw==
X-Google-Smtp-Source: AGHT+IGCt+/TQ61WJm5BeFSGB5Vw6KM7c3QUZUp9y1wyt7jjl6pew9S26jW+kvqpPDJ1tgtTh1GqAQ==
X-Received: by 2002:a05:6512:3da7:b0:550:e7fc:352 with SMTP id 2adb3069b0e04-552156e7b1dmr3614987e87.25.1748249289199;
        Mon, 26 May 2025 01:48:09 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH v2] arm/irq: Reduce size of irq_desc array to exclude local IRQs
Date: Mon, 26 May 2025 11:46:59 +0300
Message-ID: <3563c1fa071f8f3a65f168f5a50ebe3d982dd75b.1748248867.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SGI and PPI descriptors are banked and stored in the per-CPU local_irq_desc
array, so not all elements of the global irq_desc array are used. This is
already accounted for in the descriptor lookup logic inside __irq_to_desc:
    return &irq_desc[irq - NR_LOCAL_IRQS];

Therefore, the size of the irq_desc array can be reduced by NR_LOCAL_IRQS,
saving (NR_LOCAL_IRQS * L1_CACHE_BYTES) bytes of memory.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in V2: added the RB tag.
---
 xen/arch/arm/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index b9757d7ad3..03fbb90c6c 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -45,7 +45,7 @@ void irq_end_none(struct irq_desc *irq)
     gic_hw_ops->gic_host_irq_type->end(irq);
 }
 
-static irq_desc_t irq_desc[NR_IRQS];
+static irq_desc_t irq_desc[NR_IRQS - NR_LOCAL_IRQS];
 static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
 
 struct irq_desc *__irq_to_desc(unsigned int irq)
-- 
2.43.0


