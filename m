Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E775278B6B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 16:58:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLpAC-0007gd-BC; Fri, 25 Sep 2020 14:57:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ocWZ=DC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kLpAB-0007gY-E2
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 14:57:31 +0000
X-Inumbo-ID: 7eca7edf-2f80-4a27-8b58-3ead1932f0a0
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7eca7edf-2f80-4a27-8b58-3ead1932f0a0;
 Fri, 25 Sep 2020 14:57:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601045849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xq3i4wvKSwhLGlIBMLf6cQJPpcF+QxhDY1/k2FgR0BI=;
 b=YglL60LCds7Lokaou17kAFJDlkaDQnCWwuI5gr4P+qlduV3X5aDW3f3FyUtIjm1nGB9z/1
 N53Xc0GzlDoTog7R0HTeyZVpuM7iBLma/+YLaEpveTcLPY4n0TL/IQIq2xhO69mdepCJeV
 j1FpBklzIwkqYWpfeU027l7elZnDj8I=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 92A04B011;
 Fri, 25 Sep 2020 14:57:29 +0000 (UTC)
Subject: Re: [PATCH] evtchn/Flask: pre-allocate node on send path
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <f633e95e-11e7-ccfc-07ce-7cc817fcd7fe@suse.com>
 <8237e286-168f-a4e7-be8b-aba5ff781e7c@xen.org>
 <706b94ae-ca05-2218-6025-e5d62297dda6@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4390eb35-768e-1ca1-099e-da33da9f939e@suse.com>
Date: Fri, 25 Sep 2020 16:57:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <706b94ae-ca05-2218-6025-e5d62297dda6@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 25.09.20 14:21, Jan Beulich wrote:
> On 25.09.2020 12:34, Julien Grall wrote:
>> On 24/09/2020 11:53, Jan Beulich wrote:
>>> xmalloc() & Co may not be called with IRQs off, or else check_lock()
>>> will have its assertion trigger about locks getting acquired
>>> inconsistently. Re-arranging the locking in evtchn_send() doesn't seem
>>> very reasonable, especially since the per-channel lock was introduced to
>>> avoid acquiring the per-domain event lock on the send paths. Issue a
>>> second call to xsm_evtchn_send() instead, before acquiring the lock, to
>>> give XSM / Flask a chance to pre-allocate whatever it may need.
>>
>> This is the sort of fall-out I was expecting when we decide to turn off
>> the interrupts for big chunk of code. I couldn't find any at the time
>> though...
>>
>> Can you remind which caller of send_guest{global, vcpu}_virq() will call
>> them with interrupts off?
> 
> I don't recall which one of the two it was that I hit; we wanted
> both to use the lock anyway. send_guest_pirq() very clearly also
> gets called with IRQs off.
> 
>> Would it be possible to consider deferring the call to a softirq
>> taslket? If so, this would allow us to turn the interrupts again.
> 
> Of course this is in principle possible; the question is how
> involved this is going to get. However, on x86 oprofile's call to
> send_guest_vcpu_virq() can't easily be replaced - it's dangerous
> enough already that in involves locks in NMI context. I don't
> fancy seeing it use more commonly used ones.

Is it really so hard to avoid calling send_guest_vcpu_virq() in NMI
context?

Today it is called only if the NMI happened inside the guest, so the
main Xen stack is unused at this time. It should be rather straight
forward to mimic a stack frame on the main stack and iret to a special
handler from NMI context. This handler would then call
send_guest_vcpu_virq() and return to the guest.

This would basically be similar to the Linux kernel's
__run_on_irqstack().


Juergen

