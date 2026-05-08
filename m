Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +G5dOzGo/Wl0ggAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 11:09:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 634F54F4116
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 11:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303324.1576775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLHCE-0007Sr-Tn; Fri, 08 May 2026 09:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303324.1576775; Fri, 08 May 2026 09:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLHCE-0007Qb-Qp; Fri, 08 May 2026 09:08:34 +0000
Received: by outflank-mailman (input) for mailman id 1303324;
 Fri, 08 May 2026 09:08:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.brodsky@arm.com>) id 1wLHCD-0007QV-GS
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 09:08:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLHCA-00DoEb-SK
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 11:08:32 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.brodsky@arm.com>)
 id 69fda80b-5cb7-0a2a0a5109dd-0a2a450c8db8-10
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 11:08:31 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <kevin.brodsky@arm.com>)
 id 69fda80f-62f1-0a2a450c0019-d98c6eacc134-1
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 11:08:31 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56CD51AC1;
 Fri,  8 May 2026 02:08:25 -0700 (PDT)
Received: from [10.57.35.71] (unknown [10.57.35.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F04523F7B4;
 Fri,  8 May 2026 02:08:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="Date:Subject:To:Cc:References:From:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778231310; bh=998AzUHkBd2MHjoPernwnRkOgC5TCEI3RLAhgvrlDps=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WPh3yUoFMFj8+b6NrCFhAXEvHu9aundhUOnMwNWD2QHqLVB/wfS7QiwL+0BDpm4RF
	 NSMUNZAiTkWs+ukXKE7RyPNfyloPQoejZ2iApXnQrGF7MghSNxsyc0kXZ3cJwCG8wd
	 Yjtv0h4b+w7/JhHBBOSnR+TQIO25g+ipSooZj9r0=
Message-ID: <775a5fd2-394d-4409-81d3-4dc6ef8209f0@arm.com>
Date: Fri, 8 May 2026 11:08:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: Fix lazy mmu handling across context switch
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-mm@kvack.org
Cc: mmarek@invisiblethingslab.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, xen-devel@lists.xenproject.org
References: <20260508080514.454607-1-jgross@suse.com>
 <5cb54bd1-5981-4a46-9083-f7b527ca342f@suse.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <5cb54bd1-5981-4a46-9083-f7b527ca342f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1778231311-DA577CF5-7D136E2F/0/0
X-purgate-type: clean
X-purgate-size: 5656
X-Rspamd-Queue-Id: 634F54F4116
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:linux-mm@kvack.org,m:mmarek@invisiblethingslab.com,m:boris.ostrovsky@oracle.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DKIM_TRACE(0.00)[arm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kevin.brodsky@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.brodsky@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 08/05/2026 10:33, Jürgen Groß wrote:
> Please disregard this patch. It isn't fixing the real problem.

That's what I would expect, see below.

>
> On 08.05.26 10:05, Juergen Gross wrote:
>> The recent rework of mmu lazy mode has resulted in problems when
>> running as a Xen PV guest. Enabling lazy mmu mode for the new context
>> during context switch is done from the arch_end_context_switch() hook,
>> but when calling this hook current hasn't been changed yet, so the
>> lazy mmu mode state of the wrong task is modified.

Currently xen_end_context_switch() checks if next has lazy MMU mode
enabled and if so calls arch_enter_lazy_mmu_mode(), i.e.
enter_lazy(XEN_LAZY_MMU). This does *not* modify any task state, rather
it writes to the xen_lazy_mode percpu variable.

I've thought about this from various angles when reworking lazy MMU, and
the conclusion I made is that arch_{start,end}_context_switch() have no
reason to change any task state. On arm64, for instance, we do nothing
at all on context switching, since everything lazy MMU-related is
tracked in task_struct and therefore already switched.

Xen is trickier because it tracks lazy MMU/CPU state in a percpu
variable, so these hooks do need to do something about it. This is
entirely Xen-internal though, and there's no reason to be calling
generic functions like lazy_mmu_mode_pause() that modify task state.

The idea behind commit 291b3abed657 ("x86/xen: use lazy_mmu_state when
context-switching") is that TIF_LAZY_MMU_UPDATES now duplicates
lazy_mmu_state in task_struct and we can therefore replace the former
with the latter. More specifically, the assumption is that
TIF_LAZY_MMU_UPDATES is set if and only if the task has been scheduled
out and __task_lazy_mmu_mode_active(task) is true.

Clearly there is something wrong with this assumption, but I still can't
put my finger on it. For now I would suggest reverting this commit if
that solves the issue Marek reported; the intention was not to introduce
any functional change, but only a (minor) optimisation.

- Kevin

>>
>> Additionally it is much cleaner to use lazy_mmu_mode_pause() and
>> lazy_mmu_mode_resume() in the Xen context switch hooks, as it avoids
>> conditionals in those hooks.
>>
>> In order not having to add another hook to be called after switching
>> current, modify lazy_mmu_mode_resume() to use a new sub-function which
>> takes a task pointer as parameter. This new sub-function can then be
>> used in the xen_end_context_switch() hook.
>>
>> Fixes: 291b3abed657 ("x86/xen: use lazy_mmu_state when
>> context-switching")
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   arch/x86/xen/enlighten_pv.c |  7 ++-----
>>   include/linux/pgtable.h     | 33 ++++++++++++++++++++++++---------
>>   2 files changed, 26 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
>> index ed2d7a3756ce..67bb6bf6d240 100644
>> --- a/arch/x86/xen/enlighten_pv.c
>> +++ b/arch/x86/xen/enlighten_pv.c
>> @@ -424,9 +424,7 @@ static void xen_start_context_switch(struct
>> task_struct *prev)
>>   {
>>       BUG_ON(preemptible());
>>   -    if (this_cpu_read(xen_lazy_mode) == XEN_LAZY_MMU) {
>> -        arch_leave_lazy_mmu_mode();
>> -    }
>> +    lazy_mmu_mode_pause();
>>       enter_lazy(XEN_LAZY_CPU);
>>   }
>>   @@ -436,8 +434,7 @@ static void xen_end_context_switch(struct
>> task_struct *next)
>>         xen_mc_flush();
>>       leave_lazy(XEN_LAZY_CPU);
>> -    if (__task_lazy_mmu_mode_active(next))
>> -        arch_enter_lazy_mmu_mode();
>> +    lazy_mmu_mode_resume_task(next);
>>   }
>>     static unsigned long xen_store_tr(void)
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index cdd68ed3ae1a..83a099bf2038 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -326,6 +326,28 @@ static inline void lazy_mmu_mode_pause(void)
>>           arch_leave_lazy_mmu_mode();
>>   }
>>   +/**
>> + * lazy_mmu_mode_resume_task() - Resume the lazy MMU mode for a
>> specific task.
>> + *
>> + * Like lazy_mmu_mode_resume() below, but with a task specified.
>> + * Must be called only by lazy_mmu_mode_resume() or during context
>> switch.
>> + * Must never be called in interrupt context.
>> + *
>> + * Must match a call to lazy_mmu_mode_pause().
>> + *
>> + * Has no effect if called:
>> + * - While paused (inside another pause()/resume() pair)
>> + */
>> +static inline void lazy_mmu_mode_resume_task(struct task_struct *task)
>> +{
>> +    struct lazy_mmu_state *state = &task->lazy_mmu_state;
>> +
>> +    VM_WARN_ON_ONCE(state->pause_count == 0);
>> +
>> +    if (--state->pause_count == 0 && state->enable_count > 0)
>> +        arch_enter_lazy_mmu_mode();
>> +}
>> +
>>   /**
>>    * lazy_mmu_mode_resume() - Resume the lazy MMU mode.
>>    *
>> @@ -341,15 +363,8 @@ static inline void lazy_mmu_mode_pause(void)
>>    */
>>   static inline void lazy_mmu_mode_resume(void)
>>   {
>> -    struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> -
>> -    if (in_interrupt())
>> -        return;
>> -
>> -    VM_WARN_ON_ONCE(state->pause_count == 0);
>> -
>> -    if (--state->pause_count == 0 && state->enable_count > 0)
>> -        arch_enter_lazy_mmu_mode();
>> +    if (!in_interrupt())
>> +        lazy_mmu_mode_resume_task(current);
>>   }
>>   #else
>>   static inline void lazy_mmu_mode_enable(void) {}
>

