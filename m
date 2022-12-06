Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C62A643C53
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 05:35:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454335.711891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Pf6-0006Dg-3g; Tue, 06 Dec 2022 04:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454335.711891; Tue, 06 Dec 2022 04:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Pf5-0006Aq-U2; Tue, 06 Dec 2022 04:34:31 +0000
Received: by outflank-mailman (input) for mailman id 454335;
 Tue, 06 Dec 2022 04:34:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Feu=4E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p2Pf4-00055j-Cj
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 04:34:30 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44ebb0d0-751f-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 05:34:29 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2C3A432009F5;
 Mon,  5 Dec 2022 23:34:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 05 Dec 2022 23:34:27 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Dec 2022 23:34:25 -0500 (EST)
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
X-Inumbo-ID: 44ebb0d0-751f-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670301266; x=1670387666; bh=74iR55QTZEIoGrp/SIuOn2UKjLBB0nvCkho
	9p4QDUpk=; b=kZHF3htozvEjILFcNmghVOiwiPahaARZZQnYB3OuQ/ch06nSado
	yG6NGCo0bVBBOkqFcYbDNuN8woNHVSIVoJAekDNpejUV4z+p7Tn0MuABYOOto9Lb
	ciobsBYRt1mrbiqR1gkqKwGWDkzPI6sYnKW2fxGz0YFjE1qYMg8R88hEMeO/qwYc
	RNegB14AdeJvY/h86+/ILyEPDew23GpOPKHi5l15r6F9KLUBruR0eSY8wkQIfDet
	eh6x1jJDztvZyR0WrDtoj02rTfehAZZH8MOuili0YEPJDsrT016eaYgpHRP3wXiw
	nE/IoM+hL/5GHy0wjENcpkvTaoViDzlYByA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1670301266; x=1670387666; bh=74iR55QTZEIoG
	rp/SIuOn2UKjLBB0nvCkho9p4QDUpk=; b=rzwdaqZhIFWzdkO3L3vAIMiVKkza+
	PvpV0SK0/QZ98K6juLjx8KgH/WOj2E57lpPvOeMue8fyC4ffDDSo/FTU9je/7oJL
	0ijXbB36LW+VT1evFWFQZX9hFxnqfJ3O+7mOHsC/z6kIISyqLb41ugTE5T7vt3Aj
	xKgKmZExEVbAyUDOOQuFfFPBIVJv3fXbanETr4FvE5AQN87g85O5abduXDCnzqfP
	vGHRDqpGD6m+Zp5vfXnb3VLmEOsBU3525KqxE+M5Uxd2uo1kGtAT063VzdlJY0eR
	QkwA6uRieCHnvo2fcpNMjDeowdQJcfWwVaqy+WpN4uFjzB+cMM+NmgcGg==
X-ME-Sender: <xms:UsaOY5hWmEKxfCenBJRCS0FS0XNaVkEnrI92hEnpv4ioEP2PR4fWRw>
    <xme:UsaOY-CKvyTZeqKx4NmoAF2uKoRwi7otBcCupwBxu3QYxWdien7cC0o5m_Pgi7YXL
    441SabDblMAbws>
X-ME-Received: <xmr:UsaOY5G5M_r_XhVYHnM4oJc0OGqwi5GjYY5eZ0dHopl2P90cgj7H4gxh59Rv9qxemP_J1LQDaFbK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehgdejfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:UsaOY-S0TRX7e4NxA86J4vt-XOXV-NNzO5JK8K-jBXoqz5eroHMy-g>
    <xmx:UsaOY2yhDpldn6uugV00Sj_XFKJ0TmclOD4ysJXKI3sFj_9iNR8XXw>
    <xmx:UsaOY05fuEg2Pyun5oi5fTO9XUUN_pyClb45fGb-slQJwQmgztOUhg>
    <xmx:UsaOY9mRqAEq32jfb3HYbzLBLYwY7ehSnGyfJKm5pdOj306lrUSLng>
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
Subject: [PATCH 4/8] efi: Avoid hard-coding the various PAT constants
Date: Mon,  5 Dec 2022 23:33:33 -0500
Message-Id: <ea32e526153a40837484ba9c64a7d157804b6c27.1670300446.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1670300446.git.demi@invisiblethingslab.com>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code much easier to understand, and avoids problems if
Xen's PAT ever changes in the future.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/common/efi/boot.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 8e880fe30c7541a202dec3e665300d6549953aa3..260997b251b09dae4b48c1b1db665778e02d760a 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1746,21 +1746,21 @@ void __init efi_init_memory(void)
         if ( desc->Attribute & EFI_MEMORY_WB )
             /* nothing */;
         else if ( desc->Attribute & EFI_MEMORY_WT )
-            prot |= _PAGE_PWT | MAP_SMALL_PAGES;
+            prot |= _PAGE_WT | MAP_SMALL_PAGES;
         else if ( desc->Attribute & EFI_MEMORY_WC )
-            prot |= _PAGE_PAT | MAP_SMALL_PAGES;
+            prot |= _PAGE_WC | MAP_SMALL_PAGES;
         else if ( desc->Attribute & (EFI_MEMORY_UC | EFI_MEMORY_UCE) )
-            prot |= _PAGE_PWT | _PAGE_PCD | MAP_SMALL_PAGES;
+            prot |= _PAGE_UC | MAP_SMALL_PAGES;
         else if ( efi_bs_revision >= EFI_REVISION(2, 5) &&
                   (desc->Attribute & EFI_MEMORY_WP) )
-            prot |= _PAGE_PAT | _PAGE_PWT | MAP_SMALL_PAGES;
+            prot |= _PAGE_WP | MAP_SMALL_PAGES;
         else
         {
             printk(XENLOG_ERR "Unknown cachability for MFNs %#lx-%#lx%s\n",
                    smfn, emfn - 1, efi_map_uc ? ", assuming UC" : "");
             if ( !efi_map_uc )
                 continue;
-            prot |= _PAGE_PWT | _PAGE_PCD | MAP_SMALL_PAGES;
+            prot |= _PAGE_UC | MAP_SMALL_PAGES;
         }
 
         if ( desc->Attribute & (efi_bs_revision < EFI_REVISION(2, 5)
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


