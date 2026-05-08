Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGrrCLlV/mmepQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 23:29:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9869F4FBE9C
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 23:29:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304254.1577369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLSl2-0005gv-Ah; Fri, 08 May 2026 21:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304254.1577369; Fri, 08 May 2026 21:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLSl2-0005ah-4j; Fri, 08 May 2026 21:29:16 +0000
Received: by outflank-mailman (input) for mailman id 1304254;
 Fri, 08 May 2026 21:29:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLSl0-0005Gs-GH
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 21:29:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLSkz-000E8K-Tf
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 23:29:13 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69fe5508-5cb7-0a2a0a5109dd-0a2a4508bcd8-36
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 23:29:13 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69fe55a9-63b5-0a2a45080019-d155dd35d1fa-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 23:29:13 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-45297094718so1933598f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 14:29:13 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491ca383asm7548608f8f.28.2026.05.08.14.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 14:29:12 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1778275753; x=1778880553; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pK0KfhDLNVVZ6TWY1JZ97U9wzF5HmGiXTOWuG1PAs8=;
        b=YW3kIXyVCV8+kHX+dX/5jZATJW7G7uq0dyrX8E73zEn4p2fOeEETk1k4wI8HAIhrPX
         Rp1GBc4oknSKFIj/fiBOfX0bZhL7yq5tCb0A1/PumjWCN/ABRGG4IocqJkjSyMi+ViZL
         wKBzeBKiIGeaJbfzPJnBBM+c9oYOGrqzVAwUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275753; x=1778880553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3pK0KfhDLNVVZ6TWY1JZ97U9wzF5HmGiXTOWuG1PAs8=;
        b=dlNSijxEWSRPDiTLlbYPA5FAwwFpjOSd4clmjm0nngbNWb3AbsD54OwXjIO70bqwQg
         WT0Deys9lxXwIeq4JH+NuIx2fo/mdUID2llbJF/00qhlqFQyW6Un4H/3cjvROj0PoGqE
         pwbTZB8PwW4CX/qsKW7x/YbLE2riyoLDDWCgEOmwYalhKconig29/irES0VPUQZiBn8X
         OQt9/ZWFlPooMDWlufxgFRD8ZIQ66DFKM++qW6F1AJMNDjsCWB5sVt1hmvWTuUHPMqeV
         81mSSGPqaH46gHa/gbF5BOF6CSTYfQLd+v60wiCsw79/9/qPXTAfi21567zk6ikh1izC
         jt6A==
X-Gm-Message-State: AOJu0YwqcYkRwTMU9/wQBnIHf0SVNGb1YOvsVxJNbjun9NQAKg3JRom4
	4EHAcFRnDT5j5NI78vX5c2kpqJvhwKt1lRFAqbhux2lprZAKbBpZyjEFbnQl4Z2mPCcOq3e8vbi
	uWY98TNU=
X-Gm-Gg: Acq92OFzvjrCyTD7wcmF4A2+qn4i7P6kuLewlqw3flIeTLFxURqiqzEwAWwTyq7Fbyv
	/TKxUkChP06n3WcGqzP3tyJN4TQ/hQB2FHDdK8JuhPeq7EjKfY7XGIKzmuye/J8hFPBT2pl5coC
	A1pv4FNmmLobzBXkaK+jZX8fBu06IlUmdjsvWel8ahJxuvcVE+Msu5ZvEzgcSDUN03HGhoqDqHE
	f2mUDwZGKcDFJbz64bJn75eoy/evfJGeQSJh85yyNJtfCvSZOrk63hkCex5N7Kj9rCwXixm8cZ2
	Hw29FJbAjMBHJnYxIBhGxj7MDc58RvjkB5yRq306GEBtlZsocAEkPGClL+ywtwFSZK1KWBp1Qg5
	0Wp/ssEpQRBvq/8xIY0t0qa2NmKh/jvm1OItJAn/hfu/yCnvHYbWrNae/qyjaNADiqtMfFnG3M5
	hdnfetXo+ysnDhBuHYS9sxUhm8i0L5ka80McQHDrfj7yy9qHC7XPxUJO7/DtuuXkabKGLWgKf3l
	495MarUsTTkI3g=
X-Received: by 2002:a05:6000:2087:b0:451:b1a:a753 with SMTP id ffacd0b85a97d-4515b0572a7mr22726817f8f.6.1778275752521;
        Fri, 08 May 2026 14:29:12 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 5/5] CI: Switch qemu-arm* jobs to using the distro provided QEMU
Date: Fri,  8 May 2026 22:29:07 +0100
Message-Id: <20260508212907.1643761-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260508212907.1643761-1-andrew.cooper3@citrix.com>
References: <20260508212907.1643761-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1778275753-B5F6ADB1-C4C1A11A/10/63158204843
X-purgate-type: spam
X-purgate-size: 11153
X-Rspamd-Queue-Id: 9869F4FBE9C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,citrix.com:dkim,xenproject.org:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,gitlab.com:url,qemu.org:url];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

This removes qemu-system-aarch64-6.0.0-*-export and fixes the outstanding
TODOs about efi-virtio.rom, now that the QEMU in use has it's /usr/share/
properly packaged.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
---
 automation/gitlab-ci/build.yaml               | 33 --------
 automation/gitlab-ci/test.yaml                |  2 -
 automation/scripts/include/xtf-arm64          |  7 +-
 automation/scripts/qemu-smoke-dom0-arm32.sh   |  6 +-
 automation/scripts/qemu-smoke-dom0-arm64.sh   |  6 +-
 .../scripts/qemu-smoke-dom0less-arm32.sh      |  6 +-
 .../scripts/qemu-smoke-dom0less-arm64.sh      |  6 +-
 .../6.0.0-arm64v8.dockerfile                  | 77 -------------------
 8 files changed, 10 insertions(+), 133 deletions(-)
 delete mode 100644 automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index e50ff6936c5c..be4a038363ac 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -265,39 +265,6 @@
   variables:
     <<: *gcc
 
-## Test artifacts common
-
-.test-jobs-artifact-common:
-  stage: build
-  needs: []
-  rules:
-    - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
-      when: on_success
-
-# Arm test artifacts
-
-qemu-system-aarch64-6.0.0-arm64-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:6.0.0-arm64v8
-  script:
-    - mkdir binaries && cp /qemu-system-aarch64 binaries/qemu-system-aarch64
-  artifacts:
-    paths:
-      - binaries/qemu-system-aarch64
-  tags:
-    - arm64
-
-qemu-system-aarch64-6.0.0-arm32-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:6.0.0-arm64v8
-  script:
-    - mkdir binaries && cp /qemu-system-arm binaries/qemu-system-arm
-  artifacts:
-    paths:
-      - binaries/qemu-system-arm
-  tags:
-    - arm64
-
 # Jobs below this line
 
 # Build jobs needed for tests
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 008deef98d1e..1722800c1541 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -12,7 +12,6 @@
   - project: $ARTIFACTS_REPO
     job: alpine-3.18-arm64-rootfs
     ref: $ARTIFACTS_BRANCH
-  - qemu-system-aarch64-6.0.0-arm64-export
 
 .arm32-test-needs: &arm32-test-needs
   # Bodge to ensure binaries/ is non-root.  Can be any artefact which comes
@@ -21,7 +20,6 @@
   - project: $ARTIFACTS_REPO
     job: microcode-x86
     ref: $ARTIFACTS_BRANCH
-  - qemu-system-aarch64-6.0.0-arm32-export
 
 .x86-64-test-needs: &x86-64-test-needs
   - project: $ARTIFACTS_REPO
diff --git a/automation/scripts/include/xtf-arm64 b/automation/scripts/include/xtf-arm64
index 1a318b7aa0ba..5d851af788a1 100644
--- a/automation/scripts/include/xtf-arm64
+++ b/automation/scripts/include/xtf-arm64
@@ -7,7 +7,7 @@
 function xtf_arch_prepare()
 {
     export FW_PREFIX="${FW_PREFIX:-/usr/lib/u-boot/qemu_arm64/}"
-    export QEMU_PREFIX="${QEMU_PREFIX:-${WORKDIR}/}"
+    export QEMU_PREFIX="${QEMU_PREFIX:-}"
     export XEN_BINARY="${XEN_BINARY:-${WORKDIR}/xen}"
     export XEN_CMDLINE="${XEN_CMDLINE:-loglvl=all noreboot console_timestamps=boot console=dtuart}"
     export XTF_SRC_BRANCH="${XTF_SRC_BRANCH:-xtf-arm}"
@@ -18,9 +18,6 @@ function xtf_arch_prepare()
 # Perform arch-specific XTF environment setup.
 function xtf_arch_setup()
 {
-    # QEMU looks for "efi-virtio.rom" even if it is unneeded
-    curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
-
     # Crude check for local testing
     if [ ! -d imagebuilder ]; then
         git clone --depth 1 https://gitlab.com/xen-project/imagebuilder.git
@@ -47,7 +44,7 @@ EOF
     cp ${XTF_BINARY} ${WORKDIR}/xtf-test
 
     # Generate virt-gicv2.dtb
-    ${WORKDIR}/qemu-system-aarch64 \
+    ${QEMU_PREFIX}qemu-system-aarch64 \
         -machine virtualization=true \
         -cpu cortex-a57 \
         -machine type=virt \
diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index 58797f7d30d3..5dc348c71aa9 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -39,9 +39,7 @@ cp ../zImage ./root
 find . | cpio -R 0:0 -H newc -o | gzip > ../initrd.gz
 cd ..
 
-# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
-curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
-./qemu-system-arm \
+qemu-system-arm \
    -machine virt \
    -machine virtualization=true \
    -smp 4 \
@@ -77,7 +75,7 @@ git clone --depth 1 https://gitlab.com/xen-project/imagebuilder.git
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
 
 rm -f ${serial_log}
-export TEST_CMD="./qemu-system-arm \
+export TEST_CMD="qemu-system-arm \
    -machine virt \
    -machine virtualization=true \
    -smp 4 \
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index 05962bdc0203..1d673f184251 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -57,9 +57,7 @@ chmod +x etc/local.d/xen.start
 find . | cpio -R 0:0 -H newc -o | gzip >> ../dom0-rootfs.cpio.gz
 cd ../..
 
-# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
-curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
-./binaries/qemu-system-aarch64 \
+qemu-system-aarch64 \
    -machine virtualization=true \
    -cpu cortex-a57 -machine type=virt \
    -m 2048 -smp 2 -display none \
@@ -90,7 +88,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf
 
 # Run the test
 rm -f smoke.serial
-export TEST_CMD="./binaries/qemu-system-aarch64 \
+export TEST_CMD="qemu-system-aarch64 \
     -machine virtualization=true \
     -cpu cortex-a57 -machine type=virt \
     -m 2048 -monitor none -serial stdio \
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index 627d890a3926..20e43b4f049d 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -78,9 +78,7 @@ chmod +x init
 find . | cpio -R 0:0 -H newc -o | gzip > ../initrd.gz
 cd ..
 
-# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
-curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
-./qemu-system-arm \
+qemu-system-arm \
     -machine virt \
     -machine virtualization=true \
     -smp 4 \
@@ -130,7 +128,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
 
 # Run the test
 rm -f ${serial_log}
-export TEST_CMD="./qemu-system-arm \
+export TEST_CMD="qemu-system-arm \
     -machine virt \
     -machine virtualization=true \
     -smp 4 \
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index 05c4a6acbb59..a9e99f1ae392 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -78,9 +78,7 @@ if [[ "${test_variant}" == "gicv3" ]]; then
     domU_check="echo \"${passed}\""
 fi
 
-# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
-curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
-./binaries/qemu-system-aarch64 \
+qemu-system-aarch64 \
    -machine virtualization=true \
    -cpu cortex-a57 -machine type=virt,gic-version=$gic_version \
    -m 2048 -smp 2 -display none \
@@ -203,7 +201,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf
 
 # Run the test
 rm -f smoke.serial
-export TEST_CMD="./binaries/qemu-system-aarch64 \
+export TEST_CMD="qemu-system-aarch64 \
     -machine virtualization=true \
     -cpu cortex-a57 -machine type=virt,gic-version=$gic_version \
     -m 2048 -monitor none -serial stdio \
diff --git a/automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile b/automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile
deleted file mode 100644
index e9f5576be7a6..000000000000
--- a/automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile
+++ /dev/null
@@ -1,77 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/arm64/v8 debian:bookworm
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV DEBIAN_FRONTEND=noninteractive
-ENV QEMU_VERSION=6.0.0
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-# build depends
-RUN apt-get update && \
-    apt-get --quiet --yes install \
-        build-essential \
-        curl \
-        python3 \
-        ninja-build \
-        pkg-config \
-        libglib2.0-dev \
-        libpixman-1-dev \
-        && \
-    \
-    curl -fsSLO https://download.qemu.org/qemu-"$QEMU_VERSION".tar.xz && \
-    tar xvJf qemu-"$QEMU_VERSION".tar.xz && \
-    cd qemu-"$QEMU_VERSION" && \
-    ./configure                \
-        --target-list=arm-softmmu,aarch64-softmmu \
-        --enable-system        \
-        --disable-blobs        \
-        --disable-bsd-user     \
-        --disable-debug-info   \
-        --disable-glusterfs    \
-        --disable-gtk          \
-        --disable-guest-agent  \
-        --disable-linux-user   \
-        --disable-sdl          \
-        --disable-spice        \
-        --disable-tpm          \
-        --disable-vhost-net    \
-        --disable-vhost-scsi   \
-        --disable-vhost-user   \
-        --disable-vhost-vsock  \
-        --disable-virtfs       \
-        --disable-vnc          \
-        --disable-werror       \
-        --disable-xen          \
-        --disable-safe-stack   \
-        --disable-libssh       \
-        --disable-opengl       \
-        --disable-tools        \
-        --disable-virglrenderer  \
-        --disable-stack-protector  \
-        --disable-containers   \
-        --disable-replication  \
-        --disable-cloop        \
-        --disable-dmg          \
-        --disable-vvfat        \
-        --disable-vdi          \
-        --disable-parallels    \
-        --disable-qed          \
-        --disable-bochs        \
-        --disable-qom-cast-debug  \
-        --disable-vhost-vdpa   \
-        --disable-vhost-kernel \
-        --disable-qcow1        \
-        --disable-live-block-migration \
-    && \
-    make -j$(nproc) && \
-    cp ./build/qemu-system-aarch64 / && \
-    cp ./build/qemu-system-arm / && \
-    cd /build && \
-    rm -rf qemu-"$QEMU_VERSION"* && \
-    apt-get autoremove -y && \
-    apt-get clean && \
-    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
-- 
2.39.5


