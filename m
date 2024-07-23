Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B0393A893
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 23:12:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763556.1173823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWMnn-0006UK-Ip; Tue, 23 Jul 2024 21:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763556.1173823; Tue, 23 Jul 2024 21:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWMnn-0006RM-Fg; Tue, 23 Jul 2024 21:12:07 +0000
Received: by outflank-mailman (input) for mailman id 763556;
 Tue, 23 Jul 2024 21:12:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=402b=OX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sWMnm-0006RB-JC
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 21:12:06 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36da5d50-4938-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 23:12:06 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-36858357bb7so3231920f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 14:12:06 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a51433f904sm5356288a12.40.2024.07.23.14.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 14:12:04 -0700 (PDT)
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
X-Inumbo-ID: 36da5d50-4938-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721769125; x=1722373925; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=btpvZboGsLwOpKF/5lt+tdA3Pt6IQ8gkszvKXediNd8=;
        b=Q1Snr4EVQYBOND8r05mqmrm4NJI/fdPwtwl7EcblnCfH8lIAzk5HJEw3hgAar1bdbZ
         TJDPY4iRR1aMBQYOIZcBn9ORt469rJggYqqfh3SF4scqC1bRSLJ3jXCe82XPOgkWyPoh
         OPLkZBvqyBYNmSU6fEaNN82uD7JW/mRJqe3g0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721769125; x=1722373925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btpvZboGsLwOpKF/5lt+tdA3Pt6IQ8gkszvKXediNd8=;
        b=bRdYjRVPRb8iJkm3icmu5xZ8sdCm1sSQqahvAqAXSXFMLJDzW/DHLpIfW/SpoTxQbx
         5ZTksP+/M9oF3jBIN2XtT8TuuCRRHY2E2HLv35a1byZi1qhf5JM0KwKDP8EN7iw+yyzR
         GC6wMZt+5FKHFULfXLd2VrjkJQg8JDFWkO/dDJQA9Qutxi/sr/ONNGs6OhO7IaQ3wUdx
         2Ep7OSOJPTfOyVlexBAinpbrRVa0i+MYbWMBvKf0RJbDLCwSyhl0UvHycFiuwSukke8u
         aouoLEWqp1oyoCgfZkNb0bTJZPuMf8/f7KTZ4uMsWdRSHCAjP+zBSGIXyoI0PMrXniTq
         fgcQ==
X-Gm-Message-State: AOJu0YwqjJV4WWyWATVtMFrzK8VmmIokJpEh83RkyrndI1y9IK6tfTxy
	NlYrufSsw5qm+uM3fLbl4arwad1a+Z3ojeByuDK6jKQqXGjq7vmn6Bxb1WIi4JCe9FoeIZE4gna
	w
X-Google-Smtp-Source: AGHT+IHyY0LOfOJD0q0Cpf390a3nNinv7xY1GeSoywotAhHCtyX+5nzzf3NSUH21u8p0sH3PZs70MQ==
X-Received: by 2002:a5d:64cc:0:b0:368:31c7:19dd with SMTP id ffacd0b85a97d-369f5b162bcmr101306f8f.5.1721769124964;
        Tue, 23 Jul 2024 14:12:04 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/APIC: Rewrite apic_isr_read() to match apic_{tmr,irr}_read()
Date: Tue, 23 Jul 2024 22:12:02 +0100
Message-Id: <20240723211202.267212-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This allows for marginally better code generation including the use of BT
rather than SHR/TEST.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/apic.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
index 1133954e5540..22d949d7bf31 100644
--- a/xen/arch/x86/include/asm/apic.h
+++ b/xen/arch/x86/include/asm/apic.h
@@ -126,10 +126,9 @@ static inline void apic_icr_write(u32 low, u32 dest)
     }
 }
 
-static inline bool apic_isr_read(uint8_t vector)
+static inline bool apic_isr_read(unsigned int vector)
 {
-    return (apic_read(APIC_ISR + ((vector & ~0x1f) >> 1)) >>
-            (vector & 0x1f)) & 1;
+    return apic_read(APIC_ISR + (vector / 32 * 0x10)) & (1U << (vector % 32));
 }
 
 static inline bool apic_tmr_read(unsigned int vector)
-- 
2.39.2


