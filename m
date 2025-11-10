Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 865F1C45F8D
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 11:38:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158194.1486570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIPH3-0006GZ-99; Mon, 10 Nov 2025 10:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158194.1486570; Mon, 10 Nov 2025 10:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIPH3-0006EQ-2X; Mon, 10 Nov 2025 10:37:25 +0000
Received: by outflank-mailman (input) for mailman id 1158194;
 Mon, 10 Nov 2025 10:37:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bLcL=5S=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vIPH1-0006E1-TK
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 10:37:23 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 3cb6b0b3-be21-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 11:37:21 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEEFE497;
 Mon, 10 Nov 2025 02:37:12 -0800 (PST)
Received: from [10.57.39.147] (unknown [10.57.39.147])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E4913F66E;
 Mon, 10 Nov 2025 02:37:12 -0800 (PST)
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
X-Inumbo-ID: 3cb6b0b3-be21-11f0-9d18-b5c5bf9af7f9
Message-ID: <b21fb5b9-2e7f-4cbc-ae62-015b1317a9bd@arm.com>
Date: Mon, 10 Nov 2025 11:36:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] x86/xen: simplify flush_lazy_mmu()
To: Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org
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
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-3-kevin.brodsky@arm.com>
 <b165098a-8164-4664-aaaf-1e8c4391d797@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <b165098a-8164-4664-aaaf-1e8c4391d797@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/11/2025 12:31, Ryan Roberts wrote:
> On 29/10/2025 10:08, Kevin Brodsky wrote:
>> arch_flush_lazy_mmu_mode() is called when outstanding batched
>> pgtable operations must be completed immediately. There should
>> however be no need to leave and re-enter lazy MMU completely. The
>> only part of that sequence that we really need is xen_mc_flush();
>> call it directly.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> This looks functionally equivalent to me, so:
>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>
> But I don't think this tidy up is strictly necessary for your series to work?
> (perhaps I'll change my mind on that as I go through it).

I initially thought it might be, but in the end I think you're right -
it should still work fine without this patch.

Still, I'd rather avoid unnecessary calls to arch_enter() and
arch_leave() as it makes it harder to reason about what is called where.
Namely, keeping them here means that a nested call to
lazy_mmu_mode_disable() would cause arch_leave() then arch_enter() to be
called - rather unexpected.

The only calls to arch_enter() and arch_leave() that are left after this
series are the ones in <linux/pgtable.h> and the Xen context-switching
logic (the one case where calling arch hooks directly is justified, see
discussion on v3 [1]).

- Kevin

[1]
https://lore.kernel.org/all/390e41ae-4b66-40c1-935f-7a1794ba0b71@arm.com/

