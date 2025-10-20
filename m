Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 478DBBF0942
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 12:38:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146084.1478557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAnH0-0004Cw-83; Mon, 20 Oct 2025 10:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146084.1478557; Mon, 20 Oct 2025 10:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAnH0-0004BM-4z; Mon, 20 Oct 2025 10:37:54 +0000
Received: by outflank-mailman (input) for mailman id 1146084;
 Mon, 20 Oct 2025 10:37:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HAV6=45=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vAnGz-0004BG-JW
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 10:37:53 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d3cbba15-ada0-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 12:37:51 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6116D1063;
 Mon, 20 Oct 2025 03:37:42 -0700 (PDT)
Received: from [10.57.65.147] (unknown [10.57.65.147])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB2C53F63F;
 Mon, 20 Oct 2025 03:37:41 -0700 (PDT)
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
X-Inumbo-ID: d3cbba15-ada0-11f0-9d15-b5c5bf9af7f9
Message-ID: <3836a43f-809e-419d-a85d-74606d9daa0f@arm.com>
Date: Mon, 20 Oct 2025 12:37:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/13] mm: introduce CONFIG_ARCH_LAZY_MMU
To: Mike Rapoport <rppt@kernel.org>
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
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Nicholas Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-6-kevin.brodsky@arm.com>
 <aPNjd2dg3YN-TZKH@kernel.org>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <aPNjd2dg3YN-TZKH@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/10/2025 11:52, Mike Rapoport wrote:
>> @@ -231,7 +231,7 @@ static inline int pmd_dirty(pmd_t pmd)
>>   * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
>>   * and the mode cannot be used in interrupt context.
>>   */
>> -#ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
>> +#ifndef CONFIG_ARCH_LAZY_MMU
>>  static inline void arch_enter_lazy_mmu_mode(void) {}
>>  static inline void arch_leave_lazy_mmu_mode(void) {}
>>  static inline void arch_flush_lazy_mmu_mode(void) {}
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index 0e26f4fc8717..2fdcb42ca1a1 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -1372,6 +1372,9 @@ config PT_RECLAIM
>>  config FIND_NORMAL_PAGE
>>  	def_bool n
>>  
>> +config ARCH_LAZY_MMU
>> +	bool
>> +
> I think a better name would be ARCH_HAS_LAZY_MMU and the config option fits
> better to arch/Kconfig.

Sounds fine by me - I'm inclined to make it slightly longer still,
ARCH_HAS_LAZY_MMU_MODE, to avoid making "LAZY_MMU" sound like some HW
feature.

- Kevin

