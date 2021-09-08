Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C71C403586
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 09:36:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181551.328713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNs8V-0005b9-AX; Wed, 08 Sep 2021 07:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181551.328713; Wed, 08 Sep 2021 07:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNs8V-0005ZE-73; Wed, 08 Sep 2021 07:36:47 +0000
Received: by outflank-mailman (input) for mailman id 181551;
 Wed, 08 Sep 2021 07:36:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RTps=N6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mNs8T-0005Z4-Ms
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 07:36:45 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f760927-54e6-4e74-bf2a-f9169fa9ec97;
 Wed, 08 Sep 2021 07:36:44 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2C5C420002;
 Wed,  8 Sep 2021 07:36:43 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id C194613721;
 Wed,  8 Sep 2021 07:36:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id OfMuLQpoOGElRgAAGKfGzw
 (envelope-from <jgross@suse.com>); Wed, 08 Sep 2021 07:36:42 +0000
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
X-Inumbo-ID: 5f760927-54e6-4e74-bf2a-f9169fa9ec97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631086603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Z+WndBSU3C8fZ88DpLGMyx1R2eYI/u6zm2djOHlAuhI=;
	b=Gxv+cR175RWwcar+tgco/LV9K7gZvM79EFqyhBr+f3UXoCEbLE/QUAkRS6fNiZ7lBQkSJu
	zF92+gHGNw1F6qIchk8eh/7NlH3reksuw4VWG2W/5DQu0IkjV76wlvPNl12TKkDJUr4LqG
	HjIAEFm6aGO7BCxqzOKpy69FZalwFK8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	stable@vger.kernel.org,
	Sander Eikelenboom <linux@eikelenboom.it>
Subject: [PATCH] xen: fix usage of pmd/pud_poplulate in mremap for pv guests
Date: Wed,  8 Sep 2021 09:36:40 +0200
Message-Id: <20210908073640.11299-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 0881ace292b662 ("mm/mremap: use pmd/pud_poplulate to update page
table entries") introduced a regression when running as Xen PV guest.

Today pmd/pud_poplulate() for Xen PV assumes that the PFN inserted is
referencing a not yet used page table. In case of move_normal_pmd/pud()
this is not true, resulting in WARN splats like:

[34321.304270] ------------[ cut here ]------------
[34321.304277] WARNING: CPU: 0 PID: 23628 at arch/x86/xen/multicalls.c:102 xen_mc_flush+0x176/0x1a0
[34321.304288] Modules linked in:
[34321.304291] CPU: 0 PID: 23628 Comm: apt-get Not tainted 5.14.1-20210906-doflr-mac80211debug+ #1
[34321.304294] Hardware name: MSI MS-7640/890FXA-GD70 (MS-7640)  , BIOS V1.8B1 09/13/2010
[34321.304296] RIP: e030:xen_mc_flush+0x176/0x1a0
[34321.304300] Code: 89 45 18 48 c1 e9 3f 48 89 ce e9 20 ff ff ff e8 60 03 00 00 66 90 5b 5d 41 5c 41 5d c3 48 c7 45 18 ea ff ff ff be 01 00 00 00 <0f> 0b 8b 55 00 48 c7 c7 10 97 aa 82 31 db 49 c7 c5 38 97 aa 82 65
[34321.304303] RSP: e02b:ffffc90000a97c90 EFLAGS: 00010002
[34321.304305] RAX: ffff88807d416398 RBX: ffff88807d416350 RCX: ffff88807d416398
[34321.304306] RDX: 0000000000000001 RSI: 0000000000000001 RDI: deadbeefdeadf00d
[34321.304308] RBP: ffff88807d416300 R08: aaaaaaaaaaaaaaaa R09: ffff888006160cc0
[34321.304309] R10: deadbeefdeadf00d R11: ffffea000026a600 R12: 0000000000000000
[34321.304310] R13: ffff888012f6b000 R14: 0000000012f6b000 R15: 0000000000000001
[34321.304320] FS:  00007f5071177800(0000) GS:ffff88807d400000(0000) knlGS:0000000000000000
[34321.304322] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[34321.304323] CR2: 00007f506f542000 CR3: 00000000160cc000 CR4: 0000000000000660
[34321.304326] Call Trace:
[34321.304331]  xen_alloc_pte+0x294/0x320
[34321.304334]  move_pgt_entry+0x165/0x4b0
[34321.304339]  move_page_tables+0x6fa/0x8d0
[34321.304342]  move_vma.isra.44+0x138/0x500
[34321.304345]  __x64_sys_mremap+0x296/0x410
[34321.304348]  do_syscall_64+0x3a/0x80
[34321.304352]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[34321.304355] RIP: 0033:0x7f507196301a
[34321.304358] Code: 73 01 c3 48 8b 0d 76 0e 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 49 89 ca b8 19 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 46 0e 0c 00 f7 d8 64 89 01 48
[34321.304360] RSP: 002b:00007ffda1eecd38 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
[34321.304362] RAX: ffffffffffffffda RBX: 000056205f950f30 RCX: 00007f507196301a
[34321.304363] RDX: 0000000001a00000 RSI: 0000000001900000 RDI: 00007f506dc56000
[34321.304364] RBP: 0000000001a00000 R08: 0000000000000010 R09: 0000000000000004
[34321.304365] R10: 0000000000000001 R11: 0000000000000246 R12: 00007f506dc56060
[34321.304367] R13: 00007f506dc56000 R14: 00007f506dc56060 R15: 000056205f950f30
[34321.304368] ---[ end trace a19885b78fe8f33e ]---
[34321.304370] 1 of 2 multicall(s) failed: cpu 0
[34321.304371]   call  2: op=12297829382473034410 arg=[aaaaaaaaaaaaaaaa] result=-22

Fix that by modifying xen_alloc_ptpage() to only pin the page table in
case it wasn't pinned already.

Fixes: 0881ace292b662 ("mm/mremap: use pmd/pud_poplulate to update page table entries")
Cc: <stable@vger.kernel.org>
Reported-by: Sander Eikelenboom <linux@eikelenboom.it>
Tested-by: Sander Eikelenboom <linux@eikelenboom.it>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/mmu_pv.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 1df5f01529e5..8d751939c6f3 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -1518,14 +1518,17 @@ static inline void xen_alloc_ptpage(struct mm_struct *mm, unsigned long pfn,
 	if (pinned) {
 		struct page *page = pfn_to_page(pfn);
 
-		if (static_branch_likely(&xen_struct_pages_ready))
+		pinned = false;
+		if (static_branch_likely(&xen_struct_pages_ready)) {
+			pinned = PagePinned(page);
 			SetPagePinned(page);
+		}
 
 		xen_mc_batch();
 
 		__set_pfn_prot(pfn, PAGE_KERNEL_RO);
 
-		if (level == PT_PTE && USE_SPLIT_PTE_PTLOCKS)
+		if (level == PT_PTE && USE_SPLIT_PTE_PTLOCKS && !pinned)
 			__pin_pagetable_pfn(MMUEXT_PIN_L1_TABLE, pfn);
 
 		xen_mc_issue(PARAVIRT_LAZY_MMU);
-- 
2.26.2


