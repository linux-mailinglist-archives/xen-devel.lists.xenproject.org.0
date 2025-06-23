Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC85BAE44F7
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 15:47:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022375.1398189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThVs-00059J-9j; Mon, 23 Jun 2025 13:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022375.1398189; Mon, 23 Jun 2025 13:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThVs-00054H-5a; Mon, 23 Jun 2025 13:47:08 +0000
Received: by outflank-mailman (input) for mailman id 1022375;
 Mon, 23 Jun 2025 13:47:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TVau=ZG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uThVr-00048y-1K
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 13:47:07 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c31b0be-5038-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 15:47:05 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.phl.internal (Postfix) with ESMTP id B706A11400B4;
 Mon, 23 Jun 2025 09:47:04 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Mon, 23 Jun 2025 09:47:04 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 09:47:03 -0400 (EDT)
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
X-Inumbo-ID: 8c31b0be-5038-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1750686424; x=1750772824; bh=Q0IYK2X499
	honc0Q7bdViPVpqyeoLI8UjaNIqKckVK8=; b=c7wS3OZK9BWyYsudEoJP9xW96/
	kHdR5w38c6RdeM1b+rejugMGAMLkVnzmn1WFCp22Ho4TSzFdqreJBN2xNEYCHlzV
	vEHLKp2xiAh9BQxVoCWDLJafUFWazewwg1zTvv7tdscFXKSKwioS7mzsT3qiAW9F
	qUbtzf6oB5vWZcv8B4zb9fYW2n+rP7dmhCrJ3Bkbm61sBV+Qe28rAjXtFhDkBnRd
	6pNl4oT+dINW0nMZ6A4sg9bbn2t8kYwzvlWm0FmQ+nSPcYds4/plvMfXQBqDmc/8
	r4qeSMoi633SthhNRnTxMLC1If8+Ny11ulPVo6S17dflH9J5CsKJJrlNBtuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750686424; x=
	1750772824; bh=Q0IYK2X499honc0Q7bdViPVpqyeoLI8UjaNIqKckVK8=; b=U
	ptr+fXdF9J0qPRVnWDDTZzeaNtFLpCnkptT9HxIV5XvkIaKuFI04yyztS8fpkbA1
	Lcm9XXdZw2fooS1UH9Nn8XpOq2bDQEcp3x4vMEW+RM4+rxZVDKP30rXP86KddGxV
	dUKFsI2P5DCZHvh+qNzUvViAf63eX4YQOzBzKGj4QANdH2T64XbiPF4dqhl5WTcm
	sSFbUQ5JgCIqFbM6Y73lekzKrJriqwzvn/PwOetvDwo1aAUeVVxTDyvXdqCVBv/b
	LP/ZJsIS80GEXIEstGl/4gR0RrlMjcXjvxY80gp2WLcDIelVPPpuAh0/c1c0xnxA
	NJH1K+Jo14KIKURP6HL5Q==
X-ME-Sender: <xms:2FpZaOK0lx9Tj3389S1OgO9aYpLy4B968szmM8zPGQJnDiTsd3vGXQ>
    <xme:2FpZaGIsacTHM8-v4CL-fP89uFujADJKNCYzB0xVYAAqQcI5xVkThZr_LzJL0_PXM
    FKFJjAgHXXTsA>
X-ME-Received: <xmr:2FpZaOtJYPxBUtQGDW3RGJBGnZOS_LMc44Zrb6JdUa-20zo74m0vqQZDjJuX5wAH0oWZ4JJ7SexFmAr0ZyPtOJ73QbU9MIhrfQaJclKPL-82ZDjBGeFF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujedukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfelgffg
    ueffgeejudehieegteeugeefkeejtefghfdvieffieeijefgudeikeegnecuffhomhgrih
    hnpehgihhtlhgrsgdrtghomhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprh
    hojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihht
    rhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphht
    thhopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:2FpZaDYH8Cpanrah8GugRv2e1KDtLz9oHMiwVWxjAkZ6w8dZFegC3g>
    <xmx:2FpZaFZauaRAnsmM2SaDBdtRUWqSA6TW0BkF4UX-dzdYXK0JP0O93A>
    <xmx:2FpZaPBWQwY6OpuwrpuYnN1sbBf_VAVoWph1woNV8lc1Shx9yvsNzw>
    <xmx:2FpZaLY1peJ8Y8YPFmtF6fcLC5OTcZ2ErJ7SSTb-Rs2yv6jHP-pyGA>
    <xmx:2FpZaCT2BFxpKCN_qtszvAt7wEXBvKlr2FT2WKlHuLbPnuCBHn5AWwrr>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH test-artifacts v1 4/5] Support building arbitrary Linux branch/tag/commit
Date: Mon, 23 Jun 2025 15:46:23 +0200
Message-ID: <7bd5b5d88d6229e5d85396ed18ac654a6f8a59ab.1750684376.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.7129d44a341f3fb3a85f808a998c28ebe8a77ee8.1750684376.git-series.marmarek@invisiblethingslab.com>
References: <cover.7129d44a341f3fb3a85f808a998c28ebe8a77ee8.1750684376.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If LINUX_URL is set, fetch LINUX_VERSION from there. Go with "git
init" + "git fetch" instead of "git clone" to support any of
branch/tag/commit.

This also defines optional linux-git-* jobs which will build the thing
if LINUX_GIT_VERSION and LINUX_GIT_URL variables are provided for the
pipeline.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
The script variable and job variable need to have different names, so a
pipeline variable won't override it for all jobs. While LINUX_VERSION /
LINUX_GIT_VERSION is IMO okay, I'm not very happy about LINUX_URL /
LINUX_GIT_URL. Any better ideas?
---
 .gitlab-ci.yml         | 22 ++++++++++++++++++++++
 scripts/build-linux.sh | 18 +++++++++++++-----
 2 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ad44fb4..60af072 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,5 +1,9 @@
 variables:
   REGISTRY: registry.gitlab.com/xen-project/hardware/test-artifacts
+  LINUX_GIT_VERSION:
+    description: "branch/tag/commit for the linux-git jobs"
+  LINUX_GIT_URL:
+    description: "git url for the linux-git jobs"
 
 stages:
   - build
@@ -46,6 +50,15 @@ linux-6.6.86-arm64:
   variables:
     LINUX_VERSION: 6.6.86
 
+linux-git-arm64:
+  extends: .arm64-artifacts
+  script: ./scripts/build-linux.sh
+  variables:
+    LINUX_VERSION: $LINUX_GIT_VERSION
+    LINUX_URL: $LINUX_GIT_URL
+  rules:
+  - if: $LINUX_GIT_VERSION && $LINUX_GIT_URL
+
 #
 # x86_64 artifacts
 #
@@ -70,6 +83,15 @@ linux-6.12.34-x86_64:
   variables:
     LINUX_VERSION: 6.12.34
 
+linux-git-x86_64:
+  extends: .x86_64-artifacts
+  script: ./scripts/build-linux.sh
+  variables:
+    LINUX_VERSION: $LINUX_GIT_VERSION
+    LINUX_URL: $LINUX_GIT_URL
+  rules:
+  - if: $LINUX_GIT_VERSION && $LINUX_GIT_URL
+
 microcode-x86:
   extends: .x86_64-artifacts
   script: ./scripts/x86-microcode.sh
diff --git a/scripts/build-linux.sh b/scripts/build-linux.sh
index cf0e744..1fc96d1 100755
--- a/scripts/build-linux.sh
+++ b/scripts/build-linux.sh
@@ -12,11 +12,19 @@ COPYDIR="${WORKDIR}/binaries"
 UNAME=$(uname -m)
 
 # Build Linux
-MAJOR=${LINUX_VERSION%%.*}
-curl -fsSLO \
-    https://cdn.kernel.org/pub/linux/kernel/v"${MAJOR}".x/linux-"${LINUX_VERSION}".tar.xz
-tar xf linux-"${LINUX_VERSION}".tar.xz
-cd linux-"${LINUX_VERSION}"
+if [[ -n "${LINUX_URL}" ]]; then
+    mkdir linux
+    cd linux
+    git init
+    git fetch --depth=1 "${LINUX_URL}" "${LINUX_VERSION}"
+    git checkout FETCH_HEAD
+else
+    MAJOR=${LINUX_VERSION%%.*}
+    curl -fsSLO \
+        https://cdn.kernel.org/pub/linux/kernel/v"${MAJOR}".x/linux-"${LINUX_VERSION}".tar.xz
+    tar xf linux-"${LINUX_VERSION}".tar.xz
+    cd linux-"${LINUX_VERSION}"
+fi
 
 make defconfig
 ./scripts/config --enable BRIDGE
-- 
git-series 0.9.1

