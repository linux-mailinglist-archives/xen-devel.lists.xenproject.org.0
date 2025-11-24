Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E578C80F05
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 15:12:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171139.1496167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNXIO-0000Wk-8I; Mon, 24 Nov 2025 14:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171139.1496167; Mon, 24 Nov 2025 14:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNXIO-0000VM-5c; Mon, 24 Nov 2025 14:12:00 +0000
Received: by outflank-mailman (input) for mailman id 1171139;
 Mon, 24 Nov 2025 14:11:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AmBg=6A=kernel.org=david@srs-se1.protection.inumbo.net>)
 id 1vNXIM-0007fZ-Ln
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 14:11:58 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88c0e084-c93f-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 15:11:56 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 123B2601A7;
 Mon, 24 Nov 2025 14:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE78BC116C6;
 Mon, 24 Nov 2025 14:11:46 +0000 (UTC)
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
X-Inumbo-ID: 88c0e084-c93f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763993515;
	bh=pKRds4IT+BzPKh2fxA3wO0tgnvzHdhCWGBCp+0CwG9A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TjUGt8Li6YfogSyMUKImhk9t7zCEyR/5lyaBjeNw6RcKDKrbRq6HnmNGUOxqptBCd
	 dLRr5vxSkWtTK/HdcfyyhBGI6jbvcRygLDwJPNmugo/e/qBVwdADZJpApwewQnH0Lz
	 Zvd3xoS+6vTxsekxWrHLixtrCO8PmynL3TGa54AYYvreiAeQp5nXHtEPY83/MIXq9v
	 IDvhAooUaPXLRXgkrwnbgHUW6P169b7ay8AKZtPjbmGcLHflIqg6kF1HvRTZ7a8+u+
	 51pYm9HXbc2JA+xZLuh0Y9NS3lb+de9hbRLWFhjCNgsTJpUFrYKe7BdliclaVXA64P
	 5nWYBjsK1rt0g==
Message-ID: <9800804f-6e8a-4d08-8eb1-f114df6d6b7a@kernel.org>
Date: Mon, 24 Nov 2025 15:11:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/12] mm: bail out of lazy_mmu_mode_* in interrupt
 context
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
 <20251124132228.622678-8-kevin.brodsky@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251124132228.622678-8-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/25 14:22, Kevin Brodsky wrote:
> The lazy MMU mode cannot be used in interrupt context. This is
> documented in <linux/pgtable.h>, but isn't consistently handled
> across architectures.
> 
> arm64 ensures that calls to lazy_mmu_mode_* have no effect in
> interrupt context, because such calls do occur in certain
> configurations - see commit b81c688426a9 ("arm64/mm: Disable barrier
> batching in interrupt contexts"). Other architectures do not check
> this situation, most likely because it hasn't occurred so far.
> 
> Let's handle this in the new generic lazy_mmu layer, in the same
> fashion as arm64: bail out of lazy_mmu_mode_* if in_interrupt().
> Also remove the arm64 handling that is now redundant.
> 
> Both arm64 and x86/Xen also ensure that any lazy MMU optimisation is
> disabled while in interrupt (see queue_pte_barriers() and
> xen_get_lazy_mode() respectively). This will be handled in the
> generic layer in a subsequent patch.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---

(resending as I pushed the wrong button there ...)

Moving this patch earlier LGTM, hoping we don't get any unexpected
surprises ...

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>

-- 
Cheers

David

