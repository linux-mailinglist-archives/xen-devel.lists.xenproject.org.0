Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D91E3ABE1E1
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 19:38:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990993.1374941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHQu7-0004nQ-AD; Tue, 20 May 2025 17:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990993.1374941; Tue, 20 May 2025 17:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHQu7-0004lj-7e; Tue, 20 May 2025 17:37:27 +0000
Received: by outflank-mailman (input) for mailman id 990993;
 Tue, 20 May 2025 17:37:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BmRr=YE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uHQu5-0004lb-Ot
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 17:37:25 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16133df9-35a1-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 19:37:22 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so48359585e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 10:37:22 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f78aef8asm40010215e9.29.2025.05.20.10.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 10:37:21 -0700 (PDT)
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
X-Inumbo-ID: 16133df9-35a1-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747762642; x=1748367442; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hBMR/tsxhrvvnQPYiNukCqoQmbuc6BX9rVStfHvqwJ8=;
        b=Ll1v4Wq0lhmSEnIfzEdv8HCRdCt4SrKpef8PAuAjyHtZ0t8XCFf6OYqeCIJDcEAubO
         778knz53ac8GiXtkkixrEJ777OetH8EeDNkEh+KA1n2JaxlRPKyWPK1pBZ772NfBD4aS
         A0RDs1ZJaUyrSRRGdDktrV/ZYSxiDbnaXzr+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747762642; x=1748367442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hBMR/tsxhrvvnQPYiNukCqoQmbuc6BX9rVStfHvqwJ8=;
        b=wFPz7VnoH7N7tBwgJJKIlhBaAnn0uKwN2CjfTHWjYxOLlfJn0xpBdbXrgukoxX/5EO
         zUdgYn20WyKFR4AMEUYvziRPyjTBaP0orUHQ+0x+nXJFyffVi1t5zXgwRjNbsf+ryoCb
         dPk3CS5FNIVjifFKf0Z/l1Bhs01FV9iAkpLMukbdakt751+I6P52LfqaRAXVJm7H3YpN
         g69Ssa6TWlREUjcIx1Ts5tzqOTLHaENnQBQJ2PlgFC+oVXhxf9vl57WUjCQ3Vay2JZYc
         t7IcXmF9w5P+S4uSjWLL+pdlQnjaTIkax/HdlLSedMeXxvsoR9wRW9stmOpZzFT6RE5P
         9fLQ==
X-Gm-Message-State: AOJu0YyB1duRvOPz6kkkK4LY23UdUg/zy8WGlvbveYZuNQJcXIoQ1gVd
	+lY4PXCexEAhdAQ5rDlLqogP1DACD8Ab5H6xQMpJ/RmDLEHM2hOrzC8L3PqPt27HX9xdAezxJ76
	nM1wn
X-Gm-Gg: ASbGncvIBO9a7gyvhCGbex6VRQc0zPlreKOj5t7oK4cLXDgLoXyURUEA6Mm4rrtnyaV
	wX5PP27wtzRktSuEOgq09vIhrBq2g/veepOw9R3gb92VUMqxbklstLMRNUflpJVEzMREGZ9vySi
	UHOvPGGN3BDBbprzcrePdW2dqAbkhUJh9iauofKGVICFrzFudPnDull6u83Rnl5KPWF3vVc0wjy
	S2U3N9lpVLvIGUtZBkAqi8ehHNBfnR7Z4V2D8HWoWU0K5Qf16NTHkMeEVdFxvXra1gHYCJnmZDh
	uNJMU+iYSc2TnzRPX4jFYLudAVhso4JuXz4EehZU9Ec8PK9n8J1t/PiD/zT2V/BcR6ox+bLZVk4
	Nshzo87mqF1RH88isUnnqcQfd
X-Google-Smtp-Source: AGHT+IF3fiAufJtRi6ZdpAaC1OEvpFM0b/cRRAKzCqkMExTYlkdF0Hi84yoaXnSkkzKiBBb3Wy9nbQ==
X-Received: by 2002:a05:600c:83c5:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-442fd67515emr190823355e9.30.1747762641781;
        Tue, 20 May 2025 10:37:21 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] CI: Rename qubes-x86-64 parameter "" to "dom0pv"
Date: Tue, 20 May 2025 18:37:19 +0100
Message-Id: <20250520173719.139233-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This really is a legacy of not having parameters to start with.  Give PV dom0
with a PVH domU a real name.

Reformat the table to fix alignment.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/gitlab-ci/test.yaml     |  8 ++++----
 automation/scripts/qubes-x86-64.sh | 22 +++++++++++-----------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index a603d4039aef..842cecf71382 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -257,7 +257,7 @@ xilinx-smoke-dom0-x86_64-gcc-debug-argo:
 adl-smoke-x86-64-gcc-debug:
   extends: .adl-x86-64
   script:
-    - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86-64.sh dom0pv 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
     - alpine-3.18-gcc-debug
@@ -335,7 +335,7 @@ adl-tools-tests-pvh-x86-64-gcc-debug:
 kbl-smoke-x86-64-gcc-debug:
   extends: .kbl-x86-64
   script:
-    - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86-64.sh dom0pv 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
     - alpine-3.18-gcc-debug
@@ -413,7 +413,7 @@ kbl-tools-tests-pvh-x86-64-gcc-debug:
 zen2-smoke-x86-64-gcc-debug:
   extends: .zen2-x86-64
   script:
-    - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86-64.sh dom0pv 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
     - alpine-3.18-gcc-debug
@@ -429,7 +429,7 @@ zen2-suspend-x86-64-gcc-debug:
 zen3p-smoke-x86-64-gcc-debug:
   extends: .zen3p-x86-64
   script:
-    - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qubes-x86-64.sh dom0pv 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
     - alpine-3.18-gcc-debug
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index bfdd2ceb99ba..aa47ba6bf5c0 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -2,16 +2,16 @@
 
 set -ex -o pipefail
 
-# One of:
-#  - ""             PV dom0,  PVH domU
-#  - dom0pvh        PVH dom0, PVH domU
-#  - dom0pvh-hvm    PVH dom0, HVM domU
-#  - pci-hvm        PV dom0,  HVM domU + PCI Passthrough
-#  - pci-pv         PV dom0,  PV domU + PCI Passthrough
-#  - pvshim         PV dom0,  PVSHIM domU
-#  - s3             PV dom0,  S3 suspend/resume
-#  - tools-tests-pv PV dom0, run tests from tools/tests/*
-#  - tools-tests-pvh PVH dom0, run tests from tools/tests/*
+# One of:              dom0:   Testing:
+#  - dom0pv              PV      PVH domU
+#  - dom0pvh             PVH     PVH domU
+#  - dom0pvh-hvm         PVH     HVM domU
+#  - pci-hvm             PV      HVM domU + PCI Passthrough
+#  - pci-pv              PV      PV domU + PCI Passthrough
+#  - pvshim              PV      PVSHIM domU
+#  - s3                  PV      S3 suspend/resume
+#  - tools-tests-pv      PV      Run tests from tools/tests/*
+#  - tools-tests-pvh     PVH     Run tests from tools/tests/*
 test_variant=$1
 
 ### defaults
@@ -25,7 +25,7 @@ retrieve_xml=
 
 case "${test_variant}" in
     ### test: smoke test & smoke test PVH & smoke test HVM & smoke test PVSHIM
-    ""|"dom0pvh"|"dom0pvh-hvm"|"pvshim")
+    "dom0pv"|"dom0pvh"|"dom0pvh-hvm"|"pvshim")
         passed="ping test passed"
         domU_check="
 ifconfig eth0 192.168.0.2
-- 
2.39.5


