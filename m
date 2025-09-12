Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC11EB5534B
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 17:26:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122232.1466071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux5ee-0006jK-Tx; Fri, 12 Sep 2025 15:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122232.1466071; Fri, 12 Sep 2025 15:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux5ee-0006hK-RB; Fri, 12 Sep 2025 15:25:40 +0000
Received: by outflank-mailman (input) for mailman id 1122232;
 Fri, 12 Sep 2025 15:25:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=66U7=3X=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1ux5ed-0006hE-KO
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 15:25:39 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id bbaf3a8c-8fec-11f0-9d13-b5c5bf9af7f9;
 Fri, 12 Sep 2025 17:25:37 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E94328AC;
 Fri, 12 Sep 2025 08:25:28 -0700 (PDT)
Received: from [10.57.66.147] (unknown [10.57.66.147])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 301DA3F694;
 Fri, 12 Sep 2025 08:25:29 -0700 (PDT)
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
X-Inumbo-ID: bbaf3a8c-8fec-11f0-9d13-b5c5bf9af7f9
Message-ID: <338ef811-1dab-4c4e-bc5f-8ebd8cb68435@arm.com>
Date: Fri, 12 Sep 2025 17:25:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Kevin Brodsky <kevin.brodsky@arm.com>
Subject: Re: [PATCH v2 0/7] Nesting support for lazy MMU mode
To: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
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
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908191602.61160a7990b9ea418de758c7@linux-foundation.org>
 <d1b4ff2a-052f-4556-91ae-273962edbed0@redhat.com>
Content-Language: en-GB
In-Reply-To: <d1b4ff2a-052f-4556-91ae-273962edbed0@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/09/2025 11:21, David Hildenbrand wrote:
> On 09.09.25 04:16, Andrew Morton wrote:
>> On Mon,  8 Sep 2025 08:39:24 +0100 Kevin Brodsky
>> <kevin.brodsky@arm.com> wrote:
>>
>>> The main change enabling nesting is patch 2, following the approach
>>> suggested by Catalin Marinas [4]: have enter() return some state and
>>> the matching leave() take that state.
>>
>> This is so totally the correct way.  Thanks.
>
> Staring at this, I wonder if we could alternatively handle it like
> pagefault_disable()/pagefault_enable(), having something like
> current->lazy_mmu_enabled.
>
> We wouldn't have to worry about preemption in that case I guess
> (unless the arch has special requirements).
>
> Not sure if that was already discussed, just a thought. 

Based on the outcome of the discussion with David on patch 2 [1p], there
is indeed an alternative approach that we should seriously consider. In
summary:

* Keep the API stateless, handle nesting with a counter in task_struct
* Introduce new functions to temporarily disable lazy_mmu without
impacting nesting, track that with a bool in task_struct (addresses the
situation in mm/kasan/shadow.c and possibly some x86 cases too)
* Move as much handling from arch_* to generic functions

What the new generic infrastructure would look like:

struct task_struct {
    ...
#ifdef CONFIG_ARCH_LAZY_MMU
    struct {
        uint8_t count;
        bool enabled; /* or paused, see below */
    } lazy_mmu_state;
#endif
}

* lazy_mmu_mode_enable():
    if (!lazy_mmu_state.count) {
        arch_enter_lazy_mmu_mode();
        lazy_mmu_state.enabled = true;
    }
    lazy_mmu_state.count++;

* lazy_mmu_mode_disable():
    lazy_mmu_count--;
    if (!lazy_mmu_state.count) {
        lazy_mmu_state.enabled = false;
        arch_leave_lazy_mmu_mode();
    } else {
        arch_flush_lazy_mmu_mode();
    }

* lazy_mmu_mode_pause():
    lazy_mmu_state.enabled = false;
    arch_leave_lazy_mmu_mode();

* lazy_mmu_mode_resume();
    arch_enter_lazy_mmu_mode();
    lazy_mmu_state.enabled = true;

The generic enable()/disable() helpers are able to handle most of the
logic, leaving only truly arch-specific code to the arch callbacks:
* Updating lazy_mmu_state
* Sanity checks on lazy_mmu_state (e.g. count underflow/overflow,
pause()/resume() only called when count > 0, etc.)
* Bailing out if in_interrupt() (not done consistently across arch's at
the moment)

A further improvement is to make arch code check lazy_mmu_state.enabled
to determine whether lazy_mmu is enabled at any given point. At the
moment every arch uses a different mechanism, and this is an occasion to
make them converge.

The arch callback interface remains unchanged, and we are resurrecting
arch_flush_lazy_mmu_mode() to handle the nested disable() case (flushing
must happen when exiting a section regardless of nesting):

enable() -> arch_enter()
    enable() -> [nothing]
    disable() -> arch_flush()
disable() -> arch_leave()

Note: lazy_mmu_state.enabled (set whenever lazy_mmu is actually enabled)
could be replaced with lazy_mmu_state.paused (set inside a
pause()/resume() section). I believe this is equivalent but the former
is slightly more convenient for arch code - to be confirmed in practice.

Any thoughts on this? Unless there are concerns, I will move towards
that approach in v3.

- Kevin

[1p]
https://lore.kernel.org/all/4aa28016-5678-4c66-8104-8dcc3fa2f5ce@redhat.com/t/#u


