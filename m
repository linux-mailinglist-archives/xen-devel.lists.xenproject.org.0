Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D10278CB7
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 17:30:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLpg7-0002eA-Fx; Fri, 25 Sep 2020 15:30:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9v36=DC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kLpg5-0002e3-HI
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 15:30:29 +0000
X-Inumbo-ID: 2c8e3783-ade4-42de-93a0-8d476697a262
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c8e3783-ade4-42de-93a0-8d476697a262;
 Fri, 25 Sep 2020 15:30:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601047827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yBxW3rA4tbYoGwncwbDI+eLUD5QU/r16zBMmtFzr0CE=;
 b=KhL3s+m2i10zg3/8LUj+tkQOcLK6+UQKpzuOHTXsIiLZGtC6wlGQpoH4HoSznQ/YXCOjnO
 ziRSntrzuV+dahaRDP/9YgueLb2L90eusHyyTuOc5rrbFsU+GR1XmyIJgqSiEWkOwAciYg
 2IIm4SoDz6MHkvl1KsJoUqO/7sWw/c0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 92A78ADCA;
 Fri, 25 Sep 2020 15:30:27 +0000 (UTC)
Subject: Re: [PATCH] evtchn/Flask: pre-allocate node on send path
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <f633e95e-11e7-ccfc-07ce-7cc817fcd7fe@suse.com>
 <8237e286-168f-a4e7-be8b-aba5ff781e7c@xen.org>
 <706b94ae-ca05-2218-6025-e5d62297dda6@suse.com>
 <4390eb35-768e-1ca1-099e-da33da9f939e@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fa46f884-ce64-d17d-9924-f90d80ad6dee@suse.com>
Date: Fri, 25 Sep 2020 17:30:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <4390eb35-768e-1ca1-099e-da33da9f939e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 25.09.2020 16:57, Jürgen Groß wrote:
> On 25.09.20 14:21, Jan Beulich wrote:
>> On 25.09.2020 12:34, Julien Grall wrote:
>>> On 24/09/2020 11:53, Jan Beulich wrote:
>>>> xmalloc() & Co may not be called with IRQs off, or else check_lock()
>>>> will have its assertion trigger about locks getting acquired
>>>> inconsistently. Re-arranging the locking in evtchn_send() doesn't seem
>>>> very reasonable, especially since the per-channel lock was introduced to
>>>> avoid acquiring the per-domain event lock on the send paths. Issue a
>>>> second call to xsm_evtchn_send() instead, before acquiring the lock, to
>>>> give XSM / Flask a chance to pre-allocate whatever it may need.
>>>
>>> This is the sort of fall-out I was expecting when we decide to turn off
>>> the interrupts for big chunk of code. I couldn't find any at the time
>>> though...
>>>
>>> Can you remind which caller of send_guest{global, vcpu}_virq() will call
>>> them with interrupts off?
>>
>> I don't recall which one of the two it was that I hit; we wanted
>> both to use the lock anyway. send_guest_pirq() very clearly also
>> gets called with IRQs off.
>>
>>> Would it be possible to consider deferring the call to a softirq
>>> taslket? If so, this would allow us to turn the interrupts again.
>>
>> Of course this is in principle possible; the question is how
>> involved this is going to get. However, on x86 oprofile's call to
>> send_guest_vcpu_virq() can't easily be replaced - it's dangerous
>> enough already that in involves locks in NMI context. I don't
>> fancy seeing it use more commonly used ones.
> 
> Is it really so hard to avoid calling send_guest_vcpu_virq() in NMI
> context?
> 
> Today it is called only if the NMI happened inside the guest, so the
> main Xen stack is unused at this time. It should be rather straight
> forward to mimic a stack frame on the main stack and iret to a special
> handler from NMI context. This handler would then call
> send_guest_vcpu_virq() and return to the guest.

Quite possible that it's not overly difficult to arrange for. But
even with this out of the way I don't really view this softirq
tasklet route as viable; I could be proven wrong by demonstrating
that it's sufficiently straightforward.

Jan

