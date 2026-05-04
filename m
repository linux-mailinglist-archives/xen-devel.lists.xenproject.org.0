Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIeOEgyV+GkOwwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C994BD256
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299774.1574371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgN-00031R-L9; Mon, 04 May 2026 12:45:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299774.1574371; Mon, 04 May 2026 12:45:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgN-000309-D1; Mon, 04 May 2026 12:45:55 +0000
Received: by outflank-mailman (input) for mailman id 1299774;
 Mon, 04 May 2026 12:45:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wJsgL-0002jD-PM
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:45:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJsgL-00AF8N-4b
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:45:53 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f894fd-bab6-0a2a0a5309dd-0a2a4507d572-24
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:45:53 +0200
Received: from [202.12.124.154] (helo=fhigh-b3-smtp.messagingengine.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f894ff-229c-0a2a45070019-ca0c7c9ad00d-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:45:52 +0200
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 9F5257A0095;
 Mon,  4 May 2026 08:45:51 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Mon, 04 May 2026 08:45:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 May 2026 08:45:50 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1777898751; x=1777985151; bh=tD30M4kLq4
	1eZNf2YXsYIAJSLodDcoJVNKG5LxCYvCU=; b=vebFS+rIUtTsgsHuCVXhb34nqD
	0sDHscOpX28AXFwrPGd98eS+9CgoZJlU6/j8Qpr9wxDB6Y/OVRi6sWucdbHqlkV0
	pndLeVmZIExU3EK9ScGMq8PlUdpliTeaWrR9JiEXwAG5qmU2i5HAqfo9EHQTYdBf
	lYawxLdnIqlMQtI9QDfPI6dsPqSxBOwbbs6TR+rM6FjnJ8fTArU9LTJJvC98m4WV
	Ee0ZT/2UPhAGbArvJFN788JyGX/w8JOgT0NVGsYuqR9JYdaE25uHg2AfulOumtac
	372yjh+z9ObQTvhE3TqmzMXdexrRkWUTAPNEAsV4ZnbQsTvQS+kD/+VdluBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777898751; x=
	1777985151; bh=tD30M4kLq41eZNf2YXsYIAJSLodDcoJVNKG5LxCYvCU=; b=B
	ipOC5PID10pTO0FITfA0xWq+bqT8RftD8O3BVmn/U25dhoHxVe7aWxYbRjIkmsc8
	GbYfnvEk/FwKb8UZUfjiLR6ESn+AaiwVqIP1tLTc0h4ji3XrSc+q98JghsqyOFEC
	9YEYZmarH9lF0yweWcIxwkUUEbdN+j8aVWJDKhShIeIXGRZHN0ZO4mFbKTvVHhi7
	BfgEjd87nDLWGAwHJiZIlOeEjRQgIGH2vehHzmpfg+ojfsOAJhlrYSM7PlvVwRaG
	hVoVUiQIXIvQOFxVj82sRbZH3DeUew2K/l/5hOMSGhsfyDnFyPC1b3FLw79u4slW
	M9ffwYN+mH+4jhcu4P3OQ==
X-ME-Sender: <xms:_5T4aQmDNGN1PEyY9K_F8yGgrvwOctkvoSurcioSBi5PNVidnTZGww>
    <xme:_5T4aWvHjiDPGZj71uIwsyiKxAK_llqwWxaPWw3G8VXFdFQ0NZ4FBdDtBpF6QmJpE
    hixGnRf-21M-rWDrHaRwLH-IANQLtWlv6oyflzBdnF507r1c0g>
X-ME-Received: <xmr:_5T4aW-dq2fX6osIdV7cSsNfRmnG2juRDeUDFJh9vbday1Q9wgJgfObStT3yk4mHECJLXZLjYTtLJMnIi_K2kwWBI1PDowx68EzsFSuvvAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelkeekjecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:_5T4aYPseD2Y-Nyla1oUdwv0V6mAg3zzOoGNTZ8weAsRZaZimYrMUQ>
    <xmx:_5T4acEi1Kgqk_ya5FwfRS_Dp5TOkNO67gKHDWO-LiGse8v5rS-yeQ>
    <xmx:_5T4aeSLdOUJiLN7FWdFCFeQyMktFouqZtAjqdlibP0n-gO92KA-1A>
    <xmx:_5T4aRuwt2wYF-CYY7mZhq1Gd6CPJ5sqI3h9ZzMN03VGC3PBNYQDxg>
    <xmx:_5T4afgEqNNHEwXBGzfhOgS-tdtcuUWDIZpzeKIpvfqgMsBu56rDFvYM>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 06/13] Support building arbitrary Linux branch/tag/commit
Date: Mon,  4 May 2026 14:35:45 +0200
Message-ID: <9440095275dd9313f7f8e2a41384e1275be0fcaa.1777898148.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
References: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1777898753-15C5CC48-FB090AA6/0/0
X-purgate-type: clean
X-purgate-size: 4305
X-Rspamd-Queue-Id: C1C994BD256
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm3];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:email,invisiblethingslab.com:dkim,invisiblethingslab.com:mid,messagingengine.com:dkim,gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
Changes in v4:
- Adjust error message on missing version
- Extract kernel version from job name
Changes in v3:
- pass kernel version via script arguments, not variables
---
 .gitlab-ci.yml         | 29 +++++++++++++++++++++++++----
 scripts/build-linux.sh | 23 +++++++++++++++++------
 2 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4147be5..45006d4 100644
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
@@ -30,6 +34,13 @@ stages:
   variables:
     CONTAINER: alpine:3.23-x86_64-build
 
+.linux-tpl:
+  script: &linux-script
+  - linux_version="${CI_JOB_NAME}"
+  - linux_version="${linux_version#linux-}"
+  - linux_version="${linux_version%%-*}"
+  - ./scripts/build-linux.sh "${linux_version}"
+
 #
 # ARM64 artifacts
 #
@@ -49,11 +60,16 @@ alpine-3.23-arm64-rootfs:
 
 linux-6.6.86-arm64:
   extends: .arm64-artifacts
-  script: ./scripts/build-linux.sh
+  script: *linux-script
   variables:
-    LINUX_VERSION: 6.6.86
     CONTAINER: alpine:3.18-arm64-build
 
+linux-git-arm64:
+  extends: .arm64-artifacts
+  script: ./scripts/build-linux.sh "$LINUX_GIT_VERSION" "$LINUX_GIT_URL"
+  rules:
+  - if: $LINUX_GIT_VERSION && $LINUX_GIT_URL
+
 #
 # x86_64 artifacts
 #
@@ -80,13 +96,18 @@ debian-13-x86_64-rootfs:
 
 linux-6.6.56-x86_64:
   extends: .x86_64-artifacts
-  script: ./scripts/build-linux.sh
+  script: *linux-script
   variables:
-    LINUX_VERSION: 6.6.56
     ARGO_SHA: "cf73819cacc945baca1a7421e5836d1bd481739b"
     ARGOEXEC_SHA: "d900429f6640acc6f68a3d3a4c945d7da60625d8"
     CONTAINER: alpine:3.18-x86_64-build
 
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
index cf0e744..e01b517 100755
--- a/scripts/build-linux.sh
+++ b/scripts/build-linux.sh
@@ -1,8 +1,11 @@
 #!/usr/bin/env bash
 
+LINUX_VERSION="$1"
+LINUX_GIT_URL="$2"
+
 if test -z "${LINUX_VERSION}"
 then
-    >&2 echo "LINUX_VERSION must be set"; exit 1
+    >&2 echo "Version argument missing"; exit 1
 fi
 
 set -ex -o pipefail
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

