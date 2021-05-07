Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 205483764A6
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 13:45:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124020.234055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyu0-0004c8-LX; Fri, 07 May 2021 11:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124020.234055; Fri, 07 May 2021 11:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyu0-0004Zj-Go; Fri, 07 May 2021 11:44:16 +0000
Received: by outflank-mailman (input) for mailman id 124020;
 Fri, 07 May 2021 11:44:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1leytz-0004Zd-1P
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 11:44:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1leytv-0006WS-7A; Fri, 07 May 2021 11:44:11 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1leytu-0002BJ-RV; Fri, 07 May 2021 11:44:11 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=hpoXNdRYfTv2MxY6dItkzard5ajRnFszrdlk9S6/rKY=; b=Z2zAW5WW4ZzP5nGglVODfLL7h+
	wuj7+UDcgaJxymjAV+xaeOycMDjDVrT0MKcVkP+6iHv73JrDZwH2Q5qAG4q5fDyC5S/h2vkDDRYc+
	XHsLQaTt5shPUl3bHw2jKyH07VPgat+NxZm+iXQx55AvZgRWhDCfxpRyDQyTQlU7YHQI=;
Subject: Re: [PATCH RFC 1/2] docs/design: Add a design document for Live
 Update
To: Jan Beulich <jbeulich@suse.com>
Cc: dwmw2@infradead.org, paul@xen.org, hongyxia@amazon.com,
 raphning@amazon.com, mahgul@amazon.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210506104259.16928-1-julien@xen.org>
 <20210506104259.16928-2-julien@xen.org>
 <f51b2ef6-3998-7371-cea9-502c5c9f8afa@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2a497e4c-d5a3-1da2-699e-1e31740a81f0@xen.org>
Date: Fri, 7 May 2021 12:44:08 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <f51b2ef6-3998-7371-cea9-502c5c9f8afa@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 07/05/2021 10:52, Jan Beulich wrote:
> On 06.05.2021 12:42, Julien Grall wrote:
>> +## High-level overview
>> +
>> +Xen has a framework to bring a new image of the Xen hypervisor in memory using
>> +kexec.  The existing framework does not meet the baseline functionality for
>> +Live Update, since kexec results in a restart for the hypervisor, host, Dom0,
>> +and all the guests.
>> +
>> +The operation can be divided in roughly 4 parts:
>> +
>> +    1. Trigger: The operation will by triggered from outside the hypervisor
>> +       (e.g. dom0 userspace).
>> +    2. Save: The state will be stabilized by pausing the domains and
>> +       serialized by xen#1.
>> +    3. Hand-over: xen#1 will pass the serialized state and transfer control to
>> +       xen#2.
>> +    4. Restore: The state will be deserialized by xen#2.
>> +
>> +All the domains will be paused before xen#1 is starting to save the states,
>> +and any domain that was running before Live Update will be unpaused after
>> +xen#2 has finished to restore the states.  This is to prevent a domain to try
>> +to modify the state of another domain while it is being saved/restored.
>> +
>> +The current approach could be seen as non-cooperative migration with a twist:
>> +all the domains (including dom0) are not expected be involved in the Live
>> +Update process.
>> +
>> +The major differences compare to live migration are:
>> +
>> +    * The state is not transferred to another host, but instead locally to
>> +      xen#2.
>> +    * The memory content or device state (for passthrough) does not need to
>> +      be part of the stream. Instead we need to preserve it.
>> +    * PV backends, device emulators, xenstored are not recreated but preserved
>> +      (as these are part of dom0).
> 
> Isn't dom0 too limiting here?

Good point. I can replace with "as these are living outside of the 
hypervisor".

> 
>> +## Trigger
>> +
>> +Live update is built on top of the kexec interface to prepare the command line,
>> +load xen#2 and trigger the operation.  A new kexec type has been introduced
>> +(*KEXEC\_TYPE\_LIVE\_UPDATE*) to notify Xen to Live Update.
>> +
>> +The Live Update will be triggered from outside the hypervisor (e.g. dom0
>> +userspace).  Support for the operation has been added in kexec-tools 2.0.21.
>> +
>> +All the domains will be paused before xen#1 is starting to save the states.
>> +In Xen, *domain\_pause()* will pause the vCPUs as soon as they can be re-
>> +scheduled.  In other words, a pause request will not wait for asynchronous
>> +requests (e.g. I/O) to finish.  For Live Update, this is not an ideal time to
>> +pause because it will require more xen#1 internal state to be transferred.
>> +Therefore, all the domains will be paused at an architectural restartable
>> +boundary.
> 
> To me this leaves entirely unclear what this then means. domain_pause()
> not being suitable is one thing, but what _is_ suitable seems worth
> mentioning.

I haven't mentioned anything because there is nothing directly suitable 
for Live Update. What we want is a behavior similar to 
``domain_shutdown()`` but without cloberring ``d->shutdown_code()`` as 
we would need to transfer it.

This is quite similar to what live migration is doing as, AFAICT, it 
will "shutdown" the domain with the reason SHUTDOWN_suspend.

> Among other things I'd be curious to know what this would
> mean for pending hypercall continuations.

Most of the hypercalls are fine because the state is encoded in the vCPU 
registers and can continue on a new Xen.

The problematic one are:
   1) Hypercalls running in a tasklet (mostly SYSCTL_*)
   2) XEN_DOMCTL_destroydomain
   3) EVTCHNOP_reset{,_cont}

For 1), we need to make sure the tasklets are completed before Live 
Update happens.

For 2), we could decide to wait until it is finished but it can take a 
while (on some of our testing it takes ~20ish to destroy) or it can 
never finish (e.g. zombie domain). The question is still open on how to 
deal with them because we can't really recreate them using 
domain_create() (some state may have already been relinquished).

For 3), you may remember the discussion we had on security ML during 
XSA-344. One possibility would be to restart the command from scratch 
(or not transfer the event channel at all).

> 
>> +## Save
>> +
>> +xen#1 will be responsible to preserve and serialize the state of each existing
>> +domain and any system-wide state (e.g M2P).
>> +
>> +Each domain will be serialized independently using a modified migration stream,
>> +if there is any dependency between domains (such as for IOREQ server) they will
>> +be recorded using a domid. All the complexity of resolving the dependencies are
>> +left to the restore path in xen#2 (more in the *Restore* section).
>> +
>> +At the moment, the domains are saved one by one in a single thread, but it
>> +would be possible to consider multi-threading if it takes too long. Although
>> +this may require some adjustment in the stream format.
>> +
>> +As we want to be able to Live Update between major versions of Xen (e.g Xen
>> +4.11 -> Xen 4.15), the states preserved should not be a dump of Xen internal
>> +structure but instead the minimal information that allow us to recreate the
>> +domains.
>> +
>> +For instance, we don't want to preserve the frametable (and therefore
>> +*struct page\_info*) as-is because the refcounting may be different across
>> +between xen#1 and xen#2 (see XSA-299). Instead, we want to be able to recreate
>> +*struct page\_info* based on minimal information that are considered stable
>> +(such as the page type).
> 
> Perhaps leaving it at this very generic description is fine, but I can
> easily see cases (which may not even be corner ones) where this quickly
> gets problematic: What if xen#2 has state xen#1 didn't (properly) record?
> Such information may not be possible to take out of thin air. Is the
> consequence then that in such a case LU won't work?
I can see cases where the state may not be record by xen#1, but so far I 
am struggling to find a case where we could not fake them in xen#2. Do 
you have any example?

>> +## Hand over
>> +
>> +### Memory usage restrictions
>> +
>> +xen#2 must take care not to use any memory pages which already belong to
>> +guests.  To facilitate this, a number of contiguous region of memory are
>> +reserved for the boot allocator, known as *live update bootmem*.
>> +
>> +xen#1 will always reserve a region just below Xen (the size is controlled by
>> +the Xen command line parameter liveupdate) to allow Xen growing and provide
>> +information about LiveUpdate (see the section *Breadcrumb*).  The region will be
>> +passed to xen#2 using the same command line option but with the base address
>> +specified.
> 
> I particularly don't understand the "to allow Xen growing" aspect here:
> xen#2 needs to be placed in a different memory range anyway until xen#1
> has handed over control.
> Are you suggesting it gets moved over to xen#1's
> original physical range (not necessarily an exact match), and then
> perhaps to start below where xen#1 started? 

That's correct.

> Why would you do this?

There are a few reasons:
   1) kexec-tools is in charge of selecting the physical address where 
the kernel (or Xen in our case) will be loaded. So we need to tell kexec 
where is a good place to load the new binary.
   2) xen#2 may end up to be loaded in a "random" and therefore possibly 
inconvenient place.

> Xen intentionally lives at a 2Mb boundary, such that in principle (for EFI:
> in fact) large page mappings are possible.

Right, xen#2 will still be loaded at a 2MB boundary. But it may be 2MB 
lower than the original one.

> I also see no reason to reuse
> the same physical area of memory for Xen itself - all you need is for
> Xen's virtual addresses to be properly mapped to the new physical range.
> I wonder what I'm missing here.
It is a known convenient place. It may be difficult to find a similar 
spot on host that have been long-running.

> 
>> +For simplicity, additional regions will be provided in the stream.  They will
>> +consist of region that could be re-used by xen#2 during boot (such as the
>> +xen#1's frametable memory).
>> +
>> +xen#2 must not use any pages outside those regions until it has consumed the
>> +Live Update data stream and determined which pages are already in use by
>> +running domains or need to be re-used as-is by Xen (e.g M2P).
> 
> Is the M2P really in the "need to be re-used" group, not just "can
> be re-used for simplicity and efficiency reasons"?

The MFNs are shared with privileged guests (e.g. dom0). So, I believe, 
the M2P needs to reside at the same place.

The efficiency is an additional benefits.

> 
>> +## Restore
>> +
>> +After xen#2 initialized itself and map the stream, it will be responsible to
>> +restore the state of the system and each domain.
>> +
>> +Unlike the save part, it is not possible to restore a domain in a single pass.
>> +There are dependencies between:
>> +
>> +    1. different states of a domain.  For instance, the event channels ABI
>> +       used (2l vs fifo) requires to be restored before restoring the event
>> +       channels.
>> +    2. the same "state" within a domain.  For instance, in case of PV domain,
>> +       the pages' ownership requires to be restored before restoring the type
>> +       of the page (e.g is it an L4, L1... table?).
>> +
>> +    3. domains.  For instance when restoring the grant mapping, it will be
>> +       necessary to have the page's owner in hand to do proper refcounting.
>> +       Therefore the pages' ownership have to be restored first.
>> +
>> +Dependencies will be resolved using either multiple passes (for dependency
>> +type 2 and 3) or using a specific ordering between records (for dependency
>> +type 1).
>> +
>> +Each domain will be restored in 3 passes:
>> +
>> +    * Pass 0: Create the domain and restore the P2M for HVM. This can be broken
>> +      down in 3 parts:
>> +      * Allocate a domain via _domain\_create()_ but skip part that requires
>> +        extra records (e.g HAP, P2M).
>> +      * Restore any parts which needs to be done before create the vCPUs. This
>> +        including restoring the P2M and whether HAP is used.
>> +      * Create the vCPUs. Note this doesn't restore the state of the vCPUs.
>> +    * Pass 1: It will restore the pages' ownership and the grant-table frames
>> +    * Pass 2: This steps will restore any domain states (e.g vCPU state, event
>> +      channels) that wasn't
> 
> What about foreign mappings (which are part of the P2M)? Can they be
> validly restored prior to restoring page ownership?

Our plan is to transfer the P2M as-is because it is used by the IOMMU. 
So the P2M may be restored before it is fully validated.

> In how far do you
> fully trust xen#1's state to be fully consistent anyway, rather than
> perhaps checking it?

This is a tricky question. If the state is not consistent, then it may 
be difficult to get around it. To continue on the example of foreign 
mapping, what if Xen#2 thinks dom0 has not the right to map it? We can't 
easily (?) recover from that.

So far, you need to put some trust in xen#1 state. IOW, you would not be 
able to blindly replace a reboot with LiveUpdating the hypervisor. This 
will need to be tested.

In our PoC, we decided to crash as soon as there is an inconsistent 
state. This avoids to continue running on a possibly unsafe setup but 
will introduce pain to the VM users.

As a future improvement, we could look at been able to Live Update with 
inconsistent state.

> 
>> +A domain should not have a dependency on another domain within the same pass.
>> +Therefore it would be possible to take advantage of all the CPUs to restore
>> +domains in parallel and reduce the overall downtime.
> 
> "Dependency" may be ambiguous here. For example, an interdomain event
> channel to me necessarily expresses a dependency between two domains.

That's a good point. AFAICT, the interdomain can be restored either way. 
So I will rephrase it.

Thank you for the feedback.

Cheers,

-- 
Julien Grall

