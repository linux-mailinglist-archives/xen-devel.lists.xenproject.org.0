Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9774DB457A1
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 14:23:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111940.1460478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuVT1-0006Ej-4G; Fri, 05 Sep 2025 12:22:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111940.1460478; Fri, 05 Sep 2025 12:22:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuVT1-0006CW-0w; Fri, 05 Sep 2025 12:22:59 +0000
Received: by outflank-mailman (input) for mailman id 1111940;
 Fri, 05 Sep 2025 12:22:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jBRp=3Q=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1uuVSz-0006CM-9v
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 12:22:57 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 0cc6460b-8a53-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 14:22:55 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2012D153B;
 Fri,  5 Sep 2025 05:22:46 -0700 (PDT)
Received: from [10.57.60.42] (unknown [10.57.60.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7BF93F63F;
 Fri,  5 Sep 2025 05:22:48 -0700 (PDT)
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
X-Inumbo-ID: 0cc6460b-8a53-11f0-9809-7dc792cee155
Message-ID: <a18f9cbd-490d-4270-8707-4ed6d730cfcd@arm.com>
Date: Fri, 5 Sep 2025 14:22:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] mm: introduce local state for lazy_mmu sections
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <20250904125736.3918646-3-kevin.brodsky@arm.com>
 <22131943-3f92-4f5a-be28-7b668c07a25c@lucifer.local>
 <75db1f58-98b3-463c-af4f-2ce9878cba9f@arm.com>
 <2aed0b3b-1a70-4c89-9177-8de4fabb2237@lucifer.local>
 <e6072568-1b98-4a7f-8d30-65417a440bb7@lucifer.local>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <e6072568-1b98-4a7f-8d30-65417a440bb7@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/09/2025 13:37, Lorenzo Stoakes wrote:
> On Fri, Sep 05, 2025 at 12:21:40PM +0100, Lorenzo Stoakes wrote:
>> You should really base on mm-new.
>>
>> You need to account for everything that is potentially going to go
>> upstream. mm-stable is generally not actually populated all too well until
>> shortly before merge window anyway.
> Just to note that mm-unstable is also fine. Despite its name, it's substantially
> more stable than mm-new, which can even break the build and appears to have no
> checks performed on it at all.

Thanks for the overview - I had a general idea about those branches but
I wasn't sure what the standard practice was. I'll rebase on mm-unstable
to start with.

- Kevin

