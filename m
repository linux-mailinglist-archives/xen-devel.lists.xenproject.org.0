Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGxzH/FYzGk4SgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:29:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3264C372CAE
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:29:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269504.1558538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iWk-0008EU-Lz; Tue, 31 Mar 2026 23:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269504.1558538; Tue, 31 Mar 2026 23:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iWk-0008CE-I8; Tue, 31 Mar 2026 23:29:42 +0000
Received: by outflank-mailman (input) for mailman id 1269504;
 Tue, 31 Mar 2026 23:29:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w7iWi-000848-NA
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 23:29:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7iWi-004YpL-3o
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 01:29:40 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc5879-bab6-0a2a0a5309dd-0a2a45078f28-28
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:29:40 +0200
Received: from [103.168.172.149] (helo=fout-a6-smtp.messagingengine.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc57f2-fd74-0a2a45070019-67a8ac95a6db-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:25:39 +0200
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfout.phl.internal (Postfix) with ESMTP id AC422EC01BF;
 Tue, 31 Mar 2026 19:25:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Tue, 31 Mar 2026 19:25:38 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 19:25:37 -0400 (EDT)
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
	:subject:to:to; s=fm1; t=1774999538; x=1775085938; bh=Ztn/aNTMuH
	aTPNCMiusNIKu+GfII8BJBtQBo3hfUqMU=; b=ZqBf+Q5H5/aK3Z6HibMWErXrek
	Q+fIRcxl/lTveaqEJDY3umq2ol26zOnw13AxTGEHJrDo6yZ//lmrCuQ02aXnww6r
	nOkpCpI1pDo3hEO7EdsQRhIkD4+KUJK0OeqaFxoCcwTrP2fUPlDUSInXJ9+LBSaN
	jK3weoD1aLG9wtsTSDE6S05yPyhrm6upagYX479iOOC82gjXz4lWa2ddqszN4ES2
	CPGxL/T/SVN3tCxkrsK/oSGr3zyBf65mvMdY9p/dxKneCqPO9B/pt8GD+UkioReu
	EHZQz6sOHJX16wE2suBcHDNKsSkKDjBAHzEXGvxN61VIQNsU9RoEmWuemWRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774999538; x=
	1775085938; bh=Ztn/aNTMuHaTPNCMiusNIKu+GfII8BJBtQBo3hfUqMU=; b=g
	nGK2KdQW6sen0LjPUQKKsfdfnRhrmYN2LZfTua/822uQd9JqbzyguKwl3YuqhK5A
	vqBrIAGPKtzAcmHhJ/ql/gka0UDnAZ+G/1aE19Zyr6VKzM72RQo9wdKN35xW63h+
	NztCf9hFXlYROTqL2KsCmGjALsO1Jn15GLOiNEyICH3OtMpesa775P37WjaJnlXH
	STz4MrL3ZPyMBdd0WqqLBQfum2rQ5c2ztJpcLtNV+CSk9oioGYQ7bTq3ROi/yTog
	vvxUWuSta+Qlk6TGekqqXzrifO123bVITmEIdUn+eGhL1YjNeTpDWWBG/Zvk5qi2
	knCDBwb9IoXdiFWXzrRXA==
X-ME-Sender: <xms:8lfMaeE5NV_gVGEO11yI_levxbMjYMi74UeX8Kxes1J_Z1RTVXVRuA>
    <xme:8lfMaWOxQvDsVI_Pgsq2-rCLO3KPEkvRPSqPOWFDLY8qRcBOc31w2TOebYJ8w-Ivz
    PF0_5PnDIKmzP3WtC7qXJmuryQbK9vNm_nTu3qmPactaiaU>
X-ME-Received: <xmr:8lfMaQcMGzwvOifQbPEowSHogztdTBo2wdRXigJ0s1CsbVb2l9NadOdFfQ>
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
X-ME-Proxy: <xmx:8lfMaTuTZ5JnN4zbikppHSRz0abV1L7TH2nRBYN1s2x9OzgyuGSlIA>
    <xmx:8lfMaRlv2n3uA2YT3PcU44d7YMyAkdTwIKaJH7dw6wIc_Q5_Z73i5A>
    <xmx:8lfMaVwd2vJvuWztYbTb1rCJk5XavXMwuf3tFQlyUoV_wNK9xT_W1w>
    <xmx:8lfMaTNwSIwdvt7rZFxfqPSp0-vEDgeNIdcCmU8MDWfXDfex5sWixA>
    <xmx:8lfMaXD3uEYFu5EBu4xycTqEO-dsYd4N0mBU2t04XF1eFOh5kKJ1ZAH6>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 2/6] CI: make test-artifacts repo/branch/job customizable
Date: Wed,  1 Apr 2026 01:24:51 +0200
Message-ID: <2d5d25d864058dcd9d139fd2115b88f82ba12424.1774999414.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.ca38f9571ab23e254a985ecfd4715235675aa06e.1774999414.git-series.marmarek@invisiblethingslab.com>
References: <cover.ca38f9571ab23e254a985ecfd4715235675aa06e.1774999414.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1774999539-566AF303-86701BA9/13/0
X-purgate-type: clean
X-purgate-size: 3279
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:dkim,invisiblethingslab.com:email,invisiblethingslab.com:mid,messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 3264C372CAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allow choosing which artifacts branch and job to use for Linux. This
allows running the same tests for different Linux versions, without
duplicating a lot of yaml sections.

Similarly, make the repo path itself configurable too. The main purpose
is to ensure the test pipeline triggered from any repo will fetch linux
artifact from the right repo. But with a minor change of using that
variable for rootfs and microcode artifacts too, it allows testing
test-artifacts repo changes without needing to modify gitlab-ci.yml in
xen.git at all.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
I have considered common LINUX_JOB and then add architecture suffix, but
even now X86 and ARM use different jobs, so I made them separate.

Changes in v2:
- make repo path configurable too
- rename LINUX_ARTIFACTS_BRANCH to ARTIFACTS_BRANCH
---
 .gitlab-ci.yml                 | 12 ++++++++++++
 automation/gitlab-ci/test.yaml | 24 ++++++++++++------------
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 64bed300a6c4..2124e3a79eef 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -3,6 +3,18 @@ variables:
   SELECTED_JOBS_ONLY:
     description: "Regex to select only some jobs, must be enclosed with /. For example /job1|job2/"
     value: "/.*/"
+  ARTIFACTS_REPO:
+    description: "Path to the test-artifacts repo"
+    value: xen-project/hardware/test-artifacts
+  ARTIFACTS_BRANCH:
+    description: "Branch in test-artifacts to use"
+    value: master
+  LINUX_JOB_X86_64:
+    description: "Job name in test-artifacts to use for Linux x86_64"
+    value: linux-6.6.56-x86_64
+  LINUX_JOB_ARM64:
+    description: "Job name in test-artifacts to use for Linux arm64"
+    value: linux-6.6.86-arm64
 
 workflow:
   name: "$CI_PIPELINE_SCHEDULE_DESCRIPTION"
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index e189a774e946..8770c523e228 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -6,27 +6,27 @@
     when: on_success
 
 .arm64-test-needs: &arm64-test-needs
-  - project: xen-project/hardware/test-artifacts
-    job: linux-6.6.86-arm64
-    ref: master
-  - project: xen-project/hardware/test-artifacts
+  - project: $ARTIFACTS_REPO
+    job: $LINUX_JOB_ARM64
+    ref: $ARTIFACTS_BRANCH
+  - project: $ARTIFACTS_REPO
     job: alpine-3.18-arm64-rootfs
-    ref: master
+    ref: $ARTIFACTS_BRANCH
   - qemu-system-aarch64-6.0.0-arm64-export
 
 .arm32-test-needs: &arm32-test-needs
   - qemu-system-aarch64-6.0.0-arm32-export
 
 .x86-64-test-needs: &x86-64-test-needs
-  - project: xen-project/hardware/test-artifacts
-    job: linux-6.6.56-x86_64
-    ref: master
-  - project: xen-project/hardware/test-artifacts
+  - project: $ARTIFACTS_REPO
+    job: $LINUX_JOB_X86_64
+    ref: $ARTIFACTS_BRANCH
+  - project: $ARTIFACTS_REPO
     job: alpine-3.18-x86_64-rootfs
-    ref: master
-  - project: xen-project/hardware/test-artifacts
+    ref: $ARTIFACTS_BRANCH
+  - project: $ARTIFACTS_REPO
     job: microcode-x86
-    ref: master
+    ref: $ARTIFACTS_BRANCH
 
 .qemu-arm64:
   extends: .test-jobs-common
-- 
git-series 0.9.1

