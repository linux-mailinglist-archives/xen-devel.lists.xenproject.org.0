Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DD0796DD1
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 02:02:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596922.931063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe2TD-0000yo-NF; Thu, 07 Sep 2023 00:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596922.931063; Thu, 07 Sep 2023 00:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe2TD-0000uL-Hi; Thu, 07 Sep 2023 00:02:03 +0000
Received: by outflank-mailman (input) for mailman id 596922;
 Thu, 07 Sep 2023 00:02:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=myun=EX=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qe2TC-0000nY-5g
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 00:02:02 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c429057b-4d11-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 02:02:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4435E82854B3;
 Wed,  6 Sep 2023 19:01:59 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id md8U0ps7x769; Wed,  6 Sep 2023 19:01:57 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B6A9A82857F5;
 Wed,  6 Sep 2023 19:01:57 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id b8aXadSV1Hv9; Wed,  6 Sep 2023 19:01:57 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 1E0508285589;
 Wed,  6 Sep 2023 19:01:56 -0500 (CDT)
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
X-Inumbo-ID: c429057b-4d11-11ee-8783-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com B6A9A82857F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1694044917; bh=7sBp8XJ8KbdQFCiJLgArYXVYw6X5ajJplyaE4vmYOEQ=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=a8BZw41BRx2U9iLwXzb68v3xF88CVjhEM+njjcg/fmi8iT3f6HRtvfjmoQpuyXbzX
	 bWYLOtk+0bwOFUQiFMGsKAy/WdkThxBXPm2kaxl+6PUAMRwdMV/swnMiSalraDaIS1
	 lp38uXKzSNeGU3j4+gX2gvw/iyq9UOEVBpnM/HmY=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/2] automation: Switch ppc64le tests to PowerNV machine type
Date: Wed,  6 Sep 2023 19:01:45 -0500
Message-Id: <85b53762ba04a349ba099cf5629e7ac24f496d69.1694044614.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1694044614.git.sanastasio@raptorengineering.com>
References: <cover.1694044614.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Run ppc64le tests with the PowerNV machine type (bare metal) instead of
the paravirtualized pseries machine. This requires a more modern version
of QEMU than is present in debian bullseye's repository, so update the
dockerfile to build QEMU from source.

Support for booting on pseries was broken by 74b725a64d80 ('xen/ppc:
Implement initial Radix MMU support') which resulted in CI failures. In
preparation for removing pseries support entirely, switch the CI
infrastructure to the PowerNV machine type.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 .../build/debian/bullseye-ppc64le.dockerfile  | 37 ++++++++++++++++++-
 automation/gitlab-ci/test.yaml                |  2 +-
 2 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/automation/build/debian/bullseye-ppc64le.dockerfile b/automation/build/debian/bullseye-ppc64le.dockerfile
index 8fad26e903..15827bbcf4 100644
--- a/automation/build/debian/bullseye-ppc64le.dockerfile
+++ b/automation/build/debian/bullseye-ppc64le.dockerfile
@@ -1,4 +1,36 @@
+FROM debian:bullseye-slim AS builder
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV QEMU_TAG=stable-8.1
+ENV USER root
+
+# dependencies for qemu build
+RUN apt-get update && \
+    apt-get --quiet --yes install \
+        git \
+        build-essential \
+        python3-minimal \
+        python3-elementpath \
+        python3-pip \
+        ninja-build \
+        libglib2.0-dev \
+        libpixman-1-dev
+
+RUN mkdir /build
+WORKDIR /build
+
+# QEMU build from git
+RUN git clone --depth 1 --branch "${QEMU_TAG}" https://github.com/qemu/qemu && \
+    mkdir qemu/build && \
+    cd qemu/build && \
+    ../configure --target-list=ppc64-softmmu && \
+    ninja && \
+    ninja install
+
 FROM debian:bullseye-slim
+COPY --from=builder /usr/local/bin/qemu-system-ppc64 /usr/local/bin/qemu-system-ppc64
+COPY --from=builder /usr/local/share/qemu/skiboot.lid /usr/local/share/qemu/skiboot.lid
+
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
@@ -22,8 +54,9 @@ RUN apt-get update && \
         gcc-powerpc64le-linux-gnu \
         make \
         python3-minimal \
-        # for test phase
-        qemu-system-ppc \
+        # QEMU runtime dependencies
+        libglib2.0-0 \
+        libpixman-1-0 \
         && \
         apt-get autoremove -y && \
         apt-get clean && \
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 9aa8deabea..9b26ccd907 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -457,6 +457,6 @@ qemu-smoke-riscv64-gcc:
 qemu-smoke-ppc64le-pseries-gcc:
   extends: .qemu-ppc64le
   script:
-    - ./automation/scripts/qemu-smoke-ppc64le.sh pseries-5.2 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qemu-smoke-ppc64le.sh powernv9 2>&1 | tee ${LOGFILE}
   needs:
     - debian-bullseye-gcc-ppc64le-debug
-- 
2.30.2


