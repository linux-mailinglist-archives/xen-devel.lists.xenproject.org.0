Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37630B1F71F
	for <lists+xen-devel@lfdr.de>; Sun, 10 Aug 2025 00:12:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076297.1437914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukrnU-0005sb-M4; Sat, 09 Aug 2025 22:12:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076297.1437914; Sat, 09 Aug 2025 22:12:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukrnU-0005qd-IE; Sat, 09 Aug 2025 22:12:16 +0000
Received: by outflank-mailman (input) for mailman id 1076297;
 Sat, 09 Aug 2025 22:12:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gSuF=2V=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukrnT-0005qN-1o
 for xen-devel@lists.xenproject.org; Sat, 09 Aug 2025 22:12:15 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6b94cbe-756d-11f0-a325-13f23c93f187;
 Sun, 10 Aug 2025 00:12:13 +0200 (CEST)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so25592555e9.3
 for <xen-devel@lists.xenproject.org>; Sat, 09 Aug 2025 15:12:13 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c453ab0sm35424323f8f.44.2025.08.09.15.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 15:12:12 -0700 (PDT)
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
X-Inumbo-ID: e6b94cbe-756d-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754777532; x=1755382332; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1InbWNIn9kEj9hdKR1puWI33YAQ4yKAVpamMRnwML8=;
        b=QrTmMDOa6lu4F89PpnRD+MQvYq2TxS43PhwtMoq3akOSTzSeeKrHd1Tvw1aELCgkKD
         HBRZKzVf8pnRsJfMbrNmpXpyu+W5dWemcdcmgk5xWAZqOxNsYeGnVL1EVJSZOA/f5Y1S
         O/Nvp9fu7Oc3XI8cmqcD5J1FYYAT2llBSXbjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754777532; x=1755382332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W1InbWNIn9kEj9hdKR1puWI33YAQ4yKAVpamMRnwML8=;
        b=JPI8jSmHf0VTVwQrQaBu9+hVkEz453ag+aCkNXcs3FITZ3zhY/v0/plqAP5uqe4lkl
         ObjSmJmp2T7nfYycyEWGT4DXgTYwaVlBbPMUOE4zSkF9UTpa3LRUxWVDmGQujHZaCTG1
         dx9iaW8ep//CAQfWHQWUi7jv1YG5/1m6ROhjTH7U4jrXLqMp924w0s04rfTYpyGUc8c6
         d2+a1CZul3Avp3tgQUHPAkYYkF7il/DNclcPz4FFbgf/J0BuNikjYj7ETXtu40lSEtw8
         LafvhpeC7GKnD3wNWf2m9AnX8pLz4Xex4rC8TwFTdFcO4BQE0qwp5sWYrUhNMM4AuEZa
         wBjw==
X-Gm-Message-State: AOJu0YzwMLjZnNkzrWvyO+Ypw/CFe0t9htKNxL44UaJqpjcVBry4q1k3
	dqcC95FB9ZB2dsLCWWXWlju1mQJ7eOd79w59aRJdSLQ6IpXQkU4kSSn4hxhjbGYFeRGRuNy+N3J
	bDY8lMk4t8A==
X-Gm-Gg: ASbGnctDm3O5Sxl3aY6OyTxnPwL89oiaozc8DwxL1O6EPbWF45BDboQ6m73Aa+i+UFN
	uZewh5bzWdwmNbfm7AkgHEeTuN3yy+IbBmzp5SMOY5NXm4YAv1TKrZKLWh0Wavs05bhkNz5kLb4
	fc9rENoV80B+9eCdkLa765jfthhS2NCzn/Uz+A+prJvlLH13LuhhvxWmqE1DM4xj3HgaisewJAT
	+U+Gjj0GGniEpxALSK08l224wNJY2HmXpIIAo1UQ0MjiAzHTXTnd2JyFADwjtizDN6F1fTAB54u
	w1ZofU3+1F2Iud6k3HJ/067ZtSs7DDqCNwJGO7lAqn5RLUvsuQHyx4UMjGMko3JgVx2xZLT2gwU
	jLJSbCvlXlbjQ9FCBFpOjOdOBMitXeyYkwJFaPXJZBO7LU6nj2FKu85+NiLhvgKe13MI0YmRkqX
	MG
X-Google-Smtp-Source: AGHT+IEWLBt6JAVymy0iPTqZYOzsL0c0vEPxi/XIXIpC2HGIwkuFh1Wii6izAKTSzTIP0QpJ3amErA==
X-Received: by 2002:a05:600c:5254:b0:456:13d8:d141 with SMTP id 5b1f17b1804b1-459f4f282damr60550315e9.27.1754777532480;
        Sat, 09 Aug 2025 15:12:12 -0700 (PDT)
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
Subject: [PATCH 3/5] CI: Update riscv64 to use Debian Trixie
Date: Sat,  9 Aug 2025 23:12:04 +0100
Message-Id: <20250809221206.1260861-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250809221206.1260861-1-andrew.cooper3@citrix.com>
References: <20250809221206.1260861-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Everything works fine with Debian 13.  Provide two new build jobs, and update
both the randconfig the test jobs.

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

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1975929387
---
 automation/gitlab-ci/build.yaml | 22 ++++++++++++++++++----
 automation/gitlab-ci/test.yaml  |  2 +-
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 3fe539dc5683..f8e45f3467c8 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -329,10 +329,10 @@ debian-13-ppc64le-gcc-debug:
       CONFIG_UBSAN=y
       CONFIG_UBSAN_FATAL=y
 
-debian-12-riscv64-gcc-debug:
+debian-13-riscv64-gcc-debug:
   extends: .gcc-riscv64-cross-build-debug
   variables:
-    CONTAINER: debian:12-riscv64
+    CONTAINER: debian:13-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     HYPERVISOR_ONLY: y
     EXTRA_XEN_CONFIG: |
@@ -727,6 +727,20 @@ debian-12-riscv64-gcc:
     KBUILD_DEFCONFIG: tiny64_defconfig
     HYPERVISOR_ONLY: y
 
+debian-12-riscv64-gcc-debug:
+  extends: .gcc-riscv64-cross-build-debug
+  variables:
+    CONTAINER: debian:12-riscv64
+    KBUILD_DEFCONFIG: tiny64_defconfig
+    HYPERVISOR_ONLY: y
+
+debian-13-riscv64-gcc:
+  extends: .gcc-riscv64-cross-build
+  variables:
+    CONTAINER: debian:13-riscv64
+    KBUILD_DEFCONFIG: tiny64_defconfig
+    HYPERVISOR_ONLY: y
+
 .riscv-fixed-randconfig:
   variables: &riscv-fixed-randconfig
     EXTRA_FIXED_RANDCONFIG: |
@@ -739,10 +753,10 @@ debian-12-riscv64-gcc:
       CONFIG_VM_EVENT=n
       CONFIG_XSM=n
 
-debian-12-riscv64-gcc-randconfig:
+debian-13-riscv64-gcc-randconfig:
   extends: .gcc-riscv64-cross-build
   variables:
-    CONTAINER: debian:12-riscv64
+    CONTAINER: debian:13-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     RANDCONFIG: y
     <<: *riscv-fixed-randconfig
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 2f6f3affa637..9acd984d294c 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -705,7 +705,7 @@ qemu-smoke-riscv64-gcc:
   script:
     - ./automation/scripts/qemu-smoke-riscv64.sh 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-12-riscv64-gcc-debug
+    - debian-13-riscv64-gcc-debug
 
 qemu-smoke-ppc64le-powernv9-gcc:
   extends: .qemu-ppc64le
-- 
2.39.5


