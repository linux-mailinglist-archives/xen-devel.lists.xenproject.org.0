Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB074725626
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 09:44:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544415.850187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6nq6-0007T7-6E; Wed, 07 Jun 2023 07:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544415.850187; Wed, 07 Jun 2023 07:44:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6nq6-0007Pn-3b; Wed, 07 Jun 2023 07:44:18 +0000
Received: by outflank-mailman (input) for mailman id 544415;
 Wed, 07 Jun 2023 07:44:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VZNY=B3=antgroup.com=houwenlong.hwl@srs-se1.protection.inumbo.net>)
 id 1q6nq4-0007Ph-4a
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 07:44:16 +0000
Received: from out0-216.mail.aliyun.com (out0-216.mail.aliyun.com
 [140.205.0.216]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 168f1fef-0507-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 09:44:12 +0200 (CEST)
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com
 fp:SMTPD_---.TNbNmQf_1686123841) by smtp.aliyun-inc.com;
 Wed, 07 Jun 2023 15:44:02 +0800
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
X-Inumbo-ID: 168f1fef-0507-11ee-8611-37d641c3527e
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047198;MF=houwenlong.hwl@antgroup.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---.TNbNmQf_1686123841;
Date: Wed, 07 Jun 2023 15:44:01 +0800
From: "Hou Wenlong" <houwenlong.hwl@antgroup.com>
To: linux-kernel@vger.kernel.org
Cc: "Lai Jiangshan" <jiangshan.ljs@antgroup.com>,
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
Subject: Re: [PATCH RFC 0/4] x86/fixmap: Unify FIXADDR_TOP
Message-ID: <20230607074401.GA53666@k08j02272.eu95sqa>
References: <cover.1684137557.git.houwenlong.hwl@antgroup.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1684137557.git.houwenlong.hwl@antgroup.com>
User-Agent: Mutt/1.5.21 (2010-09-15)

On Mon, May 15, 2023 at 04:19:31PM +0800, Hou Wenlong wrote:
> This patchset unifies FIXADDR_TOP as a variable for x86, allowing the
> fixmap area to be movable and relocated with the kernel image in the
> x86/PIE patchset [0]. This enables the kernel image to be relocated in
> the top 512G of the address space.
> 
> [0] https://lore.kernel.org/lkml/cover.1682673542.git.houwenlong.hwl@antgroup.com
> 
> Hou Wenlong (4):
>   x86/vsyscall: Don't use set_fixmap() to map vsyscall page
>   x86/xen: Pin up to VSYSCALL_ADDR when vsyscall page is out of fixmap
>     area
>   x86/fixmap: Move vsyscall page out of fixmap area
>   x86/fixmap: Unify FIXADDR_TOP
> 
>  arch/x86/entry/vsyscall/vsyscall_64.c |  7 +-----
>  arch/x86/include/asm/fixmap.h         | 28 ++++-------------------
>  arch/x86/include/asm/paravirt.h       |  7 ++++++
>  arch/x86/include/asm/paravirt_types.h |  4 ++++
>  arch/x86/include/asm/vsyscall.h       | 13 +++++++++++
>  arch/x86/kernel/head64.c              |  1 -
>  arch/x86/kernel/head_64.S             |  6 ++---
>  arch/x86/kernel/paravirt.c            |  4 ++++
>  arch/x86/mm/dump_pagetables.c         |  3 ++-
>  arch/x86/mm/fault.c                   |  1 -
>  arch/x86/mm/init_64.c                 |  2 +-
>  arch/x86/mm/ioremap.c                 |  5 ++---
>  arch/x86/mm/pgtable.c                 | 13 +++++++++++
>  arch/x86/mm/pgtable_32.c              |  3 ---
>  arch/x86/xen/mmu_pv.c                 | 32 +++++++++++++++++++--------
>  15 files changed, 77 insertions(+), 52 deletions(-)
> 
> 
> base-commit: f585d5177e1aad174fd6da0e3936b682ed58ced0
> --
> 2.31.1
Hi,

Just wanted to send a kind ping on this patchset.

Thanks.

