Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D5CA77170
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 01:42:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933216.1335219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOlQ-0007Gj-Nf; Mon, 31 Mar 2025 23:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933216.1335219; Mon, 31 Mar 2025 23:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOlQ-0007EL-K7; Mon, 31 Mar 2025 23:41:56 +0000
Received: by outflank-mailman (input) for mailman id 933216;
 Mon, 31 Mar 2025 23:41:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qpMN=WS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tzOlO-0007E9-Tn
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 23:41:55 +0000
Received: from fout-b7-smtp.messagingengine.com
 (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7d53e00-0e89-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 01:41:52 +0200 (CEST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfout.stl.internal (Postfix) with ESMTP id F02E611400DD;
 Mon, 31 Mar 2025 19:41:49 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-08.internal (MEProxy); Mon, 31 Mar 2025 19:41:50 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Mar 2025 19:41:48 -0400 (EDT)
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
X-Inumbo-ID: b7d53e00-0e89-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1743464509; x=1743550909; bh=Vq0skPtc/7Zfqd0ocMyIzSaA5Qdeex4t
	/et4JtP4mmc=; b=hUtYJmxDrT2VgIOjlaZIP1t2sBW/E8TsSjDzZI5FbiZUBe9V
	VJVVVFioGRUqGaBGYQoDPwclo0YO2hUyqjeFpd+bEJ/z9L/cvdc6jq8olD6sKkTY
	hlA9icfLl+lq/L4x3nA0GSdoUYYgN2sdSVa3S/HzxEQCvF2v3UY1GJrjuodE6hIP
	Yp+jSFPgWwKCeD4x6Q9BK92YfGSrVN6FEQwc0yW7+oqIAQufzJel5abGJd4yOVCr
	K6sRIUQRmLyYzUF/HrP/vbH9aGh5fq1si4n/N+ngrPMClgL/o7807IPjaJh0csZV
	Viv1bqU/C7F0xxhFXcFNAEkEclnkoUSGZLvvhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1743464509; x=1743550909; bh=Vq0skPtc/7Zfqd0ocMyIzSaA5Qde
	ex4t/et4JtP4mmc=; b=banBgAyLK+XtzOpv0OCEbStKDKXoM5NAnk++tdD4hBP7
	7rfN1Txwe+66oSHpX35iD19xArVla4afwoxDvIe5Y5TaktoFgq+7RynfPyoZI5h2
	L7oAUJ8YjUSiMB/oO7U/Pwwq5JXEDS4jJLfbm01CcC3F5F0lD5d/6rNqpfp15RC+
	tYipFiFrmUU3ECNfYioUM3J0r9n1kRpEZi9qqv9/Mcg5k8QXnVrRC+tuO7+zdE2V
	15H2TsQMhPpTKnj8EfSYHlE+bvmqBzOxA5WdUtIOR+KF+KFj4TjfTScID7t0Cus2
	j8bKf1WY1uQMpHvGuTymiWWSEeDY2ZhmucfY7isWNA==
X-ME-Sender: <xms:PSjrZ-aMF4l7T1Q9prwvg7pIoETSS-hYwlawWtboymSTF4djUGYUZw>
    <xme:PSjrZxa-myd1mH9ICEWwhvU4Ryor8CBLPjbjYwndgsQaLHXkK3kp1zXViUNGBNA7K
    lb5V-mw3HGOqw>
X-ME-Received: <xmr:PSjrZ48LwBHmb6fB4uaF1gmWDLe7IZB6OTBC4UZPOufk6KU8VxfzyK-SAtUbd6RN8A7Tdd-8nPALHmA4KXs4enJQ-Mi02rSOHg8I5RnBo4VkGBEDr7Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeduvdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvf
    evufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiih
    khhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvth
    hhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleekhfduleetleelleet
    teevfeefteffkeetteejheelgfegkeelgeehhfdthedvnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgs
    lhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhho
    jhgvtghtrdhorhhgpdhrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsihgslhgvth
    hhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:PSjrZwrS3geBNpWe6hl8yB5cEhK_QriVX2JHVaNS52rKfJ_hcYt_2Q>
    <xmx:PSjrZ5ouEBQOtOGI0NTaYWSf82IJ4DofLQFnXzzGlZj64xEsPpczxA>
    <xmx:PSjrZ-TPoBegkw1delqkAzrIyXNq_e8MBfWuDaJSWOCE5kac5nD39w>
    <xmx:PSjrZ5rtDFt-tXixDLwd_FO77GHCibaY6UsV-pbpxGo-TLp0QQNBsA>
    <xmx:PSjrZw21FMKrXOrA8z35pa9yTrXBbZxJHBxmK0ZRQk7so0eVP3gPBgB->
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 0/2] CI: add another hw runner - KabyLake this time
Date: Tue,  1 Apr 2025 01:41:34 +0200
Message-ID: <cover.c37f01ae6ae3cbc9c0897f39de9037d7225d2c94.1743464494.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As usual, besides the patches, somebody need to click on "hal9003" runner in
the relevant projects.

Marek Marczykowski-Górecki (2):
  ci: create boot.ipxe for legacy boot
  ci: add Intel KabyLake HW runner

 automation/gitlab-ci/test.yaml     | 89 +++++++++++++++++++++++++++++++-
 automation/scripts/qubes-x86-64.sh |  8 +++-
 2 files changed, 97 insertions(+)

base-commit: debe8bf537ec2c69a4734393cd2b0c7f57f74c0c
-- 
git-series 0.9.1

