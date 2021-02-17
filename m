Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D518C31D695
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 09:30:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86171.161492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCIE8-0004Mj-Kv; Wed, 17 Feb 2021 08:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86171.161492; Wed, 17 Feb 2021 08:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCIE8-0004MM-He; Wed, 17 Feb 2021 08:30:28 +0000
Received: by outflank-mailman (input) for mailman id 86171;
 Wed, 17 Feb 2021 08:30:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCIE7-0004MG-6s
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 08:30:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c92ddd4-e935-4f56-99ac-035d70cb1833;
 Wed, 17 Feb 2021 08:30:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7D70DB03A;
 Wed, 17 Feb 2021 08:30:25 +0000 (UTC)
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
X-Inumbo-ID: 2c92ddd4-e935-4f56-99ac-035d70cb1833
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613550625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XnR69bt22wd/7RRrZ2BwquGMng6qj0XhIE7ADQoX+Ns=;
	b=B95tbhCRzNRSVm9zs71qMpOqCsGTbisZDDfnSi6nNq6keMB1BlgvuYsUNTeXVrD4qlOFR8
	NIaWPxfvOfyztCSb95/LLtf33SBRMrJoEQwSH4VhXThSjr6OuDkrIRCUFJJe4Nc5dF1hpR
	haSvDBAKj3QYhA/3I7cx5DcLKqUpNIo=
Subject: Ping: [PATCH v2 2/2] IOREQ: refine when to send mapcache invalidation
 request
From: Jan Beulich <jbeulich@suse.com>
To: paul@xen.org
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <0e7265fe-8d89-facb-790d-9232c742c3fa@suse.com>
 <e2682f84-b3bb-b9fb-edd8-863b9036de95@suse.com>
 <03fb01d6fad7$c39087b0$4ab19710$@xen.org>
 <ad73c330-4cbd-0ee4-fee7-2453dab00eef@suse.com>
Message-ID: <006bd542-e213-a6ad-7812-e91fed7093a3@suse.com>
Date: Wed, 17 Feb 2021 09:30:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <ad73c330-4cbd-0ee4-fee7-2453dab00eef@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Paul (or others), thoughts?

On 04.02.2021 12:24, Jan Beulich wrote:
> On 04.02.2021 10:26, Paul Durrant wrote:
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: 02 February 2021 15:15
>>>
>>> XENMEM_decrease_reservation isn't the only means by which pages can get
>>> removed from a guest, yet all removals ought to be signaled to qemu. Put
>>> setting of the flag into the central p2m_remove_page() underlying all
>>> respective hypercalls as well as a few similar places, mainly in PoD
>>> code.
>>>
>>> Additionally there's no point sending the request for the local domain
>>> when the domain acted upon is a different one. The latter domain's ioreq
>>> server mapcaches need invalidating. We assume that domain to be paused
>>> at the point the operation takes place, so sending the request in this
>>> case happens from the hvm_do_resume() path, which as one of its first
>>> steps calls handle_hvm_io_completion().
>>>
>>> Even without the remote operation aspect a single domain-wide flag
>>> doesn't do: Guests may e.g. decrease-reservation on multiple vCPU-s in
>>> parallel. Each of them needs to issue an invalidation request in due
>>> course, in particular because exiting to guest context should not happen
>>> before the request was actually seen by (all) the emulator(s).
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> v2: Preemption related adjustment split off. Make flag per-vCPU. More
>>>     places to set the flag. Also handle acting on a remote domain.
>>>     Re-base.
>>
>> I'm wondering if a per-vcpu flag is overkill actually. We just need
>> to make sure that we don't miss sending an invalidation where
>> multiple vcpus are in play. The mapcache in the emulator is global
>> so issuing an invalidate for every vcpu is going to cause an
>> unnecessary storm of ioreqs, isn't it?
> 
> The only time a truly unnecessary storm would occur is when for
> an already running guest mapcache invalidation gets triggered
> by a remote domain. This should be a pretty rare event, so I
> think the storm in this case ought to be tolerable.
> 
>> Could we get away with the per-domain atomic counter?
> 
> Possible, but quite involved afaict: The potential storm above
> is the price to pay for the simplicity of the model. It is
> important to note that while we don't need all of the vCPU-s
> to send these ioreqs, we need all of them to wait for the
> request(s) to be acked. And this waiting is what we get "for
> free" using the approach here, whereas we'd need to introduce
> new logic for this with an atomic counter (afaict at least).
> 
> Jan
> 


