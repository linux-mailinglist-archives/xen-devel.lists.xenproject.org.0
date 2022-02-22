Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BD44BFCB9
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:35:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276937.473340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXCD-0007Gx-Ox; Tue, 22 Feb 2022 15:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276937.473340; Tue, 22 Feb 2022 15:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXCD-0007D2-JY; Tue, 22 Feb 2022 15:35:21 +0000
Received: by outflank-mailman (input) for mailman id 276937;
 Tue, 22 Feb 2022 15:35:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Woib=TF=citrix.com=prvs=045a4fa17=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMXCC-0005NF-6f
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:35:20 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09049ed6-93f5-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 16:35:18 +0100 (CET)
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
X-Inumbo-ID: 09049ed6-93f5-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645544118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9BMxMs0/UjXMNi6oqpZA+0tBs6ppueg9ifVrUwTcBD8=;
  b=ODa+BXCc3zKeX/vK7bZgMzYzYNLLJRbcMA0usGpI5QY0wIfLcYx+g3O2
   Wy9F9Up2AMc5Ujx4gNjhJkLQWsNS529S2cjQT/J87eBcQaX1dTeOLNDEt
   2F/iE75SVsvsKS63k4tFiDWc2JwGRAQUTOfyJ+MP1g40GoDcY+sC2U9uK
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64734288
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9f87lqxvqKXxUqAZRPN6t+czxirEfRIJ4+MujC+fZmUNrF6WrkVUz
 zYXWWjTb6uPNDP9c91yOd7k8kpXvMOBn9c2SFE5rSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy24LhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplmca6ZwgFE4r3kfk/fxtdT3BGBvBN0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 5VCNWA/PHwsZTVSH1A2AZ8lwNyumyOnLhZUqV2E/I4Otj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO8Fg4i+C5ofz2A+EJEQGS2IQUOd7v+ZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtACzARVodt/xory9U
 J4swZP2AAcmV8zlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1b5paKGK0O
 hOK4Wu9AaO/2lPwNsebhKrrVqwXIVXIT4y5Bpg4kPIUCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGNr9ZIdAhSdSJT6FKfg5U/S9Nv6zFOQAkJY8I9C5t4JOSJQ4w9ej/0w
 0yA
IronPort-HdrOrdr: A9a23:Ea+c66hT0RpqdHBmgBOp4kyCs3BQXuIji2hC6mlwRA09TySZ//
 rBoB19726MtN9xYgBHpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdWSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="64734288"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 59/70] x86: Use control flow typechecking where possible
Date: Tue, 22 Feb 2022 15:26:43 +0000
Message-ID: <20220222152645.8844-14-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220222152645.8844-1-andrew.cooper3@citrix.com>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Now all callees have been annotated, turn on typechecking to catch issues in
the future.

This extension isn't in a released version of GCC yet, so provide a container
to use with the extention included, and add it to CI.  RANDCONFIG is necessary
because some stubs for compiled-out subsystems are used as function pointer
targets.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v3:
 * Provide container.  Already pushed to Gitlab.
---
 automation/build/debian/buster-gcc-ibt.dockerfile | 66 +++++++++++++++++++++++
 automation/gitlab-ci/build.yaml                   |  6 +++
 automation/scripts/containerize                   |  1 +
 xen/arch/x86/arch.mk                              |  1 +
 4 files changed, 74 insertions(+)
 create mode 100644 automation/build/debian/buster-gcc-ibt.dockerfile

diff --git a/automation/build/debian/buster-gcc-ibt.dockerfile b/automation/build/debian/buster-gcc-ibt.dockerfile
new file mode 100644
index 000000000000..441d9a9ab37a
--- /dev/null
+++ b/automation/build/debian/buster-gcc-ibt.dockerfile
@@ -0,0 +1,66 @@
+FROM debian:buster-slim AS builder
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV USER root
+
+RUN apt-get update && \
+    apt-get --quiet --yes install \
+        bison \
+        build-essential \
+        flex \
+        libc6-dev-i386 \
+        libgmp-dev \
+        libisl-dev \
+        libmpc-dev \
+        libmpfr-dev \
+        patch \
+        wget
+
+RUN mkdir /build
+WORKDIR /build
+
+RUN wget -q https://ftp.gnu.org/gnu/gcc/gcc-11.2.0/gcc-11.2.0.tar.xz -O - | tar xJ --strip=1
+RUN wget -q https://xenbits.xen.org/people/andrewcoop/gcc-11.2-Add-fcf-check-attribute-yes-no.patch -O - | patch -p1
+RUN ./configure \
+        --prefix=/opt/gcc-11-ibt \
+        --enable-languages=c \
+        --disable-nls \
+        --disable-threads \
+        --disable-bootstrap \
+        --disable-shared \
+        --disable-libmudflap \
+        --disable-libssp \
+        --disable-libgomp \
+        --disable-decimal-float \
+        --disable-libquadmath \
+        --disable-libatomic \
+        --disable-libcc1 \
+        --disable-libmpx
+RUN make -j`nproc` && make -j`nproc` install
+
+
+FROM debian:buster-slim
+COPY --from=builder /opt/gcc-11-ibt /opt/gcc-11-ibt
+
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV USER root
+ENV PATH="/opt/gcc-11-ibt/bin:${PATH}"
+
+RUN mkdir /build
+WORKDIR /build
+
+RUN apt-get update && \
+    apt-get --quiet --yes install \
+        bison \
+        checkpolicy \
+        flex \
+        gawk \
+        make \
+        python3 \
+        && \
+        apt-get autoremove -y && \
+        apt-get clean && \
+        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index fdd5c76582b3..cc36428cf55b 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -294,6 +294,12 @@ debian-stretch-32-gcc-debug:
   variables:
     CONTAINER: debian:stretch-i386
 
+debian-buster-gcc-ibt:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: debian:buster-gcc-ibt
+    RANDCONFIG: y
+
 debian-unstable-clang:
   extends: .clang-x86-64-build
   variables:
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 7682ccd34759..8992c67278ae 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -33,6 +33,7 @@ case "_${CONTAINER}" in
     _focal) CONTAINER="${BASE}/ubuntu:focal" ;;
     _jessie) CONTAINER="${BASE}/debian:jessie" ;;
     _stretch|_) CONTAINER="${BASE}/debian:stretch" ;;
+    _buster-gcc-ibt) CONTAINER="${BASE}/debian:buster-gcc-ibt" ;;
     _unstable|_) CONTAINER="${BASE}/debian:unstable" ;;
     _trusty) CONTAINER="${BASE}/ubuntu:trusty" ;;
     _xenial) CONTAINER="${BASE}/ubuntu:xenial" ;;
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index f780c912a9cf..92fd19811013 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -54,6 +54,7 @@ endif
 
 ifdef CONFIG_XEN_IBT
 CFLAGS += -fcf-protection=branch -mmanual-endbr
+$(call cc-option-add,CFLAGS,CC,-fcf-check-attribute=no)
 else
 $(call cc-option-add,CFLAGS,CC,-fcf-protection=none)
 endif
-- 
2.11.0


