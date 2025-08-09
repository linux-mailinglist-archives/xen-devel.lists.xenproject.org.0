Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E4EB1F71E
	for <lists+xen-devel@lfdr.de>; Sun, 10 Aug 2025 00:12:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076298.1437923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukrnV-00065H-S1; Sat, 09 Aug 2025 22:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076298.1437923; Sat, 09 Aug 2025 22:12:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukrnV-00064K-Oe; Sat, 09 Aug 2025 22:12:17 +0000
Received: by outflank-mailman (input) for mailman id 1076298;
 Sat, 09 Aug 2025 22:12:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gSuF=2V=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukrnT-0005qN-SW
 for xen-devel@lists.xenproject.org; Sat, 09 Aug 2025 22:12:15 +0000
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [2a00:1450:4864:20::441])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e812a21a-756d-11f0-a325-13f23c93f187;
 Sun, 10 Aug 2025 00:12:15 +0200 (CEST)
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-3b78315ff04so2741325f8f.0
 for <xen-devel@lists.xenproject.org>; Sat, 09 Aug 2025 15:12:15 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c453ab0sm35424323f8f.44.2025.08.09.15.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 15:12:14 -0700 (PDT)
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
X-Inumbo-ID: e812a21a-756d-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754777535; x=1755382335; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8jEOu6+Wmu2jfug+vxWSSfDmwNVRaIms3wraAaPkLY=;
        b=Dz9vn92BJ2/ySmJ9P3NT+nMOKO7mp6sYZp4m4Y99sSj5SzinDmwxVbvE1sNUQsuZx5
         kjmQB9rOV5gPDa1nJHtSVoo/4GrQKtlh00j4JEC1tWjn9q9J/1u7QTXWi0FCyMvwN6vs
         j8czStDMGitj6nRzE3jSYXhDxR/2OFG0HFMXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754777535; x=1755382335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8jEOu6+Wmu2jfug+vxWSSfDmwNVRaIms3wraAaPkLY=;
        b=ZJVwnZMLXRF7UvEW19vKJcGvGhTDkKWPb97plLwqx7XZ1I1HdOQraZCPMhxjpaSIgU
         rbZAwAx5lxnnU/OvNKQFPxaUwjAVDNzAiqyVo6NyqwFRQAWmcVFqYzn6eMYIiBRGf8tu
         QVEVBz52dK1kwybGAuBs9X03nriEV9lpeAkeHIT0bY3LsoQrQe0JoMRu3F+7r6IGgWbA
         fhCm0+o4vULMCZRtiR3kdJpMElE5NE499dsoLel/hJo5t45gfkwcR0sin5IR0r49yvki
         TOUNj+HKsT3zC9K7HBXec1ErO0xazS08SaqMN83zDMDToBXAer1DtofhrWbMte7eQ5zq
         JuDQ==
X-Gm-Message-State: AOJu0YxJ4LEiGFovoFgGrCz3Dggb/Hy+KGgmWe1B8wBz9hn1bETTs/9/
	bjjDw8bJngpnYrOklavnDnyZ2A4Jk+5w5pN6RIBGoqmh4bw0kCH/M1QZRv9kwIK7Trh+edcsZFX
	y5NCLoCi2OA==
X-Gm-Gg: ASbGncsTXXwXu6K9DNFa8sq7QB5cMxua3gYx76YEKzJT8h6N1i5uT1725qOWfi/yH6B
	S0EVHNi4pkK9d80jDxW6cblmPKauWaetQ6f80qU3g6W51Jx0NMoo4+ZbW5srn8SWmDl0TToRNzn
	s+KXK5dGAnlFhp3FmI3S79xQj7/llUSJ3ohCZEkI5iA6jfI/LUHBQ2iEnNMBYzHXxk8djkeX9Wp
	mecNXraw/UvFIF5kH/0oL52V7SkY5YccJVwycymlLimGVESgima7/cbchcbFJNK1J7Iq28zdcDj
	ZvFjjkdvAZCbk80eM9Auj7CY0VGr9KJBCQ43K4FMuUH8jhq62X0hu70Q+8cBGDLfzsaCZRVirQA
	MIckWw859VIDotTH8jKJDDaS9kM5k9mzbsgf0gPVZX0052Y+KDYByw5P2eLB7LnbsLQehNUWpIx
	+/
X-Google-Smtp-Source: AGHT+IH0EYhksleZNTZuq5+L/1QNNPMQh/53GIa6ar0t3hlOvb82O7XDJykDV4EsYFApiPg/bioABA==
X-Received: by 2002:a05:6000:1ac7:b0:3b7:6d95:56d2 with SMTP id ffacd0b85a97d-3b900b449b0mr5556976f8f.7.1754777534659;
        Sat, 09 Aug 2025 15:12:14 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Victor Lira <victorm.lira@amd.com>
Subject: [PATCH 5/5] CI: Update x86 to use Debian Trixie
Date: Sat,  9 Aug 2025 23:12:06 +0100
Message-Id: <20250809221206.1260861-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250809221206.1260861-1-andrew.cooper3@citrix.com>
References: <20250809221206.1260861-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the exception of the custom IBT job, copy all Debian 12 jobs making
Debian 13 versions, then trim the Debian 12 ranconfig jobs.  Update the test
jobs.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Victor Lira <victorm.lira@amd.com>

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1975958452

We may want to trim a few more jobs, but I'm not sure where the right balance is.
---
 automation/gitlab-ci/build.yaml | 54 +++++++++++++++++++++++++--------
 automation/gitlab-ci/test.yaml  | 10 +++---
 2 files changed, 47 insertions(+), 17 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index f8e45f3467c8..4cb52fe59715 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -309,15 +309,15 @@ alpine-3.18-gcc-debug:
       CONFIG_UCODE_SCAN_DEFAULT=y
       CONFIG_XHCI=y
 
-debian-12-x86_64-gcc-debug:
+debian-13-x86_64-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: debian:12-x86_64
+    CONTAINER: debian:13-x86_64
 
-debian-12-x86_64-clang-debug:
+debian-13-x86_64-clang-debug:
   extends: .clang-x86-64-build-debug
   variables:
-    CONTAINER: debian:12-x86_64
+    CONTAINER: debian:13-x86_64
 
 debian-13-ppc64le-gcc-debug:
   extends: .gcc-ppc64le-cross-build-debug
@@ -545,24 +545,20 @@ debian-12-x86_64-clang:
   variables:
     CONTAINER: debian:12-x86_64
 
-debian-12-x86_64-clang-randconfig:
-  extends: .clang-x86-64-build
+debian-12-x86_64-clang-debug:
+  extends: .clang-x86-64-build-debug
   variables:
     CONTAINER: debian:12-x86_64
-    RANDCONFIG: y
-    EXTRA_FIXED_RANDCONFIG: |
-      CONFIG_COVERAGE=n # Disable coverage otherwise build times out.
 
 debian-12-x86_64-gcc:
   extends: .gcc-x86-64-build
   variables:
     CONTAINER: debian:12-x86_64
 
-debian-12-x86_64-gcc-randconfig:
-  extends: .gcc-x86-64-build
+debian-12-x86_64-gcc-debug:
+  extends: .gcc-x86-64-build-debug
   variables:
     CONTAINER: debian:12-x86_64
-    RANDCONFIG: y
 
 debian-12-x86_32-clang-debug:
   extends: .clang-x86-32-build-debug
@@ -574,6 +570,40 @@ debian-12-x86_32-gcc-debug:
   variables:
     CONTAINER: debian:12-x86_32
 
+debian-13-x86_64-clang:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: debian:13-x86_64
+
+debian-13-x86_64-clang-randconfig:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: debian:13-x86_64
+    RANDCONFIG: y
+    EXTRA_FIXED_RANDCONFIG: |
+      CONFIG_COVERAGE=n # Disable coverage otherwise build times out.
+
+debian-13-x86_64-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: debian:13-x86_64
+
+debian-13-x86_64-gcc-randconfig:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: debian:13-x86_64
+    RANDCONFIG: y
+
+debian-13-x86_32-clang-debug:
+  extends: .clang-x86-32-build-debug
+  variables:
+    CONTAINER: debian:13-x86_32
+
+debian-13-x86_32-gcc-debug:
+  extends: .gcc-x86-32-build-debug
+  variables:
+    CONTAINER: debian:13-x86_32
+
 fedora-41-x86_64-gcc:
   extends: .gcc-x86-64-build
   variables:
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 9acd984d294c..96e952235737 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -661,35 +661,35 @@ qemu-smoke-x86-64-gcc:
   script:
     - ./automation/scripts/qemu-xtf.sh x86-64 pv64 example 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-12-x86_64-gcc-debug
+    - debian-13-x86_64-gcc-debug
 
 qemu-smoke-x86-64-clang:
   extends: .qemu-smoke-x86-64
   script:
     - ./automation/scripts/qemu-xtf.sh x86-64 pv64 example 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-12-x86_64-clang-debug
+    - debian-13-x86_64-clang-debug
 
 qemu-smoke-x86-64-gcc-pvh:
   extends: .qemu-smoke-x86-64
   script:
     - ./automation/scripts/qemu-xtf.sh x86-64 hvm64 example 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-12-x86_64-gcc-debug
+    - debian-13-x86_64-gcc-debug
 
 qemu-smoke-x86-64-clang-pvh:
   extends: .qemu-smoke-x86-64
   script:
     - ./automation/scripts/qemu-xtf.sh x86-64 hvm64 example 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-12-x86_64-clang-debug
+    - debian-13-x86_64-clang-debug
 
 qemu-smoke-x86-64-gcc-efi:
   extends: .qemu-smoke-x86-64
   script:
     - ./automation/scripts/qemu-xtf.sh x86-64-efi pv64 example 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-12-x86_64-gcc-debug
+    - debian-13-x86_64-gcc-debug
 
 qemu-xtf-argo-x86_64-gcc-debug:
   extends: .qemu-smoke-x86-64
-- 
2.39.5


