Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB98993727B
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2024 04:34:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760834.1170774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUdRn-0001vz-Dp; Fri, 19 Jul 2024 02:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760834.1170774; Fri, 19 Jul 2024 02:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUdRn-0001tH-BA; Fri, 19 Jul 2024 02:34:15 +0000
Received: by outflank-mailman (input) for mailman id 760834;
 Fri, 19 Jul 2024 02:34:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a+sj=OT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sUdRl-0001tA-Sj
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2024 02:34:14 +0000
Received: from fhigh2-smtp.messagingengine.com
 (fhigh2-smtp.messagingengine.com [103.168.172.153])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 606111b3-4577-11ef-8776-851b0ebba9a2;
 Fri, 19 Jul 2024 04:34:10 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 99EDB1140265;
 Thu, 18 Jul 2024 22:34:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 18 Jul 2024 22:34:08 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Jul 2024 22:34:06 -0400 (EDT)
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
X-Inumbo-ID: 606111b3-4577-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1721356448; x=1721442848; bh=Y5XHPfGuIrp7S1hbzvj1pjkbqkEQEhy0
	VNxti2mSbZ0=; b=HQ5CmzcrT25rF3oIBlv6FqWOREZz8si0J39M0vyG7mghtXF3
	KWCs5l1pK+AwZVTusuN1Opi0j5NDO+CNtcVgeR71hL8ZfKlkpwVZQMp+250xlpPC
	I+VFyQfk1VqVj9UkRGfxu0LBbdfCmOWT/C/U/bjEVM5X18Das7SM8rGhmTkpHGfS
	nwDabjxrpIMBx/Oc9MY9fohO33/6dZr4eez/7boCeHdkgS/hZpQCI7z1y27PjA3z
	N9O0a3HwRw1I2FosMaxwr7xR7WKOK6vuoJ4MijUMwKe43+bsCPlg1z3Ay56uol12
	BXhITpUBeJ0KqqUm3QZr78v34DgQSMt35+x36w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1721356448; x=1721442848; bh=Y5XHPfGuIrp7S
	1hbzvj1pjkbqkEQEhy0VNxti2mSbZ0=; b=cco4x5wJiml+BcVkpF5bdYiEvl4VD
	EmGA3Wix90QdCOOlRnrWm0iCO+jsvE2t2j3ac1p58pxxwRU2aDfcHOYuUjKrM7u5
	gWLd0SZi313fYqyP1sXMBrnfG1cua9intAkiVLyh2rhjNSQJbr+lsCMAbO74Ptwq
	pQi8rBogURWcsduMO9FGcZy2mgmBlOPavT+Em43AThCJfzaFTWVT6Gl25GjTDz8w
	C5oxH9ruBNMJYDrfrxAIg16bw75GQv98DTbQTCNFc45SLugVNwsuQdL2yqQ8E6e4
	nY99R0p3XBxkW3wrO66ARnkjJrisys8jcjodVnaD8Jl5sJdRSF9wAJP5Q==
X-ME-Sender: <xms:n9CZZk6rA_SoD_zmCOXqmwURjplC4GvPN8UwK5U17115gwSHqCQjjw>
    <xme:n9CZZl4gVgmCMB5d2TaGXYNpxNbEtWEqFI0KFDlw1GBX8a_5xFnSOBXhyCtzTXTAY
    ObZ_x4yoZ-_dA>
X-ME-Received: <xmr:n9CZZjeUyKwneUy6ynxn6DH6--qc0_J5HHkHmiKp-9t09TUU0Se-u6k67CcjePbDp5tduQkWx8W_CYHntnW58UgHh-gV6kMrOVgeoD_T5YZEgytYHUU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrhedtgdeitdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofggtgfgsehtkeertd
    ertdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghk
    ihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqe
    enucggtffrrghtthgvrhhnpeelkefhudelteelleelteetveeffeetffekteetjeehlefg
    geekleeghefhtdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgt
    ohhm
X-ME-Proxy: <xmx:n9CZZpLxJ2C-G7vbKU09CSvON6w6dx3oOt_wx2DgpWT9GaxE8dL3eg>
    <xmx:n9CZZoLL5l4sn9ziNv-m_cMOpP-NJ_4Ta-djeA1m8CfElD9LhUr4KQ>
    <xmx:n9CZZqwO2pudgFCFRNi7PPTGoBBqivpiP4gjJyYwyobe2WCSac2vkg>
    <xmx:n9CZZsJYNGYvfyBhwEVaDQy_fc5dTOp9ODJUeKKIsoTqdU-oIYT12g>
    <xmx:oNCZZijdoOcn-UQtzb16My4zvTydC_-vG_Ieye8Q3mWP4Z9s5QPK8jSa>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v5 0/3] Add API for making parts of a MMIO page R/O and use it in XHCI console
Date: Fri, 19 Jul 2024 04:33:35 +0200
Message-ID: <cover.8c9972382c46fce22682bcec2ee28fe2501dd18f.1721356393.git-series.marmarek@invisiblethingslab.com>
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
 xen/arch/x86/mm.c               | 262 +++++++++++++++++++++++++++++++++-
 xen/arch/x86/pv/ro-page-fault.c |   6 +-
 xen/drivers/char/xhci-dbc.c     |  36 +++--
 xen/include/xen/list.h          |   3 +-
 7 files changed, 317 insertions(+), 19 deletions(-)

base-commit: a99f25f7ac60544e9af4b3b516d7566ba8841cc4
-- 
git-series 0.9.1

