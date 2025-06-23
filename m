Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14940AE454C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 15:50:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022410.1398227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThZL-0000Nl-AI; Mon, 23 Jun 2025 13:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022410.1398227; Mon, 23 Jun 2025 13:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThZL-0000Lw-6D; Mon, 23 Jun 2025 13:50:43 +0000
Received: by outflank-mailman (input) for mailman id 1022410;
 Mon, 23 Jun 2025 13:50:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TVau=ZG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uThWM-0004sG-AW
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 13:47:38 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f70dfc4-5038-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 15:47:37 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id 089EF138082B;
 Mon, 23 Jun 2025 09:47:37 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Mon, 23 Jun 2025 09:47:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 09:47:36 -0400 (EDT)
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
X-Inumbo-ID: 9f70dfc4-5038-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1750686457; x=1750772857; bh=pEfttlFJVn71WFrJPgQWz5RphtFBKEVS
	T45Ebzr0+cQ=; b=hZfRdJlmPDt5b5tAlam2Ar0IseeMTCmgK6I6lb/geXg9JukE
	WFLul8xt3APjFQEhwUDBckZtlk7o9Ey6v7tYdkTrY0WepCxF1WyNqZSHASmvmGSf
	6wSbD4UF76Yc4VQQiMBq+XROALZsOOrDlUHPzwhIwsK4LvRxp6ztg5JiW58+BL8B
	sKiHk5NNVlTRMW3dGxQe+OBRfmrZK4libcwPGWor5YnGPHS/9t5LNynswOOpTLi4
	FQhS9+gG7LCP3Jorkw0XMksgOTpC3zi4rDdHxCkBJWvKBdqPnl5TUoMtMcJc0F2X
	VQgGVmu8LMwbmaq4brDpYec6kdr129SYfXPqvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1750686457; x=1750772857; bh=pEfttlFJVn71WFrJPgQWz5RphtFB
	KEVST45Ebzr0+cQ=; b=p6SU85ERBH4KCXKZ9GI0AXVqO480wUD71wgeQYoW83da
	cc112e45ywzgwAxfEEk/6zAGXJsnVt2x97Zm3liJdm81hXK0rmz+NgADlTjHFCQG
	qVawFkXPvd/Mx1kPijHA1T0NLZ0v+iud49RBZGYIccPHh4EQwVNLf+fp17RFZfrd
	uvSQcpgN5a8HqFw29ACn18oE2EPHVzN3LlHM+hOPrdN1eWut1Psg8SjI2WgfmCjy
	GHK/cU3+tsEfHcOulfYx1uBKJsuFU6EueZEvnhl1cuzJMCeb/xjNti8CDsIA7Lss
	4Az4e7+gVF3WTYTFrQsXaXnT+NvtSCFW6xkMbUT/hA==
X-ME-Sender: <xms:-FpZaKKW2WNcG2jHMUs0uu-qE12Ex9jZ7ZlAIIN_j6BBPbS-nckL_Q>
    <xme:-FpZaCLLSKIHP5SURfQ07u23cP2z8Usy8SixkbIHVnDtMfWzGWsJnePeeovFAba-5
    Y19AVUhMsdv0Q>
X-ME-Received: <xmr:-FpZaKthNzauFepx_fKKRmIwLJL_MLm1-oZGzZk9NJ0KIBQdj2RZmcjAWDvPCAwCNanl0QvE6gJAwnE2e2MoeBbWN9q_0gPv7009RHA3nMQ2qTUC6Z7b>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujedukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofggtgfgsehtkeertdertd
    ejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcu
    oehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeejueefhfelieekgeeftdfgieeugefhudetjeethfefveehffej
    hfeigefgjeekleenucffohhmrghinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepvddpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigv
    nhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:-FpZaPaj22-6LBixITWZy4lWxwT2PCMOeotQve5ZcAyt1z4KcGZc3Q>
    <xmx:-FpZaBaY36wpymrueFjMVFFYtxIBdPZzIWELcyGexdi-YmMYm5Z9Yg>
    <xmx:-FpZaLAhBkc7wwyIZIqTqlrEaNcJb9DS6OXSOcSbPpfmFtTT_0xx0g>
    <xmx:-FpZaHYJvuD6-4G05gJ4ATzQizi-lLPaRh2a1WMJFBNfZiBG6NYEXw>
    <xmx:-VpZaOaL_728ZkAE0vUGWNYpF2-kQsDi1Wv7-gWi_sfmfVYSfMkAlSRu>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v1 0/6] Add infrastructure for testing arbitrary Linux branch, and one more runner
Date: Mon, 23 Jun 2025 15:47:09 +0200
Message-ID: <cover.16ccd290bf95e314a4f23777f5564b3aa2417e57.1750686195.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series implements testing arbitrary Linux branch, based on pipeline
variables. The idea is to setup schedule running a pipeline for few selected
branches (some of the Linux stable branches? linux-next? Linus's master
branch?) The SELECTED_JOBS_ONLY variable can be used to exclude most of the
build jobs in those pipelines.

This series is combined with adding hw12 runner, as it needs a newer kernel
anyway, so putting it together avoids merge conflict. There are also few minor
CI improvements collected along the way.

Pipeline:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1882799125

Marek Marczykowski-Górecki (6):
  CI: Switch x86 tests to 6.12.34 kernel
  CI: add AMD Zen 4 HW runner
  CI: upload tests-junit.xml as a normal artifact too
  CI: make test-artifacts branch/job customizable
  CI: use Alpine's network setup
  [DO NOT MERGE] CI: example how to use ssh to extract logs

 .gitlab-ci.yml                     |  9 ++++-
 automation/gitlab-ci/test.yaml     | 65 +++++++++++++++++++++++++++++--
 automation/scripts/qubes-x86-64.sh | 22 +++++-----
 3 files changed, 81 insertions(+), 15 deletions(-)

base-commit: cc7394164633e75fb61d52565f75271e0b7f1236
-- 
git-series 0.9.1

