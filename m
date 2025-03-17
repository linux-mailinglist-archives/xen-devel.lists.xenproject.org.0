Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB5DA64E91
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 13:20:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916719.1321782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9SV-000550-Ib; Mon, 17 Mar 2025 12:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916719.1321782; Mon, 17 Mar 2025 12:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9SV-00050K-Ew; Mon, 17 Mar 2025 12:20:43 +0000
Received: by outflank-mailman (input) for mailman id 916719;
 Mon, 17 Mar 2025 12:20:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VoqB=WE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tu9PB-0000mc-Hw
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 12:17:17 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c328d105-0329-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 13:17:16 +0100 (CET)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-223f4c06e9fso71138555ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 05:17:16 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-225c68a8574sm73228195ad.86.2025.03.17.05.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 05:17:13 -0700 (PDT)
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
X-Inumbo-ID: c328d105-0329-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742213834; x=1742818634; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8jOlrCuRBfKBoh76SCPmm/y0muCGxLXHaIc2HMBVQ0=;
        b=I1cJkM+76HrdGJcLk/hXPp2D1uKJcSM1Dzxyey0aDIqWWmLQznW+RkSYsy3VHNjBOU
         E4gGvuwg8DGO4IUfLAF0f+GV1UbHLcwPvzfSZHFe8TgpdKKKUyq2SJsG+G3a+KWwQZFb
         6B4n/Syi/wMvUaIAjKMPJ0ffwneqLqIs9mc5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213834; x=1742818634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8jOlrCuRBfKBoh76SCPmm/y0muCGxLXHaIc2HMBVQ0=;
        b=ZiLpRNdjvn7HAq5r76zSwllh1+WOazbwBMB9qkKaHiqAPbNgL4zeQfM6y8ZSbX0h1B
         iKwX+TGnJarfAyfws9cDx91b6FuDlDvBTUS13SUHEJovZZq/AIrIuchd29OE2hKDA2AL
         KSWNfz7mWD3OTqUHM4VdDty/RirGXAqq54Rm62CA9rNAqLu2qGmvyiWBbn6AwH4D5NBv
         zAPT2+7LhLy5OlRic/l9vE5jbbzXMCddibFZ5LAxXXpopj9mwCq2GRfB05r89vFG+fBm
         zfo7FqVYKwToaoIzTPjhc3Z0Dzs7/3DlElVPX09DHO9vOFwXYho05XoM485WpQJ1fjK4
         pqDQ==
X-Gm-Message-State: AOJu0Yy4s7UiDNjZY7jIpQCFm0sfpoOn+g6MsM9P2abzkVbvK0Us6Opy
	pOiHCZlFBT+xrskT+dSmCvvSUSvT7czHulnP33RX7DfcHSGR0JyFahHQzIhV0G1iWR5ycgS3zCN
	h
X-Gm-Gg: ASbGncsA4tshfp/r32aDnFhcK2YJv/WqW2z/wtlOj4ao6cOKgWKYhOwOP90O4N2jctK
	1xDyo+1Da+ng4UuFBSLnsWW9svU1qMd8ryswy1bbBi+yxdeNypjQZffWhrEsA5Njcj7Lwp9pEFC
	81xLzXKiNTmWQUs1LCz3BpiYbO5vCiPGOkCezLZWGK/mod7Ae/DUSH6nJgUzfUlwn4u21PXujBz
	Zwc6pLJfWazacIJpK9Owmo2A8XHjHAi1SsvA/nX9KhcyI3CEl/fgBUei9qtRzn17K+9tZbDnk/i
	hCO94UlHKTnR0bjR63TbOHWIw0l/j6uUKFdv5IFaoDxpH9POnptxqK4=
X-Google-Smtp-Source: AGHT+IGkxX1pXPyMgWV1a1rvZK4XWE411p4tDJZeeTuaTgYn4v0dl4U3sjdeyRcGhTE57jIV5W+/5g==
X-Received: by 2002:a17:903:13ce:b0:215:758c:52e8 with SMTP id d9443c01a7336-225e16b1b84mr178364175ad.12.1742213834048;
        Mon, 17 Mar 2025 05:17:14 -0700 (PDT)
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
Subject: [PATCH 8/8] automation/cirrus-ci: add smoke tests for the FreeBSD builds
Date: Mon, 17 Mar 2025 13:16:16 +0100
Message-ID: <20250317121616.40687-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317121616.40687-1-roger.pau@citrix.com>
References: <20250317121616.40687-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce a basic set of smoke tests using the XTF selftest image, and run
them on QEMU.  Use the matrix keyword to create a different task for each
XTF flavor on each FreeBSD build.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I've used the current version of FreeBSD to run the tests, but it might be
safer to use the latest production (release) version instead.
---
 .cirrus.yml  | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 CHANGELOG.md |  1 +
 2 files changed, 55 insertions(+)

diff --git a/.cirrus.yml b/.cirrus.yml
index c74d5cf6eb9a..9c8b4b235cfd 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -5,6 +5,8 @@ freebsd_versions: &FREEBSD_VERSIONS
     FREEBSD_14: freebsd-14-2
     FREEBSD_15: freebsd-15-0-snap
 
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
+  << : *FREEBSD_ENV_LATEST
+
+  env:
+    matrix:
+      FREEBSD_BUILD: $FREEBSD_13
+      FREEBSD_BUILD: $FREEBSD_14
+      FREEBSD_BUILD: $FREEBSD_15
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
index 7201c484f899..16c14e933c80 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - On x86:
    - Option to attempt to fixup p2m page-faults on PVH dom0.
    - Resizable BARs is supported for PVH dom0.
+   - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
 
 ### Removed
 
-- 
2.48.1


