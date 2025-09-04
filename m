Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5C5B44953
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 00:15:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111034.1459970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuIEL-0007te-Hy; Thu, 04 Sep 2025 22:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111034.1459970; Thu, 04 Sep 2025 22:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuIEL-0007rE-FB; Thu, 04 Sep 2025 22:14:57 +0000
Received: by outflank-mailman (input) for mailman id 1111034;
 Thu, 04 Sep 2025 22:14:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DBMC=3P=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1uuIEJ-0007r8-AC
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 22:14:55 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 94353f84-89dc-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 00:14:52 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2977D1596;
 Thu,  4 Sep 2025 15:14:43 -0700 (PDT)
Received: from [10.57.58.14] (unknown [10.57.58.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46B793F63F;
 Thu,  4 Sep 2025 15:14:44 -0700 (PDT)
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
X-Inumbo-ID: 94353f84-89dc-11f0-9809-7dc792cee155
Message-ID: <75db1f58-98b3-463c-af4f-2ce9878cba9f@arm.com>
Date: Fri, 5 Sep 2025 00:14:39 +0200
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
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <22131943-3f92-4f5a-be28-7b668c07a25c@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/09/2025 19:28, Lorenzo Stoakes wrote:
> Hi Kevin,
>
> This is causing a build failure:
>
> In file included from ./include/linux/mm.h:31,
>                  from mm/userfaultfd.c:8:
> mm/userfaultfd.c: In function ‘move_present_ptes’:
> ./include/linux/pgtable.h:247:41: error: statement with no effect [-Werror=unused-value]
>   247 | #define arch_enter_lazy_mmu_mode()      (LAZY_MMU_DEFAULT)
>       |                                         ^
> mm/userfaultfd.c:1103:9: note: in expansion of macro ‘arch_enter_lazy_mmu_mode’
>  1103 |         arch_enter_lazy_mmu_mode();
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/pgtable.h:248:54: error: expected expression before ‘)’ token
>   248 | #define arch_leave_lazy_mmu_mode(state) ((void)(state))
>       |                                                      ^
> mm/userfaultfd.c:1141:9: note: in expansion of macro ‘arch_leave_lazy_mmu_mode’
>  1141 |         arch_leave_lazy_mmu_mode();
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
>
> It seems you haven't carefully checked call sites here, please do very
> carefully recheck these - I see Yeoreum reported a mising kasan case, so I
> suggest you just aggressively grep this + make sure you've covered all
> bases :)

I did check all call sites pretty carefully and of course build-tested,
but my series is based on v6.17-rc4 - just like the calls Yeoreum
mentioned, the issue is that those calls are in mm-stable but not in
mainline :/ I suppose I should post a v2 rebased on mm-stable ASAP then?

- Kevin

