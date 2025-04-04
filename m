Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AE3A7B542
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 03:02:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937663.1338581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0VRT-0004sg-Pc; Fri, 04 Apr 2025 01:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937663.1338581; Fri, 04 Apr 2025 01:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0VRT-0004qA-MW; Fri, 04 Apr 2025 01:01:55 +0000
Received: by outflank-mailman (input) for mailman id 937663;
 Fri, 04 Apr 2025 01:01:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oGR=WW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u0VRS-0004q4-7j
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 01:01:54 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 613692dd-10f0-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 03:01:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 320456113B;
 Fri,  4 Apr 2025 01:01:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6606C4CEE7;
 Fri,  4 Apr 2025 01:01:43 +0000 (UTC)
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
X-Inumbo-ID: 613692dd-10f0-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743728504;
	bh=uqchqLTe2Q2WYfzxGfV01BUVnahYzYUq5UwZGo46i6I=;
	h=Date:From:To:cc:Subject:From;
	b=tnodfuHVpgbJlkt2BPdz2Xy0aiM+heAiqHxvsgb23FR2zp7q5R1KJcoKogafvvEC0
	 HKibBXiPCzVF0NNQDuHddgxHG+0+CekIqXSprGGLCdqbkV9Ij9/BsYlA89cnrTYyVF
	 9DbgWFIKTAw1xBIjDV7Hba7lQugCJcDhfiwizKW9Ad8irEt/0r1awGU0jzvAE/28CP
	 AOW701jOP21PrvAYIF2mdC85jNHV3LrcUwfLVeVRKA9DElQXBisfNQ9041Dw2MAXVc
	 WnyYI/FKshYJV2jM05Jgjkyr6aRRFnfa+z536fai/2vEbpxAALnEtrpW7sN0SkIEXD
	 uld83FLrVHHPw==
Date: Thu, 3 Apr 2025 18:01:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    jason.andryuk@amd.com, Xenia.Ragiadakou@amd.com, 
    Alejandro.GarciaVallejo@amd.com
Subject: [RFC] xen/x86: allow overlaps with non-RAM regions
Message-ID: <alpine.DEB.2.22.394.2504031755440.3529306@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On one Sapphire AMD x86 board, I see this:


(XEN) [0000003943ca6ff2]  [00000000f0000000, 00000000f7ffffff] (reserved)
(XEN) [00000039460886d9]  [00000000fd000000, 00000000ffffffff] (reserved)
[...]
(XEN) [    4.612235] 0000:02:00.0: not mapping BAR [fea00, fea03] invalid position


Linux boots fine on this platform but Linux as Dom0 on Xen does not.
This is because the pci_check_bar->is_memory_hole check fails due to the
MMIO region overlapping with the EFI reserved region.

While I think ideally this should not happen, as you can imagine users
are never happy when Linux baremetal boots fine, and Linux on Xen does
not.

This patch fixes the boot issue by relaxing the is_memory_hole check.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index b294497a14..afb54d6f0f 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -797,6 +797,9 @@ bool is_memory_hole(mfn_t start, mfn_t end)
         if ( !entry->size )
             continue;
 
+        if ( entry->type > 1 )
+            continue;
+
         /* Do not allow overlaps with any memory range. */
         if ( s <= PFN_DOWN(entry->addr + entry->size - 1) &&
              PFN_DOWN(entry->addr) <= e )

