Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC2BA66ED9
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 09:48:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918643.1323290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuScC-0008V6-Jp; Tue, 18 Mar 2025 08:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918643.1323290; Tue, 18 Mar 2025 08:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuScC-0008SL-HA; Tue, 18 Mar 2025 08:48:00 +0000
Received: by outflank-mailman (input) for mailman id 918643;
 Tue, 18 Mar 2025 08:47:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuScA-0008SA-PM
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 08:47:58 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b015bca6-03d5-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 09:47:56 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso32732945e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 01:47:56 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-395cb3189a0sm17833911f8f.67.2025.03.18.01.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 01:47:55 -0700 (PDT)
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
X-Inumbo-ID: b015bca6-03d5-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742287676; x=1742892476; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ThJQB3tJJbLra9ACRWvyMzL1XPDAWQ8f8WNTPFDs/GU=;
        b=emD5KraCIyOXtNRyosduVnLUPBBanSDabFtNn5fI2W1cSddfPfuLrVw9UnDt9yg0Ua
         gxPU/zmDktE+SCVRjmqohZoGY4C/P6Ccb2bdmbELgAA3hQes4QMWeV9eae5y0Javdy/A
         JTCtmhBUej/cy5G42Rxgoa/iHfEaK8VckkbWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742287676; x=1742892476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ThJQB3tJJbLra9ACRWvyMzL1XPDAWQ8f8WNTPFDs/GU=;
        b=MxNzTG//EcHMX9ssH9fM135zXvPKGCbnJxx9Yw2H4BqrsrZwwvWKtND0UVBnkOTwiE
         KHxfwrjoLpiOpJUw7cl9x+drHyoMekr4SI8T6osvjtR2HHuJDdygSSZbVPd9K9n0BlIa
         ldE98XLKitE41MOvJ4vj+UyiklhBzzxzrgPxgKFQH2uNvkPeMQS5tGW5IBPxudw3FZPM
         r67pOyYEesNYg8EQ1N059aYMq5xZu2EFfFeSvsKuwufSDaI0ljG3H6bC/OlK7yu6MFvF
         S9L+kLFMtPpB7NXa1eudqBN/TgYQMLJ9+1j3cU8qgChJulNAB4LmmCC8+Tn7eCZW8fK4
         OmRA==
X-Gm-Message-State: AOJu0YzkOm/ySIuxnP38uDKj58EEDxGvfCuAwiaFTRSnVAKl9s3j0xvy
	JdgHKEUCpmI4Ja9bYSXW31er4mBTNs2mVAFN8byttfvuBbCGK2rvgPNHMW3r0xhOaECLwg8WFDi
	2
X-Gm-Gg: ASbGncukwiReWm8c3UDfXORfCYs0O/Hj8QcABYt+SGHmApivukFYWG/JLoXmO++SeUU
	N5X2WHt40LBK6X7K6E+3tgIOXp9UxQaXqkwYhzBr43JVdOuSWZ3yv3gq3WhUEFnoCUcqfAS3cjl
	FN8pvviUSycGD8YvFU4LYCs7qtW1pgJjBFZwmR5gmlDv7FkxQ71NrRcbSwXxC9u+YR0agfzgDY9
	Fnmds9bxTURMnak80AfUrg4nze/b4fbeTWOwdmwpwOQb5wWJeUP+sSmbU2ibhvsMcAejqcnVrr0
	X4C1RVww61B+SNcRaKLI8XmCBgJLTsu4gykXK9xJraKyb9eXuA==
X-Google-Smtp-Source: AGHT+IFAbL3jipT1NLsrdSSW895ADiBLnHqkdUS3/JN1fy5bvxM6Wry2YwrlpspAZfDJqWGFtWm+eA==
X-Received: by 2002:a05:600c:63d1:b0:43c:ec28:d310 with SMTP id 5b1f17b1804b1-43d3e14fa7dmr7344865e9.10.1742287675872;
        Tue, 18 Mar 2025 01:47:55 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/msi: always propagate MSI register writes from __setup_msi_irq()
Date: Tue, 18 Mar 2025 09:47:25 +0100
Message-ID: <20250318084725.52261-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After 8e60d47cf011 writes from __setup_msi_irq() will no longer be
propagated to the MSI registers if the IOMMU IRTE was already allocated.
Given the purpose of __setup_msi_irq() is MSI initialization, always
propagate the write to the hardware, regardless of whether the IRTE was
already allocated.

No functional change expected, as the write should always be propagated in
__setup_msi_irq(), but make it explicit on the write_msi_msg() call.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I haven't actually spotted any cases where this would go wrong, but better
stay on the safe side and always propagate the write there.
__setup_msi_irq() should not be a hot path.
---
 xen/arch/x86/msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 8bb3bb18af61..5389bc08674a 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -532,7 +532,7 @@ int __setup_msi_irq(struct irq_desc *desc, struct msi_desc *msidesc,
     desc->msi_desc = msidesc;
     desc->handler = handler;
     msi_compose_msg(desc->arch.vector, desc->arch.cpu_mask, &msg);
-    ret = write_msi_msg(msidesc, &msg, false);
+    ret = write_msi_msg(msidesc, &msg, true);
     if ( unlikely(ret) )
     {
         desc->handler = &no_irq_type;
-- 
2.48.1


