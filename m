Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED40764D312
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 00:13:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462660.720820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5avU-0000KI-EA; Wed, 14 Dec 2022 23:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462660.720820; Wed, 14 Dec 2022 23:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5avU-0000H4-BN; Wed, 14 Dec 2022 23:12:36 +0000
Received: by outflank-mailman (input) for mailman id 462660;
 Wed, 14 Dec 2022 23:12:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IksU=4M=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5avS-0000Gw-LL
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 23:12:34 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c899c716-7c04-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 00:12:32 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id B374432001BB;
 Wed, 14 Dec 2022 18:12:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 14 Dec 2022 18:12:29 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Dec 2022 18:12:27 -0500 (EST)
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
X-Inumbo-ID: c899c716-7c04-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1671059548; x=1671145948; bh=oBs0Nh08AHKYnmyQrNDqmx3RO20Y4UzhoQp
	HA2sg6Bc=; b=E2RVk1agIwg6+khCiCUNwKcK9VO7eVnXaEpm7Bp9Rxre2pnh/A0
	HE5VgpA/UN9XzjWSqVc9u31hXwj0MFwCldMphTYZ2snsyvYJ1XNZzh76n18DJYOg
	a6H99iuzxCTG9I7zHh4uylNo1XfS2GM7ti5CtrWM14TU+/uC4z+CMa5fXihp7MBW
	GANBKuApyfBX+2nqQqdfLRlBVVF/OBiYcFGhhovc2PNOR1IgUYReDFOGezql7UN4
	QTHXWNAvEDLrK3N3l9oacWItG6uuqcSvTzJlozeVsS8agLDS93UD+zS94M+ah+U4
	WHG/THjAYVrboYZ+9n+3DVpQK/PUy46wvNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671059548; x=1671145948; bh=oBs0Nh08AHKYn
	myQrNDqmx3RO20Y4UzhoQpHA2sg6Bc=; b=RPE32msAX75qqO+jub+J9oQCpiubd
	5SrUz5SvkyP+pF733K/xYtg7/7CXSkDc4/227T5c+r+o36jTXbi3kuuSboKNYV6H
	0ao4rzn/zztg9PA7LbtDT+g8o0/Y5axxPrWTYG223Qf3vUTzj0CWK9t1tKwin6dV
	HBz1Tnx0mra+hr/+7J089sduR+fcn62vyDcGLpfBZwfDbHc56c7zggV1CGQkD0Fp
	6SwxIk1KYTueEDCslSnPszitKvAtnpLjL/6N3Qq4jR9+eoWA9ztVgSuV/crpyDW4
	rni5Lri2FlvMUvrrr1r2hWt6SFR2cqz76Bp8OqNR5Xzho8y0jNlLf4TZw==
X-ME-Sender: <xms:XFiaYw7N-wh7NidP7_M2K9qcp7JqGt0PSGwax_ktamjtDEylbYPrYQ>
    <xme:XFiaYx7_ToKq06OZIP7YhQUDuBNxx6XgAxdPrWgpE6pVCDLN9TIP9RgHz7To2_GzM
    txAYgluZ7pFrLs>
X-ME-Received: <xmr:XFiaY_fr358cFnbtipi22J6vmKoDnTsc3nQlhqqhSJSC9ycfzR7mdz3Ext6WtUMUpF47slfPUoNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeggddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhephfeggfeiiedtieejgedutdekgfetgeeh
    heegteekvefhfefgudehtdevleegueegnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgr
    sgdrtghomh
X-ME-Proxy: <xmx:XFiaY1LO7j4iP-4GuUVDOWSyajANnvhza_EpiX-yj5ROyuI4KYF5uw>
    <xmx:XFiaY0JJ5-RWae9VoipE5FhxJuT9aZYJ7CvJ6GmWwFF7Mlc1pHY6rQ>
    <xmx:XFiaY2wZCohMnZrzu_97ayaiH1mlZRKekjvKrw9mBJZ38cdu5HtdVw>
    <xmx:XFiaYz_ATRv6XjI19Qp6y27wf2U77qpxkvUQLOzbAbKgrQQHHuUOVQ>
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
Subject: [PATCH v3 00/12] Make PAT handling less brittle
Date: Wed, 14 Dec 2022 18:11:50 -0500
Message-Id: <cover.1671057808.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While working on Qubes OS Marek found out that there were some PAT hacks
in the Linux i195 driver.  I decided to make Xen use Linux’s PAT to see
if it solved the graphics glitches that were observed; it did.  This
required a substantial amount of preliminary work that is useful even
without using Linux’s PAT.

Patches 1 through 11 are the preliminary work and I would like them to
be accepted into upstream Xen.  Patch 11 does break ABI by rejecting the
unused PAT entries, but this will only impact buggy PV guests and can be
disabled with a Xen command-line option.  Patch 14 actually switches to
Linux’s PAT and is NOT intended to be merged (at least for now) as it
would at a minimum break migration of PV guests from hosts that do not
have the patch.

Demi Marie Obenour (12):
  x86/mm: Avoid hard-coding PAT in get_page_from_l1e()
  p2m-pt: Avoid hard-coding Xen's PAT
  efi: Avoid hard-coding the various PAT constants
  x86: Add memory type constants
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
 xen/arch/x86/include/asm/processor.h    |  15 ++--
 xen/arch/x86/include/asm/x86-defns.h    |  11 +++
 xen/arch/x86/mm.c                       |  80 +++++++++++++++++--
 xen/arch/x86/mm/hap/nested_ept.c        |   4 +-
 xen/arch/x86/mm/p2m-ept.c               |  51 ++++++------
 xen/arch/x86/mm/p2m-pt.c                |   6 +-
 xen/arch/x86/mm/shadow/multi.c          |   8 +-
 xen/common/efi/boot.c                   |  12 +--
 19 files changed, 226 insertions(+), 170 deletions(-)

-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


