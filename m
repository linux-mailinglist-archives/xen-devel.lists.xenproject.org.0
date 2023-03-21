Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 258066C3849
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 18:34:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512922.793333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefsX-0003Ni-Dj; Tue, 21 Mar 2023 17:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512922.793333; Tue, 21 Mar 2023 17:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefsX-0003Lj-9T; Tue, 21 Mar 2023 17:34:33 +0000
Received: by outflank-mailman (input) for mailman id 512922;
 Tue, 21 Mar 2023 17:34:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kq8e=7N=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pefsV-0003LR-3X
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 17:34:31 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0855cd5-c80e-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 18:34:28 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 80A9932009D5;
 Tue, 21 Mar 2023 13:34:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 21 Mar 2023 13:34:25 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 13:34:22 -0400 (EDT)
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
X-Inumbo-ID: a0855cd5-c80e-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1679420064; x=1679506464; bh=xt7fuRhGoG
	03MApmGYoRbTeNtA+ZdGyv+4DhR9yPms0=; b=c3RL3R2x06Hx9BJYjQgI7+vDPh
	rTdGja9F9vCHkefJpd3UlCCh/1p7zQ78bNVjJ6bWYm/w82Li64Gzo4Ty9QihVGUb
	x/BDvzO2Vac3kT/Y1mLmMvUnNPogW3bp1XK040arpVXvEdjBDJB5nb8mIvRmVV7/
	xqrf2LrrHn0pzJiGHkfXcIS1oAezVxpQSTdk4iOiCELDILX9/Zox73whbb7lhTgq
	w7Ru4LvEVS5OTv/evDCBvKqCBu03FnY0Eu4p/TVWOyYwi/OMQZBNSocu4ekaw9vd
	k9cKu4DBybaANkj1PJRYwTPcB8OTlkDYgCZ1VocFDnP999eERSEe0UtMJq1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679420064; x=
	1679506464; bh=xt7fuRhGoG03MApmGYoRbTeNtA+ZdGyv+4DhR9yPms0=; b=C
	+1VN/pF99UvATlmiMwvZjElTK3GEaFsy4AVJAVx4blA+99NgOZvJgkpZ0Eragzj9
	biEpmPA8rwyyOO+kbCxtN15X4ZWKYewwyX75bD+tAJAKNoJqhThhq7k0gDtgv9O7
	//r/jdb+1G1CC5TWs8vwjfVI14ga8jj1MdSUski+Lj+NSFDO2bwmCvJNqj+wMoph
	8sMoptdbx/KoIAT52LsnvD/1WUGpOH8FACWoKaHKqqIPcyEWeuEXgMVMML1Smytx
	nC6dPi92C/WeVw4OpbbLvLd2DqOKbOHyoBd8QWSGKGwjNycDxiqkEurw9fDK+Sv8
	YU3JHd6Rz8PHHq1pyXDug==
X-ME-Sender: <xms:n-oZZEscPGWjZC9lVYLigt32VzkySDn1MxLHcnO8Ms3tP_1zHfkERg>
    <xme:n-oZZBeKHYNrvk5BYZT4_HLe1sfUEgGmf_nbwk0jaKYRX86Rqwv-xg1wRI46Cl1Zu
    p6hI2pcQlCIgmk>
X-ME-Received: <xmr:n-oZZPzNOJTrTPgGiy1_vekUtq7iKuZdiF5L23KX-ZDBGhYL-DVjov1ku2Yjk146nMbig6Nu6t0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgtedtgeehvdeltdehhfehkeeg
    teegfeefheeffeevfeehheduhefhteduueejtdenucffohhmrghinhepgigvnhhprhhojh
    gvtghtrdhorhhgpdigvghnrdhorhhgpdgtohhnfhhighdrmhhknecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslh
    gvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:n-oZZHOIc9YhIOdoj5gNPbmwgpG1fSeE0EfAzXo5aXMP3NIQDZ3SWQ>
    <xmx:n-oZZE8vENxh2lH-6EY_bw33LHAokwEyETyZyrNzthWrQKxqWoz0nw>
    <xmx:n-oZZPW6H90XL2EanP5ASI_F-EKMfswu6R26SRG6OONGZPkzNLwBZw>
    <xmx:oOoZZPV0HjpItN9_AJZksjB77-ND-mjNJZRJDZIuFjdVojb1qQcUNA>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v6 0/5] Stop using insecure transports
Date: Tue, 21 Mar 2023 13:33:32 -0400
Message-Id: <cover.1679412247.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1677356813.git.demi@invisiblethingslab.com>
References: <cover.1677356813.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obtaining code over an insecure transport is a terrible idea for
blatently obvious reasons.  Even for non-executable data, insecure
transports are considered deprecated.

Changes since v5:

- Rebase on top of the staging branch.

- Do not replace a xenbits.xenproject.org link with a xenbits.xen.org
  link.

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
  Change remaining xenbits.xen.org link to HTTPS
  Build system: Do not try to use broken links
  Build system: Replace git:// and http:// with https://
  Automation and CI: Replace git:// and http:// with https://

 Config.mk                                   | 20 ++++---------
 README                                      |  4 +--
 automation/build/debian/stretch-llvm-8.list |  4 +--
 docs/misc/livepatch.pandoc                  |  2 +-
 docs/process/xen-release-management.pandoc  |  2 +-
 m4/stubdom.m4                               |  5 ++--
 scripts/get_maintainer.pl                   |  2 +-
 stubdom/configure                           | 33 ++++++---------------
 stubdom/configure.ac                        | 18 +++++------
 tools/firmware/etherboot/Makefile           |  6 +---
 10 files changed, 35 insertions(+), 61 deletions(-)

-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


