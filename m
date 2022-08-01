Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A30AC5867C4
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 12:44:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378661.611977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIStM-0004FU-Ol; Mon, 01 Aug 2022 10:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378661.611977; Mon, 01 Aug 2022 10:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIStM-0004Cz-KL; Mon, 01 Aug 2022 10:43:20 +0000
Received: by outflank-mailman (input) for mailman id 378661;
 Mon, 01 Aug 2022 10:43:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g61G=YF=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oIStL-0004Ct-2D
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 10:43:19 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c09a8233-1186-11ed-924f-1f966e50362f;
 Mon, 01 Aug 2022 12:43:17 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id f5so6736808eje.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Aug 2022 03:43:17 -0700 (PDT)
Received: from uni.. ([2a02:587:ac0b:7a00:1b9e:a344:414e:dad7])
 by smtp.googlemail.com with ESMTPSA id
 j21-20020a170906431500b0072af56103casm5036433ejm.220.2022.08.01.03.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 03:43:16 -0700 (PDT)
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
X-Inumbo-ID: c09a8233-1186-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=/dkYNFC0YfSEOOKDpUvOdhBKET5LxRY1l4dx/MbLwNU=;
        b=PCZ0am525+SR3ImEhDWVNJUMdnuzZKRJaJj7vPJ8urFbtECfOFrg7nMQnfq9EqS0ZG
         pUnO3GTAro4AUosVWEXVfQNtLL1THk6lCosqk31knvZUEoi8AAPeaIggQMpXhaqVK74C
         1EY7if2Dj1SZgmK3tKMFgFC7gQDeJNh+pEEna6Ei1i+I6BiGFV13Sn2ope+jUwa41esi
         pQA8wyfJQfEDwvFk7dkdadq6a27E1mBk7egmM3iJYpkVuP5dOGsMoKM8C2mUP/qF0vHN
         dKJ2R5QfbQLbBKhShVd7RN/QXEr5m0SmDllfPSdeOtZm/SZ683y6MrUhvc1QLkcPb8GQ
         veGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=/dkYNFC0YfSEOOKDpUvOdhBKET5LxRY1l4dx/MbLwNU=;
        b=kDuT/vOTUq5SdGXqBYkDQpDA/ZOQjVXyegS77eQWzXaY03FZn+L1l2kwKqahIjrcMs
         NPvKNR6zUNRGzmVVDPN1tdfUkw5wcdGgYW63DgM7/330VLcD1oGfknvtgqsQYY+iJR/v
         FW/xzuoylvURpIbLcHUDLR6KU0n0dyxnUq1KWXm/VHtJdigqd2crgm/BYaRV9K/NO18R
         SXuVcGqpnl0jlCvR9o09A5QhEllosWe1zoDhjCyJwLLiX8hUzho8DSMzl36hQganW3Eq
         9vuYT4xlqd8b1CbCcybz9bosre13G2AeUJ7DB4JjyVoCRnwzMoe/4eiErQ26jUjD8a+6
         eFhw==
X-Gm-Message-State: AJIora9AdyhTh946DmDVcUaRqYoVdPUC0pRHwVyjhAXWu8FWalsuEu1w
	GsnufnR8VBjc1opTpCPaQFDaSoOpK6U=
X-Google-Smtp-Source: AGRyM1tJJPY3DQrjDEJy2nGvTec0HZwrShbmkH1B/jYucGVyPiXt4ITlzp0MgZnlPAF1oXYFG1TKSA==
X-Received: by 2002:a17:907:6089:b0:72f:56db:ccb6 with SMTP id ht9-20020a170907608900b0072f56dbccb6mr11726696ejc.318.1659350596840;
        Mon, 01 Aug 2022 03:43:16 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm64: efibind: fix MISRA C 2012 Directive 4.10 violation
Date: Mon,  1 Aug 2022 13:43:11 +0300
Message-Id: <20220801104311.1634742-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prevent header file from being included more than once by adding ifndef guard.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/arm/include/asm/arm64/efibind.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/arm/include/asm/arm64/efibind.h b/xen/arch/arm/include/asm/arm64/efibind.h
index 2b0bf40bf2..cdbedf99d2 100644
--- a/xen/arch/arm/include/asm/arm64/efibind.h
+++ b/xen/arch/arm/include/asm/arm64/efibind.h
@@ -17,6 +17,9 @@ Revision History
 
 --*/
 
+#ifndef __ASM_ARM64_EFIBIND_H__
+#define __ASM_ARM64_EFIBIND_H__
+
 #ifndef __GNUC__
 #pragma pack()
 #endif
@@ -205,6 +208,8 @@ typedef uint64_t   UINTN;
 
 #endif
 
+#endif /* __ASM_ARM64_EFIBIND_H__ */
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


