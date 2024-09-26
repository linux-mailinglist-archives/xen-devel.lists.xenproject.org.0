Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA559877E2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 18:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805752.1216962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1strlC-0001l5-GN; Thu, 26 Sep 2024 16:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805752.1216962; Thu, 26 Sep 2024 16:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1strlC-0001iF-BR; Thu, 26 Sep 2024 16:54:34 +0000
Received: by outflank-mailman (input) for mailman id 805752;
 Thu, 26 Sep 2024 16:54:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukdd=QY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1strlB-0001SU-6H
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 16:54:33 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0072edca-7c28-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 18:54:32 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a93c1cc74fdso38881966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 09:54:32 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2979e00sm16981566b.158.2024.09.26.09.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 09:54:30 -0700 (PDT)
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
X-Inumbo-ID: 0072edca-7c28-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727369671; x=1727974471; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Me01IlmWn5ZXb/VKWHt5wAOgVcX8vvbwAiPhcFzwz0=;
        b=TsEpjwmIy/fiRv+OxB8HeW8p79G75MGcaw7mtYn024YB9wCyqncHMQ3w2jGx+K0WRr
         96XAj5HbvsXqza6NCqmNk/89w6vsnL9CkxsFvSz6qB6Mac28+PUbhaTf/noi8xxvSUN+
         zfNMiThN67jBNBekZhvfsnEamSqLfCw87zoh8L//X3IE/fs9zqnYVJbxO/tpjy8K+dU9
         4tMiN4xfC4TRbN3r53IKA1TXpzdeB02ciyoJVqAvSj92xeKJ3nn0s4L3Dbv6vaz0lbRF
         jkfa9HcS7KsvI+t8SANopO/CFfWyRBhDnkW0z3NPESmIuLZJniWPkNHoG6s9r/4ZdPA/
         +v8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727369671; x=1727974471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Me01IlmWn5ZXb/VKWHt5wAOgVcX8vvbwAiPhcFzwz0=;
        b=WZi/k4s2X0UzMaD+h//rHeLvIT2KpGnFzYHz8pvmgK9QRHFWdNjgU8ywO6EoBFSjt7
         4i/FLMMBAO6+kZfTb5MtijkHLyDZX9AbC1PNN9kZUM1yGKitpfHIRUlCDXw6yManPaeu
         YcqTlULz+6TwuxInoT3WcxF1XLdl6eN1WSkPMUc8NncJLfRD2yM1u2/kLW0Dq13Iz8Fo
         M+A+wEFmH8R/JOGuVYuEYIokQsqIDmaO0mvAg9ZjhD5dXsSjYZS7qwHjIN0dA5UtpicK
         UoEC8Zer2b9IopepLB3/lKKDHCenNO9NX6oaSm3c20mpljrirtvACTo0ixaWGJqF5Kk8
         IQbQ==
X-Gm-Message-State: AOJu0YwTn1IuSSvi8VGq/zL5X+805JrWXYf0vIJRV2SgzeAYbPQA0LzY
	7on5aYZ7aXNvd/VbsJQ/CnZRXdBDc9WM0oeIGw2LvUYgUnJMiNvook+xlQ==
X-Google-Smtp-Source: AGHT+IENxhW8Z6GwOSQEBYUaU5Ssy8Dm29D6OtuPMVh8LwjaxL6cuq1Jq2ETxT/5xAHcm5tHy+QvDA==
X-Received: by 2002:a17:907:60cc:b0:a86:7a84:abb7 with SMTP id a640c23a62f3a-a93c4915538mr16959066b.20.1727369671152;
        Thu, 26 Sep 2024 09:54:31 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 2/6] xen: define ACPI and DT device info sections macros
Date: Thu, 26 Sep 2024 18:54:21 +0200
Message-ID: <c5fd649a4ccd3a65a81dfab505fc99b2a679cda6.1727365854.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727365854.git.oleksii.kurochko@gmail.com>
References: <cover.1727365854.git.oleksii.kurochko@gmail.com>
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
index 8135732756..cec86d0781 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -120,6 +120,14 @@
 
 /* List of constructs other than *_SECTIONS in alphabetical order. */
 
+#define ACPI_DEV_INFO(secname)  \
+  . = ALIGN(POINTER_ALIGN);     \
+  DECL_SECTION(secname) {       \
+      _asdevice = .;            \
+      *(secname)                \
+      _aedevice = .;            \
+  } :text
+
 #define BUGFRAMES                               \
     __start_bug_frames_0 = .;                   \
     *(.bug_frames.0)                            \
@@ -137,6 +145,14 @@
     *(.bug_frames.3)                            \
     __stop_bug_frames_3 = .;
 
+#define DT_DEV_INFO(secname)    \
+  . = ALIGN(POINTER_ALIGN);     \
+  DECL_SECTION(secname) {       \
+       _sdevice = .;           \
+       *(secname)              \
+       _edevice = .;           \
+  } :text
+
 #ifdef CONFIG_HYPFS
 #define HYPFS_PARAM              \
        . = ALIGN(POINTER_ALIGN); \
-- 
2.46.1


