Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB7E97B2D9
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2024 18:16:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800024.1209949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqarz-0001cY-2T; Tue, 17 Sep 2024 16:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800024.1209949; Tue, 17 Sep 2024 16:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqary-0001b0-V6; Tue, 17 Sep 2024 16:16:02 +0000
Received: by outflank-mailman (input) for mailman id 800024;
 Tue, 17 Sep 2024 16:16:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fqUh=QP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sqarx-0001Mb-A5
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2024 16:16:01 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 211b3ce0-7510-11ef-a0b7-8be0dac302b0;
 Tue, 17 Sep 2024 18:16:00 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5356bb55224so6514197e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Sep 2024 09:16:00 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5368704da27sm1234574e87.83.2024.09.17.09.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 09:15:59 -0700 (PDT)
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
X-Inumbo-ID: 211b3ce0-7510-11ef-a0b7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726589760; x=1727194560; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7JSRENPt1Yj1oaX2UiyUImJhaKNtf+xr2GA2sDhSBM=;
        b=Ynonf12kYcgZWqAu224JqJXaXuMp8wE9a4YH/hbeyuUllYTFFlpuLzXoAuI72UXOk3
         Ak2ngsW6Zd5yw2ZtKXRMrAzq8ceomWoHYmUexDGO37NwGThDndFjf8uR1EupS2ZKy/Tq
         NKcDcPIvw5Wyf8PNWBBEJ6BQcDvn5YLPji5mcVlG9rEGVMb6GzKk480AAv02z2ZBHM1I
         cQNJy+fjzYytVOWZv1nja3umIReLweMr6p30dNxzu1SKXjoiFHwSWvcwyBJlaHXB8PST
         wop6gPzGXandmEDbslvyZZRTgLUna28kL+NoYGrvbeK0DyoRFRjxKzh8NC8D/yiTWN6s
         iFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726589760; x=1727194560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7JSRENPt1Yj1oaX2UiyUImJhaKNtf+xr2GA2sDhSBM=;
        b=vWfNFeY0+F/SC0fFMwZtAaejcS8cnXDzKXFt9uWQAxhbH3cRfMKn1CEX7hI/4gF9w9
         QJ1jW6oaVAF0DhMMfIC3ndKEL8OIQGhX+Ypwp3aIsnwtzzyLjoZi47Uu24FpNC6WSpNb
         2iECxFYzlKwfzdMPm6Gf4gCpJO78Ulbjxs+0Zl+glyIXi6GXESIaYv5VbkScmyvqMh0D
         rOVOCGTO849biPFrrAEwbI79D/xwqlYgkFiIHGNcSSr3vvkv6ZlUDloQyZP5LEbG+3S2
         LVhDvFEA+gQWGaLDjvl49ebt1E9gpb+HaZx2vqEVpEdHDDPnFjiRpqNJmP0TBywES/lK
         bwww==
X-Gm-Message-State: AOJu0Ywt/0nPeO8oU0+DzR4oR71m6fPL8VBSjfpBQfId2o4ElR1DeNyX
	gfezcvw7EG5U848FxgEErpCChvvU/8q43lpW5CcWdFMJNcajPmDQCdy6wQ==
X-Google-Smtp-Source: AGHT+IHoZKW8br/L6CyzzRGJkmCXaGEild3CLH7s7OKnJnWMGqHmfA5tkYeHi6G281k5ryBSfXBECg==
X-Received: by 2002:a05:6512:a8a:b0:52f:159:2dc5 with SMTP id 2adb3069b0e04-53678fe69a7mr12178688e87.42.1726589759866;
        Tue, 17 Sep 2024 09:15:59 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 3/5] xen/ppc: add section for device information in linker script
Date: Tue, 17 Sep 2024 18:15:53 +0200
Message-ID: <05eeb53403017fb40c4debf8a33f70438953d6de.1726579819.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726579819.git.oleksii.kurochko@gmail.com>
References: <cover.1726579819.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new `.dev.info` section in the PPC linker script to
handle device-specific information. This section is required by
common code (common/device.c: device_init(), device_get_class() ).
This section is aligned to `POINTER_ALIGN`, with `_sdevice` and `_edevice`
marking the start and end of the section, respectively.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - reuse DT_DEV_INFO_SEC introduced earlier in this patch series with using
   of DECL_SECTION.  
---
 xen/arch/ppc/xen.lds.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 38cd857187..6e5582c3e4 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -94,6 +94,9 @@ SECTIONS
         CONSTRUCTORS
     } :text
 
+    . = ALIGN(POINTER_ALIGN);         /* Devicetree based device info */
+    DT_DEV_INFO_SEC(.dev.info, USE_DECL_SECTION)
+
     . = ALIGN(PAGE_SIZE);             /* Init code and data */
     __init_begin = .;
     DECL_SECTION(.init.text) {
-- 
2.46.0


