Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFC7C80ED2
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 15:10:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171117.1496147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNXGa-0007i1-KI; Mon, 24 Nov 2025 14:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171117.1496147; Mon, 24 Nov 2025 14:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNXGa-0007gQ-HD; Mon, 24 Nov 2025 14:10:08 +0000
Received: by outflank-mailman (input) for mailman id 1171117;
 Mon, 24 Nov 2025 14:10:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AmBg=6A=kernel.org=david@srs-se1.protection.inumbo.net>)
 id 1vNXGZ-0007fZ-8J
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 14:10:07 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43ad20c2-c93f-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 15:10:01 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8396A4195B;
 Mon, 24 Nov 2025 14:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F1F8C116C6;
 Mon, 24 Nov 2025 14:09:50 +0000 (UTC)
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
X-Inumbo-ID: 43ad20c2-c93f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763993399;
	bh=TWEkufK+gYKT1sSMXcHmAUd4hn/Rf+NblbWiRzqjYXE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fn+KCCRjb50rns8DRSbP5eHwsxgoY/Kml4PeEgcCJeD26M9vYXui7/aT7inSMbIxf
	 YzKx3Oxi12/SHccP4zqiAZBpkawAjBIrdIq6ojtNJ3MqzZIZs/6LWUcWZiW8b0FuJE
	 Ml+dVSCPPiz4nA0kHauPvd8caafMtHO4bKeEncACk6GoCcx0j21HPCEQRfm6P0giCM
	 Ly/blKcvqn2emQo6jii0GCNdl30wtJ7h2LuC/4FBTV86yMpoaQeq2/Vb5EVoAwqxwk
	 Ook4PMLPReVXf+dc0dSemeN/A7u7VMwVtjwjGYoNs7r8xWNS2kh156oqM6wjxrgdtJ
	 4TjfjsfNIahLg==
Message-ID: <886f8f49-f113-445f-8f1e-3cdaabf7b38d@kernel.org>
Date: Mon, 24 Nov 2025 15:09:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] mm: enable lazy_mmu sections to nest
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-9-kevin.brodsky@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251124132228.622678-9-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/24/25 14:22, Kevin Brodsky wrote:
> Despite recent efforts to prevent lazy_mmu sections from nesting, it
> remains difficult to ensure that it never occurs - and in fact it
> does occur on arm64 in certain situations (CONFIG_DEBUG_PAGEALLOC).
> Commit 1ef3095b1405 ("arm64/mm: Permit lazy_mmu_mode to be nested")
> made nesting tolerable on arm64, but without truly supporting it:
> the inner call to leave() disables the batching optimisation before
> the outer section ends.
> 
> This patch actually enables lazy_mmu sections to nest by tracking
> the nesting level in task_struct, in a similar fashion to e.g.
> pagefault_{enable,disable}(). This is fully handled by the generic
> lazy_mmu helpers that were recently introduced.
> 
> lazy_mmu sections were not initially intended to nest, so we need to
> clarify the semantics w.r.t. the arch_*_lazy_mmu_mode() callbacks.
> This patch takes the following approach:
> 
> * The outermost calls to lazy_mmu_mode_{enable,disable}() trigger
>    calls to arch_{enter,leave}_lazy_mmu_mode() - this is unchanged.
> 
> * Nested calls to lazy_mmu_mode_{enable,disable}() are not forwarded
>    to the arch via arch_{enter,leave} - lazy MMU remains enabled so
>    the assumption is that these callbacks are not relevant. However,
>    existing code may rely on a call to disable() to flush any batched
>    state, regardless of nesting. arch_flush_lazy_mmu_mode() is
>    therefore called in that situation.
> 
> A separate interface was recently introduced to temporarily pause
> the lazy MMU mode: lazy_mmu_mode_{pause,resume}(). pause() fully
> exits the mode *regardless of the nesting level*, and resume()
> restores the mode at the same nesting level.
> 
> pause()/resume() are themselves allowed to nest, so we actually
> store two nesting levels in task_struct: enable_count and
> pause_count. A new helper in_lazy_mmu_mode() is introduced to
> determine whether we are currently in lazy MMU mode; this will be
> used in subsequent patches to replace the various ways arch's
> currently track whether the mode is enabled.
> 
> In summary (enable/pause represent the values *after* the call):
> 
> lazy_mmu_mode_enable()		-> arch_enter()	    enable=1 pause=0
>      lazy_mmu_mode_enable()	-> ø		    enable=2 pause=0
> 	lazy_mmu_mode_pause()	-> arch_leave()     enable=2 pause=1
> 	lazy_mmu_mode_resume()	-> arch_enter()     enable=2 pause=0
>      lazy_mmu_mode_disable()	-> arch_flush()     enable=1 pause=0
> lazy_mmu_mode_disable()		-> arch_leave()     enable=0 pause=0
> 
> Note: in_lazy_mmu_mode() is added to <linux/sched.h> to allow arch
> headers included by <linux/pgtable.h> to use it.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>

Nothing jumped at me, so

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>

Hoping we can get some more eyes to have a look.

-- 
Cheers

David

