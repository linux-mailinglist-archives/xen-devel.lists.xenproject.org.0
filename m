Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED576C063E2
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 14:26:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150217.1481453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCGs3-0002al-KY; Fri, 24 Oct 2025 12:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150217.1481453; Fri, 24 Oct 2025 12:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCGs3-0002Y6-Gr; Fri, 24 Oct 2025 12:26:15 +0000
Received: by outflank-mailman (input) for mailman id 1150217;
 Fri, 24 Oct 2025 12:26:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rNzd=5B=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vCGjc-0006Wk-Us
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 12:17:32 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 69f51a0c-b0d3-11f0-980a-7dc792cee155;
 Fri, 24 Oct 2025 14:17:31 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA3FF1515;
 Fri, 24 Oct 2025 05:17:22 -0700 (PDT)
Received: from [10.44.160.74] (e126510-lin.lund.arm.com [10.44.160.74])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38C343F66E;
 Fri, 24 Oct 2025 05:17:23 -0700 (PDT)
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
X-Inumbo-ID: 69f51a0c-b0d3-11f0-980a-7dc792cee155
Message-ID: <35df96ba-a004-4eb4-8d26-5935892a852c@arm.com>
Date: Fri, 24 Oct 2025 14:17:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/13] mm: introduce arch_wants_lazy_mmu_mode()
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-14-kevin.brodsky@arm.com>
 <3d6bba2d-9739-41d0-8f3a-f8b11620c33f@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <3d6bba2d-9739-41d0-8f3a-f8b11620c33f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/10/2025 22:10, David Hildenbrand wrote:
> On 15.10.25 10:27, Kevin Brodsky wrote:
>> powerpc decides at runtime whether the lazy MMU mode should be used.
>>
>> To avoid the overhead associated with managing
>> task_struct::lazy_mmu_state if the mode isn't used, introduce
>> arch_wants_lazy_mmu_mode() and bail out of lazy_mmu_mode_* if it
>> returns false. Add a default definition returning true, and an
>> appropriate implementation for powerpc.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>> This patch seemed like a good idea to start with, but now I'm not so
>> sure that the churn added to the generic layer is worth it.
>
> Exactly my thoughts :)
>
> I think we need evidence that this is really worth it for optimizing
> out basically a counter update on powerpc.

Ack, I'll drop that patch in v4 unless someone sees a better
justification for it.

- Kevin

