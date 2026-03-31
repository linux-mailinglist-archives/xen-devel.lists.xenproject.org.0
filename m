Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOKUO1BXzGn/SQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:22:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E91372B55
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:22:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269365.1558471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPh-00029n-5W; Tue, 31 Mar 2026 23:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269365.1558471; Tue, 31 Mar 2026 23:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPh-00023p-0s; Tue, 31 Mar 2026 23:22:25 +0000
Received: by outflank-mailman (input) for mailman id 1269365;
 Tue, 31 Mar 2026 23:22:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w7iPg-0001xZ-CD
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 23:22:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7iPf-002Gy3-P6
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 01:22:23 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc5720-bab6-0a2a0a5309dd-0a2a4503c6ca-16
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:23 +0200
Received: from [103.168.172.149] (helo=fout-a6-smtp.messagingengine.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc572e-1947-0a2a45030019-67a8ac959953-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:23 +0200
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfout.phl.internal (Postfix) with ESMTP id 91EAAEC010C;
 Tue, 31 Mar 2026 19:22:22 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Tue, 31 Mar 2026 19:22:22 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 19:22:21 -0400 (EDT)
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
	:subject:to:to; s=fm1; t=1774999342; x=1775085742; bh=9L6rTUy+Nw
	4XaYZL170+8zqCCwzBH/+BufLefbV4lFU=; b=Nql70OX+fDNsiGUKvq/VHb1QqW
	Rpr2KZ5hnIzG5Qc7XwvLyr9qmxDg7virnj9UXBqj/at0MG9oTf3ZsgmDDYbm70Bl
	5FtBaFlhFssLkNjoniBY0ywYTmaJuVny5N4TD5LRgIxBEKkL7RpLjirjvjLfWSAj
	23gWSNLwb5M5KF7On7pBMl5DOK96Huqu2J5RmJimgGgKWhhlJirmshLr3ADdO7yK
	Qte5lKup3kEEsDjuA5j1e5hey4S72vI8IC3mJJFgx8S/N7EmYHQeb7JDfiUMsyEC
	Wjo7cZD4+P4JIqB2jwXqYiAXTlVSggNsrnfvsLsRGV/202ahI+avlKo0Ugzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774999342; x=
	1775085742; bh=9L6rTUy+Nw4XaYZL170+8zqCCwzBH/+BufLefbV4lFU=; b=K
	IuQuquD2dUOjtXhPAFEy2X8u/83SSRUtKDnwiWdqpJTSuitJILaBkUKYgXHj0AHE
	qFX1e1MrhOWFdAVYt/9Lb1++/GCQY1DGRhjTPcjzcAAnxzuBfVjFsMugmKPtt1CT
	J6kGByCRpNDe5dBSNKy1tLVALYnaKrV/VQig6tN6Y1HGUJjEDsTcJPm6Pz631C2I
	xeD7DXuqLRn+H0U7cGA/+weNsVhTBvntLixKdhP9pVp/l1hpJci7yoCKrZ2nHsRn
	N221wqy/bO0FYNkMDhHiw57PDUlDkn2LWI0FNP/0PKz4rATBSDZ/BJcTrXcMNi5H
	sf0C+UtOpdgv01hKHJe1g==
X-ME-Sender: <xms:LlfMaWm2wwvQbMpqksT_KJ95KnwMk68M0SKsH5hPUdSflFXGWWt47Q>
    <xme:LlfMaUvnLyqQut_8QUf71E3K037OL1NVp0CjtTYyZ2g7Zc0WvYWYiaT3bgTERYZdZ
    H_fLcoCPZP27mcCCWRKuvBqxgyyAQX7nX7c-wyEHV0gIoB1Vg>
X-ME-Received: <xmr:LlfMac9vaeap-ulApArEr8IROwSIPre1OdbMLWCpgpt3aOFBw2GIqrY6eA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeffiedtgeev
    ffetledvgefhhfevgffhfeekleehueejjeegvddvgfffjeeutddvleenucffohhmrghinh
    epkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtg
    hpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphht
    thhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehroh
    hgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:LlfMaWO_ze-zN0c0dSCDOnPSRCrXNg66SUqZ1nfdqqNphs5uJipLHg>
    <xmx:LlfMaSEs53Lt6QbpSCnUad2G5BQ6vRLKWSqQPC9WnKnPRCmNq8PP9g>
    <xmx:LlfMacTJe-5qgDlQfTgMoiypjpbUirCukkRIT-bWg9J0B6TgMRKaZg>
    <xmx:LlfMaXtI5BCOiLQN2P5TpePgS_L_on-uRHY-nK5Co8wbJI2p3RychQ>
    <xmx:LlfMadjGzSvxRX8alnp5cG2kWtC1vmObqOg7cGWz0C4W95V4pCqyJRkC>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH test-artifacts v3 09/13] Add trigger-test job, to run test on a Linux built from a branch/tag
Date: Wed,  1 Apr 2026 01:21:59 +0200
Message-ID: <9893108225500bb841a39918942bc9267e62b6af.1774999132.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1774999343-EB68972C-8697D2F9/0/0
X-purgate-type: clean
X-purgate-size: 1984
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
X-Rspamd-Queue-Id: 94E91372B55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When scheduling pipeline in test-artifacts repo, it can get also
TEST_TRIGGER_REPO and TEST_TRIGGER_BRANCH variables, to trigger relevant
pipeline to test just built artifacts.
Pass ARTIFACTS_REPO+ARTIFACTS_BRANCH to the child pipeline to ensure it
fetches artifacts from the right job.
For example, to build linux-next and test Xen staging on it, the
pipeline could be triggered with:

    LINUX_GIT_URL=https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
    LINUX_GIT_VERSION=master
    TEST_TRIGGER_REPO=xen-project/hardware/xen
    TEST_TRIGGER_BRANCH=staging

The triggered xen test pipeline will skip most build jobs.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 .gitlab-ci.yml | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 62b2a24e7faf..9d90a8f57ff8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -4,9 +4,14 @@ variables:
     description: "branch/tag/commit for the linux-git jobs"
   LINUX_GIT_URL:
     description: "git url for the linux-git jobs"
+  TEST_TRIGGER_REPO:
+    description: "gitlab repo on which test just built linux, for example 'xen-project/hardware/xen'"
+  TEST_TRIGGER_BRANCH:
+    description: "branch in TEST_TRIGGER_REPO to test on, for example 'staging'"
 
 stages:
   - build
+  - deploy
 
 .artifacts:
   stage: build
@@ -105,3 +110,18 @@ linux-git-x86_64:
 microcode-x86:
   extends: .x86_64-artifacts
   script: ./scripts/x86-microcode.sh
+
+trigger-test:
+  stage: deploy
+  trigger:
+    project: $TEST_TRIGGER_REPO
+    branch: $TEST_TRIGGER_BRANCH
+    strategy: mirror
+  variables:
+    ARTIFACTS_REPO: $CI_PROJECT_PATH
+    ARTIFACTS_BRANCH: $CI_COMMIT_REF_NAME
+    LINUX_JOB_X86_64: linux-git-x86_64
+    LINUX_JOB_ARM64: linux-git-arm64
+    BUILD_FOR_TESTS_ONLY: 1
+  rules:
+  - if: $TEST_TRIGGER_REPO && $TEST_TRIGGER_BRANCH
-- 
git-series 0.9.1

