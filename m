Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B64B1CFB6
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 02:09:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072315.1435498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujoBc-0002j6-0H; Thu, 07 Aug 2025 00:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072315.1435498; Thu, 07 Aug 2025 00:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujoBb-0002fg-RJ; Thu, 07 Aug 2025 00:08:47 +0000
Received: by outflank-mailman (input) for mailman id 1072315;
 Thu, 07 Aug 2025 00:08:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=llzQ=2T=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ujoBa-0002cl-HC
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 00:08:46 +0000
Received: from fout-b2-smtp.messagingengine.com
 (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad9a2a68-7322-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 02:08:44 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id 468781D005C3;
 Wed,  6 Aug 2025 20:08:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Wed, 06 Aug 2025 20:08:42 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Aug 2025 20:08:41 -0400 (EDT)
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
X-Inumbo-ID: ad9a2a68-7322-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1754525322; x=1754611722; bh=w6Wjtxqx13pNBXf8gadiuGtlHzY+/T03
	bKCrQfTPJRw=; b=CpKyNcdnrzIUxezASvnMa+Kz908xRP6bxCaB7wdOfwexWFd9
	g6V4fma3Z615QSl1F2XghoM9hjgDFxcYQzuhZt/8V7vuzyvVgGWDk7lWA6SYUMCB
	Lh7bhp1avG0o/Nqc/njpMFthAs9MxJ5Juep8jERg3zJcBUf75TnAzFwTy8HGi+m4
	DKOHls43JdwzLKgkIt/lNuvtC6gF6ZeLtz4A9Cgw1QEEVHIIhk82Uv2e2Xjx13W1
	hXl0y8o2darhOIFmg2SKDSsosCGmsrybKYgFbcSGe+ZozRcfwk+51zECeGIUx4EE
	PczMpmuSxcxebslQjMwMteeFQhP//dcAIGkF1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1754525322; x=1754611722; bh=w6Wjtxqx13pNBXf8gadiuGtlHzY+
	/T03bKCrQfTPJRw=; b=Ror6XYJTGxKTFWP9xoXyLtMUQKL1xjDgGOsi3czqWaGc
	iGlmUR0SUxtR70gnWTPFcHlZliTvpmU1FDjl9NwiUJvNLHW4LG9r3TNKbBERAwGM
	RbgNRO/2tJ9ke4rztXbfBxknW3m3Hb/FHtCRBcT0h83+7i3v5bRxT+25qk//ILh7
	8qyJyjyru3dtilSo6mTqMco/s5zps4mst4gItV2DtmIHLPZKJTwMuk2ZXhvi6eJj
	djxfTEVqIpUtzhW1Na4LPnhGmVccz8yDr7Nb3+dQs5VUblGNYAmwXLO7thYHb0qF
	CrR+ChYIZdzetif25ux9vTiYteuFSKiGospIpzM3og==
X-ME-Sender: <xms:ie6TaKKu3Z3xjNbZBUE8gGNCrZmO7QTndFdxNZIiGQ-2mxIGrGrr4A>
    <xme:ie6TaCXd6Q8TK5Me00VhMr9j9vTQ__reyczVUcQSKn9GRz1KMltkOMcu96R0l7Qkg
    8oxQUiSpBGR1A>
X-ME-Received: <xmr:ie6TaMivOP-yeQhQDQkltRug6dPBzBEOqO2Ln12nwi0hIZogSIbTZHGWsYK6WNYsZ20HirX1ZQ88rLTuysiD-W9uobMe2i8Z11oOiNMhYo9IqdnZ-pjh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudelgeehucetufdoteggodetrf
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
X-ME-Proxy: <xmx:ie6TaN8FN_8sZEcSKPMR4dhPhBfXQci7V9LCN-3CtHa2D2HcONkPSA>
    <xmx:ie6TaGDF34K4dq3Lk55pqUEIaFy06aMDP0KU2_st4X2ZYa8EyJYeRw>
    <xmx:ie6TaKL8r9S7Fs3RlJsW_np0XAH2TN8_NoQia3LYHiNR-AdbafpJDg>
    <xmx:ie6TaJkUEr8uxvDO4eUL1soHV_9xYzEDGc_vfr5fodpvzxPgXyEClQ>
    <xmx:iu6TaInaaHAXmi1KBX5sSBOhVVqs0JgcJwma22KfpyN8HxdKZT510WO_>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v1 0/2] Add driver domains test
Date: Thu,  7 Aug 2025 02:06:48 +0200
Message-ID: <cover.a3ae44ad160fb5827451cd35aa8ebbd546cf3866.1754525202.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is intended to detect issues like recent xl devd crash in domU.

Pipeline:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1970971528

I did checked that indeed it fails with the fix reverted - that's why the
second patch - Alpine version did not detected that regression.

Requires debian in test-artifacts repo - patch sent separately.

Marek Marczykowski-Górecki (2):
  CI: Add driver domains tests
  CI: Run driver domains test on Debian too

 automation/gitlab-ci/test.yaml                  |  27 ++++-
 automation/scripts/qemu-driverdomains-x86_64.sh | 116 +++++++++++++++++-
 2 files changed, 143 insertions(+)
 create mode 100755 automation/scripts/qemu-driverdomains-x86_64.sh

base-commit: dbcbbed4e9dc25faa211d359c2f04a9c70f087c9
-- 
git-series 0.9.1

