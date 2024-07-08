Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BEB92A847
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 19:35:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755532.1163938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQsGy-0000m3-Vg; Mon, 08 Jul 2024 17:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755532.1163938; Mon, 08 Jul 2024 17:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQsGy-0000kR-ST; Mon, 08 Jul 2024 17:35:32 +0000
Received: by outflank-mailman (input) for mailman id 755532;
 Mon, 08 Jul 2024 17:35:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DP+Y=OI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sQsGx-0000H0-A9
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 17:35:31 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 784d22d8-3d50-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 19:35:29 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-58b0beaf703so5151328a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 10:35:29 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6bc88csm11603666b.6.2024.07.08.10.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 10:35:26 -0700 (PDT)
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
X-Inumbo-ID: 784d22d8-3d50-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720460128; x=1721064928; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJtHp8tty+WfmySIL4PeN7k5ySN/iHKXnLF29O6pnIA=;
        b=tEr8w8Rl1fkvSq15h6XIn191Ql3TNV4W0NGd1+N+bVMd03s6uDgU4QaPKNAE6zEjiu
         FQFXeLHAgtfCpOF/krw6DiPT3brAY2YPYW9DgrZCs7GM7T96qn1oA3SRCP6Ydexn2Ucn
         EcEtGRPq8fJ4O4A15IckAAQT28uo8rI85zn8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720460128; x=1721064928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJtHp8tty+WfmySIL4PeN7k5ySN/iHKXnLF29O6pnIA=;
        b=MkD3nice0Bv1LnQoleaSVxGkJmxc87io/CZJdfVg4Wcp7T0ONU35cI2HYPjunYF6U/
         2mWCci+7ZZFptMylIDkFEUBTyV3WtIW61QejS4vadCk7YFDeaCblTHY8whhDCdVZdr8t
         fT2RC+QMP4zRSTvgYP1nM0BOTXuMxESF78LMSM/MZyycGgbzo9iBig6u4A80TkHODmnq
         4ba2y58gYdTexXmwaaujAreZiJqalU/6Dj6ISED01/rIQjbAwXWslKBwP05fQ057qBCH
         K3rtuZ2DgFuAxiGoE9ae1lO7gP5iIZL4pMGPCsxpekiUib1u1Wm6Hg4se9akeTBM82wB
         RVNw==
X-Gm-Message-State: AOJu0YzGE14yFCEu5/Bn7h1R2cY1qKCojFkFbkuOzp1DO4O56cq+8xKx
	zmSRPA77AS4U2VxRZeVCOubdrCPJ3okyKWK89BiGARxsX8K6j0TcPB3LBUJ8u02FHey9guGMsNV
	e
X-Google-Smtp-Source: AGHT+IEp6SakYHeFlq+Wp72AMR6eVquB3HsAWqTGw08a9A4aDUOHHDpeQ93cPOmWy+VfNMg+aDIn8Q==
X-Received: by 2002:a17:907:2d87:b0:a77:f5ca:f847 with SMTP id a640c23a62f3a-a780b68a20emr25931366b.3.1720460128495;
        Mon, 08 Jul 2024 10:35:28 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 2/4] CI: Introduce a bookworm-ppc64le container
Date: Mon,  8 Jul 2024 18:35:20 +0100
Message-Id: <20240708173522.2218293-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240708173522.2218293-1-andrew.cooper3@citrix.com>
References: <20240708173522.2218293-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make it non-root by default, and set XEN_TARGET_ARCH=ppc64 too.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 .../build/debian/bookworm-ppc64le.dockerfile  | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 automation/build/debian/bookworm-ppc64le.dockerfile

diff --git a/automation/build/debian/bookworm-ppc64le.dockerfile b/automation/build/debian/bookworm-ppc64le.dockerfile
new file mode 100644
index 000000000000..3b311e675ef5
--- /dev/null
+++ b/automation/build/debian/bookworm-ppc64le.dockerfile
@@ -0,0 +1,36 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 debian:bookworm-slim
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV CROSS_COMPILE=powerpc64le-linux-gnu-
+ENV XEN_TARGET_ARCH=ppc64
+
+RUN <<EOF
+#!/bin/bash
+    set -e
+
+    useradd --create-home user
+
+    apt-get -y update
+
+    DEPS=(
+        # Xen
+        bison
+        build-essential
+        checkpolicy
+        flex
+        gcc-powerpc64le-linux-gnu
+        python3-minimal
+
+        # Qemu for test phase
+        qemu-system-ppc
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+    rm -rf /var/lib/apt/lists/*
+EOF
+
+USER user
+WORKDIR /build
-- 
2.39.2


