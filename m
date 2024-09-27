Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD1698891E
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 18:33:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806399.1217755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDtx-0001gu-3s; Fri, 27 Sep 2024 16:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806399.1217755; Fri, 27 Sep 2024 16:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDtw-0001dD-VF; Fri, 27 Sep 2024 16:33:04 +0000
Received: by outflank-mailman (input) for mailman id 806399;
 Fri, 27 Sep 2024 16:33:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xL9K=QZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1suDtv-0001aD-0E
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 16:33:03 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29c15f0c-7cee-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 18:33:02 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a93c1cc74fdso225209966b.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 09:33:02 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27c59bdsm150607166b.50.2024.09.27.09.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 09:33:00 -0700 (PDT)
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
X-Inumbo-ID: 29c15f0c-7cee-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727454781; x=1728059581; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJV5oRBJlzZEz9ymtqRaazaj6DoXUhgQRXq9CVcX0tA=;
        b=j0oHFMrVhqpylfxNXpunPqu9ghT3Shl+AKkoVbTtOMZFh0HrdJ33XwYXEYEfhW/6Yw
         Mqm6zUD7O3RVjRm27aMRbS83X16TPp5e5Gw70CtOCcMSuQRgXHWktsi2KHzuKr5wewRt
         1bIRFzcaUnMwxtuythq1jCJMfTm9FYlfzyo/3Qe2mChsBOBHUscQUNhFXOolZrpzFath
         Sw87xCC61Or/3/wWw9CHWuulvEL4gTQluJigWdwO6cqSZWV5Gx7aFMEJYdHlViW/jm/W
         HMzuHYZX89J/hIQQS16WOtS+fsY8mmHRggNNuiB1+aSNN2f3YEcNWJ1HsMicJdxymyRB
         xqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727454781; x=1728059581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJV5oRBJlzZEz9ymtqRaazaj6DoXUhgQRXq9CVcX0tA=;
        b=PLF2RzYGZZUaZzGEFgHqfUuRQfyXm/FPHVXtVzrF3G547orR43Fqmh7ZpsfpN0CPOW
         auLEZeHifncQee8SxB49/py2f4VZrlXo43I/5yrCPWsGfEI2s/npeT6yaNIgy3XBSU14
         mu5bFLD5PFeUkfkaz/9Gnjxik1/02J2AydQ9a1c+L7Y0AcTsxov92/ZWhpYDKzLvGHRy
         9N9/AATeTthdlFvmURGD50QtZZJVyTD8wpqqtitC0PZt4RqBhnbOBsfVMWFrz6/+FxBM
         KyYaz6nsdMPKJsvHdIU046YSmyIVfOGdBJTTuPO3mti360drSGloUF7WMSsKom5yftow
         7eeA==
X-Gm-Message-State: AOJu0YwyT6eYnmJ9P9Tdo1EHzNWDJ1SrNx1IDhvvuVEELE8LTyPalTiZ
	VphnYBUj/X+CfTdazBUcKkhwwwe6V1yPLisoMQ93uiAfwzex3GcXozm6Cw==
X-Google-Smtp-Source: AGHT+IHhHgFHvcCnMJwrZrnSea7HPNePoioW1KsPsVXPYD0jV0RZzy1+SVCUfIAFJo92YTJUt2eivQ==
X-Received: by 2002:a17:907:6ea1:b0:a86:7b71:7b77 with SMTP id a640c23a62f3a-a93c4a69aabmr335450766b.44.1727454780814;
        Fri, 27 Sep 2024 09:33:00 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 2/6] xen: define ACPI and DT device info sections macros
Date: Fri, 27 Sep 2024 18:32:52 +0200
Message-ID: <05ce8fea5c16ad603ca0fea60730ff10abcf2d02.1727452451.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727452451.git.oleksii.kurochko@gmail.com>
References: <cover.1727452451.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce macros to define device information sections based on
the configuration of ACPI or device tree support. These sections
are required for common code of device initialization and getting
an information about a device.

These macros are expected to be used across different
architectures (Arm, PPC, RISC-V), so they are moved to
the common xen/xen.lds.h, based on their original definition
in Arm.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5:
 - drop macros parameter for ACPI_DEV_INFO and DT_DEV_INFO.
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V4:
 - rename ADEV_INFO to ACPI_DEV_INFO.
 - refactor ADEV_INFO and DT_DEV_INFO: add alignment and DECL_SECTION.
---
 Changes in V3:
  - drop SEC* at the end of ACPI AND DT device info
    section mancros.
  - refactor ADEV_INFO and DT_DEV_INFO macros.
---
 xen/include/xen/xen.lds.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index c6178bdc42..16a9b1ba03 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -120,6 +120,14 @@
 
 /* List of constructs other than *_SECTIONS in alphabetical order. */
 
+#define ACPI_DEV_INFO        \
+  . = ALIGN(POINTER_ALIGN);  \
+  DECL_SECTION(.adev.info) { \
+      _asdevice = .;         \
+      *(.adev.info)          \
+      _aedevice = .;         \
+  } :text
+
 #define BUGFRAMES                               \
     __start_bug_frames_0 = .;                   \
     *(.bug_frames.0)                            \
@@ -137,6 +145,14 @@
     *(.bug_frames.3)                            \
     __stop_bug_frames_3 = .;
 
+#define DT_DEV_INFO         \
+  . = ALIGN(POINTER_ALIGN); \
+  DECL_SECTION(.dev.info) { \
+       _sdevice = .;        \
+       *(.dev.info)         \
+       _edevice = .;        \
+  } :text
+
 #ifdef CONFIG_HYPFS
 #define HYPFS_PARAM              \
        . = ALIGN(POINTER_ALIGN); \
-- 
2.46.1


