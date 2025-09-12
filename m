Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ADCB55299
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 17:03:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122212.1466060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux5IZ-0003U2-7M; Fri, 12 Sep 2025 15:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122212.1466060; Fri, 12 Sep 2025 15:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux5IZ-0003Re-4h; Fri, 12 Sep 2025 15:02:51 +0000
Received: by outflank-mailman (input) for mailman id 1122212;
 Fri, 12 Sep 2025 15:02:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=66U7=3X=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1ux5IX-0003RW-U7
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 15:02:49 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 89047bd8-8fe9-11f0-9809-7dc792cee155;
 Fri, 12 Sep 2025 17:02:44 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCD5812FC;
 Fri, 12 Sep 2025 08:02:34 -0700 (PDT)
Received: from [10.57.66.147] (unknown [10.57.66.147])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 558333F694;
 Fri, 12 Sep 2025 08:02:36 -0700 (PDT)
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
X-Inumbo-ID: 89047bd8-8fe9-11f0-9809-7dc792cee155
Message-ID: <f9b0bf10-a531-484e-9679-08ec25ceb444@arm.com>
Date: Fri, 12 Sep 2025 17:02:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: David Hildenbrand <david@redhat.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mark Rutland <Mark.Rutland@arm.com>
References: <4b4971fd-0445-4d86-8f3a-6ba3d68d15b7@arm.com>
 <4aa28016-5678-4c66-8104-8dcc3fa2f5ce@redhat.com>
 <15d01c8b-5475-442e-9df5-ca37b0d5dc04@arm.com>
 <7953a735-6129-4d22-be65-ce736630d539@redhat.com>
 <781a6450-1c0b-4603-91cf-49f16cd78c28@arm.com>
 <a17ab4e3-627a-4989-a5a5-d430eadabb86@redhat.com>
 <9ed5441f-cc03-472a-adc6-b9d3ad525664-agordeev@linux.ibm.com>
 <74d1f275-23c3-4fd8-b665-503c7fc87df0@redhat.com>
 <248b4623-8755-4323-8a44-be4af30e4856-agordeev@linux.ibm.com>
 <b46d3430-fb84-464b-b053-490c6ea083da@redhat.com>
 <cdd9bc60-96d4-4f19-86c3-dcf598ccbd92-agordeev@linux.ibm.com>
 <852d6f8c-e167-4527-9dc9-98549124f6b1@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <852d6f8c-e167-4527-9dc9-98549124f6b1@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/09/2025 16:25, David Hildenbrand wrote:
>
>>
>> But I do not really expect it ever, since arch_enter_lazy_mmu_mode_pte()
>> is only to be called in PTE walkers that never span more than one page
>> table and follow the pattern:
>
> Well, the cover letter here states:
>
> "Unfortunately, a corner case (DEBUG_PAGEALLOC) may still cause
> nesting to occur on arm64. Ryan proposed [2] to address that corner
> case at the generic level but this approach received pushback; [3]
> then attempted to solve the issue on arm64 only, but it was deemed too
> fragile."
>
> So I guess we should support nesting cleanly, at least on the core-mm
> side.

Nesting remains a rare occurrence though. I think it would be plausible
to require this new interface to be used in a region where no nesting
can occur, just like pause()/resume().

In fact, I think this is a requirement if we go for the approach we have
been discussing, because nested enter()/leave() calls are not meant to
call arch_enter()/arch_leave(), and I really wouldn't want to use a
different logic for this variant.

>
> I guess we could start with saying "well, s390x doesn't fully support
> nesting yet but doing so just requires changing the way we manage this
> per-nesting-level state internally".
>
> s390 is trying to do something different than the other archs here, so
> that naturally concerns me :)
>
> But if it's really just about forwarding that data and having s390
> store it somewhere (task_struct, percpu variable, etc), fine with me. 

Yes I think this is fine, with the restriction above. The extra
arguments are directly forwarded to arch code and otherwise ignored by
core code, and unless the arch defines some __HAVE_ARCH... or CONFIG,
the extended interface falls back to regular enter()/leave().

- Kevin

