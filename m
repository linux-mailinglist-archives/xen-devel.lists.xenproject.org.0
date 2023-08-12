Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3576779C7C
	for <lists+xen-devel@lfdr.de>; Sat, 12 Aug 2023 04:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582757.912688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUe1s-0002Zc-Dj; Sat, 12 Aug 2023 02:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582757.912688; Sat, 12 Aug 2023 02:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUe1s-0002XA-8x; Sat, 12 Aug 2023 02:07:00 +0000
Received: by outflank-mailman (input) for mailman id 582757;
 Sat, 12 Aug 2023 02:06:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WvX7=D5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qUe1r-0002HO-59
 for xen-devel@lists.xenproject.org; Sat, 12 Aug 2023 02:06:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e94e9f63-38b4-11ee-8613-37d641c3527e;
 Sat, 12 Aug 2023 04:06:56 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E62364BA0;
 Sat, 12 Aug 2023 02:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF803C433C7;
 Sat, 12 Aug 2023 02:06:53 +0000 (UTC)
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
X-Inumbo-ID: e94e9f63-38b4-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691806014;
	bh=rgFvj7KHf0sLL1nBh8WzdlxT1VThhWRqV5y19fnRlwQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WaEx2Gr5j8t5Yna/SUm3xrJnSW4atrWaSR5xIOC28aUoZMSFR4uk8LJ6zZrhZaWbp
	 jphHEYrKutRe7XYHaICC2mlWAJ7RmLZ3Iqzun1sueNO+Xm42AUtAzw5bY/nS1s1XpZ
	 IFyKWx30DWrm5lncl53F02CD0Oa7i52TLX6ae4nNLnkG1FW0CbNUmufz3e6KEBSwc3
	 XIEy6RX8i8iOgyeoCB/RV8aAOmNNb3xW+9Xp+jo55aMwgzktMLLyjr/E3Gad23Otx9
	 ngf8pBQi2v989VQmSyV3ulp/D6te9aMWlfx3WyjHizEeJtl2zZXukTp/NvdmUqWXcQ
	 jzpR+dg0WEKJg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	cardoe@cardoe.com,
	michal.orzel@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH 1/3] automation: switch from Debian unstable to bookworm
Date: Fri, 11 Aug 2023 19:06:49 -0700
Message-Id: <20230812020651.11608-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2308111842430.6458@ubuntu-linux-20-04-desktopa>
References: <alpine.DEB.2.22.394.2308111842430.6458@ubuntu-linux-20-04-desktopa>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Debian unstable used in the Xen containers is actually bookworm.
Switching to bookworm which is now stable means we are not basing our
containers on a moving target anymore.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 ...2-gcc.dockerfile => bookworm-arm64v8-arm32-gcc.dockerfile} | 2 +-
 ...nstable-arm64v8.dockerfile => bookworm-arm64v8.dockerfile} | 2 +-
 ...table-cppcheck.dockerfile => bookworm-cppcheck.dockerfile} | 4 ++--
 .../{unstable-i386.dockerfile => bookworm-i386.dockerfile}    | 2 +-
 .../build/debian/{unstable.dockerfile => bookworm.dockerfile} | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename automation/build/debian/{unstable-arm64v8-arm32-gcc.dockerfile => bookworm-arm64v8-arm32-gcc.dockerfile} (94%)
 rename automation/build/debian/{unstable-arm64v8.dockerfile => bookworm-arm64v8.dockerfile} (97%)
 rename automation/build/debian/{unstable-cppcheck.dockerfile => bookworm-cppcheck.dockerfile} (95%)
 rename automation/build/debian/{unstable-i386.dockerfile => bookworm-i386.dockerfile} (97%)
 rename automation/build/debian/{unstable.dockerfile => bookworm.dockerfile} (98%)

diff --git a/automation/build/debian/unstable-arm64v8-arm32-gcc.dockerfile b/automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile
similarity index 94%
rename from automation/build/debian/unstable-arm64v8-arm32-gcc.dockerfile
rename to automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile
index 11860425a6..b3295c435e 100644
--- a/automation/build/debian/unstable-arm64v8-arm32-gcc.dockerfile
+++ b/automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile
@@ -1,4 +1,4 @@
-FROM arm64v8/debian:unstable
+FROM arm64v8/debian:bookworm
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/debian/unstable-arm64v8.dockerfile b/automation/build/debian/bookworm-arm64v8.dockerfile
similarity index 97%
rename from automation/build/debian/unstable-arm64v8.dockerfile
rename to automation/build/debian/bookworm-arm64v8.dockerfile
index b9b1587f88..a6d4246d96 100644
--- a/automation/build/debian/unstable-arm64v8.dockerfile
+++ b/automation/build/debian/bookworm-arm64v8.dockerfile
@@ -1,4 +1,4 @@
-FROM arm64v8/debian:unstable
+FROM arm64v8/debian:bookworm
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/debian/unstable-cppcheck.dockerfile b/automation/build/debian/bookworm-cppcheck.dockerfile
similarity index 95%
rename from automation/build/debian/unstable-cppcheck.dockerfile
rename to automation/build/debian/bookworm-cppcheck.dockerfile
index adc192cea6..d64fb7b18c 100644
--- a/automation/build/debian/unstable-cppcheck.dockerfile
+++ b/automation/build/debian/bookworm-cppcheck.dockerfile
@@ -1,4 +1,4 @@
-FROM arm64v8/debian:unstable AS builder
+FROM arm64v8/debian:bookworm AS builder
 
 ENV DEBIAN_FRONTEND=noninteractive
 ENV CPPCHECK_VERSION=2.7
@@ -24,7 +24,7 @@ RUN curl -fsSLO https://github.com/danmar/cppcheck/archive/"$CPPCHECK_VERSION".t
         FILESDIR=/usr/share/cppcheck \
         HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function"
 
-FROM arm64v8/debian:unstable
+FROM arm64v8/debian:bookworm
 COPY --from=builder /usr/bin/cppcheck /usr/bin/cppcheck
 COPY --from=builder /usr/share/cppcheck /usr/share/cppcheck
 
diff --git a/automation/build/debian/unstable-i386.dockerfile b/automation/build/debian/bookworm-i386.dockerfile
similarity index 97%
rename from automation/build/debian/unstable-i386.dockerfile
rename to automation/build/debian/bookworm-i386.dockerfile
index 1c4928b09e..eb1c732f53 100644
--- a/automation/build/debian/unstable-i386.dockerfile
+++ b/automation/build/debian/bookworm-i386.dockerfile
@@ -1,4 +1,4 @@
-FROM i386/debian:unstable
+FROM i386/debian:bookworm
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/debian/unstable.dockerfile b/automation/build/debian/bookworm.dockerfile
similarity index 98%
rename from automation/build/debian/unstable.dockerfile
rename to automation/build/debian/bookworm.dockerfile
index 6ef2878200..f8415425e6 100644
--- a/automation/build/debian/unstable.dockerfile
+++ b/automation/build/debian/bookworm.dockerfile
@@ -1,4 +1,4 @@
-FROM debian:unstable
+FROM debian:bookworm
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
-- 
2.25.1


