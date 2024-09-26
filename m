Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5B59877DD
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 18:55:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805755.1216997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1strlG-0002jR-Bb; Thu, 26 Sep 2024 16:54:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805755.1216997; Thu, 26 Sep 2024 16:54:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1strlG-0002gD-7O; Thu, 26 Sep 2024 16:54:38 +0000
Received: by outflank-mailman (input) for mailman id 805755;
 Thu, 26 Sep 2024 16:54:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukdd=QY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1strlE-0001ST-Kl
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 16:54:36 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02304502-7c28-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 18:54:35 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42cb57f8b41so15192465e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 09:54:35 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2979e00sm16981566b.158.2024.09.26.09.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 09:54:33 -0700 (PDT)
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
X-Inumbo-ID: 02304502-7c28-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727369674; x=1727974474; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOoo4EKtPRFIE8HIHhg2CdM3Nn/tt0xPaUiavjCjh5s=;
        b=Fa6S8BXqSUyfiY/XCI3gZQQwnRCEgOkRyBT+CEVlSn56AaTORXehfje1pi7Z9gpKFp
         hEZjYJighwPeSGakXPZWq08J4AFU/V7VUMe04Oab8qEvABzEEe4mmdJMeT1qTMiZcKA9
         SAnksmFetKQIPvRwDACG8lC7rl5NyA5PjONeYuHvohPvGd2WjPMEF+5DP9sHBCvaCM8+
         b04DrfOPZmoLJAqp+c1+fX1YcCZoJnVDK582MS9E8Bn9fa4EEPhbX02zOjACJrtWtAS3
         qf2yK7DS7CFCVqi7btN4QFR8tuNjcUOExAWcGjtYNB8hv+Uv1sZIf3TnM0/rLzV6m8aV
         xh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727369674; x=1727974474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOoo4EKtPRFIE8HIHhg2CdM3Nn/tt0xPaUiavjCjh5s=;
        b=v7T8snq12OMlnnQwyQ07GgfS1EHBM2rWaPImH3mnHzS+s/G4X2l2h/IPaKG+bWcWP9
         jENvrorIOXp9NUXpAGMz4mFsraewt8PfrFshZbcn7rw6WMsgDFI2s01GVeAw8EGk46ao
         W5NN2Ep5O9CLDaNANP2Jm/va0vcI8COpmrFAq+gOHqe0ZqOpbNrLf0tTgBgGDsSrLMkW
         njmXhlyF3qmgrwPNKsxWMickLwDlQhDFmqAt+uqtgJguJaj/FYXCkagNUDpXs673k3yZ
         hTNL26dWTkeBIVqm/PAoP/99IsJlsXUniGsHBWQVKmQwypVfgYpqMPks1yBp8gvb4jCI
         GcvA==
X-Gm-Message-State: AOJu0Yz0vgcMdOp0FM41Mr22/NEDSUn0e5JQgKPZNXvRtBv1+AyAngGe
	eFDy0HECE5ATG3RIHUL5r7XGIrRQYo7cgJfZOOUp9xU7Si6vfRGGw3/Psw==
X-Google-Smtp-Source: AGHT+IHVFydoImr+LV17up08n5HYKJ9djPYqPRg6EgwtOFy6HXWX75X6Go6ebuOZdOGAUlNLyf7/Vw==
X-Received: by 2002:a05:6000:b8b:b0:374:c658:706e with SMTP id ffacd0b85a97d-37cd5b04975mr165768f8f.39.1727369673981;
        Thu, 26 Sep 2024 09:54:33 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 5/6] xen/riscv: add section for device information in linker script
Date: Thu, 26 Sep 2024 18:54:24 +0200
Message-ID: <b8b42cd4241ceb7f5b80c28579a421554300368f.1727365854.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727365854.git.oleksii.kurochko@gmail.com>
References: <cover.1727365854.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new `.dev.info` section in the RISC-V linker script to
handle device-specific information. This section is required by
common code (common/device.c: device_init(), device_get_class() ).
This section is aligned to `POINTER_ALIGN`, with `_sdevice` and `_edevice`
marking the start and end of the section, respectively.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - use newly refactored DT_DEV_INFO
---
Changes in V3:
 - use refactored DT_DEV_INFO macros.
---
 xen/arch/riscv/xen.lds.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 871b47a235..c1400e0613 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -1,4 +1,6 @@
 #include <xen/lib.h>
+
+#define SIMPLE_DECL_SECTION
 #include <xen/xen.lds.h>
 
 OUTPUT_ARCH(riscv)
@@ -91,6 +93,8 @@ SECTIONS
         CONSTRUCTORS
     } :text
 
+    DT_DEV_INFO(.dev.info)            /* Devicetree based device info */
+
     . = ALIGN(PAGE_SIZE);             /* Init code and data */
     __init_begin = .;
     .init.text : {
-- 
2.46.1


