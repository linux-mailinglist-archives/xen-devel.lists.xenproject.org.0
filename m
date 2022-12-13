Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DD464BF5A
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 23:28:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461289.719394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5DlA-0006PT-Kt; Tue, 13 Dec 2022 22:28:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461289.719394; Tue, 13 Dec 2022 22:28:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5DlA-0006NL-Ey; Tue, 13 Dec 2022 22:28:24 +0000
Received: by outflank-mailman (input) for mailman id 461289;
 Tue, 13 Dec 2022 22:28:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mJcE=4L=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5Dl8-0006J3-On
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 22:28:22 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72da7cf8-7b35-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 23:28:22 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id AD48F3200921;
 Tue, 13 Dec 2022 17:28:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 13 Dec 2022 17:28:20 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Dec 2022 17:28:18 -0500 (EST)
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
X-Inumbo-ID: 72da7cf8-7b35-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670970499; x=1671056899; bh=AG+JzsJ3HKJNDx5QoGJM0lvbk6XjCc6DnXE
	BAaXjCGE=; b=r5OkBoxOdiQi87gbbLcbDGilrvbPu2EgEwLsnYTLCGm4zxHgMvQ
	N0TDZtRWCAFYHtW8WA0aoWOK91p1GWUMYyG1IQsGSDHprdqELpLRtdof9c8EyV4S
	fQryfYSX5PYtc5ViemCK3FQjEFXBm8tMUQbK7ADux9tJ18Nev9b628mFMdzRc7J0
	IFdItf9qLfbJk5/1rp+Gt95K4ox8bEyFN2rRVlLBungjsZFGLXaWOiCMHLgfqW4z
	TfIKXrWoSR9p4ZrpNN/C55O9Wyb6s4Utm+t8H/jvemwDEtd5lRGjgcntT1jKi4qM
	NIe+nLKBN++HeCLFS24rvAlpgny+pkfmJHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1670970499; x=1671056899; bh=AG+JzsJ3HKJND
	x5QoGJM0lvbk6XjCc6DnXEBAaXjCGE=; b=Fc70eJt413E2cjShFYc/mD4vJ0q5K
	C3TkbarJaF7opCsb/C6LgmesxGRln0pkUnZEwL6uGs04m0pepWGu9wUFD7eUMKbZ
	nQxBYE/ezSbit939cDqCM24X59FzDsYRNIY+OubpVnWKHODs7KUsQmW2M796h3cW
	fB4kNMu1P1dnIgoLGz0/CreFBof1eBWel6pOOvhAJngj/3BnyiAJfvj6hwi6b6Mu
	LYe9l5cj732slWa3hKrsGfxBBESNR2pkcJztefjB6Us5H4vPHPmP7gL2GepRj974
	GXSp6zMm1SHyTkgLc7PxprgK9YWXfDNWoJA6gWGFS8psH2vxr6vtPZNZQ==
X-ME-Sender: <xms:g_yYY0C-PF2PVKQebxRKOKSmrREYFJYxdMyMShCI-5lEKQgFiiOJTA>
    <xme:g_yYY2idwHBJgMzre1fGc5bfFU79aYHXqlgkO8c7DrUsY_jr4HkAPydHF_ZY7ONAG
    NvqKZaA0j-GuQU>
X-ME-Received: <xmr:g_yYY3nNrlK5S-gh7IrDwxcT1WyzvZ3bSLoqSBdu6vUhVi7gsnewk3lUq3o7Dh-YCCe6cIBYvuGc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedugdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:g_yYY6yed98aBoyKpWvTPecXSBkMeDtNJ1vbX6Zx4wRUpGX7kKAVOw>
    <xmx:g_yYY5TbUEnERlXHCYieYzSFFb_-8G25GXhkprnZlMSaMM14T3UyNA>
    <xmx:g_yYY1YSCyLBbLL7zz6GuE8vWPy_xDR5Xv70t25wzox5MutIvjTdyw>
    <xmx:g_yYY0EGgA4xZ6gDm5C27qQUjPsYdw1hZmyoR4CSvbhYr3TmbNOC1g>
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
Subject: [PATCH v2 05/14] x86/mm/shadow: do not open-code PAGE_CACHE_ATTRS
Date: Tue, 13 Dec 2022 17:26:46 -0500
Message-Id: <fab47400b38d7ffaa4f7417d4cf290439f2eb27d.1670948141.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
References: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code easier to understand.

Acked-by: Jan Beulich <jbeulich@suse.com>
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

