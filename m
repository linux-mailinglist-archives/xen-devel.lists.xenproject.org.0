Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD58B4A158
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 07:42:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115821.1462291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvr6D-0006YQ-JB; Tue, 09 Sep 2025 05:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115821.1462291; Tue, 09 Sep 2025 05:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvr6D-0006Vq-GF; Tue, 09 Sep 2025 05:41:01 +0000
Received: by outflank-mailman (input) for mailman id 1115821;
 Tue, 09 Sep 2025 05:41:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bNIZ=3U=linux-foundation.org=akpm@srs-se1.protection.inumbo.net>)
 id 1uvr6C-0006Vk-1s
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 05:41:00 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f13f1ae-8d3f-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 07:40:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0BE5E601EF;
 Tue,  9 Sep 2025 05:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0D0C4CEF4;
 Tue,  9 Sep 2025 05:40:54 +0000 (UTC)
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
X-Inumbo-ID: 8f13f1ae-8d3f-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1757396455;
	bh=fLT6sZq3hOuocdqB+Er3MIxGIa7A226lDCyWybWeKb0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ac3AtU0MqGUoC9Eky+9KyLtx9biLH0jbhomUAhOb9ruR7c2j0fSSNnyF7J5pqgv3k
	 foKu3tqX/cVrmmALEDgQok2HJxXlYlCuqYu52g6qJkaq/U2HxlfxN2JIs/wIPe9xj/
	 lJgOpn+VQzJMFZkYputFzcFbXsTrbwF4GLqtj+KE=
Date: Mon, 8 Sep 2025 22:40:54 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, Alexander Gordeev
 <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar
 <mingo@redhat.com>, Jann Horn <jannh@google.com>, Juergen Gross
 <jgross@suse.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko
 <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Nicholas Piggin
 <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Ryan Roberts
 <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>, Thomas
 Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Will
 Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
Message-Id: <20250908224054.0a1969b493d8a837addd782e@linux-foundation.org>
In-Reply-To: <20250908073931.4159362-3-kevin.brodsky@arm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
	<20250908073931.4159362-3-kevin.brodsky@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  8 Sep 2025 08:39:26 +0100 Kevin Brodsky <kevin.brodsky@arm.com> wrote:

> arch_{enter,leave}_lazy_mmu_mode() currently have a stateless API
> (taking and returning no value). This is proving problematic in
> situations where leave() needs to restore some context back to its
> original state (before enter() was called). In particular, this
> makes it difficult to support the nesting of lazy_mmu sections -
> leave() does not know whether the matching enter() call occurred
> while lazy_mmu was already enabled, and whether to disable it or
> not.
> 
> This patch gives all architectures the chance to store local state
> while inside a lazy_mmu section by making enter() return some value,
> storing it in a local variable, and having leave() take that value.
> That value is typed lazy_mmu_state_t - each architecture defining
> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is free to define it as it sees fit.
> For now we define it as int everywhere, which is sufficient to
> support nesting.
> 
> The diff is unfortunately rather large as all the API changes need
> to be done atomically. Main parts:

This has a build error:

  CC      arch/x86/kernel/asm-offsets.s
In file included from ./arch/x86/include/asm/irqflags.h:102,
                 from ./include/linux/irqflags.h:18,
                 from ./include/linux/spinlock.h:59,
                 from ./include/linux/swait.h:7,
                 from ./include/linux/completion.h:12,
                 from ./include/linux/crypto.h:15,
                 from arch/x86/kernel/asm-offsets.c:9:
./arch/x86/include/asm/paravirt.h: In function 'arch_enter_lazy_mmu_mode':
./arch/x86/include/asm/paravirt.h:534:16: error: 'LAZY_MMU_DEFAULT' undeclared (first use in this function)
  534 |         return LAZY_MMU_DEFAULT;
      |                ^~~~~~~~~~~~~~~~
./arch/x86/include/asm/paravirt.h:534:16: note: each undeclared identifier is re

which gets fixed up later in the series.

