Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C87A7A193
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 13:07:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936473.1337707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IPJ-0005F5-Rw; Thu, 03 Apr 2025 11:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936473.1337707; Thu, 03 Apr 2025 11:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0IPJ-0005Cj-PN; Thu, 03 Apr 2025 11:06:49 +0000
Received: by outflank-mailman (input) for mailman id 936473;
 Thu, 03 Apr 2025 11:06:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X4pi=WV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u0IPI-0005Cd-QN
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 11:06:48 +0000
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb2a0096-107b-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 13:06:46 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfout.phl.internal (Postfix) with ESMTP id 2F9DA1380212;
 Thu,  3 Apr 2025 07:06:45 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Thu, 03 Apr 2025 07:06:45 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Apr 2025 07:06:44 -0400 (EDT)
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
X-Inumbo-ID: bb2a0096-107b-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1743678405; x=1743764805; bh=hcPUC6lyGcOBvjwSAqWIcFQ6cB01R6VL
	ke5S96EY+H0=; b=LKucaZ8vQoWMtuHVE3tJNQedV8TnKv8dNrcZFfAcAvk2lLD3
	zjr2SsD1xNrtF/OykYFOmjInQh/FvbkFQThyQSC0UUkDC4t4YkmBxTpZE+8cNNgO
	krJPmQmjvTmT4X4fO2PVy8EJbc2eQF30p+e+0x+XKd8R3jKRMbp2l5iasVlWZKtj
	iL476iqq5h4MNM7Hhspujyuw+Y1g/nUj2ahI6c7F+n+r7Y0zhlNW5doyVz2jGn/s
	j8lRhtLIjk6VAv3iFsNpIEaxOi8yxa6/MX40J5xdUwmc0nQ2Vf9H4Bukk6qRtT/P
	L+9PZ8ffJo1yqPe/ikjtgk7nlzYjsRhf79NZeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1743678405; x=1743764805; bh=hcPUC6lyGcOBvjwSAqWIcFQ6cB01
	R6VLke5S96EY+H0=; b=WA4SciCuuXtoKTSXjQ0/Fi3foS/FQkisBNm9dU20+i8F
	eE3/ieo0QchhyRa1kjhZ9StaZDzROQgWS4LeQ6NqBk4/k5Xo0rkaaGs+jfITr8dc
	aRQIevvTPBKQkTcxdSfaAxckrTEa4A0igiLMBGHwJJF98Vp/HDRhHeuyPos2RqMA
	cf05oYCHZ1AdL7IdlLHm/TaRNCE6nMcSjkXUztbYGIU8EtKEnNJqUEQ3JoEc7I3W
	Ji6WWIkhJIeDN0JiI+pUJM7BrCzfIU0g6KsPoSeFzCXd7HUBpo9WM0NNBrvcDUmI
	MZCbh73Q2WZ/JUDUbpQnepQ/B7jycB/Wanhi7xWoGw==
X-ME-Sender: <xms:xGvuZ4qVaiaNJEuRPFl7aH6JIE-O0J3kkU0VytwWvWQUDuOWgi0fEw>
    <xme:xGvuZ-rD6exUdMM6oDQWng4S72iRnWMT1aTHl62tgdNT_LLuOXaNJynA_Eg9wvsou
    YAaS2RVCuNkeg>
X-ME-Received: <xmr:xGvuZ9P-pGSErAfUjtOyegH9BqgV3deh01EMOK022-zsPxDtj1CY5zd3YbKiNv2q1GxTluCmSEOgYLkk_gA1KbGZSRE5TackSRUyw20IUhEevbUezaI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekfeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpeelkefhudelteelleelteetveeffeetffekteetjeehlefggeekle
    eghefhtdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpd
    hnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvghn
    qdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhope
    grnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepmhgr
    rhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:xGvuZ_59mUAXsy7RIWJZlFJ-dJWxwiqEfvy03fo0uS3B83ogtEbm3A>
    <xmx:xGvuZ36d-A6NrZx3CcvyoQSb3xvXerS-YIDYEDR1daSe8lmEN3D7Aw>
    <xmx:xGvuZ_jeaLIvKPXTSh64dowAO5WlIurtl5AweY0FmuY88hbAQAaISw>
    <xmx:xGvuZx5RNz62-UZoZvKXnWtlaAXzs8HVKEcTL_XLeJPVV1bB1s_moQ>
    <xmx:xWvuZwVMieYau97ZYyoeSOeCbLu3sognyqqiWFcTaGzAbSnH7FWgenRZ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v1 00/11] Several CI cleanups and improvements, plus yet another new runner
Date: Thu,  3 Apr 2025 13:04:35 +0200
Message-ID: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some of those patches are collected from my stubdomain test series, others are
made while getting the new runner working. All of the cleanups can be applied
independently, but most if not all are needed for the final patch adding new
runner.

As usual, besides the patches, somebody need to click on "hal9012" runner in
the relevant projects.

Marek Marczykowski-Górecki (11):
  ci: prevent grub unpacking initramfs
  ci: increase timeout for hw tests
  ci: enable XHCI console in Xen debug build on Alpine
  ci: include domU kernel messages in the console output log
  ci: increase verbosity of starting a domain
  ci: consistently use DOCKER_CMD in makefiles
  ci: wait for the network interface in PCI passthrough tests
  ci: switch test kernel from 6.1.19 to 6.12.21
  ci: adjust resolving network interface into PCI device
  ci: add AMD Zen 4 HW runner
  [DO NOT MERGE] container

 automation/build/Makefile                            |  4 +-
 automation/gitlab-ci/build.yaml                      |  5 +-
 automation/gitlab-ci/test.yaml                       | 58 ++++++++++++-
 automation/scripts/qemu-alpine-x86_64.sh             |  2 +-
 automation/scripts/qemu-smoke-dom0-arm32.sh          |  2 +-
 automation/scripts/qemu-smoke-dom0-arm64.sh          |  2 +-
 automation/scripts/qubes-x86-64.sh                   | 14 +--
 automation/tests-artifacts/Makefile                  |  4 +-
 automation/tests-artifacts/kernel/6.1.19.dockerfile  | 41 +---------
 automation/tests-artifacts/kernel/6.12.21.dockerfile | 43 ++++++++++-
 10 files changed, 119 insertions(+), 56 deletions(-)
 delete mode 100644 automation/tests-artifacts/kernel/6.1.19.dockerfile
 create mode 100644 automation/tests-artifacts/kernel/6.12.21.dockerfile

base-commit: 35910ed65f1d188774ce90ba9898ca33f7a9fe4d
-- 
git-series 0.9.1

