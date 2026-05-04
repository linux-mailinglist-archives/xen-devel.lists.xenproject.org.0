Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDdSCQqV+Gn0wgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC524BD242
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299768.1574322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgE-0001gu-T7; Mon, 04 May 2026 12:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299768.1574322; Mon, 04 May 2026 12:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgE-0001bU-PV; Mon, 04 May 2026 12:45:46 +0000
Received: by outflank-mailman (input) for mailman id 1299768;
 Mon, 04 May 2026 12:45:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wJsgD-0001YR-C2
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:45:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJsgC-00AF4e-No
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:45:44 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f894f6-bab6-0a2a0a5309dd-0a2a450285aa-18
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:45:44 +0200
Received: from [202.12.124.146] (helo=fout-b3-smtp.messagingengine.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f894f7-af86-0a2a45020019-ca0c7c9299d9-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:45:44 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.stl.internal (Postfix) with ESMTP id 2E9E61D00072;
 Mon,  4 May 2026 08:45:43 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Mon, 04 May 2026 08:45:43 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 May 2026 08:45:41 -0400 (EDT)
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
	:subject:to:to; s=fm2; t=1777898743; x=1777985143; bh=Nqcj1coJ3a
	zx/jiKYdqjenpPAF4yXwqZcKoRg2bnT1k=; b=X6C8lIebmOB9+4XKmqk1Av6hzl
	fUHNvj7eSfbIYjwq1aZhasqPubw+q0bbWROBC+iZtC/Kn5SduSmPfp9SlLa9z8es
	GwNyvuk36uxwVA+LQhamvwEgWM6wcb4IItLIdIuwUScfD2NH546gd85sE4M/xxvx
	0SDXqwqr0zpOmDsQit/qr9jNn+xBmGP6YBCm1tBjXXl/rxR5UrYKBpQFrvku5w2M
	rHUxA5J/XopINmeu1YDrylTQO1Y61gaKiEqCJQViW/0EZmQAq58D5HDd7GrEctRu
	ejmFDGj1aA3McVAjERkRZ1C4GvkbjWUIwex8dtI0H299u4fJ3fViGRr9FGew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777898743; x=
	1777985143; bh=Nqcj1coJ3azx/jiKYdqjenpPAF4yXwqZcKoRg2bnT1k=; b=u
	CHo96kktDXK2nlXXYkLq0U7X7nKt9nU2Fs8RUwx3nTrZM0UvYcsUT7fDJuWftcnN
	qMLatvUMG9OWGie0pujFr6NCJNfYsn2Y0Zucwv8n6bpeCYE/dcLpQOJ+n5sCDv4v
	a8SUZhsXWFV7Q9X1zWwkJ/9GnPGGIr5QsUG/m+uUTfiCH/moLOqesmIQrJ8xgJv3
	JTMK2+5Qr0vl/oKA5ACYBewpoyCOUKSuvF1nXnSibjOicwhWVaJvpBhbfTKvtF+V
	zuTcMFNPOotWnSnm4cHS5sOE1M5mUqCMSDQSfvfviGD1zd8CBFtQNh0m4OC5Jep5
	xmJg3XLiQSLfQcAuixSSw==
X-ME-Sender: <xms:9pT4acZwb4HAeC3QQsGGFgphEBuZ8n7xS-atHT9riEvs9Q2XMRATsw>
    <xme:9pT4aeTOeQHoXoSoQ9xKyxAQc8U-lvmdTAIYDr0Qc3_wcmZOl-6CLAdr5BOu0WIZH
    AVCuXigMYA-h9kQaH25tcV-e1b_ujEFKKNa5OeqpbVeZBuR7w>
X-ME-Received: <xmr:9pT4afSBACbIZtMJDjX-51OINIp6IQ0o1Qt_mNtf5zl8zxz3jcr3hoz7nigCDvJ-uQ1rpVpUwpDF28PQZwtMoFItVn-1duASsoV7vNeCsro>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelkeekjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeuudeh
    gfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdr
    gigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrh
    efsegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
    dprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggs
    rdgtohhm
X-ME-Proxy: <xmx:9pT4aSS3iY2WkwnX9rsvDqBXW9eTNjfCo6lLhEDlxUnSWNDRvw7fFw>
    <xmx:9pT4aU4Pc0Auh00Y9_XTihbdpIWSlWH5x-a8B4EBvwNx6kT-m3JvRA>
    <xmx:9pT4ae3xoZQZUnMiDne71asYyuj82U9DLuNCQB2vPVxdu_ypbZm2wQ>
    <xmx:9pT4afA3BKsiKuLz5Sx5nL8pzRqHX6LUz7B_ijrh3LG7lcpH047OPw>
    <xmx:95T4aeEHgd8iLB7qZ_oSaPxVrCfAXHOgGlM-DYEa7dbc3pCyXqQouboT>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 01/13] Add Alpine 3.23 containers
Date: Mon,  4 May 2026 14:35:40 +0200
Message-ID: <d778b5c5936932fa0925ffa3bf3e1656da26bbaf.1777898148.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
References: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1777898744-82374161-B98F688F/10/63158204843
X-purgate-type: spam
X-purgate-size: 6307
X-Rspamd-Queue-Id: 8BC524BD242
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:email,invisiblethingslab.com:dkim,invisiblethingslab.com:mid];
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

Add it in all variants:
- base container
- build container
- initramfs archive

libdw used to be part of libelf in Alpine 3.18, but it's a separate
package in 3.23.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v4:
- Update to Alpine 3.23
- Fix alpine-3.22-arm64-rootfs
- Adjust default in containerize script
Changes in v3:
- add comment about libdw
---
 .gitlab-ci.yml                             | 14 +++++++-
 containerize                               |  6 ++-
 images/alpine/3.23-arm64-base.dockerfile   |  6 +++-
 images/alpine/3.23-arm64-build.dockerfile  | 31 +++++++++++++++++-
 images/alpine/3.23-x86_64-base.dockerfile  |  6 +++-
 images/alpine/3.23-x86_64-build.dockerfile | 43 +++++++++++++++++++++++-
 scripts/alpine-rootfs.sh                   |  6 +++-
 7 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 images/alpine/3.23-arm64-base.dockerfile
 create mode 100644 images/alpine/3.23-arm64-build.dockerfile
 create mode 100644 images/alpine/3.23-x86_64-base.dockerfile
 create mode 100644 images/alpine/3.23-x86_64-build.dockerfile

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c698612..b86d9aa 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -40,6 +40,13 @@ alpine-3.18-arm64-rootfs:
   variables:
     CONTAINER: alpine:3.18-arm64-base
 
+alpine-3.23-arm64-rootfs:
+  extends: .arm64-artifacts
+  script:
+    - ./scripts/alpine-rootfs.sh
+  variables:
+    CONTAINER: alpine:3.23-arm64-base
+
 linux-6.6.86-arm64:
   extends: .arm64-artifacts
   script: ./scripts/build-linux.sh
@@ -56,6 +63,13 @@ alpine-3.18-x86_64-rootfs:
   variables:
     CONTAINER: alpine:3.18-x86_64-base
 
+alpine-3.23-x86_64-rootfs:
+  extends: .x86_64-artifacts
+  script:
+    - ./scripts/alpine-rootfs.sh
+  variables:
+    CONTAINER: alpine:3.23-x86_64-base
+
 linux-6.6.56-x86_64:
   extends: .x86_64-artifacts
   script: ./scripts/build-linux.sh
diff --git a/containerize b/containerize
index 38a434a..a74ef45 100755
--- a/containerize
+++ b/containerize
@@ -27,7 +27,11 @@ case "_${CONTAINER}" in
     _alpine-3.18-arm64-base) CONTAINER="${BASE}/alpine:3.18-arm64-base" ;;
     _alpine-3.18-arm64-build) CONTAINER="${BASE}/alpine:3.18-arm64-build" ;;
     _alpine-3.18-x86_64-base) CONTAINER="${BASE}/alpine:3.18-x86_64-base" ;;
-    _alpine-3.18-x86_64-build|_) CONTAINER="${BASE}/alpine:3.18-x86_64-build" ;;
+    _alpine-3.18-x86_64-build) CONTAINER="${BASE}/alpine:3.18-x86_64-build" ;;
+    _alpine-3.23-arm64-base) CONTAINER="${BASE}/alpine:3.23-arm64-base" ;;
+    _alpine-3.23-arm64-build) CONTAINER="${BASE}/alpine:3.23-arm64-build" ;;
+    _alpine-3.23-x86_64-base) CONTAINER="${BASE}/alpine:3.23-x86_64-base" ;;
+    _alpine-3.23-x86_64-build|_) CONTAINER="${BASE}/alpine:3.23-x86_64-build" ;;
 esac
 
 # Use this variable to control whether root should be used
diff --git a/images/alpine/3.23-arm64-base.dockerfile b/images/alpine/3.23-arm64-base.dockerfile
new file mode 100644
index 0000000..5899803
--- /dev/null
+++ b/images/alpine/3.23-arm64-base.dockerfile
@@ -0,0 +1,6 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/arm64/v8 alpine:3.23
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+RUN apk --no-cache add bash
diff --git a/images/alpine/3.23-arm64-build.dockerfile b/images/alpine/3.23-arm64-build.dockerfile
new file mode 100644
index 0000000..1e04b3a
--- /dev/null
+++ b/images/alpine/3.23-arm64-build.dockerfile
@@ -0,0 +1,31 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/arm64/v8 alpine:3.23
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+RUN apk --no-cache add bash
+
+RUN <<EOF
+#!/bin/bash
+      set -eu
+
+      adduser -D user --shell /bin/bash
+
+      DEPS=(# Base environment
+            build-base
+            curl
+            git
+
+            # Linux build deps
+            bison
+            findutils
+            flex
+            openssl-dev
+            perl
+      )
+
+      apk add --no-cache "${DEPS[@]}"
+EOF
+
+USER user
+WORKDIR /build
diff --git a/images/alpine/3.23-x86_64-base.dockerfile b/images/alpine/3.23-x86_64-base.dockerfile
new file mode 100644
index 0000000..4c5807f
--- /dev/null
+++ b/images/alpine/3.23-x86_64-base.dockerfile
@@ -0,0 +1,6 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 alpine:3.23
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+RUN apk --no-cache add bash
diff --git a/images/alpine/3.23-x86_64-build.dockerfile b/images/alpine/3.23-x86_64-build.dockerfile
new file mode 100644
index 0000000..b938d7b
--- /dev/null
+++ b/images/alpine/3.23-x86_64-build.dockerfile
@@ -0,0 +1,43 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 alpine:3.23
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+RUN apk --no-cache add bash
+
+RUN <<EOF
+#!/bin/bash
+      set -eu
+
+      adduser -D user --shell /bin/bash
+
+      DEPS=(# Base environment
+            build-base
+            curl
+            git
+
+            # Linux build deps
+            bison
+            diffutils
+            elfutils-dev
+            findutils
+            flex
+            gawk
+            linux-headers
+            openssl-dev
+            perl
+
+            # Microcode
+            jq
+
+            # Argo build deps
+            autoconf
+            automake
+            libtool
+      )
+
+      apk add --no-cache "${DEPS[@]}"
+EOF
+
+USER user
+WORKDIR /build
diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
index 6fa1d56..3cd3ab9 100755
--- a/scripts/alpine-rootfs.sh
+++ b/scripts/alpine-rootfs.sh
@@ -40,6 +40,12 @@ case $UNAME in
             # QEMU
             libelf
             )
+        # libdw used to be part of libelf in Alpine 3.18, but it's a separate
+        # package in 3.22.
+        if ! grep -q VERSION_ID=3.18 /etc/os-release; then
+            # QEMU
+            PKGS+=( libdw )
+        fi
         ;;
 
     aarch64)
-- 
git-series 0.9.1

