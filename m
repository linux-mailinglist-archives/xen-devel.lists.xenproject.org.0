Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4535D9B82F9
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 20:01:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828878.1243915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6aPe-0005Jv-Gf; Thu, 31 Oct 2024 19:00:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828878.1243915; Thu, 31 Oct 2024 19:00:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6aPe-0005IR-E4; Thu, 31 Oct 2024 19:00:54 +0000
Received: by outflank-mailman (input) for mailman id 828878;
 Thu, 31 Oct 2024 19:00:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hTS=R3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t6aPd-0005IL-1Z
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 19:00:53 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7018956d-97ba-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 20:00:47 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c99be0a4bbso1810055a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 12:00:47 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e565e0891sm94332766b.98.2024.10.31.12.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 12:00:45 -0700 (PDT)
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
X-Inumbo-ID: 7018956d-97ba-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzQiLCJoZWxvIjoibWFpbC1lZDEteDUzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjcwMTg5NTZkLTk3YmEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNDAxMjQ3LjM5NzYyNSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730401246; x=1731006046; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HSPYxB1TK86b4dP8NuYoBYRZTdjnpNqMJPF3eEV1fwk=;
        b=vjRLHuq50VcEzm2H/mwpM3p6zLrKYFWr2M7AsbweSD+0IKZNbFWHb3vMsdH3PmUxJz
         X1U57qOnTnfaVGvmNKshQJZVqkZ8dYbfYWgONA1luvOZnux6c4L5PuiQD+Ygvw78OmHw
         JmIyGagK4sCP4y9DOxoiAIROyOsgjFGZ62fRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730401246; x=1731006046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSPYxB1TK86b4dP8NuYoBYRZTdjnpNqMJPF3eEV1fwk=;
        b=HOfm/MwbVocXgsdW9VkRpzCt21uYKNfV0Gn/8931Za/efbMyK0hwqi27SH8Q419F/c
         vvLBCD7QFLXsf0wmlbbyaWmMlWGrtm7C4tEx0Otd6w01oef07C02Ay6MnM2qiMcgjfN7
         66AHDckIrcHb6KcdLmAs7y1TREJy7FpncoqbwLjsZ86xflveP11uJsdjyv/9jC0xpEEy
         6xX0k2hNu5UV54QODDtXVocLYoeCOuoH3YDa+58zndZTIZ468HyQd1j9bglkGVNx8FiE
         53pMjwHz/6xFdDT8a+g5B/39nEhurOqQVRx32p6YqgrWd6SJL7j8M7Na9N5BDCxIxMO+
         k9Sg==
X-Gm-Message-State: AOJu0YwkK7fYTHeFIYbj3/pbmW6CMdlQHNpaVw8AoygSFe4q5l2EKjnf
	LakJ5KZ6A3+VGZ3yAVXStWkrOgfN2MysSnFQ5THn3HxQO4G8R0cNAQ2W0y2eLzDK+fKjOT0/Cav
	S
X-Google-Smtp-Source: AGHT+IGKlZlyONY1Fh4qwaATUwJRX3iBK2z94KdnNv9S7V5AJnpfxRC3/Y4tfT48UgAVS1MIuASymA==
X-Received: by 2002:a17:907:1b81:b0:a9e:471e:ce4a with SMTP id a640c23a62f3a-a9e471ed2admr406154766b.11.1730401246249;
        Thu, 31 Oct 2024 12:00:46 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Victor Lira <victorm.lira@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] CI: Drop alpine-3.18-rootfs-export and use test-artefacts
Date: Thu, 31 Oct 2024 19:00:43 +0000
Message-Id: <20241031190043.3011299-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Argo work already moved this artefact into the new form.  Reuse that, and
drop one test job.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Victor Lira <victorm.lira@amd.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1522281815
---
 automation/gitlab-ci/build.yaml | 11 -----------
 automation/gitlab-ci/test.yaml  |  4 +++-
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index af2b1ceba3a4..b5ca2c3f1833 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -304,17 +304,6 @@ qemu-system-aarch64-6.0.0-arm32-export:
 
 # x86_64 test artifacts
 
-alpine-3.18-rootfs-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.18
-  script:
-    - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
-  artifacts:
-    paths:
-      - binaries/initrd.tar.gz
-  tags:
-    - x86_64
-
 kernel-6.1.19-export:
   extends: .test-jobs-artifact-common
   image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.1.19
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index e8f57e87bd19..fe023dae0d42 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -11,8 +11,10 @@
   - qemu-system-aarch64-6.0.0-arm32-export
 
 .x86-64-test-needs: &x86-64-test-needs
-  - alpine-3.18-rootfs-export
   - kernel-6.1.19-export
+  - project: xen-project/hardware/test-artifacts
+    job: x86_64-rootfs-alpine-3.18
+    ref: master
 
 .qemu-arm64:
   extends: .test-jobs-common
-- 
2.39.5


