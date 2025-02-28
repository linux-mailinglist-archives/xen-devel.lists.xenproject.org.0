Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC51A4A380
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 21:08:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899110.1307565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to6ec-0006Ls-GA; Fri, 28 Feb 2025 20:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899110.1307565; Fri, 28 Feb 2025 20:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to6ec-0006Jy-D1; Fri, 28 Feb 2025 20:08:14 +0000
Received: by outflank-mailman (input) for mailman id 899110;
 Fri, 28 Feb 2025 20:08:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kAP=VT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1to6eb-0005qk-D9
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 20:08:13 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd019b71-f60f-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 21:08:12 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aaec111762bso444385366b.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2025 12:08:12 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf1d1a84b7sm267586566b.19.2025.02.28.12.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 12:08:10 -0800 (PST)
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
X-Inumbo-ID: bd019b71-f60f-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740773291; x=1741378091; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SclTt5Pgit0PP/TdmqWdO1AQEQ1APmea/Hhs2JbuaM=;
        b=BY4MHAmLiB3dT0mX0Du2U7PWJB4DAgITDu7k22kantSFm8sA0xPevxUV+l0gaEwh0z
         MiPyIA32tYs4vg2CIOkqPu4qmRH17elhB8YBv85gBM4JOut+J0eJwYirmz9QEh6/t2Gy
         Q4z/bYpKtWNibui8yB279frbdkSfCcYshqgvH8i3ptYrAruhV1BZfm7C/FfJqESmjqfO
         LGx1EW/ZHfv+qVX1+sGCX3TN5meQ6v8iRlWNJFbsjaPipB78Xqv/1hKY47wqUVXgx+Yp
         qwk2SydcVJsQG/iqFDLl06J6pziYgIx2VUMnSHVud12SWt/57EgC6O3hAbxJqIyHvBfr
         Oixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740773291; x=1741378091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SclTt5Pgit0PP/TdmqWdO1AQEQ1APmea/Hhs2JbuaM=;
        b=sOgUpp8pU/l2UqYWTTBwfQ/X63m4Rh5DDInOl3BY0l83282XLEz5vsmpasQyNYG7/Y
         Uyqk7zQ90o+m5vwMMccFvvYj8D0/Y/Ru9DO0mEnHv7wXn6xTMXZ4d6Ob3MBKfZ9Ij5ub
         HKqHDL5iv9HF3lVc2P0LIkWhievY3vVsaOIaXOtjRIb3VCJD8n+Jjp8KCc9QQ/vHGXlu
         fmSbMk67+QCTx6DPhS2Ek1/kamsWEdiQNpX6pGaPCJx4bV5XnbV4JxcpSUr6vFhA8Yko
         toPmw69gmP05jgeoegMgp0NOx9xqpVx357EKg9TJoAMQfQxiM/+uOgulG6Rs8f4VFzcs
         JbXg==
X-Gm-Message-State: AOJu0Yx7tPply8mM9eZQvTjiafCeW8feIqq0e7VGoLHBVFD4nN5cOhDy
	UWAaoRgLmS8lyFckVhP80NAMYsgqD9DQav+jUf573xk449x5EC9HDlpp0w==
X-Gm-Gg: ASbGncvzFkbQkVTAxMEPyg1QIiZcsaoUJiGC7gQelHOZIe/BnrlU5AiXPYDxFyQl/L4
	Yb+M6pfj9xHL16hJGxcRjgJXbkQvy8Jc+7C+chmk3oVklj9K4gXEaXL59rxomXkuFe/U9pRSBSd
	wEM+y0wmvy0DuAtpjq/UoAeaabXVJIJHVuUlE2UP8DBAcfHtZOGuYWICPiYam1+06rs9M001xPz
	8as725JI1vIK7jK2hTp3wlWyhNVfB7PdwmDVNsOI9Nlkg7wPrGaXlY0ygZHk39rEpzSKaQ6QFDw
	yYOO2L0KG8hxAycCyPKF+TFOZjA=
X-Google-Smtp-Source: AGHT+IEe1PPU09yR75EdHcU2OsxNWcBWiQ11r8vhslxZrZfXeUmNVquV7IPr0Eyq6eYamGc/Z7Y9ug==
X-Received: by 2002:a17:907:6090:b0:abe:fa1a:4eab with SMTP id a640c23a62f3a-abf260d496dmr561542266b.25.1740773291228;
        Fri, 28 Feb 2025 12:08:11 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 2/6] automation: drop debian:11-riscv64 container
Date: Fri, 28 Feb 2025 21:07:40 +0100
Message-ID: <184f15497204d1bb464bf871f70de105ce8851b2.1740764258.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740764258.git.oleksii.kurochko@gmail.com>
References: <cover.1740764258.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two reasons for that:
1. In the README, GCC baseline is chosen to be 12.2, whereas Debian 11
   uses GCC 10.2.1.
2. Xen requires mandatory some Z extensions, but GCC 10.2.1 does not
   support Z extensions in -march, causing the compilation to fail.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V8:
 - Nothing changed except that now it has dependency from the
   previous commit which adds information about GCC to README
   and thereby clarify the commit message of the current commit.
---
Changes in V7:
 - new patch
---
 automation/gitlab-ci/build.yaml | 14 --------------
 automation/scripts/containerize |  1 -
 2 files changed, 15 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 6a2e491534..b952a59c06 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -723,20 +723,6 @@ debian-12-ppc64le-gcc:
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


