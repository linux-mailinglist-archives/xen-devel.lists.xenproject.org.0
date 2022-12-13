Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB19964BF55
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 23:28:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461278.719349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Dkl-00053l-EW; Tue, 13 Dec 2022 22:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461278.719349; Tue, 13 Dec 2022 22:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Dkl-00051G-Bh; Tue, 13 Dec 2022 22:27:59 +0000
Received: by outflank-mailman (input) for mailman id 461278;
 Tue, 13 Dec 2022 22:27:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mJcE=4L=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5Dkj-000519-IL
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 22:27:57 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6369c9b2-7b35-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 23:27:56 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 107CC32003C0;
 Tue, 13 Dec 2022 17:27:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 13 Dec 2022 17:27:53 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Dec 2022 17:27:51 -0500 (EST)
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
X-Inumbo-ID: 6369c9b2-7b35-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670970472; x=1671056872; bh=Ldq7Pv+NvG7CcoJ4mR1C6yl2msqUQ/nXhK8
	gFnNvRd4=; b=oYs20aMcCDCEIk45BUGRQu4NKFc0P5lcwW5dqAtSFA5Z0EDh1DM
	ETet9TeEms7RvM42wtGmLtCu0hc1+iLLPGJMXuq+c/K602/XgBCX7e1Vsw6vGQoe
	PKqAhv7yGzX1Jh0P490ySQhVQhVpzwGQ0m6Y1ES67KrEmeFGp775k4kcsMJ8js+p
	0Zgq3gRbAHmG3s/0d2CINuxovEDViahysIz1z+Ocv//+wKCcAZ9mZvwTukz926zJ
	DnTisam+Qxwyw2xtEUdlbOEZwyaoNU+5TJOZ1+nVqo3ks8BKKnQEs4XR2z1wV1xT
	8L2SXbzIwlFkU23GqCRU6v82V24vD35ErTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1670970472; x=1671056872; bh=Ldq7Pv+NvG7Cc
	oJ4mR1C6yl2msqUQ/nXhK8gFnNvRd4=; b=oolH8GtYbdWQyw9UT4rQe0igkwJem
	Z1dnaUDZOh3AT6/J+sQXRb3IfURdUE1qXZIy6YEkuYKg19HUoSlvYib5zGeBm9+X
	FocCf8PbmaqOaM2jf0Ra5e5tWcaRcaXaec2QbadWr3Z02StlSiu3UPG8saL8RfA0
	Ongf9s1Z/Z5MUMR3vz4VEvPMY5olgmEdYssWQ6zlYb0CPK0FA1Q8kFNOV0UUDO3x
	4GiN+aAMHLKpzNIhWXz+XWMV4uDvgSmgKMRtgQmX2PnVJd0HobuDSuYgz2clJEvT
	OHqeO+c8FUZKztebdhnBk8HV06oShJWSgLY4cEEhWK41/yaMI2gPskE9Q==
X-ME-Sender: <xms:aPyYYwQYQIc7je0RdeypUXcJZxpcs3KymSlxC2Y5i7TKOC5ZSVltdg>
    <xme:aPyYY9ztgw-KuncOC8N2SMIJIzFdZqI_F4_4GmUqDqXOFhbWcLqJOXHjV77LqX70h
    sYQ34E1DqXUpIo>
X-ME-Received: <xmr:aPyYY91GECl4h9xaEs-tWmQFny1i0WWUS1LIGnmUlEgwGqeqEUeRlptCRflGLWt79U73zUqrBNMI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedugdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhephfeggfeiiedtieejgedutdekgfetgeeh
    heegteekvefhfefgudehtdevleegueegnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgr
    sgdrtghomh
X-ME-Proxy: <xmx:aPyYY0AmOFrQ2-KncJhIxlwGn1k7Ugn0Iyt1X-hhw0YxwHcaGOMItA>
    <xmx:aPyYY5iNidvzmvGhUgGvftpGK68X5jgLEWrW6HZPX0JIsIMlVaHwww>
    <xmx:aPyYYwp2zuc36aSYcDZqhzwPn8qkkNAhB-Eq5APhSd-ges6-rVmgeA>
    <xmx:aPyYY6WggsELqlCIor-gZ_v_1Vk2spD2gvafsInvZ2LSE9BY8cKQLA>
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
Subject: [PATCH v2 00/14] Make PAT handling less brittle
Date: Tue, 13 Dec 2022 17:26:41 -0500
Message-Id: <cover.1670947711.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While working on Qubes OS Marek found out that there were some PAT hacks
in the Linux i195 driver.  I decided to make Xen use Linux’s PAT to see
if it solved the graphics glitches that were observed; it did.  This
required a substantial amount of preliminary work that is useful even
without using Linux’s PAT.

Patches 1 through 13 are the preliminary work and I would like them to
be accepted into upstream Xen.  Patch 13 does break ABI by rejecting the
unused PAT entries, but this will only impact buggy PV guests and can be
disabled with a Xen command-line option.  Patch 14 actually switches to
Linux’s PAT and is NOT intended to be merged (at least for now) as it
would at a minimum break migration of PV guests from hosts that do not
have the patch.

Demi Marie Obenour (14):
  x86/mm: Avoid hard-coding PAT in get_page_from_l1e()
  p2m-pt: Avoid hard-coding Xen's PAT
  x86/mm/shadow: avoid assuming a specific Xen PAT
  efi: Avoid hard-coding the various PAT constants
  x86/mm/shadow: do not open-code PAGE_CACHE_ATTRS
  x86: Add memory type constants
  x86: Replace PAT_* with X86_MT_*
  x86: Replace MTRR_* constants with X86_MT_* constants
  x86: Replace EPT_EMT_* constants with X86_MT_*
  x86: Remove remaining uses of MTRR_* constants
  x86: Derive XEN_MSR_PAT from its individual entries
  x86/mm: make code robust to future PAT changes
  x86/mm: Reject invalid cacheability in PV guests by default
  x86: Use Linux's PAT

 xen/arch/x86/cpu/mtrr/generic.c         |  12 +--
 xen/arch/x86/cpu/mtrr/main.c            |  33 ++++----
 xen/arch/x86/e820.c                     |   4 +-
 xen/arch/x86/hvm/hvm.c                  |  12 +--
 xen/arch/x86/hvm/mtrr.c                 | 102 ++++++++++++------------
 xen/arch/x86/hvm/vmx/vmcs.c             |   2 +-
 xen/arch/x86/hvm/vmx/vmx.c              |  18 ++---
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |   2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  |   9 ---
 xen/arch/x86/include/asm/mtrr.h         |  22 +----
 xen/arch/x86/include/asm/page.h         |   4 +-
 xen/arch/x86/include/asm/processor.h    |  15 ++--
 xen/arch/x86/include/asm/x86-defns.h    |  13 +++
 xen/arch/x86/mm.c                       |  80 +++++++++++++++++--
 xen/arch/x86/mm/hap/nested_ept.c        |   4 +-
 xen/arch/x86/mm/p2m-ept.c               |  70 ++++++++--------
 xen/arch/x86/mm/p2m-pt.c                |   6 +-
 xen/arch/x86/mm/shadow/multi.c          |  16 ++--
 xen/common/efi/boot.c                   |  12 +--
 19 files changed, 248 insertions(+), 188 deletions(-)

-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

