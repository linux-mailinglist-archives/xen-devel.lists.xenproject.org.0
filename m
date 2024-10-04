Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC1398FFC3
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 11:31:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810223.1222899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swedI-0007Ti-De; Fri, 04 Oct 2024 09:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810223.1222899; Fri, 04 Oct 2024 09:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swedI-0007S0-Au; Fri, 04 Oct 2024 09:29:56 +0000
Received: by outflank-mailman (input) for mailman id 810223;
 Fri, 04 Oct 2024 09:29:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IKoM=RA=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1swedG-0007Ru-O1
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 09:29:54 +0000
Received: from fforwardh-a2-smtp.messagingengine.com
 (fforwardh-a2-smtp.messagingengine.com [103.168.172.197])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34676d90-8233-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 11:29:51 +0200 (CEST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfforwardh.phl.internal (Postfix) with ESMTP id E937329202B7;
 Fri,  4 Oct 2024 05:29:49 -0400 (EDT)
Received: from phl-frontend-01 ([10.202.2.160])
 by phl-compute-08.internal (MEProxy); Fri, 04 Oct 2024 05:29:49 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 05:29:48 -0400 (EDT)
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
X-Inumbo-ID: 34676d90-8233-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1728034189; x=1728120589; bh=eh
	Og/ezBDvfKgSCDngUxEyEY7R0kWEf4bzv1DRPNRvo=; b=hWJHDQ++sYAMfWyVtM
	s373JtwXvZB4cX7o0isasR0hCMUI1DYzRm7eRBk8WDoRwr7P55x6kwR5J4HRLm9L
	n3FekGVlzVRFQS3tpI1jaQm5tJkjpy4e7lZgPtEk/QnDeWBTGgGyryF4dTVrxz4C
	WL2SLIHfkrEhFqEQIk7xK/sNZ3hxq7zRamxE/pfyL6cYDN0GgH9nzN0IGLiJwou5
	b3YDFYOdeU/kV+NS1Sm0mti4ho9Hg/mNq3pvpJCTQ2di4qmqAA9j+v6zofnihFru
	j4xhs30Dwkh1QCpofPahNXCbeUrj4kSzThaNGrGhrJPWXdtNQ/cRsXvu5wAx69FK
	WVRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1728034189; x=1728120589; bh=ehOg/ezBDvfKg
	SCDngUxEyEY7R0kWEf4bzv1DRPNRvo=; b=p6xwCJAKsTRBYdSbTv46xF8JC8jA2
	6jHCLv/hrtxjKtkQkAX856AYZQVz7qw7Vx8X/dvmy9R9wZl0ynBW0CvhUCVLYM7E
	mh0BDQyk9LC2ZExO4rPufkrMp+lEQYl2OA+srntdTtwOmBati0oriz8mtpm4fdem
	NsOSlB90S+dC6sdJJkmrNKRpzFXkqJeKhwfBe6CGWvC5ObUItzQT8f2Tf26DS9dW
	Ny1pdJznAzrZfSPJCCg7P7Ix8V7eMDocHe36Fbp1kVsyzJMTcSRpH0JNLX00nkTr
	iJ4Fr9S1x/0FLVGhjNBqd76R6nDU1gcB7fIA2PYtreBGzCfQmxRBSKEXg==
X-ME-Sender: <xms:jbX_ZkNJ1Q_PZJlQ3Gg4xnYvmUyiwj8UI7aw6gutTu9fsiBbI_7IcA>
    <xme:jbX_Zq9_XEmxT7d25x_-bv9qr-4nre8E502dJgCIEjBibuTY-1KE6hagVBAq8nCg0
    B2FjYKtMIz4dFxLcPs>
X-ME-Received: <xmr:jbX_ZrTvzcUmQ81ufSHrZtdrekKsC6IcPBQhzVxhw7EfGK9SzqG35BeSy87CUv216IAkL6sYw3lsaOuigDj0aJ_jCnRTnPRKMkd-gE2bSEcE43DK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedgudeiucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:jbX_Zssz3pQCVd8PyHmv0USeFUxQYE2fGugjqY2ZBd_iiMCX0xngpA>
    <xmx:jbX_ZsczjAq5jfUhY-kiY-tOag7KFKl869yQO4rYhWIjBwEJ77bl-A>
    <xmx:jbX_Zg1ykUKiUAatEZDpJq4hKmDgow6KoMosd7YN0GX3A5-k5f0w9w>
    <xmx:jbX_Zg_P_uC9_30ZBxwNhyZsp27BxNerjo-wsJQ9jEAP9bknvGyj7A>
    <xmx:jbX_Zr6Qj9b_TmLkee060P1fmDESsv9JZdmNMnkgCCFCxT3AbNar2jD7eW_b>
Feedback-ID: id5d1ea8a:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 0/3] configurable stdvga & pmtimer emulation
Date: Fri,  4 Oct 2024 12:29:44 +0300
Message-Id: <cover.1728032664.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series presents previously posted patches [1,2] with review comments
addressed, Patches introduce build options for stdvga and ACPI PM timer
emulation drivers to make them configurable with possibility to be disabled for
finer-tuned setups that don't need this code.

New config options are now separated in a sub-menu, checks of emulation flags
are added so that domain can't be created if it requires devices that had been
disabled, patches were re-shaped a bit and other comments has been addressed.

  -Sergiy

  1. https://lore.kernel.org/xen-devel/20240912085709.858052-1-Sergiy_Kibrik@epam.com/
  2. https://lore.kernel.org/xen-devel/20240916063757.990070-1-Sergiy_Kibrik@epam.com/


Sergiy Kibrik (3):
  x86/hvm: introduce config option for ACPI PM timer
  x86/hvm: introduce config option for stdvga emulation
  x86/hvm: make ACPI PM & stdvga emulation optional

 xen/arch/x86/Kconfig               | 23 +++++++++++++++++++++++
 xen/arch/x86/domain.c              |  6 ++++++
 xen/arch/x86/hvm/Makefile          |  4 ++--
 xen/arch/x86/include/asm/acpi.h    |  5 +++++
 xen/arch/x86/include/asm/domain.h  |  6 ++++--
 xen/arch/x86/include/asm/hvm/io.h  |  4 ++++
 xen/arch/x86/include/asm/hvm/vpt.h | 10 ++++++++++
 7 files changed, 54 insertions(+), 4 deletions(-)

-- 
2.25.1


