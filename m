Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D1427D132
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 16:33:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.233.553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNGgK-0003Dj-7L; Tue, 29 Sep 2020 14:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233.553; Tue, 29 Sep 2020 14:32:40 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNGgK-0003DK-3m; Tue, 29 Sep 2020 14:32:40 +0000
Received: by outflank-mailman (input) for mailman id 233;
 Tue, 29 Sep 2020 14:32:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNGgI-0003DF-8N
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 14:32:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ae2f717-5555-4ba2-a3fa-76fc0ce6e3c8;
 Tue, 29 Sep 2020 14:32:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9E20AAD0F;
 Tue, 29 Sep 2020 14:32:35 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6Xo+=DG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNGgI-0003DF-8N
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 14:32:38 +0000
X-Inumbo-ID: 8ae2f717-5555-4ba2-a3fa-76fc0ce6e3c8
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8ae2f717-5555-4ba2-a3fa-76fc0ce6e3c8;
	Tue, 29 Sep 2020 14:32:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601389955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=igN39754OwUKmz0zCNDpHm2ZKCkgkxo+5864mP4YozA=;
	b=AHT6FBFBfrKuvjAtVrFO9iSgD0r5yDgU35tk/sAaJCC2Fwoz/0gd12oQyE3+zzkvLiv2Pb
	f6a54SInBJkgKKO226sR75PCLcX1ej3rRaD3b0onpyqt3h+CG/jTVtPaLU3K7yMqJ2ZJbz
	cDLipna44IA1aHDYBG0JyYroeev2IN8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9E20AAD0F;
	Tue, 29 Sep 2020 14:32:35 +0000 (UTC)
Subject: Re: [PATCH 12/12] evtchn: convert domain event lock to an r/w one
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <5fee2432-7b94-2f91-5f17-c9eb3ec9f126@suse.com>
 <20200928164435.GP19254@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <93c07910-2455-d511-2458-9a17468d3f95@suse.com>
Date: Tue, 29 Sep 2020 16:32:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200928164435.GP19254@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.09.2020 18:44, Roger Pau Monné wrote:
> On Mon, Sep 28, 2020 at 01:02:43PM +0200, Jan Beulich wrote:
>> Especially for the use in evtchn_move_pirqs() (called when moving a vCPU
>> across pCPU-s) and the ones in EOI handling in PCI pass-through code,
>> serializing perhaps an entire domain isn't helpful when no state (which
>> isn't e.g. further protected by the per-channel lock) changes.
>>
>> Unfortunately this implies dropping of lock profiling for this lock,
>> until r/w locks may get enabled for such functionality.
>>
>> While ->notify_vcpu_id is now meant to be consistently updated with the
>> per-channel lock held for writing, an extension applies to ECS_PIRQ: The
>> field is also guaranteed to not change with the per-domain event lock
>> held. Therefore the unlink_pirq_port() call from evtchn_bind_vcpu() as
>> well as the link_pirq_port() one from evtchn_bind_pirq() could in
>> principle be moved out of the per-channel locked regions, but this
>> further code churn didn't seem worth it.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC:
>> * In evtchn_bind_vcpu() the question is whether limiting the use of
>>   write_lock() to just the ECS_PIRQ case is really worth it.
> 
> IMO I would just use use write_lock() at the top of the function in
> place of the current spin_lock. The more fine grained change should be
> done as a follow up patch if it's worth it. TBH event channels
> shouldn't change vCPU that frequently that using a more fine grained
> approach matters much.

No, using the write lock in place of the spin lock would violate
what the description says: "While ->notify_vcpu_id is now meant to
be consistently updated with the per-channel lock held for writing,
...". I could only switch to acquiring both.

>> --- a/xen/arch/x86/hvm/vmsi.c
>> +++ b/xen/arch/x86/hvm/vmsi.c
>> @@ -465,7 +465,7 @@ int msixtbl_pt_register(struct domain *d
>>      int r = -EINVAL;
>>  
>>      ASSERT(pcidevs_locked());
>> -    ASSERT(spin_is_locked(&d->event_lock));
>> +    ASSERT(rw_is_write_locked(&d->event_lock));
> 
> FWIW, we could switch rw_is_write_locked to use
> _is_write_locked_by_me (or introduce rw_is_write_locked_by_me, albeit
> I think all users of rw_is_write_locked care about the lock being
> taken by them).

Probably, but not here and now.

>> @@ -1098,7 +1108,7 @@ int evtchn_reset(struct domain *d, bool
>>      if ( d != current->domain && !d->controller_pause_count )
>>          return -EINVAL;
>>  
>> -    spin_lock(&d->event_lock);
>> +    read_lock(&d->event_lock);
>>  
>>      /*
>>       * If we are resuming, then start where we stopped. Otherwise, check
>> @@ -1109,7 +1119,7 @@ int evtchn_reset(struct domain *d, bool
>>      if ( i > d->next_evtchn )
>>          d->next_evtchn = i;
> 
> Using the read lock to write to d->next_evtchn here...
> 
>>  
>> -    spin_unlock(&d->event_lock);
>> +    read_unlock(&d->event_lock);
>>  
>>      if ( !i )
>>          return -EBUSY;
>> @@ -1121,14 +1131,14 @@ int evtchn_reset(struct domain *d, bool
>>          /* NB: Choice of frequency is arbitrary. */
>>          if ( !(i & 0x3f) && hypercall_preempt_check() )
>>          {
>> -            spin_lock(&d->event_lock);
>> +            write_lock(&d->event_lock);
>>              d->next_evtchn = i;
> 
> ... but the write lock here instead seems inconsistent.

Agreed, fixed.

>> @@ -1557,7 +1568,7 @@ static void domain_dump_evtchn_info(stru
>>             "Polling vCPUs: {%*pbl}\n"
>>             "    port [p/m/s]\n", d->domain_id, d->max_vcpus, d->poll_mask);
>>  
>> -    spin_lock(&d->event_lock);
>> +    read_lock(&d->event_lock);
> 
> Since this is a debug key, I would suggest using read_trylock in order
> to prevent blocking if a CPU is stuck while holding the event_lock in
> write mode.

We should do so in all debug key handlers imo, and I don't think
such a mostly orthogonal change would be reasonable to make
right here.

>> --- a/xen/drivers/passthrough/io.c
>> +++ b/xen/drivers/passthrough/io.c
>> @@ -105,7 +105,7 @@ static void pt_pirq_softirq_reset(struct
>>  {
>>      struct domain *d = pirq_dpci->dom;
>>  
>> -    ASSERT(spin_is_locked(&d->event_lock));
>> +    ASSERT(rw_is_write_locked(&d->event_lock));
>>  
>>      switch ( cmpxchg(&pirq_dpci->state, 1 << STATE_SCHED, 0) )
>>      {
>> @@ -162,7 +162,7 @@ static void pt_irq_time_out(void *data)
>>      const struct hvm_irq_dpci *dpci;
>>      const struct dev_intx_gsi_link *digl;
>>  
>> -    spin_lock(&irq_map->dom->event_lock);
>> +    read_lock(&irq_map->dom->event_lock);
> 
> Is it fine to use the lock in read mode here? It's likely to change
> the flags by adding HVM_IRQ_DPCI_EOI_LATCH, and hence should use the
> lock in write mode?
> 
> As I think that's the lock that's supposed to protect changes to the
> flags field?

Yes, looks like you're right - there simply is no other lock.
You're also right for all other respective pass-through related
remarks, I've switched them all to write_lock(). That's a bit
of a shame though, as especially on the EOI path things ought
to be able to work in a more parallel way.

>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -883,7 +883,7 @@ static int pci_clean_dpci_irqs(struct do
>>      if ( !is_hvm_domain(d) )
>>          return 0;
>>  
>> -    spin_lock(&d->event_lock);
>> +    write_lock(&d->event_lock);
>>      hvm_irq_dpci = domain_get_irq_dpci(d);
>>      if ( hvm_irq_dpci != NULL )
>>      {
>> @@ -901,14 +901,14 @@ static int pci_clean_dpci_irqs(struct do
>>              ret = pt_pirq_iterate(d, pci_clean_dpci_irq, NULL);
>>          if ( ret )
>>          {
>> -            spin_unlock(&d->event_lock);
>> +            read_unlock(&d->event_lock);
> 
> This should be a write_unlock AFAICT.

Oh, of course - missed to convert this one when converting the two
others.

>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -373,7 +373,7 @@ struct domain
>>      unsigned int     xen_evtchns;
>>      /* Port to resume from in evtchn_reset(), when in a continuation. */
>>      unsigned int     next_evtchn;
>> -    spinlock_t       event_lock;
>> +    rwlock_t         event_lock;
> 
> It would be nice to add a comment regarding what fields does
> event_lock protect. It's kind of a very generic lock name that I think
> has been abused a bit.
> 
> Not that it needs to be done in that patch.

Right, and it'll be quite some auditing that needs doing in order
to collect all the pieces.

Jan

