Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBZaE1NXzGkjSgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:22:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C04E8372B5D
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:22:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269363.1558457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPf-0001nR-I1; Tue, 31 Mar 2026 23:22:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269363.1558457; Tue, 31 Mar 2026 23:22:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPf-0001ln-El; Tue, 31 Mar 2026 23:22:23 +0000
Received: by outflank-mailman (input) for mailman id 1269363;
 Tue, 31 Mar 2026 23:22:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w7iPd-0001Vd-So
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 23:22:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7iPd-000kEs-9K
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 01:22:21 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc56f4-e002-0a2a0a5209dd-0a2a4501db78-42
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:21 +0200
Received: from [103.168.172.149] (helo=fout-a6-smtp.messagingengine.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc572c-6fc9-0a2a45010019-67a8ac95cff9-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:21 +0200
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 1C25BEC011C;
 Tue, 31 Mar 2026 19:22:20 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Tue, 31 Mar 2026 19:22:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 19:22:18 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1774999340; x=1775085740; bh=moVi/O9dAO
	2xUmeqXlZa9N1EutJTW6W3wzH4QWIGYvo=; b=bNcgtnlr5wtupQ7KIr12yYWp4i
	EPQCu7VS4YSql3jQ/WCMOiFgrmCpSHwksXnmKA61VxrZ3qNVTwHdQl2nB5I/eRah
	u4TMx1TFvxysjTkE5JROSk1Sm/t54LGESgNpbB0P7jQC4qn3vOBm0p3E0sDL9PxU
	2vk47CKTaAU5unO88FS+26s9Mcbmr8kG0mYdEMzexIWcpR/9XBB7WHHVApsJxLSk
	521cO4wIsyIV/U+tHOTtngrQxs/5Ibe+QaIiqnFJOoIT7nFehzl8GEQL3B50p88V
	d6EQqln4k1MMb6t29L+Thzgas1rPixK6nXx8i4HEhdEn2M8PgGfXnjNbWDkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774999340; x=
	1775085740; bh=moVi/O9dAO2xUmeqXlZa9N1EutJTW6W3wzH4QWIGYvo=; b=o
	wO82t+rW8YJ+VvdcoqerSeWmL8jdq6RpJ1y0QYnxoTAR8N1+7ROFC7ifrKhY1/BG
	vjWc4Xkjqkfk0U5UsZH5lEqtiPCzlFi6CxRyiI/XXBoT/vt2MmILj3ufxHc6+xqN
	0y/hyUUl1ytlwMOuG05Pb5BlhXt592A6tJOOGmvIOoANSrKmyYP2mv5BSNy/60WJ
	zF44BhDyCYqzTZ8OTb5wXk3OWmtXcO40bl8dmXnhZn+qS0x6d24BFj7DypNQ9n/g
	srWQU/jnjhRMbIRxQrE0WE0+ge03G4sW+8Ehd9lrCkptl0kp5oUEATJjvI8Av0Jx
	lohsSfYGfM8Skp5p226KQ==
X-ME-Sender: <xms:K1fMae-pbA6W03AP7VJ8cy4vzh9f7mQmaHZw_wGoH1CoSN6eKr82kQ>
    <xme:K1fMaVn7ccpz8SH7TXW0F14sMsyCx_aiTZTLVswyxhz8hQtKNjA2KaTwp-yIhhlZr
    b87hz5kOZpDmANmw9A57Twe111HCGwgKLGR--QBT4Gsmus8QA>
X-ME-Received: <xmr:K1fMacWNeCGhY-aZhTYyINx3UMNWlbpfiaYoD15rl_e0oN3EnlOxBcey2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefglefggfeu
    ffegjeduheeigeetueegfeekjeetgffhvdeiffeiieejgfduieekgeenucffohhmrghinh
    epghhithhlrggsrdgtohhmpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhroh
    hjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhr
    ihigrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthht
    ohepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:LFfMaSGF8JyHfFDr8MtQV6EZTbAwlLtTY7T3mc-mpXi9HWDeH_sgNw>
    <xmx:LFfMaQcShndB2HlloGMTsaxwSEVU8tTldU1dAdOD-4hGzI8LBCtZwg>
    <xmx:LFfMabJQuAzr1uFk7kYOap_yz6nK1U3V47gAKMVCQeKIDFoikrQMwA>
    <xmx:LFfMadGPSxm1eQII923AmaQVrq9Ztu7FG6JOi-LGWE69qH1giK-G8g>
    <xmx:LFfMaQa08kDSasqQOtM1DMXE5WD3L7MiwbnexGy9UhpqbGxzBLSeyziR>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH test-artifacts v3 07/13] Support building arbitrary Linux branch/tag/commit
Date: Wed,  1 Apr 2026 01:21:57 +0200
Message-ID: <b616361a3464b221a342dab11cd21ca76454a957.1774999132.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1774999341-B7AFD185-4B539DD3/0/0
X-purgate-type: clean
X-purgate-size: 3875
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,messagingengine.com:dkim,invisiblethingslab.com:dkim,invisiblethingslab.com:email,invisiblethingslab.com:mid,gitlab.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: C04E8372B5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Change how kernel version is given to the script - use arguments, to
avoid confusion between pipeline level variables and job level ones.

The build-linux.sh now can take either just the kernel version (used to be
LINUX_VERSION variable), or git branch/tag/commit name + git URL (new feature).
Go with "git init" + "git fetch" instead of "git clone" to support any
of branch/tag/commit.

This also defines optional linux-git-* jobs which will build the thing
if LINUX_GIT_VERSION and LINUX_GIT_URL variables are provided for the
pipeline.

The idea is to define separate CI schedules for the test-artifacts repo
with LINUX_GIT_URL/LINUX_GIT_VERSION pointing at Linux trees to be
tested (for example linux-next), and then trigger matching pipelines in
the xen repo for testing with that version.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v3:
- pass kernel version via script arguments, not variables
---
 .gitlab-ci.yml         | 23 ++++++++++++++++++-----
 scripts/build-linux.sh | 21 ++++++++++++++++-----
 2 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 58f7571f5366..62b2a24e7faf 100644
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
@@ -49,9 +53,13 @@ alpine-3.22-arm64-rootfs:
 
 linux-6.6.86-arm64:
   extends: .arm64-artifacts
-  script: ./scripts/build-linux.sh
-  variables:
-    LINUX_VERSION: 6.6.86
+  script: ./scripts/build-linux.sh "6.6.86"
+
+linux-git-arm64:
+  extends: .arm64-artifacts
+  script: ./scripts/build-linux.sh "$LINUX_GIT_VERSION" "$LINUX_GIT_URL"
+  rules:
+  - if: $LINUX_GIT_VERSION && $LINUX_GIT_URL
 
 #
 # x86_64 artifacts
@@ -79,9 +87,8 @@ debian-13-x86_64-rootfs:
 
 linux-6.6.56-x86_64:
   extends: .x86_64-artifacts
-  script: ./scripts/build-linux.sh
+  script: ./scripts/build-linux.sh "6.6.56"
   variables:
-    LINUX_VERSION: 6.6.56
     ARGO_SHA: "cf73819cacc945baca1a7421e5836d1bd481739b"
     ARGOEXEC_SHA: "d900429f6640acc6f68a3d3a4c945d7da60625d8"
 
@@ -89,6 +96,12 @@ linux-6.12.60-x86_64:
   extends: .x86_64-artifacts
   script: ./scripts/build-linux.sh "6.12.60"
 
+linux-git-x86_64:
+  extends: .x86_64-artifacts
+  script: ./scripts/build-linux.sh "$LINUX_GIT_VERSION" "$LINUX_GIT_URL"
+  rules:
+  - if: $LINUX_GIT_VERSION && $LINUX_GIT_URL
+
 microcode-x86:
   extends: .x86_64-artifacts
   script: ./scripts/x86-microcode.sh
diff --git a/scripts/build-linux.sh b/scripts/build-linux.sh
index cf0e744bd232..882bac2189a6 100755
--- a/scripts/build-linux.sh
+++ b/scripts/build-linux.sh
@@ -1,5 +1,8 @@
 #!/usr/bin/env bash
 
+LINUX_VERSION="$1"
+LINUX_GIT_URL="$2"
+
 if test -z "${LINUX_VERSION}"
 then
     >&2 echo "LINUX_VERSION must be set"; exit 1
@@ -12,11 +15,19 @@ COPYDIR="${WORKDIR}/binaries"
 UNAME=$(uname -m)
 
 # Build Linux
-MAJOR=${LINUX_VERSION%%.*}
-curl -fsSLO \
-    https://cdn.kernel.org/pub/linux/kernel/v"${MAJOR}".x/linux-"${LINUX_VERSION}".tar.xz
-tar xf linux-"${LINUX_VERSION}".tar.xz
-cd linux-"${LINUX_VERSION}"
+if [[ -n "${LINUX_GIT_URL}" ]]; then
+    mkdir linux
+    cd linux
+    git init
+    git fetch --depth=1 "${LINUX_GIT_URL}" "${LINUX_VERSION}"
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

