Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3B698891A
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 18:33:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806401.1217769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDtx-0001v5-N5; Fri, 27 Sep 2024 16:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806401.1217769; Fri, 27 Sep 2024 16:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDtx-0001mA-Gq; Fri, 27 Sep 2024 16:33:05 +0000
Received: by outflank-mailman (input) for mailman id 806401;
 Fri, 27 Sep 2024 16:33:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xL9K=QZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1suDtv-0001aD-Lc
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 16:33:03 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a68a096-7cee-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 18:33:02 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-535dc4ec181so2536512e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 09:33:02 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27c59bdsm150607166b.50.2024.09.27.09.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 09:33:01 -0700 (PDT)
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
X-Inumbo-ID: 2a68a096-7cee-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727454782; x=1728059582; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hWXwXM8AkGaqnosUqSbi4XBp7s8/BolzMP+Ya0W380=;
        b=bWj5os0jLK3d+qzy8n9ltuylN7xTLMfNwtq9KY9XnoZCZFMFPs99cs8fs+zOY00ZH6
         DTFtd4/Z7SzATaAMLbOBqC/P+SK1cBG5SI9MQa2tsvPXXWtnFqoa7bQc//Sbq9aurDMr
         ykM83sXjo7ntgi8rVpOfUxPGpbIQLWUfLjrrBt9s7jZMHA5WiKvbhDA+JOfVfVhPbbdE
         DosgbxBElrIHZfcp/mPTU9bum4FNIBOS53SU5wbbabUyCJZ6gwR9PjfI4DGa4OwEzROJ
         O7Zt8EcObMHgTsp/TKE2YgkCh9MnOjOdMHIsqLmH6REDnyCKSk4236Va99j+bQjV00x7
         oPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727454782; x=1728059582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hWXwXM8AkGaqnosUqSbi4XBp7s8/BolzMP+Ya0W380=;
        b=MALOyph+XB7ngZiMNPTeX7GvIwJA5BnXAoL2+TzGMYK3nD+OH4BDO1+wJFqayxqyIu
         FJLLYBBPklSwallZ4tILIWs48w1VKB3qnshIwtXMf8EB4ZW+RGWEDK41s9JrcfkPZngU
         9uofnHAQIot7fv7ez1tVzdZHINV+Zg0oFsy0FDnGTSwVjqU47b7gu45iAK2jXbSh9A1a
         FocvffbKiu0VArsR7Tv6vaQ7m8GesW6cVH4VJnEUmAa9FJeQuhjZ7BBK/i6PsbGNSEGQ
         XTLxEHZrkfmzDl7zVZQDC4wRvwOV0AapH2sRuHkqHpp3KTkRV0z/CX0TgXU9JfoiPCzF
         mJWQ==
X-Gm-Message-State: AOJu0Yxwa0yw/qdrQSXw58gcfB2NUEOtis1KEMUZjJCltp4tJUJbV016
	3BfnvFJlVMGCiz9ZNnYRBdsLqV6vjqFxwNv2M3pBpUUsLJD1BurRPDSKXg==
X-Google-Smtp-Source: AGHT+IHqba2x/LuPYwAWEbDp/3SXBVV9I5Du1sSufcMPMgmKIuxrZOE6HlF1REbdv7tHGF1hnycwfA==
X-Received: by 2002:a05:6512:4023:b0:52f:413:7e8c with SMTP id 2adb3069b0e04-5389fc3c5e7mr2318449e87.14.1727454781854;
        Fri, 27 Sep 2024 09:33:01 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 3/6] xen/arm: use {DT,ACPI}_DEV_INFO for device info sections
Date: Fri, 27 Sep 2024 18:32:53 +0200
Message-ID: <025fa86a8dcc7430c072743b54489f913aa990b0.1727452451.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727452451.git.oleksii.kurochko@gmail.com>
References: <cover.1727452451.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor arm/xen.lds.S by replacing the inline definitions for
device info sections with the newly introduced {DT,ACPI}_DEV_INFO
macros from xen/xen.lds.h.

Change alignment of DT_DEV_INFO and ACPI_DEV_INFO sections from
8 to POINTER_ALIGN as struct acpi_device_desc and struct device_desc
don't have any uint64_t's so it is safe to do that.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in V5:
 - add Reviewed-by: Michal Orzel <michal.orzel@amd.com>.
 - update the commit message ( add information about s/8/POINTER_ALIGN/
   for Arm ).
 - use newly refactored ACPI_DEV_INFO and DT_DEV_INFO ( drop macros argument )
---
Changes in V4:
 - use newly refactored ACPI_DEV_INFO and DT_DEV_INFO
---
Changes in V3:
 - use refactored ADEV_INFO and DT_DEV_INFO macros.
---
 xen/arch/arm/xen.lds.S | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 0987052f1a..5b9abc9a2d 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -124,20 +124,10 @@ SECTIONS
       _eplatform = .;
   } :text
 
-  . = ALIGN(8);
-  .dev.info : {
-      _sdevice = .;
-      *(.dev.info)
-      _edevice = .;
-  } :text
+  DT_DEV_INFO
 
 #ifdef CONFIG_ACPI
-  . = ALIGN(8);
-  .adev.info : {
-      _asdevice = .;
-      *(.adev.info)
-      _aedevice = .;
-  } :text
+  ACPI_DEV_INFO
 #endif
 
   . = ALIGN(8);
-- 
2.46.1


