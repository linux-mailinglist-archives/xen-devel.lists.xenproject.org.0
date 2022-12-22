Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C12565488E
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 23:32:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468692.727865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8U6b-00039M-Ci; Thu, 22 Dec 2022 22:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468692.727865; Thu, 22 Dec 2022 22:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8U6b-00036s-9A; Thu, 22 Dec 2022 22:32:01 +0000
Received: by outflank-mailman (input) for mailman id 468692;
 Thu, 22 Dec 2022 22:32:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9VX=4U=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p8U6Z-00036m-Nf
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 22:31:59 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 707f292b-8248-11ed-91b6-6bf2151ebd3b;
 Thu, 22 Dec 2022 23:31:57 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 2ED535C005C;
 Thu, 22 Dec 2022 17:31:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 22 Dec 2022 17:31:55 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Dec 2022 17:31:54 -0500 (EST)
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
X-Inumbo-ID: 707f292b-8248-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1671748315; x=1671834715; bh=Mgo9vyvq27x7kZrzIpUg0LyZtvhD7v1wK9V
	7XY9I8bg=; b=CEg95zLGA8hlh1RlG8WAGCR/8RX89TgdQjBTl877IueDUMcrxz7
	DDm2lPr2z2o8DU9XE2Ut8fcJV3iyquWD06ya94jIjm7kWEtnj2nmOdfQ1AKDQbzj
	nQit/rvyr+ysBz+HQ1HL7wrE5B4m4o7DDCFTyv7yvzh1LJT26w5GFeBWRGBA933q
	RapLzcTyNDRoQYGSHrw8HsiTWHlejVGfXXlDjll/3Q+E8Sf6wZZUfPV6S/RUwpjM
	RJwGmbb8pEGdJ1ZCkUOdKkLntlvm1yedagW5rt+uQiutaS7GD86RDhgf03gCdXIj
	q1eThSXPeFmov+8d3hFX3UJuWPWT+eOxhMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671748315; x=1671834715; bh=Mgo9vyvq27x7k
	ZrzIpUg0LyZtvhD7v1wK9V7XY9I8bg=; b=hilg0SZROLXbV3O45coTbqpU/7geg
	PYw/SctwTwIkieZyVWEK8q1VmsR0IE4gxEHUfUVeqkZE27uBOynaSHSsUlK5hTC5
	1YEQVOqZ/2aV8GyJW7EQKVgS/RsmcXEXXTfKYn9n6Ig8Ob2Bb/BFqoqBibFsXRQq
	SGmchNljI5lvCLmAvwKptHYHh8hN2T+3lyj9TUYfEbO7Y6dyLgwC4XQAge3x6NtO
	SDmLadqQIib0iPcZGi53hq4Sdv/hFVaiAxi4ErdPCuTOc61Nqd3ZwqF20AS7UpF+
	EJG8lCv1ou1X0uIGsQde9m/R+IfOVMweQVunYbZuiOeBfpqURomdZpxUg==
X-ME-Sender: <xms:2tqkYwK2SXYeUCD6Vy5PiFv_2a4zFQjZg-NnzgUgSG7s5RzuXbSrsg>
    <xme:2tqkYwJntmQrqSj2O9HGqhTRyt5DjpFO_0CtcndYG9NeMXqvQjkBrYi9z77ThNN_3
    l-hn7pCyXKB-zA>
X-ME-Received: <xmr:2tqkYwsAbmtAKTA_8u6vrMhS87UqNJMHREt6fvHwM_vsIbP76cxzMJLAn2LMuC0oGGuIyfFcxCk_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrhedtgdduieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhgefgieeitdeijeeguddtkefgteeg
    heehgeetkeevhfefgfduhedtveelgeeugeenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:2tqkY9ZS52o0cHOfZRGG37u1F5pmBcW0aMvvfAf2zR3Ee-C-9Iwmmg>
    <xmx:2tqkY3ZNdoYuQQSU4x2CWitjQBVkm7s0tfTAJ7G447uGSlVgGCzwYw>
    <xmx:2tqkY5CbpccR03jMrpNHBdvh6eZgkdbPLuCpt9B8RoDoc6wv43-QTQ>
    <xmx:29qkY8OfeIAKnnFNwSRIxbH_gI8cZiQ_CewMeOHbbVYFMlMldhEHsg>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Tim Deegan <tim@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v6 0/5] Make PAT handling less brittle
Date: Thu, 22 Dec 2022 17:31:45 -0500
Message-Id: <cover.1671744225.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While working on Qubes OS Marek found out that there were some PAT hacks
in the Linux i195 driver.  I decided to make Xen use Linux’s PAT to see
if it solved the graphics glitches that were observed; it did.  This
required a substantial amount of preliminary work that is useful even
without using Linux’s PAT.

Patches 1 through 4 are the preliminary work and I would like them to be
accepted into upstream Xen.  Patch 4 does break ABI by rejecting the
unused PAT entries, but this will only impact buggy PV guests and can be
disabled with a Xen command-line option.  Patch 5 actually switches to
Linux’s PAT and is NOT intended to be merged (at least for now) as it
would at a minimum break migration of PV guests from hosts that do not
have the patch.

Only patches 4 and 5 actually change Xen’s observable behavior.
Patch 1 is a prerequisite that removes the last place where Xen
hard-codes its current PAT value.  Patch 2 is strictly cleanup.  Patch 3
makes changing the PAT much less error-prone, as problems with the PAT
or with the associated _PAGE_* constants will be detected at compile
time.

Demi Marie Obenour (5):
  x86/mm: Avoid hard-coding PAT in get_page_from_l1e()
  x86: Remove MEMORY_NUM_TYPES and NO_HARDCODE_MEM_TYPE
  x86/mm: make code robust to future PAT changes
  x86/mm: Reject invalid cacheability in PV guests by default
  x86: Use Linux's PAT

 docs/misc/xen-command-line.pandoc    |  11 ++
 xen/arch/x86/hvm/mtrr.c              |  18 ++--
 xen/arch/x86/include/asm/mtrr.h      |   2 -
 xen/arch/x86/include/asm/page.h      |   4 +-
 xen/arch/x86/include/asm/processor.h |  10 +-
 xen/arch/x86/mm.c                    | 146 ++++++++++++++++++++++++---
 xen/arch/x86/mm/shadow/multi.c       |   2 +-
 7 files changed, 162 insertions(+), 31 deletions(-)

-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

