Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D0D3566A8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 10:22:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106489.203642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU3SA-0006Ez-DS; Wed, 07 Apr 2021 08:22:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106489.203642; Wed, 07 Apr 2021 08:22:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU3SA-0006Ea-A9; Wed, 07 Apr 2021 08:22:22 +0000
Received: by outflank-mailman (input) for mailman id 106489;
 Wed, 07 Apr 2021 08:22:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjXx=JE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lU3S8-0006EV-HG
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 08:22:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe0acf2b-6174-45c6-b005-2b425ca1574f;
 Wed, 07 Apr 2021 08:22:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D3540B02A;
 Wed,  7 Apr 2021 08:22:18 +0000 (UTC)
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
X-Inumbo-ID: fe0acf2b-6174-45c6-b005-2b425ca1574f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617783739; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eLoWE++Hfb0OXAUTvq0iO3BKXC4CXas3soxCDljI5AY=;
	b=Kzp6j83t4Ebl64A+AVlG/QI0D0vnjibDBDgAVlTLCwvLYKqJqkd12hVIY8rveTOs6ASM2N
	/CGxiv4U+ygpTE/8nsM7R3RKTX9jIU3PfCuofzAEj5UCLTHN7XTG8fJ7xfneDqFyvYJllX
	CeWOCByYOU51S1eEYYIYD9ODPjM0JTE=
Subject: Re: [PATCH 02/14] xen/sched: Constify name and opt_name in struct
 scheduler
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>, George Dunlap
 <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-3-julien@xen.org>
 <5618bed6-a213-d2c9-4cbf-d95cb4dc02b4@suse.com>
 <00a75c04-fad1-7061-ac39-a811f442db05@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c0648f0f-7384-1556-5693-b8ca431674a8@suse.com>
Date: Wed, 7 Apr 2021 10:22:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <00a75c04-fad1-7061-ac39-a811f442db05@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 06.04.2021 20:24, Julien Grall wrote:
> Hi Jan,
> 
> On 06/04/2021 09:07, Jan Beulich wrote:
>> On 05.04.2021 17:57, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Both name and opt_name are pointing to literal string. So mark both of
>>> the fields as const.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> albeit ...
>>
>>> --- a/xen/common/sched/private.h
>>> +++ b/xen/common/sched/private.h
>>> @@ -272,8 +272,8 @@ static inline spinlock_t *pcpu_schedule_trylock(unsigned int cpu)
>>>   }
>>>   
>>>   struct scheduler {
>>> -    char *name;             /* full name for this scheduler      */
>>> -    char *opt_name;         /* option name for this scheduler    */
>>> +    const char *name;       /* full name for this scheduler      */
>>> +    const char *opt_name;   /* option name for this scheduler    */
>>
>> ... I'd like to suggest considering at least the latter to become
>> an array instead of a pointer - there's little point wasting 8
>> bytes of storage for the pointer when the strings pointed to are
>> all at most 9 bytes long (right now; I don't expect much longer
>> ones to appear).
> 
> I have tried this simple/dumb change on top of my patch:
> 
> diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
> index a870320146ef..ab2236874217 100644
> --- a/xen/common/sched/private.h
> +++ b/xen/common/sched/private.h
> @@ -273,7 +273,7 @@ static inline spinlock_t 
> *pcpu_schedule_trylock(unsigned int cpu)
> 
>   struct scheduler {
>       const char *name;       /* full name for this scheduler      */
> -    const char *opt_name;   /* option name for this scheduler    */
> +    const char opt_name[9]; /* option name for this scheduler    */
>       unsigned int sched_id;  /* ID for this scheduler             */
>       void *sched_data;       /* global data pointer               */
>       struct cpupool *cpupool;/* points to this scheduler's pool   */
> 
> GCC will throw an error:
> 
> core.c: In function ‘scheduler_init’:
> core.c:2987:17: error: assignment of read-only variable ‘ops’
>               ops = *schedulers[i];
>                   ^
> core.c:2997:21: error: assignment of read-only variable ‘ops’
>                   ops = *schedulers[i];
>                       ^
> 
> I don't particularly want to drop the const. So the code would probably 
> need some rework.

What's wrong with not having the const when the field is an array?
The more that all original (build-time, i.e. contain in the binary)
instances of the struct are already const as a whole?

Jan

