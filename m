Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 183BA93989F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 05:25:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762545.1172704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW68o-0005hc-6a; Tue, 23 Jul 2024 03:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762545.1172704; Tue, 23 Jul 2024 03:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW68o-0005fG-3R; Tue, 23 Jul 2024 03:24:42 +0000
Received: by outflank-mailman (input) for mailman id 762545;
 Tue, 23 Jul 2024 03:24:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xgPy=OX=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sW68m-0005f5-VH
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 03:24:41 +0000
Received: from fhigh6-smtp.messagingengine.com
 (fhigh6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 166c0d28-48a3-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 05:24:37 +0200 (CEST)
Received: from compute8.internal (compute8.nyi.internal [10.202.2.227])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id BCB6811400E6;
 Mon, 22 Jul 2024 23:24:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute8.internal (MEProxy); Mon, 22 Jul 2024 23:24:35 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Jul 2024 23:24:34 -0400 (EDT)
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
X-Inumbo-ID: 166c0d28-48a3-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1721705075; x=1721791475; bh=INhlBJjaWcSgUwT5Iirh60xvA7D1cZQV
	W0chq3FhXaQ=; b=EdnGyk8HQM4FceDGrtPEQ0l/G/iULxe4semxNU5O705EOrPC
	6YgPuPGyk3yJ0Y7UPJOCz1b/hdQv9cypfykZXIY0dQvH28mydXsTHa7K0fUEk6Uq
	7N0vtAkhyLCdpBJXDrEyp5gRfBPV4VDbVDKEmXlfxlJM3PpIS+frZano68R6be5R
	wwOj8RiW5aY+vSWrgCDcueSv4TXtbNcnlMdgCOeGVwcxFuSJa9YwRprhWuTf136G
	Vgbe0Et2w5+j6htesfukW70hQXRzQekNNWKQ6WRaaBXP+Y5Sn5sd0VMIh7jQUM+I
	Cxhb0naN+BlGwJ6tPbqOw3yrLFsGx3JULjeivg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1721705075; x=1721791475; bh=INhlBJjaWcSgU
	wT5Iirh60xvA7D1cZQVW0chq3FhXaQ=; b=TTG8UJ/YpXchcMU5EudamVF+pvzsc
	ASywEuQHwAsRRUjlz0hLoIk14jzQMVvMtgV4m4GTSn6+CygJD5qaRsamGrW/QcDW
	JAOpewILWAhhCT31OcnxrrQ+qQPPGNi40gFUJl5yZfJ48J4aJwuJNnd+NY3hYN6B
	LnI/DX8+5j5s81TCpOO3K+0iLcR/SwcjkJApc649HLv/6vI+m/0fHSOkRKSy/+8w
	xZ/JfKBHTNyTcSUUnt4BK41O703xlKHj+asYm1kC57eoL1lwPt6YUckf0RhBMhK5
	BefUdKfefX5xl1IJLWrnXW3QfKYDemoJZDk1fleSpcc3vrFgPNmiDd2zQ==
X-ME-Sender: <xms:cyKfZq3arfkt_kB_t0SWbAI3tGqh11edQAoFhj8Ft3KAaJuLMbDC3w>
    <xme:cyKfZtGl72ZUMKUYX7qohh3bz6Rd9a55ZeQDn7wkH-QQ2oylxksdrD98GNhWkv3WF
    0AkQbGjkAJeRQ>
X-ME-Received: <xmr:cyKfZi64DzW9YtG9hL_sLeWTJucE67_BwRtth1WufYTVk3zdEnrWgtq1i8jI_f2-B9UlZi30znkFxlo9CpKNgaEw8JHq_3xf1M3HX2vG-59LQsmf8FU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheekgdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofggtgfgsehtkeertd
    ertdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghk
    ihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqe
    enucggtffrrghtthgvrhhnpeelkefhudelteelleelteetveeffeetffekteetjeehlefg
    geekleeghefhtdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgt
    ohhmpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:cyKfZr0rdqrDXH-DV9IGWTx6kmpoFb4SmqOMMlCKGmOTHFvdBx-rZA>
    <xmx:cyKfZtExHDQoaHGMsCrfwY-Oogfk8PTo4cGri92gI5sr490AtVI0yg>
    <xmx:cyKfZk-YVTCLqFXgKQ0oTwwoKUCSz9yuJS6BkYXyqAIeHI3JAD89Ww>
    <xmx:cyKfZillutgber7P_lj9pToBVhTwN843FJuN0gQmzJrRjDO0VQqFlg>
    <xmx:cyKfZrMRDi8EzQkKrk11rdt3yktRdle0ZQ4DOjGBj0bFvOVE7UEjGq_N>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v6 0/3] Add API for making parts of a MMIO page R/O and use it in XHCI console
Date: Tue, 23 Jul 2024 05:24:11 +0200
Message-ID: <cover.66bd16d0134f9664ea3e0f4d56f7c127afc308c8.1721704980.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On older systems, XHCI xcap had a layout that no other (interesting) registers
were placed on the same page as the debug capability, so Linux was fine with
making the whole page R/O. But at least on Tiger Lake and Alder Lake, Linux
needs to write to some other registers on the same page too.

Add a generic API for making just parts of an MMIO page R/O and use it to fix
USB3 console with share=yes or share=hwdom options. More details in commit
messages.

Marek Marczykowski-Górecki (3):
  xen/list: add LIST_HEAD_RO_AFTER_INIT
  x86/mm: add API for marking only part of a MMIO page read only
  drivers/char: Use sub-page ro API to make just xhci dbc cap RO

 xen/arch/x86/hvm/emulate.c      |   2 +-
 xen/arch/x86/hvm/hvm.c          |   4 +-
 xen/arch/x86/include/asm/mm.h   |  23 +++-
 xen/arch/x86/mm.c               | 265 +++++++++++++++++++++++++++++++++-
 xen/arch/x86/pv/ro-page-fault.c |   6 +-
 xen/drivers/char/xhci-dbc.c     |  36 ++--
 xen/include/xen/list.h          |   3 +-
 7 files changed, 320 insertions(+), 19 deletions(-)

base-commit: a99f25f7ac60544e9af4b3b516d7566ba8841cc4
-- 
git-series 0.9.1

