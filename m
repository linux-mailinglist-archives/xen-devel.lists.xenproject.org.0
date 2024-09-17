Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF0C97B2D8
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2024 18:16:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800025.1209955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqarz-0001gH-Cx; Tue, 17 Sep 2024 16:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800025.1209955; Tue, 17 Sep 2024 16:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqarz-0001cd-7H; Tue, 17 Sep 2024 16:16:03 +0000
Received: by outflank-mailman (input) for mailman id 800025;
 Tue, 17 Sep 2024 16:16:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fqUh=QP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sqary-0001Pu-2c
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2024 16:16:02 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 201ab6d0-7510-11ef-99a2-01e77a169b0f;
 Tue, 17 Sep 2024 18:15:59 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5365b71a6bdso5039166e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Sep 2024 09:15:59 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5368704da27sm1234574e87.83.2024.09.17.09.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 09:15:58 -0700 (PDT)
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
X-Inumbo-ID: 201ab6d0-7510-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726589758; x=1727194558; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lm/1+4e3ZJBgxoi/GYAc1NQQlIkPFwoz0AdoMqlIYho=;
        b=ikTT+2T5TMMcZJ1npP7htDirFoV1JpSsW7EcIGkBtF0Ujr6mvmvPm7/IsQtA2iYN9E
         t/0kyEVMnuP3vb8FnVQetWihvFTQ+UBcKHlPaalzh6pYqJ0oMS/tnGoynfpd9xPbE+b2
         Yiz4jClcGcQynVERWY0hmQ/3qKhIFl3bCG1FTLFcWl6QzaxuccX2UOPU+5ajhav2BmX3
         ajDh3AqhqAcqoKlWVIaOfbPGPwuhqRB6Q3LPNB1QHND3npLVVB9GI0USlOJtpsseaKGL
         W7uuxioVemUK6XGQsEL9PKeDSF8ECTEYx3EXgO9zgcQwk+DA99fupr3Ec0j4ZmU0/nLS
         6Fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726589758; x=1727194558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lm/1+4e3ZJBgxoi/GYAc1NQQlIkPFwoz0AdoMqlIYho=;
        b=GEVYiFsUgn/axBeq32W/g0vTevhTjzxaxXPg6IMrZHsnm7CVGOhmTPL5EA7sAHKomr
         Yfmx9B+DONU7NLiciu6DH1/VutkgSLvjhSLVIRxHKYpmXG2ZpP6vVM3EO010sI/fnM45
         KPnjx/4r/5iwCCadDuwPEAAWp0S8lXzLZELkGlXKm1tJRgALLmFb19uvETQRg9ZZWBQJ
         M9AdD+zJ7EKlmKSurSCE34mk7pLnb+SKVvN7TrBUeeMVz+gymscSd5yVlvrEsZexnTgK
         6p9gQUGKnQ3DCGH+kwr7DRtaukv8IPE4z49tVp4+8vKcip2+1dcAQm9fqUTEsWHjacKD
         GyFg==
X-Gm-Message-State: AOJu0YyF+t/bpk5zeL/78lpzUiLjC+w65BHbPubjaSIVyYjWwWQH6p2X
	DEEFkfVgcFTunKWtOlcoReg+y9Qha7tKgPbDXFnPQub4wxM2JJhUONWx5g==
X-Google-Smtp-Source: AGHT+IFMX0RwsEJNJ8FstnMCi8De9M+shLAOZ9A5ig6cERy69nFxUWib7vyBYZ1dEfGwKgsAyGsSig==
X-Received: by 2002:a05:6512:2c06:b0:536:88d0:4220 with SMTP id 2adb3069b0e04-53688d04697mr4048387e87.34.1726589758372;
        Tue, 17 Sep 2024 09:15:58 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/5] xen: define ACPI and DT device info sections macros
Date: Tue, 17 Sep 2024 18:15:51 +0200
Message-ID: <3049dd691f79c688751abaae63c0ccdc36680fbb.1726579819.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726579819.git.oleksii.kurochko@gmail.com>
References: <cover.1726579819.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce conditional macros to define device
information sections based on the configuration of ACPI
or device tree support. These sections are required for
common code of device initialization and getting an information
about a device.

These macros are expected to be used across different
architectures (Arm, PPC, RISC-V), so they are moved to
the common xen/xen.lds.h, based on their original definition
in Arm.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
 xen/include/xen/xen.lds.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index a17810bb28..aa7301139d 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -114,6 +114,21 @@
 
 /* List of constructs other than *_SECTIONS in alphabetical order. */
 
+#define USE_DECL_SECTION(x) DECL_SECTION(x)
+
+#define NOUSE_DECL_SECTION(x) x :
+
+#ifdef CONFIG_ACPI
+#define ACPI_DEV_INFO_SEC(secname, DECL_SECTION_MACROS_NAME)  \
+    DECL_SECTION_MACROS_NAME(secname) {                     \
+      _asdevice = .;                                        \
+      *(secname)                                            \
+      _aedevice = .;                                        \
+    } :text
+#else
+#define ACPI_DEV_INFO_SEC(secname, DECL_SECTION_MACROS_NAME)
+#endif /* CONFIG_ACPI */
+
 #define BUGFRAMES                               \
     __start_bug_frames_0 = .;                   \
     *(.bug_frames.0)                            \
@@ -131,6 +146,17 @@
     *(.bug_frames.3)                            \
     __stop_bug_frames_3 = .;
 
+#ifdef CONFIG_HAS_DEVICE_TREE
+#define DT_DEV_INFO_SEC(secname, DECL_SECTION_MACROS_NAME)  \
+    DECL_SECTION_MACROS_NAME(secname) {                     \
+      _sdevice = .;                                         \
+      *(secname)                                            \
+      _edevice = .;                                         \
+    } :text
+#else
+#define DECL_DT_DEV_INFO_SEC(secname, DECL_SECTION_MACROS_NAME)
+#endif /* CONFIG_HAS_DEVICE_TREE */
+
 #ifdef CONFIG_HYPFS
 #define HYPFS_PARAM              \
        . = ALIGN(POINTER_ALIGN); \
-- 
2.46.0


