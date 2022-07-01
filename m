Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7978556278D
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 02:11:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358751.588090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o74Em-0002e1-OX; Fri, 01 Jul 2022 00:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358751.588090; Fri, 01 Jul 2022 00:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o74Em-0002bB-KU; Fri, 01 Jul 2022 00:10:20 +0000
Received: by outflank-mailman (input) for mailman id 358751;
 Fri, 01 Jul 2022 00:10:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0qQD=XG=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1o74Ek-0002b5-PZ
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 00:10:19 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e8215e7-f8d2-11ec-bd2d-47488cf2e6aa;
 Fri, 01 Jul 2022 02:10:16 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 69BD05C00A3;
 Thu, 30 Jun 2022 20:10:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 30 Jun 2022 20:10:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 20:10:13 -0400 (EDT)
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
X-Inumbo-ID: 2e8215e7-f8d2-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:sender:subject:subject:to:to; s=fm2; t=1656634214; x=
	1656720614; bh=fRJBB2CnMIUg5NV6nJ1IufinDZDpHUNh3Z3kruSktl4=; b=G
	SQUgBB/OofT0S7UUpxWUxZTSC9Y1LQBQIjBq/gm4fp0nw5xHNDQreTg9VowkMAxt
	EhEKitapukHcXfzENJLEFZ9NsPlsW/IoHEu+/qskPkOU7C8L3bMDHT0Rd3Wae2Dr
	RbL5Y9I7i0AyZ62aBC7DURbzF0an8WR4yyjfIG14qPRDBRqQd7S/FlpBziqjCYYp
	nTkT0EdssNY65h6w5LtV1CdfHpv+bYgUaRvpkEaGPhrGjaj4x/zE7WEX1xm62ID1
	rlOuV1V8FxOpFwsamvYPjLqbS5rA9twX3ydYfw6shQGHLvZkQyf2XFhSwbpMekOq
	17vmlUyt88STvsd/MQXMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1656634214; x=1656720614; bh=fRJBB2CnMIUg5NV6nJ1IufinDZDpHUNh3Z3
	kruSktl4=; b=jHcx3cb+99Pmwul9hx4GDn0f3r/luzIRSDzAfyPV4gFBbaL3qAy
	CNyPqGXZJ399fxvhdtsEBwQeTe5nc8rhBRDkZeOQnvvesBLMirp6uXjZ5w0dXltT
	fVx7NnMU9fhINvDJcujo6yPDLiLXw7dD3Zj+WBRW+ImrpezSH2Fa3C6RToUUY729
	BjGSu5hhLAZ+SA+x+GbXjagGs+cdcDrZ9c1JkEhTCBL4e/2lJFOUSh0SydSQV0fk
	s0w+gNAsOKplUrqpxUKfXOFbDAUMQqeDwyBK9EyEHDRapkfImIdkInmSPi2eEPl+
	AMhV0avXyy+FrEdCATj7waDhlVkvFKL2Pqg==
X-ME-Sender: <xms:ZTu-YuenWs1cWiUDJT9YOW-0eWPgzZJBnY2RvIPW1i-lsqx6CzLfyA>
    <xme:ZTu-YoMjXUVcHCxfsZY9ETzGyT3L5fM1_lKVvDV-uLCOTxFrXw_nwr2RXdJjS_hQD
    6_uBBy4Drvi9zY>
X-ME-Received: <xmr:ZTu-YvgotITkAyk5VZdTfGRYZhIB_H6VOu2_a_ewHA2KMqexHOPw7ooLHxQMvQ0xPAa7mEmzcO7h>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehvddgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhepvdefgeekvdekgfffgeekhfeijedtffek
    hefhleehfeejueetgfelgefgtdevieelnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgr
    sgdrtghomh
X-ME-Proxy: <xmx:ZTu-Yr-tB3c2ToscFx9sP6_rF2r1hX9yWhlhqjzpzCYvd7SYf8nm0w>
    <xmx:ZTu-YqtYtp5VN_uJQ6WW75RcUuRmnCa3PDKcRrXQKGBHLtRYWTH7nA>
    <xmx:ZTu-YiH_1-8yRwJeIV5nxFKM44G0o-w8VpPZN6xE-rOPrzEpgON8Eg>
    <xmx:Zju-YvUR2fU-m_bm7CdvK3kfVRZ8bMUtOB3D781hpfmDnoAZWSwpQg>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Hopefully correct backports for gntdev deadlock
Date: Thu, 30 Jun 2022 20:09:47 -0400
Message-Id: <20220701000951.5072-1-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This backports "xen/gntdev: Avoid blocking in unmap_grant_pages()" to
the various stable trees, hopefully correctly.


