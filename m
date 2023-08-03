Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4136B76EA05
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 15:23:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576376.902435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRYIq-0002tq-C1; Thu, 03 Aug 2023 13:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576376.902435; Thu, 03 Aug 2023 13:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRYIq-0002rz-7w; Thu, 03 Aug 2023 13:23:44 +0000
Received: by outflank-mailman (input) for mailman id 576376;
 Thu, 03 Aug 2023 13:23:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0usr=DU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qRYIp-0002rt-Fw
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 13:23:43 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f59c6287-3200-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 15:23:40 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 169106901259642.063268145639086;
 Thu, 3 Aug 2023 06:23:32 -0700 (PDT)
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
X-Inumbo-ID: f59c6287-3200-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1691069015; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BiQp6xKBP2N5/sQdi/zRz5pj+IjMcGxsdkvzrctqilXN+h7OgrW+CfaJ12R6xEBUlpSduV70yEs6lzDOZJbhkQ1VhdBtOctWENg70o/sdLvkZ5A2yE8Fis0p8i1qavWxKyfHe7OamaoOOYRZhC3v047h4FubC1a/euDZPHenQ/o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691069015; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=J3fJ8+Sv5o5vmk9lGPGuBN12/HbQyJ1QFr9EUpAwrSk=; 
	b=MlavFkGMsdS6Oytr2yOXlo5q47mpd5dmayta6l0/47HC6aW9sqHmanBn4S7nMv5t1udCRR5fpYiTLiJZesADwQCcsiy0JIsPg3p1NwFABxnlJe1LeN/EAyelX/Di8Wfk401qmq/AvZ6AsnqpfNNIAUFIEDZSFU4Cz8eEA2GtIvA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691069015;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=J3fJ8+Sv5o5vmk9lGPGuBN12/HbQyJ1QFr9EUpAwrSk=;
	b=tqc09EoRCVNnVVEYe4qYXVVlduZpifrxlRSO7ZD5JEw88GgZ1/fpvKekkn4EFPmK
	KfIaMJQW0qZoNZNhogVmR9U5sBdMrwp4NFHv3X59PLOWYZcBGsqA7V+TnB+ac0U/kLt
	hRbp6g8wux5cUpa3HLs7UeKlh+2oz025CN9f30L4=
Message-ID: <29453e14-27e5-eb2c-daeb-ae9a46fd9e29@apertussolutions.com>
Date: Thu, 3 Aug 2023 09:23:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 1/6] dom0: replace explict zero checks
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, xen-devel@dornerworks.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
 roberto.bagnara@bugseng.com
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-2-dpsmith@apertussolutions.com>
 <alpine.DEB.2.22.394.2308011721030.2127516@ubuntu-linux-20-04-desktop>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <alpine.DEB.2.22.394.2308011721030.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/1/23 20:24, Stefano Stabellini wrote:
> On Tue, 1 Aug 2023, Daniel P. Smith wrote:
>> A legacy concept is that the initial domain will have a domain id of zero. As a
>> result there are places where a check that a domain is the inital domain is
>> determined by an explicit check that the domid is zero.
>>
>> This commit seeks to abstract this check into a function call and replace all
>> check locations with the function call.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Thanks for the patch, this is a good cleanup!

Thank you for the sentiment as well as giving it a review!

>> ---
>>   xen/common/domain.c         | 4 ++--
>>   xen/common/sched/arinc653.c | 2 +-
>>   xen/common/sched/core.c     | 4 ++--
>>   xen/include/xen/sched.h     | 7 +++++++
>>   4 files changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>> index 304aa04fa6..8fb3c052f5 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -309,7 +309,7 @@ static int late_hwdom_init(struct domain *d)
>>       struct domain *dom0;
>>       int rv;
>>   
>> -    if ( d != hardware_domain || d->domain_id == 0 )
>> +    if ( d != hardware_domain || is_initial_domain(d) )
>>           return 0;
>>   
>>       rv = xsm_init_hardware_domain(XSM_HOOK, d);
>> @@ -612,7 +612,7 @@ struct domain *domain_create(domid_t domid,
>>       d->is_privileged = flags & CDF_privileged;
>>   
>>       /* Sort out our idea of is_hardware_domain(). */
>> -    if ( domid == 0 || domid == hardware_domid )
>> +    if ( is_initial_domain(d) || domid == hardware_domid )
>>       {
>>           if ( hardware_domid < 0 || hardware_domid >= DOMID_FIRST_RESERVED )
>>               panic("The value of hardware_dom must be a valid domain ID\n");
>> diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
>> index a82c0d7314..31e8270af3 100644
>> --- a/xen/common/sched/arinc653.c
>> +++ b/xen/common/sched/arinc653.c
>> @@ -404,7 +404,7 @@ a653sched_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
>>        * Add every one of dom0's units to the schedule, as long as there are
>>        * slots available.
>>        */
>> -    if ( unit->domain->domain_id == 0 )
>> +    if ( is_initial_domain(unit->domain) )
>>       {
>>           entry = sched_priv->num_schedule_entries;
>>   
>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>> index 022f548652..210ad30f94 100644
>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -585,7 +585,7 @@ int sched_init_vcpu(struct vcpu *v)
>>            */
>>           sched_set_affinity(unit, cpumask_of(0), cpumask_of(0));
>>       }
>> -    else if ( d->domain_id == 0 && opt_dom0_vcpus_pin )
>> +    else if ( is_initial_domain(d) && opt_dom0_vcpus_pin )
>>       {
>>           /*
>>            * If dom0_vcpus_pin is specified, dom0 vCPUs are pinned 1:1 to
>> @@ -594,7 +594,7 @@ int sched_init_vcpu(struct vcpu *v)
>>           sched_set_affinity(unit, cpumask_of(processor), &cpumask_all);
>>       }
>>   #ifdef CONFIG_X86
>> -    else if ( d->domain_id == 0 )
>> +    else if ( is_initial_domain(d) )
>>       {
>>           /*
>>            * In absence of dom0_vcpus_pin instead, the hard and soft affinity of
>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>> index 854f3e32c0..a9276a7bed 100644
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -1058,6 +1058,13 @@ void scheduler_disable(void);
>>   void watchdog_domain_init(struct domain *d);
>>   void watchdog_domain_destroy(struct domain *d);
>>   
>> +static always_inline bool is_initial_domain(const struct domain *d)
> 
> I know you used always_inline only because is_hardware_domain just below
> also uses it, but I wonder if we need it.

I was under the impression that access checks like these could end up in 
fast paths, so we wanted to coax the compiler into inlining these 
whenever possible. If others feel it is not needed, I have no objection 
to moving it to just inline.

> Also, Robero, it looks like always_inline is missing from
> docs/misra/C-language-toolchain.rst? Or do we plan to get rid of it?
> 
> 
>> +{
>> +    static int init_domain_id = 0;
> 
> I take it is done this way because you plan to make it configurable?

As you see in a later patch, it gets changed into an assignable role for 
the domain.

>> +    return d->domain_id == init_domain_id;
>> +}
>> +
>>   /*
>>    * Use this check when the following are both true:
>>    *  - Using this feature or interface requires full access to the hardware
>> -- 
>> 2.20.1
>>

