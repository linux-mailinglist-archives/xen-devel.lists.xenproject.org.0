Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EE2731D02
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 17:49:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549719.858439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9pDJ-0007JY-4m; Thu, 15 Jun 2023 15:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549719.858439; Thu, 15 Jun 2023 15:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9pDJ-0007Dv-0Z; Thu, 15 Jun 2023 15:48:45 +0000
Received: by outflank-mailman (input) for mailman id 549719;
 Thu, 15 Jun 2023 15:48:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IrMH=CD=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q9pDH-0006RY-2C
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 15:48:43 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19d816cf-0b94-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 17:48:41 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-30aea656e36so5973964f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jun 2023 08:48:41 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e10-20020a056000194a00b0030497b3224bsm21374699wry.64.2023.06.15.08.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 08:48:39 -0700 (PDT)
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
X-Inumbo-ID: 19d816cf-0b94-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1686844120; x=1689436120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WnBLCpBRw4FnACMA6JimLolA7wsQAmylgXv84AWmx3g=;
        b=EOe8C24/Hha9iJPhezP4egK6yCdGlX22P+KZyztDJ1gAfauTk3KiSU/GAMWBWK/1OZ
         7qTMvvNL+03KOvJ8cUg3QS2mBasXeHqgaak5RsqyPmUdu4PDFgdfTAYKPg/rn1y6Q8T0
         oXdfp8NqNEcWCUGVNavjXvUlL2XvW+Tvy40SI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686844120; x=1689436120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WnBLCpBRw4FnACMA6JimLolA7wsQAmylgXv84AWmx3g=;
        b=l8Yk9n1mYWfU6h3/M0xYvpmo5Vq1po8xKr/8PApokvmlCjOQG7jUm+iOAbeFxtd2rz
         Bg7DFDuGFgzYh8wASVzriuLzkx0v9MeHAPanT1v8EkRW8FH7SuMhmt30SdP9Yh/48o+o
         zRatikvZ0e7jdrSL/eWBNhDrVtpwIaHIq2OisXMx7cwNXK5vrd/0z/KdZjfgq/lBJG17
         l83jXb21Sonj4L8qr2xo4aGgybiaFCF0g9lTxMKVWzbiZbu/QPUYEDCvuu12cv8vfwgZ
         yAOnGq1avEyAyqVnkH6tVdO0ivYUDVCdyqfrjWEMJ87u3qUyREILitEvgm1ZPVXJSLp+
         d98g==
X-Gm-Message-State: AC+VfDx7kOvAbbKsf4lVySchq8UfQDyv9Y8N1JvHaoyFQrKlWkSMhdYN
	RonMDNSyVOy5nHFNj7ahqYp0tJBa2OMSHZb33Oc=
X-Google-Smtp-Source: ACHHUZ7xfYEs4frXBMKRcOHNEZ4p3qSPH+O9sVU0knfUAn3HS5x+N+3ZXdmYbnu/CAb/i7aBM0xL7g==
X-Received: by 2002:adf:eb8d:0:b0:309:1532:8287 with SMTP id t13-20020adfeb8d000000b0030915328287mr11785575wrn.19.1686844120373;
        Thu, 15 Jun 2023 08:48:40 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 3/5] x86/microcode: Ignore microcode loading interface for revision = -1
Date: Thu, 15 Jun 2023 16:48:32 +0100
Message-Id: <20230615154834.959-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615154834.959-1-alejandro.vallejo@cloud.com>
References: <20230615154834.959-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some hypervisors report ~0 as the microcode revision to mean "don't issue
microcode updates". Ignore the microcode loading interface in that case.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v3:
  * Moved from v2/patch3 (Andrew)
---
 xen/arch/x86/cpu/microcode/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 530e3e8267..1554fa38eb 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -860,6 +860,14 @@ int __init early_microcode_init(unsigned long *module_map,
     if ( ucode_ops.collect_cpu_info )
         ucode_ops.collect_cpu_info();
 
+    /*
+     * Some hypervisors deliberately report a microcode revision of -1 to
+     * mean that they will not accept microcode updates. We take the hint
+     * and ignore the microcode interface in that case.
+     */
+    if ( this_cpu(cpu_sig).rev == ~0 )
+        ucode_ops.apply_microcode = NULL;
+
     if ( !ucode_ops.apply_microcode )
     {
         printk(XENLOG_WARNING "Microcode loading not available\n");
-- 
2.34.1


