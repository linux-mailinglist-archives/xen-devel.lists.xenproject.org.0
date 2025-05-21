Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A930AABE885
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 02:24:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991332.1375217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHXG8-0007Nv-7u; Wed, 21 May 2025 00:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991332.1375217; Wed, 21 May 2025 00:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHXG8-0007LN-5J; Wed, 21 May 2025 00:24:36 +0000
Received: by outflank-mailman (input) for mailman id 991332;
 Wed, 21 May 2025 00:24:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MrLC=YF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uHXG6-0007LH-K6
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 00:24:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f694d387-35d9-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 02:24:32 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1D1245C3FBB;
 Wed, 21 May 2025 00:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51687C4CEE9;
 Wed, 21 May 2025 00:24:28 +0000 (UTC)
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
X-Inumbo-ID: f694d387-35d9-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747787069;
	bh=kLnz7QqgPBc9fxMyinRffEDp1TUaXN2QfnkNZQs1r3w=;
	h=Date:From:To:cc:Subject:From;
	b=ckdLLw6FFQLepHt0c+9iO0PYG3Px+Z/NuJKK0XXPGnJcxhRfzabf1E18y5MJoqhDT
	 NVpGiHIZ3HwgUHhY81fneYs50AHtQ09TiZ2jHEkoCgnMH6FOGiXDKsp8WWZF1B/bVG
	 bZloA8IcJSMkGc/CmCBgJWDk6bS493AynVPGyB+dS4kyoxfx1Y3pqmpRyy1MYBEcQ/
	 aujLo3Pa3vs9yGANE/a1uJjDvcFyWCnfIQSzw0TcCUp8/Y0Gfifo+JHkEGZIjdSXlf
	 B5tDTmXZzyI0j3pJsqEvYZ1ouuFK2avKWLnzwc+OzwgQMgEhB81wkCEpM6uD2p3ijL
	 k3wusEKUOUbTA==
Date: Tue, 20 May 2025 17:24:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, Jason.Andryuk@amd.com, 
    oleksandr_tyshchenko@epam.com, boris.ostrovsky@oracle.com, 
    Yi.Wang2@amd.com, Xenia.Ragiadakou@amd.com, agarciav@amd.com, 
    julien@xen.org, xen-devel@lists.xenproject.org
Subject: pin_user_pages and foreign mappings error
Message-ID: <alpine.DEB.2.22.394.2505201700220.2019926@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Juergen and all,

We have an issue where QEMU is mapping foreign pages as usual and
passing them to a driver in Linux (amdxdna). The driver in Linux calls
pin_user_pages_fast() on these pages, and it returns -EFAULT. Stack
trace appended below.

This is Dom0 PVH. We disabled CONFIG_XEN_UNPOPULATED_ALLOC and
CONFIG_XEN_BALLOON_MEMORY_HOTPLUG attemping to make things better but it
did not solved the issue. We tried changing pin_user_pages_fast() to
pin_user_pages(), still -EFAULT. check_vma_flags returns -EFAULT because
of the (VM_IO | VM_PFNMAP) check.

We tried removing (VM_IO | VM_PFNMAP) from privcmd_mmap and
xen_xlate_remap_gfn_array based on the idea that the underlying pages
are normal memory once CONFIG_XEN_UNPOPULATED_ALLOC and
CONFIG_XEN_BALLOON_MEMORY_HOTPLUG are disabled.

In this case, vm_normal_page takes the if
(IS_ENABLED(CONFIG_ARCH_HAS_PTE_SPECIAL)) path, none of the checks work,
so it calls print_bad_pte and it breaks.

As another attempt, we tried removing pte_mkspecial from
xlate_mmu.c:remap_pte_fn and remap_pfn_fn, based again on the same idea
that the underlying pages should not be "special". Now it went further
but it broke at unmap_vmas time on a reference counting error. Specifically,
we get "non-zero mapcount" on the callchain from unmap_vmas:

[31789.440433] BUG: Bad page map in process qemu-system-x86  pte:800000018f8a9027 pmd:13c29a067
[31789.440459] page:000000008316c487 refcount:0 mapcount:-1 mapping:0000000000000000 index:0x0 pfn:0x18f8a9
[31789.440461] flags: 0x17ffffc0000214(referenced|dirty|workingset|node=0|zone=2|lastcpupid=0x1fffff)
[31789.440463] page_type: 0xfffffffe()
[31789.440465] raw: 0017ffffc0000214 dead000000000100 dead000000000122 0000000000000000
[31789.440467] raw: 0000000000000000 0000000000000000 00000000fffffffe 0000000000000000
[31789.440468] page dumped because: bad pte
[31789.440469] addr:0000780c1213a000 vm_flags:0c0600fb anon_vma:0000000000000000 mapping:ffff888185672418 index:3a
[31789.440498] file:privcmd fault:privcmd_fault [xen_privcmd] mmap:privcmd_mmap [xen_privcmd] read_folio:0x0

So, it would seem that we need to keep treating foreign mapping pages as
special (pte_mkspecial and also VM_IO | VM_PFNMAP) but if we do that
pin_user_pages() fails.

Do you have any ideas how to get pin_user_pages() to work with foreign
mappings from userspace?

Many thanks for your help!!

Cheers,

Stefano

[ 1645.560295] WARNING: CPU: 5 PID: 3989 at mm/gup.c:229 try_grab_page+0xd7/0x140
[ 1645.560452] CPU: 5 PID: 3989 Comm: qemu-system-x86 Tainted: G    B      OE      6.8.0+ #36
[ 1645.560457] Hardware name: AMD BIRMANPLUS/BirmanPlus-STX, BIOS TXB1001dB 12/09/2024 22:52:15
[ 1645.560459] RIP: 0010:try_grab_page+0xd7/0x140
[ 1645.560463] Code: 00 00 00 be 23 00 00 00 48 c1 e8 36 48 8b 3c c5 a0 3d 04 83 e8 1a 46 fe ff 31 c0 5d 31 d2 31 f6 31 ff 45 31 c0 c3 cc cc cc cc <0f> 0b 41 b8 f4 ff ff ff 44 89 c0 31 d2 31 f6 31 ff 45 31 c0 c3 cc
[ 1645.560467] RSP: 0018:ffffc90004b6b9d0 EFLAGS: 00010286
[ 1645.560470] RAX: ffffea00047559c0 RBX: 0000000000080101 RCX: 0000000000000000
[ 1645.560472] RDX: 00000000ffffffff RSI: 0000000000080101 RDI: ffffea00047559c0
[ 1645.560474] RBP: ffffc90004b6ba20 R08: 0000000000000000 R09: 0000000000000000
[ 1645.560475] R10: 0000000000000000 R11: 0000000000000000 R12: ffff8881252fab40
[ 1645.560476] R13: ffff88818c65c998 R14: ffffea00047559c0 R15: 800000011d567027
[ 1645.560481] FS:  00007283a21d3f80(0000) GS:ffff88827e480000(0000) knlGS:0000000000000000
[ 1645.560483] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1645.560485] CR2: 00007283a0cb4060 CR3: 000000011c986000 CR4: 0000000000750ef0
[ 1645.560490] PKRU: 55555554
[ 1645.560492] Call Trace:
[ 1645.560494]  <TASK>
[ 1645.560499]  ? show_regs+0x72/0x90
[ 1645.560506]  ? try_grab_page+0xd7/0x140
[ 1645.560508]  ? __warn+0x8d/0x160
[ 1645.560512]  ? try_grab_page+0xd7/0x140
[ 1645.560515]  ? report_bug+0x1bb/0x1d0
[ 1645.560520]  ? handle_bug+0x46/0x90
[ 1645.560525]  ? exc_invalid_op+0x19/0x80
[ 1645.560529]  ? asm_exc_invalid_op+0x1b/0x20
[ 1645.560536]  ? try_grab_page+0xd7/0x140
[ 1645.560538]  ? follow_page_pte+0xf1/0x5e0
[ 1645.560541]  follow_page_mask+0x3b5/0x5f0
[ 1645.560544]  ? check_vma_flags+0x1b5/0x290
[ 1645.560547]  __get_user_pages+0x112/0x780
[ 1645.560550]  ? vprintk_emit+0x1ad/0x320
[ 1645.560556]  __gup_longterm_locked+0x231/0xca0
[ 1645.560566]  pin_user_pages+0x78/0xb0
[ 1645.560571]  amdxdna_get_ubuf+0x2c6/0x4d0 [amdxdna]
[ 1645.560667]  amdxdna_gem_create_share_object+0x114/0x170 [amdxdna]
[ 1645.560684]  amdxdna_drm_create_bo_ioctl+0x398/0x5b0 [amdxdna]
[ 1645.560702]  ? __pfx_amdxdna_drm_create_bo_ioctl+0x10/0x10 [amdxdna]
[ 1645.560719]  drm_ioctl_kernel+0xb2/0x110
[ 1645.560727]  drm_ioctl+0x2e2/0x590
[ 1645.560731]  ? __pfx_amdxdna_drm_create_bo_ioctl+0x10/0x10 [amdxdna]
[ 1645.560749]  ? syscall_exit_to_user_mode+0x86/0x260
[ 1645.560753]  ? do_syscall_64+0x93/0x180
[ 1645.560759]  ? __f_unlock_pos+0x12/0x20
[ 1645.560770]  __x64_sys_ioctl+0x9d/0xe0
[ 1645.560775]  do_syscall_64+0x84/0x180
[ 1645.560779]  ? do_syscall_64+0x93/0x180
[ 1645.560784]  ? do_syscall_64+0x93/0x180
[ 1645.560788]  ? irqentry_exit+0x43/0x50
[ 1645.560791]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
[ 1645.560794] RIP: 0033:0x7283a3b1a94f
[ 1645.560798] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
[ 1645.560800] RSP: 002b:00007ffde39d3b50 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[ 1645.560804] RAX: ffffffffffffffda RBX: 00007ffde39d3c10 RCX: 00007283a3b1a94f
[ 1645.560805] RDX: 00007ffde39d3c10 RSI: 00000000c0206443 RDI: 0000000000000030
[ 1645.560807] RBP: 00000000c0206443 R08: 0000000000000000 R09: 00005e5e79219400
[ 1645.560809] R10: 00007283a35ebb90 R11: 0000000000000246 R12: 00005e5e79559750
[ 1645.560810] R13: 0000000000000030 R14: 00005e5e78ef3f20 R15: 00005e5e78ef4310
[ 1645.560814]  </TASK>

>

