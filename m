Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC6976EB78
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 16:00:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576398.902485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRYsf-0001Ga-8q; Thu, 03 Aug 2023 14:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576398.902485; Thu, 03 Aug 2023 14:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRYsf-0001Df-5F; Thu, 03 Aug 2023 14:00:45 +0000
Received: by outflank-mailman (input) for mailman id 576398;
 Thu, 03 Aug 2023 14:00:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0usr=DU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qRYsd-0001DZ-W4
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 14:00:43 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 213ff945-3206-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 16:00:42 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691071236444697.0834525331015;
 Thu, 3 Aug 2023 07:00:36 -0700 (PDT)
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
X-Inumbo-ID: 213ff945-3206-11ee-b268-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1691071238; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lVUosfmbp5T+CFvz0swdVInTrWLOpyyh8RsmsfQXTjDK1g6R7lckqs+RQ4nNYu5ydb0Iq1rmjajR/YgZIk2BfW46ULqISL8P9ZyGd3XhqTVWg92c9ZG0NS5W9K87GOE7uVJyJR2a4vjw3PNXey2MW+1rcR4HTrJe7pp3dVOoZZ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691071238; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=6RXLCicIfGbmHJoG+x3NHNQo7vkNX5Pb+Ok3L72yLyU=; 
	b=oC5vikqO+DO81J+oYvGFXyqq26gVkWclfXyRdm7JFGYAGNNzIhqejZB2sSpXwjMpfiT4ZX9GAhfoQ14Q57nw7/Xuiv0fUEz5kWpA+RSEBNFpU494OSZPe6eRNZ57zHG2IPy1AIwpppd7F1meHw8M/cRguqNcxtKi50XX0PB7GHo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691071238;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=6RXLCicIfGbmHJoG+x3NHNQo7vkNX5Pb+Ok3L72yLyU=;
	b=h4AGhm6pY65esh2zJVN1RxNLa2dEKUkobVX+ZUDWFOcPnM08vXG5uI6/dc07O34s
	Vae6X6qJrzKtFH6oMl3jCDixqNkemWECExpaRvbqRIbG0p65Sbe98zayGuClzeTBlFd
	WuzdaokNy8/mNbjJXdLTXJr9Kwy74yJDsyf9EuLc=
Message-ID: <c747c66c-a08d-ce0c-5d1c-25b594ac5f5e@apertussolutions.com>
Date: Thu, 3 Aug 2023 10:00:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 2/6] roles: provide abstraction for the possible domain
 roles
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-3-dpsmith@apertussolutions.com>
 <alpine.DEB.2.22.394.2308011726170.2127516@ubuntu-linux-20-04-desktop>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <alpine.DEB.2.22.394.2308011726170.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/1/23 20:54, Stefano Stabellini wrote:
> On Tue, 1 Aug 2023, Daniel P. Smith wrote:
>> The existing concepts such as unbounded domain, ie. all powerful, control
>> domain and hardware domain are, effectively, roles the domains provide for the
>> system. Currently, these are represented with booleans within `struct domain`
>> or global domid variables that are compared against. This patch begins to
>> formalize these roles by replacing the `is_control` and `is_console`, along
>> with expanding the check against the global `hardware_domain` with a single
>> encapsulating role attribute in `struct domain`.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> This is definitely heading in the right direction

Thank you, it is good to know there is some agreement here.

>> ---
>>   xen/arch/arm/domain_build.c |  2 ++
>>   xen/arch/x86/setup.c        |  2 ++
>>   xen/common/domain.c         | 14 +++++++++++++-
>>   xen/include/xen/sched.h     | 16 +++++++++-------
>>   xen/include/xsm/dummy.h     |  4 ++--
>>   xen/xsm/flask/hooks.c       | 12 ++++++------
>>   6 files changed, 34 insertions(+), 16 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 39b4ee03a5..51b4daefe1 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -4201,6 +4201,8 @@ void __init create_dom0(void)
>>       if ( IS_ERR(dom0) )
>>           panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
>>   
>> +    dom0->role |= ROLE_UNBOUNDED_DOMAIN;
> 
> I am not a fan of "UNBOUNDED". Maybe "PRIMARY"? "PRIVILEGED"? "SUPER"?
> "ROOT"?
> 
> I also recognize I am not good at naming things so I'll stop here and
> let other provide better feedback :-)

In first version of hyperlaunch and in the early roles work, I was 
working to move toward eliminating this concept entirely. The reality is 
this is a model that has existed for over 20 years and there are those 
who accept and embrace the model. Introducing the name UNBOUNDED was to 
at least break the idea that the all powerful domain necessarily is the 
first/initial domain to run. With hyperlaunch, there are still 
security-based scenarios where you might want to run a DomB before 
starting an all privileged domain. I spent quite some time, probably 
more than I should have, to find a good name that expresses what this 
role is. Considering a comment below and a comment by Jan, I am starting 
to think a better way to view it is a domain that assumes all roles in 
the system. So your suggestions of SUPER or ROOT might be more fitting. 
I considered ROLE_ALL, but something about it doesn't sit right with me. 
With that said I welcome the yak shaving of naming to begin. ( ^_^)

> Also, do we actually need unbounded given that it gets replaced with
> control_domain pretty soon?

Yes, because as mentioned above, this is meant to express a domain that 
has been assigned all roles, for which later the domain may decided to 
delegate the role to another domain.

> I am asking because I think that at least from a safety perspective it
> would be a problem to run a domain as "unbounded". In a safety system,
> we wouldn't want anything to be unbounded, not even temporarily at boot.
> If "unbounded" is removed before running dom0, then of course it is no
> problem because actually dom0 never gets to run with "unbounded" set.

I think this is were the name UNBOUNDED may have been a bad choice. The 
UNBOUNDED role is dom0. It is the control domain, the hardware domain, 
the Xenstore domain, and the crash domain (if that were to be solidified).

> (I am currently thinking of solving the privilege issue by using XSM and
> removing most privileges from Dom0.)

I obviously would be a huge advocate of that approach. ( ^_^)

>>       if ( alloc_dom0_vcpu0(dom0) == NULL )
>>           panic("Error creating domain 0 vcpu0\n");
>>   
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 2dbe9857aa..4e20edc3bf 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -905,6 +905,8 @@ static struct domain *__init create_dom0(const module_t *image,
>>       if ( IS_ERR(d) )
>>           panic("Error creating d%u: %ld\n", domid, PTR_ERR(d));
>>   
>> +    d->role |= ROLE_UNBOUNDED_DOMAIN;
>> +
>>       init_dom0_cpuid_policy(d);
>>   
>>       if ( alloc_dom0_vcpu0(d) == NULL )
>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>> index 8fb3c052f5..0ff1d52e3d 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -340,6 +340,14 @@ static int late_hwdom_init(struct domain *d)
>>       setup_io_bitmap(dom0);
>>   #endif
>>   
>> +    /*
>> +     * "dom0" may have been created under the unbounded role, demote it from
>> +     * that role, reducing it to the control domain role and any other roles it
>> +     * may have been given.
>> +     */
>> +    dom0->role &= ~(ROLE_UNBOUNDED_DOMAIN & ROLE_HARDWARE_DOMAIN);
>> +    dom0->role |= ROLE_CONTROL_DOMAIN;
> 
> I think we need a better definition of the three roles to understand
> what this mean.

Definition and as highlighted, a better name.

>>       rcu_unlock_domain(dom0);
>>   
>>       iommu_hwdom_init(d);
>> @@ -609,7 +617,10 @@ struct domain *domain_create(domid_t domid,
>>       }
>>   
>>       /* Sort out our idea of is_control_domain(). */
>> -    d->is_privileged = flags & CDF_privileged;
>> +    if ( flags & CDF_privileged )
>> +        d->role |= ROLE_CONTROL_DOMAIN;
>> +    else
>> +        d->role &= ~ROLE_CONTROL_DOMAIN; /*ensure not set */
>>   
>>       /* Sort out our idea of is_hardware_domain(). */
>>       if ( is_initial_domain(d) || domid == hardware_domid )
>> @@ -619,6 +630,7 @@ struct domain *domain_create(domid_t domid,
>>   
>>           old_hwdom = hardware_domain;
>>           hardware_domain = d;
>> +        d->role |= ROLE_HARDWARE_DOMAIN;
>>       }
>>   
>>       TRACE_1D(TRC_DOM0_DOM_ADD, d->domain_id);
>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>> index a9276a7bed..695f240326 100644
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -467,8 +467,10 @@ struct domain
>>   #endif
>>       /* is node-affinity automatically computed? */
>>       bool             auto_node_affinity;
>> -    /* Is this guest fully privileged (aka dom0)? */
>> -    bool             is_privileged;
>> +#define ROLE_UNBOUNDED_DOMAIN  (1U<<0)
>> +#define ROLE_CONTROL_DOMAIN    (1U<<1)
>> +#define ROLE_HARDWARE_DOMAIN   (1U<<2)
> 
> This is a great step in the right direction but I think at least a short
> in-code comment to explain the difference between the three

Ack.

>> +    uint8_t          role;
>>       /* Can this guest access the Xen console? */
>>       bool             is_console;
>>       /* Is this guest being debugged by dom0? */
>> @@ -1060,9 +1062,7 @@ void watchdog_domain_destroy(struct domain *d);
>>   
>>   static always_inline bool is_initial_domain(const struct domain *d)
>>   {
>> -    static int init_domain_id = 0;
>> -
>> -    return d->domain_id == init_domain_id;
>> +    return d->role & ROLE_UNBOUNDED_DOMAIN;
>>   }
> 
> As far as I can tell this is the only functional change in this patch:
> given that dom0 loses unbounded soon after boot, the "is_initial_domain"
> checks will start to fail?

Today, dom0 should not lose any of its roles at boot unless dom0less 
were to create a hardware domain.

Upon reflection, I am thinking this check might want renaming to align 
with the rename of this role.

> We have a few of them in the code and I couldn't rule out that at least
> these 3 could happen at runtime:
> 
> xen/common/sched/core.c:    else if ( is_initial_domain(d) && opt_dom0_vcpus_pin )
> xen/common/sched/core.c:    else if ( is_initial_domain(d) )
> xen/common/sched/arinc653.c:    if ( is_initial_domain(unit->domain) )
> 
> Maybe they need to be changed to control_domain checks?

Perhaps, I would want to study them a bit before switching them over.

>>   /*
>> @@ -1076,7 +1076,8 @@ static always_inline bool is_hardware_domain(const struct domain *d)
>>       if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
>>           return false;
>>   
>> -    return evaluate_nospec(d == hardware_domain);
>> +    return evaluate_nospec(((d->role & ROLE_HARDWARE_DOMAIN) ||
>> +        is_initial_domain(d)) && (d == hardware_domain));
>>   }
>>   
>>   /* This check is for functionality specific to a control domain */
>> @@ -1085,7 +1086,8 @@ static always_inline bool is_control_domain(const struct domain *d)
>>       if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
>>           return false;
>>   
>> -    return evaluate_nospec(d->is_privileged);
>> +    return evaluate_nospec((d->role & ROLE_CONTROL_DOMAIN) ||
>> +        is_initial_domain(d));
>>   }
>>   
>>   #define VM_ASSIST(d, t) (test_bit(VMASST_TYPE_ ## t, &(d)->vm_assist))
>> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
>> index 8671af1ba4..18f1ddd127 100644
>> --- a/xen/include/xsm/dummy.h
>> +++ b/xen/include/xsm/dummy.h
>> @@ -108,7 +108,7 @@ static XSM_INLINE int cf_check xsm_set_system_active(void)
>>   {
>>       struct domain *d = current->domain;
>>   
>> -    ASSERT(d->is_privileged);
>> +    ASSERT(d->role & ROLE_CONTROL_DOMAIN);
>>   
>>       if ( d->domain_id != DOMID_IDLE )
>>       {
>> @@ -116,7 +116,7 @@ static XSM_INLINE int cf_check xsm_set_system_active(void)
>>           return -EPERM;
>>       }
>>   
>> -    d->is_privileged = false;
>> +    d->role &= ~ROLE_CONTROL_DOMAIN;
>>   
>>       return 0;
>>   }
>> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
>> index 78225f68c1..0a31719f43 100644
>> --- a/xen/xsm/flask/hooks.c
>> +++ b/xen/xsm/flask/hooks.c
>> @@ -193,7 +193,7 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>>       default:
>>           if ( domain_sid(current->domain) == SECINITSID_XENBOOT )
>>           {
>> -            if ( d->is_privileged )
>> +            if ( d->role & ROLE_CONTROL_DOMAIN )
>>                   dsec->sid = SECINITSID_DOM0;
>>               else if ( pv_shim )
>>                   dsec->sid = SECINITSID_DOMU;
>> @@ -213,7 +213,7 @@ static int cf_check flask_set_system_active(void)
>>   
>>       dsec = d->ssid;
>>   
>> -    ASSERT(d->is_privileged);
>> +    ASSERT(d->role & ROLE_CONTROL_DOMAIN);
>>       ASSERT(dsec->sid == SECINITSID_XENBOOT);
>>       ASSERT(dsec->self_sid == SECINITSID_XENBOOT);
>>   
>> @@ -224,11 +224,11 @@ static int cf_check flask_set_system_active(void)
>>       }
>>   
>>       /*
>> -     * While is_privileged has no significant meaning under flask, set to false
>> -     * as is_privileged is not only used for a privilege check but also as a
>> -     * type of domain check, specifically if the domain is the control domain.
>> +     * While domain roles have no significant meaning under flask, mask out
>> +     * control domain role as it is not only used for a privilege check but
>> +     * also as a type of domain check.
>>        */
>> -    d->is_privileged = false;
>> +    d->role &= ~ROLE_CONTROL_DOMAIN;
>>   
>>       dsec->self_sid = dsec->sid = SECINITSID_XEN;
>>   
>> -- 
>> 2.20.1
>>

