Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B8564BF58
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 23:28:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461290.719400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5DlB-0006XG-3M; Tue, 13 Dec 2022 22:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461290.719400; Tue, 13 Dec 2022 22:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5DlA-0006Ps-RJ; Tue, 13 Dec 2022 22:28:24 +0000
Received: by outflank-mailman (input) for mailman id 461290;
 Tue, 13 Dec 2022 22:28:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mJcE=4L=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5Dl9-000519-7Q
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 22:28:23 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7164f844-7b35-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 23:28:19 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 4242F32004ED;
 Tue, 13 Dec 2022 17:28:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 13 Dec 2022 17:28:18 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Dec 2022 17:28:15 -0500 (EST)
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
X-Inumbo-ID: 7164f844-7b35-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670970496; x=1671056896; bh=B6KqEgF1ikxhkXO6Eev+8KZcWfjm4y01EPw
	zBXI1oLQ=; b=YFnGjxkmp34n1pvCzAdNPbSyO8pOzuzBy6JZkbkd8xBT7zwncqG
	jQC8INhjaUUS063/c3vSya4tcckrFiVw36qNNDzh5tpR920BaYvqk3x2vIVAE4xB
	XDV5xfDoIVLAV4Djya+C2jK+QB5S+7T6w0UWgHXE5ObX13QTb36op+n/j6HNjp0x
	7VVov8Rs9bloLl0j4FDVkc5pujYJEWakUoVRl6R7sYepBs7m+ceqljdJKIomzhZD
	N04AwS0DYBlofP9pH2ZRxotRC3yv23efJ19Psnv0o/CJs2irZS+0hWVUHnAN7BBD
	MvHgYVrp36F0kFB2EB3mYxXfK98dCmyxWcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1670970496; x=1671056896; bh=B6KqEgF1ikxhk
	XO6Eev+8KZcWfjm4y01EPwzBXI1oLQ=; b=wVAw/sb1e5DtEZhlkDRKISdDReP43
	c0xqMvq4kUZ0FAdnyWkVYLt30TOFcPilq3uoN0G6EzIvTTApQr0VodZdWdGkdn5B
	kE1Kuxj9dfjI2DfoorZz3UKrE5VYTU/8BsIWR0Z6q8yw0J59Awxrt0twI/dCmjkr
	olCQuEDOK0d1JLu3iP1/g7XGPB9q4bRI9UgQqkIRv9nvzNR9XgxFoqtAeHzZ43VG
	giV4gRr4CobMiQg2O/ocvW3FDQ9h94rdRSFma4I0/QQy9+SdT6n7yIBw2Lb3B9IQ
	asAIPjqX3eYul6Ya+34i91d3vxFX4IglXV1zkV3rw3D/1K/NtHNLhWIBg==
X-ME-Sender: <xms:gPyYYy2J8BcNZDCqEfTJLSnxdxUECLMLOAHP4AGKRShMUeCfc9Wwcw>
    <xme:gPyYY1HyGhBgmkmCuE2jmqWe8ly6uyozFmss7jNR_bQEj1JKZxXxDMoCy1KzWsjwU
    HhVBQ9jYO9Gf_4>
X-ME-Received: <xmr:gPyYY65KOqmUGU5zG2l8nOVhqaZnDXfhBf7br8cba6bvtGaTY9y17MfHBC5Z6UR6yamJBoLWw_o5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedugdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:gPyYYz2MNW7vtYWNkpdonY4HlyOIVmfm9XKY6t56eZcw-OJlgkCwwA>
    <xmx:gPyYY1FIS3MWNqBJtAP_HjQlD8ZEexk-lz8LWpHvffl1SCTVmTvdYQ>
    <xmx:gPyYY88smSMuDdG9xvtogvSlSx3fP_Ad3F71Y-JC8vrIJV4a04Ejyg>
    <xmx:gPyYY7Y66brZFrYLc3OB4eVbY_JiwtZxsrrUDH2PinMKZ80HhTnPoQ>
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
Subject: [PATCH v2 04/14] efi: Avoid hard-coding the various PAT constants
Date: Tue, 13 Dec 2022 17:26:45 -0500
Message-Id: <aad022471c81db163ed7b4780f926898c2ff9065.1670948141.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
References: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code much easier to understand, and avoids problems if
Xen's PAT ever changes in the future.

Reviewed-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/common/efi/boot.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index d521b47bc6d9513ca6e65c3170abb94881a71910..e1248d63e7f99d598a6b1df04e34ed34ed0b6910 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1748,23 +1748,23 @@ void __init efi_init_memory(void)
         emfn = PFN_UP(desc->PhysicalStart + len);
 
         if ( desc->Attribute & EFI_MEMORY_WB )
-            /* nothing */;
+            prot |= _PAGE_WB;
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

