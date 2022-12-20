Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33066651785
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 02:10:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466398.725275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7R9G-0004Uo-BG; Tue, 20 Dec 2022 01:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466398.725275; Tue, 20 Dec 2022 01:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7R9G-0004TD-8P; Tue, 20 Dec 2022 01:10:26 +0000
Received: by outflank-mailman (input) for mailman id 466398;
 Tue, 20 Dec 2022 01:10:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFeQ=4S=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p7R9F-0004T7-6t
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 01:10:25 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1286c6a8-8003-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 02:10:22 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 321923200957;
 Mon, 19 Dec 2022 20:10:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 19 Dec 2022 20:10:19 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Dec 2022 20:10:16 -0500 (EST)
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
X-Inumbo-ID: 1286c6a8-8003-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1671498617; x=1671585017; bh=HxKwu1yHvQE4t0B7JD3h8oXtLX1A8wBvk77
	m47Pevgo=; b=zTQrknzF1f7ibjycA25oDFa97HGSjXrr+S3G0dYFYBWrQWOCV1X
	G6aFu4bfwPbyKVQWMJ9HvXYFaxxE/Uym/HBid0gU91kvimqyb25A/Xr7FnWzSFGX
	HHqNVVu1ZFwKcebxY3+hhnO+JX6CSs7oQeyH9S3PtSO6Z3g8O4rAH7hm2R0DeY30
	FpXwOVGfZSGsY7jgHOob3asL5JIXkzSYEdV5F332cCtRF3FCy8O5XUuhmCx+/P6t
	h804kKEG1ZPaAee+KxjttXksVlnlgKgE9wMv0HsAY7Cje8OJfqnpacCsy+QAr3VI
	ucZBZtLS35I/RhIzVpmMGFME79n3wsYmDrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671498617; x=1671585017; bh=HxKwu1yHvQE4t
	0B7JD3h8oXtLX1A8wBvk77m47Pevgo=; b=s9LPDfcWgLFhWgpZuYe/22aHJ6DM3
	Fop0eGs9BJmOVA4qn1xWrFd1jQV8JjeQB85gwQHbqF8zLWEAAWFKh2Eth3B2Dptv
	C3SsIJgH60NENgp6auVCqhFdidIxxLwsEME/B0h0t30uSe0CXTXM/eqokg+PmZja
	77O7VpYfNQPB56SXsI6q5Dupwjzaio2PNcScCX+dYwXSCSoaHOBojlzt7kBLzX7C
	nq1OtxafvLzBrOM5T86ioiNC6n6KOhpGpPxvTIlEhbFSFiaz8WkNJfdzr2tKmzXK
	EbfDlMJE+aKerqYXJSosWsJlIzmzCsOEuvhcfZKKcZj82yqbUWKr2eGLw==
X-ME-Sender: <xms:eQuhYxO-rqPPEf4qmdMPzMadZc8PE9DwSIQcH9-AkG5ps4Zq0t4sHA>
    <xme:eQuhYz8cpqsuGG8HrEoqvc79tgCyerJJLCHp2qwWOgqUqPwOVfZp7Lsyvbf5Wb48W
    TXH_ak9oNFp2as>
X-ME-Received: <xmr:eQuhYwT5jvYGgnvi6Oyobq6JOqZo0L6R_xDaXrrVPYhfS5o6iaTUg06RS3ouF-LBH_n0ycW-hyAu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeggdefvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhephfeggfeiiedtieejgedutdekgfetgeeh
    heegteekvefhfefgudehtdevleegueegnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgr
    sgdrtghomh
X-ME-Proxy: <xmx:eQuhY9sKLbvoqCbP9oWTTy14opVDak03vS3bIvrDyAcmkG_Qm5gmCA>
    <xmx:eQuhY5clFlIm14detihn7HavY2DQDfua3U8bGoXXXoc1oXPnnIFymQ>
    <xmx:eQuhY51HTvMsTeGIsUrJjHSuRAjVm1Bqx_VSFaIS5ygt1PQKYtnlCA>
    <xmx:eQuhY4wqvkUR0QEjmRfP_r-N5lVTLY4XXZOdBfRc2tQTocK-rnryVQ>
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
Subject: [PATCH v5 00/10] Make PAT handling less brittle
Date: Mon, 19 Dec 2022 20:07:02 -0500
Message-Id: <cover.1671497984.git.demi@invisiblethingslab.com>
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

Only patches 9 and 10 actually change Xen’s observable behavior.
Patches 1, 2, and 7 are prerequisites, and patches 3 through 6 are
cleanups.  Patch 8 makes changing the PAT much less error-prone, as
problems with the PAT or with the associated _PAGE_* constants will
be detected at compile time.

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

 xen/arch/x86/cpu/mtrr/generic.c         |  10 +-
 xen/arch/x86/cpu/mtrr/main.c            |  26 +++---
 xen/arch/x86/e820.c                     |   4 +-
 xen/arch/x86/hvm/hvm.c                  |  12 +--
 xen/arch/x86/hvm/mtrr.c                 | 100 ++++++++++----------
 xen/arch/x86/hvm/vmx/vmcs.c             |   2 +-
 xen/arch/x86/hvm/vmx/vmx.c              |  18 ++--
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |   2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  |   9 --
 xen/arch/x86/include/asm/mtrr.h         |  22 +----
 xen/arch/x86/include/asm/page.h         |   4 +-
 xen/arch/x86/include/asm/processor.h    |  11 ++-
 xen/arch/x86/include/asm/x86-defns.h    |  11 +++
 xen/arch/x86/mm.c                       | 118 ++++++++++++++++++++++--
 xen/arch/x86/mm/hap/nested_ept.c        |   4 +-
 xen/arch/x86/mm/p2m-ept.c               |  51 +++++-----
 xen/arch/x86/mm/shadow/multi.c          |   8 +-
 17 files changed, 253 insertions(+), 159 deletions(-)

-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


