Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C152950A1E8
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 16:15:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310243.526955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhXaW-0000Xm-1M; Thu, 21 Apr 2022 14:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310243.526955; Thu, 21 Apr 2022 14:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhXaV-0000V2-UZ; Thu, 21 Apr 2022 14:15:15 +0000
Received: by outflank-mailman (input) for mailman id 310243;
 Thu, 21 Apr 2022 14:15:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q+Sl=U7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nhXaT-0000Uw-TC
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 14:15:13 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71c7dfaa-c17d-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 16:15:08 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 16505505017661008.6994746259218;
 Thu, 21 Apr 2022 07:15:01 -0700 (PDT)
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
X-Inumbo-ID: 71c7dfaa-c17d-11ec-8fc2-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1650550506; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RzgejQ1BH2k2eD9R2d68GJ8aJc6u7j9FXMsa4KkmSFhikrYcVNFGl8ScjmQU5KAyy4b6f6c7sGXozfF8+QjnXKRrPv1Xa44zg3bfyv/xJCRbm1KToPGeS01gD00PowQGeFduX6l/6xCLE+ILnox3kYtTKugDtA7SCMX3mdN9rEg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1650550506; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Uv9Ldvfc0VWw+PaRsuAXwcxqKs5oqk/ra/UuHdM2/eg=; 
	b=X45iUa5vSbr6S44EV1bTM3UFctxBUvLh7bpgONu9+BJQVwo0r2LVewp5ws8ClniurecVTNcjdfA1HTsEssYS+A7R8lkglQ7ckblbWb+RwCCp5v/YJAIOiZ5A0wFVAgz4JrBxuyTfv2L04yzLECFM1b9w1jEc8Pu7gkbYxhfQlc4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650550506;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Uv9Ldvfc0VWw+PaRsuAXwcxqKs5oqk/ra/UuHdM2/eg=;
	b=r5Ev1+rpONNIBkE37yjc3ho7H4IgD8+4YdUbUrqnedweD5g+rSRzMYilZdZ11QNu
	4uVHUJYiqQMdBKx93xg747qk6ZlfODXg3nMQZeyjgHcf4cm87wzAl6prm4Kj+FXQtr0
	/DcTDtaMlah73CAFJiPeKXfL4TwIRhvsctvtFNyM=
Message-ID: <0b1b2f7b-dc81-af95-8591-4362ae0b85f9@apertussolutions.com>
Date: Thu, 21 Apr 2022 10:14:18 -0400
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
References: <20220420222834.5478-1-dpsmith@apertussolutions.com>
 <20220420222834.5478-2-dpsmith@apertussolutions.com>
 <YmEpoDHpGP3xkAQ/@Air-de-Roger>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 1/2] xsm: create idle domain privieged and demote after
 setup
In-Reply-To: <YmEpoDHpGP3xkAQ/@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 4/21/22 05:53, Roger Pau Monné wrote:
> On Wed, Apr 20, 2022 at 06:28:33PM -0400, Daniel P. Smith wrote:
>> There are now instances where internal hypervisor logic needs to make resource
>> allocation calls that are protectd by XSM checks. The internal hypervisor logic
>> is represented a number of system domains which by designed are represented by
>> non-privileged struct domain instances. To enable these logic blocks to
>> function correctly but in a controlled manner, this commit changes the idle
>> domain to be created as a privileged domain under the default policy, which is
>> inherited by the SILO policy, and demoted before transitioning to running. A
>> new XSM hook, xsm_transition_running, is introduced to allow each XSM policy
>> type to demote the idle domain appropriately for that policy type.
>>
>> For flask a stub is added to ensure that flask policy system will function
>> correctly with this patch until flask is extended with support for starting the
>> idle domain privileged and properly demoting it on the call to
>> xsm_transtion_running.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>  xen/arch/arm/setup.c    |  6 ++++++
>>  xen/arch/x86/setup.c    |  6 ++++++
>>  xen/common/sched/core.c |  7 ++++++-
>>  xen/include/xsm/dummy.h | 12 ++++++++++++
>>  xen/include/xsm/xsm.h   |  6 ++++++
>>  xen/xsm/dummy.c         |  1 +
>>  xen/xsm/flask/hooks.c   | 15 +++++++++++++++
>>  7 files changed, 52 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index d5d0792ed4..763835aeb5 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -1048,6 +1048,12 @@ void __init start_xen(unsigned long boot_phys_offset,
>>      /* Hide UART from DOM0 if we're using it */
>>      serial_endboot();
>>  
>> +    xsm_transition_running();
> 
> Could we put depriv or dipriviledge somewhere here? 'transition' seem to
> ambiguous IMO (but I'm not a native speaker).
> 
> xsm_{depriv,demote}_current();

Let me say this explanation is not to say no but to give context to the
concerns. Forms of deprive/demote were considered though when
considering the concept proposed was to change the security model where
the hypervisor/idle domain were now explicitly being give a new security
context, is_privileged and xenboot_t, under which setup is being run.
This new xsm hook is to provide a transition point for the XSM policies
to set what the running security context should be for the
hypervisor/idle domain. The name xsm_transition_running() clearly
denotes when/where this hook should be used, where as the name
xsm_depriv_current() is more generic and another developer may attempt
to use it in a manner it was not intended.

It is possible to consider creating an xsm_depriv_current() that
functions in a more generic manner but will likely be more complicated
to support general usage, especially for flask where a flask specific
"lower" security context must be provided.

If there is still a preference towards xsm_depriv_current() while
maintaining the current mechanics as it makes more sense for the
majority, I have no issue with that.

>> +
>> +    /* Ensure idle domain was not left privileged */
>> +    if ( current->domain->is_privileged )
>> +        panic("idle domain did not properly transition from setup privilege\n");
>> +
>>      system_state = SYS_STATE_active;
>>  
>>      for_each_domain( d )
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 6f20e17892..72695dcb07 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -621,6 +621,12 @@ static void noreturn init_done(void)
>>      void *va;
>>      unsigned long start, end;
>>  
>> +    xsm_transition_running();
>> +
>> +    /* Ensure idle domain was not left privileged */
>> +    if ( current->domain->is_privileged )
>> +        panic("idle domain did not properly transition from setup privilege\n");
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
>> +     * complete
>> +     */
>> +    idle_domain = domain_create(DOMID_IDLE, NULL, CDF_privileged);
>>      BUG_ON(IS_ERR(idle_domain));
>>      BUG_ON(nr_cpu_ids > ARRAY_SIZE(idle_vcpu));
>>      idle_domain->vcpu = idle_vcpu;
>> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
>> index 58afc1d589..b33f0ec672 100644
>> --- a/xen/include/xsm/dummy.h
>> +++ b/xen/include/xsm/dummy.h
>> @@ -101,6 +101,18 @@ static always_inline int xsm_default_action(
>>      }
>>  }
>>  
>> +static XSM_INLINE void cf_check xsm_transition_running(void)
>> +{
>> +    struct domain *d = current->domain;
>> +
>> +    if ( d->domain_id != DOMID_IDLE )
>> +        panic("xsm_transition_running should only be called by idle domain\n");
> 
> Could you also add a check that d->is_privileged == true?

Are you thinking along the lines of,

    if ( (!d->is_privileged) || (d->domain_id != DOMID_IDLE)
        panic("some message\n");

or is your concern more of,

    if ( !d->is_privileged )
        return;

In my mind the former is legitimate because execution should only arrive
here with current->domain being the idle domain and is_privileged set to
true. The latter check I feel is extraneous because 1) this hook should
only ever be called under the idle domain, thus it should be checked
first and should absolutely panic if another domain context is in place.
Which leads to, 2) checking if it is not false before setting to false
is only protecting against resetting to false for which there could be
no side effects this guard would be protecting against.

v/r,
dps

