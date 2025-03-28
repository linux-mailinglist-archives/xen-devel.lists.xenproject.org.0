Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D86EEA7461A
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 10:14:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930364.1333019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty5mm-00024V-NY; Fri, 28 Mar 2025 09:13:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930364.1333019; Fri, 28 Mar 2025 09:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty5mm-00022N-Kk; Fri, 28 Mar 2025 09:13:56 +0000
Received: by outflank-mailman (input) for mailman id 930364;
 Fri, 28 Mar 2025 09:13:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HHkx=WP=li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com=agordeev@srs-se1.protection.inumbo.net>)
 id 1ty5mk-0001o1-F3
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 09:13:54 +0000
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown
 [2a02:8070:a484:e780::f9cd])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6e79dad-0bb4-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 10:13:52 +0100 (CET)
Received: from agordeev by li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com
 with local (Exim 4.98.1)
 (envelope-from <agordeev@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>)
 id 1ty5mY-00000001t9d-1CLF; Fri, 28 Mar 2025 10:13:42 +0100
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
X-Inumbo-ID: f6e79dad-0bb4-11f0-9ffa-bf95429c2676
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Hugh Dickins <hughd@google.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Juergen Gross <jgross@suse.com>,
	Jeremy Fitzhardinge <jeremy@goop.org>
Subject: [PATCH 0/4] mm: Fix apply_to_pte_range() vs lazy MMU mode
Date: Fri, 28 Mar 2025 10:13:38 +0100
Message-ID: <cover.1743079720.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Alexander Gordeev <agordeev@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>

Hi All!

On s390 if make arch_enter_lazy_mmu_mode() do preempt_enable() and
arch_leave_lazy_mmu_mode() do preempt_disable() I am getting this:

    [  553.332108] preempt_count: 1, expected: 0
    [  553.332117] no locks held by multipathd/2116.
    [  553.332128] CPU: 24 PID: 2116 Comm: multipathd Kdump: loaded Tainted:
    [  553.332139] Hardware name: IBM 3931 A01 701 (LPAR)
    [  553.332146] Call Trace:
    [  553.332152]  [<00000000158de23a>] dump_stack_lvl+0xfa/0x150 
    [  553.332167]  [<0000000013e10d12>] __might_resched+0x57a/0x5e8 
    [  553.332178]  [<00000000144eb6c2>] __alloc_pages+0x2ba/0x7c0 
    [  553.332189]  [<00000000144d5cdc>] __get_free_pages+0x2c/0x88 
    [  553.332198]  [<00000000145663f6>] kasan_populate_vmalloc_pte+0x4e/0x110 
    [  553.332207]  [<000000001447625c>] apply_to_pte_range+0x164/0x3c8 
    [  553.332218]  [<000000001448125a>] apply_to_pmd_range+0xda/0x318 
    [  553.332226]  [<000000001448181c>] __apply_to_page_range+0x384/0x768 
    [  553.332233]  [<0000000014481c28>] apply_to_page_range+0x28/0x38 
    [  553.332241]  [<00000000145665da>] kasan_populate_vmalloc+0x82/0x98 
    [  553.332249]  [<00000000144c88d0>] alloc_vmap_area+0x590/0x1c90 
    [  553.332257]  [<00000000144ca108>] __get_vm_area_node.constprop.0+0x138/0x260 
    [  553.332265]  [<00000000144d17fc>] __vmalloc_node_range+0x134/0x360 
    [  553.332274]  [<0000000013d5dbf2>] alloc_thread_stack_node+0x112/0x378 
    [  553.332284]  [<0000000013d62726>] dup_task_struct+0x66/0x430 
    [  553.332293]  [<0000000013d63962>] copy_process+0x432/0x4b80 
    [  553.332302]  [<0000000013d68300>] kernel_clone+0xf0/0x7d0 
    [  553.332311]  [<0000000013d68bd6>] __do_sys_clone+0xae/0xc8 
    [  553.332400]  [<0000000013d68dee>] __s390x_sys_clone+0xd6/0x118 
    [  553.332410]  [<0000000013c9d34c>] do_syscall+0x22c/0x328 
    [  553.332419]  [<00000000158e7366>] __do_syscall+0xce/0xf0 
    [  553.332428]  [<0000000015913260>] system_call+0x70/0x98 

I guess, commit b9ef323ea168 ("powerpc/64s: Disable preemption in hash
lazy mmu mode") (albeit not completely) fixed similar issue on PPC:

    apply_to_page_range on kernel pages does not disable preemption, which         
    is a requirement for hash's lazy mmu mode, which keeps track of the            
    TLBs to flush with a per-cpu array.                                            

This series is an attempt to fix the violation of lazy MMU mode context
as described for arch_enter_lazy_mmu_mode():

    This mode can only be entered and left under the protection of  
    the page table locks for all page tables which may be modified.

If I am not mistaken, xen and sparc are also prone to the described
problem, as they use this_cpu_ptr() rather than get_cpu_var().

Take init_mm.page_table_lock for kernel tables to avoid all of that.

Thanks!

Alexander Gordeev (4):
  kasan: Avoid sleepable page allocation from atomic context
  mm: Allow detection of wrong arch_enter_lazy_mmu_mode() context
  mm: Cleanup apply_to_pte_range() routine
  mm: Protect kernel pgtables in apply_to_pte_range()

 include/linux/pgtable.h | 15 ++++++++++++---
 mm/kasan/shadow.c       |  9 +++------
 mm/memory.c             | 33 +++++++++++++++++++++------------
 3 files changed, 36 insertions(+), 21 deletions(-)

-- 
2.45.2


