Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CB727BFD4
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 10:44:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNBEU-0001BT-Lz; Tue, 29 Sep 2020 08:43:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNBET-0001BO-2u
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 08:43:33 +0000
X-Inumbo-ID: 8c47f868-979e-4fed-b485-222dbb7483c1
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c47f868-979e-4fed-b485-222dbb7483c1;
 Tue, 29 Sep 2020 08:43:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601369010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JuuXIxlq0vRt4sxWiD/nBn72GanQ76CQ+QYyl4s0mpA=;
 b=DbPRoxMdmCk6sKRsAE0u5tZM/pBbo7kwtzzAmcPqTcpBDbOiW85Q9THijx+JgJMafLhNra
 O5bbOsip4V0IVQXp82Z23nPnElWpaxaXJMwbQBEbtpJ6jlaNnSZJYjiULkRAjnWaYOs5ra
 bjNCEyotONxarsReFpfIe6If2DDM/UU=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 48C0DAEA2;
 Tue, 29 Sep 2020 08:43:30 +0000 (UTC)
Subject: Re: [PATCH] x86/HVM: refine when to send mapcache invalidation
 request to qemu
To: paul@xen.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f92f62bf-2f8d-34db-4be5-d3e6a4b9d580@suse.com>
 <002f01d6958a$22e61da0$68b258e0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dde50690-52d7-b85c-3715-8660de617835@suse.com>
Date: Tue, 29 Sep 2020 10:43:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <002f01d6958a$22e61da0$68b258e0$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.09.2020 13:25, Paul Durrant wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 28 September 2020 11:44
>>
>> For one it was wrong to send the request only upon a completed
>> hypercall: Even if only part of it completed before getting preempted,
>> invalidation ought to occur. Therefore fold the two return statements.
>>
>> And then XENMEM_decrease_reservation isn't the only means by which pages
>> can get removed from a guest, yet all removals ought to be signaled to
>> qemu. Put setting of the flag into the central p2m_remove_page()
>> underlying all respective hypercalls.
> 
> Actually, does this catch all the cases? Would it be better to push the
> check into p2m_set_entry() where we displace a ram entry? (I think it
> would be possible, for instance, for map_mmio_regions() to directly
> displace ram).

I did consider this, but my fear of going too far (and adding perhaps
many false positives) was too large. For the specific example of
map_mmio_regions() I'd expect it's the device model anyway which
calls it, and it hence shouldn't be in need of telling. But yes, if
there are multiple emulators, others than the one doing the change
may need knowing.

But perhaps PoD is in even more immediate need of this, when
transitioning a GFN from RAM to PoD, especially outside of the
context of p2m_pod_decrease_reservation()? In this case things
happen behind the guest's back, i.e. in particular outside of a
hypercall, and hence there would again be the problem from where to
properly send the request. IOW I'm struggling to ascertain whether
putting another instance of the sending onto the tail of
hvm_hap_nested_page_fault() would work correctly, or what the
conditions are for this to be done without interfering with other
requests which may be pending.

>> Plus finally there's no point sending the request for the local domain
>> when the domain acted upon is a different one. If anything that domain's
>> qemu's mapcache may need invalidating, but it's unclear how useful this
>> would be: That remote domain may not execute hypercalls at all, and
>> hence may never make it to the point where the request actually gets
>> issued. I guess the assumption is that such manipulation is not supposed
>> to happen anymore once the guest has been started?
> 
> Either that or the code was based on a false assumption was always
> occurring on the current domain.

When the code was added, I think this assumption was reasonable.
There was not even a remote idea at that point of a HVM(-like)
domain managing other domains. It was later on when it was missed to
update this logic.

> I also wonder whether the test-and-clear in hvm_hypercall() is really
> the right thing to do. E.g. if two vcpus decrease reservation at the
> same time, only one would end up waiting on the send_invalidate_req().

Hmm, yes, the flag wants to be per vCPU. Which will make remote
manipulation (if such was permitted to occur) even more awkward.

> Also, the pages will have been freed back to heap before invalidate
> is sent so I guess it is possible for a domain to use its qemu
> process to attack pages that may have been re-assigned?

Not for a PV domain - there page refs will be held by the mappings in
the dm domain(s). For PVH (which isn't supported yet for anything
other than being an ordinary DomU) this would indeed be a problem,
for there not being any similar ref-counting when inserting into /
removing from the p2m.

Jan

