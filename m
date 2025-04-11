Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0F6A866BB
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 22:00:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947803.1345391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3KX2-0004dG-FE; Fri, 11 Apr 2025 19:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947803.1345391; Fri, 11 Apr 2025 19:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3KX2-0004bB-CQ; Fri, 11 Apr 2025 19:59:20 +0000
Received: by outflank-mailman (input) for mailman id 947803;
 Fri, 11 Apr 2025 19:59:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cS7z=W5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u3KX1-0004b5-Ez
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 19:59:19 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7329f20e-170f-11f0-9eae-5ba50f476ded;
 Fri, 11 Apr 2025 21:59:17 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-39c0dfba946so1417446f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 12:59:17 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f23572ce4sm94448555e9.30.2025.04.11.12.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 12:59:16 -0700 (PDT)
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
X-Inumbo-ID: 7329f20e-170f-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744401556; x=1745006356; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c+hnH5laC8XFET4cC5pzAhie//+QnKI8CmY2LPWGGck=;
        b=maVt7TrBck5hb4WlSVxo6CsrCSkvMVIs9NU3KUfe6U0V8kuyvhNqjsDIr17Sa63Lw5
         ikJorOHZ4sVutxvBz0KvuDVOzFtuqzUHdDJSG3Hj8BYh3BhG5GCTRsEQ5WCjAyXrta25
         c97WMO3hYHBGrjs/bBekUP5k/J5Xs8C/tumLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744401556; x=1745006356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+hnH5laC8XFET4cC5pzAhie//+QnKI8CmY2LPWGGck=;
        b=u+jbqTrRpLK+Z78dUcgMMbgTJduNhXFRmBuABMOZpgO1cAAK8nd15RFs6Qyv9J5LU0
         jLe6PgULewsmaqlVuj5X2kYJY6YsDaHoGFABM8kP0m+sbsDbwG7TfzbYuMkQVxj2dSuV
         Ce5hcTpK/rTJIZoX1TptE3H42QyoxWuO5H5eE5XHqOgkEj+WpN62BirwoDRG0rU+22SX
         TC92llFGgciwdx5wBeKF5ojApb8cJewltRWAmImRj419mCrKaee0EgofDyY/JJqyA4JD
         zPAAjcsCLrLGMFydaICe8Z7dIIQeTMoblhxtVPSoiD3TOF4acV09WkoPNBCdjqkfGyde
         pWSw==
X-Gm-Message-State: AOJu0YzyY//Etq5/VsSsAxnnmm6+1crLIWQuSEsga8r47wg353TRO/4n
	Jxe+5lSquZ0b6YR45FUUfHoKDRx8Gh489iYYGBo7STRQQ4XOtw3CeDpJIWisI/vUY73BoInuxlS
	whLg=
X-Gm-Gg: ASbGnctR0jPR6xD2TNmT9qIwNUWYsPYXS1emQ4GipMEu6T+jCmMvNF7tjDiIyssb5qM
	yM7wjqK3sJ57oUICAaJF0f5FBLOVS1Ek2H84uyKe0PEkdzJwGwRuBbbcb98ZlZHuLchmcU+sFCJ
	DzgWVUC+fO80haR7hia/J1kPM86P1y0PGLjcrZZp3cxSKsmtayp3OGSSNfnWrshJw/vtRBHzcJv
	A4hzJFNNxt9bqXn3LMGdBeJogYgF0O37QNxNkShVWfnQgL9NgtIo88cuMSfx8D7BORrabhHCGTz
	814BSAx5L9rMkXTTqWybBFwPeo1Vv6ESOXLmcngl5aYI83kiz6j2PTh0ZqKPO74OyUHhLnrrqNu
	ibXNPG6X8WgudBg==
X-Google-Smtp-Source: AGHT+IFsSGj90KiuAdcCPUWX4xbif6MThlDR9w3BG85TWdKtYUYL8EJ3RAIcAcAZKnJzL3FtC6fxTg==
X-Received: by 2002:a05:6000:178e:b0:39a:d336:16 with SMTP id ffacd0b85a97d-39ea5215dc6mr3569905f8f.34.1744401556598;
        Fri, 11 Apr 2025 12:59:16 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] Package microcode for the x86 hardware runners
Date: Fri, 11 Apr 2025 20:59:14 +0100
Message-Id: <20250411195914.2256882-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

They are all out of date, to different degrees.

Install jq into the x86_64 build container so we can parse the Github latest
release information in an acceptable way.

The resulting archive must be uncompressed, in order to work during early
boot.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Example working in Xen:
  https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/9700756054#L206
---
 .gitlab-ci.yml                             |  4 +++
 images/alpine/3.18-x86_64-build.dockerfile |  3 ++
 scripts/x86-microcode.sh                   | 42 ++++++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100755 scripts/x86-microcode.sh

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3587d660aa62..63722233dc6f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -64,6 +64,10 @@ linux-6.6.56-x86_64:
     ARGO_SHA: "ca5473a56f62e2b4d59697c8552d151391d3fec1"
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


