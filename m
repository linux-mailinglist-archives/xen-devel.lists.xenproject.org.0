Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09951A6A9A2
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:21:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922521.1326456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHhp-0001NS-Ga; Thu, 20 Mar 2025 15:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922521.1326456; Thu, 20 Mar 2025 15:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHhp-0001IJ-Cm; Thu, 20 Mar 2025 15:21:13 +0000
Received: by outflank-mailman (input) for mailman id 922521;
 Thu, 20 Mar 2025 15:21:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hxt=WH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tvHho-0000Nz-KN
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:21:12 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4de47d7-059e-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 16:21:12 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso184836066b.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 08:21:12 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac3147ead1dsm1185699066b.58.2025.03.20.08.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 08:21:10 -0700 (PDT)
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
X-Inumbo-ID: f4de47d7-059e-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742484071; x=1743088871; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DteqfBrt8ivCseyWNFP70Yd0GJfa9Emhwy9r9Go1/ls=;
        b=GWJvxnAXd94rjFda5IPlAr/xmjJ1e/auf1g508Tu9kc6M3+GzW6cxfZjJ7qIf8S6In
         AfQWlwM2ceKHPkQn5AMTNMP0QTDx05mzqIqCHuPUNpPa49kzBZAp1i/x1yBECotivgSA
         zEkoIfQULYij1ceHavIv5BB7bgbsLfyWE4VT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484071; x=1743088871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DteqfBrt8ivCseyWNFP70Yd0GJfa9Emhwy9r9Go1/ls=;
        b=nISmIel1LsrgZWMwF2ZMeo0xUCV+S10kcrHBj6IIZuF10VCtlMX1pTuX+DyyvYFuip
         P8YXXZWPaHtcqxc5js7vPfym+y7xqzFH8xyXjPqMOuiwXnFhpz2GxqTTAa1miVy4mGRt
         h7XtglHmR+vTb5DGN3mjWj045JlKVw56302XmYwhsSBlMpAs/2m4dtDS0/hEVjSvpC0R
         UBOsd8ruZ8UnzodgseMUNySTnLFehejaBbbCjDQMZSdUX6czim5Q7uYUpqYMekSDyZil
         IbwTv/cFXOiVGK2+8EP6VMuH3o8NHkR0zuvktd5OrckgO0M26bYcNd91/SkpO/BUSQ+B
         TECA==
X-Gm-Message-State: AOJu0YwQmvsK1kVw4KuZU3oLReincqSkYuwgwqHDjxQCL0PHbZjCEdOI
	SjGIeeKrydAgGYWZPo/1dtgrWlTSmPDQkJIUhnehQQ6bzrMFQ2viIcPnkT5FnApsoD6Kp/nv85d
	t
X-Gm-Gg: ASbGnctuS+etGj4AAuVY8htYt2o/wcLxgdO84cbBMEA5l0pTm9+ObFCmNW8pcRFHAvj
	pHg8HTlnMlhhC3AOa2lwvWCZKCJqy3axaYGCBjYQW9+LdniOm3shDBIoNh5ET1JQ6p4POQiQ3u4
	GscXYQ5T4k4EDWoI3M52i7L7z68xNHc+XdTIryauNfBVdewNVlE0BaH0N1JH9EwJHs/hcEjj3f+
	TLionk7NTfcwnCmT+qe+1+oJwiFyhSEtJAP8gIzMguKerC0pfhL2WxkO3BLgnSYN1S3pJ5cFXlB
	DYWkXBursw/4zIG1qe9eZLUxegcBX0xN6sSPYY/EjI3zCD9jHTt2S77eXyNK
X-Google-Smtp-Source: AGHT+IGRKDORZhS6/H/AYq5vzH+TfYxC5Vfvja+KQ1AUZeS3JVh1jUWDbua6qg/f/qUTH6aEu74s6g==
X-Received: by 2002:a17:907:bb4b:b0:ac2:1c64:b0a with SMTP id a640c23a62f3a-ac3b7d7f6bfmr787450766b.14.1742484071187;
        Thu, 20 Mar 2025 08:21:11 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v2 4/4] automation/cirrus-ci: add smoke tests for the FreeBSD builds
Date: Thu, 20 Mar 2025 16:20:20 +0100
Message-ID: <20250320152020.88526-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320152020.88526-1-roger.pau@citrix.com>
References: <20250320152020.88526-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce a basic set of smoke tests using the XTF selftest image, and run
them on QEMU.  Use the matrix keyword to create a different task for each
XTF flavor on each FreeBSD build.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
---
Changes since v1:
 - Use production version of FreeBSD to run tests.
---
 .cirrus.yml  | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 CHANGELOG.md |  1 +
 2 files changed, 55 insertions(+)

diff --git a/.cirrus.yml b/.cirrus.yml
index 38b654f75cf2..3163ab8f11d8 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -5,6 +5,8 @@ freebsd_versions: &FREEBSD_VERSIONS
     FREEBSD_PRODUCTION: freebsd-14-2
     FREEBSD_CURRENT:    freebsd-15-0-snap
 
+# Build jobs
+
 freebsd_template: &FREEBSD_ENV
   environment:
     APPEND_LIB: /usr/local/lib
@@ -118,3 +120,55 @@ task:
   xtf_artifacts:
     path: xtf/tests/selftest/test-*-selftest
     type: application/octet-stream
+
+# Test jobs
+
+task:
+  name: 'FreeBSD: XTF selftest'
+
+  << : *FREEBSD_ENV_PRODUCTION
+
+  env:
+    matrix:
+      FREEBSD_BUILD: $FREEBSD_LEGACY
+      FREEBSD_BUILD: $FREEBSD_PRODUCTION
+      FREEBSD_BUILD: $FREEBSD_CURRENT
+
+  depends_on:
+    - freebsd_full_$FREEBSD_BUILD
+    - xtf
+
+  install_script: pkg install -y qemu-nox11 expect
+
+  env:
+    matrix:
+      XTF_ARCH: hvm32
+      XTF_ARCH: hvm32pae
+      XTF_ARCH: hvm32pse
+      XTF_ARCH: hvm64
+      XTF_ARCH: pv64
+
+  fetch_script:
+    - fetch https://api.cirrus-ci.com/v1/artifact/build/$CIRRUS_BUILD_ID/xtf/xtf.zip
+    - fetch https://api.cirrus-ci.com/v1/artifact/build/$CIRRUS_BUILD_ID/freebsd_full_$FREEBSD_BUILD/xen.zip
+    - unzip xtf.zip
+    - unzip xen.zip
+
+  test_script: |
+    case "$XTF_ARCH" in \
+      *hvm*) \
+        XEN_EXTRA_CMD="dom0=pvh dom0-iommu=none" \
+        ;; \
+    esac
+    export TEST_CMD="qemu-system-x86_64 -kernel xen/xen -initrd xtf/tests/selftest/test-${XTF_ARCH}-selftest \
+                                        -append \"loglvl=all console=com1 noreboot console_timestamps=boot dom0=verbose ${XEN_EXTRA_CMD}\" \
+                                        -m 512 -nographic -monitor none -serial stdio"
+    export TEST_LOG="serial-${FREEBSD_BUILD}-${XTF_ARCH}.txt"
+    export PASSED="Test result: SUCCESS"
+    export TEST_TIMEOUT=120
+    ./automation/scripts/console.exp | sed 's/\r\+$//'
+
+  always:
+    serial_artifacts:
+      path: serial-*.txt
+      type: text/plain
diff --git a/CHANGELOG.md b/CHANGELOG.md
index 9a5919585d43..35ab6749241c 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -14,6 +14,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Resizable BARs is supported for PVH dom0.
    - Support PCI passthrough for HVM domUs when dom0 is PVH (note SR-IOV
      capability usage is not yet supported on PVH dom0).
+   - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
 
 ### Removed
 
-- 
2.48.1


