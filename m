Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6938CA7AC0
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 14:01:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179013.1502657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRVQc-000595-Aa; Fri, 05 Dec 2025 13:00:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179013.1502657; Fri, 05 Dec 2025 13:00:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRVQc-00057d-7B; Fri, 05 Dec 2025 13:00:54 +0000
Received: by outflank-mailman (input) for mailman id 1179013;
 Fri, 05 Dec 2025 13:00:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uphM=6L=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vRVQb-00057X-7I
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 13:00:53 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6cb12821-d1da-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 14:00:50 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A482F19F6;
 Fri,  5 Dec 2025 05:00:42 -0800 (PST)
Received: from [10.44.160.68] (e126510-lin.lund.arm.com [10.44.160.68])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 164973F59E;
 Fri,  5 Dec 2025 05:00:39 -0800 (PST)
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
X-Inumbo-ID: 6cb12821-d1da-11f0-980a-7dc792cee155
Message-ID: <f07f5f70-eb4c-4e45-b7d6-96c8455255d2@arm.com>
Date: Fri, 5 Dec 2025 14:00:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/12] Nesting support for lazy MMU mode
To: Venkat <venkat88@linux.ibm.com>
Cc: linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
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
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <94889730-1AEF-458F-B623-04092C0D6819@linux.ibm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <94889730-1AEF-458F-B623-04092C0D6819@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/12/2025 17:08, Venkat wrote:
> [...]
> Tested this patch series by applying on top of mm-unstable, on both HASH and RADIX MMU, and all tests are passed on both MMU’s.
>
> Ran: cache_shape, copyloops, mm from linux source, selftests/powerpc/ and ran memory-hotplug from selftests/. Also ran below tests from avocado misc-test repo.
>
> Link to repo: https://github.com/avocado-framework-tests/avocado-misc-tests
>
> avocado-misc-tests/memory/stutter.py
> avocado-misc-tests/memory/eatmemory.py
> avocado-misc-tests/memory/hugepage_sanity.py
> avocado-misc-tests/memory/fork_mem.py
> avocado-misc-tests/memory/memory_api.py
> avocado-misc-tests/memory/mprotect.py
> avocado-misc-tests/memory/vatest.py avocado-misc-tests/memory/vatest.py.data/vatest.yaml
> avocado-misc-tests/memory/transparent_hugepages.py
> avocado-misc-tests/memory/transparent_hugepages_swapping.py
> avocado-misc-tests/memory/transparent_hugepages_defrag.py
> avocado-misc-tests/memory/ksm_poison.py
>
> If its good enough, please add below tag for PowerPC changes.
>
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Many thanks for the testing! Will add your tag to patch 1, 3 and 10.

- Kevin

