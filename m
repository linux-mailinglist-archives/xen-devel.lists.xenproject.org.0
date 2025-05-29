Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A98AC82D6
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 21:41:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000139.1380530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKj7T-0005Yd-DG; Thu, 29 May 2025 19:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000139.1380530; Thu, 29 May 2025 19:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKj7T-0005WB-An; Thu, 29 May 2025 19:40:51 +0000
Received: by outflank-mailman (input) for mailman id 1000139;
 Thu, 29 May 2025 19:40:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GswX=YN=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uKj7R-0005W5-Vg
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 19:40:49 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d147ba59-3cc4-11f0-b894-0df219b8e170;
 Thu, 29 May 2025 21:40:47 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-30effbfaf4aso12998161fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 May 2025 12:40:47 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553378a1398sm433047e87.98.2025.05.29.12.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 12:40:45 -0700 (PDT)
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
X-Inumbo-ID: d147ba59-3cc4-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748547646; x=1749152446; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rpKd/J42XS/n8Ajsm4bUqkcbcsL2h/dueOBmKWGHbwE=;
        b=SWD7xHGDDcudKxZI3iOGEVCx945Z/xu6Bew6rCnZYYwxLNmdd5Hu/dIamyPua6x73u
         quKM80cfbSiyDkCg/fN6Hm990QgAVZJyMADi7SA0EPDdogfBq4TXs/qpeWwAw0V+SgOH
         4sbX8nPRz2Cz/wPCRTFg8jeZ/gkDFmf8m3rVcYLHj6xJNVm+9RQ2du01CdlVH145qFcW
         VxOTYdu7K+TxHLt5Tb9kqz4VHdh3420a0oZ9m2OkYrXXVgtvJFNqgUkmif0wtIsvuIS/
         628hDina6ZrCVc1BJh0us8DiQVFVGVWrTy/gNc5nrYVCMD98oDELRAZ0CghQBvCpzAob
         i3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748547646; x=1749152446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpKd/J42XS/n8Ajsm4bUqkcbcsL2h/dueOBmKWGHbwE=;
        b=qMUlT7QA248XEPBKub8ujFVqSoPg7ueLPUR7KWHX3ILrQ1H3ikBctuXwLbjEUsnYWe
         6k8snW2RBJNk5T2z3wQoPRD8+jEET8F1I+qcljk3seyI5U6Y/AKu64tTdiEQAGLGVdTT
         dOoltOnvnih2B5O6guGQ28C2mzeGHbPH+QsM/AtqUOyYMlvpGDZrnFAPTcR0ArAXLv4y
         l3i3pZVW2KY/2eyO6DhlepEF6ThY0KPMGeZ8EgtuPa7K/7Tr12PeHxhAj8B50d/BF81u
         wTTTOEVF/Guv1AKzRKE7J/H7xddoz26K8/Hb5N4PrtgwCF85JZMLkysc/M7K5q+b1nR/
         Wxuw==
X-Gm-Message-State: AOJu0YykYV3fZgWs2BpLjzhkKRqb7YFTDRvDNodB3YFA9xrTVGb4mvpg
	S8V30oPwp0g1KQfWY4rhp6JZlsrCLHUgmsMOvJwrvM9G3JCkb79lKDu++bdxkHKN
X-Gm-Gg: ASbGncst82uCnEwNKWcWKNnaCweJVnoRGIvZY/CokQu5e1OJfm8zDVKDU3VYZqrt7fc
	kWvsezcKxCB2ja+trqlKryC4D6GPc1jsqWm9hINEvlfciHb1uZ/mnhxPEKfBgRwnKVbLHmd3zOl
	pJjwq62m4FmV2+ad23To3Ih+FQQUpY54oK6pHIystta+qxmweD8yZKgbLBOnKLj/mJ4oPiOSbRZ
	tms5b3NgfV7nXXojHHV8nP/IADsixrW4wo8KoJMVMv/qERkiZCRjBk/CvkGlckUiLeSQVu1gDBu
	MZ5+jS6fwbu8VwseG6xIniYFH4XrgxwN7PWRuSNnSlqPknyeyGh4qw6IDw945vHIcLfSNDiPwB0
	O1jOF1Vi0hm6lCCGtT8gaA0a7dA==
X-Google-Smtp-Source: AGHT+IEAECnoaJVS2jk6rYeKh4G20H5DMO/k5s88BJYeCj5x0g6xbdS1jOMgrqDXTC8ZxtrC2y2CRA==
X-Received: by 2002:a05:6512:6d1:b0:553:263d:ab90 with SMTP id 2adb3069b0e04-5533b8f3ebamr267163e87.18.1748547646196;
        Thu, 29 May 2025 12:40:46 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: vpsci: Fix typo in comment (SCCC changed to SSSC)
Date: Thu, 29 May 2025 22:40:25 +0300
Message-ID: <3881310bb93e20fd7d28d067e11ec9d19b68c60c.1748547428.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Corrected a typo in a comment within vpsci.c:
  replaced "SCCC_SMCCC_*_REVISION" with the correct "SSSC_SMCCC_*_REVISION".

This change improves clarity but does not affect functionality.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/vpsci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index d1615be8a6..7ba9ccd94b 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -268,7 +268,7 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
 {
     /*
      * /!\ VPSCI_NR_FUNCS (in asm/vpsci.h) should be updated when
-     * adding/removing a function. SCCC_SMCCC_*_REVISION should be
+     * adding/removing a function. SSSC_SMCCC_*_REVISION should be
      * updated once per release.
      */
     switch ( fid )
-- 
2.48.1


