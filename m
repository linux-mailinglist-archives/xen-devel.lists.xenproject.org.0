Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 233CE2A0903
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 16:02:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15959.39215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYVuc-0004px-SE; Fri, 30 Oct 2020 15:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15959.39215; Fri, 30 Oct 2020 15:01:54 +0000
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
	id 1kYVuc-0004pX-OY; Fri, 30 Oct 2020 15:01:54 +0000
Received: by outflank-mailman (input) for mailman id 15959;
 Fri, 30 Oct 2020 15:01:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y1I6=EF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kYVub-0004pS-Gu
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 15:01:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5103f6e1-7492-40b9-a3a9-734403c0e18e;
 Fri, 30 Oct 2020 15:01:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 05117B1FC;
 Fri, 30 Oct 2020 15:01:52 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=y1I6=EF=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kYVub-0004pS-Gu
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 15:01:53 +0000
X-Inumbo-ID: 5103f6e1-7492-40b9-a3a9-734403c0e18e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5103f6e1-7492-40b9-a3a9-734403c0e18e;
	Fri, 30 Oct 2020 15:01:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604070112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zwLndfXZ1d4blZ0iQixz0yi/UIKpYmHe+FgEQr+3CQQ=;
	b=bCW1MLjWgS6LUsUvaTjyD7pTrpHi/M5YJT/Gw/6+cdjxUsxFdayhOFoHuuS3taME5dqmr9
	rewrzRJWWZrvoIQs5Y3tTTZ2jVbF/elOIiZ78UqCBWXv8SfffD9kPQqZelqUD2l0URVuCh
	ppM/vy2AM1mMFqdLv5+cmGV9Pu6Yt80=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 05117B1FC;
	Fri, 30 Oct 2020 15:01:52 +0000 (UTC)
Subject: Re: [PATCH 1/2] xen/spinlocks: spin_trylock with interrupts off is
 always fine
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201030142500.5464-1-jgross@suse.com>
 <20201030142500.5464-2-jgross@suse.com>
 <52ae01f4-b887-15da-aecb-b29b7c55a057@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <88f1989d-7df3-fc86-b6d3-87bdd1f4573b@suse.com>
Date: Fri, 30 Oct 2020 16:01:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <52ae01f4-b887-15da-aecb-b29b7c55a057@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.10.20 15:59, Jan Beulich wrote:
> On 30.10.2020 15:24, Juergen Gross wrote:
>> Even if a spinlock was taken with interrupts on before calling
>> spin_trylock() with interrupts off is fine, as it can't block.
>>
>> Add a bool parameter "try" to check_lock() for handling this case.
>>
>> Remove the call of check_lock() from _spin_is_locked(), as it really
>> serves no purpose and it can even lead to false crashes, e.g. when
>> a lock was taken correctly with interrupts enabled and the call of
>> _spin_is_locked() happened with interrupts off. In case the lock is
>> taken with wrong interrupt flags this will be catched when taking
>> the lock.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit I guess ...
> 
>> @@ -42,7 +42,13 @@ static void check_lock(union lock_debug *debug)
>>        *
>>        * To guard against this subtle bug we latch the IRQ safety of every
>>        * spinlock in the system, on first use.
>> +     *
>> +     * A spin_trylock() or spin_is_locked() with interrupts off is always
>> +     * fine, as those can't block and above deadlock scenario doesn't apply.
>>        */
>> +    if ( try && irq_safe )
>> +        return;
> 
> ... the reference to spin_is_locked() here wants dropping,
> since ...
> 
>> @@ -220,8 +226,6 @@ void _spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
>>   
>>   int _spin_is_locked(spinlock_t *lock)
>>   {
>> -    check_lock(&lock->debug);
> 
> ... you drop the call here?

Oh yes, this was a late modification and I didn't adapt the comment
accordingly. Thanks for spotting it.


Juergen

