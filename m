Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGhwJl1XzGkjSgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:23:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F3C372B6B
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 01:23:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269358.1558413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPY-0000fs-73; Tue, 31 Mar 2026 23:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269358.1558413; Tue, 31 Mar 2026 23:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iPY-0000eW-4O; Tue, 31 Mar 2026 23:22:16 +0000
Received: by outflank-mailman (input) for mailman id 1269358;
 Tue, 31 Mar 2026 23:22:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w7iPW-0000eK-60
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 23:22:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7iPV-00DeiG-2X
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 01:22:13 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc56a9-5cb7-0a2a0a5109dd-0a2a4506ceea-44
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:12 +0200
Received: from [103.168.172.149] (helo=fout-a6-smtp.messagingengine.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc5723-3034-0a2a45060019-67a8ac959fa9-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:22:12 +0200
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailfout.phl.internal (Postfix) with ESMTP id 14DD5EC00F3;
 Tue, 31 Mar 2026 19:22:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Tue, 31 Mar 2026 19:22:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 19:22:09 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:Message-ID:MIME-Version:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1774999331; x=1775085731; bh=G6lsEjwyugcZUkpmoiVDyMH0uoqmoUZ+
	BpamXOVSW2I=; b=UCF9A3LEmLlFNaDLPOYnnR1UiNKUHGvoukNWhtO6HtlJFkU6
	Im1jLhrqVs5IQ6fBE1pda3meFzRkrTK+zSL/P/XOssS7q7bPMgTabzQXwP7HkxME
	Mv+pDICTNLuPDtNYJ11b9KvQ/VxgNSCZClxK1FIE2ExIi2uHJlxcionf6ipcXYu7
	Jv2IxQOhSLcZuUS1d5Gs76sA8063L4CQP5eD/+E/llIRveKovXXndu2dq8RI45wo
	wv7zpI08i6DwuEei1P2F1HQpaoQOVfBR9IbQ4/6xni4+lrFKohQ2S9VcOG4POXSX
	3gONkbNRMuD8QYjc+6fSoQFnYqp6PYo0ggpQ/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1774999331; x=1775085731; bh=G6lsEjwyugcZUkpmoiVDyMH0uoqm
	oUZ+BpamXOVSW2I=; b=KrIaWwaxczZce96uLtEjbwErPEnw4f3Cw3NFgLZc3tZy
	eSNebpuT7k8I0ERISs5N8KeSF2QHvyQdO7NXkumh1x7p97LYbsc8ilLS+jNUJtJ2
	TQ7yqUJ+Ssqm8e5zf1jBXJxGEmgUIfejRQMJuCfec3Ovrz1BaVamHu7DJklDLAbj
	wjAEaVFpRTLB2fvcUhpTwg0aHyW9yGHlErwSSmaXB2OfMnpwRhwTu+zTUwE63SeO
	fNBe2HrhA0M5XGEkJF0qP2pYwtzASoA+J3Jm5EXtz507cjm6sjFz6iEHaDlJ0N7e
	CdJB7p3dqHc5MAszlszfQR/fDS2aJx7aAPVgoPIqqA==
X-ME-Sender: <xms:IlfMaRv-QGO8ToV9xwC6xjeL6MsKGL8pCuXX1Hl0UL11NOgJMsDXSQ>
    <xme:IlfMaRVaCW0jXUCez2LHykUnOEXXcN-oro-WTkFQJUljCfesD6usBmWr4_FQC_QVU
    uME-59gFAIMjlksWXQBsjN5ILGPkmLJ-nwfIp0NMskNXyTowg>
X-ME-Received: <xmr:IlfMadHLWLgo6peqQaL0jipo_6QSWD4LW_00VvCiUIMTJ-5OgweQj8WiBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucforghr
    tgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejueefhfelieek
    geeftdfgieeugefhudetjeethfefveehffejhfeigefgjeekleenucffohhmrghinhepgh
    hithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    gigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpth
    htoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthho
    pehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohhgvg
    hrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:IlfMaT24Oe3tQBG6pXJZrb1PBqbuD6x-3VY_UDM7hQqnrh5Sqj7MOA>
    <xmx:IlfMafP8a9BQyQmSn6_H-TgCac03Ro7AFDUy_xCMfokB_L-U5iaZLA>
    <xmx:IlfMaS5fPbH4PJ6BhrlCzh06P8qouZG1dCGUmLgVB3Y-JbYr_4PuKw>
    <xmx:IlfMaZ0iRpNHhmGN_mNrnF0vmI_3Yrs9unQd0JqU-sr30wpzN4uzxQ>
    <xmx:I1fMaQI73VtlB0_uYCS8d3tsi3E_m_ZyeM5lkI5iViIeZcq4TqVbClk6>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH test-artifacts v3 00/13] Changes for several CI improvements
Date: Wed,  1 Apr 2026 01:21:50 +0200
Message-ID: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1774999332-829971C2-1C4E94A0/0/0
X-purgate-type: clean
X-purgate-size: 2100
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:dkim,invisiblethingslab.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 12F3C372B6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

- Alpine update
- Debian trixie
- test arbitrary linux branch
- Linux stubdom

Technically, the last patch isn't strictly required, but it eases debugging.

In v3 I reordered patches a bit, to move Linux tests earlier.

Example pipeline: https://gitlab.com/xen-project/people/marmarek/test-artifacts/-/pipelines/2422090153

Marek Marczykowski-Górecki (13):
  Add Alpine 3.22 containers
  Switch Linux builds to use Alpine 3.22 container
  Add debian rootfs artifact
  Add linux-6.12.79-x86_64
  Enable CONFIG_USB_RTL8152 in kernel for hw12 runner
  Include git in the ARM64 build container too
  Support building arbitrary Linux branch/tag/commit
  Save Linux config to artifacts too
  Add trigger-test job, to run test on a Linux built from a branch/tag
  Add linux-stubdom dependencies
  Prepare grub for booting x86_64 HVM domU from a disk
  Prepare grub for booting x86_64 HVM domU from a cdrom
  Setup ssh access to test systems

 .gitlab-ci.yml                             | 72 +++++++++++++++--
 containerize                               |  4 +-
 images/alpine/3.18-arm64-build.dockerfile  |  1 +-
 images/alpine/3.22-arm64-base.dockerfile   |  6 +-
 images/alpine/3.22-arm64-build.dockerfile  | 31 +++++++-
 images/alpine/3.22-x86_64-base.dockerfile  |  6 +-
 images/alpine/3.22-x86_64-build.dockerfile | 43 ++++++++++-
 images/debian/13-x86_64-base.dockerfile    |  4 +-
 scripts/alpine-rootfs.sh                   | 25 ++++++-
 scripts/build-linux.sh                     | 24 ++++--
 scripts/debian-rootfs.sh                   | 96 +++++++++++++++++++++++-
 11 files changed, 300 insertions(+), 12 deletions(-)
 create mode 100644 images/alpine/3.22-arm64-base.dockerfile
 create mode 100644 images/alpine/3.22-arm64-build.dockerfile
 create mode 100644 images/alpine/3.22-x86_64-base.dockerfile
 create mode 100644 images/alpine/3.22-x86_64-build.dockerfile
 create mode 100644 images/debian/13-x86_64-base.dockerfile
 create mode 100755 scripts/debian-rootfs.sh

base-commit: 76894a5929bc604fb5bdb4aff2f94a6a9df68cdb
-- 
git-series 0.9.1

