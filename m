Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFE2643C52
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 05:35:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454331.711846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Peu-00057Y-Uk; Tue, 06 Dec 2022 04:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454331.711846; Tue, 06 Dec 2022 04:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Peu-00055p-Qx; Tue, 06 Dec 2022 04:34:20 +0000
Received: by outflank-mailman (input) for mailman id 454331;
 Tue, 06 Dec 2022 04:34:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Feu=4E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p2Pet-00055j-6A
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 04:34:19 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b4e7b0d-751f-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 05:34:17 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1C9EB32009F0;
 Mon,  5 Dec 2022 23:34:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 05 Dec 2022 23:34:10 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Dec 2022 23:34:08 -0500 (EST)
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
X-Inumbo-ID: 3b4e7b0d-751f-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670301249; x=1670387649; bh=sDIVsyhTHVkyAU/+B/rKbDWZZDFGzrBj2hs
	PmB7MdLs=; b=PP7hXNbYj6YB8yBuOP8NB+PY5sWvCA8dpJM2CVRcfgkkxVitACS
	eGRTSvJTjHbNfDjJ2V8/iXRRWfmsZmfcXtCMsdB0rYzrpgXtMOPwmiSS59l6zUz0
	9n3VUX/Ti+6Ki26pXjK0GjQwuiXhm0G8VDwVQ/YIL1xRGdo4dQv7KSAruGcWuY9D
	NV4l+s2sL5WUVppgyx+VspcIsGxFrHodCiXu63Lmh+lYUMG6bO48Mv4xp/imzC8Z
	+bgvL0AUFEjohEFofCgqod3xYaCm/YCA0fK8qbLnjzxsJUXS9+uWo4qkUp8ioLH/
	Mw+D2WhHU5crKmLyjKPUKjGYOnzZ0zCbnRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1670301249; x=1670387649; bh=sDIVsyhTHVkyA
	U/+B/rKbDWZZDFGzrBj2hsPmB7MdLs=; b=fyzY2ZDbdSaEeMsBUarpVQ7LLACtW
	YkcabzqBX/2pOnbjAVFDsmhlx9jl/A2o9U9934TeLi8iA1ztaybuwUy1msbhtN+W
	amSYEJyWtcloNMa55ZPbnD+40h02mF54k2F2Z/tAmjR5QCoV4eJ30plz/ITKcNFa
	Lh5gDBekc9avIS883WczmFZGwVz0NefUTF//BVkjbTlVmiptm+y85cscgOgsPTFP
	YWyzzFkt2Rb58/+rb6Unubvkz7wVc3cr6lZP6nPpmtTKCp7D+QLpxf6Jh6bbbw4z
	XJLbeOYgtQ1XHH+IMvzQyAveRnwDUXVj08NpuB4Kzlc2JhltjS7j1iVAQ==
X-ME-Sender: <xms:QcaOY4qVyiy93iZksLKylrcRXeLRBpoPenWLAdyanYuD9wZDoKknMA>
    <xme:QcaOY-rDyeP1tI3C8jwOnpUVvDbL5_hifFCbckecZrIOLl_28xd0uM16gEq4bHo7b
    657xFAzKEFOGTg>
X-ME-Received: <xmr:QcaOY9P-BMIJ2kyvW75OZjyKkh4DqKNTG03d_mj7zTunjNYAE9b4PnDKH3OOuXchgzyKUx_tMGdD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehgdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhephfeggfeiiedtieejgedutdekgfetgeeh
    heegteekvefhfefgudehtdevleegueegnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgr
    sgdrtghomh
X-ME-Proxy: <xmx:QcaOY_59eUL5txSEFEn1jyQEFKCtBLgru9qwkS0hqM3hWXh_i3pkLQ>
    <xmx:QcaOY36dWBvNKHb80WLs-4Xhv-rLp6IKueqQofrwRwaH1qANuigOuQ>
    <xmx:QcaOY_jeSDcV5KktgCHsVwqBWDuTg0lNWNBvsZ7vQvqiNMQkSGR1Sw>
    <xmx:QcaOY0txkCLQL-Pi9yOu8GZFKc8ZnlRG01ZsfNCGAA-YazT8RudUYA>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH 0/8] Make PAT handling less brittle
Date: Mon,  5 Dec 2022 23:33:29 -0500
Message-Id: <cover.1670300446.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While working on Qubes OS Marek found out that there were some PAT hacks
in the Linux i915 driver.  I decided to make Xen use Linux’s PAT to see
if it solved the graphics glitches that were observed; it did.  This
required a substantial amount of preliminary work that is useful even
without using Linux’s PAT.

Patches 1 through 7 are the preliminary work and I would like them to be
accepted into upstream Xen.  Patch 7 does technically break ABI by
rejecting the unused PAT entries in debug builds, but as release builds
are not impacted I suspect it is not a serious concern.  Patch 8
actually switches to Linux’s PAT and is NOT intended to be merged (at
least for now) as it would at a minimum break migration of PV guests
from hosts that do not have the patch.

Demi Marie Obenour (8):
  x86/mm: Avoid hard-coding PAT in get_page_from_l1e()
  p2m-pt: Avoid hard-coding Xen's PAT
  x86/mm/shadow: avoid assuming a specific Xen PAT
  efi: Avoid hard-coding the various PAT constants
  x86/mm/shadow: do not open-code PAGE_CACHE_ATTRS
  x86: Derive XEN_MSR_PAT from its individual entries
  x86/mm: make code robust to future PAT changes
  Use Linux's PAT

 xen/arch/x86/include/asm/page.h      |  4 +-
 xen/arch/x86/include/asm/processor.h | 22 +++++++++-
 xen/arch/x86/mm.c                    | 65 ++++++++++++++++++++++++----
 xen/arch/x86/mm/p2m-pt.c             |  6 +--
 xen/arch/x86/mm/shadow/multi.c       |  8 ++--
 xen/common/efi/boot.c                | 10 ++---
 6 files changed, 91 insertions(+), 24 deletions(-)

-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

