Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FE557EBC7
	for <lists+xen-devel@lfdr.de>; Sat, 23 Jul 2022 05:45:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373541.605782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oF64A-0008QQ-3a; Sat, 23 Jul 2022 03:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373541.605782; Sat, 23 Jul 2022 03:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oF649-0008N9-VM; Sat, 23 Jul 2022 03:44:33 +0000
Received: by outflank-mailman (input) for mailman id 373541;
 Sat, 23 Jul 2022 03:44:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6fEO=X4=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oF648-00086N-2w
 for xen-devel@lists.xenproject.org; Sat, 23 Jul 2022 03:44:32 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bef30e6b-0a39-11ed-bd2d-47488cf2e6aa;
 Sat, 23 Jul 2022 05:44:28 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9CA275C0090;
 Fri, 22 Jul 2022 23:44:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 22 Jul 2022 23:44:24 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Jul 2022 23:44:23 -0400 (EDT)
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
X-Inumbo-ID: bef30e6b-0a39-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:sender:subject:subject:to:to; s=fm3; t=1658547864; x=
	1658634264; bh=Q+2bcuYbqNaeJUyXlpoGM3BHR0EjVdzO4fH/v0jEPL4=; b=7
	t1JRyzTo/cUpqOGjclWdhpSnggdWsoxx/jZXJ8VkWT8hDZgObyUSmHMsJ2rQceMA
	IbsozmiGBQ3OowrBrhrm/UH+cqJQhlYZ5C+FkbxjvZPEf20El5Ez4DkJ7ASqqrdF
	Qm5TWOplLbMpM47m7uuTiQpgMa03O4S1wcjQztwPfT/d8pHPWqb0hXKpMkIa4EHa
	idR00dVzu09I6/vjFlHxpQyCbqbqVSwZn3mmNOZjlYY5MZQHi4wAz11G/2viordE
	Q4PlxgOK8cnhwgLTgp5Uk7V2r7JyRFp8+IbrU8lTHTEBeT8galyYO+n6QgDuAsPv
	7srhaCpCFGUTsg3RwIfFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1658547864; x=1658634264; bh=Q+2bcuYbqNaeJUyXlpoGM3BHR0EjVdzO4fH
	/v0jEPL4=; b=C/uvxx0mgnbPf8amBWXIyKazG/mgZB/TuRDW8v+FCezAN0hkTf8
	iTSiozTjbTDY0H23jRMmUi8ztfOEMhcs4QKabgc67MM4cFFlS9yhJZwxQ7WsWz9W
	XqsrHOSl3eQM0RVG11QRuEKW/XROGXbYbxmm81uJU/R8rPn4MDh2Nj2BBY16sGUz
	DRg3KyI6+HJ4R1EebfS2jPTUJbTEtkqZWoma1I/AHdGEqO2uEQo0aF7rzQJsqPFu
	oCDgsH80JdQ01oipnF80Uqx826dMRaIbuPHMLDIUQt6GU52kycspkpQBMOMWZzEj
	WP/Y4cUcwldoY05nrgdzgiRfikAv3KMGimA==
X-ME-Sender: <xms:mG7bYp0SSDu1O2epo5qXdYmI4DKLiMHovg0lHbC_BxYy7pIzvQqVtw>
    <xme:mG7bYgEXG5VedUng4CiJ81W1FWyvtBJn-CQUsTD7gPT1IqA3KVZVaniEU6Sus0EpP
    -l_3W9c1iRHo5g>
X-ME-Received: <xmr:mG7bYp4JgN3PkCn81nH5t1U0kJ5B19zFe-zfWjqX9tw1o3mkpBTx-hseiFi1tQxpjGlugumJ5If4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtfedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhepvdefgeekvdekgfffgeekhfeijedtffek
    hefhleehfeejueetgfelgefgtdevieelnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgr
    sgdrtghomh
X-ME-Proxy: <xmx:mG7bYm14s34XpN5xQtob085psFFMqeXquNUXASotu8SZZtvcQJvN7A>
    <xmx:mG7bYsH4W_eU5AA4Yo361li6oWJgGkvbgIAwhfzwyIKKHc2DXXXGJA>
    <xmx:mG7bYn_seCTnEjhtxtPGahg_cuIIWz2M6LHOoWriiQBfAu3WvFegPg>
    <xmx:mG7bYhMOojthcQuq6c4_QxZxdXgyuzAovJPmAI6Y9AMCf33Pda7JxQ>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Backport of 166d38632316 ("xen/gntdev: Ignore failure to unmap INVALID_GRANT_HANDLE")
Date: Fri, 22 Jul 2022 23:44:10 -0400
Message-Id: <20220723034415.1560-1-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series backports upstream commit 166d3863231667c4f64dee72b77d1102cdfad11f
to all supported stable kernel trees.
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

