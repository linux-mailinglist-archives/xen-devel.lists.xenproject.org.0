Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A50A798F5A9
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 20:00:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809687.1222182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ76-0007wZ-HL; Thu, 03 Oct 2024 17:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809687.1222182; Thu, 03 Oct 2024 17:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ76-0007rh-9k; Thu, 03 Oct 2024 17:59:44 +0000
Received: by outflank-mailman (input) for mailman id 809687;
 Thu, 03 Oct 2024 17:59:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swQ74-0006hm-Vg
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 17:59:42 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4427221f-81b1-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 19:59:42 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8d100e9ce0so159756466b.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 10:59:42 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104731a5sm111876166b.180.2024.10.03.10.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 10:59:41 -0700 (PDT)
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
X-Inumbo-ID: 4427221f-81b1-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727978382; x=1728583182; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bKKGq4cESxZkZMDW1uobM0TYcCXOg89PEXrmDcph/U=;
        b=Z9+eDL5o7fwLuNRyCLghRdldOohUMGSePyHCOuMeAFohMjGjbcFLVuCXZoaxevpBBD
         nKCTnVQ9jIEQZwmC3dE5B8uv3X4Y26YT60VKLU279VA9/NO4QDiw9lRWqH/JV/Ls96Gi
         b0DNRIoX6AJCREJ6nyM6XVqEQ6zat4LCwDLwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727978382; x=1728583182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bKKGq4cESxZkZMDW1uobM0TYcCXOg89PEXrmDcph/U=;
        b=SQYGh/xk1AVyEgunGcZHxwyB03jOqgNuB34UfY/oQEbNmaObjl2Z0sFPYurvFuomc2
         uuZa9B0+/56JDboXhVO6F1lka+fKIqj8GTTREm2t8b4MfaBjxkfRad9vCj2k0Xql9AGK
         oMLVV8eKJK6YINCT9zWI/S3Y3TMSGvv7ffwxP0WYAdO7bnsrPaXpiwAJC0VmBYLwbDDb
         cMyPbRj1Sug2FKkXmsvHiPYI1v8bC/67fkAFt/3YPrSRfkE7ai69iKrydTsujv2dbdzW
         DRe0IrlLAx201yXppGYQLxTtgjfmj3GTtLt1sKTd7cILcc6Hde6Z2UmbjZw5Vi1k/GUx
         M1lQ==
X-Gm-Message-State: AOJu0Yxrh9E4BvMJKyGDOMOBL5vQS5GeZ2plgc/wYVTS25H0d9ji+xu6
	ahLPGOAUHWpU3Uue8DvTg+SlNb8nRKgvpwYvZXt1KiCn/nbxSuxKE5OaTK/XQozA6FcAfX9jiT7
	j
X-Google-Smtp-Source: AGHT+IHpSv6Zf/IH+CXXxCGLJBYGySY2CK14rpMiQQ2Y65mcyz1T6LsltHbitB87LK1LNIxEAd9ibw==
X-Received: by 2002:a17:907:f745:b0:a8b:154b:7649 with SMTP id a640c23a62f3a-a991bd3fb29mr18061166b.15.1727978381712;
        Thu, 03 Oct 2024 10:59:41 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 09/19] xen: Update header guards - Intel TXT
Date: Thu,  3 Oct 2024 18:59:09 +0100
Message-Id: <20241003175919.472774-10-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003175919.472774-1-frediano.ziglio@cloud.com>
References: <20241003175919.472774-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to Intel trusted execution technology.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/include/asm/tboot.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/tboot.h b/xen/arch/x86/include/asm/tboot.h
index 818d5fa451..15479fe80e 100644
--- a/xen/arch/x86/include/asm/tboot.h
+++ b/xen/arch/x86/include/asm/tboot.h
@@ -34,8 +34,8 @@
  *
  */
 
-#ifndef __TBOOT_H__
-#define __TBOOT_H__
+#ifndef ASM__X86__TBOOT_H
+#define ASM__X86__TBOOT_H
 
 #include <xen/acpi.h>
 
@@ -147,7 +147,7 @@ static inline int tboot_wake_ap(int apicid, unsigned long sipi_vec)
 }
 #endif /* CONFIG_TBOOT */
 
-#endif /* __TBOOT_H__ */
+#endif /* ASM__X86__TBOOT_H */
 
 /*
  * Local variables:
-- 
2.34.1


