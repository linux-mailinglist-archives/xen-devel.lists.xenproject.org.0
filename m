Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1412527870E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 14:23:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLmjQ-0006FJ-1y; Fri, 25 Sep 2020 12:21:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9v36=DC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kLmjO-0006FE-N4
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 12:21:42 +0000
X-Inumbo-ID: 6e1ffdd0-596f-4a9b-9086-c83985261007
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e1ffdd0-596f-4a9b-9086-c83985261007;
 Fri, 25 Sep 2020 12:21:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601036500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wo36GJwwCWVvGa3P9YUx0/2YmQOuoWy31b/cIZWhB0g=;
 b=CIZf+XxKsIKK4uTv5fSvAP2col49ha4k5nD8sDGok2QGpr/UQ3GQlRjfNB8in984BF+/Xx
 PPTVdd0uptY3VOKEEpKUHIL+m8ienFSHyif+70MzEjzT4AXNC+Bpb5CpUaqN4PjLm0ecfQ
 QoK9zk8Pf6TWMX+OtUj0XH73KC6MAt0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1CCF7ABF4;
 Fri, 25 Sep 2020 12:21:40 +0000 (UTC)
Subject: Re: [PATCH] evtchn/Flask: pre-allocate node on send path
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <f633e95e-11e7-ccfc-07ce-7cc817fcd7fe@suse.com>
 <8237e286-168f-a4e7-be8b-aba5ff781e7c@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <706b94ae-ca05-2218-6025-e5d62297dda6@suse.com>
Date: Fri, 25 Sep 2020 14:21:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <8237e286-168f-a4e7-be8b-aba5ff781e7c@xen.org>
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

On 25.09.2020 12:34, Julien Grall wrote:
> On 24/09/2020 11:53, Jan Beulich wrote:
>> xmalloc() & Co may not be called with IRQs off, or else check_lock()
>> will have its assertion trigger about locks getting acquired
>> inconsistently. Re-arranging the locking in evtchn_send() doesn't seem
>> very reasonable, especially since the per-channel lock was introduced to
>> avoid acquiring the per-domain event lock on the send paths. Issue a
>> second call to xsm_evtchn_send() instead, before acquiring the lock, to
>> give XSM / Flask a chance to pre-allocate whatever it may need.
> 
> This is the sort of fall-out I was expecting when we decide to turn off 
> the interrupts for big chunk of code. I couldn't find any at the time 
> though...
> 
> Can you remind which caller of send_guest{global, vcpu}_virq() will call 
> them with interrupts off?

I don't recall which one of the two it was that I hit; we wanted
both to use the lock anyway. send_guest_pirq() very clearly also
gets called with IRQs off.

> Would it be possible to consider deferring the call to a softirq 
> taslket? If so, this would allow us to turn the interrupts again.

Of course this is in principle possible; the question is how
involved this is going to get. However, on x86 oprofile's call to
send_guest_vcpu_virq() can't easily be replaced - it's dangerous
enough already that in involves locks in NMI context. I don't
fancy seeing it use more commonly used ones.

Jan

