Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B78776D73
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 03:18:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581774.911182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTuJW-0005mm-NM; Thu, 10 Aug 2023 01:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581774.911182; Thu, 10 Aug 2023 01:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTuJW-0005jL-Jr; Thu, 10 Aug 2023 01:18:10 +0000
Received: by outflank-mailman (input) for mailman id 581774;
 Thu, 10 Aug 2023 01:18:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TqLc=D3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTuJV-0005Qg-5s
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 01:18:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3239f55-371b-11ee-b283-6b7b168915f2;
 Thu, 10 Aug 2023 03:18:08 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ECB9564D18;
 Thu, 10 Aug 2023 01:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9621AC433C8;
 Thu, 10 Aug 2023 01:18:05 +0000 (UTC)
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
X-Inumbo-ID: c3239f55-371b-11ee-b283-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691630286;
	bh=o38hDMnErido2ocHdI4zOyxzy0EWOn0IUkAUdx/QJ5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NjFuEjfmX4xYuUz86XSf3p6NV88k94l5oPSF9igwU30zhAN4C9jdSkq9Mfujm+TWr
	 +pYCLHQSCXjOmKR2YExfdXpQ2c9C2ubEqQDr1KBb5qDqnmkfsZzHwJYlzXuPGhN0FN
	 kt4gHvm6d35+0qfWBT2Qo/ePS+eDus44lZmqVw3+tj7Q7JbjgPGoy8ZSAEExj3kjel
	 cifE6ui9zLiDtdWVmiVnVf9EvVb1cvQ0NY1AepZGwrT0ySMhQyFIsNB65TRJiANtkL
	 WYCjm4WMjernOfp4Hca54Exgwty/GvaO1giAddbx7XbnNMeKPQ7GGvGnBEkdl9/Gta
	 vAChxAxJhDoKA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: michal.orzel@amd.com
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	cardoe@cardoe.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH 1/2] automation: upgrade Alpine build and test artifact containers to 3.18
Date: Wed,  9 Aug 2023 18:18:02 -0700
Message-Id: <20230810011803.311832-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2308091814450.2127516@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2308091814450.2127516@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Alpine 3.12 is EOL. Also update the containerize script.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 .../{3.12-arm64v8.dockerfile => 3.18-arm64v8.dockerfile}      | 2 +-
 automation/build/alpine/{3.12.dockerfile => 3.18.dockerfile}  | 2 +-
 automation/scripts/containerize                               | 4 ++--
 .../{3.12-arm64v8.dockerfile => 3.18-arm64v8.dockerfile}      | 4 ++--
 .../alpine/{3.12.dockerfile => 3.18.dockerfile}               | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)
 rename automation/build/alpine/{3.12-arm64v8.dockerfile => 3.18-arm64v8.dockerfile} (96%)
 rename automation/build/alpine/{3.12.dockerfile => 3.18.dockerfile} (97%)
 rename automation/tests-artifacts/alpine/{3.12-arm64v8.dockerfile => 3.18-arm64v8.dockerfile} (97%)
 rename automation/tests-artifacts/alpine/{3.12.dockerfile => 3.18.dockerfile} (97%)

diff --git a/automation/build/alpine/3.12-arm64v8.dockerfile b/automation/build/alpine/3.18-arm64v8.dockerfile
similarity index 96%
rename from automation/build/alpine/3.12-arm64v8.dockerfile
rename to automation/build/alpine/3.18-arm64v8.dockerfile
index 1be3bf7805..ce198f7d04 100644
--- a/automation/build/alpine/3.12-arm64v8.dockerfile
+++ b/automation/build/alpine/3.18-arm64v8.dockerfile
@@ -1,4 +1,4 @@
-FROM arm64v8/alpine:3.12
+FROM arm64v8/alpine:3.18
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/alpine/3.12.dockerfile b/automation/build/alpine/3.18.dockerfile
similarity index 97%
rename from automation/build/alpine/3.12.dockerfile
rename to automation/build/alpine/3.18.dockerfile
index 72ad3a07ad..ca5756955e 100644
--- a/automation/build/alpine/3.12.dockerfile
+++ b/automation/build/alpine/3.18.dockerfile
@@ -1,4 +1,4 @@
-FROM alpine:3.12
+FROM alpine:3.18
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 6d46f63665..16d480ab75 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -24,8 +24,8 @@ die() {
 #
 BASE="registry.gitlab.com/xen-project/xen"
 case "_${CONTAINER}" in
-    _alpine) CONTAINER="${BASE}/alpine:3.12" ;;
-    _alpine-arm64v8) CONTAINER="${BASE}/alpine:3.12-arm64v8" ;;
+    _alpine) CONTAINER="${BASE}/alpine:3.18" ;;
+    _alpine-arm64v8) CONTAINER="${BASE}/alpine:3.18-arm64v8" ;;
     _archlinux|_arch) CONTAINER="${BASE}/archlinux:current" ;;
     _riscv64) CONTAINER="${BASE}/archlinux:current-riscv64" ;;
     _centos7) CONTAINER="${BASE}/centos:7" ;;
diff --git a/automation/tests-artifacts/alpine/3.12-arm64v8.dockerfile b/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
similarity index 97%
rename from automation/tests-artifacts/alpine/3.12-arm64v8.dockerfile
rename to automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
index cb8e9e59bb..cbd96d9bc6 100644
--- a/automation/tests-artifacts/alpine/3.12-arm64v8.dockerfile
+++ b/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
@@ -1,4 +1,4 @@
-FROM arm64v8/alpine:3.12
+FROM arm64v8/alpine:3.18
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
@@ -18,7 +18,7 @@ RUN \
   apk add sudo && \
   apk add dbus && \
   apk add bash && \
-  apk add python2 && \
+  apk add python3 && \
   apk add zlib && \
   apk add ncurses && \
   apk add texinfo && \
diff --git a/automation/tests-artifacts/alpine/3.12.dockerfile b/automation/tests-artifacts/alpine/3.18.dockerfile
similarity index 97%
rename from automation/tests-artifacts/alpine/3.12.dockerfile
rename to automation/tests-artifacts/alpine/3.18.dockerfile
index 073f16a0d7..32aa8e1778 100644
--- a/automation/tests-artifacts/alpine/3.12.dockerfile
+++ b/automation/tests-artifacts/alpine/3.18.dockerfile
@@ -1,4 +1,4 @@
-FROM alpine:3.12
+FROM alpine:3.18
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
@@ -19,7 +19,7 @@ RUN \
   apk add sudo && \
   apk add dbus && \
   apk add bash && \
-  apk add python2 && \
+  apk add python3 && \
   apk add zlib && \
   apk add ncurses && \
   apk add texinfo && \
-- 
2.25.1


