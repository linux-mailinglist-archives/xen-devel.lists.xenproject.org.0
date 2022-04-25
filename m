Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F19A50E602
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 18:40:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313156.530621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj1l6-0003Sa-Dg; Mon, 25 Apr 2022 16:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313156.530621; Mon, 25 Apr 2022 16:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj1l6-0003QD-Ao; Mon, 25 Apr 2022 16:40:20 +0000
Received: by outflank-mailman (input) for mailman id 313156;
 Mon, 25 Apr 2022 16:40:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sCC+=VD=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nj1l4-0003Q7-4P
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 16:40:18 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61d607bb-c4b6-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 18:40:16 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1650904806180862.5046296680043;
 Mon, 25 Apr 2022 09:40:06 -0700 (PDT)
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
X-Inumbo-ID: 61d607bb-c4b6-11ec-8fc2-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1650904811; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mWCJzmsJNq8Hyv2eKRVDQIDWMXQ22kXT3GCWqPyvXt7D+Zzc1xBNK/l6/EMVIH2Ot5QPYiYfaGqccmqF9yUUgYi59gcGImJNC14sXkpl6jXTmW/tlVzoeAk6qAI6Fx8B6YplCxquBnzt7SUcGxlGvf8AENhZsGpWxIaxDzoRZGs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1650904811; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=ZSHKqxplFaoyQHqPsuyiLL3AeTm49HrjGqGEx9onC2s=; 
	b=N0Zo7Df5eWb70BC7opogI7PlsbhDNw9gpn0KQTOScYw0bW+6TgJC6JpyOVWASZelzmAk1yuPVfGrA2FEs3R33NIhj8oT7KJe304FOhq/lypoZpbriR2PiT+k7j0xZToo8frdOzlrcUDAXJDQRXmEXwee7k4BKnUhPz7SQf8G4OQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650904811;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ZSHKqxplFaoyQHqPsuyiLL3AeTm49HrjGqGEx9onC2s=;
	b=lsWyR3A9+XMU4Kp3Q3abyHzR1a9R1qmKCY+vLzD5p6nCFkGg+Sx4Zh4rE3qe3IM7
	eJXDYP6OsMpQrM+tw63Ju8qsXlYpACFMKNOWqR/q7Avbd7TQEdlVkMsD9S93oXkvA1F
	yAqAoYjVkL8oSRGX/14ZumRnnHJ7dQ5qD9xbE798=
Message-ID: <25e701d4-62ae-278d-b165-2201459c7cee@apertussolutions.com>
Date: Mon, 25 Apr 2022 12:39:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 scott.davis@starlab.io, jandryuk@gmail.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220422163458.30170-1-dpsmith@apertussolutions.com>
 <20220422163458.30170-2-dpsmith@apertussolutions.com>
 <YmZtiJ5Jf1CNOpeZ@Air-de-Roger>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 1/2] xsm: create idle domain privileged and demote
 after setup
In-Reply-To: <YmZtiJ5Jf1CNOpeZ@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 4/25/22 05:44, Roger Pau Monné wrote:
> On Fri, Apr 22, 2022 at 12:34:57PM -0400, Daniel P. Smith wrote:
>> There are now instances where internal hypervisor logic needs to make resource
>> allocation calls that are protected by XSM checks. The internal hypervisor logic
>> is represented a number of system domains which by designed are represented by
> 
> 'Some of the hypervisor code can be executed in a system domain that's
> represented by a per-CPU non-privileged struct domain. To enable...'

Ack, will reword.

>> non-privileged struct domain instances. To enable these logic blocks to
>> function correctly but in a controlled manner, this commit changes the idle
>> domain to be created as a privileged domain under the default policy, which is
>> inherited by the SILO policy, and demoted before transitioning to running. A
>> new XSM hook, xsm_set_system_active, is introduced to allow each XSM policy
>> type to demote the idle domain appropriately for that policy type.
>>
>> For flask a stub is added to ensure that flask policy system will function
>> correctly with this patch until flask is extended with support for starting the
>> idle domain privileged and properly demoting it on the call to
>> xsm_set_system_active.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>  xen/arch/arm/setup.c    |  3 +++
>>  xen/arch/x86/setup.c    |  3 +++
>>  xen/common/sched/core.c |  7 ++++++-
>>  xen/include/xsm/dummy.h | 17 +++++++++++++++++
>>  xen/include/xsm/xsm.h   |  6 ++++++
>>  xen/xsm/dummy.c         |  1 +
>>  xen/xsm/flask/hooks.c   | 21 +++++++++++++++++++++
>>  7 files changed, 57 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index d5d0792ed4..e71fa3f860 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -1048,6 +1048,9 @@ void __init start_xen(unsigned long boot_phys_offset,
>>      /* Hide UART from DOM0 if we're using it */
>>      serial_endboot();
>>  
>> +    if ( xsm_set_system_active() != 0)
>> +        panic("xsm: unable to set hypervisor to SYSTEM_ACTIVE privilege\n");
>> +
>>      system_state = SYS_STATE_active;
>>  
>>      for_each_domain( d )
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 6f20e17892..a3ce288ef9 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -621,6 +621,9 @@ static void noreturn init_done(void)
>>      void *va;
>>      unsigned long start, end;
>>  
>> +    if ( xsm_set_system_active() != 0)
>            ^ extra space.
> 
> Since the function returns an error code you might as well add it to
> the panic message, or else just make the function return bool instead.
> 
> Or just make the function void and panic in the handler itself (like
> in previous versions), as I don't think it's sensible to continue
> normal execution if xsm_set_system_active fails.

After reflecting on it, I believe that was not the correct action. The
policy should handle setting/checking all access control state and fail
with an error of why and then allow the hypervisor logic decided what to
do with that failure. For the policies that are present today, yes it is
an immediate panic. Ultimately this will future proof the interface
should a future policy type be introduced with a more varied result that
could allow the hypervisor to continue to boot, for instance to a
limited and/or debug state.

>> +        panic("xsm: unable to set hypervisor to SYSTEM_ACTIVE privilege\n");
>> +
>>      system_state = SYS_STATE_active;
>>  
>>      domain_unpause_by_systemcontroller(dom0);
>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>> index 19ab678181..22a619e260 100644
>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -3021,7 +3021,12 @@ void __init scheduler_init(void)
>>          sched_ratelimit_us = SCHED_DEFAULT_RATELIMIT_US;
>>      }
>>  
>> -    idle_domain = domain_create(DOMID_IDLE, NULL, 0);
>> +    /*
>> +     * idle dom is created privileged to ensure unrestricted access during
>> +     * setup and will be demoted by xsm_transition_running when setup is
> 
> s/xsm_transition_running/xsm_set_system_active/

I missed one, apologies.

>> +     * complete
> 
> Nit: missing full stop according to CODING_STYLE.

Ack.

>> +     */
>> +    idle_domain = domain_create(DOMID_IDLE, NULL, CDF_privileged);
>>      BUG_ON(IS_ERR(idle_domain));
>>      BUG_ON(nr_cpu_ids > ARRAY_SIZE(idle_vcpu));
>>      idle_domain->vcpu = idle_vcpu;
>> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
>> index 58afc1d589..3291fb5396 100644
>> --- a/xen/include/xsm/dummy.h
>> +++ b/xen/include/xsm/dummy.h
>> @@ -101,6 +101,23 @@ static always_inline int xsm_default_action(
>>      }
>>  }
>>  
>> +static XSM_INLINE int cf_check xsm_set_system_active(void)
>> +{
>> +    struct domain *d = current->domain;
>> +
>> +    ASSERT(d->is_privileged);
>> +
>> +    if ( d->domain_id != DOMID_IDLE )
>> +    {
>> +        printk("xsm_set_system_active: should only be called by idle domain\n");
>> +        return -EPERM;
>> +    }
>> +
>> +    d->is_privileged = false;
>> +
>> +    return 0;
>> +}
>> +
>>  static XSM_INLINE void cf_check xsm_security_domaininfo(
>>      struct domain *d, struct xen_domctl_getdomaininfo *info)
>>  {
>> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
>> index 3e2b7fe3db..8dad03fd3d 100644
>> --- a/xen/include/xsm/xsm.h
>> +++ b/xen/include/xsm/xsm.h
>> @@ -52,6 +52,7 @@ typedef enum xsm_default xsm_default_t;
>>   * !!! WARNING !!!
>>   */
>>  struct xsm_ops {
>> +    int (*set_system_active)(void);
>>      void (*security_domaininfo)(struct domain *d,
>>                                  struct xen_domctl_getdomaininfo *info);
>>      int (*domain_create)(struct domain *d, uint32_t ssidref);
>> @@ -208,6 +209,11 @@ extern struct xsm_ops xsm_ops;
>>  
>>  #ifndef XSM_NO_WRAPPERS
>>  
>> +static inline int xsm_set_system_active(void)
>> +{
>> +    return alternative_call(xsm_ops.set_system_active);
>> +}
>> +
>>  static inline void xsm_security_domaininfo(
>>      struct domain *d, struct xen_domctl_getdomaininfo *info)
>>  {
>> diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
>> index 8c044ef615..e6ffa948f7 100644
>> --- a/xen/xsm/dummy.c
>> +++ b/xen/xsm/dummy.c
>> @@ -14,6 +14,7 @@
>>  #include <xsm/dummy.h>
>>  
>>  static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
>> +    .set_system_active             = xsm_set_system_active,
>>      .security_domaininfo           = xsm_security_domaininfo,
>>      .domain_create                 = xsm_domain_create,
>>      .getdomaininfo                 = xsm_getdomaininfo,
>> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
>> index 0bf63ffa84..8a62de2fd6 100644
>> --- a/xen/xsm/flask/hooks.c
>> +++ b/xen/xsm/flask/hooks.c
>> @@ -186,6 +186,26 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>>      return 0;
>>  }
>>  
>> +static int cf_check flask_set_system_active(void)
>> +{
>> +    struct domain *d = current->domain;
> 
> Nit: you should also add the assert for d->is_privileged, I don't see
> a reason for the xsm and flask functions to differ in that regard.

This goes back to an issued I have raised before, is_privileged really
encompasses two properties of a domain. Whether the domain is filling
the special control domain role versus what accesses the domain has
based on the context under which is_control_domain() is called. For
instance the function init_domain_msr_policy() uses is_control_domain()
not to make an access control decision but configure behavior. Under
flask is_privileged no longer reflects the accesses a domain with it set
will have, thus whether it is cleared when flask is enabled is
irrelevant as far as flask is concerned. For the ASSERT, what matters is
that the label was set to xenboot_t on construction and that it was not
changed before reaching this point. Or in a short form, when under the
default policy the expected state is concerned with is_privilege while
for flask it is only the SID.

