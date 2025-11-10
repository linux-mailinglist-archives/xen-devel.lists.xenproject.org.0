Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F505C45F90
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 11:38:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158202.1486581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIPHX-0006ha-HN; Mon, 10 Nov 2025 10:37:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158202.1486581; Mon, 10 Nov 2025 10:37:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIPHX-0006fl-Dv; Mon, 10 Nov 2025 10:37:55 +0000
Received: by outflank-mailman (input) for mailman id 1158202;
 Mon, 10 Nov 2025 10:37:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bLcL=5S=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vIPHW-0006ac-AP
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 10:37:54 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 4f185c22-be21-11f0-980a-7dc792cee155;
 Mon, 10 Nov 2025 11:37:52 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4A3CFEC;
 Mon, 10 Nov 2025 02:37:43 -0800 (PST)
Received: from [10.57.39.147] (unknown [10.57.39.147])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EB953F66E;
 Mon, 10 Nov 2025 02:37:43 -0800 (PST)
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
X-Inumbo-ID: 4f185c22-be21-11f0-980a-7dc792cee155
Message-ID: <0d00dd6e-9e39-4ac6-8ea4-9407e75947eb@arm.com>
Date: Mon, 10 Nov 2025 11:37:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/12] mm: introduce CONFIG_ARCH_HAS_LAZY_MMU_MODE
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
 <20251029100909.3381140-6-kevin.brodsky@arm.com>
 <6a9c846f-22b6-4d5f-81dc-6cdcd4905952@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <6a9c846f-22b6-4d5f-81dc-6cdcd4905952@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/11/2025 13:56, Ryan Roberts wrote:
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 6663ffd23f25..e6bf5c7311b5 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -122,6 +122,7 @@ config ARM64
>>  	select ARCH_WANTS_NO_INSTR
>>  	select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
>>  	select ARCH_HAS_UBSAN
>> +	select ARCH_HAS_LAZY_MMU_MODE
> nit: This list is mostly in alphabetical order. Further up the list there are a
> lot of ARCH_HAS_* entries. Perhaps move it to the correct position in that lot?
> Then ARCH_HAS_UBSAN stays out of order on its own.

That's fair, it does look like it's mostly in order apart from
ARCH_HAS_UBSAN. Will move it further up.

- Kevin

