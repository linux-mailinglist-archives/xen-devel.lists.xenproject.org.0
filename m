Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4A364E4DD
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 00:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463943.722252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5y7A-0001Hi-KX; Thu, 15 Dec 2022 23:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463943.722252; Thu, 15 Dec 2022 23:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5y7A-0001Do-Gd; Thu, 15 Dec 2022 23:58:12 +0000
Received: by outflank-mailman (input) for mailman id 463943;
 Thu, 15 Dec 2022 23:58:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t+b5=4N=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5y78-0001Aq-Rl
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 23:58:10 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51097160-7cd4-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 00:58:08 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 463AB320090D;
 Thu, 15 Dec 2022 18:58:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 15 Dec 2022 18:58:04 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Dec 2022 18:58:02 -0500 (EST)
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
X-Inumbo-ID: 51097160-7cd4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1671148682; x=1671235082; bh=cvJovTwCt41fzIOTdCiPdt8ExuQVj5dKqG0
	zaU3tXpI=; b=F9r+QW1COyhmTZoUVsfkLdNNZiBCzgF2RkeZf5KtJsv63PNDrJ0
	P7KEqFpV5WT01E3pguVFHl9y9n1frGJ9Z/c1uidG1tiWgfQUDKq897EslXuL+m0/
	rJ3oXDWIZLlX/afh6mwOUvu//EdYf2YZCnk36W2nAOVVNlin+ODZNaesC7ZZ+h2Y
	fmntJ8izrOEuMqxs1hU5FBp2/8tXpisxu0PohH0mCIcjOukZDezLErsG5GRiqJNn
	IsX3VQfym1JgASS1tp59oP25vi1XwQ3U/pyTzx/YeK4ddWyAr40hGqIdJl6nq5fc
	IfatsVWdfE9tDWKdyfnohnKoWeuVj4IPULw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671148682; x=1671235082; bh=cvJovTwCt41fz
	IOTdCiPdt8ExuQVj5dKqG0zaU3tXpI=; b=FImOtPflN3sL3hxSo95k4fRxUr/WV
	LyYxmEZZQgnZaEwZcRpPl0nJtrreDd8QsXK3Cb+V5YXtHzDJn0Dsduhc0DLdNKwT
	UwpD1d/9OonSALctqXY9zLv7rKvIfAdPDYZZgTw6PDodFB8XR8yNFeibki3RSyf1
	ZT68X1To7dQTGVMqE7nxNa1CC7+QSFvNhsDeZNimTLr5507CD6mDjlBUoGEBUxNp
	CLOMfYikpuoUrFarTXUIuJfdVn0tdZ+v+36Zkl8u3CQ9gROFil7ROkdzpzlFzcpJ
	lueRBd+7ddY1VsYq8lPb4VD8JG0s8hLuncicezMOuyQIeHEt9Ce/4n0IA==
X-ME-Sender: <xms:irSbY40KdVYxh-b9Y9mRpgVMpIEMnQxSpvrwilUqiX2j5Jhxg69zJQ>
    <xme:irSbYzFIQj8aORHCFCYU-MMPI1sdikYMJ4v9r1Cqg83tak7aym-AxpaCfYK4VwSU5
    w2xZ-Solff6ObE>
X-ME-Received: <xmr:irSbYw4boX5j_MhS3PjdVglwWzuQ4ZKcszBQLXLTs927ht7fZ28l41NvvDp_OliZsFHXhff8VW-5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeigddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhephfeggfeiiedtieejgedutdekgfetgeeh
    heegteekvefhfefgudehtdevleegueegnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgr
    sgdrtghomh
X-ME-Proxy: <xmx:irSbYx2FsgIgkS9WKFiyNG_ihnWxoGDsujejCB2P9irRYDbB2WDYZg>
    <xmx:irSbY7F_mqILVQum0KpfBd7_Jf1pSbD1p9-vmorNROD9_dNLXBuGqg>
    <xmx:irSbY68AlMBSm-YsF-aZZJ8rnCek6Q4wmhfANjBmoY2WA6qgDu-5MQ>
    <xmx:irSbYxbjJCNA29u9UHlWk4lMXibg1XYAAYIhjA2ZSILY575s5Y_ygA>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH v4 00/10] Make PAT handling less brittle
Date: Thu, 15 Dec 2022 18:57:42 -0500
Message-Id: <cover.1671139149.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While working on Qubes OS Marek found out that there were some PAT hacks
in the Linux i195 driver.  I decided to make Xen use Linux’s PAT to see
if it solved the graphics glitches that were observed; it did.  This
required a substantial amount of preliminary work that is useful even
without using Linux’s PAT.

Patches 1 through 9 are the preliminary work and I would like them to be
accepted into upstream Xen.  Patch 9 does break ABI by rejecting the
unused PAT entries, but this will only impact buggy PV guests and can be
disabled with a Xen command-line option.  Patch 10 actually switches to
Linux’s PAT and is NOT intended to be merged (at least for now) as it
would at a minimum break migration of PV guests from hosts that do not
have the patch.

This patch series is shorter than v3 as two of the patches have already
been accepted into staging.  Only patches 9 and 10 actually change Xen’s
observable behavior.  Patches 1, 2, and 7 are prerequisites, and patches
3 through 6 are cleanups.  Patch 8 makes changing the PAT much less
error-prone, as problems with the PAT or with the associated _PAGE_*
constants will be detected at compile time.

Demi Marie Obenour (10):
  x86: Add memory type constants
  x86/mm: Avoid hard-coding PAT in get_page_from_l1e()
  x86: Replace PAT_* with X86_MT_*
  x86: Replace MTRR_* constants with X86_MT_* constants
  x86: Replace EPT_EMT_* constants with X86_MT_*
  x86: Remove MEMORY_NUM_TYPES and NO_HARDCODE_MEM_TYPE
  x86: Derive XEN_MSR_PAT from its individual entries
  x86/mm: make code robust to future PAT changes
  x86/mm: Reject invalid cacheability in PV guests by default
  x86: Use Linux's PAT

 xen/arch/x86/cpu/mtrr/generic.c         |  10 +--
 xen/arch/x86/cpu/mtrr/main.c            |  26 +++---
 xen/arch/x86/e820.c                     |   4 +-
 xen/arch/x86/hvm/hvm.c                  |  12 +--
 xen/arch/x86/hvm/mtrr.c                 | 100 ++++++++++++------------
 xen/arch/x86/hvm/vmx/vmcs.c             |   2 +-
 xen/arch/x86/hvm/vmx/vmx.c              |  18 ++---
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |   2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  |   9 ---
 xen/arch/x86/include/asm/mtrr.h         |  22 +-----
 xen/arch/x86/include/asm/page.h         |   4 +-
 xen/arch/x86/include/asm/processor.h    |  19 ++++-
 xen/arch/x86/include/asm/x86-defns.h    |  11 +++
 xen/arch/x86/mm.c                       |  84 ++++++++++++++++++--
 xen/arch/x86/mm/hap/nested_ept.c        |   4 +-
 xen/arch/x86/mm/p2m-ept.c               |  51 ++++++------
 xen/arch/x86/mm/shadow/multi.c          |   8 +-
 17 files changed, 227 insertions(+), 159 deletions(-)

-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

