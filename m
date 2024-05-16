Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 997718C781C
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 16:00:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723358.1128144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7be3-0006Dq-4M; Thu, 16 May 2024 13:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723358.1128144; Thu, 16 May 2024 13:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7be3-00065g-0o; Thu, 16 May 2024 13:59:43 +0000
Received: by outflank-mailman (input) for mailman id 723358;
 Thu, 16 May 2024 13:59:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9+o=MT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s7be2-0005tl-2V
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 13:59:42 +0000
Received: from fhigh5-smtp.messagingengine.com
 (fhigh5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 892b6787-138c-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 15:59:39 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id C09711140166;
 Thu, 16 May 2024 09:59:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 16 May 2024 09:59:38 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 May 2024 09:59:37 -0400 (EDT)
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
X-Inumbo-ID: 892b6787-138c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1715867978; x=1715954378; bh=+2WEMyTqWK
	NhMj6QhIZf6GFM0RxapZhBZiw+isG8OcI=; b=Z8D8X4OxCVYdraaM0Va/bcbPBt
	YytTvaPlLVjGpxok0H798l4gAb74IL80W2jZV7H74Ibxjh+F8pX+lBNVzKYbR2xM
	xUKVeGieIHyDsxwqZd9kfUDsDX7EE1w2cKCEIWmmxR1AHH9tV7flFiOqp8ACSjs+
	ILOMDtkl7XHvZvlVDioYGRyw9N+5qqQBkFALgxemwmOPAwIaqFWiBVqTJprdcmPo
	JHUW5eAJp2Ceq3If3Yi1u0pIFKhzvnj0JXmH3wh6Tu0phZWbb5ZR6nJJbYaw4IXl
	rTrGTr2zhMKVD28pyV12fN/V1eKE4CImqFbhAMOWIwCja2Ja+pIncN6EwgOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715867978; x=
	1715954378; bh=+2WEMyTqWKNhMj6QhIZf6GFM0RxapZhBZiw+isG8OcI=; b=g
	7Zi8nXMH8cRi7RR9rb80J20MasOsBpjvr4hXfKiYm+Hg0zMprWZAMHMTXxHVXVy0
	h4J3IcLZwXv3y521N6Nxei7xuDEGg42iEMq7k8YZYsF6y4XdQDSoUu/zuJ42akrz
	pSdFou5uMsQ3+CEOXfoYb2UK8Q2KdzQVo3QhDZ9izDFB0+5A9JDNSq47oCO52zO5
	zknoHIBDpHmchRi0IKY0IkyX1cK+Ku3jKGEEGTmbBTpyihvdYHBs25rPPWUjzDdv
	qkf0B799KA4bt/7SUx+Z+Tvpe1fDuJXbKEmAdBZX0HWLkuNg5Q65epqzLa5y1V8K
	HuwT86oAWKfZLD4aemptA==
X-ME-Sender: <xms:ShFGZnKaN3on3Ok5C8AAajtfF81to7P9hVLA4vF7xRZzZDy_k6Mf4g>
    <xme:ShFGZrJKfYMis3wo8f9GG9giUewBj_6yyLhOH52tll8NolAWoFafxzm7CEkRqSiL7
    IJzRfl4Z361VQ>
X-ME-Received: <xmr:ShFGZvsR7bwh6uX03E-6N8_STVHcLhGBjCTN9m4eIIcUbjD1SFARXUnGvavXSzIX5HyxxlK_Pqgk10PJeE7oqSJiEk6GvX-j7AQXXuy6mYalY53hTYk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdehuddgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:ShFGZgaWX_E6k6-5NlHC0rvwXVv4ymLOws_DkYMGYE2j-PZkB0n71w>
    <xmx:ShFGZuYISGQ8SiUIsoKYk21cS9IDSZVb4oUj2GBdnnN1QGtwwV0Ycg>
    <xmx:ShFGZkAKmZPkG8yQmEU5X4a31wBIYw-H69N1Od5S2TOkJEYHeF2teg>
    <xmx:ShFGZsZu_Lw2q7Six690TAwtCDlob2H1z5ahRrCZsj6BxNCu_D2e7w>
    <xmx:ShFGZuF3ADW2Zq5FeQ4nGOO83F6m7jPl3kHARaqUX5JsPsw-YzklFPbv>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 02/12] automation: update fedora build to F39
Date: Thu, 16 May 2024 15:58:23 +0200
Message-ID: <ae23eeb2e08c2fa95d975bfad64b818870e370e6.1715867907.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
References: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fedora 29 is long EOL

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/build/fedora/29.dockerfile | 46 +----------------------------
 automation/build/fedora/39.dockerfile | 46 ++++++++++++++++++++++++++++-
 automation/gitlab-ci/build.yaml       |  4 +-
 3 files changed, 48 insertions(+), 48 deletions(-)
 delete mode 100644 automation/build/fedora/29.dockerfile
 create mode 100644 automation/build/fedora/39.dockerfile

diff --git a/automation/build/fedora/29.dockerfile b/automation/build/fedora/29.dockerfile
deleted file mode 100644
index f473ae13e7c1..000000000000
--- a/automation/build/fedora/29.dockerfile
+++ /dev/null
@@ -1,46 +0,0 @@
-FROM --platform=linux/amd64 fedora:29
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-# install Xen depends
-RUN dnf -y install \
-        clang \
-        gcc \
-        gcc-c++ \
-        ncurses-devel \
-        zlib-devel \
-        openssl-devel \
-        python-devel \
-        python3-devel \
-        libuuid-devel \
-        pkgconfig \
-        flex \
-        bison \
-        libaio-devel \
-        glib2-devel \
-        yajl-devel \
-        pixman-devel \
-        glibc-devel \
-        make \
-        binutils \
-        git \
-        wget \
-        acpica-tools \
-        python-markdown \
-        patch \
-        checkpolicy \
-        dev86 \
-        xz-devel \
-        bzip2 \
-        nasm \
-        ocaml \
-        ocaml-findlib \
-        golang \
-        # QEMU
-        ninja-build \
-    && dnf clean all && \
-    rm -rf /var/cache/dnf
-
-RUN useradd --create-home user
-USER user
-WORKDIR /build
diff --git a/automation/build/fedora/39.dockerfile b/automation/build/fedora/39.dockerfile
new file mode 100644
index 000000000000..054f73444060
--- /dev/null
+++ b/automation/build/fedora/39.dockerfile
@@ -0,0 +1,46 @@
+FROM --platform=linux/amd64 fedora:39
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+# install Xen depends
+RUN dnf -y install \
+        clang \
+        gcc \
+        gcc-c++ \
+        ncurses-devel \
+        zlib-devel \
+        openssl-devel \
+        python-devel \
+        python3-devel \
+        libuuid-devel \
+        pkgconfig \
+        flex \
+        bison \
+        libaio-devel \
+        glib2-devel \
+        yajl-devel \
+        pixman-devel \
+        glibc-devel \
+        make \
+        binutils \
+        git \
+        wget \
+        acpica-tools \
+        python-markdown \
+        patch \
+        checkpolicy \
+        dev86 \
+        xz-devel \
+        bzip2 \
+        nasm \
+        ocaml \
+        ocaml-findlib \
+        golang \
+        # QEMU
+        ninja-build \
+    && dnf clean all && \
+    rm -rf /var/cache/dnf
+
+RUN useradd --create-home user
+USER user
+WORKDIR /build
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 49d6265ad5b4..69665ec5b11f 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -691,12 +691,12 @@ debian-bookworm-32-gcc-debug:
 fedora-gcc:
   extends: .gcc-x86-64-build
   variables:
-    CONTAINER: fedora:29
+    CONTAINER: fedora:39
 
 fedora-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: fedora:29
+    CONTAINER: fedora:39
 
 # Ubuntu Trusty's Clang is 3.4 while Xen requires 3.5
 
-- 
git-series 0.9.1

