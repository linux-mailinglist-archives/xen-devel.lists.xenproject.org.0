Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FC2A87D5F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 12:19:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949560.1346119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Gu2-0006zA-Ou; Mon, 14 Apr 2025 10:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949560.1346119; Mon, 14 Apr 2025 10:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Gu2-0006vl-Ep; Mon, 14 Apr 2025 10:18:58 +0000
Received: by outflank-mailman (input) for mailman id 949560;
 Mon, 14 Apr 2025 10:18:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4Gu1-0006cA-4U
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 10:18:57 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de8dd637-1919-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 12:18:54 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so19015125e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 03:18:54 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233a2f08sm171340495e9.12.2025.04.14.03.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 03:18:53 -0700 (PDT)
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
X-Inumbo-ID: de8dd637-1919-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744625934; x=1745230734; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BxgGCRwzO7L707eY7SgfaioeTDsDFCJ+wxG6hWaDZA=;
        b=PD6w7Aojk5gPSRkkcdC7CbeF+9iWhUT9uhmGHCQWXfC2zVyuwab0EMWh6Hz5Q0I+g2
         CQXLQM4VoyyYrY36PF2Qoo46HS+vBM38A/4uWWk/odJ1qMaaVwejiTdg6HzanhoF66DK
         QhrUgPamz3pmYBNRHY+kld/g4HHx4LVVSLMqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625934; x=1745230734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BxgGCRwzO7L707eY7SgfaioeTDsDFCJ+wxG6hWaDZA=;
        b=dCOBbiM3dI+da6u9sSvPTYH1v/GPYPj6yOBFwMqX53xZJ06mP3J6+nEa7PB4u29k6u
         4dIqnv3im9KIvg97Fv3OByxMY/yp262n1o8URHxKeC16FuhmbSTgoTSqnjnuj2vMWAgA
         XQVz2/Y6JfoFu5flKfebom1q2lgOrVNvSep8vxoe48swnkvMhM40fuZ/lYjNCtZOj7GA
         ZfnZZdU59ZI0DhX0xNkID3/H3bJTRDzk5ub70wCrfMqe7s3ZvBTYkd5ximU2DVwx7DXM
         EpAcnJR3uk2snPjGBvwEMWh+j8bENOBx4DIuQldMfzNINhcIAQUjBARDJxtEHsV25FpI
         vfkg==
X-Gm-Message-State: AOJu0Yz4wBFd0/7SDpOB5qP8v4SkmndSIrgtMQVuw2P+UHD7LqgUwCfU
	10GPSSZP258QOT/x7b6YDdEWGgxI7XBHto2ve3PhAvhAQtV3TCeB9XgJwCnq71RiPOLB7aNzKi4
	nvJc=
X-Gm-Gg: ASbGncvB9NOmdGCuETRp7+Q8fevzRC8tXmgP2iSmiEZsmuqxSfuaD4I6rokbiLQpsSj
	HYe8NV1HhQRKtc1lSulEHMKS146/z2yiYuCvncAVrYN1gFv7oXU/Recq639vVAsJzeoRQf4QV9V
	oNAwKF09x7j76hMbM20d3Pd5HHCd3b7vr7v8O8PvtPayWGGTqZg52NgHyBjJjc7MdE0MQ39CQyL
	grX/a6H0o493cxWxoxx7ffGC+ZFkUbBQO/puuXLOL5nS1tN29aUyjjEdWD+KZPPBnY5DXFtbOtp
	wKVhFTXEVNB4aQiuPiqyaJtd4eJ5JCtRH3dOeeq5e/upVqeOrdqBdBnQ/j04xLT3JSHqI8HMaN+
	FJ8Cveuve+YZUuw==
X-Google-Smtp-Source: AGHT+IHDf0hhLAOJettuM+qp4C4T4LENm81nifm+m3sS3bM+cfNaYx/OsGEvtN1kW3nGhYlQDLnZpA==
X-Received: by 2002:a05:600c:34c5:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-43f3a93c74cmr104465045e9.13.1744625934073;
        Mon, 14 Apr 2025 03:18:54 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 7/7] Package microcode for the x86 hardware runners
Date: Mon, 14 Apr 2025 11:18:43 +0100
Message-Id: <20250414101843.2348330-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
References: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

They are all out of date, to different degrees.

Install jq into the x86_64 build container so we can parse the Github latest
release information in an acceptable way.

The resulting archive must be uncompressed, in order to work during early
boot.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 .gitlab-ci.yml                             |  4 +++
 images/alpine/3.18-x86_64-build.dockerfile |  3 ++
 scripts/x86-microcode.sh                   | 42 ++++++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100755 scripts/x86-microcode.sh

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d70ddd99e529..74335363d5ed 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -64,6 +64,10 @@ linux-6.6.56-x86_64:
     ARGO_SHA: "705a7a8a624b42e13e655d3042059b8a85cdf6a3"
     ARGOEXEC_SHA: "d900429f6640acc6f68a3d3a4c945d7da60625d8"
 
+microcode-x86:
+  extends: .x86_64-artifacts
+  script: ./scripts/x86-microcode.sh
+
 #
 # The jobs below here are legacy and being phased out.
 #
diff --git a/images/alpine/3.18-x86_64-build.dockerfile b/images/alpine/3.18-x86_64-build.dockerfile
index eac0cda4fed3..c4ff30e1f138 100644
--- a/images/alpine/3.18-x86_64-build.dockerfile
+++ b/images/alpine/3.18-x86_64-build.dockerfile
@@ -27,6 +27,9 @@ RUN <<EOF
             openssl-dev
             perl
 
+            # Microcode
+            jq
+
             # Argo build deps
             autoconf
             automake
diff --git a/scripts/x86-microcode.sh b/scripts/x86-microcode.sh
new file mode 100755
index 000000000000..cb55a3bd2d52
--- /dev/null
+++ b/scripts/x86-microcode.sh
@@ -0,0 +1,42 @@
+#!/bin/bash
+
+set -eux -o pipefail
+
+WORKDIR="${PWD}"
+COPYDIR="${WORKDIR}/binaries"
+
+ROOTDIR="${WORKDIR}/root"
+UCODEDIR="${ROOTDIR}/kernel/x86/microcode"
+mkdir -p "${UCODEDIR}"
+
+#
+# Intel microcode comes from github
+#
+curl -fsSL https://api.github.com/repos/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/latest > intel-latest.json
+TARBALL_URL="$(jq -r .tarball_url intel-latest.json)"
+curl -fsSL "${TARBALL_URL}" > intel-latest.tar
+tar xf intel-latest.tar --strip-components=1
+
+(
+    cd intel-ucode
+    cat 06-97-02 # adl-*
+    cat 06-8e-09 # kbl-*
+) > "${UCODEDIR}/GenuineIntel.bin"
+
+#
+# AMD microcode comes from linux-firmware
+#
+curl -fsSLO https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/amd-ucode/microcode_amd_fam17h.bin
+curl -fsSLO https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/amd-ucode/microcode_amd_fam19h.bin
+
+(
+    cat microcode_amd_fam17h.bin # zen2-*, xilinux-*-x86_64-*
+    cat microcode_amd_fam19h.bin # zen3p-*
+) > "${UCODEDIR}/AuthenticAMD.bin"
+
+# Package everything up.  It must be uncompressed
+cd "${ROOTDIR}"
+find . | cpio -R 0:0 -H newc -o > "${COPYDIR}/ucode.cpio"
+
+# Print the contents for the build log
+cpio -tv < "${COPYDIR}/ucode.cpio"
-- 
2.39.5


