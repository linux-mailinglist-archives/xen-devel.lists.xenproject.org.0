Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF149D19B2
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 21:35:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839524.1255320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD8SH-0003yT-Ih; Mon, 18 Nov 2024 20:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839524.1255320; Mon, 18 Nov 2024 20:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD8SH-0003wE-Fp; Mon, 18 Nov 2024 20:34:41 +0000
Received: by outflank-mailman (input) for mailman id 839524;
 Mon, 18 Nov 2024 20:34:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N8iN=SN=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1tD8SF-0003w6-R6
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 20:34:39 +0000
Received: from fforwardh-b3-smtp.messagingengine.com
 (fforwardh-b3-smtp.messagingengine.com [202.12.124.198])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8589f04b-a5ec-11ef-a0c9-8be0dac302b0;
 Mon, 18 Nov 2024 21:34:35 +0100 (CET)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id 823CB17403CE;
 Mon, 18 Nov 2024 15:34:33 -0500 (EST)
Received: from phl-frontend-02 ([10.202.2.161])
 by phl-compute-05.internal (MEProxy); Mon, 18 Nov 2024 15:34:33 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Nov 2024 15:34:32 -0500 (EST)
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
X-Inumbo-ID: 8589f04b-a5ec-11ef-a0c9-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIwMi4xMi4xMjQuMTk4IiwiaGVsbyI6ImZmb3J3YXJkaC1iMy1zbXRwLm1lc3NhZ2luZ2VuZ2luZS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6Ijg1ODlmMDRiLWE1ZWMtMTFlZi1hMGM5LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTYyMDc1LjQxNDcxNSwic2VuZGVyIjoic2FraWJAZGFya3N0YXIuc2l0ZSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1731962073; x=1732048473; bh=JPxOc4/0PlCvpZ0ob2sJAfYSLeuH
	6RBTXPYFrwsJfpM=; b=VbpsCEmdkJhbnYlTmj6Qr15VDqUPkIEIQSArqtePl5CL
	4NqZwO+x8HbivBPepfmc3oXhAULqt815pwXBPGXupEpUY8rGLI5wsFJFUQ6mxAXs
	/NKqEhK+SPX2soF4jN1Kj8GMODQyZPklm680gf+MvOR2WV+nEb1JGGTVXZAQTLhb
	UpLjtvRH8cuRNY0GW4DAtSYAlPS4Q26KZu2AFp8Q7If19XoRDxpz88N59b8xp6k4
	l4yVc2x/0e/7sYt6XaZWxhzmvK11pRWa39Vvz4Gfhu0VF1+zSMhoMVaG0/w5CXM3
	nDLpuAGXe+W1DOMyz3yI+fbQINLaCuL87qv/+PDAGQ==
X-ME-Sender: <xms:2KQ7Z9IsqZJKSUxwZUUQWxCZKzqqvG1JIahvXEXcg1wkvdrl7zBw0g>
    <xme:2KQ7Z5Ld2iWKFu2SvE25mEuihJIkmfyZAwfirl-oYOSZX40Xq4lK5F2R9Yzmeo9vW
    fJ53rTwtLs-SVk0bmA>
X-ME-Received: <xmr:2KQ7Z1vbOZfgxBPwJrZoN6HmzBxU9Btw1QBd1hxqy6jbbVxYvhKBz2N_pZnG0ihPfBSEnjzX3p1AHFkP7gS2g3lzuLo1swyZwvXyqNavnde7YmM5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfedtgddufeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecu
    hfhrohhmpefuvghrghhihicumfhisghrihhkuceoufgvrhhgihihpgfmihgsrhhikhesvg
    hprghmrdgtohhmqeenucggtffrrghtthgvrhhnpeffvdelvdevgfdvjeeuvddvveefvdeu
    geethfdtveeggeegleejveejteegveettdenucffohhmrghinhepkhgvrhhnvghlrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgr
    khhisgesuggrrhhkshhtrghrrdhsihhtvgdpnhgspghrtghpthhtohepiedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhp
    rhhojhgvtghtrdhorhhgpdhrtghpthhtohepshgvrhhgihihpghkihgsrhhikhesvghprg
    hmrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphht
    thhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtoh
    eprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggv
    lhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:2KQ7Z-aTfcVpHLaRGrgPQj0CYfn7h1b82edFxqE5QQKDJ3ItLSFPPQ>
    <xmx:2KQ7Z0ZhpPHk87YAFj7843wiO-k9CllWif-ktnYfQFJgIN6WosSVKQ>
    <xmx:2KQ7ZyDr0HOxNh6HbCmoPH9dODwOI1Sduc3wIKeJYVMVGFvd-N7QJg>
    <xmx:2KQ7ZyZuUPdrccaXIj1JJLYpRqptkXM5MFlKw0Pk-q7bc2fvpHByaw>
    <xmx:2aQ7Z7VbN7CKHDbRN-6f_ZAWELQSEQbNUIi49Hm551i_Ep-ua_cigGRX3In6>
Feedback-ID: ifd9ba90e:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v3 0/2] configurable stdvga & pmtimer emulation
Date: Mon, 18 Nov 2024 22:34:27 +0200
Message-Id: <cover.1731961652.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce build options for stdvga and ACPI PM timer emulation drivers to make
them configurable with possibility to be disabled for finer-tuned setups that
don't need this code.

New config options reside in separate sub-menu, checks of emulation flags are
added so that domain can't be created if it requires devices that had been
disabled.
Minor changes since previous series, details provided in per-patch changelogs.

v2 series here:
https://lore.kernel.org/xen-devel/cover.1730887415.git.Sergiy_Kibrik@epam.com/

  -Sergiy

Sergiy Kibrik (2):
  x86/hvm: introduce config option for ACPI PM timer
  x86/hvm: introduce config option for stdvga emulation

 xen/arch/x86/Kconfig                  | 23 +++++++++++++++++++++++
 xen/arch/x86/domain.c                 | 13 ++++++++++++-
 xen/arch/x86/hvm/Makefile             |  4 ++--
 xen/arch/x86/include/asm/acpi.h       |  5 +++++
 xen/arch/x86/include/asm/domain.h     | 16 ++++++++++++----
 xen/arch/x86/include/asm/hvm/domain.h |  2 ++
 xen/arch/x86/include/asm/hvm/io.h     |  4 ++++
 xen/arch/x86/include/asm/hvm/vpt.h    | 10 ++++++++++
 8 files changed, 70 insertions(+), 7 deletions(-)

-- 
2.25.1


