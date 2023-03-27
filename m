Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8526CA0E9
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 12:10:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515116.797676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgjnH-00053Z-Vs; Mon, 27 Mar 2023 10:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515116.797676; Mon, 27 Mar 2023 10:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgjnH-000512-Sz; Mon, 27 Mar 2023 10:09:39 +0000
Received: by outflank-mailman (input) for mailman id 515116;
 Mon, 27 Mar 2023 10:09:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jSZI=7T=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pgjnG-00050r-5j
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 10:09:38 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 792e3073-cc87-11ed-85db-49a42c6b2330;
 Mon, 27 Mar 2023 12:09:36 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1CEC65C0115;
 Mon, 27 Mar 2023 06:09:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 27 Mar 2023 06:09:34 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Mar 2023 06:09:33 -0400 (EDT)
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
X-Inumbo-ID: 792e3073-cc87-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1679911774; x=1679998174; bh=i2KoAdD9DY5Zol0CwbwIgutC0
	7FZ/Fg8VpoElu80es0=; b=mBu7ULvF5PW4izdS2uBLypZZYYeqsZdjEE5a89gWT
	tPb0mjVXd0mGTL+xTr1uACNes9M2QZiMxLZM6V7AMnUAZkYh0JM7/5cg5Aa/rB1X
	nYsWNXo242+9Rjw6EGj25R7OMdlqvGJ1FBqoED+3pQZnJejdJs8NjCiUWgL3u2fa
	Nr3Hdg6CT655LyFj/jDFJJo9lRIpjy0x7GLMe/NR6ijuaLsvfahaNxv/vh+X5FuE
	V+VJmneGF8VMlF6kbTUEDnrZxKtFImZKopC2+pSO74LHfD7j7qV2giGr2NlN2cjT
	zCxTc2lrqg/Yo8esJxLUVYhXEuvYNH6ekqgZ2bZ4rHm7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1679911774; x=1679998174; bh=i
	2KoAdD9DY5Zol0CwbwIgutC07FZ/Fg8VpoElu80es0=; b=Tn7LpbV3tj0eQuudU
	s4vu9akC4u2Zf0J+8g+4ozqn4GHf6xjzRhrKtqo6FoqjS5nx9E1YScMSI7vy3fyu
	Y5Q6jsXEhpt8BZamXXp1bYHvxj4F8MfVIRbuvN1GgHaoA8mdR53vITMIeBeXIf3/
	TjoLEutq5wfyKNI6Q3r6z0VPJxK/RmxU7EoX11Plcm2E/sCUI42FXwnazTV8o0fi
	/0IpqkybRW1QQM1vogp/lnZG0kcvNvNQ9TAQtsEhLNTqFi920Fb5Vck43oFXWBVQ
	VM1nU6+saDUR6I28qry2voZUoMX4Ih/31jNchYRArm15R+nqWBYdoWH+lwp2aAC4
	VsQLw==
X-ME-Sender: <xms:XWshZAcdzVL-fuier1R4RqUKbrCWPNiIyhrFvVwvCaTvGi_MbDXOLg>
    <xme:XWshZCPC06XKrMoSgsp62JrujX-fMgaPOL2bhjK_Nw_sWynBC48qy5aVL6i1FUnzm
    U_y31czY6o7aA>
X-ME-Received: <xmr:XWshZBhzOSX-b64PNGnuScklPK8mzlm2ezBZGP7EKcP_WFGgMKgFx8_ywV9iv-JQug7G68h5W9CxIodN3OFQjnB6NbQVgDLVWmTHsLqGwpDACGGdFdQe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehvddgvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffogggtgfesthekre
    dtredtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggt
    khhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhepleekhfduleetleelleetteevfeefteffkeetteejheel
    gfegkeelgeehhfdthedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdr
    tghomh
X-ME-Proxy: <xmx:XWshZF_94KWbVoBs8rLmmxO4E5uKftYuX3Oddu71vn_O3rNTY1ZcPA>
    <xmx:XWshZMv_RvYzGt5HQhM89SMpD8zPgnidIVNykX0qk0wPOcGfr7v-bg>
    <xmx:XWshZMHnFQAVjLst0jqNGA9MQgyaPxfI36qXEiwQjXGYZlUyWoA3Pg>
    <xmx:XmshZF72siEGOG62eq6ROmKbI4k7hX-rW0-YvsZmKaf920cuM9Hw8w>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 0/2] Add API for making parts of a MMIO page R/O and use it in XHCI console
Date: Mon, 27 Mar 2023 12:09:14 +0200
Message-Id: <cover.0fffd3f3080b5eeb8d22126eda6088734bb0c926.1679911575.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
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

Marek Marczykowski-Górecki (2):
  x86/mm: add API for marking only part of a MMIO page read only
  drivers/char: Use sub-page ro API to make just xhci dbc cap RO

 xen/arch/x86/hvm/emulate.c      |   2 +-
 xen/arch/x86/hvm/hvm.c          |   3 +-
 xen/arch/x86/include/asm/mm.h   |  22 ++++-
 xen/arch/x86/mm.c               | 181 +++++++++++++++++++++++++++++++++-
 xen/arch/x86/pv/ro-page-fault.c |   1 +-
 xen/drivers/char/xhci-dbc.c     |  38 ++++++-
 6 files changed, 243 insertions(+), 4 deletions(-)

base-commit: b1f11273d5a774cc88a3685c96c2e7cf6385e3b6
-- 
git-series 0.9.1

