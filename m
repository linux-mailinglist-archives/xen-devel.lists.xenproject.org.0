Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1052A6C4E8
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 22:16:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924470.1327640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvjhl-00086B-J6; Fri, 21 Mar 2025 21:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924470.1327640; Fri, 21 Mar 2025 21:15:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvjhl-00084j-GU; Fri, 21 Mar 2025 21:15:01 +0000
Received: by outflank-mailman (input) for mailman id 924470;
 Fri, 21 Mar 2025 21:15:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1L9V=WI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tvjhk-00084d-I4
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 21:15:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88f42ad1-0699-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 22:14:55 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D78C55C2C81;
 Fri, 21 Mar 2025 21:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D33C4CEE3;
 Fri, 21 Mar 2025 21:14:52 +0000 (UTC)
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
X-Inumbo-ID: 88f42ad1-0699-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742591693;
	bh=nry6RGOj3t+aA0Ynv6iUcP6rOyy3pCCnM3x8AElWick=;
	h=Date:From:To:cc:Subject:From;
	b=OLD3B88CRZea6+z8T2IFhLbWFV3C/LHAY4nNYpuhUMl+BAmU64nEwYPZXjl9LfsMH
	 N4ooz8D5lJbTx1HrsoIyUyhb8xKOXCCbJEAj+bGFD/ym/JzKCJ4DC28k+EIP6QGdfL
	 cy1aWO82UK4i53oy3dhw2zeaNeO8CFFegBxnWEILtKuQikzlDlW2K1ANAtdGAJMOqO
	 /1BR0pBBtphPhgUKfy4orvxrhs0AHh/M6zsso9BpL9h+S6PcS23fTN+STVM4UTlyu1
	 H0LjyJ8FM4c+B7oeLQqNovw6usWrw13hbRLvIW81hU/12awTzEYyQ/3XT3dvr7JsjP
	 K69FzfjWxHj7Q==
Date: Fri, 21 Mar 2025 14:14:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm/efi: merge neighboring banks
Message-ID: <alpine.DEB.2.22.394.2503211403040.2325679@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

When booting from U-Boot bootefi, there can be a high number of
neighboring RAM banks. See for example:

(XEN) RAM: 0000000000000000 - 0000000000bfffff
(XEN) RAM: 0000000000c00000 - 0000000000c00fff
(XEN) RAM: 0000000000c01000 - 0000000000dfffff
(XEN) RAM: 0000000000e00000 - 000000000279dfff
(XEN) RAM: 000000000279e000 - 00000000029fffff
(XEN) RAM: 0000000002a00000 - 0000000008379fff
(XEN) RAM: 000000000837a000 - 00000000083fffff
(XEN) RAM: 0000000008400000 - 0000000008518fff
(XEN) RAM: 0000000008519000 - 00000000085fffff
(XEN) RAM: 0000000008600000 - 0000000008613fff
(XEN) RAM: 0000000008614000 - 00000000097fffff
(XEN) RAM: 0000000009800000 - 00000000098a7fff
(XEN) RAM: 00000000098a8000 - 0000000009dfffff
(XEN) RAM: 0000000009e00000 - 0000000009ea7fff
(XEN) RAM: 0000000009ea8000 - 000000001fffffff
(XEN) RAM: 0000000020000000 - 000000002007ffff
(XEN) RAM: 0000000020080000 - 0000000077b17fff
(XEN) RAM: 0000000077b19000 - 0000000077b2bfff
(XEN) RAM: 0000000077b2c000 - 0000000077c8dfff
(XEN) RAM: 0000000077c8e000 - 0000000077c91fff
(XEN) RAM: 0000000077ca7000 - 0000000077caafff
(XEN) RAM: 0000000077cac000 - 0000000077caefff
(XEN) RAM: 0000000077cd0000 - 0000000077cd2fff
(XEN) RAM: 0000000077cd4000 - 0000000077cd7fff
(XEN) RAM: 0000000077cd8000 - 000000007bd07fff
(XEN) RAM: 000000007bd09000 - 000000007fd5ffff
(XEN) RAM: 000000007fd70000 - 000000007fefffff
(XEN) RAM: 0000000800000000 - 000000087fffffff

It is undesirable to keep them separate, as this approach consumes more
resources.

Additionally, Xen does not currently support boot modules that span
multiple banks: at least one of the regions get freed twice. The first
time from setup_mm->populate_boot_allocator, then again from
discard_initial_modules->fw_unreserved_regions. With a high number of
banks, it can be difficult to arrange the boot modules in a way that
avoids spanning across multiple banks.

This small patch merges neighboring regions, to make dealing with them
more efficient, and to make it easier to load boot modules. The patch
also takes the opportunity to check and discard duplicates.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index a80a5a7ab3..f6f23ed5b2 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -163,6 +163,20 @@ static bool __init meminfo_add_bank(struct membanks *mem,
     struct membank *bank;
     paddr_t start = desc->PhysicalStart;
     paddr_t size = desc->NumberOfPages * EFI_PAGE_SIZE;
+    int j;
+
+    for ( j = 0; j < mem->nr_banks; j++ )
+    {
+        if ( mem->bank[j].start == start && mem->bank[j].size == size )
+        {
+            return true;
+        }
+        else if ( mem->bank[j].start + mem->bank[j].size == start )
+        {
+            mem->bank[j].size += size;
+            return true;
+        }
+    }
 
     if ( mem->nr_banks >= mem->max_banks )
         return false;

