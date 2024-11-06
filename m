Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 398249BE3EC
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 11:14:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830662.1245726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8d24-00064x-Go; Wed, 06 Nov 2024 10:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830662.1245726; Wed, 06 Nov 2024 10:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8d24-00062r-Ct; Wed, 06 Nov 2024 10:13:00 +0000
Received: by outflank-mailman (input) for mailman id 830662;
 Wed, 06 Nov 2024 10:12:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6dQ8=SB=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1t8d22-00062l-8z
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 10:12:58 +0000
Received: from fforwardh-a1-smtp.messagingengine.com
 (fforwardh-a1-smtp.messagingengine.com [103.168.172.196])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad6b39c3-9c27-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 11:12:51 +0100 (CET)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfforwardh.phl.internal (Postfix) with ESMTP id 5CAD52920393;
 Wed,  6 Nov 2024 05:12:49 -0500 (EST)
Received: from phl-frontend-02 ([10.202.2.161])
 by phl-compute-12.internal (MEProxy); Wed, 06 Nov 2024 05:12:49 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Nov 2024 05:12:48 -0500 (EST)
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
X-Inumbo-ID: ad6b39c3-9c27-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEwMy4xNjguMTcyLjE5NiIsImhlbG8iOiJmZm9yd2FyZGgtYTEtc210cC5tZXNzYWdpbmdlbmdpbmUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImFkNmIzOWMzLTljMjctMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODg3OTcxLjI0MjYxNSwic2VuZGVyIjoic2FraWJAZGFya3N0YXIuc2l0ZSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1730887969; x=1730974369; bh=m/
	jG6tGsHQwK9nng1wt6YeGprrQD02NB9JV8gioyKA4=; b=Q5FEBSWWLEPEfkCcUI
	e7kZl2L97VrMZVlejIgLTo2G2l8WnhndN2btZitGwumctl9Z6JxdeajC9X7tx485
	PmlwObfVB9y5eEPm2rvpnafcM6Ou5XpeZRupcsOfTEQnb0Xt48BzEDqehUK3HXEa
	VvOYR2QcwIcDBtta8o2fWdkrMPV1KDmbdjU5cMgkgayqNuNXozQCo8mUPcH+kfrg
	WMvKF0QjM6uaXepMNqMXb+ZsMJCvm4o+D4VWb92JQZ+ktemDRTbzLaotCgzTpILq
	Zd60N6B3P6RpqphQxJLhMAyqJ+XqrnU/lyaoHEuZxriT8+9++63W+WljpaiVwojG
	dvYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1730887969; x=1730974369; bh=m/jG6tGsHQwK9nng1wt6YeGprrQD
	02NB9JV8gioyKA4=; b=l08bbImjmzsKhJeXkCRcu8PjzXl8worUqH4cGUDrlmh2
	T3BXWpEFXT0OE5QYJjqHO6I3UiOJKn0yH4aQIXjCA8YMHSDs/v31ZoLGRbGWpr5u
	xqxrhUbtIGE4dFYE1cf4dva5rzi2NR4OmP80UA8ypmfrZRKXMqz05sUFFojml/SU
	3h6eqN6bnffqbKdWQOYIFhqAnqIbhL8lW+fMSnwB3oS2oP7e6+6IW616aD0DDteT
	/R3L+vfdFiEQE40hin7QYfptIcuOMamsMJdW6QwJw/UhHRZJGe5gNrYsvc/auxFC
	gclIu6lD7XUKs+V2zcSQdkZ04NCeK3t2tac4cwLhaQ==
X-ME-Sender: <xms:IEErZ5iV-IkZT4NpHWO3HkxnBEuT0Y5PoT_uE4VDq315s5MR16SLLg>
    <xme:IEErZ-BdVBWf3IpbIiLqSlWQSHJANfHFf1H7HK7dKMyxDu-WUItCWZqvYCsX1PcK3
    edyIJlI4O6sGnn0gAA>
X-ME-Received: <xmr:IEErZ5GQI6ME0A_wlgtEudrM2xrqkVSvIaCkJeV7ZGCLzYit31nr6KGWEEzCWZrf-H8VC2JwbKn-CBMA6674NGBzLE_27UHyTBG76ahHRCERxzAd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrtddvgdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfh
    rhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrihhksegvph
    grmhdrtghomheqnecuggftrfgrthhtvghrnhepffdvledvvefgvdejuedvvdevfedvueeg
    tefhtdevgeeggeeljeevjeetgeevtedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghk
    ihgssegurghrkhhsthgrrhdrshhithgvpdhnsggprhgtphhtthhopeeipdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhr
    ohhjvggtthdrohhrghdprhgtphhtthhopehsvghrghhihigpkhhisghrihhksegvphgrmh
    drtghomhdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthht
    oheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhope
    hrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghl
    lhhinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:IEErZ-Q_lrLJsuLWFEG69MceU4oFU9zYFp1cjcnN8O0Y8s5l1CixQQ>
    <xmx:IEErZ2zQ0-HBur9H2jdFLEYs-AXsfcxTmoKp7AeHvfF4mkJMJ6vprQ>
    <xmx:IEErZ05i58B4ot7rhxcNk6rGFlPDfJ40nah2mjSxG9DZNhg5v5kGCA>
    <xmx:IEErZ7yAXLvohfbjTSM0W4LnKSCZJIK8Dr41C3a9GE8ixaVonUsmTg>
    <xmx:IUErZwvr_k5WbwZ_tGdEK-AXAUGPd8wgd0GDyKIUsK0CfO2dnKctHkPWRkZ0>
Feedback-ID: i7ff1f533:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 0/2] configurable stdvga & pmtimer emulation
Date: Wed,  6 Nov 2024 12:12:43 +0200
Message-Id: <cover.1730887415.git.Sergiy_Kibrik@epam.com>
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
Since previous series one patch merged into 2 others and review comments have
been addressed (details are in per-patch changelogs).

v1 series here:
https://lore.kernel.org/xen-devel/cover.1728032664.git.Sergiy_Kibrik@epam.com/


  -Sergiy


Sergiy Kibrik (2):
  x86/hvm: introduce config option for ACPI PM timer
  x86/hvm: introduce config option for stdvga emulation

 xen/arch/x86/Kconfig                  | 23 +++++++++++++++++++++++
 xen/arch/x86/domain.c                 |  7 ++++++-
 xen/arch/x86/hvm/Makefile             |  4 ++--
 xen/arch/x86/include/asm/acpi.h       |  5 +++++
 xen/arch/x86/include/asm/domain.h     | 16 ++++++++++++----
 xen/arch/x86/include/asm/hvm/domain.h |  2 ++
 xen/arch/x86/include/asm/hvm/io.h     |  4 ++++
 xen/arch/x86/include/asm/hvm/vpt.h    | 10 ++++++++++
 8 files changed, 64 insertions(+), 7 deletions(-)

-- 
2.25.1


