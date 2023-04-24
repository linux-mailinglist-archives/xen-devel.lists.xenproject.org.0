Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F406ED669
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 22:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525616.816891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr3FV-0004Q8-0u; Mon, 24 Apr 2023 20:57:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525616.816891; Mon, 24 Apr 2023 20:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr3FU-0004Na-Ty; Mon, 24 Apr 2023 20:57:24 +0000
Received: by outflank-mailman (input) for mailman id 525616;
 Mon, 24 Apr 2023 20:57:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HiTc=AP=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pr3FT-0004NP-Uw
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 20:57:24 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99f3bb4c-e2e2-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 22:57:20 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 97FC73200805;
 Mon, 24 Apr 2023 16:57:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 24 Apr 2023 16:57:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Apr 2023 16:57:16 -0400 (EDT)
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
X-Inumbo-ID: 99f3bb4c-e2e2-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1682369837; x=1682456237; bh=qOLMsKsB/I/dH81OemoGa+Oq6
	UzSRPHuTT1HinFCzNk=; b=AkRUi/6RJ+kZ54ePAqMKqpPSgLVfkIl54ky53h54N
	5c6nb+vixtH1NhQMSxprlcV8PfYZvieFnPYyaR0MtFg+a7pRBRH3E70kRWKtQ0y1
	9p0y2CY5uCe2iwQ+Kq1idUMGUsFCO/ZDnt7/DGdjY4A+68QcPf+uFuJpV+OKmx09
	mdvxUAfRH8H5LZedFnoCa/qbDy3cu1TsYjrmxorQ1Y8H0oAu5PIlXaFYtHmOel3S
	ITD9Zy6beWQYAKlGTvXDQLfxV78voRI5vvHegIEtgH1zER/NcUCUuemwnw+tWowP
	H5IqglQyLtgORuOzjjJKLlztetcKfGxv++UbCIM10fyOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1682369837; x=1682456237; bh=q
	OLMsKsB/I/dH81OemoGa+Oq6UzSRPHuTT1HinFCzNk=; b=IoSAemiYrAx+KqS2d
	GjdEX9jqW2neSsdpC0RvrNHh68qqwhG02vzhDiMll12geoLbGZJpN2klz8oflYxB
	OzfaTMo7k+ANAzJgokJwXJSL4q6Y+A6Mc3FWVjId+mfQWnyINY7DLE7oQbDkXR5Z
	x7d2ENO+u0uI1KVCss7AZchshXIzNuQnmtM/SWq079e/BxfptNbJSuMZcCsqa1Q3
	6MdJLKhz3s7cIBiB/dA6t9qGGbOGOwgVThssZ8ozpOJ4xWy2y0PSQjcsRd2n1eFw
	flUV9LpMenmnjyZLMsSV8YPZnT+CeeZ/5Nfzq7LS5G3Wj2PRyJ+5PSVNqU8mHnH8
	gwa7Q==
X-ME-Sender: <xms:Le1GZAdKZrHGAz1HMdPeKY6ym1OKMtKC2JEczkGJvr6UO9ekBVGexA>
    <xme:Le1GZCPreQd_n1pKl8rwZA_iKnKJ-Y7Lo7BKfn76dc2whwsOLUevIxWl2eKGqdkeS
    8nxAgjuMG4RLg>
X-ME-Received: <xmr:Le1GZBjozs0Ll6JD6QRlNnNIJW8VFmKZx6f3KsmXO_pZaVoK_POBtkRFeUkIUjKoh-PzUR-dFPe1jTtdC9XM5rhGbxDNkLUxCO_kTOkpTYbjxngz3V0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedutddgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeeu
    fefhleeikeegfedtgfeiueeghfduteejtefhfeevheffjefhieeggfejkeelnecuffhomh
    grihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:Le1GZF_OoZAUvVsZ8dFGXtAiz12YHzK0vS7QvJahRPVtwouQVDfwrg>
    <xmx:Le1GZMv8JdIjsRd_7Taz1uwuGo_D0ERPrJfclmAas715J0kf_ySmTQ>
    <xmx:Le1GZMGgVTEVAMeewVMu82wl6RxcBs559D3ornmBEYVmqg1lb2DlIg>
    <xmx:Le1GZC3wl6XoQ507rQWA5CFVkXDzIEWF6dDFV4AwQUF3HWf_K3OqzQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 0/6] automation: add PCI passthrough tests on x86
Date: Mon, 24 Apr 2023 22:56:55 +0200
Message-Id: <cover.52ddd01da196853766a5b39a89c631f3e4652dd9.1682369736.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds passthrough tests using the ADL x86 hw gitlab runner. Some of
the patches are improves existing hw tests too.

Example passing run:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/846920786

Marek Marczykowski-Górecki (6):
  automation: specify explicit dom0 mem size for ADL tests
  automation: add runtime qemu dependencies to test container
  automation: re-enable building SeaBIOS in Alpine container
  automation: wait for the login prompt as test end marker
  automation: PCI passthrough tests on ADL hw
  automation: include tail of serial log in the gitlab outout

 automation/gitlab-ci/test.yaml                    | 20 ++++-
 automation/scripts/build                          |  2 +-
 automation/scripts/qubes-x86-64.sh                | 85 +++++++++++++---
 automation/tests-artifacts/alpine/3.12.dockerfile |  1 +-
 4 files changed, 93 insertions(+), 15 deletions(-)

base-commit: 18c128ba66e6308744850aca96dbffd18f91c29b
-- 
git-series 0.9.1

