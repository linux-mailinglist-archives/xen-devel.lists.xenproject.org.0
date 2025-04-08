Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D638DA7F344
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 05:43:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941351.1340860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1zrA-0000dg-Cl; Tue, 08 Apr 2025 03:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941351.1340860; Tue, 08 Apr 2025 03:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1zrA-0000cD-9e; Tue, 08 Apr 2025 03:42:36 +0000
Received: by outflank-mailman (input) for mailman id 941351;
 Tue, 08 Apr 2025 03:42:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w6y1=W2=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1u1zr9-0000c7-5n
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 03:42:35 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 817dd42e-142b-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 05:42:33 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ac2dfdf3c38so188146766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 20:42:33 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f088085e3esm7333800a12.58.2025.04.07.20.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 20:42:31 -0700 (PDT)
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
X-Inumbo-ID: 817dd42e-142b-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744083752; x=1744688552; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TZvEWhHuJSEbLztqXreeKR9oWiRimT/W3RHZpT0C4Lg=;
        b=huNRr39noUIoDXddUHOjMsALtw8Yi3j+1oPTJKsgz6+YxnV5vgMebKPXQ2OAE/GF3S
         gFFQKpq3Aj1vQiirjvcYd8QpSMdGFDw4VSijezUJ6sotmDM0OlAZDRZcFZg3A/dw37pw
         4PpLVkJIvNHX9yi/tIU5MgzuQlcGpwDLpIpRBDRJ0ppJvXZWL9hC9vGFt3wK9dMMd/ta
         r46qtgxPe2afnD4+Kd/YLvGJR8wWPoe0854B36NlGMl6rAw4jwalOTpwtJHfPohnEyrm
         MYT9DXIgb7V09qCU4L9wk9I43sx9xJD0swDFZmcuPWy2JAqOpGlaXw9y2q6QltcXHjrb
         LXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744083752; x=1744688552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZvEWhHuJSEbLztqXreeKR9oWiRimT/W3RHZpT0C4Lg=;
        b=tAjxCp/VvZBXCNEjLGMla1gXJM3tsfzgZ5ktEhUpYoe5s7LbsPs7e6cEYfdCzQMgJ9
         FvEADp/Q4sKuP86fzw9by/eOhy4rT2RsgijkVFPenUvRElO3vVuayYXXddS+eDd1CUdl
         9AOvh+bYtObyuUad3TGzRIjN7lM14KcvwJYdPViajoHWrVPFXcF7i+VH5Qm1r0XF3Fu4
         QH01pmB8wkedeQXkl6c9u44G2ZPC0g2Svmw/bf7y7sqaD2PpE7kmU77RjnIZciwDPkgW
         3j5DxBmLdm15bF5ThwAXezuGPFIFqlej/ZGkVTGpwoNa3u+ZOFH+d9T00rQFD6qUz2Is
         dhAw==
X-Gm-Message-State: AOJu0YxlRb+uWBpQkiWpz5juG3up+mdfAUP3gIa+J5MMpQvdej8xq7GM
	sFSbaSWumETLf/hxVZTbpFZ135KyogXMLeHvJNgqpKE8iE8Cw7xUHOpDHg==
X-Gm-Gg: ASbGncu3v1xv9EEe2XiKeqllR4KdA5+rhRrkVcW61CAQuViSBAJLVboTtg5rKI+XgWq
	iAfYwdOXNwltgtYKvT7BY8cL4GRliio44Cbg3vtkckf1+YleKzuDuvtqCKnF6aahzmizFGq5y7e
	M+Xm5TmDc8/tsXanVzwP8UNZDfAF+A40LOo8tGw0l/HiA3DXQhM4cuLkWqzo+gNubTnNdCY0sf+
	htyNZ5l9hHdDoSRzAA9iLfV1nHUx63W/MQbQP0d8KfQnZquV5RLIJ1SrB2i9nwbniMZmMDOCCDZ
	impk/B6s90AqmuUINT9ZQuciqaH1Ko3PXg/ag/6ozdI27XNWKwZTiX77UYFjFCDWHgIXOLQTyrS
	uUJ2a4h2c
X-Google-Smtp-Source: AGHT+IF2fOvz80fE9n/Yh80u3wzai1N4km1pccrYaqNrXzgd79H8lSYcisPpz7zdtXsPwaBkkri2Cg==
X-Received: by 2002:a17:906:c145:b0:ac6:b243:e480 with SMTP id a640c23a62f3a-ac7d1bcf86emr1097527966b.42.1744083752414;
        Mon, 07 Apr 2025 20:42:32 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm/irq: Reduce size of irq_desc array to exclude local IRQs
Date: Tue,  8 Apr 2025 06:42:19 +0300
Message-ID: <eafaff031771902c44c101736de7e1b690cc8303.1744083392.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

SGI and PPI descriptors are banked and stored in the per-CPU local_irq_desc
array, so not all elements of the global irq_desc array are used. This is
already accounted for in the descriptor lookup logic inside __irq_to_desc:
    return &irq_desc[irq - NR_LOCAL_IRQS];

Therefore, the size of the irq_desc array can be reduced by NR_LOCAL_IRQS,
saving (NR_LOCAL_IRQS * L1_CACHE_BYTES) bytes of memory.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
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


