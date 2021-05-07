Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 744043764F7
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 14:16:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124030.234067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lezOG-0007rT-FG; Fri, 07 May 2021 12:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124030.234067; Fri, 07 May 2021 12:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lezOG-0007o8-BI; Fri, 07 May 2021 12:15:32 +0000
Received: by outflank-mailman (input) for mailman id 124030;
 Fri, 07 May 2021 12:15:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rJTn=KC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lezOF-0007o2-Ct
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 12:15:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0cdbe640-e4b2-42c0-8dd4-b69e6b624250;
 Fri, 07 May 2021 12:15:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B6913AF9A;
 Fri,  7 May 2021 12:15:28 +0000 (UTC)
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
X-Inumbo-ID: 0cdbe640-e4b2-42c0-8dd4-b69e6b624250
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620389728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2gt06RgcdtU2VepUwGZRx30NWr1z7jooyDq18fA3ggQ=;
	b=R4k7f450pG8qPTl/jPP/ba0C1GP+YyV9omsDISAh45x8XsyZ/1UTDeI1ksDscly4No57sW
	OGllcMvmukfmffU8obdyuWxi8rwEEq3DLn3yEAK5OLeUgxlirkgnCjcOzfrAdbjSnMAC89
	4q2ZGRRJPTI0zp61p2qRwIDjqONakQA=
Subject: Re: [PATCH RFC 1/2] docs/design: Add a design document for Live
 Update
To: Julien Grall <julien@xen.org>
Cc: dwmw2@infradead.org, paul@xen.org, hongyxia@amazon.com,
 raphning@amazon.com, mahgul@amazon.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210506104259.16928-1-julien@xen.org>
 <20210506104259.16928-2-julien@xen.org>
 <f51b2ef6-3998-7371-cea9-502c5c9f8afa@suse.com>
 <2a497e4c-d5a3-1da2-699e-1e31740a81f0@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <324f10b9-2b1f-ec61-1816-44c960c285f8@suse.com>
Date: Fri, 7 May 2021 14:15:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <2a497e4c-d5a3-1da2-699e-1e31740a81f0@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.05.2021 13:44, Julien Grall wrote:
> On 07/05/2021 10:52, Jan Beulich wrote:
>> On 06.05.2021 12:42, Julien Grall wrote:
>>> +## Trigger
>>> +
>>> +Live update is built on top of the kexec interface to prepare the command line,
>>> +load xen#2 and trigger the operation.  A new kexec type has been introduced
>>> +(*KEXEC\_TYPE\_LIVE\_UPDATE*) to notify Xen to Live Update.
>>> +
>>> +The Live Update will be triggered from outside the hypervisor (e.g. dom0
>>> +userspace).  Support for the operation has been added in kexec-tools 2.0.21.
>>> +
>>> +All the domains will be paused before xen#1 is starting to save the states.
>>> +In Xen, *domain\_pause()* will pause the vCPUs as soon as they can be re-
>>> +scheduled.  In other words, a pause request will not wait for asynchronous
>>> +requests (e.g. I/O) to finish.  For Live Update, this is not an ideal time to
>>> +pause because it will require more xen#1 internal state to be transferred.
>>> +Therefore, all the domains will be paused at an architectural restartable
>>> +boundary.
>>
>> To me this leaves entirely unclear what this then means. domain_pause()
>> not being suitable is one thing, but what _is_ suitable seems worth
>> mentioning.
> 
> I haven't mentioned anything because there is nothing directly suitable 
> for Live Update. What we want is a behavior similar to 
> ``domain_shutdown()`` but without cloberring ``d->shutdown_code()`` as 
> we would need to transfer it.
> 
> This is quite similar to what live migration is doing as, AFAICT, it 
> will "shutdown" the domain with the reason SHUTDOWN_suspend.
> 
>> Among other things I'd be curious to know what this would
>> mean for pending hypercall continuations.
> 
> Most of the hypercalls are fine because the state is encoded in the vCPU 
> registers and can continue on a new Xen.
> 
> The problematic one are:
>    1) Hypercalls running in a tasklet (mostly SYSCTL_*)
>    2) XEN_DOMCTL_destroydomain
>    3) EVTCHNOP_reset{,_cont}

4) paging_domctl_continuation
5) various PV mm hypercalls leaving state in struct page_info or
the old_guest_table per-vCPU field

> For 1), we need to make sure the tasklets are completed before Live 
> Update happens.
> 
> For 2), we could decide to wait until it is finished but it can take a 
> while (on some of our testing it takes ~20ish to destroy) or it can 
> never finish (e.g. zombie domain). The question is still open on how to 
> deal with them because we can't really recreate them using 
> domain_create() (some state may have already been relinquished).
> 
> For 3), you may remember the discussion we had on security ML during 
> XSA-344. One possibility would be to restart the command from scratch 
> (or not transfer the event channel at all).

Yes, I do recall that.

>>> +## Save
>>> +
>>> +xen#1 will be responsible to preserve and serialize the state of each existing
>>> +domain and any system-wide state (e.g M2P).
>>> +
>>> +Each domain will be serialized independently using a modified migration stream,
>>> +if there is any dependency between domains (such as for IOREQ server) they will
>>> +be recorded using a domid. All the complexity of resolving the dependencies are
>>> +left to the restore path in xen#2 (more in the *Restore* section).
>>> +
>>> +At the moment, the domains are saved one by one in a single thread, but it
>>> +would be possible to consider multi-threading if it takes too long. Although
>>> +this may require some adjustment in the stream format.
>>> +
>>> +As we want to be able to Live Update between major versions of Xen (e.g Xen
>>> +4.11 -> Xen 4.15), the states preserved should not be a dump of Xen internal
>>> +structure but instead the minimal information that allow us to recreate the
>>> +domains.
>>> +
>>> +For instance, we don't want to preserve the frametable (and therefore
>>> +*struct page\_info*) as-is because the refcounting may be different across
>>> +between xen#1 and xen#2 (see XSA-299). Instead, we want to be able to recreate
>>> +*struct page\_info* based on minimal information that are considered stable
>>> +(such as the page type).
>>
>> Perhaps leaving it at this very generic description is fine, but I can
>> easily see cases (which may not even be corner ones) where this quickly
>> gets problematic: What if xen#2 has state xen#1 didn't (properly) record?
>> Such information may not be possible to take out of thin air. Is the
>> consequence then that in such a case LU won't work?
> I can see cases where the state may not be record by xen#1, but so far I 
> am struggling to find a case where we could not fake them in xen#2. Do 
> you have any example?

The thing that came to mind were the state representation (and logic)
changes done for XSA-299.

>>> +## Hand over
>>> +
>>> +### Memory usage restrictions
>>> +
>>> +xen#2 must take care not to use any memory pages which already belong to
>>> +guests.  To facilitate this, a number of contiguous region of memory are
>>> +reserved for the boot allocator, known as *live update bootmem*.
>>> +
>>> +xen#1 will always reserve a region just below Xen (the size is controlled by
>>> +the Xen command line parameter liveupdate) to allow Xen growing and provide
>>> +information about LiveUpdate (see the section *Breadcrumb*).  The region will be
>>> +passed to xen#2 using the same command line option but with the base address
>>> +specified.
>>
>> I particularly don't understand the "to allow Xen growing" aspect here:
>> xen#2 needs to be placed in a different memory range anyway until xen#1
>> has handed over control.
>> Are you suggesting it gets moved over to xen#1's
>> original physical range (not necessarily an exact match), and then
>> perhaps to start below where xen#1 started? 
> 
> That's correct.
> 
>> Why would you do this?
> 
> There are a few reasons:
>    1) kexec-tools is in charge of selecting the physical address where 
> the kernel (or Xen in our case) will be loaded. So we need to tell kexec 
> where is a good place to load the new binary.
>    2) xen#2 may end up to be loaded in a "random" and therefore possibly 
> inconvenient place.

"Inconvenient" should be avoidable as long as the needed alignment
can be guaranteed. In particular I don't think there's too much in
the way in order to have (x86) Xen run on physical memory above
4Gb.

>> Xen intentionally lives at a 2Mb boundary, such that in principle (for EFI:
>> in fact) large page mappings are possible.
> 
> Right, xen#2 will still be loaded at a 2MB boundary. But it may be 2MB 
> lower than the original one.

Oh, I see. The wording made be think you would move it down in
smaller steps. I think somewhere (perhaps in a reply to someone
else) it was said that you'd place it such that its upper address
matches that of xen#1.

>> I also see no reason to reuse
>> the same physical area of memory for Xen itself - all you need is for
>> Xen's virtual addresses to be properly mapped to the new physical range.
>> I wonder what I'm missing here.
> It is a known convenient place. It may be difficult to find a similar 
> spot on host that have been long-running.

I'm not convinced: If it was placed in the kexec area at a 2Mb
boundary, it could just run from there. If the kexec area is
large enough, this would work any number of times (as occupied
ranges become available again when the next LU cycle ends).

>>> +For simplicity, additional regions will be provided in the stream.  They will
>>> +consist of region that could be re-used by xen#2 during boot (such as the
>>> +xen#1's frametable memory).
>>> +
>>> +xen#2 must not use any pages outside those regions until it has consumed the
>>> +Live Update data stream and determined which pages are already in use by
>>> +running domains or need to be re-used as-is by Xen (e.g M2P).
>>
>> Is the M2P really in the "need to be re-used" group, not just "can
>> be re-used for simplicity and efficiency reasons"?
> 
> The MFNs are shared with privileged guests (e.g. dom0). So, I believe, 
> the M2P needs to reside at the same place.

Oh, yes, good point.

>>> +## Restore
>>> +
>>> +After xen#2 initialized itself and map the stream, it will be responsible to
>>> +restore the state of the system and each domain.
>>> +
>>> +Unlike the save part, it is not possible to restore a domain in a single pass.
>>> +There are dependencies between:
>>> +
>>> +    1. different states of a domain.  For instance, the event channels ABI
>>> +       used (2l vs fifo) requires to be restored before restoring the event
>>> +       channels.
>>> +    2. the same "state" within a domain.  For instance, in case of PV domain,
>>> +       the pages' ownership requires to be restored before restoring the type
>>> +       of the page (e.g is it an L4, L1... table?).
>>> +
>>> +    3. domains.  For instance when restoring the grant mapping, it will be
>>> +       necessary to have the page's owner in hand to do proper refcounting.
>>> +       Therefore the pages' ownership have to be restored first.
>>> +
>>> +Dependencies will be resolved using either multiple passes (for dependency
>>> +type 2 and 3) or using a specific ordering between records (for dependency
>>> +type 1).
>>> +
>>> +Each domain will be restored in 3 passes:
>>> +
>>> +    * Pass 0: Create the domain and restore the P2M for HVM. This can be broken
>>> +      down in 3 parts:
>>> +      * Allocate a domain via _domain\_create()_ but skip part that requires
>>> +        extra records (e.g HAP, P2M).
>>> +      * Restore any parts which needs to be done before create the vCPUs. This
>>> +        including restoring the P2M and whether HAP is used.
>>> +      * Create the vCPUs. Note this doesn't restore the state of the vCPUs.
>>> +    * Pass 1: It will restore the pages' ownership and the grant-table frames
>>> +    * Pass 2: This steps will restore any domain states (e.g vCPU state, event
>>> +      channels) that wasn't
>>
>> What about foreign mappings (which are part of the P2M)? Can they be
>> validly restored prior to restoring page ownership?
> 
> Our plan is to transfer the P2M as-is because it is used by the IOMMU. 
> So the P2M may be restored before it is fully validated.
> 
>> In how far do you
>> fully trust xen#1's state to be fully consistent anyway, rather than
>> perhaps checking it?
> 
> This is a tricky question. If the state is not consistent, then it may 
> be difficult to get around it. To continue on the example of foreign 
> mapping, what if Xen#2 thinks dom0 has not the right to map it? We can't 
> easily (?) recover from that.
> 
> So far, you need to put some trust in xen#1 state. IOW, you would not be 
> able to blindly replace a reboot with LiveUpdating the hypervisor. This 
> will need to be tested.

But this then eliminates a subset of the intended use cases: If e.g.
a refcounting bug needed to be fixed in Xen, and if you don't know
whether xen#1 has actually accumulated any badness, you still won't
be able to avoid the reboot.

Jan

