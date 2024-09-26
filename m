Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2E89877DC
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 18:55:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805754.1216982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1strlE-0002LU-0z; Thu, 26 Sep 2024 16:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805754.1216982; Thu, 26 Sep 2024 16:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1strlD-0002Cj-TR; Thu, 26 Sep 2024 16:54:35 +0000
Received: by outflank-mailman (input) for mailman id 805754;
 Thu, 26 Sep 2024 16:54:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukdd=QY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1strlC-0001ST-RG
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 16:54:34 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 012ea90a-7c28-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 18:54:33 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5365aa568ceso1492701e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 09:54:33 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2979e00sm16981566b.158.2024.09.26.09.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 09:54:31 -0700 (PDT)
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
X-Inumbo-ID: 012ea90a-7c28-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727369672; x=1727974472; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQIIQr4UWTptg8Aejtk0NghHPcRH7JuS3+zpBsqfsg8=;
        b=eCkky41bTqXf5MEQzg89wdxfmXePTFu7VXNHdA6Ml0vlBFh3fDoK0pdqSdG9DJxM8t
         5pzozVqNzxoVhV7a2Zj/Wo1KTPhYanm4Ix+4vJqAmrAfaF9K4mgn8Ymj4z4w09U8pxjq
         XMu6RKl7vwX5V/bScybRH8YuwAAT/dtWik0Pf3maQTFhQrsaAdaFg+b4uhsghVE6xeVX
         AqKThGXJ8B71C4hnKVXpQi5LusUefKPZ2BBnvQun1vImG2a+yA7Q6EjKdtKCIhI+t61X
         vDIbKtZkXWnZYajknOpetr02gepnKuYLZkAcBABPPliTY0fXl1GfjVNnAA2W7WamabUg
         WQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727369672; x=1727974472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQIIQr4UWTptg8Aejtk0NghHPcRH7JuS3+zpBsqfsg8=;
        b=WK6XjAyK5TwnUiJ/wsZihS/sp/Skf5oronQFffM7SGy4UU1yzkG63BvL+LxgCHMGMX
         5aY0eNoG0yvSkSNDfsrqcCFd8KDipCeBwknNMYsw6K4GY1sbeSVeNHMRWyxr3SLKiSHi
         t5/nS0IH/WGFyRxpk5U3vAAL5E/hGw32uWZ2ZYK6PxBXq+C39O5j9xtDnAn9JA/s+uXd
         xcodyITbdQ1ANjLlEon75ydUnHB9CJE+ltRGd1HfsBfdyPI1K7UWHwIzQ4EiGN5X0XY/
         Lm1pxDuSm+CclRVJNjrOvUk5zvNXrkjyOS/fvbvPVC3LEXU6W2kDqlqRcoWbrIuyqGl2
         6BxA==
X-Gm-Message-State: AOJu0YykzxCjczZdteG7TGGjz8gqoBg39QSmVw2GMu8Kd0PLHdHBpITG
	qmabTuJlIPyND9UtoKvjCNIIEaCy+62j8k/5mGQuDHaAuHuJjA+9mAWQPw==
X-Google-Smtp-Source: AGHT+IFbuc19mZ6WQ7B3+O6sfjgA9vkYIGDrEAgw1pzkytyRcgldlpExwOPYD6WPVeHFo4Ln1Dauxg==
X-Received: by 2002:a05:6512:114c:b0:52e:fa5f:b6a7 with SMTP id 2adb3069b0e04-5389fc3bd7cmr240506e87.13.1727369672200;
        Thu, 26 Sep 2024 09:54:32 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 3/6] xen/arm: use {DT,ACPI}_DEV_INFO for device info sections
Date: Thu, 26 Sep 2024 18:54:22 +0200
Message-ID: <fc4243be6e43224f27311d96512dc0f465c73a38.1727365854.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727365854.git.oleksii.kurochko@gmail.com>
References: <cover.1727365854.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor arm/xen.lds.S by replacing the inline definitions for
device info sections with the newly introduced {DT,ACPI}_DEV_INFO
macros from xen/xen.lds.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - use newly refactored ACPI_DEV_INFO and DT_DEV_INFO
---
Changes in V3:
 - use refactored ADEV_INFO and DT_DEV_INFO macros.
---
 xen/arch/arm/xen.lds.S | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 0987052f1a..3b7b677197 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -4,6 +4,8 @@
 
 #include <xen/cache.h>
 #include <xen/lib.h>
+
+#define SIMPLE_DECL_SECTION
 #include <xen/xen.lds.h>
 #include <asm/page.h>
 #undef ENTRY
@@ -124,20 +126,10 @@ SECTIONS
       _eplatform = .;
   } :text
 
-  . = ALIGN(8);
-  .dev.info : {
-      _sdevice = .;
-      *(.dev.info)
-      _edevice = .;
-  } :text
+  DT_DEV_INFO(.dev.info)
 
 #ifdef CONFIG_ACPI
-  . = ALIGN(8);
-  .adev.info : {
-      _asdevice = .;
-      *(.adev.info)
-      _aedevice = .;
-  } :text
+  ACPI_DEV_INFO(adev.info)
 #endif
 
   . = ALIGN(8);
-- 
2.46.1


