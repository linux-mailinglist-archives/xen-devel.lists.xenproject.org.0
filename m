Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8987A05BD7
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 13:43:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867241.1278691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVVP8-00043d-II; Wed, 08 Jan 2025 12:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867241.1278691; Wed, 08 Jan 2025 12:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVVP8-00040a-FZ; Wed, 08 Jan 2025 12:43:22 +0000
Received: by outflank-mailman (input) for mailman id 867241;
 Wed, 08 Jan 2025 12:43:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UrZA=UA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tVVP7-00040U-CV
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 12:43:21 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 234b4a41-cdbe-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 13:43:19 +0100 (CET)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so119644275e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 04:43:19 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e92f6dsm19488485e9.41.2025.01.08.04.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 04:43:17 -0800 (PST)
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
X-Inumbo-ID: 234b4a41-cdbe-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736340198; x=1736944998; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AhJ0XqV0uUxMeiwSIzR7h7QIT6TIMzwX/Ln5MLcHnmU=;
        b=VTu42J/hpu9c+GLuu5xy17RkE9mhfBOam/XU6IeMGzdWHge4pLlJXglA2gVKuod4E9
         lbcC/4cR30v7+FcQYN0F6Rt6UfBXDfdsuO1ymxYsSV2q/vgCRnL5AQ87KxhbJqb+0K/B
         QevfgP7XM+tKm4aK00EHaWiyIKZC8oU1tDFZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736340198; x=1736944998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhJ0XqV0uUxMeiwSIzR7h7QIT6TIMzwX/Ln5MLcHnmU=;
        b=FbKulChYxoeUxG+/du1MkGkc8lzoz5Xr3Ja9NYIRXCQxc+HyyVzJIUTnGZf4ci7GnF
         VMV4R/j9GKx9tPrx9mQ8ngXR0dC1Sy14wseotcjMWhb9zVfX+V8ymavk0ADkD1NJLx1j
         QtzKPXSPIdS2DusIo8CaES1ZxbLznG6nPZR0N+bKzbJAxWWTcxO6BdHIzxf8avdl0Cec
         e+xjKZK95jaS0Jkrqzwq1B5BRxrGhE7Y0OAhUBkwUqJhUtwXkP/IwDqJN++m3gLt5xyz
         2ODUBLVZkmPikSXsHwSfEdSZo5SUqeM2advLUR2rt0rR+7PsO/fJIJSCJavmOEJ57GWv
         XlyA==
X-Gm-Message-State: AOJu0YwcW3vImwJk10Nn+JAam6CuAdtLWX4rcb4koIl1l4IZMyCXJ8VL
	O6onfStLOtlCeQPLFfw6ftQW/XTBm4mJyxHpliLbdsytfcCq3sLoKfIHfiP2s30V6aOdDQ2qj7D
	M2D5UBYZd
X-Gm-Gg: ASbGncvdMGepkvWXXOrx8hkJpnllrkHn0E/LCOgOx7yM9JHrupXg8/WS8obZ4B8HTXU
	mzC4gTxTng0EUhl0GyASsJHCVmvV2Q9bdMBaqyRp2FObr8xbM2NHXh8aWNSsXQ9JME0TfTQ1C6v
	jfloFSTm54TY0e0k9M1qF2e2xY1uYQW3zVmdZ8EnH1gL4x/zS1dbAxDWiRg0VP2UlTo8LRKik0s
	gbtxPse93XXWQtSLvh637lnkThUeOPZtqR2TXxHG7KL9YZa5Jl+Hsx/E5AJofZNdlB4WG+qRK1p
	AUySm9M+CDgsH065BBzhInHw7CChcbkh4YWT
X-Google-Smtp-Source: AGHT+IEJh3zsYwwJQ1at6WrX2AoGDz6QQY8BsMJU8UW9wiHXc/5DHGHwoTBlZZQjUmkG5j99VmjdBg==
X-Received: by 2002:a05:600c:198c:b0:435:306:e5dd with SMTP id 5b1f17b1804b1-436e26f47e0mr19552965e9.22.1736340197914;
        Wed, 08 Jan 2025 04:43:17 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH for-4.20] CI: Update Fedora to 41
Date: Wed,  8 Jan 2025 12:43:16 +0000
Message-Id: <20250108124316.1107121-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1616092048
---
 .../fedora/{40-x86_64.dockerfile => 41-x86_64.dockerfile} | 2 +-
 automation/gitlab-ci/build.yaml                           | 8 ++++----
 automation/scripts/containerize                           | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename automation/build/fedora/{40-x86_64.dockerfile => 41-x86_64.dockerfile} (97%)

diff --git a/automation/build/fedora/40-x86_64.dockerfile b/automation/build/fedora/41-x86_64.dockerfile
similarity index 97%
rename from automation/build/fedora/40-x86_64.dockerfile
rename to automation/build/fedora/41-x86_64.dockerfile
index 7d4d4cc2ac0a..8032a2098632 100644
--- a/automation/build/fedora/40-x86_64.dockerfile
+++ b/automation/build/fedora/41-x86_64.dockerfile
@@ -1,5 +1,5 @@
 # syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 fedora:40
+FROM --platform=linux/amd64 fedora:41
 LABEL maintainer.name="The Xen Project"
 LABEL maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 41f17ed45641..3abd2a0c6575 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -572,15 +572,15 @@ debian-12-x86_32-gcc-debug:
   variables:
     CONTAINER: debian:12-x86_32
 
-fedora-40-x86_64-gcc:
+fedora-41-x86_64-gcc:
   extends: .gcc-x86-64-build
   variables:
-    CONTAINER: fedora:40-x86_64
+    CONTAINER: fedora:41-x86_64
 
-fedora-40-x86_64-gcc-debug:
+fedora-41-x86_64-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: fedora:40-x86_64
+    CONTAINER: fedora:41-x86_64
 
 ubuntu-16.04-x86_64-clang:
   extends: .clang-x86-64-build
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index d72c22c103ff..bc43136078e3 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -28,7 +28,7 @@ case "_${CONTAINER}" in
     _alpine-arm64v8) CONTAINER="${BASE}/alpine:3.18-arm64v8" ;;
     _archlinux|_arch) CONTAINER="${BASE}/archlinux:current" ;;
     _centos7) CONTAINER="${BASE}/centos:7" ;;
-    _fedora) CONTAINER="${BASE}/fedora:40-x86_64";;
+    _fedora) CONTAINER="${BASE}/fedora:41-x86_64";;
     _bullseye-ppc64le) CONTAINER="${BASE}/debian:11-ppc64le" ;;
     _bookworm-ppc64le) CONTAINER="${BASE}/debian:12-ppc64le" ;;
     _bullseye-riscv64) CONTAINER="${BASE}/debian:11-riscv64" ;;
-- 
2.39.5


