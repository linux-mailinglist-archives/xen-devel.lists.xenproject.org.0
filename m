Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B65CA48C1
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 17:38:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177998.1502022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCLW-000143-Hb; Thu, 04 Dec 2025 16:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177998.1502022; Thu, 04 Dec 2025 16:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRCLW-0000yi-B5; Thu, 04 Dec 2025 16:38:22 +0000
Received: by outflank-mailman (input) for mailman id 1177998;
 Thu, 04 Dec 2025 16:38:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ymfd=6K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRCLU-0008JN-SB
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 16:38:20 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a42ff20b-d12f-11f0-9d1a-b5c5bf9af7f9;
 Thu, 04 Dec 2025 17:38:20 +0100 (CET)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 82718EC0596;
 Thu,  4 Dec 2025 11:38:19 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Thu, 04 Dec 2025 11:38:19 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Dec 2025 11:38:18 -0500 (EST)
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
X-Inumbo-ID: a42ff20b-d12f-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1764866299; x=1764952699; bh=STz7Uc+5rO
	kfydw1yY0lDeLylqgkRWZrUjzisf9UYM0=; b=CXJEw+J1QuNZREB/dDg/V/V4MQ
	3kWUsT+7UOn2itF8EThtu/mTLqm7JdvvYlcPkZHahNrVvLVEhwUf+xpqibqbbDDV
	wlOfF1Ux0aNBE+0BMx2OQW9W+B6sPGJTG7KOnO4AF+RP9uIDtyk3URoHLLDgqLjj
	mC+4GVv4LIxkzXMl1/P7M+qQ3qL+5KetYVFl46pkPDyQ/HakiXjY9ZL8j92iguxb
	DlLrpJr47ZIcH4YzCHQu+JQARWQYjOrepMVEyGu896tiqwosUMLunuEM5/Mxom6c
	ztbvXldNuhsVtzM3WNtyPxiTyaoelW3wTnIsE6d7dc/7xZC0E8HVW9fUxruA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764866299; x=
	1764952699; bh=STz7Uc+5rOkfydw1yY0lDeLylqgkRWZrUjzisf9UYM0=; b=k
	KKpm+YpU/cLwPC5HbCx2umAPsEWLlg/rtmHRNnweGkLxktmv/R6QGbzElkFPUjC1
	k8TpaQ3U6pSDH+8yfTm16EX1Apm1sMPwel2gnBJGrQA1+tqny26oj9JI59WeFh2F
	CQTyUvAsfrjSxpWgGyPAAo/4PCajniM5n99oI1kktgbK+oMDIpNAk+pjeYO4TtNj
	jridYarcPghrWVeEzDqHGuaYqTN5GBoAVilK14xgyv+291iReuea/qpf18MdpWbD
	m59lLdtJ8TOEA2pMH6ctTmuhbbCJfAF8KemD21hsHh/YuiTqESSE4jsYxlIx85Z/
	DPexEtZcRO/mu/IQrGqrw==
X-ME-Sender: <xms:-7gxaX4Hnp3lzJOgLzt_hrxkpM8ltO5R-7WcWEsP58LIR3cNUgr_iw>
    <xme:-7gxaTxLWV5xTg8HcoPKcfHO-_c57TO27sOQ0UXwdYbSP9pJMiMcJe0EuKbkYZKzA
    EpK4AFIHF1wm6LfoeUVaR1qm9PgoKM7uJCbZUznN3tRHrlek7o>
X-ME-Received: <xmr:-7gxaWyD_2ucn8UYyO0ZxbW3w_AfpRIrUHno2-zpoLXTJMmJgzPBlFA8NDZtT857nLA1ywXh0xmWnTe1RTd6X95kM83r1cYE6cym1khdwJc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitdekucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:-7gxaTwnD-HfJ1yjRox4r80HElwGNlOImHPFMvG2Aoer9nrW8aYwYw>
    <xmx:-7gxaYZZGdnCe_M2yjECiKzGn_7oyXvSpi68twHh9vaM5VBen3X58w>
    <xmx:-7gxacXbvfUPkVel0ffcs9lCixyvrdzPLvHosMGxe0w0xtLjnH9dKA>
    <xmx:-7gxaejYHvtcodSWdC34Aff-tMS4f8Whn4EPCX-UFLnimi8epx_BOw>
    <xmx:-7gxaXBsNDPTrCJNN_yg8vUnDSTc9Ll1j1F9f65X1RDuYQUzbmA40t7y>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 07/12] Support building arbitrary Linux branch/tag/commit
Date: Thu,  4 Dec 2025 17:37:28 +0100
Message-ID: <c7579b953d400d368f171e4dd56e1b7f879e386f.1764866136.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
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
index 184d0b3..8d1deee 100644
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
@@ -53,6 +57,15 @@ linux-6.6.86-arm64:
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
@@ -91,6 +104,15 @@ linux-6.12.60-x86_64:
   variables:
     LINUX_VERSION: 6.12.60
 
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

