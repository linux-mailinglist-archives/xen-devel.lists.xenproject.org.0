Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 705F0643C55
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 05:35:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454336.711902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Pf8-0006X6-Dc; Tue, 06 Dec 2022 04:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454336.711902; Tue, 06 Dec 2022 04:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Pf8-0006VG-9m; Tue, 06 Dec 2022 04:34:34 +0000
Received: by outflank-mailman (input) for mailman id 454336;
 Tue, 06 Dec 2022 04:34:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Feu=4E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p2Pf6-0005MV-NJ
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 04:34:32 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46925a2f-751f-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 05:34:31 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7636E32009ED;
 Mon,  5 Dec 2022 23:34:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 05 Dec 2022 23:34:30 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Dec 2022 23:34:28 -0500 (EST)
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
X-Inumbo-ID: 46925a2f-751f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670301269; x=1670387669; bh=78iOTcLznyqVPzoEL9+P1QeIqoDr0D4mDgx
	uOJLHvyA=; b=mb+ZKJoBLlLQBUZp7OYLSBpBR50HvPmg/rxtbJyjmd41Wsl7290
	+6ZSXrsjfu4ms8u6jOVsqOa10kWfy6TkRdh/FDFKfPy3WrT6NEDeqMYZbYGanPNS
	Dcb74+ahLONwoEDI6uhsg4tjiUAPKFLwfIWdTiHw4bE0vvpHtnCKGYCCqWGJGK15
	MYtjgqDrzoSt2PKNej70oONKCZXIe92Z3vMu7TuTM0ZSMRmgSF/xludl4ZCKxYvM
	PYK1Yqk9/sC+SK83qnVaFIA8stvLyhMOpUZS2CwmihCooXchGVl87mAoXvn6zm+R
	PR4nsoojQfnF9tJiW78wYYmptBGTeyG83Kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1670301269; x=1670387669; bh=78iOTcLznyqVP
	zoEL9+P1QeIqoDr0D4mDgxuOJLHvyA=; b=OvWfbvRkBEGn+zvGrNGEUNi+eH01S
	te6mERJm3kOGumqu5wEoLdGSIf5EqF4m6LC58nh6/TproNyCY8NhsSsEzGAG3G/M
	yMBaWvTDQKYXax7A06t1HVaXkoGdemfw4sHlWDYNSPGIgaXG+u62H7T2m3w0xhH+
	fAqjL1HD+zOHGfa2bVbiSBEzmIIQA9zLoQ41UuT2j3tB/s1TpymXvZ/WLIrlvcfn
	Dlr/EOjKDFtqGI4b8uKH8mmIT9uhB2+1OT58xLdifDmuYQ/uRWxkqRsU5W1TyMYl
	XCs5J9hA+D+p2kPPauLilP0ktGYsaDh2JpLuMeT4Tq4OdQCrbl0L4a7Ig==
X-ME-Sender: <xms:VMaOY2rH1AwEE-VnUHkNslY8FDc2ydkjxGF9HL-PyQBUQAdjJKci5w>
    <xme:VMaOY0pAcKtBLEkCin7aTZBTBFVFMalSus8lkHvyjks8N9hsEeF8_NOf4Tut6g0hv
    Dc3OKTPP5b4_XI>
X-ME-Received: <xmr:VMaOY7MzJkALhGhOxcmA3eznWHZnrY2LsuPXUVL4bMyOfUEgU1jr6rwJf1HMNwxf7uXiwwVGAIFq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehgdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:VMaOY15Bnsq5befxFIuqqKmX5KnXpDw43wHqJXmo-U0-4JmeQOx0LA>
    <xmx:VMaOY14NCHdf35SCloh5iEVLvl2xMn3CzoCUhRASoOYDNH1y8-ZBKQ>
    <xmx:VMaOY1jB_kEnMk3JXfBGkQWrTvrqjk6utgcRfim14Z9xrqr3dsOv5Q>
    <xmx:VcaOYyvbCrNRTULLimBSdjiu8Ds3b1cFyZW1cCLCZDCXCspk7_wBYw>
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
Subject: [PATCH 5/8] x86/mm/shadow: do not open-code PAGE_CACHE_ATTRS
Date: Mon,  5 Dec 2022 23:33:34 -0500
Message-Id: <52d04f14daca91597f78f60e3a16cce4069bf32f.1670300446.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1670300446.git.demi@invisiblethingslab.com>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code easier to understand.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/mm/shadow/multi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 4e94fec3d50cde0e5a26ecb62ff4d00dd00f759d..6bb564b0145285afc93b72a60b7797fcfe8696dc 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -535,7 +535,7 @@ _sh_propagate(struct vcpu *v,
     if ( guest_nx_enabled(v) )
         pass_thru_flags |= _PAGE_NX_BIT;
     if ( level == 1 && !shadow_mode_refcounts(d) && mmio_mfn )
-        pass_thru_flags |= _PAGE_PAT | _PAGE_PCD | _PAGE_PWT;
+        pass_thru_flags |= PAGE_CACHE_ATTRS;
     sflags = gflags & pass_thru_flags;
 
     /*
@@ -548,7 +548,7 @@ _sh_propagate(struct vcpu *v,
     {
         int type;
 
-        ASSERT(!(sflags & (_PAGE_PAT | _PAGE_PCD | _PAGE_PWT)));
+        ASSERT(!(sflags & PAGE_CACHE_ATTRS));
 
         /* compute the PAT index for shadow page entry when VT-d is enabled
          * and device assigned.
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


