Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E63D538F8E
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 13:18:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339543.564415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvzsq-0000o5-Q8; Tue, 31 May 2022 11:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339543.564415; Tue, 31 May 2022 11:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvzsq-0000lr-Mk; Tue, 31 May 2022 11:17:56 +0000
Received: by outflank-mailman (input) for mailman id 339543;
 Tue, 31 May 2022 11:17:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xfyb=WH=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nvzso-0000le-N0
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 11:17:54 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f7d9116-e0d3-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 13:17:53 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1653995865650167.2590047952341;
 Tue, 31 May 2022 04:17:45 -0700 (PDT)
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
X-Inumbo-ID: 4f7d9116-e0d3-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1653995867; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R2utZavWzXD2nx8Avk5EoZTaNcgUyoTU+BYbzsdtHChvZvpP9r0dx+CixTNXnJLK7+tE7DZHP/li9edKf0pV/HD5uu8KyV8HHuksnACpKPq/QXQSEXoxBhNeFo0Nj9shy95PO6JCFN/rm3Q7Sc6blusrh5UhxOAhWEAWwsQugKM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1653995867; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Z9I7HnQLALuF6Cupxgl8g/hDsQchtrid4tZPgFOIJR4=; 
	b=N2xj1XHYOFYz6Qkwo7IvBpgDHqtMZG82a+khclIaJAl3n/kEeblFpAQEhXtlezJn216NNuMAH/53pcQQ3RAxqwhgWQOmKIX9BZyDSZKCs4H7mudR19j7orvohCayMCZze+XPLwNbVWJWid3bVxcqjZB2XF89QewdaZlkZExl+rA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653995867;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Z9I7HnQLALuF6Cupxgl8g/hDsQchtrid4tZPgFOIJR4=;
	b=B92kXVqzxUriD0GGzN08JfwCrKs6F9EjIyd8f2qwik93PyrSvSE4krCLmpT1MfGK
	VvXa4vE8xymk3dTTGFsMkmmINnMmD4Sxqydw7Mfx0AAEUAtBU2Z0iE+Ht51U0BbluSW
	+6Jvov+IxKHb/SzyYFbfF7OUW9xR9uqgP9vmtru8=
Message-ID: <f11cc372-e6b7-d1a5-e1fe-e939ed1d13f6@apertussolutions.com>
Date: Tue, 31 May 2022 07:16:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 scott.davis@starlab.io, jandryuk@gmail.com, christopher.clark@starlab.io,
 Luca Fancellu <luca.fancellu@arm.com>, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220511113035.27070-1-dpsmith@apertussolutions.com>
 <20220511113035.27070-2-dpsmith@apertussolutions.com>
 <YpXKKQHuEKeXZbEj@Air-de-Roger>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v7 1/2] xsm: create idle domain privileged and demote
 after setup
In-Reply-To: <YpXKKQHuEKeXZbEj@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External


On 5/31/22 03:56, Roger Pau Monné wrote:
> On Wed, May 11, 2022 at 07:30:34AM -0400, Daniel P. Smith wrote:
>> There are new capabilities, dom0less and hyperlaunch, that introduce internal
>> hypervisor logic which needs to make resource allocation calls that are
>> protected by XSM access checks. This creates an issue as a subset of the
>> hypervisor code is executed under a system domain, the idle domain, that is
>> represented by a per-CPU non-privileged struct domain.
> 
> Should you mention that this subset of hypervisor code that requires
> extended privileges but executed in the idle vCPU context strictly
> only happens during initial domain(s) creation?

Sure, I will work in some wording to clarify that point.

>> To enable these new
>> capabilities to function correctly but in a controlled manner, this commit
>> changes the idle system domain to be created as a privileged domain under the
>> default policy and demoted before transitioning to running. A new XSM hook,
>> xsm_set_system_active(), is introduced to allow each XSM policy type to demote
>> the idle domain appropriately for that policy type. In the case of SILO, it
>> inherits the default policy's hook for xsm_set_system_active().
>>
>> For flask a stub is added to ensure that flask policy system will function
>> correctly with this patch until flask is extended with support for starting the
>> idle domain privileged and properly demoting it on the call to
>> xsm_set_system_active().
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>> Acked-by: Julien Grall <jgrall@amazon.com> # arm
>> ---
>>  xen/arch/arm/setup.c    |  3 +++
>>  xen/arch/x86/setup.c    |  4 ++++
>>  xen/common/sched/core.c |  7 ++++++-
>>  xen/include/xsm/dummy.h | 17 +++++++++++++++++
>>  xen/include/xsm/xsm.h   |  6 ++++++
>>  xen/xsm/dummy.c         |  1 +
>>  xen/xsm/flask/hooks.c   | 23 +++++++++++++++++++++++
>>  7 files changed, 60 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index d5d0792ed4..7f3f00aa6a 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -1048,6 +1048,9 @@ void __init start_xen(unsigned long boot_phys_offset,
>>      /* Hide UART from DOM0 if we're using it */
>>      serial_endboot();
>>  
>> +    if ( (rc = xsm_set_system_active()) != 0 )
>> +        panic("xsm(err=%d): unable to set hypervisor to SYSTEM_ACTIVE privilege\n", rc);
>> +
>>      system_state = SYS_STATE_active;
>>  
>>      for_each_domain( d )
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 6f20e17892..57ee6cc407 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -620,6 +620,10 @@ static void noreturn init_done(void)
>>  {
>>      void *va;
>>      unsigned long start, end;
>> +    int err;
>> +
>> +    if ( (err = xsm_set_system_active()) != 0 )
>> +        panic("xsm(err=%d): unable to set hypervisor to SYSTEM_ACTIVE privilege\n", err);
> 
> Can you place err on a new line to make the line length no longer than
> strictly necessary.
> 
> I think you could also reduce the printed message to:
> 
> "unable to switch to SYSTEM_ACTIVE privilege: %d\n"
> 
> Which could likely fit in a line (seeing as others are fine with the
> longer message I'm not going to insist).

Nope, I am with you on this. I would prefer to have less than 80 or
wrap. I like the suggestion, it will get it below 80 without any loss of
meaning.

>> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
>> index 0bf63ffa84..54745e6c6a 100644
>> --- a/xen/xsm/flask/hooks.c
>> +++ b/xen/xsm/flask/hooks.c
>> @@ -186,6 +186,28 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>>      return 0;
>>  }
>>  
>> +static int cf_check flask_set_system_active(void)
>> +{
>> +    struct domain *d = current->domain;
>> +
>> +    ASSERT(d->is_privileged);
>> +
>> +    if ( d->domain_id != DOMID_IDLE )
>> +    {
>> +        printk("%s: should only be called by idle domain\n", __func__);
>> +        return -EPERM;
>> +    }
>> +
>> +    /*
>> +     * While is_privileged has no significant meaning under flask, set to false
>> +     * as is_privileged is not only used for a privilege check but also as a type
> 
> Nit: I think this line is over 80 cols.

Ugh, probably spell check pushed it over, and I didn't catch it. Will fix.


v/r,
dps

