Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 413CAC46D4D
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 14:18:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158361.1486701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIRn1-0006h8-IZ; Mon, 10 Nov 2025 13:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158361.1486701; Mon, 10 Nov 2025 13:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIRn1-0006fG-Fl; Mon, 10 Nov 2025 13:18:35 +0000
Received: by outflank-mailman (input) for mailman id 1158361;
 Mon, 10 Nov 2025 13:18:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bLcL=5S=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vIRn0-0006fA-1H
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 13:18:34 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id c08857db-be37-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 14:18:32 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7B25497;
 Mon, 10 Nov 2025 05:18:22 -0800 (PST)
Received: from [10.57.39.147] (unknown [10.57.39.147])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D493F3F63F;
 Mon, 10 Nov 2025 05:18:22 -0800 (PST)
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
X-Inumbo-ID: c08857db-be37-11f0-9d18-b5c5bf9af7f9
Message-ID: <d0ce35ad-bfcd-496b-996d-17e59a1d5a73@arm.com>
Date: Mon, 10 Nov 2025 14:18:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/12] powerpc/64s: Do not re-activate batched TLB
 flush
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-2-kevin.brodsky@arm.com>
 <87qzud42n1.ritesh.list@gmail.com>
 <b3e4a92f-5b51-4eee-bfb8-c454add0f0d2@arm.com>
 <87cy5t4b0a.ritesh.list@gmail.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <87cy5t4b0a.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/11/2025 00:35, Ritesh Harjani (IBM) wrote:
> Kevin Brodsky <kevin.brodsky@arm.com> writes:
>
>> [...]
>>
>>> With this analysis - the patch looks good to me. I will give this entire
>>> patch series a try on Power HW with Hash mmu too (which uses lazy mmu and
>>> let you know the results of that)!
>> That'd be very appreciated, thanks a lot!
>>
> I did give this patch series a run on Power10 with Hash MMU. I ran the
> following stress-ng tests and didn't observe any issues (kernel warnings) so far.
>
> stress-ng --all 0 -t 60s --perf -v --verify \
> --tlb-shootdown 0 \
> --fault 0 \
> --userfaultfd 0 \
> --fork 0 \
> --exec 0 \
> --memfd 0 \
> --numa 0 \
> --pkey 0 \
> --remap 0 \
> --vm 0 \
> --rmap 0 \
> -x swap,pagemove
> (Note not all options shown here will work with --verify)

That's great, many thanks!

> Let me know what else I can run for validation?
> Do you know of any specific tests for validation of lazy mmu feature?

I don't think there is - lazy MMU is not supposed to have any observable
effect, all we can do is exercise the paths that use it and check that
nothing explodes.

That said it wouldn't hurt to run the mm kselftests:

    make -C tools/testing/selftests/ TARGETS=mm

Thanks!

- Kevin

