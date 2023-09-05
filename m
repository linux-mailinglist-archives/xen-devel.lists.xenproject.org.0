Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F02179313C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 23:47:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595839.929466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qddt2-00057e-AW; Tue, 05 Sep 2023 21:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595839.929466; Tue, 05 Sep 2023 21:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qddt2-00055u-7b; Tue, 05 Sep 2023 21:47:04 +0000
Received: by outflank-mailman (input) for mailman id 595839;
 Tue, 05 Sep 2023 21:47:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rZRj=EV=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qddt1-00055j-HD
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 21:47:03 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bea37307-4c35-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 23:47:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id BEAFF8285A0F;
 Tue,  5 Sep 2023 16:47:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Y4O2C3U_i-oP; Tue,  5 Sep 2023 16:46:59 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B5CA08285BE0;
 Tue,  5 Sep 2023 16:46:59 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4HC6_Dc8Gkyq; Tue,  5 Sep 2023 16:46:59 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 1423A8285BDA;
 Tue,  5 Sep 2023 16:46:59 -0500 (CDT)
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
X-Inumbo-ID: bea37307-4c35-11ee-8783-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com B5CA08285BE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1693950419; bh=HPoBwSCbQLNGCbqSv6oxH+y3tTtdXTvzN64OUdvDgbU=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=ZHsJVib6nUh8BY59zfvXiEuqFmtiKwGyH4IKX8iX81S1D6+fbEgkNgDvyIOUVWQDw
	 g96gF/5b2/cGkfI5mSh6shpTqnNKPrBB2NdC7JGSIC+jZbfUeClexlCaByeryjTlrE
	 mH39Su9AMnhatHn7ypgxmreuoDuLhjrTlUhpftrA=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] automation: Switch ppc64le tests to PowerNV machine type
Date: Tue,  5 Sep 2023 16:46:49 -0500
Message-Id: <50693d0763b656bad9d799313c8f12e736bb68ef.1693949731.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1693949731.git.sanastasio@raptorengineering.com>
References: <cover.1693949731.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Run ppc64le tests with the PowerNV machine type (bare metal) instead of
the paravirtualized pseries machine. This requires a more modern version
of QEMU than is present in debian bullseye's repository, so update the
dockerfile to build QEMU from source.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 .../build/debian/bullseye-ppc64le.dockerfile  | 37 ++++++++++++++++++-
 automation/gitlab-ci/test.yaml                |  2 +-
 2 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/automation/build/debian/bullseye-ppc64le.dockerfile b/automa=
tion/build/debian/bullseye-ppc64le.dockerfile
index 8fad26e903..15827bbcf4 100644
--- a/automation/build/debian/bullseye-ppc64le.dockerfile
+++ b/automation/build/debian/bullseye-ppc64le.dockerfile
@@ -1,4 +1,36 @@
+FROM debian:bullseye-slim AS builder
+
+ENV DEBIAN_FRONTEND=3Dnoninteractive
+ENV QEMU_TAG=3Dstable-8.1
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
+RUN git clone --depth 1 --branch "${QEMU_TAG}" https://github.com/qemu/q=
emu && \
+    mkdir qemu/build && \
+    cd qemu/build && \
+    ../configure --target-list=3Dppc64-softmmu && \
+    ninja && \
+    ninja install
+
 FROM debian:bullseye-slim
+COPY --from=3Dbuilder /usr/local/bin/qemu-system-ppc64 /usr/local/bin/qe=
mu-system-ppc64
+COPY --from=3Dbuilder /usr/local/share/qemu/skiboot.lid /usr/local/share=
/qemu/skiboot.lid
+
 LABEL maintainer.name=3D"The Xen Project" \
       maintainer.email=3D"xen-devel@lists.xenproject.org"
=20
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
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.y=
aml
index 9aa8deabea..9b26ccd907 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -457,6 +457,6 @@ qemu-smoke-riscv64-gcc:
 qemu-smoke-ppc64le-pseries-gcc:
   extends: .qemu-ppc64le
   script:
-    - ./automation/scripts/qemu-smoke-ppc64le.sh pseries-5.2 2>&1 | tee =
${LOGFILE}
+    - ./automation/scripts/qemu-smoke-ppc64le.sh powernv9 2>&1 | tee ${L=
OGFILE}
   needs:
     - debian-bullseye-gcc-ppc64le-debug
--=20
2.30.2


