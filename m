Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF94B1F71C
	for <lists+xen-devel@lfdr.de>; Sun, 10 Aug 2025 00:12:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076302.1437950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukrnX-0006V1-8L; Sat, 09 Aug 2025 22:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076302.1437950; Sat, 09 Aug 2025 22:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukrnW-0006QK-WE; Sat, 09 Aug 2025 22:12:19 +0000
Received: by outflank-mailman (input) for mailman id 1076302;
 Sat, 09 Aug 2025 22:12:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gSuF=2V=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukrnV-0005qO-HS
 for xen-devel@lists.xenproject.org; Sat, 09 Aug 2025 22:12:17 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5c3e878-756d-11f0-b898-0df219b8e170;
 Sun, 10 Aug 2025 00:12:11 +0200 (CEST)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-458bf6d69e4so29172715e9.2
 for <xen-devel@lists.xenproject.org>; Sat, 09 Aug 2025 15:12:11 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c453ab0sm35424323f8f.44.2025.08.09.15.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 15:12:10 -0700 (PDT)
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
X-Inumbo-ID: e5c3e878-756d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754777531; x=1755382331; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgBHSZwGd1Mv4E+MHMlHeHL6OU/uMibF4bRSau40TK0=;
        b=QPkoaF9+BMESe6lwPVF3e4LOt07wznvtDDetG36P5IA667aiJEs3tgu20YztSa8PAQ
         sHmZnmijwSDfYFbePtg1lOA/yLLnJVcKgYHNVROXP4VWCIxYsWguUpZA7mkJu7LxV000
         DJzxuACgIwobJdlQgo+4ff5VWNGOHggvxqP7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754777531; x=1755382331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgBHSZwGd1Mv4E+MHMlHeHL6OU/uMibF4bRSau40TK0=;
        b=f10cLDnZqtGPTN8cAb4XS8QjLmQHa6wEcCDi0ggcY5+vIg0Ti2oTB41tsDe1zARai8
         Ut2TgzdcKZ7vbutESIQpJVx46Cn8cfhWnmmMb5o54AIxirRXy0WcrqaxDro3uiohGzj7
         cznTVRETHpmlT7w5moxGHtBcQO7ncy4tOWgryp69ys4IcOJpH9fVCYMH7krhId4QI5Ao
         /yiMd25odxX1c2ydPeyobjs82LpYSVNwdP+2Q6+ZNrPbNX6OPlnW0iT2pPqhW+Fns6CS
         PPOAUI+H845GaXl5+7SQ7cei0HVF6C32Usd1sweR9cPIHdFN9ECtC84zSAe6jWTnpHcT
         FCVw==
X-Gm-Message-State: AOJu0YxwNQKfDmBDcsPRMG6TkMtja8UdvFhwTvL8W7IblZwLQVEoTWX2
	9raC7p/fyEzaEGTlKabf//8YQC6w3PNrJQ2mfOrFt4ggDgRo8xsZxYD1IYjgHn8nTGywUSu+pcQ
	4AXnSsqTweg==
X-Gm-Gg: ASbGnctjGeMJQ0NjjelEqgwIjRg5X54tPX1BZ5hnLhXtwgl2PuT6gJio7SCws72TG97
	M7c3HexVe5vYT4rRr86l877DpdNCdSPoX0v08GLTkKDWayoxNgxM6DJH5nfzZrQh45PoeUl5Z8w
	bWndDLgY1LBfG9CnlaGR7lFQmQiZGbsnA3BNjABvaqy+GAw6+3revxa6QQ3aOjX2tc/L/Qk5FeV
	M/PZsyfrJFRKCo3tq4Hou99TQSWmRDANU6rEHy2MRbNo74RTJEd9PYUK9U07mjeFg4m0QXKf3Pa
	9ooLVfruBvwm4ocS1Dwp2KKyaPapXBV3oFQ7t3ftRcqVD/Q/riV1I2CVPM7Ugp9YXESvfzu8YQu
	Vhs8dDPym2C5D8KqleK2bllVnh9zNwNedJ6IV0UK94g35v9KMJyRDrJCjkQVDemAbDOGMONhiy/
	iC
X-Google-Smtp-Source: AGHT+IF2eO3jSQdww33CznVGiZVxiiyT47RBIRYXhug1GROIV/1Q9aOH6AUZzM+oMef1E2Xh4m69EQ==
X-Received: by 2002:a5d:5f4d:0:b0:3b7:9546:a0e8 with SMTP id ffacd0b85a97d-3b900b7aecbmr6415128f8f.41.1754777530767;
        Sat, 09 Aug 2025 15:12:10 -0700 (PDT)
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
Subject: [PATCH 1/5] CI: Trixie containers
Date: Sat,  9 Aug 2025 23:12:02 +0100
Message-Id: <20250809221206.1260861-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250809221206.1260861-1-andrew.cooper3@citrix.com>
References: <20250809221206.1260861-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Debian Trixie has been released.  Provide new containers.

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

I've deployed these containers already so people can play.

No ARM yet.  There's an (old) outstanding series cleaning up the arm
infrastructure, blocked on unclear root requirements for the Xilinx runners.
That series really needs fixing.
---
 automation/build/debian/13-ppc64le.dockerfile | 37 ++++++++++
 automation/build/debian/13-riscv64.dockerfile | 37 ++++++++++
 automation/build/debian/13-x86_32.dockerfile  | 51 +++++++++++++
 automation/build/debian/13-x86_64.dockerfile  | 74 +++++++++++++++++++
 4 files changed, 199 insertions(+)
 create mode 100644 automation/build/debian/13-ppc64le.dockerfile
 create mode 100644 automation/build/debian/13-riscv64.dockerfile
 create mode 100644 automation/build/debian/13-x86_32.dockerfile
 create mode 100644 automation/build/debian/13-x86_64.dockerfile

diff --git a/automation/build/debian/13-ppc64le.dockerfile b/automation/build/debian/13-ppc64le.dockerfile
new file mode 100644
index 000000000000..5b22a4545842
--- /dev/null
+++ b/automation/build/debian/13-ppc64le.dockerfile
@@ -0,0 +1,37 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 debian:trixie-slim
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV CROSS_COMPILE=powerpc64le-linux-gnu-
+ENV XEN_TARGET_ARCH=ppc64
+
+RUN <<EOF
+#!/bin/bash
+    set -e
+
+    useradd --create-home user
+
+    apt-get update
+
+    DEPS=(
+        # Xen
+        bison
+        build-essential
+        checkpolicy
+        flex
+        gcc-powerpc64le-linux-gnu
+        python3-minimal
+
+        # Qemu for test phase
+        qemu-system-ppc
+        expect
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+    rm -rf /var/lib/apt/lists/*
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/build/debian/13-riscv64.dockerfile b/automation/build/debian/13-riscv64.dockerfile
new file mode 100644
index 000000000000..d2736c657d10
--- /dev/null
+++ b/automation/build/debian/13-riscv64.dockerfile
@@ -0,0 +1,37 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 debian:trixie-slim
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV CROSS_COMPILE=riscv64-linux-gnu-
+ENV XEN_TARGET_ARCH=riscv64
+
+RUN <<EOF
+#!/bin/bash
+    set -e
+
+    useradd --create-home user
+
+    apt-get update
+
+    DEPS=(
+        # Xen
+        bison
+        build-essential
+        checkpolicy
+        flex
+        gcc-riscv64-linux-gnu
+        python3-minimal
+
+        # Qemu for test phase
+        qemu-system-riscv64
+        expect
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+    rm -rf /var/lib/apt/lists/*
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/build/debian/13-x86_32.dockerfile b/automation/build/debian/13-x86_32.dockerfile
new file mode 100644
index 000000000000..3c35c207d25a
--- /dev/null
+++ b/automation/build/debian/13-x86_32.dockerfile
@@ -0,0 +1,51 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/i386 debian:trixie
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+
+RUN <<EOF
+#!/bin/bash
+    set -eu
+
+    useradd --create-home user
+
+    apt-get update
+
+    DEPS=(
+        # Xen
+        bison
+        build-essential
+        checkpolicy
+        clang
+        flex
+
+        # Tools (general)
+        ca-certificates
+        git-core
+        pkg-config
+        wget
+        # libacpi
+        acpica-tools
+        # libxl
+        uuid-dev
+        libyajl-dev
+        # xentop
+        libncurses5-dev
+        # Python bindings
+        python3-dev
+        python3-setuptools
+        # Ocaml bindings/oxenstored
+        ocaml-nox
+        ocaml-findlib
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+
+    rm -rf /var/lib/apt/lists*
+EOF
+
+USER user
+WORKDIR /build
+ENTRYPOINT ["linux32"]
diff --git a/automation/build/debian/13-x86_64.dockerfile b/automation/build/debian/13-x86_64.dockerfile
new file mode 100644
index 000000000000..947e68a440de
--- /dev/null
+++ b/automation/build/debian/13-x86_64.dockerfile
@@ -0,0 +1,74 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 debian:trixie
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+
+RUN <<EOF
+#!/bin/bash
+    set -eu
+
+    apt-get update
+
+    DEPS=(
+        # Xen
+        bison
+        build-essential
+        checkpolicy
+        clang
+        flex
+
+        # Tools (general)
+        ca-certificates
+        git-core
+        pkg-config
+        wget
+        # libxenguest dombuilder
+        libbz2-dev
+        liblzma-dev
+        liblzo2-dev
+        libzstd-dev
+        zlib1g-dev
+        # libacpi
+        acpica-tools
+        # libxl
+        uuid-dev
+        libnl-3-dev
+        libyajl-dev
+        # RomBIOS
+        bcc
+        bin86
+        # xentop
+        libncurses5-dev
+        # Python bindings
+        python3-dev
+        python3-setuptools
+        # Golang bindings
+        golang-go
+        # Ocaml bindings/oxenstored
+        ocaml-nox
+        ocaml-findlib
+
+        # for test phase, qemu-smoke-* jobs
+        expect
+        qemu-system-x86
+
+        # for build-each-commit-gcc
+        ccache
+
+        # for qemu-alpine-x86_64-gcc
+        busybox-static
+        cpio
+
+        # For *-efi jobs
+        ovmf
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+
+    rm -rf /var/lib/apt/lists*
+EOF
+
+USER root
+WORKDIR /build
-- 
2.39.5


