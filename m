Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C45009A6C4D
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 16:36:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823580.1237621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2tVe-0004bX-40; Mon, 21 Oct 2024 14:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823580.1237621; Mon, 21 Oct 2024 14:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2tVd-0004Zg-VZ; Mon, 21 Oct 2024 14:35:49 +0000
Received: by outflank-mailman (input) for mailman id 823580;
 Mon, 21 Oct 2024 14:35:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=euus=RR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t2tVc-0003qm-Gz
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 14:35:48 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2b49f58-8fb9-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 16:35:47 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a99ea294480so302582966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 07:35:47 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c6b1d8sm1999394a12.72.2024.10.21.07.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 07:35:45 -0700 (PDT)
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
X-Inumbo-ID: c2b49f58-8fb9-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729521345; x=1730126145; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffY1VjEznp41YMioLn3WaQGjvM4SloKJ+MSKOS4FI5c=;
        b=XQoey2hS5D7JsRE/DAJwkmqoZyqM7q7Ol/ryp8QBV0sFXXx2cXwQJNCQYHMFx+Cql0
         XjlUiy5Lu/G+E2RDZrnFu1yt2YCYOhau4Cl48eOLnu9LweWE+smtMeaKwfzPyrRqkEEi
         T41iRsyatKz84mNVYgLzs50BQCqqE8muALggs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729521345; x=1730126145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffY1VjEznp41YMioLn3WaQGjvM4SloKJ+MSKOS4FI5c=;
        b=JiyYtZWrctu5PpUpUvCR6A/katfIxk8P3RidYfXogrhqSJgWQkREYD19xadfQANcoj
         aiBCNgg84kIeTLbwlM1pssKI0URny1kwhrupZQK6eEzla0sZtE9R91uJZ24BjO/6MA+/
         k8wROZQAAmaN6G7ee44JmtpD3huZDRqhrX7mHqbbjxSx9s2mvLJN+cD7OTfNIDmaD12E
         8E/GVn7IOZ/jm8lm5WMYWd7J2wqB62IOnAG+kzAUuFTl2qRikNIUijFoA7pQcQhW1zUN
         LObgEWc8+mjWKc1Ge+iul+II/2qe0y0nPCYlJlxlKcKhYbdU4R4CapjBW4ujCoI/8y2x
         stYw==
X-Gm-Message-State: AOJu0YzX0IH2QUqxk4MtSfVS2WDWiWcz3h/XcAQ5iiknBVURud3xVhY+
	dWGA9RR3UPtyj2xnLSmJdCTQ4fYNBwS6S1H3rsnRqBWc3tfQQ22aNCSk2Otr9klWqE8w/g7yAVL
	V
X-Google-Smtp-Source: AGHT+IF1gehkVz+JmHowBFH/HTU2wVxXLlX6vyPnlnAgzAPNv8+U9MrIWNbFyrjfCj5LBrOMmDqQEA==
X-Received: by 2002:a05:6402:1d52:b0:5cb:65f4:7d91 with SMTP id 4fb4d7f45d1cf-5cb65f47da5mr6763403a12.29.1729521345457;
        Mon, 21 Oct 2024 07:35:45 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 3/3] CI: Add {adl,zen3p}-pvshim-* tests
Date: Mon, 21 Oct 2024 15:35:39 +0100
Message-Id: <20241021143539.3898995-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241021143539.3898995-1-andrew.cooper3@citrix.com>
References: <20241021143539.3898995-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GitlabCI has no testing of Xen's PVH entrypoint.  Fix this.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>

OSSTest (which is disappearing imminently) found a pvshim bug in the
hyperlaunch series, and I found a second shortly after while trying to take
more of the series.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1505518838
---
 automation/gitlab-ci/test.yaml     | 16 ++++++++++++++++
 automation/scripts/qubes-x86-64.sh | 10 ++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index b27c2be17487..e76a37bef32d 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -240,6 +240,14 @@ adl-pci-hvm-x86-64-gcc-debug:
     - *x86-64-test-needs
     - alpine-3.18-gcc-debug
 
+adl-pvshim-x86-64-gcc-debug:
+  extends: .adl-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh pvshim 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
 zen3p-smoke-x86-64-gcc-debug:
   extends: .zen3p-x86-64
   script:
@@ -272,6 +280,14 @@ zen3p-pci-hvm-x86-64-gcc-debug:
     - *x86-64-test-needs
     - alpine-3.18-gcc-debug
 
+zen3p-pvshim-x86-64-gcc-debug:
+  extends: .zen3p-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh pvshim 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
 qemu-smoke-dom0-arm64-gcc:
   extends: .qemu-arm64
   script:
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 4b6311efffa8..ace494b938d8 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -8,6 +8,7 @@ set -ex
 #  - dom0pvh-hvm    PVH dom0, HVM domU
 #  - pci-hvm        PV dom0,  HVM domU + PCI Passthrough
 #  - pci-pv         PV dom0,  PV domU + PCI Passthrough
+#  - pvshim         PV dom0,  PVSHIM domU
 #  - s3             PV dom0,  S3 suspend/resume
 test_variant=$1
 
@@ -20,8 +21,8 @@ domU_vif="'bridge=xenbr0',"
 domU_extra_cfg=
 
 case "${test_variant}" in
-    ### test: smoke test & smoke test PVH & smoke test HVM
-    ""|"dom0pvh"|"dom0pvh-hvm")
+    ### test: smoke test & smoke test PVH & smoke test HVM & smoke test PVSHIM
+    ""|"dom0pvh"|"dom0pvh-hvm"|"pvshim")
         passed="ping test passed"
         domU_check="
 ifconfig eth0 192.168.0.2
@@ -44,6 +45,11 @@ echo \"${passed}\"
 
         if [ "${test_variant}" = "dom0pvh-hvm" ]; then
             domU_type="hvm"
+        elif [ "${test_variant}" = "pvshim" ]; then
+            domU_type="pv"
+            domU_extra_cfg='
+pvshim = 1
+'
         fi
         ;;
 
-- 
2.39.5


