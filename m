Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3612DCD0F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 08:49:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55739.97116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpo2J-0003hb-UJ; Thu, 17 Dec 2020 07:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55739.97116; Thu, 17 Dec 2020 07:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpo2J-0003hC-Qz; Thu, 17 Dec 2020 07:49:19 +0000
Received: by outflank-mailman (input) for mailman id 55739;
 Thu, 17 Dec 2020 07:49:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8YGc=FV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpo2I-0003h7-ES
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 07:49:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db865477-619f-4346-af7f-0e79e338809e;
 Thu, 17 Dec 2020 07:49:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BB8A4AC7B;
 Thu, 17 Dec 2020 07:49:16 +0000 (UTC)
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
X-Inumbo-ID: db865477-619f-4346-af7f-0e79e338809e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608191356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yt7QC8uq/oNoEVftnqKF6ElnnEmWsJeB1lmIuj1On+4=;
	b=MC3lPtoQQ0oxWT9ahPpfQb+drdqvz7ipTyRKNz8yALQqx000hhU9nS4D05jk1xY9F+Vx6u
	v80Mrz1DfiPPBCjDwqrChqJgswaAX7eSrH3gBNlzBkrEWh1giOyn8i7dWKEMRq/KkuWNRy
	qLDd07NXeW+1uCr4qR18gBfezlJT2zU=
Subject: Re: [PATCH v3 1/8] xen/cpupool: support moving domain between
 cpupools with different granularity
To: Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20201209160956.32456-1-jgross@suse.com>
 <20201209160956.32456-2-jgross@suse.com>
 <a22954117d8dd36fc0e1b9470efb72c5b80ad393.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <627b62f4-1011-36fa-9623-bbd30834010a@suse.com>
Date: Thu, 17 Dec 2020 08:49:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <a22954117d8dd36fc0e1b9470efb72c5b80ad393.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 16.12.2020 18:52, Dario Faggioli wrote:
> On Wed, 2020-12-09 at 17:09 +0100, Juergen Gross wrote:
>> When moving a domain between cpupools with different scheduling
>> granularity the sched_units of the domain need to be adjusted.
>>
>> Do that by allocating new sched_units and throwing away the old ones
>> in sched_move_domain().
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
> This looks fine, and can have:
> 
> Reviewed-by: Dario Faggioli <dfaggioli@suse.com>
> 
> I would only have one request. It's not a huge deal, and probably not
> worth a resend only for that, but if either you or the committer are up
> for complying with that in whatever way you find the most suitable,
> that would be great.

I'd certainly be okay making this adjustment while committing, as
long as Jürgen agrees. With ...

> I.e., can we...
>> ---
>>  xen/common/sched/core.c | 121 ++++++++++++++++++++++++++++++--------
>> --
>>  1 file changed, 90 insertions(+), 31 deletions(-)
>>
>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>> index a429fc7640..2a61c879b3 100644
>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>>
>> [...]
>> -    old_ops = dom_scheduler(d);
>>      old_domdata = d->sched_priv;
>>
> Move *here* (i.e., above this new call to cpumask_first()) the comment
> that is currently inside the loop?
>>  
>> +    new_p = cpumask_first(d->cpupool->cpu_valid);
>>      for_each_sched_unit ( d, unit )
>>      {
>> +        spinlock_t *lock;
>> +
>> +        /*
>> +         * Temporarily move all units to same processor to make
>> locking
>> +         * easier when moving the new units to the new processors.
>> +         */
>>
> This one here, basically ^^^

... this comment moved out of here, I'd be tempted to suggest to
make ...

>> +        lock = unit_schedule_lock_irq(unit);

... this the variable's initializer then at the same time.

Jan

