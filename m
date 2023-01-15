Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A551066B0A6
	for <lists+xen-devel@lfdr.de>; Sun, 15 Jan 2023 12:31:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477862.740795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pH1ES-0005gO-Ny; Sun, 15 Jan 2023 11:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477862.740795; Sun, 15 Jan 2023 11:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pH1ES-0005aq-Eg; Sun, 15 Jan 2023 11:31:24 +0000
Received: by outflank-mailman (input) for mailman id 477862;
 Sun, 15 Jan 2023 11:31:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytYW=5M=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1pH1EQ-0004ci-BW
 for xen-devel@lists.xenproject.org; Sun, 15 Jan 2023 11:31:22 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22474e46-94c8-11ed-91b6-6bf2151ebd3b;
 Sun, 15 Jan 2023 12:31:20 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id cf18so55655629ejb.5
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jan 2023 03:31:20 -0800 (PST)
Received: from dsemenets-HP-EliteBook-850-G8-Notebook-PC.. ([91.219.254.73])
 by smtp.gmail.com with ESMTPSA id
 uj42-20020a170907c9aa00b0084d4e612a22sm7459961ejc.67.2023.01.15.03.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 03:31:19 -0800 (PST)
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
X-Inumbo-ID: 22474e46-94c8-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBd+hmBQgXZkrJPkk2A6G6FhZeqNtc7f2zf0tt6B+Y4=;
        b=A6g4LBmvHkUjz9gzJSTm8njOCHRcxbwKot/vnTJEsRj2KBagbqA4nLR7ENR61+Kv4K
         ZIaflMDApL5DvuJO865GIau25biBL5Vle+LSr0/P4rFK26j6uZjVEXxKXk7QMVie6doB
         t4Ope3jJK+eVqWJV9chTrR0/uH6lQFQge1zkxtIGKHib7vofe6zcBuG2xPN9B4rVAc2R
         uQ8RE/JmllneEKwOVLzxc8/cUL4lYQnrKx4sgs3InX07lSkxZfL9Wrw0FtEwa7v495If
         Z+Vcc7/ibHupzF0hurL4mpfEbWcWTYny7mz841/j/rEimBsv4tMCJA5SpjDEeZQNUXoq
         qwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBd+hmBQgXZkrJPkk2A6G6FhZeqNtc7f2zf0tt6B+Y4=;
        b=B+cumoEnK7mJ6mVDrDOJtSlG58sqvfHNR0NB5W9OQPDa53JcnAKMFwHAMlV2CSLUoQ
         IUxYkd4jj2Vw7jadY3/7k0UxHH/UG+eJi6WF5zW+lZsMwqC2qmtaUtjyUJal4pQQpmAD
         OtFNuhgfC//rjNbS0sgzv6n3s5AI6CUiVxtayTF2534sjHiVkMWYe0y2sT+bGA55k+Q/
         UZXF1espRGPvhe5xT0um1almIHXyYvlCAYGAptaIWJit7wSQxJfNywf9gtU667bjEZLC
         NqgCZhbr4TnpWiWj5LWOp08kLrZrmDLB0A0AppjlD4PySwu5mw9q6ncGS+O86a97O6YA
         m+pQ==
X-Gm-Message-State: AFqh2koabTYkHHIohMNP0MCHU9Jrp87IfKm1vcMqs92UamVGpJY2ODXT
	ol3AlwsnqiDKbDpVfBLVoNDOz4RvGV0QPeqx
X-Google-Smtp-Source: AMrXdXszUm9sdvZugQmrnDnG84ZBeP8VU310ltdSm5Vq5MqV8JhaKIifUaao3soTTYzNSyY9yBG+jg==
X-Received: by 2002:a17:906:2813:b0:829:59d5:e661 with SMTP id r19-20020a170906281300b0082959d5e661mr74258838ejc.29.1673782280151;
        Sun, 15 Jan 2023 03:31:20 -0800 (PST)
From: Dmytro Semenets <dmitry.semenets@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC PATCH v3 05/10] tools/light: pci: describe [MAKE|REVERT]_ASSIGNABLE commands
Date: Sun, 15 Jan 2023 13:31:06 +0200
Message-Id: <20230115113111.1207605-6-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230115113111.1207605-1-dmitry.semenets@gmail.com>
References: <20230115113111.1207605-1-dmitry.semenets@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Add protocol for two more commands, one to make a PCI device
assignable, and other - to revert its state back.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 tools/include/pcid.h | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tools/include/pcid.h b/tools/include/pcid.h
index 452bdc11cf..118f8105cf 100644
--- a/tools/include/pcid.h
+++ b/tools/include/pcid.h
@@ -98,6 +98,44 @@
 #define PCID_CMD_LIST_ASSIGNABLE        "list_assignable"
 #define PCID_MSG_FIELD_DEVICES          "devices"
 
+/*
+ *******************************************************************************
+ * Make device assignable
+ *
+ * This command makes given device assignable by ensuring that OS
+ * will not try to access it.
+ *
+ * Request (see other mandatory fields above):
+ *  - "cmd" field of the request must be set to "make_assignable".
+ *  - "sbdf" SBDF of the device in format defined by PCID_SBDF_FMT.
+ *  - "rebind" = true if daemon needs to save original driver name,
+ *    so device later can be rebound back.
+ *
+ * Response (see other mandatory fields above):
+ *  - "resp" field of the response must be set to "make_assignable".
+ */
+#define PCID_CMD_MAKE_ASSIGNABLE        "make_assignable"
+#define PCID_MSG_FIELD_REBIND           "rebind"
+
+/*
+ *******************************************************************************
+ * Revert device from assignable state
+ *
+ * This command reverts effect of "make_assignable" command. Basically,
+ * now device can be used by OS again.
+ *
+ * Request (see other mandatory fields above):
+ *  - "cmd" field of the request must be set to "revert_assignable".
+ *  - "sbdf" SBDF of the device in format defined by PCID_SBDF_FMT.
+ *  - "rebind" = true if daemon needs to rebind device back to it's
+ *    original driver, which name was saved by "make_assignable" command
+ *
+ * Response (see other mandatory fields above):
+ *  - "resp" field of the response must be set to "revert_assignable".
+ */
+#define PCID_CMD_REVERT_ASSIGNABLE      "revert_assignable"
+
+
 int libxl_pcid_process(libxl_ctx *ctx);
 
 #endif /* PCID_H */
-- 
2.34.1


