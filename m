Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oN5VNfFYzGk4SgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:29:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8392A372CB0
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:29:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269505.1558548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iWl-0008R4-UI; Tue, 31 Mar 2026 23:29:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269505.1558548; Tue, 31 Mar 2026 23:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iWl-0008Q1-ON; Tue, 31 Mar 2026 23:29:43 +0000
Received: by outflank-mailman (input) for mailman id 1269505;
 Tue, 31 Mar 2026 23:29:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w7iWk-0008C2-6m
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 23:29:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7iWj-003L8K-Jr
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 01:29:41 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc58e1-5cb7-0a2a0a5109dd-0a2a450bd72a-4
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:29:41 +0200
Received: from [103.168.172.153] (helo=fhigh-a2-smtp.messagingengine.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc57f4-ef63-0a2a450b0019-67a8ac99909b-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:25:41 +0200
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 1953114001FE;
 Tue, 31 Mar 2026 19:25:40 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Tue, 31 Mar 2026 19:25:40 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 19:25:38 -0400 (EDT)
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
	:subject:to:to; s=fm1; t=1774999540; x=1775085940; bh=42O2MeqbMS
	WypilSXFr/gkKBXnpJRqk7rPx+38DHJBA=; b=XkEOnW1MYKcAPSKK5CnsWG/P7L
	5CCOOHWsWqc432ak5985JYx3oqRFrrfvbM7okvBC2j0BEih/mDkELbp6QM71t6RL
	MRotW2sN8GbzFJZUVsBxicMLRlZ96SxHh8TIkf1vkKl72WQwlQcAijYY6PgdhMyG
	4bFCPyaE5QZiinc0kl2gTCeOGHtd4Rstjq997K7rk7FL3vDdQ/OxZquAgSvn/fYx
	SZ0/IWmT0fqa+bSd4UmE7bJwAHs5zV30g/qpQNMdoeGpqGQa91aoVfG/j3mUMUCz
	RlMjSj6c5QGMe9BUMZS14XzsLXBhVdHoMom9tUKBotoqqiTT+Aua4PJmeKpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774999540; x=
	1775085940; bh=42O2MeqbMSWypilSXFr/gkKBXnpJRqk7rPx+38DHJBA=; b=S
	HAv+c7VANZuKNUJ6ArRyLaLkq3kEWznipWQYI1T1H7t6JIOmJ5tHX7WfwizMKjD3
	5OZwUQyHON4FJrOxvEGYnvXqbOMiH2RlC/QRfV6GKbIaGFOtdSnVg5KuiOfXUVrJ
	PIRRhrXaeXthp2hw1dtbpoFEvxRb6M7IQGdZ0gogOrMav0sIm2c1aIUdJZLFWrho
	lf6PL+T5+qYXcSrjw11pS5YzYXI9SFlVnHEhM3/4FpY6AWJ4XFfs+Gfc0gzSgEJi
	PgAApD9Wd/GXb+cYDiHrc+1vlqsNSlG5JOly1AXMK6r6XAKx2QiDSDbvCInzPsfc
	uOAiqGZi9kV6OneKyX/Jw==
X-ME-Sender: <xms:81fMaY52nMpS2LTHfV83Ni2rnLdrYPc8ChSnhMiL0wlNqRvF-ivN9g>
    <xme:81fMaVahHOnh7TT511_m-jjbKT73QfZHfs-MD24zP17IIEk8dX4TvExO3BGtJWL4n
    h7aBSB3bSRWXXdSO_TLUvt1f7PyTRzeN_ps8gCwdMW7I4zH>
X-ME-Received: <xmr:81fMad4fDc9d6vQNrQaz6BcAUvV0ReoM4_tpgqyMbp3hEGu9R_dkUQLJwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduhedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgueduhefg
    vdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhr
    ihigrdgtohhmpdhrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomhdprhgtphhtthhopegtrghrughovgestggrrhguohgvrdgtohhm
X-ME-Proxy: <xmx:81fMaYDC9QxDCCUP4hYJaPwoW5O-7xKCUanQwgrdw_ofNXokN-gjcA>
    <xmx:9FfMaTcqX6MYN9nujTg7__cvh7E1sFOCNMLggTypM2uGRUBthZ3wfA>
    <xmx:9FfMaXKrXwJLLhM3k1WmRqwePbx8azjdlBS_IVgInEX2m76nEoZVsA>
    <xmx:9FfMae2sTdcTyFewnn7kzEipWOnMXm332hQiqyUBu_2x2D_4V7bbQg>
    <xmx:9FfMaTnxs0_oJrV01q2dxfMtSImCdCbT4Dm_rgNwv3QyXbP7r9n4SXtU>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 3/6] ci: introduce BUILD_FOR_TESTS_ONLY
Date: Wed,  1 Apr 2026 01:24:52 +0200
Message-ID: <c5247e0a41dc49bd18cca23864f9adaf86bb2147.1774999414.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.ca38f9571ab23e254a985ecfd4715235675aa06e.1774999414.git-series.marmarek@invisiblethingslab.com>
References: <cover.ca38f9571ab23e254a985ecfd4715235675aa06e.1774999414.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1774999541-A203B112-1D00B3D0/13/0
X-purgate-type: clean
X-purgate-size: 5138
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,m:cardoe@cardoe.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,messagingengine.com:dkim,invisiblethingslab.com:dkim,invisiblethingslab.com:email,invisiblethingslab.com:mid];
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
X-Rspamd-Queue-Id: 8392A372CB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When the variable is set, only build jobs that are used in tests are
scheduled. This saves a lot of time, for example when scheduling a test
pipeline with alternative linux branch.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 .gitlab-ci.yml                  |  2 ++
 automation/gitlab-ci/build.yaml | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2124e3a79eef..f42a9abeaaaf 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -3,6 +3,8 @@ variables:
   SELECTED_JOBS_ONLY:
     description: "Regex to select only some jobs, must be enclosed with /. For example /job1|job2/"
     value: "/.*/"
+  BUILD_FOR_TESTS_ONLY:
+    description: "Include only build jobs necessary for running tests"
   ARTIFACTS_REPO:
     description: "Path to the test-artifacts repo"
     value: xen-project/hardware/test-artifacts
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index b69bad9202c2..f4e277780311 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -13,6 +13,14 @@
     when: always
   needs: []
   rules:
+    - if: $BUILD_FOR_TESTS_ONLY
+      when: never
+    - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
+      when: on_success
+
+# override BUILD_FOR_TESTS_ONLY exclusion
+.build-test-tpl: &build-test
+  rules:
     - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
       when: on_success
 
@@ -296,11 +304,13 @@ qemu-system-aarch64-6.0.0-arm32-export:
 
 alpine-3.18-gcc:
   extends: .gcc-x86-64-build
+  <<: *build-test
   variables:
     CONTAINER: alpine:3.18
 
 alpine-3.18-gcc-debug:
   extends: .gcc-x86-64-build-debug
+  <<: *build-test
   variables:
     CONTAINER: alpine:3.18
     BUILD_QEMU_XEN: y
@@ -315,16 +325,19 @@ alpine-3.18-gcc-debug:
 
 debian-13-x86_64-gcc-debug:
   extends: .gcc-x86-64-build-debug
+  <<: *build-test
   variables:
     CONTAINER: debian:13-x86_64
 
 debian-13-x86_64-clang-debug:
   extends: .clang-x86-64-build-debug
+  <<: *build-test
   variables:
     CONTAINER: debian:13-x86_64
 
 debian-13-ppc64le-gcc-debug:
   extends: .gcc-ppc64le-cross-build-debug
+  <<: *build-test
   variables:
     CONTAINER: debian:13-ppc64le
     KBUILD_DEFCONFIG: ppc64_defconfig
@@ -335,6 +348,7 @@ debian-13-ppc64le-gcc-debug:
 
 debian-13-riscv64-gcc-debug:
   extends: .gcc-riscv64-cross-build-debug
+  <<: *build-test
   variables:
     CONTAINER: debian:13-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
@@ -347,12 +361,14 @@ debian-13-riscv64-gcc-debug:
 
 debian-bookworm-gcc-arm32:
   extends: .gcc-arm32-cross-build
+  <<: *build-test
   variables:
     CONTAINER: debian:bookworm-arm64v8-arm32-gcc
     HYPERVISOR_ONLY: y
 
 debian-bookworm-gcc-arm32-debug:
   extends: .gcc-arm32-cross-build-debug
+  <<: *build-test
   variables:
     CONTAINER: debian:bookworm-arm64v8-arm32-gcc
     HYPERVISOR_ONLY: y
@@ -366,6 +382,7 @@ debian-bookworm-gcc-arm32-randconfig:
 
 debian-bookworm-gcc-arm32-debug-staticmem:
   extends: .gcc-arm32-cross-build-debug
+  <<: *build-test
   variables:
     CONTAINER: debian:bookworm-arm64v8-arm32-gcc
     HYPERVISOR_ONLY: y
@@ -376,6 +393,7 @@ debian-bookworm-gcc-arm32-debug-staticmem:
 
 debian-bookworm-gcc-arm32-debug-earlyprintk:
   extends: .gcc-arm32-cross-build-debug
+  <<: *build-test
   variables:
     CONTAINER: debian:bookworm-arm64v8-arm32-gcc
     HYPERVISOR_ONLY: y
@@ -407,11 +425,13 @@ debian-bookworm-gcc-debug-arm64:
 
 alpine-3.18-gcc-arm64:
   extends: .gcc-arm64-build
+  <<: *build-test
   variables:
     CONTAINER: alpine:3.18-arm64v8
 
 alpine-3.18-gcc-debug-arm64:
   extends: .gcc-arm64-build-debug
+  <<: *build-test
   variables:
     CONTAINER: alpine:3.18-arm64v8
     EXTRA_XEN_CONFIG: |
@@ -426,6 +446,7 @@ alpine-3.18-gcc-arm64-randconfig:
 
 alpine-3.18-gcc-debug-arm64-staticmem:
   extends: .gcc-arm64-build-debug
+  <<: *build-test
   variables:
     CONTAINER: alpine:3.18-arm64v8
     EXTRA_XEN_CONFIG: |
@@ -435,6 +456,7 @@ alpine-3.18-gcc-debug-arm64-staticmem:
 
 alpine-3.18-gcc-debug-arm64-static-shared-mem:
   extends: .gcc-arm64-build-debug
+  <<: *build-test
   variables:
     CONTAINER: alpine:3.18-arm64v8
     EXTRA_XEN_CONFIG: |
@@ -444,6 +466,7 @@ alpine-3.18-gcc-debug-arm64-static-shared-mem:
 
 alpine-3.18-gcc-debug-arm64-boot-cpupools:
   extends: .gcc-arm64-build-debug
+  <<: *build-test
   variables:
     CONTAINER: alpine:3.18-arm64v8
     EXTRA_XEN_CONFIG: |
@@ -451,6 +474,7 @@ alpine-3.18-gcc-debug-arm64-boot-cpupools:
 
 alpine-3.18-gcc-debug-arm64-earlyprintk:
   extends: .gcc-arm64-build-debug
+  <<: *build-test
   variables:
     CONTAINER: alpine:3.18-arm64v8
     EXTRA_XEN_CONFIG: |
@@ -496,6 +520,7 @@ debian-bookworm-gcc-cppcheck:
 
 debian-bookworm-gcc-arm32-cppcheck:
   extends: .gcc-arm32-cross-build
+  <<: *build-test
   variables:
     CONTAINER: debian:bookworm-cppcheck
     CROSS_COMPILE: /usr/bin/arm-linux-gnueabihf-
-- 
git-series 0.9.1

