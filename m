Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8051293CC91
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 03:58:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765203.1175795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXACj-00049T-Lf; Fri, 26 Jul 2024 01:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765203.1175795; Fri, 26 Jul 2024 01:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXACj-00047s-Ix; Fri, 26 Jul 2024 01:57:09 +0000
Received: by outflank-mailman (input) for mailman id 765203;
 Fri, 26 Jul 2024 01:57:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XHFb=O2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sXACh-00047h-R4
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 01:57:07 +0000
Received: from fhigh2-smtp.messagingengine.com
 (fhigh2-smtp.messagingengine.com [103.168.172.153])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a7bf067-4af2-11ef-bbff-fd08da9f4363;
 Fri, 26 Jul 2024 03:57:04 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id AE9D711401EA;
 Thu, 25 Jul 2024 21:57:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 25 Jul 2024 21:57:02 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Jul 2024 21:57:01 -0400 (EDT)
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
X-Inumbo-ID: 5a7bf067-4af2-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1721959022; x=1722045422; bh=ELkS5LyLRXW6K4j+ygM4XILJ8BqvSvZ7
	MAPzWMIadhU=; b=HLT1UnbHD8PrfoHA7Ty5qdPVZDo1bTwfz1KvYyDoHwgZxZnC
	FnlkR6nwM9ruz1G+XqxWsbKhSJiZy6VZyY0xTbkFrH1KJjK8TmZweQ3HXs0PbUpE
	YKbSheNFXQujSbSVCoo1vHIIZaXLIGEOv0sqqftXlIYpuPPVSWe6sNr/wORteOZa
	Kbq49Goldtl6lzE+wjDgXxLT8PJ/sgoqUXsnnMOkD1UjYFABoWYiaQTl/6kPpOIf
	9V0FETKKCT8kjWTcKmdnAR9xZZTC/ymUe9AO7AeDAPhXBLAqVUR2iWQ9SZ3GCbJg
	7A9zBQu1LOGz+Qu9qWg2BwdkVmn2PgsrOoU7aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1721959022; x=1722045422; bh=ELkS5LyLRXW6K
	4j+ygM4XILJ8BqvSvZ7MAPzWMIadhU=; b=bJf6hggmutyWWXOXz5c/Yp6wTANH3
	WCbvQwPBPmIEh2vF3Vzk4GdxjT9MDBfr7kJdDPRmv15N1aAc5ltCS6dsDx7oN2iK
	yQjxicxDwEZXSmHLvSRBHN1Q+zF/iWf2fTfCmafcOZsh/DAKE0yEJve1gv1t8emv
	rXQLqs4f62CmnADwaGFh98ixKYERdlAmiI3PJLfNqhVavAl9adZBg7tLTYRz6IDH
	Jt8ga1OiuDWdl7062MmwZ7FL/AQkFSvYSzEDOcjZE7dLfw0Jw7TGGpRV8tPGFAPr
	U1wlCJXR2QIblprXNK7B5wH2AVyZHOG1aOzpv6nGSWIHzg6yIsFKhCR2Q==
X-ME-Sender: <xms:bgKjZt23ez2bf_kNizoQi0vLK4pvMO57cIYN5SgKhrawtMN_MGVeoA>
    <xme:bgKjZkHzj8KfDhKLCEplzUzH2dTC_C-lLIL6muJDbK0LuQTSGsR2jzA0Tzbc_k3y_
    LNN7rIFwAf-nA>
X-ME-Received: <xmr:bgKjZt5QI8Gq2wLVf-3xyI4FuC50JGX9CNABnwFyO_3IqfXfnV9frgbb4X-R7QPG97_sGUop3x9zf45wpw_ZUMFT5bEIRV2ZQTs-J_HUSut9-bMDI8U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrieeggdehudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofggtgfgsehtkeertd
    ertdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghk
    ihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqe
    enucggtffrrghtthgvrhhnpeelkefhudelteelleelteetveeffeetffekteetjeehlefg
    geekleeghefhtdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgt
    ohhmpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:bgKjZq1OPExS_qoZDBc0lnn3RrknErU_E_UxkQQqYoo_Ez_x1Y-vcg>
    <xmx:bgKjZgGyHG41jAbjbYGS9CEEUyCU8xI0tAEOy9X9bIavtvdz9kuzpA>
    <xmx:bgKjZr9M9yEqqBRvAioY3HbZitv9CatlrUSEuIngo-YiAVTWi-MBaQ>
    <xmx:bgKjZtnY8Hm9xaD6hZyesQDxa_Tug-N8TKi6QqWH-I5Hfm1JFfagig>
    <xmx:bgKjZqOi-zV1OmzivAOSX0eIbvB8Yz8HaLXncqrtYIJ_iHNNW7NnEiv2>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v7 0/2] Add API for making parts of a MMIO page R/O and use it in XHCI console
Date: Fri, 26 Jul 2024 03:55:52 +0200
Message-ID: <cover.fe70b6220fe40bbe11f97b9396340c5dd11d59aa.1721958949.git-series.marmarek@invisiblethingslab.com>
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

Marek Marczykowski-Górecki (2):
  x86/mm: add API for marking only part of a MMIO page read only
  drivers/char: Use sub-page ro API to make just xhci dbc cap RO

 xen/arch/x86/hvm/emulate.c      |   2 +-
 xen/arch/x86/hvm/hvm.c          |   4 +-
 xen/arch/x86/include/asm/mm.h   |  23 +++-
 xen/arch/x86/mm.c               | 261 +++++++++++++++++++++++++++++++++-
 xen/arch/x86/pv/ro-page-fault.c |   6 +-
 xen/drivers/char/xhci-dbc.c     |  36 +++--
 6 files changed, 313 insertions(+), 19 deletions(-)

base-commit: b25b28ede1cba43eda1e0b84ad967683b8196847
-- 
git-series 0.9.1

