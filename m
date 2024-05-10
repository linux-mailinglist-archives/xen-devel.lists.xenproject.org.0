Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB4B8C1D41
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 05:56:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719468.1122269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5HM5-0008Fx-5c; Fri, 10 May 2024 03:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719468.1122269; Fri, 10 May 2024 03:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5HM5-0008Dh-1b; Fri, 10 May 2024 03:55:33 +0000
Received: by outflank-mailman (input) for mailman id 719468;
 Fri, 10 May 2024 03:55:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XugN=MN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s5HM3-00077u-Ju
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 03:55:31 +0000
Received: from wfout3-smtp.messagingengine.com
 (wfout3-smtp.messagingengine.com [64.147.123.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 249be738-0e81-11ef-909c-e314d9c70b13;
 Fri, 10 May 2024 05:55:31 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.west.internal (Postfix) with ESMTP id 142351C001A1;
 Thu,  9 May 2024 23:55:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 09 May 2024 23:55:29 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 May 2024 23:55:26 -0400 (EDT)
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
X-Inumbo-ID: 249be738-0e81-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm3; t=1715313328; x=1715399728; bh=EAaNxhwX2Xjwv3rkR/3PC
	xXHxt3VIaaNGAHnw+G6qes=; b=Qp7ozR5kZrbKidnRDsTgV8GbjXNKxBB2IpDSq
	Z9fRzlWYWe+eWLTw5P+L6RRM6pj3P4kn2nqTKxfeYmTsnh5RzaNdDRB8j0ZSJgU7
	gyL6G2eB8JZevecWSI97v/XZeBTqtgmhukzEtPxWpPSR4FyzN+w6jVGz3DUQv+KS
	/nEdyUyZ3O015MTCv/eJkHnFyA+kYT/AsjWnKgguIy1ryJ7d0eJrT384jxQl1y2u
	/Nyf81h2PYKHr1ge0FruIflCBT6XVRNplZt+UFNDddZHEr+w5h11azBzgnBn3PQe
	1+/18U9xVysPRVW0W2tN13qDJn/5jBjdl9Capez6fzs/RChbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715313328; x=
	1715399728; bh=EAaNxhwX2Xjwv3rkR/3PCxXHxt3VIaaNGAHnw+G6qes=; b=h
	ofNBWsoWiALZp8ATMlJ+MUvf/A9O9oANXMI6bBH6B9uOOcFgYgAqAleEJr3QZG8i
	p6OHDKy3tUq9WnUnW3MHfQaiGg3ljQfphjEFF/lKb42Bnux/cw7CniSeBxXEk3pZ
	7uyFhzJGXLaN9We22Ij5TDjts5oqU16lOmmxl0U0vLFLYu7Ur/sgnIqHaAfJw3zx
	qfKz4FIZk6xaWjOGdv5vDLtPOlOd2iWrN8CI00PnNZJyj/9FJMdAphuGZ7bbbPHq
	cNg5MP2AkYQoNiBRrg6QOckV/Xq2bGqojol/Lu9TWRzCzbwJxRNOdWSqc/ELn+i8
	Zo9NwdHDM/roGaBEYcuPw==
X-ME-Sender: <xms:sJo9Zj733zRYvk3IIeIGiS1WnVj07tm4NLR9plP-B6ZRKuXm7sCfdA>
    <xme:sJo9Zo4VnLQLiNAkMRXQRGeiUhPuBaUME9sTiImZrrl9umqj1hgYs-HJAMsAbGieb
    7xzbXr-Ki0vaQ>
X-ME-Received: <xmr:sJo9ZqcZGxy-Ttc51yOQ1pg2floNxn2YIrfgTyaLe9dB3R1rtlWezHW4TP4Ge6PKyK3rwJQUqo8zuBHVxvqNDJ1z7LuAI1imWudagu_74gfzkvT9Q_k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdefhedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgeet
    tdeigefhkefhfeegvdeuiedvtdffkeeltdeivdfgteelueeuhfetleevueegnecuffhomh
    grihhnpeigvghnrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:sJo9ZkJibQ1MSGzLsV045RxpFSdbFhD1g-TTMn3i529M89qd-D6KLQ>
    <xmx:sJo9ZnLm9QoMFJxnPfIyRsraf7Crz7061FdGeTfrSxzNTsb-HTlcpw>
    <xmx:sJo9ZtwmvGVppswgPxkchQesCyWS1dXD9VPFKWZwNvWvDHePeh6u8A>
    <xmx:sJo9ZjLFc2nkL993h7Tejgyi6i8y4ITrGlI7pXAxkPCuOchzrbgFvw>
    <xmx:sJo9Zv-nUSBf1i4lybesNcSeZnxIdz4zpIpUTU6i4ey998iV1vReD_Ax>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 5/6] [DO NOT APPLY] switch to qemu fork
Date: Fri, 10 May 2024 05:53:25 +0200
Message-ID: <2ec0e3416a21087e3855b56113cc1a80fc5dea2f.1715313192.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.33fb4385b7dd6c53bda4acf0a9e91748b3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com>
References: <cover.33fb4385b7dd6c53bda4acf0a9e91748b3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes tests to use patched QEMU, to actually test the new behavior.
---
 Config.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.mk b/Config.mk
index a962f095ca16..5e220a1284e4 100644
--- a/Config.mk
+++ b/Config.mk
@@ -220,8 +220,8 @@ endif
 OVMF_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/ovmf.git
 OVMF_UPSTREAM_REVISION ?= ba91d0292e593df8528b66f99c1b0b14fadc8e16
 
-QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
-QEMU_UPSTREAM_REVISION ?= master
+QEMU_UPSTREAM_URL ?= https://github.com/marmarek/qemu
+QEMU_UPSTREAM_REVISION ?= origin/msix
 
 MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
 MINIOS_UPSTREAM_REVISION ?= b6a5b4d72b88e5c4faed01f5a44505de022860fc
-- 
git-series 0.9.1

