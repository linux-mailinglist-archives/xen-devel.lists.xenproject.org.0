Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9486322709
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 09:21:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88613.166711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lESwA-0006wg-TZ; Tue, 23 Feb 2021 08:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88613.166711; Tue, 23 Feb 2021 08:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lESwA-0006wH-Q5; Tue, 23 Feb 2021 08:20:54 +0000
Received: by outflank-mailman (input) for mailman id 88613;
 Tue, 23 Feb 2021 08:20:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lESw9-0006vt-Iu
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 08:20:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe5af15b-25fd-49cd-b8ad-a0316ebbc278;
 Tue, 23 Feb 2021 08:20:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7F29AAF49;
 Tue, 23 Feb 2021 08:20:51 +0000 (UTC)
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
X-Inumbo-ID: fe5af15b-25fd-49cd-b8ad-a0316ebbc278
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614068451; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EpgiD216cNRYhBm73/WD4DKnrgw4M/eJ0KV1yvWs/HM=;
	b=Bit8Al5XEHdY9fB4hRvf44Skthd7NypK4rqP9joRovawY2jbDelhSHrDeNrBdxwS9lcW1P
	bb09a/6AduDv0YSx6qcaCKUq+bTafrAr2KXi08kkqX2qw7zIXUd8NDxJKp6ElgVjSo/7KD
	THzYSotQ/6M/QVfGAaXawhRJgOyYFL0=
Subject: Re: Domain reference counting breakage
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Ian Jackson <iwj@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210222152617.16382-1-andrew.cooper3@citrix.com>
 <90be630d-dccf-f63f-8419-dc583204b3a9@suse.com>
 <f32e70fc-ad67-836e-5181-5d9d2dd9cd7a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9558e92d-644d-7a80-c530-5a45d451a48c@suse.com>
Date: Tue, 23 Feb 2021 09:20:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f32e70fc-ad67-836e-5181-5d9d2dd9cd7a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.02.2021 18:11, Andrew Cooper wrote:
> On 22/02/2021 16:49, Jan Beulich wrote:
>> On 22.02.2021 16:26, Andrew Cooper wrote:
>>> At the moment, attempting to create an HVM guest with max_gnttab_frames of 0
>>> causes Xen to explode on the:
>>>
>>>   BUG_ON(atomic_read(&d->refcnt) != DOMAIN_DESTROYED);
>>>
>>> in _domain_destroy().  Intrumenting Xen a little more to highlight where the
>>> modifcations to d->refcnt occur:
>>>
>>>   (d6) --- Xen Test Framework ---
>>>   (d6) Environment: PV 64bit (Long mode 4 levels)
>>>   (d6) Testing domain create:
>>>   (d6) Testing x86 PVH Shadow
>>>   (d6) (XEN) d0v0 Hit #DB in Xen context: e008:ffff82d0402046b5 [domain_create+0x1c3/0x7f1], stk e010:ffff83003fea7d58, dr6 ffff0ff1
>>>   (d6) (XEN) d0v0 Hit #DB in Xen context: e008:ffff82d040321b11 [share_xen_page_with_guest+0x175/0x190], stk e010:ffff83003fea7ce8, dr6 ffff0ff1
>>>   (d6) (XEN) d0v0 Hit #DB in Xen context: e008:ffff82d04022595b [assign_pages+0x223/0x2b7], stk e010:ffff83003fea7c68, dr6 ffff0ff1
>>>   (d6) (XEN) grant_table.c:1934: Bad grant table sizes: grant 0, maptrack 0
>>>   (d6) (XEN) *** d1 ref 3
>>>   (d6) (XEN) d0v0 Hit #DB in Xen context: e008:ffff82d0402048bc [domain_create+0x3ca/0x7f1], stk e010:ffff83003fea7d58, dr6 ffff0ff1
>>>   (d6) (XEN) d0v0 Hit #DB in Xen context: e008:ffff82d040225e11 [free_domheap_pages+0x422/0x44a], stk e010:ffff83003fea7c38, dr6 ffff0ff1
>>>   (d6) (XEN) Xen BUG at domain.c:450
>>>   (d6) (XEN) ----[ Xen-4.15-unstable  x86_64  debug=y  Not tainted ]----
>>>   (d6) (XEN) CPU:    0
>>>   (d6) (XEN) RIP:    e008:[<ffff82d040204366>] common/domain.c#_domain_destroy+0x69/0x6b
>>>
>>> the problem becomes apparent.
>>>
>>> First of all, there is a reference count leak - share_xen_page_with_guest()'s
>>> reference isn't freed anywhere.
>>>
>>> However, the main problem is the 4th #DB above is this atomic_set()
>>>
>>>   d->is_dying = DOMDYING_dead;
>>>   if ( hardware_domain == d )
>>>       hardware_domain = old_hwdom;
>>>   printk("*** %pd ref %d\n", d, atomic_read(&d->refcnt));
>>>   atomic_set(&d->refcnt, DOMAIN_DESTROYED);
>>>
>>> in the domain_create() error path, which happens before free_domheap_pages()
>>> drops the ref acquired assign_pages(), and destroys still-relevant information
>>> pertaining to the guest.
>> I think the original idea was that by the time of the atomic_set()
>> all operations potentially altering the refcount are done. This
>> then allowed calling free_xenheap_pages() on e.g. the shared info
>> page without regard to whether the page's reference (installed by
>> share_xen_page_with_guest()) was actually dropped (i.e.
>> regardless of whether it's the domain create error path or proper
>> domain cleanup). With this assumption, no actual leak of anything
>> would occur, but of course this isn't the "natural" way of how
>> things should get cleaned up.
>>
>> According to this original model, free_domheap_pages() may not be
>> called anymore past that point (for domain owned pages, which
>> really means put_page() then; anonymous pages are of course fine
>> to be freed late).
> 
> And I presume this is written down in the usual place?  (I.e. nowhere)

I'm afraid so, hence me starting the explanation with "I think ...".

>>> The best options is probably to use atomic_sub() to subtract (DOMAIN_DESTROYED
>>> + 1) from the current refcount, which preserves the extra refs taken by
>>> share_xen_page_with_guest() and assign_pages() until they can be freed
>>> appropriately.
>> First of all - why DOMAIN_DESTROYED+1? There's no extra reference
>> you ought to be dropping here. Or else what's the counterpart of
>> acquiring the respective reference?
> 
> The original atomic_set(1) needs dropping (somewhere around) here.

Ah, right.

>> And then of course this means Xen heap pages cannot be cleaned up
>> anymore by merely calling free_xenheap_pages() - to get rid of
>> the associated reference, all of them would need to undergo
>> put_page_alloc_ref(), which in turn requires obtaining an extra
>> reference, which in turn introduces another of these ugly
>> theoretical error cases (because get_page() can in principle fail).
>>
>> Therefore I wouldn't outright discard the option of sticking to
>> the original model. It would then better be properly described
>> somewhere, and we would likely want to put some check in place to
>> make sure such put_page() can't go unnoticed anymore when sitting
>> too late on the cleanup path (which may be difficult to arrange
>> for).
> 
> I agree that some rules are in desperate need of writing down.
> 
> However, given the catastrophic mess that is our reference counting and
> cleanup paths, and how easy it is to get things wrong, I'm very
> disinclined to permit a rule which forces divergent cleanup logic.
> 
> Making the cleanup paths non-divergent is the fix to removing swathes of
> dubious/buggy logic, and removing a steady stream of memory leaks, etc.
> 
> In particular, I don't think its acceptable to special case the cleanup
> rules in the domain_create() error path simply because we blindly reset
> the reference count when it still contains real information.

Of course I agree in principle. The question is whether this is a
good time for such a more extensive rework. IOW I wonder if there's
an immediate bug to be fixed now and then some rework to be done
for 4.16.

Jan

