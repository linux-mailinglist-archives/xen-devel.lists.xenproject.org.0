Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B6483DDC3
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 16:42:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672090.1045763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTOLO-0002um-Uj; Fri, 26 Jan 2024 15:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672090.1045763; Fri, 26 Jan 2024 15:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTOLO-0002qt-Pl; Fri, 26 Jan 2024 15:42:14 +0000
Received: by outflank-mailman (input) for mailman id 672090;
 Fri, 26 Jan 2024 15:42:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DqdW=JE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rTOLN-0002k9-IV
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 15:42:13 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7905a9bd-bc61-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 16:42:12 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5100c2f7a16so458697e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 07:42:12 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 q5-20020ac25105000000b0050e7ec49881sm208351lfb.21.2024.01.26.07.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 07:42:11 -0800 (PST)
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
X-Inumbo-ID: 7905a9bd-bc61-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706283732; x=1706888532; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9frqrEGnz0W4k7a7XllRVu4rPLg+BpM3QOeHeG0pwG0=;
        b=IGdWECKa3A19Z3sQxraETJabPBn83yrgG9gXgdG46AvRLdNMTnDKsX5/MT2QblWhT+
         0pUH6MP1zVtc9rd/z7rrb/9y/ZR5asQLVcuwcB53PI5BcCZCjk/KmXgtWtOdIeG2TS1N
         /l5XnSP+euVS+MvtlEKzO/gX4P6cX01xC/zn0iJbkDFlIUp3x+vHQulA4+y72Htko0Zl
         rW/x/NhCaQ1zYOGJqFfIW6b8zkphz2wnMi56D+TVc9EhbFs+r4AJ5Yg1VXEBVO9D6DjR
         /hK94uBMrLMIhIHeBOQKq2Nk+RuJ0QuH0rCEgaa3mV6qOEIWMnYcIbPuZMBZzagCvZaW
         dEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706283732; x=1706888532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9frqrEGnz0W4k7a7XllRVu4rPLg+BpM3QOeHeG0pwG0=;
        b=ErzYlw7kKQsY3MJMNw3zL5ppNkEl1EMeI4juJlXIcYzrcuxSqizbxlA2P3LkPYQ07x
         +g5U7cE9GTqVnmaECdBKmxU9Z9xjzOVuxeC43uWvznpmGQ92fQ+7m6TeEPd2g4HXz1In
         a/C7uGadpNjg6WHTO4bpLjjzV8DOdRJAXZnM7FQqqmwCln9ccb08e4oS65Il9oGjHWOs
         8k2oan4bv9vQACe1zcxXWCZguyQxD97XkTM7f5GbtUXKq/qsbTqPb/ijadboS8+wxu5c
         a/hQaEKnxJeuJuJXBZ7NrKymxJl+8caI6X136KUlZZS37c+g63GOkUtOemXHQeuMK9KA
         61rA==
X-Gm-Message-State: AOJu0Yy4hZU3rZIJ0HxpWiwRuPgtQYKg9hSkdlhwvFMRZO/Qj7H5RECl
	1bRV6C9V8MlfLy46caTwto39a8hJpcYegjzCMPU3cehnw7ePXzJCR9Ft7Xgo
X-Google-Smtp-Source: AGHT+IE3qzD0ycJ8aiiklcdFzLB2L8rKX5f2U3LKuisq5f7IpONyuxZcQKGG95f6dysttMDBOZDcAw==
X-Received: by 2002:a19:6457:0:b0:510:1489:b5a8 with SMTP id b23-20020a196457000000b005101489b5a8mr795186lfj.4.1706283731496;
        Fri, 26 Jan 2024 07:42:11 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 1/7] automation: ensure values in EXTRA_FIXED_RANDCONFIG are separated by new line
Date: Fri, 26 Jan 2024 17:42:01 +0200
Message-ID: <0350f75605245b2300ba3c5d46d004c387e89687.1706281994.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706281994.git.oleksii.kurochko@gmail.com>
References: <cover.1706281994.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kconfig tool expects each configuration to be on a new line.

The current version of the build script puts all of ${EXTRA_FIXED_RANDCONFIG}
in a single line and configs are seperated by spaces.

As a result, only the first configuration in ${EXTRA_FIXED_RANDCONFIG} will
be used.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V7:
 - Nothing changed. Only rebase
---
Changes in V6:
 - The patch was introduced in this version of patch series.
---
 automation/scripts/build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index b3c71fb6fb..13b043923d 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -14,7 +14,7 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
 
     # Append job-specific fixed configuration
     if [[ -n "${EXTRA_FIXED_RANDCONFIG}" ]]; then
-        echo "${EXTRA_FIXED_RANDCONFIG}" >> xen/tools/kconfig/allrandom.config
+        sed "s/ /\n/g" <<< "${EXTRA_FIXED_RANDCONFIG}" > xen/tools/kconfig/allrandom.config
     fi
 
     make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
@@ -28,9 +28,11 @@ else
     echo "CONFIG_DEBUG=${debug}" >> xen/.config
 
     if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
-        echo "${EXTRA_XEN_CONFIG}" >> xen/.config
+        sed "s/ /\n/g" <<< "${EXTRA_XEN_CONFIG}" >> xen/.config
     fi
 
+    cat xen/.config
+
     make -j$(nproc) -C xen olddefconfig
 fi
 
-- 
2.43.0


