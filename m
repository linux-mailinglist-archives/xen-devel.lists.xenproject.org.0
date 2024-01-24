Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C467D83AEC5
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 17:54:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671164.1044372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSgW0-0000y8-HD; Wed, 24 Jan 2024 16:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671164.1044372; Wed, 24 Jan 2024 16:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSgW0-0000vv-EK; Wed, 24 Jan 2024 16:54:16 +0000
Received: by outflank-mailman (input) for mailman id 671164;
 Wed, 24 Jan 2024 16:54:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LRLw=JC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rSgVz-0000vp-Cq
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 16:54:15 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33c522d3-bad9-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 17:54:14 +0100 (CET)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-7831aacdaffso500299685a.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 08:54:14 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 u15-20020a05620a022f00b00783a46b6f5bsm2312376qkm.27.2024.01.24.08.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 08:54:11 -0800 (PST)
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
X-Inumbo-ID: 33c522d3-bad9-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706115252; x=1706720052; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AN401EloX0DQRhSCQt652byeIy6eWfP+Mah5wo4s254=;
        b=QgiaO2yCU8CwqXfk9/lJjxohvJgk3rCdVqj+3+eeSkv6XRIjs9JDTuvYHXRaVz2Ovg
         hvMu0MWBusvJTXZ0NynJJZlE/7vnOK3pJiqjvTbm8ssN4ndZrwYIuE7COHSJDEvKVQ6R
         yvA710AXjpkbIRHGhDru2UnzWSu2Ded4uXPTLBJ37lALwJhUbI8lxrTEOs1irwBb1bTy
         JyIxIobn81HONT5+OGqiZ577EXs63mDKazDy8T9m/ImicD5kiXeOdGPunoSwr+AFESrz
         6b0jOlmWuqNWvB90sIa04p9XKpDNC7+If4FfWWWxPEse8yw0Jsx5RYqLROl6lvynqHHD
         U1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706115252; x=1706720052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AN401EloX0DQRhSCQt652byeIy6eWfP+Mah5wo4s254=;
        b=ijnjrG5l58U7o8rxQ0XWc99bgsYVr6/N8mCcJ70Y/+1uxWxClMJv5t3hSvizNL1Yrl
         KnoPZ8GAfanryzZbWoeuYv/SxpKJcnzZiSzGTq0DRuGF6fahTA07gBiQAt66KfeFc9kM
         UOfRFL3q2Het9Bh0Wx1Vt6+yhsHD/GLlIUpCEJyaPvc4jTyRHfz2PRa2GURjcKvMMTS7
         0J3Z5LQ/TSt+1+IaUy60++PXgiJAA3nZLBKq/4krh2jmhd+9egDd8wh90p2fG7/pQgeu
         3CBpNXkdYspsjqWVjC7zwulUMQtddu65/qnoB9/Xb4EdWBwzWLEsbS1t69h1b+9E7yMO
         P5CA==
X-Gm-Message-State: AOJu0YyNW1vVM/oAsOOZZzaIeYfWbq+gF5746aIO8PoIVHq4RtuDoHJI
	C1QvBW/tx9IgmbCXRiflAzBZiuvtXAt3cYHWE2OlWABbElW9FKKIq+oIHV49
X-Google-Smtp-Source: AGHT+IHI+p0X72YhrAC3yzs+ukwwIiEZ3TUc+I/Cyi93Zpuufv6VyKhPc9ByCdHS1+HHyzBcocbKDg==
X-Received: by 2002:a05:620a:254a:b0:783:5b45:8570 with SMTP id s10-20020a05620a254a00b007835b458570mr10537546qko.46.1706115251982;
        Wed, 24 Jan 2024 08:54:11 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>
Subject: Linux Xen PV CPA W^X violation false-positives
Date: Wed, 24 Jan 2024 11:54:01 -0500
Message-ID: <20240124165401.35784-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen PV domains show CPA W^X violations like:

CPA detected W^X violation: 0000000000000064 -> 0000000000000067 range: 0xffff888000010000 - 0xffff888000010fff PFN 10
WARNING: CPU: 0 PID: 30 at arch/x86/mm/pat/set_memory.c:613 __change_page_attr_set_clr+0x113a/0x11c0
Modules linked in: xt_physdev xt_MASQUERADE iptable_nat nf_nat nf_conntrack libcrc32c nf_defrag_ipv4 ip_tables x_tables xen_argo(O)
CPU: 0 PID: 30 Comm: kworker/0:2 Tainted: G           O       6.1.38 #1
Workqueue: events bpf_prog_free_deferred
RIP: e030:__change_page_attr_set_clr+0x113a/0x11c0
Code: 4c 89 f1 4c 89 e2 4c 89 d6 4c 89 8d 70 ff ff ff 4d 8d 86 ff 0f 00 00 48 c7 c7 f0 3c da 81 c6 05 d0 0e 0e 01 01 e8 f6 71 00 00 <0f> 0b 4c 8b 8d 70 ff ff ff e9 2a fd ff ff 48 8b 85 60 ff ff ff 48
RSP: e02b:ffffc90000367c48 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 000ffffffffef064 RCX: 0000000000000000
RDX: 0000000000000003 RSI: 00000000fffff7ff RDI: 00000000ffffffff
RBP: ffffc90000367d48 R08: 0000000000000000 R09: ffffc90000367aa0
R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000067
R13: 0000000000000001 R14: ffff888000010000 R15: ffffc90000367d60
FS:  0000000000000000(0000) GS:ffff88800b800000(0000) knlGS:0000000000000000
CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fdbaeda01c0 CR3: 0000000004312000 CR4: 0000000000050660
Call Trace:
 <TASK>
 ? show_regs.cold+0x1a/0x1f
 ? __change_page_attr_set_clr+0x113a/0x11c0
 ? __warn+0x7b/0xc0
 ? __change_page_attr_set_clr+0x113a/0x11c0
 ? report_bug+0x111/0x1a0
 ? handle_bug+0x4d/0xa0
 ? exc_invalid_op+0x19/0x70
 ? asm_exc_invalid_op+0x1b/0x20
 ? __change_page_attr_set_clr+0x113a/0x11c0
 ? __change_page_attr_set_clr+0x113a/0x11c0
 ? debug_smp_processor_id+0x17/0x20
 ? ___cache_free+0x2e/0x1e0
 ? _raw_spin_unlock+0x1e/0x40
 ? __purge_vmap_area_lazy+0x2ea/0x6b0
 set_direct_map_default_noflush+0x7c/0xa0
 __vunmap+0x1ac/0x280
 __vfree+0x1d/0x60
 vfree+0x27/0x40
 __bpf_prog_free+0x44/0x50
 bpf_prog_free_deferred+0x104/0x120
 process_one_work+0x1ca/0x3d0
 ? process_one_work+0x3d0/0x3d0
 worker_thread+0x45/0x3c0
 ? process_one_work+0x3d0/0x3d0
 kthread+0xe2/0x110
 ? kthread_complete_and_exit+0x20/0x20
 ret_from_fork+0x1f/0x30
 </TASK>
---[ end trace 0000000000000000 ]---

Xen provides a set of page tables that the guest executes out of when it
starts.  The L1 entries are shared between level2_ident_pgt and
level2_kernel_pgt, and xen_setup_kernel_pagetable() sets the NX bit in
the level2_ident_pgt entries.  verify_rwx() only checks the l1 entry and
reports a false-positive violation.

Here is a dump of some kernel virtual addresses and the corresponding
L1 and L2 entries:
This is the start of the directmap (ident) and they have NX (bit 63) set
in the PMD.
ndvm-pv (1): [    0.466778] va=ffff888000000000 pte=0010000000000027 level: 1
ndvm-pv (1): [    0.466788] va=ffff888000000000 pmd=800000000242c067 level: 2
Directmap for kernel text:
ndvm-pv (1): [    0.466795] va=ffff888001000000 pte=0010000001000065 level: 1
ndvm-pv (1): [    0.466801] va=ffff888001000000 pmd=8000000002434067 level: 2
ndvm-pv (1): [    0.466807] va=ffff888001010000 pte=0010000001010065 level: 1
ndvm-pv (1): [    0.466814] va=ffff888001010000 pmd=8000000002434067 level: 2
The start of the kernel text highmap is unmapped:
ndvm-pv (1): [    0.466820] va=ffffffff80000000 pte=0000000000000000 level: 3
ndvm-pv (1): [    0.466826] va=ffffffff80000000 pmd=0000000000000000 level: 3
Kernel PMD for .text has NX bit clear
ndvm-pv (1): [    0.466832] va=ffffffff81000000 pte=0010000001000065 level: 1
ndvm-pv (1): [    0.466838] va=ffffffff81000000 pmd=0000000002434067 level: 2
Kernel PTE for rodata_end has NX bit set
ndvm-pv (1): [    0.466846] va=ffffffff81e62000 pte=8010000001e62025 level: 1
ndvm-pv (1): [    0.466874] va=ffffffff81e62000 pmd=000000000243b067 level: 2
Directmap of rodata_end
ndvm-pv (1): [    0.466907] va=ffff888001e62000 pte=8010000001e62025 level: 1
ndvm-pv (1): [    0.466913] va=ffff888001e62000 pmd=800000000243b067 level: 2
Directmap of a low RAM address
ndvm-pv (1): [    0.466920] va=ffff888000010000 pte=0010000000010027 level: 1
ndvm-pv (1): [    0.466926] va=ffff888000010000 pmd=800000000242c067 level: 2
Directmap of another RAM address close to but below kernel text
ndvm-pv (1): [    0.466932] va=ffff88800096c000 pte=001000000096c027 level: 1
ndvm-pv (1): [    0.466938] va=ffff88800096c000 pmd=8000000002430067 level: 2

Here are some L2 entries showing the differing NX bits for l2_ident vs.
l2_kernel while they point at the same L1 addresses
ndvm-pv (1): [    0.466944]  l2_ident[  0] pmd=800000000242c067
ndvm-pv (1): [    0.466949]  l2_ident[  1] pmd=800000000242d067
ndvm-pv (1): [    0.466955]  l2_ident[  8] pmd=8000000002434067
ndvm-pv (1): [    0.466959]  l2_ident[  9] pmd=8000000002435067
ndvm-pv (1): [    0.466964]  l2_ident[ 14] pmd=800000000243a067
ndvm-pv (1): [    0.466969]  l2_ident[ 15] pmd=800000000243b067
ndvm-pv (1): [    0.466974] l2_kernel[  8] pmd=0000000002434067
ndvm-pv (1): [    0.466979] l2_kernel[  9] pmd=0000000002435067
ndvm-pv (1): [    0.466984] l2_kernel[ 14] pmd=000000000243a067
ndvm-pv (1): [    0.466989] l2_kernel[ 15] pmd=000000000243b067

One option is to add a fallback check for verify_rwx() to check the PMD
permissions to silence the warning.  Something like below.  I think it's
not readily generalizable as it hardcodes checking the PMD.  That works
for Xen where L1 PTEs are always used, but wouldn't work for Non-Xen.

The other option would be to duplicate L1 page tables.  Xen PV doesn't
support large pages, so the kernel highmap can't use large pages.  The
increased memory would add up though.

Regards,
Jason
---
 arch/x86/mm/pat/set_memory.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index e9b448d1b1b7..904129b411ee 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -641,6 +641,20 @@ static inline pgprot_t verify_rwx(pgprot_t old, pgprot_t new, unsigned long star
 	if ((pgprot_val(new) & (_PAGE_RW | _PAGE_NX)) != _PAGE_RW)
 		return new;
 
+	if ((pgprot_val(new) & (_PAGE_RW | _PAGE_NX)) == _PAGE_RW) {
+		pmd_t *pmd = lookup_pmd_address(start);
+
+		if (pmd && pmd_val(*pmd) & _PAGE_NX) {
+			pr_debug_once("CPA PMD 0x%016lx NX prevents PTE W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
+				      pmd_flags(*pmd),
+				      (unsigned long long)pgprot_val(old),
+				      (unsigned long long)pgprot_val(new),
+				      start, end, pfn);
+
+			return new;
+		}
+	}
+
 	end = start + npg * PAGE_SIZE - 1;
 	WARN_ONCE(1, "CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
 		  (unsigned long long)pgprot_val(old),
-- 
2.43.0


