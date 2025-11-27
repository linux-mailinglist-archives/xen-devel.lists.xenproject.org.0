Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A39C8E4DB
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 13:46:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173807.1498805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vObNb-00076y-Hx; Thu, 27 Nov 2025 12:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173807.1498805; Thu, 27 Nov 2025 12:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vObNb-00074g-F9; Thu, 27 Nov 2025 12:45:47 +0000
Received: by outflank-mailman (input) for mailman id 1173807;
 Thu, 27 Nov 2025 12:45:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HNz/=6D=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vObNa-00074a-K8
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 12:45:46 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id fd1af27c-cb8e-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 13:45:44 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11C781477;
 Thu, 27 Nov 2025 04:45:36 -0800 (PST)
Received: from [10.57.43.59] (unknown [10.57.43.59])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC00D3F73B;
 Thu, 27 Nov 2025 04:45:35 -0800 (PST)
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
X-Inumbo-ID: fd1af27c-cb8e-11f0-9d18-b5c5bf9af7f9
Message-ID: <0cb512ba-de15-4ba6-a85a-8287ab67fb53@arm.com>
Date: Thu, 27 Nov 2025 13:45:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] mm: enable lazy_mmu sections to nest
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
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
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-9-kevin.brodsky@arm.com>
 <4d0eab1a-e1dc-49cf-8640-727c9734233d-agordeev@linux.ibm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <4d0eab1a-e1dc-49cf-8640-727c9734233d-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/11/2025 13:33, Alexander Gordeev wrote:
> On Mon, Nov 24, 2025 at 01:22:24PM +0000, Kevin Brodsky wrote:
>
> Hi Kevin,
>
> ...
>> +/**
>> + * lazy_mmu_mode_pause() - Pause the lazy MMU mode.
>> + *
>> + * Pauses the lazy MMU mode; if it is currently active, disables it and calls
>> + * arch_leave_lazy_mmu_mode().
>> + *
>> + * Must be paired with a call to lazy_mmu_mode_resume(). Calls to the
>> + * lazy_mmu_mode_* API have no effect until the matching resume() call.
> Sorry if it was discussed already - if yes, I somehow missed it. If I read
> the whole thing correctly enter()/pause() interleaving is not forbidden?

Correct, any call inside pause()/resume() is now allowed (but
effectively ignored). See discussion with Ryan in v4 [1].

[1]
https://lore.kernel.org/all/824bf705-e9d6-4eeb-9532-9059fa56427f@arm.com/

> lazy_mmu_mode_enable()
> 	lazy_mmu_mode_pause()
> 		lazy_mmu_mode_enable()
> 		...
> 		lazy_mmu_mode_disable()
> 	lazy_mmu_mode_resume()
> lazy_mmu_mode_disable()
>
>> + *
>> + * Has no effect if called:
>> + * - While paused (inside another pause()/resume() pair)
>> + * - In interrupt context
>> + */
>>  static inline void lazy_mmu_mode_pause(void)
>>  {
>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> +
>>  	if (in_interrupt())
>>  		return;
>>  
>> -	arch_leave_lazy_mmu_mode();
>> +	VM_WARN_ON_ONCE(state->pause_count == U8_MAX);
>> +
>> +	if (state->pause_count++ == 0 && state->enable_count > 0)
>> +		arch_leave_lazy_mmu_mode();
>>  }
>>  
>> +/**
>> + * lazy_mmu_mode_pause() - Resume the lazy MMU mode.
>                     resume() ?

Good catch! One copy-paste too many...

- Kevin

>> + *
>> + * Resumes the lazy MMU mode; if it was active at the point where the matching
>> + * call to lazy_mmu_mode_pause() was made, re-enables it and calls
>> + * arch_enter_lazy_mmu_mode().
>> + *
>> + * Must match a call to lazy_mmu_mode_pause().
>> + *
>> + * Has no effect if called:
>> + * - While paused (inside another pause()/resume() pair)
>> + * - In interrupt context
>> + */
>>  static inline void lazy_mmu_mode_resume(void)
>>  {
>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> +
>>  	if (in_interrupt())
>>  		return;
>>  
>> -	arch_enter_lazy_mmu_mode();
>> +	VM_WARN_ON_ONCE(state->pause_count == 0);
>> +
>> +	if (--state->pause_count == 0 && state->enable_count > 0)
>> +		arch_enter_lazy_mmu_mode();
>>  }
> ...
> Thanks!

