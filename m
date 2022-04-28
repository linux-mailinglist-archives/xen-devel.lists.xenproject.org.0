Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5421513791
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 16:59:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316618.535592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk5bV-0007oo-5X; Thu, 28 Apr 2022 14:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316618.535592; Thu, 28 Apr 2022 14:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk5bV-0007lx-1e; Thu, 28 Apr 2022 14:58:49 +0000
Received: by outflank-mailman (input) for mailman id 316618;
 Thu, 28 Apr 2022 14:58:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/G+0=VG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nk5bT-0007lo-AO
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 14:58:47 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b28d46cf-c703-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 16:58:45 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1651157914028481.97361180260066;
 Thu, 28 Apr 2022 07:58:34 -0700 (PDT)
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
X-Inumbo-ID: b28d46cf-c703-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1651157918; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kUN4qZwXHSk16GyzF5Wgr4Kox0LT88ZlRFQupoFuo11KibElIPNXrWrdgdOneFEVMD/sIWf1Fdhl3PQ7MXM+mW1Yvxz+KnJhrhMCrCC/2kJRoQ/VRgh4XXeBP9C8fxW2TSySQ/UupmsXn6wgXP3G5jk1RaN/Brvzjt8W9mqGXfM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1651157918; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=9hru1+aW0ch8vZJB9MIWv8TsZ6cxrZrBX0IuaDA7QPA=; 
	b=WEvB8tQBJx0IDUStREQdV24e1JlwSxWlI6z2T6V9+WWimR9uhQ5nuBJxFU2mNq2jJg9sWtbm2j9TbJJ17hhPWLe4IZR37/0OTH3ZVl+td16Y2zDQJ4rDkrtnFwptLgFEroGlzRMZxIwILZ7KFHJcc4/9eO8p4KKoflqg41Ez2aE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1651157918;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9hru1+aW0ch8vZJB9MIWv8TsZ6cxrZrBX0IuaDA7QPA=;
	b=AAYFzJIreogAWUmINLKBxBM1HlUr3rTjxQ04QYvGZ60/DNGjUb0/xtwrHFKp6Pg6
	S/K5PZBqQx51CCXc4Hi2gZuFvuhrwHYFRTLkIf2rKtaRWkca+Yn/4etaVavT6qqeVjY
	NNMAX4khlvULfILmmMYpk/WssEWARWJY5jJ1tQx4=
Message-ID: <c872d5c4-9a6b-b955-556c-7974382fc4c4@apertussolutions.com>
Date: Thu, 28 Apr 2022 10:57:42 -0400
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
 <25e701d4-62ae-278d-b165-2201459c7cee@apertussolutions.com>
 <YmebdccTfa7wKc9U@Air-de-Roger>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 1/2] xsm: create idle domain privileged and demote
 after setup
In-Reply-To: <YmebdccTfa7wKc9U@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 4/26/22 03:12, Roger Pau Monné wrote:
> On Mon, Apr 25, 2022 at 12:39:17PM -0400, Daniel P. Smith wrote:
>> On 4/25/22 05:44, Roger Pau Monné wrote:
>>> On Fri, Apr 22, 2022 at 12:34:57PM -0400, Daniel P. Smith wrote:
>>>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>>> index d5d0792ed4..e71fa3f860 100644
>>>> --- a/xen/arch/arm/setup.c
>>>> +++ b/xen/arch/arm/setup.c
>>>> @@ -1048,6 +1048,9 @@ void __init start_xen(unsigned long boot_phys_offset,
>>>>      /* Hide UART from DOM0 if we're using it */
>>>>      serial_endboot();
>>>>  
>>>> +    if ( xsm_set_system_active() != 0)
>>>> +        panic("xsm: unable to set hypervisor to SYSTEM_ACTIVE privilege\n");
>>>> +
>>>>      system_state = SYS_STATE_active;
>>>>  
>>>>      for_each_domain( d )
>>>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>>>> index 6f20e17892..a3ce288ef9 100644
>>>> --- a/xen/arch/x86/setup.c
>>>> +++ b/xen/arch/x86/setup.c
>>>> @@ -621,6 +621,9 @@ static void noreturn init_done(void)
>>>>      void *va;
>>>>      unsigned long start, end;
>>>>  
>>>> +    if ( xsm_set_system_active() != 0)
>>>            ^ extra space.
>>>
>>> Since the function returns an error code you might as well add it to
>>> the panic message, or else just make the function return bool instead.
>>>
>>> Or just make the function void and panic in the handler itself (like
>>> in previous versions), as I don't think it's sensible to continue
>>> normal execution if xsm_set_system_active fails.
>>
>> After reflecting on it, I believe that was not the correct action. The
>> policy should handle setting/checking all access control state and fail
>> with an error of why and then allow the hypervisor logic decided what to
>> do with that failure. For the policies that are present today, yes it is
>> an immediate panic. Ultimately this will future proof the interface
>> should a future policy type be introduced with a more varied result that
>> could allow the hypervisor to continue to boot, for instance to a
>> limited and/or debug state.
> 
> That's all fine, but if you return an error code, please print it as
> part of the panic message.  The more information we can add in case of
> panic, the better.

Ack.

>>>> diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
>>>> index 8c044ef615..e6ffa948f7 100644
>>>> --- a/xen/xsm/dummy.c
>>>> +++ b/xen/xsm/dummy.c
>>>> @@ -14,6 +14,7 @@
>>>>  #include <xsm/dummy.h>
>>>>  
>>>>  static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
>>>> +    .set_system_active             = xsm_set_system_active,
>>>>      .security_domaininfo           = xsm_security_domaininfo,
>>>>      .domain_create                 = xsm_domain_create,
>>>>      .getdomaininfo                 = xsm_getdomaininfo,
>>>> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
>>>> index 0bf63ffa84..8a62de2fd6 100644
>>>> --- a/xen/xsm/flask/hooks.c
>>>> +++ b/xen/xsm/flask/hooks.c
>>>> @@ -186,6 +186,26 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>>>>      return 0;
>>>>  }
>>>>  
>>>> +static int cf_check flask_set_system_active(void)
>>>> +{
>>>> +    struct domain *d = current->domain;
>>>
>>> Nit: you should also add the assert for d->is_privileged, I don't see
>>> a reason for the xsm and flask functions to differ in that regard.
>>
>> This goes back to an issued I have raised before, is_privileged really
>> encompasses two properties of a domain. Whether the domain is filling
>> the special control domain role versus what accesses the domain has
>> based on the context under which is_control_domain() is called. For
>> instance the function init_domain_msr_policy() uses is_control_domain()
>> not to make an access control decision but configure behavior. Under
>> flask is_privileged no longer reflects the accesses a domain with it set
>> will have, thus whether it is cleared when flask is enabled is
>> irrelevant as far as flask is concerned. For the ASSERT, what matters is
>> that the label was set to xenboot_t on construction and that it was not
>> changed before reaching this point. Or in a short form, when under the
>> default policy the expected state is concerned with is_privilege while
>> for flask it is only the SID.
> 
> I certainly don't care that much, but you do set d->is_privileged =
> false in flask_set_system_active, hence it would seem logic to expect
> d->is_privileged == true also?

Yes, I did this just for consistency not because there is any
significance of is_privilege on the idle domain, in both contexts for
which is_privileged is used, when flask is the enforcing policy.

> If not for anything else, just to assert that the function is not
> called twice.

Under this patch flask_set_system_active() is effectively a no-op, so
calling it twice has no effect. In the next patch flask_set_system()
becomes a real check and there is an ASSERT on the SID as that is the
relevant context under flask and will ensure calling only once.

In the end I can add the ASSERT but it would be adding it for the sake
of adding it as it would not be protecting the hypervisor from moving
into an incorrect state.

v/r,
dps

