Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F827013E5
	for <lists+xen-devel@lfdr.de>; Sat, 13 May 2023 04:13:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534118.831373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxekz-0002Dy-FV; Sat, 13 May 2023 02:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534118.831373; Sat, 13 May 2023 02:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxekz-0002Ba-9x; Sat, 13 May 2023 02:13:13 +0000
Received: by outflank-mailman (input) for mailman id 534118;
 Sat, 13 May 2023 02:13:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cp9A=BC=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pxekx-0002BP-V9
 for xen-devel@lists.xenproject.org; Sat, 13 May 2023 02:13:11 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3f5d380-f133-11ed-8611-37d641c3527e;
 Sat, 13 May 2023 04:13:09 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 110ED5C0231;
 Fri, 12 May 2023 22:13:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 12 May 2023 22:13:08 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 May 2023 22:13:07 -0400 (EDT)
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
X-Inumbo-ID: b3f5d380-f133-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1683943988; x=1684030388; bh=p6TUSKPLj/zKTSgTeu3n1zyjI
	MOvCJeqWuFvF1tlZPA=; b=HxuCbmeQTT+p22bxT4bkEKecAUbpufbCttwOYBcXc
	3Mv8GFFe6U9bR+MxklkxWRxHz4P3Fsfck6s0tN+B8YIjOwh5KZknoEL+uEF20+80
	wB0IaSJnMyJTfk4i9j3AtCqQ9uaIxHZGrzs/q/G4HDZJquj/nJqgrhQDWTl9QH5h
	E/eN9x24ZjBskQo+fyi1TYFlahSNimF2JhYcKP0xeshjte5lKq4zlJe8FVfTJP3V
	vcVYk2HzvHaKnX6XLB70swOmz741PiRXPcF765q2eW3s6JGBbQcDMRnXTmAJQM+v
	9S/ffjRBQJ0hfKeHxz6/ftg9ETrLc/c5nPLsx7e5QyWCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1683943988; x=1684030388; bh=p
	6TUSKPLj/zKTSgTeu3n1zyjIMOvCJeqWuFvF1tlZPA=; b=WahvPY47yyVVU8PwX
	CmgcwNhtWHPky79+k3Adm4DcU9xL0+BQY15lUrNwuCb2O26tsbPHf0tSQwp09b9d
	laRXPXKV45OsPF1CCJeOuJ/IAtoGesfxl686FsDki0Y8tgWFJVgSpKJK1XP6vbvq
	8+pDGLrWtgfKxgruuazG8MbN8mbLQbGA/FYcnVZ4qW7gW/hPvxdOwhcwNiunuJNr
	1g24K4FvbE4wu6ia8+qQpHxAgjtw2pT2ElojF6eGzJJ1U8zQEUDDlPnY3MBFgGN9
	pPO6iuK33l7U6U3DsX7REbWU+UMaMulnby2yOxhQy2eZWq4tc7bzOGe36z/tw1E5
	wrcIw==
X-ME-Sender: <xms:M_JeZKHJ_Q2UbLf3CZ19Rl6W-xmdEiLn6qm_3xctM1p0tHUHLdpHGA>
    <xme:M_JeZLWbl75kuJoFi3Z8wY6jJvaG8H3FKG2rONOajCh_SGVJgqywMCsBZxogTd6OU
    r6Ljh-F1Njniw>
X-ME-Received: <xmr:M_JeZEJCrtQNbGgWieW4BhJcHjPteBBBYELQEkfFg24e4XnlUmvKMj6ARMt81Bomz6qVu1_1ruQ64MGelRxzkOnCoiEcCMlFjMkkGsHTfg99zuavHUMa>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehuddgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffogggtgfesthekre
    dtredtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggt
    khhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhepleekhfduleetleelleetteevfeefteffkeetteejheel
    gfegkeelgeehhfdthedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdr
    tghomh
X-ME-Proxy: <xmx:M_JeZEHudLP6Aga0j4jNj_edwO8sNEQc3pfiNOSQ7F-QdqJ7C7OdzQ>
    <xmx:M_JeZAWcB7Vh1d8nsWUJ8EEJLQ4cDXrqsuuQQyG-LWeztkbKD2sfTg>
    <xmx:M_JeZHOI7JXClRICaNjQhZoX17w5_T3XLctnp7dP-VjnCCjay7QApw>
    <xmx:NPJeZDCwLRfP65DRexwtbL3vJRigX_aGrj-KW0SpDh-J3vcXoqCYfg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 0/4] automation: add AMD hw runner
Date: Sat, 13 May 2023 04:12:43 +0200
Message-Id: <cover.83768735557180cd65fb5f932c285271063e04ac.1683943670.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds another hardware runner to the CI.
See individual patch descriptions for details.

Marek Marczykowski-Górecki (4):
  automation: make console options configurable via variables
  automation: enable earlyprintk=xen for both dom0 and domU in hw tests
  automation: add x86_64 tests on a AMD Zen3+ runner
  automation: add PV passthrough tests on a AMD Zen3+ runner

 automation/gitlab-ci/test.yaml     | 36 +++++++++++++++++++++++++++++++-
 automation/scripts/qubes-x86-64.sh | 10 ++++-----
 2 files changed, 41 insertions(+), 5 deletions(-)

base-commit: 31c65549746179e16cf3f82b694b4b1e0b7545ca
-- 
git-series 0.9.1

