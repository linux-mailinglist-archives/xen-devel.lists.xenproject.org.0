Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F1EAA0374
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 08:33:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971400.1359863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9eX9-0007Tp-8p; Tue, 29 Apr 2025 06:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971400.1359863; Tue, 29 Apr 2025 06:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9eX9-0007MZ-4r; Tue, 29 Apr 2025 06:33:35 +0000
Received: by outflank-mailman (input) for mailman id 971400;
 Tue, 29 Apr 2025 04:06:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGTB=XP=kernel.org=devnull+chenlinxuan.uniontech.com@srs-se1.protection.inumbo.net>)
 id 1u9cEh-0003lQ-Aq
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 04:06:23 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4dbd5f53-24af-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 06:06:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 637724A2F1;
 Tue, 29 Apr 2025 04:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 469C7C4CEF3;
 Tue, 29 Apr 2025 04:06:17 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 3A16FC369CB;
 Tue, 29 Apr 2025 04:06:17 +0000 (UTC)
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
X-Inumbo-ID: 4dbd5f53-24af-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745899577;
	bh=puwaWg0YW0DjsEBEYIoY8x/bLms2MxI/ob3ZfklRDPw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=c0NlFGD/nhB9z6/D4xtydBdI9lJs5L3xbB+eo5cTRMg4n9RpEdjaAhdvc2frC/XoC
	 5Lj5jHazpgfih7eU9Ip8zL87n2W5/Y7Xl7J5MUrNvUFI2sb3RB4BqU5pWTALmAZxrL
	 regj0Ag6HkRUHS3xBvMdE2pb2vrLgesn1qt2AbGY8HXFnjIdmTVcNrNrmloKS1de70
	 gu28EB9CLlaP68ai4PHXtKJqNUO/eYwYJM4vU8DspesAceo2GgBqak5RBzqxLyJenI
	 KBmESNyXPRuCOOdoZcRlGFtuk67AXj0qsy35tYZK+DJvG69bCPTNEcNR9Ad1mpMaJl
	 Y5LlZLpxc/FHA==
From: Chen Linxuan via B4 Relay <devnull+chenlinxuan.uniontech.com@kernel.org>
Date: Tue, 29 Apr 2025 12:06:11 +0800
Subject: [PATCH RFC v3 7/8] x86/xen: add __init for xen_pgd_walk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-noautoinline-v3-7-4c49f28ea5b5@uniontech.com>
References: <20250429-noautoinline-v3-0-4c49f28ea5b5@uniontech.com>
In-Reply-To: <20250429-noautoinline-v3-0-4c49f28ea5b5@uniontech.com>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, 
 Kevin Tian <kevin.tian@intel.com>, 
 Alex Williamson <alex.williamson@redhat.com>, 
 Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Peter Zijlstra <peterz@infradead.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Juergen Gross <jgross@suse.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, kvm@vger.kernel.org, virtualization@lists.linux.dev, 
 linux-integrity@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, Winston Wen <wentao@uniontech.com>, 
 kasan-dev@googlegroups.com, xen-devel@lists.xenproject.org, 
 Chen Linxuan <chenlinxuan@uniontech.com>, 
 Changbin Du <changbin.du@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=chenlinxuan@uniontech.com; h=from:subject:message-id;
 bh=lLv+eC36iR+BfXD2pJvuB8T7k1wRLfuYuYg6Rtr4yeI=;
 b=owEBbQKS/ZANAwAKAXYe5hQ5ma6LAcsmYgBoEFA0cu56sCmDMkf/pntxUHuMuekP/XRkxukwU
 9g4TyNMqLaJAjMEAAEKAB0WIQTO1VElAk6xdvy0ZVp2HuYUOZmuiwUCaBBQNAAKCRB2HuYUOZmu
 i6oqEACNTdOu+wT9VWzDqaJxYPJzTDzhyaDgOrIaxGP72CExKq84a645B1Jl3TWZN1v4YEQN+Ex
 U4BBfSuuQ9Yh0TKak7F0oJPgeJp4PeTVBP15tbocmZJmYUHXdJX5kcB6+MgIe90/7/tlKRXQlN5
 uY8GMIazOdRrWgafA6k6G+0lJvn3E3R5v7129rFXvHWCYC7Nvp2Vr8gyxE2IYJVHEfZx/+ua0oe
 z4a0WQgFS0t6W9PacgGnUTntuj/TGKVYb500Jwut0dBDJITdWXpackuvyCzviwumgxcGnbW66J/
 sPOW9GIhrql6r3JIF1vU1iTJ1wxWyv8Al2Yy2Y7j9ypL0F07+xTB5euDs2A9h8HHd2x+0MwnqRD
 4T62VOpuvuHAy1CMHBv75g1GHhwTGMN1KwfuI0Pf0TXrf9JM01deVHQ7vjI5kZhyeYMl537pJVJ
 0itemi/gfnvcGViZ8usYXjp9yKtWO3JsSCn31sNT7BwsAtjyIUQl+DeQyQADc9wUchfIkTRw2AT
 nXmGd9l2kspY+Bd3KtnokiL1Gm1q49EmDFnwJw+FvsjxRdcZ56x9pI1MXcoOzCJNGSxYn35Witw
 vt49LNms8G/08qnrm3qBl6k+q0+gMBVS+JCmJst68knEU97MDg5chkLEEiEkEAzZLrlhGHN4eU8
 gFY2uFKRqDDEdqA==
X-Developer-Key: i=chenlinxuan@uniontech.com; a=openpgp;
 fpr=D818ACDD385CAE92D4BAC01A6269794D24791D21
X-Endpoint-Received: by B4 Relay for chenlinxuan@uniontech.com/default with
 auth_id=380
X-Original-From: Chen Linxuan <chenlinxuan@uniontech.com>
Reply-To: chenlinxuan@uniontech.com

From: Chen Linxuan <chenlinxuan@uniontech.com>

Presume that kernel is compiled for x86_64 with gcc version 13.3.0:

  make allmodconfig
  make KCFLAGS="-fno-inline-small-functions -fno-inline-functions-called-once"

This results a modpost warning:

  WARNING: modpost: vmlinux: section mismatch in reference: xen_pgd_walk+0x42 (section: .text) -> xen_mark_pinned (section: .init.text)

As xen_pgd_walk is only referenced in xen_after_bootmem(void) which is
also in .init.text, I add __init for xen_pgd_walk to fix this issue.

Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
---
 arch/x86/xen/mmu_pv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 38971c6dcd4b78b6b14f51bc69c4bf6b70ebd622..53650888be0a7b1dba170a5b7ba9c654244b5125 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -696,7 +696,7 @@ static void __xen_pgd_walk(struct mm_struct *mm, pgd_t *pgd,
 	(*func)(mm, virt_to_page(pgd), PT_PGD);
 }
 
-static void xen_pgd_walk(struct mm_struct *mm,
+static void __init xen_pgd_walk(struct mm_struct *mm,
 			 void (*func)(struct mm_struct *mm, struct page *,
 				      enum pt_level),
 			 unsigned long limit)

-- 
2.43.0



