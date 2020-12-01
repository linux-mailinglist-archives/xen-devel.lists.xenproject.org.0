Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9DE2C9B0F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 10:07:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41777.75214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk1dM-0002qM-Tk; Tue, 01 Dec 2020 09:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41777.75214; Tue, 01 Dec 2020 09:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk1dM-0002px-Q9; Tue, 01 Dec 2020 09:07:40 +0000
Received: by outflank-mailman (input) for mailman id 41777;
 Tue, 01 Dec 2020 09:07:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KrUB=FF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kk1dL-0002ps-NE
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 09:07:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b003c577-5e7c-4d79-8fb4-920b04642b5d;
 Tue, 01 Dec 2020 09:07:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 12AD8AB7F;
 Tue,  1 Dec 2020 09:07:38 +0000 (UTC)
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
X-Inumbo-ID: b003c577-5e7c-4d79-8fb4-920b04642b5d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606813658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4afmUn79aMo+7zFP+9CWyAWfYk6rLfDq5W/VGJdw1LQ=;
	b=Ka1c1ChuHG6f2cKd9MNL1F3kaRbEwEJ26cGtbPg0hy9mVDSLvzcux9no2t/SVyZ2R5q8kF
	sjBsPteM3Y/7XxHtwnT3KLv3o65onWt3CCE8KK1Mxht7Q4lH35sOkIFMs/k70n156kVXJq
	l3apbpvQH+gdG4uQ1AZ9DhGAX3lossY=
Subject: Re: [PATCH v2 04/17] xen/cpupool: switch cpupool id to unsigned
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-5-jgross@suse.com>
 <a0bac022-fe6e-aae6-6d07-6a2b9bc492b3@suse.com>
 <eed1baac-a6eb-f10b-7272-742c08f5124e@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e6cc3d1f-f0c5-f32e-db9c-4fc9298c2a45@suse.com>
Date: Tue, 1 Dec 2020 10:07:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <eed1baac-a6eb-f10b-7272-742c08f5124e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.12.2020 10:01, Jürgen Groß wrote:
> On 01.12.20 09:55, Jan Beulich wrote:
>> On 01.12.2020 09:21, Juergen Gross wrote:
>>> @@ -243,11 +243,11 @@ void cpupool_put(struct cpupool *pool)
>>>    * - unknown scheduler
>>>    */
>>>   static struct cpupool *cpupool_create(
>>> -    int poolid, unsigned int sched_id, int *perr)
>>> +    unsigned int poolid, unsigned int sched_id, int *perr)
>>>   {
>>>       struct cpupool *c;
>>>       struct cpupool **q;
>>> -    int last = 0;
>>> +    unsigned int last = 0;
>>>   
>>>       *perr = -ENOMEM;
>>>       if ( (c = alloc_cpupool_struct()) == NULL )
>>> @@ -256,7 +256,7 @@ static struct cpupool *cpupool_create(
>>>       /* One reference for caller, one reference for cpupool_destroy(). */
>>>       atomic_set(&c->refcnt, 2);
>>>   
>>> -    debugtrace_printk("cpupool_create(pool=%d,sched=%u)\n", poolid, sched_id);
>>> +    debugtrace_printk("cpupool_create(pool=%u,sched=%u)\n", poolid, sched_id);
>>>   
>>>       spin_lock(&cpupool_lock);
>>
>> Below from here we have
>>
>>      c->cpupool_id = (poolid == CPUPOOLID_NONE) ? (last + 1) : poolid;
>>
>> which I think can (a) wrap to zero and (b) cause a pool with id
>> CPUPOOLID_NONE to be created. The former is bad in any event, and
>> the latter will cause confusion at least with cpupool_add_domain()
>> and cpupool_get_id(). I realize this is a tangential problem, i.e.
>> may want fixing in a separate change.
> 
> Yes, this is an issue today already, and it is fixed in patch 5.
> 
>>
>>> --- a/xen/common/sched/private.h
>>> +++ b/xen/common/sched/private.h
>>> @@ -505,8 +505,8 @@ static inline void sched_unit_unpause(const struct sched_unit *unit)
>>>   
>>>   struct cpupool
>>>   {
>>> -    int              cpupool_id;
>>> -#define CPUPOOLID_NONE    (-1)
>>> +    unsigned int     cpupool_id;
>>> +#define CPUPOOLID_NONE    (~0U)
>>
>> How about using XEN_SYSCTL_CPUPOOL_PAR_ANY here? Furthermore,
>> together with the remark above, I think you also want to consider
>> the case of sizeof(unsigned int) > sizeof(uint32_t).
> 
> With patch 5 this should be completely fine.

Ah - I didn't expect this kind of fix in a patch with that title,
but yes.

Jan

