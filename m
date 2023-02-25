Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A09496A2BB1
	for <lists+xen-devel@lfdr.de>; Sat, 25 Feb 2023 21:38:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501867.773670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pW1IV-0007R7-8q; Sat, 25 Feb 2023 20:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501867.773670; Sat, 25 Feb 2023 20:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pW1IV-0007PM-4v; Sat, 25 Feb 2023 20:37:35 +0000
Received: by outflank-mailman (input) for mailman id 501867;
 Sat, 25 Feb 2023 20:37:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wch7=6V=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pW1IT-0007PG-41
 for xen-devel@lists.xenproject.org; Sat, 25 Feb 2023 20:37:33 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37a18c7e-b54c-11ed-88bb-e56d68cac8db;
 Sat, 25 Feb 2023 21:37:30 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 27EDA32004AE;
 Sat, 25 Feb 2023 15:37:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 25 Feb 2023 15:37:26 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Feb 2023 15:37:23 -0500 (EST)
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
X-Inumbo-ID: 37a18c7e-b54c-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1677357444; x=1677443844; bh=O4/IZ+LuGJRHMvCUTkXEoOEx+FGHNfoNKJ2
	om9c4VdI=; b=p4aDnP7hxbRCNULXC4DzXv88OAYlhDVPgE9EVhuOV21Kiv9sDeV
	5HMuOC2Z0uDkqvIaNtgjd+ny56W6xXBp8m3ETEz64zhe+umkX2R7PSJADMzcliY5
	iuag9poAMqs0dxmpCyeGrcvx5XXGcmD12jcO4oFYTxw4UwkETjekidSuPqW23W6T
	69JlPwPxMd6AMsFrkMEp3+AdifgcSErpW5zxUqGD6Q91JyWcFCxEIQ83plVAZZD6
	SFLHWC0R4hlwpm5yUUbHE9p9yWyi3pr6PxbB1BU32GF1j0VLybM9ACxR/JGQYf0e
	ucJwBsQbQDHPsYIVctJ7D8qKnTKJb5sitTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1677357444; x=1677443844; bh=O4/IZ+LuGJRHM
	vCUTkXEoOEx+FGHNfoNKJ2om9c4VdI=; b=KZmEalqhO1cvpS90Baj8dKWVZLual
	pHZv799zyBj4NtiFiW8WrhJPskGlBGySAbOVe5ghvu3KfL9HXCyTY0KhUHRacImI
	H89+kEU1/hcsSK/fTU584jCdqIBIRZl7+xo+5aDsGC3+bC1pDA5cwNbm69SAOMS4
	HlIha9NX8ZBpDC4dmw6A+IkBwPJVPEoGi18+qjuS8BTQ+UP4MYGKIBRNeylknC7U
	1W5Ngt6CPGVuBQXFA/a1FJB9uoGAyrTrm1Fppl8c/Ohsq8Lq1humz5buBLv3nspB
	FD7X4Y9Oupo3aCgILdZWjYQi/g1NOePZXENNA+RiTUB2f0/J5kUAR9tHQ==
X-ME-Sender: <xms:hHH6Y9Dz_4m4DFyTqRvZ3lia93uj9B4h3IwIgEfEPSjiB6xEhcLCkg>
    <xme:hHH6Y7jLvSJCp5Ix58DYbGDDjNdTk8LEQnBfJLRHK462sCeDeWVRasaekGqbKauVt
    d9E39x4flbvH28>
X-ME-Received: <xmr:hHH6Y4ll16Qkt1JUTmdp9XqIY60pluZZ7R7MpVbQusl2exyx-aRyvetEC5mzkGvQ8-cQeb77UiY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekiedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptefhhfdtkefhkefgjeduffehuedt
    gfduveejiedvffdvgeevledttdegvefhueegnecuffhomhgrihhnpeigvghnrdhorhhgpd
    gtohhnfhhighdrmhhknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:hHH6Y3y9HmI5kOHvr2BO7NAWrs-wMCTR4EY57e-QxYEK9aTFYcqw5g>
    <xmx:hHH6YyTa59ccGJC5Hwm4yg6eNLPf9z2XlHselUWuWAo7HNjhQ3s7Lg>
    <xmx:hHH6Y6bVyg23RF_voeUqXn_hZVbwMUv3tTxURKxLKptEOnGopdxpAA>
    <xmx:hHH6Y-ad-WNebjHMfla0YufkfKnFZx1k0AwS0XeVF-VcIE8wvDYcwA>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v5 0/5] Stop using insecure transports
Date: Sat, 25 Feb 2023 15:37:10 -0500
Message-Id: <cover.1677356813.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1676750305.git.demi@invisiblethingslab.com>
References: <cover.1676750305.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obtaining code over an insecure transport is a terrible idea for
blatently obvious reasons.  Even for non-executable data, insecure
transports are considered deprecated.

Changes since v4:

- Remove known-broken links entirely.  They only mislead users into
  believing the code can be obtained there when it cannot.

Changes since v3:

- Drop patch 4, which is an unrelated removal of unused code.

- Do not fail with an error if one tries to build the I/O emulator,
  vTPM, or vTPM manager stubdomains and passes --enable-extfiles.  The
  user may have provided alternate download URLs via environment
  variables.

Changes since v2:

- Drop patches 5 and 6, which changed links not used by automated tools.
  These patches are the least urgent and hardest to review.

- Ensure that no links are broken, and fail with an error instead of
  trying to use links that *are* broken.

Demi Marie Obenour (5):
  Use HTTPS for all xenbits.xen.org Git repos
  Change remaining xenbits.xen.org links to HTTPS
  Build system: Do not try to use broken links
  Build system: Replace git:// and http:// with https://
  Automation and CI: Replace git:// and http:// with https://

 Config.mk                                   | 20 ++++---------
 README                                      |  4 +--
 automation/build/debian/stretch-llvm-8.list |  4 +--
 automation/scripts/qemu-smoke-dom0-arm32.sh |  2 +-
 docs/misc/livepatch.pandoc                  |  2 +-
 docs/process/xen-release-management.pandoc  |  2 +-
 m4/stubdom.m4                               |  5 ++--
 scripts/get_maintainer.pl                   |  2 +-
 stubdom/configure                           | 33 ++++++---------------
 stubdom/configure.ac                        | 18 +++++------
 tools/firmware/etherboot/Makefile           |  6 +---
 tools/misc/mkrpm                            |  2 +-
 12 files changed, 37 insertions(+), 63 deletions(-)

-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

