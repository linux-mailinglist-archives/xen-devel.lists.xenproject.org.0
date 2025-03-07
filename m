Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E48AA56BC2
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 16:20:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905145.1312969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqZUT-0002NT-I1; Fri, 07 Mar 2025 15:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905145.1312969; Fri, 07 Mar 2025 15:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqZUT-0002M1-F7; Fri, 07 Mar 2025 15:19:57 +0000
Received: by outflank-mailman (input) for mailman id 905145;
 Fri, 07 Mar 2025 15:19:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxnO=V2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tqZUS-0002Lv-0D
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 15:19:56 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f8f07fa-fb67-11ef-9ab6-95dc52dad729;
 Fri, 07 Mar 2025 16:19:55 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3910e101d0fso1107778f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 07:19:55 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c1030cfsm5728880f8f.90.2025.03.07.07.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 07:19:53 -0800 (PST)
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
X-Inumbo-ID: 9f8f07fa-fb67-11ef-9ab6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741360794; x=1741965594; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ixUV0Bf7whqnnPrTuPptPAyhW7N8Z5HGcEiryb8H3I=;
        b=GPuU9NobqOqVZMCJZGZ319B6F0uho9a0MPMH8Smqp6gMBgFTPTHnmuabwQCJNSTeqW
         aM/N5c21KDUk9kK20N9uZYvIUU3ewW7GLh4EndC5Xj2C1IPwyScnrI0oQynn5binUmpo
         4lk4RsL81GmQcvVX7ZqLPaw00khH8MKxyl9x8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741360794; x=1741965594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ixUV0Bf7whqnnPrTuPptPAyhW7N8Z5HGcEiryb8H3I=;
        b=CJTdN3Kx8uCseyj875QaatJbjod9Q7grjuGz6cC/qCix3i2qfEs0iU6IBAkoq3L3y6
         4ByzBKqNAEZIiDOfkVe+K/JAjGla361Jc9hMa0wfx2hEuSm2IleC2uwnU/2RqJT1ZE9u
         rMiNyCGGwYWkyTerfj17MIGqRijXMCc+L5vHAa0CwV7R1zrXsFkqDIykXWkO5IpEJjeA
         XWqAZEfbmaNQHJqSWn5ZNucVAA0RXaGdPImM7tF/8Wo2V5AlnAa0J8sNoZyU7i1BPNdp
         Ai0Wth0P343vpk2p0FbqO2MEdIaqGTk5hABL/cmIigiSOzPZkm+hBC33MEm/74zrRcft
         iYig==
X-Gm-Message-State: AOJu0YxI0kyf2V3EMUhjEKJSUkQbeb6yKdqc7X0wZUkT3ADud3o+eANp
	6MbIeI1EJm7t4ezVeBv88Wj3WYrUadtMwvA1XWGJ8FnhzWrf6Y0wtJwfjho67zIjHN9TkxZnjBv
	B
X-Gm-Gg: ASbGncuT8PFkCYXVcgTtAHchSk7qz6T91ya/QKrYRZrTdDCLOnlOuHd9Ph1Y6SvzY7p
	iMYcV4mRde3zUldJWxX5IMWKzCnhSmBz1V/SsUD/dGE4RNxk7tpT1OkU5RhmJx76EgT+bfZeHvD
	VietZdEd/FgeVk25vY1O0KS8n+xtRaY2N+T5ciCvPkxJ3PTSWCGTCSBr7j3uxa0DF/Mn9ogUijP
	GNEUGl6F5ZUK6LzlyeFQRvGuzEhXhmDsepAIccG44geQlS49m4sOQRpnEkQxlgFuDxTxvLB+18L
	jbIZz5RYS/YtlEz06OLx1axKZF/IGdQk2yEpaerBcqCpsLaT4YFcZo/u2HJp+AYImjGR1qtu1eI
	ECxQpsPu6w2h2vluhgiuC1WmN
X-Google-Smtp-Source: AGHT+IGG8EHzowSzuN9OQfNAg6Kj3VXDM72VlCav9HtQczkegIZtRlaT61BKor6uFZXI3hAZlxGWyA==
X-Received: by 2002:a05:6000:2b07:b0:390:f1cb:286e with SMTP id ffacd0b85a97d-39132d771a1mr1955533f8f.27.1741360794194;
        Fri, 07 Mar 2025 07:19:54 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] CI: Drop the now-obsolete 11-riscv64.dockerfile
Date: Fri,  7 Mar 2025 15:17:49 +0000
Message-Id: <20250307151749.3066186-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes: bd9bda50553b ("automation: drop debian:11-riscv64 container")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/build/debian/11-riscv64.dockerfile | 33 -------------------
 1 file changed, 33 deletions(-)
 delete mode 100644 automation/build/debian/11-riscv64.dockerfile

diff --git a/automation/build/debian/11-riscv64.dockerfile b/automation/build/debian/11-riscv64.dockerfile
deleted file mode 100644
index a55047c5019a..000000000000
--- a/automation/build/debian/11-riscv64.dockerfile
+++ /dev/null
@@ -1,33 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 debian:bullseye-slim
-LABEL maintainer.name="The Xen Project"
-LABEL maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV DEBIAN_FRONTEND=noninteractive
-ENV CROSS_COMPILE=riscv64-linux-gnu-
-ENV XEN_TARGET_ARCH=riscv64
-
-RUN <<EOF
-#!/bin/bash
-    set -e
-
-    useradd --create-home user
-
-    apt-get update
-
-    DEPS=(
-        # Xen
-        bison
-        build-essential
-        checkpolicy
-        flex
-        gcc-riscv64-linux-gnu
-        python3-minimal
-    )
-
-    apt-get -y --no-install-recommends install "${DEPS[@]}"
-    rm -rf /var/lib/apt/lists/*
-EOF
-
-USER user
-WORKDIR /build
-- 
2.39.5


