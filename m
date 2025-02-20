Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BB3A3E2D7
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 18:44:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894056.1302913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlAb5-0005SK-1A; Thu, 20 Feb 2025 17:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894056.1302913; Thu, 20 Feb 2025 17:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlAb4-0005P8-QJ; Thu, 20 Feb 2025 17:44:26 +0000
Received: by outflank-mailman (input) for mailman id 894056;
 Thu, 20 Feb 2025 17:44:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zkM0=VL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tlAb3-000469-G8
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 17:44:25 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52767291-efb2-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 18:44:23 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5454f00fc8dso1123948e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 09:44:23 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54619e7bc2esm1600904e87.244.2025.02.20.09.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 09:44:22 -0800 (PST)
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
X-Inumbo-ID: 52767291-efb2-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740073463; x=1740678263; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYTq60dCm0oueVL7ngcy1QPIgBRII2BLwz0B+u62Oqo=;
        b=SyDpQzox84ZFdQ+pToXWHkVwygn6tqNtBQwhfPq60dNpurQqfL5edykJG5h5ibaR/6
         Ew7SjBY0E59+zDVoCZ2Ltt5CM97BJHdiztJbVwORnDXpLrlwAhQHg9FZpDWGCWQDcxUI
         2rqqikGYDsm68LnRDGlcIDRAksesahVqwXW6uyQ6E2+SimRqwa0uqtf3E6AJH4RSXDsK
         ELSsAO0qETRR0Zrz+zhbyIsuQHGycVA7T7YfjSsNNs/5Vazq4hI30wt+KMErhZeCSc2x
         phMQ6cjAgN4EWmxLA8kN+G0U20r47U2jn4Z6KYEFjD8tESMUx2i8mBTnDW4mqa0aLtDD
         Zj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740073463; x=1740678263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oYTq60dCm0oueVL7ngcy1QPIgBRII2BLwz0B+u62Oqo=;
        b=UnQu4XJpHUod/LFqH4VmvKljlc8YLydfI4W6lwdOYSliy0xmR+KSa7Y0vOiaqUYxlh
         n6QPXJ6tW/tP7hyGN/TMtWDN4tl7j2O57sQji3a0p8jcMPmVALVQ3y6hetAo+owdWTHz
         nFeeKEu8ws8fGVIXl6ED8vVuVo7GY6WlBcVNt2Z1iZeq6kIPjb6RSQzZ8qxFcI0pLL9/
         karWgcJH4CSnQv43uZ2rEUxXHfCMQXygij4ehJI6rwOQkMwGEtKZfVpqzvo4mn3KM+2V
         bm44xyTT/7Y/oHUaJ2HLS1317gjx+1XZGyvt2BeQTYTMxIVSW2fDDdN8/ZZpd+MPpfdo
         GtOA==
X-Gm-Message-State: AOJu0YyiGAFfTy367E+dhau6yEzrue9vlo0OTmKAJm1EZzjgrrqQ4s3l
	1TlNoCbxGJlirhGFOa35nE02awW0yUa6de0IciF419KRPG5Z25df7gS50g==
X-Gm-Gg: ASbGncunrFp1zYlt1DzCs7G0EyzfamAmPxZmDt7oxwxqYbreN/PRvVpAw+6rmPLC0AI
	7eWUXL7aw+vDQ7H/V5qXFasXBUFY97ypelqzPnQSJgFGgmXMrYRboGxzJVA4ZHMy3oc8gXB23iA
	YJV72vXxwGCZK8UHTf9xZmSgJgVdOkThc/v16lCLBV8oYQO1BXArUF2LXGy4eS5HfDGnUHOEbwV
	h1nQ3HEMU7BVupRTOcGIKbPYGZMXqHFxiZMagFKxlwgs54Q37pFh8kEsq4sSg9QLCOAhtW5W3Ip
	hZ54fVJOvQIMKZLc
X-Google-Smtp-Source: AGHT+IF7igNsSkCtNDbnRn7i1YCeJfkJ0ycL+wVg3wZGfVddXV0HgvlH6ptDFOf8mGCw78AvBWzmJw==
X-Received: by 2002:a05:6512:159a:b0:545:291:7ee0 with SMTP id 2adb3069b0e04-5462ef1c613mr3923529e87.34.1740073462981;
        Thu, 20 Feb 2025 09:44:22 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for 4.21 v7 1/4] automation: drop debian:11-riscv64 container
Date: Thu, 20 Feb 2025 18:44:12 +0100
Message-ID: <659bd8c00e79be1a47fc2aae75accd69b3bedaf4.1740071755.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740071755.git.oleksii.kurochko@gmail.com>
References: <cover.1740071755.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two reasons for that:
1. In the README, GCC baseline is chosen to be 12.2, whereas Debian 11
   uses GCC 10.2.1.
2. Xen requires mandatory some Z extensions, but GCC 10.2.1 does not
   support Z extensions in -march, causing the compilation to fail.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v7:
 - new patch.
---
 automation/gitlab-ci/build.yaml | 14 --------------
 automation/scripts/containerize |  1 -
 2 files changed, 15 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 35e224366f..57fe29127d 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -720,20 +720,6 @@ debian-12-ppc64le-gcc:
     HYPERVISOR_ONLY: y
 
 # RISC-V 64 cross-build
-debian-11-riscv64-gcc:
-  extends: .gcc-riscv64-cross-build
-  variables:
-    CONTAINER: debian:11-riscv64
-    KBUILD_DEFCONFIG: tiny64_defconfig
-    HYPERVISOR_ONLY: y
-
-debian-11-riscv64-gcc-debug:
-  extends: .gcc-riscv64-cross-build-debug
-  variables:
-    CONTAINER: debian:11-riscv64
-    KBUILD_DEFCONFIG: tiny64_defconfig
-    HYPERVISOR_ONLY: y
-
 debian-12-riscv64-gcc:
   extends: .gcc-riscv64-cross-build
   variables:
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index bc43136078..0953e0728c 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -31,7 +31,6 @@ case "_${CONTAINER}" in
     _fedora) CONTAINER="${BASE}/fedora:41-x86_64";;
     _bullseye-ppc64le) CONTAINER="${BASE}/debian:11-ppc64le" ;;
     _bookworm-ppc64le) CONTAINER="${BASE}/debian:12-ppc64le" ;;
-    _bullseye-riscv64) CONTAINER="${BASE}/debian:11-riscv64" ;;
     _bookworm-riscv64) CONTAINER="${BASE}/debian:12-riscv64" ;;
     _bookworm-x86_64-gcc-ibt) CONTAINER="${BASE}/debian:12-x86_64-gcc-ibt" ;;
     _bookworm|_bookworm-x86_64|_) CONTAINER="${BASE}/debian:12-x86_64" ;;
-- 
2.48.1


