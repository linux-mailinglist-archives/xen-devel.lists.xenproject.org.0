Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 058A4702706
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 10:20:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534601.831748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyTRK-0000c8-EE; Mon, 15 May 2023 08:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534601.831748; Mon, 15 May 2023 08:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyTRK-0000Zh-BI; Mon, 15 May 2023 08:20:18 +0000
Received: by outflank-mailman (input) for mailman id 534601;
 Mon, 15 May 2023 08:20:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oWdR=BE=antgroup.com=houwenlong.hwl@srs-se1.protection.inumbo.net>)
 id 1pyTRI-0000Zb-QS
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 08:20:16 +0000
Received: from out0-199.mail.aliyun.com (out0-199.mail.aliyun.com
 [140.205.0.199]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f8ed683-f2f9-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 10:20:13 +0200 (CEST)
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com
 fp:SMTPD_---.T2DpdLD_1684138803) by smtp.aliyun-inc.com;
 Mon, 15 May 2023 16:20:04 +0800
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
X-Inumbo-ID: 4f8ed683-f2f9-11ed-b229-6b7b168915f2
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047212;MF=houwenlong.hwl@antgroup.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---.T2DpdLD_1684138803;
From: "Hou Wenlong" <houwenlong.hwl@antgroup.com>
To: linux-kernel@vger.kernel.org
Cc: "Lai Jiangshan" <jiangshan.ljs@antgroup.com>,
  "Hou Wenlong" <houwenlong.hwl@antgroup.com>,
  "Alexey Makhalov" <amakhalov@vmware.com>,
  "Andrew Morton" <akpm@linux-foundation.org>,
  "Andy Lutomirski" <luto@kernel.org>,
  "Anshuman Khandual" <anshuman.khandual@arm.com>,
  "Borislav Petkov" <bp@alien8.de>,
  "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
  "Brian Gerst" <brgerst@gmail.com>,
  "Dave Hansen" <dave.hansen@linux.intel.com>,
  "David Woodhouse" <dwmw@amazon.co.uk>,
  "H. Peter Anvin" <hpa@zytor.com>,
  "Ingo Molnar" <mingo@redhat.com>,
  "Josh Poimboeuf" <jpoimboe@kernel.org>,
  "Juergen Gross" <jgross@suse.com>,
  "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
  "=?UTF-8?B?TWlrZSBSYXBvcG9ydCAoSUJNKQ==?=" <rppt@kernel.org>,
  "Pasha Tatashin" <pasha.tatashin@soleen.com>,
  "Peter Zijlstra" <peterz@infradead.org>,
  "=?UTF-8?B?U3JpdmF0c2EgUy4gQmhhdCAoVk13YXJlKQ==?=" <srivatsa@csail.mit.edu>,
  "Suren Baghdasaryan" <surenb@google.com>,
  "Thomas Gleixner" <tglx@linutronix.de>,
  "Usama Arif" <usama.arif@bytedance.com>,
   <virtualization@lists.linux-foundation.org>,
  "VMware PV-Drivers Reviewers" <pv-drivers@vmware.com>,
   <x86@kernel.org>,
   <xen-devel@lists.xenproject.org>
Subject: [PATCH RFC 0/4] x86/fixmap: Unify FIXADDR_TOP
Date: Mon, 15 May 2023 16:19:31 +0800
Message-Id: <cover.1684137557.git.houwenlong.hwl@antgroup.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset unifies FIXADDR_TOP as a variable for x86, allowing the
fixmap area to be movable and relocated with the kernel image in the
x86/PIE patchset [0]. This enables the kernel image to be relocated in
the top 512G of the address space.

[0] https://lore.kernel.org/lkml/cover.1682673542.git.houwenlong.hwl@antgroup.com

Hou Wenlong (4):
  x86/vsyscall: Don't use set_fixmap() to map vsyscall page
  x86/xen: Pin up to VSYSCALL_ADDR when vsyscall page is out of fixmap
    area
  x86/fixmap: Move vsyscall page out of fixmap area
  x86/fixmap: Unify FIXADDR_TOP

 arch/x86/entry/vsyscall/vsyscall_64.c |  7 +-----
 arch/x86/include/asm/fixmap.h         | 28 ++++-------------------
 arch/x86/include/asm/paravirt.h       |  7 ++++++
 arch/x86/include/asm/paravirt_types.h |  4 ++++
 arch/x86/include/asm/vsyscall.h       | 13 +++++++++++
 arch/x86/kernel/head64.c              |  1 -
 arch/x86/kernel/head_64.S             |  6 ++---
 arch/x86/kernel/paravirt.c            |  4 ++++
 arch/x86/mm/dump_pagetables.c         |  3 ++-
 arch/x86/mm/fault.c                   |  1 -
 arch/x86/mm/init_64.c                 |  2 +-
 arch/x86/mm/ioremap.c                 |  5 ++---
 arch/x86/mm/pgtable.c                 | 13 +++++++++++
 arch/x86/mm/pgtable_32.c              |  3 ---
 arch/x86/xen/mmu_pv.c                 | 32 +++++++++++++++++++--------
 15 files changed, 77 insertions(+), 52 deletions(-)


base-commit: f585d5177e1aad174fd6da0e3936b682ed58ced0
--
2.31.1


