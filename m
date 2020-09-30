Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F369427E108
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 08:26:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431.1305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNVZ1-0007UN-Ca; Wed, 30 Sep 2020 06:26:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431.1305; Wed, 30 Sep 2020 06:26:07 +0000
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
	id 1kNVZ1-0007Tx-8M; Wed, 30 Sep 2020 06:26:07 +0000
Received: by outflank-mailman (input) for mailman id 431;
 Wed, 30 Sep 2020 06:26:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNVYz-0007TQ-JP
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 06:26:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec6f1e47-8013-4089-8f09-6d66f70f17de;
 Wed, 30 Sep 2020 06:26:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3D1F9B163;
 Wed, 30 Sep 2020 06:26:04 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNVYz-0007TQ-JP
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 06:26:05 +0000
X-Inumbo-ID: ec6f1e47-8013-4089-8f09-6d66f70f17de
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ec6f1e47-8013-4089-8f09-6d66f70f17de;
	Wed, 30 Sep 2020 06:26:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601447164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8iVKlrraCKO0fSyoRY7g721MHT9d02MylafBD5K4sYI=;
	b=m0ON7+O0sCLaOepQ/wuz+f4+V5ei0u8ryHVFDtta4rdHAiI5kzOoFThsvQ7IZUthedTV6z
	VX8kZjMF/iN2E3oG0RVKVETzJ71YkuPtgkP6zdIZSyiIB2f8tki1T3Akjd7BlaqGa7zV82
	QyRuEwaqhensXLQGVDF0wutvowKazVs=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3D1F9B163;
	Wed, 30 Sep 2020 06:26:04 +0000 (UTC)
Subject: Re: [PATCH 11/12] evtchn: convert vIRQ lock to an r/w one
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <6e529147-2a76-bc28-ac16-21fc9a2c8f03@suse.com>
 <56faf769-d305-22d3-c3fe-2f9d767f0f07@xen.org>
 <60490a6c-593b-7aed-5e83-b0418500eed2@suse.com>
 <c4de244b-417e-39cb-59b0-dbda7108dc21@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <03d30b08-c0ce-0d24-444d-ec20f3528039@suse.com>
Date: Wed, 30 Sep 2020 08:26:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c4de244b-417e-39cb-59b0-dbda7108dc21@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.09.2020 19:18, Julien Grall wrote:
> On 29/09/2020 14:37, Jan Beulich wrote:
>> On 29.09.2020 15:03, Julien Grall wrote:
>>> I am thinking that it may be easier to hold the write lock when doing
>>> the update.
>>
>> ... perhaps this is indeed better. I have to admit that I never
>> fully understood the benefit of using spin_barrier() in this code
>> (as opposed to the use in evtchn_destroy()).
> 
> I am not entirely sure either. It looks like it is an attempt to make 
> v->virq_to_evtchn[X] visible without holding a lock.
> 
> Any holder of the lock after spin_barrier() has completed will read 0 
> and not try to use the lock.

I'm not sure I follow: A holder of the lock is obviously already
making use of the lock. Or are you talking of two different locks
here (recall that before XSA-343 there was just one lock involved
in sending)?

> But the update of v->virq_to_evtchn[X] should have used either 
> ACCESS_ONCE() or write_atomic().

Of course, like in so many other places in the code base.

Jan

