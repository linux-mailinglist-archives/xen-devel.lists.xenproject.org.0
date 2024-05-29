Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA458D3F26
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 21:55:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732327.1138328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCPOO-0005KV-NB; Wed, 29 May 2024 19:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732327.1138328; Wed, 29 May 2024 19:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCPOO-0005FX-HA; Wed, 29 May 2024 19:55:24 +0000
Received: by outflank-mailman (input) for mailman id 732327;
 Wed, 29 May 2024 19:55:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DI5e=NA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCPOM-0003Q0-2p
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 19:55:22 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6115c601-1df5-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 21:55:20 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52ae38957e8so180184e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 12:55:20 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5297066b249sm1344203e87.178.2024.05.29.12.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 12:55:19 -0700 (PDT)
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
X-Inumbo-ID: 6115c601-1df5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717012520; x=1717617320; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hr0rCeOkEj/7qjuywq9V+WOZcGXF4MF4JxLpkyei6eA=;
        b=cEmnx+D3ywjqDiQ61TqSFWgsXFMvhEbYnI/hRZEw8VaE8AEDKhpM2CW7mNyuIYjKya
         YTWqefzvZRF7/t7Ip+0l5WO5po5RT7mRuvyOL9IL6IGHp4U/3IQSKbQ8imhZI1zmf6pb
         3g/7cKLnCa03a5u/aqvKL0efgsaSeSzrKQOXVNr06o44+ldfZhnsCv93UAR/CdIjv7YJ
         LWy5nfyWpJ718esvrHeBwKdwX1qS5o3l2krweiFz5nIjGjJ/pMQ7pxqbgrxu5tl3t0ZM
         ahiqdLG8kVb4Wdw4B4R3Uww4F08lkBWJcT4jWadlTN3SIHJr7BuHAi1ysCI5rLe7zJkF
         vD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717012520; x=1717617320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hr0rCeOkEj/7qjuywq9V+WOZcGXF4MF4JxLpkyei6eA=;
        b=rX4lmIOo87FzgGPJ+4n2W3oTC1Fa2k6e9uWPegTvePDCFwGeuZkfY+xVAF7YMQj34A
         z78e3WZej2K9SuRTf1872jmtEfqC54USl/WZUJxU5roS17M5fjdPwY/2HmoIHtsMlBjq
         uBak8n48sLvHxJYVX/TB5iQLD6qmiKiS0k/VgnNIcpFTRs8EG1uPXLMKxDO5Cbrxnf3v
         qE0S7Y4UXfmz5p2sWcjEOuzJLstXCH6LgEE50AtX+rgNxawUxJr0vR++z6VOs6JbCUq9
         wmnQcZziRDthkJlTb6K6rK58pt6/48JfiY2r7aLMD3z9ZSJCqxIUutLIX2yYOQn/uV3U
         nopQ==
X-Gm-Message-State: AOJu0YyRiAvqDZ/6EkIWOINDsFwL8dty0934uUF/zQaFlGwmAy4UZqwZ
	jQDgo05jYQds2WAwg8OuNSpBdj+gAFHO1sRSw4T377iacblFauylF51V4x2v
X-Google-Smtp-Source: AGHT+IHZb5bjx6as4NkrWWXbmTHBBqMPT5aoF6PiwOXbVfFYazz9oHCuIHZn3+RaT6A7TSxMotIgCg==
X-Received: by 2002:a05:6512:40b:b0:528:4841:e4a1 with SMTP id 2adb3069b0e04-52b7d432e94mr105642e87.40.1717012519811;
        Wed, 29 May 2024 12:55:19 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v12 8/8] xen/README: add compiler and binutils versions for RISC-V64
Date: Wed, 29 May 2024 21:55:09 +0200
Message-ID: <c6ff49af9a107965f8121862e6b32c24548956e6.1717008161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1717008161.git.oleksii.kurochko@gmail.com>
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch doesn't represent a strict lower bound for GCC and
GNU Binutils; rather, these versions are specifically employed by
the Xen RISC-V container and are anticipated to undergo continuous
testing. Older GCC and GNU Binutils would work,
but this is not a guarantee.

While it is feasible to utilize Clang, it's important to note that,
currently, there is no Xen RISC-V CI job in place to verify the
seamless functioning of the build with Clang.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
--
Changes in V5-V12:
 - Nothing changed. Only rebase.
---
 Changes in V6:
  - update the message in README.
---
 Changes in V5:
  - update the commit message and README file with additional explanation about GCC and
    GNU Binutils version. Additionally, it was added information about Clang.
---
 Changes in V4:
  - Update version of GCC (12.2) and GNU Binutils (2.39) to the version
    which are in Xen's contrainter for RISC-V
---
 Changes in V3:
  - new patch
---
 README | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/README b/README
index c8a108449e..30da5ff9c0 100644
--- a/README
+++ b/README
@@ -48,6 +48,10 @@ provided by your OS distributor:
       - For ARM 64-bit:
         - GCC 5.1 or later
         - GNU Binutils 2.24 or later
+      - For RISC-V 64-bit:
+        - GCC 12.2 or later
+        - GNU Binutils 2.39 or later
+          Older GCC and GNU Binutils would work, but this is not a guarantee.
     * POSIX compatible awk
     * Development install of zlib (e.g., zlib-dev)
     * Development install of Python 2.7 or later (e.g., python-dev)
-- 
2.45.0


