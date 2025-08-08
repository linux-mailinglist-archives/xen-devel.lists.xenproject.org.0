Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 405F3B1EA6A
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 16:34:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074619.1437105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOAQ-0003CJ-2a; Fri, 08 Aug 2025 14:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074619.1437105; Fri, 08 Aug 2025 14:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOAP-00039i-V8; Fri, 08 Aug 2025 14:33:57 +0000
Received: by outflank-mailman (input) for mailman id 1074619;
 Fri, 08 Aug 2025 14:33:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9AHj=2U=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ukOAO-00039R-7E
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 14:33:56 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4bc2978-7464-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 16:33:54 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 337BF1400034;
 Fri,  8 Aug 2025 10:33:52 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Fri, 08 Aug 2025 10:33:52 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Aug 2025 10:33:51 -0400 (EDT)
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
X-Inumbo-ID: b4bc2978-7464-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1754663632; x=1754750032; bh=TywbdyKjTGb9zQiPw3CNvdD+jR/ex2Ns
	bXDulvj78D4=; b=CzF/1M7+66UZIBm1PBx01eKIKKwYfkwMOJ8ZgWoW4tEJFG3q
	YbrzbDVspD81Z94VhU8f8C+wEHCoGYq+NHg1XcD564ZSV5/RL3sgRp9nm1NTj1Eb
	oZmVP4XS/2MR60xSBBThHFvtRs0kcyOcO5DtJHniZ873cd07laqa/Ry7PewbW5uE
	kA5BD1hy5PbO9gRdhjAglY56lsWrTU1XswXPai3LXAwgQZCCloXPxbQwotUfwV1K
	LPQeq82+347FeedjhMIlPOHuyUUnbXIYjAhWAPUzw4BaKkNUcSsM9H93S+Qlc1Wq
	GMy61QkdurOzUdacBReX4fd+ypT2GOkhp7NmOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1754663632; x=1754750032; bh=TywbdyKjTGb9zQiPw3CNvdD+jR/e
	x2NsbXDulvj78D4=; b=GC56FbsiToye44FrO0GIb5WfMLgTCdy3s7I5sI/evtpT
	NAqbRupYFXo8iExb8gvHBy3BzP7azCQaBTJDA2Z0jB9SihASp4zjvdawxWSslz6s
	SRHPaJOWCLApGPucVpRVFuvO4CMkMhxTLDcH4P7I+ocIQcmOt2u+xXtZs+JzCeSZ
	G3OP1klC92/GKIq0Wo7R7/BAzJ+v9BMjifoEBtoZ0kSropgQu7sd/1gyQCBndLTq
	tnvHQLMOE+LUEO2YczPsGTNdkZETMUBlqpQX5VkelshZ8XqPvMJW3K1Ls+iqD5iF
	b43H1L+qU0YmRDleSLEW/EoIWCKKSukW/egwj/hRpA==
X-ME-Sender: <xms:zwqWaNdsj1bfGDAr40_gehE_So5zIK4NvXdbpe6YmifSeu4XCH9MSw>
    <xme:zwqWaLZ3V7Mv1W7dxPvLQlM68G7GNFXt0MdLvBgSWv3vP5LjFcVjR-lLOmbLZ8R3t
    hgUGmgo82HLIw>
X-ME-Received: <xmr:zwqWaIXFbUmRBLezuNAqCgt5GGnwmv42NouRveeU7jzj2IlhjOOWzdBbf7A3eut9ioDKB7GIEnxWsaE7Q2Na0sWlrCnpB3JLNEdjE9YVTLVJCZi4XEqG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdegtdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtre
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnhepjeeufefhleeikeegfedtgfeiueeghfduteejtefhfeevheff
    jefhieeggfejkeelnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedvpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:zwqWaFgVlTn7_mHWrCgi8LPKxTRBUXca2iqai7qiLhQb5OegYtpq2g>
    <xmx:zwqWaOURXxCgj1Jb7co6Pecn91yvR2E1RBkw-NfVQA7senGCDYIcoA>
    <xmx:zwqWaEMPP1PowLKaA3G0SWNt_mY2bq-eKC9G-Q7tZbKMoCQflMZAlA>
    <xmx:zwqWaCapJffV-7gxEauN9SWcqEJV4EBv8l793BSwvVE2r_IfGMu1vw>
    <xmx:0AqWaM6YEAm6Zkbk_DpWJr6AZOlqGT7lfspit-8_5s_FJLvrZAVYZiFb>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 0/3] Add driver domains test
Date: Fri,  8 Aug 2025 16:32:40 +0200
Message-ID: <cover.961bf2f7929562a899b182283446598d4c055149.1754663560.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is intended to detect issues like recent xl devd crash in domU.

Pipeline:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1974548454

I did checked that indeed it fails with the fix reverted - that's why the
second patch - Alpine version did not detected that regression.

Requires debian in test-artifacts repo - patch sent separately.

Marek Marczykowski-Górecki (3):
  CI: Add driver domains tests
  CI: Add configure --enable-systemd for full build
  CI: Run driver domains test on Debian too

 automation/build/debian/12-x86_64.dockerfile    |   1 +-
 automation/gitlab-ci/test.yaml                  |  27 +++-
 automation/scripts/build                        |   3 +-
 automation/scripts/qemu-driverdomains-x86_64.sh | 144 +++++++++++++++++-
 4 files changed, 175 insertions(+)
 create mode 100755 automation/scripts/qemu-driverdomains-x86_64.sh

base-commit: dbcbbed4e9dc25faa211d359c2f04a9c70f087c9
-- 
git-series 0.9.1

