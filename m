Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD5E2E08BC
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 11:27:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57726.101098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kretE-00019T-G8; Tue, 22 Dec 2020 10:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57726.101098; Tue, 22 Dec 2020 10:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kretE-000194-Cx; Tue, 22 Dec 2020 10:27:36 +0000
Received: by outflank-mailman (input) for mailman id 57726;
 Tue, 22 Dec 2020 10:27:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=if9N=F2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kretD-00018y-0A
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 10:27:35 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 799bbf8f-bbc2-48cc-b14b-dccade90a486;
 Tue, 22 Dec 2020 10:27:33 +0000 (UTC)
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
X-Inumbo-ID: 799bbf8f-bbc2-48cc-b14b-dccade90a486
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608632853;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=EVZTI24WkGLTw9U36vgvMwxxGO3l+UbWN9heLMZEdvY=;
  b=M9Y0KrH6KR//mwBjNm+uNE16k8Whg+S3MJgb0L6Cc2UboegxcSQ0quvu
   NPuDgnl8dVP6s4rNktYdXgBiUoHfPA7AO4iSmei+gcBFGOgzmjtfeO8za
   r6s1qchW79Tilv+kxk2ZJiQQqR72epImAhJt2+0oH2cTys/D1s77iCEcR
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +NC4Q7cdg14XXl1helzSab3rK+fWjojU4LDJUkEGJ9G4FIzHjtE1M6mlNp+HtstD6jfoGhLFU2
 oOe6LIbDP7KCrttBuVaPRepLJLKOrCoPUtKTuzPzqclZs0bWFc2nErCZaih5CgnC1Z0isMT4TD
 sGgHlr5AGcFmiUkfGY4A/K50Wh3j13YgC1rkr8bwTVCwb3uND6hTd8eYHdEGoLtD7Dpp9q6Zjx
 17jzqcW+T6wRWM1oeVymb7+wxiFLxmPLy37gSYyU7G9xGbeNGMB+yWE/5h7pogB/yJCVUrz1oZ
 fd4=
X-SBRS: 5.2
X-MesageID: 33974280
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,438,1599537600"; 
   d="scan'208";a="33974280"
Subject: Re: [PATCH 1/3] xen/domain: Reorder trivial initialisation in early
 domain_create()
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
 <20201221181446.7791-2-andrew.cooper3@citrix.com>
 <3397707d-ba05-4db2-7dfd-e18dbe044a26@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <472745b0-7b9b-1412-85c7-6186711fadd8@citrix.com>
Date: Tue, 22 Dec 2020 10:24:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3397707d-ba05-4db2-7dfd-e18dbe044a26@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 22/12/2020 10:10, Jan Beulich wrote:
> On 21.12.2020 19:14, Andrew Cooper wrote:
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -391,25 +391,7 @@ struct domain *domain_create(domid_t domid,
>>  
>>      TRACE_1D(TRC_DOM0_DOM_ADD, d->domain_id);
>>  
>> -    /*
>> -     * Allocate d->vcpu[] and set ->max_vcpus up early.  Various per-domain
>> -     * resources want to be sized based on max_vcpus.
>> -     */
>> -    if ( !is_system_domain(d) )
>> -    {
>> -        err = -ENOMEM;
>> -        d->vcpu = xzalloc_array(struct vcpu *, config->max_vcpus);
>> -        if ( !d->vcpu )
>> -            goto fail;
>> -
>> -        d->max_vcpus = config->max_vcpus;
>> -    }
>> -
>> -    lock_profile_register_struct(LOCKPROF_TYPE_PERDOM, d, domid);
> Wouldn't this also count as "trivial initialization", and hence while
> moving want to at least be placed ...
>
>> -    if ( (err = xsm_alloc_security_domain(d)) != 0 )
>> -        goto fail;
>> -
>> +    /* Trivial initialisation. */
>>      atomic_set(&d->refcnt, 1);
>>      RCU_READ_LOCK_INIT(&d->rcu_lock);
>>      spin_lock_init_prof(d, domain_lock);
>> @@ -434,6 +416,27 @@ struct domain *domain_create(domid_t domid,
>>      INIT_LIST_HEAD(&d->pdev_list);
>>  #endif
>>  
>> +    /* All error paths can depend on the above setup. */
> ... ahead of this comment?

Can do.

>
>> +    /*
>> +     * Allocate d->vcpu[] and set ->max_vcpus up early.  Various per-domain
>> +     * resources want to be sized based on max_vcpus.
>> +     */
>> +    if ( !is_system_domain(d) )
>> +    {
>> +        err = -ENOMEM;
>> +        d->vcpu = xzalloc_array(struct vcpu *, config->max_vcpus);
>> +        if ( !d->vcpu )
>> +            goto fail;
>> +
>> +        d->max_vcpus = config->max_vcpus;
>> +    }
>> +
>> +    lock_profile_register_struct(LOCKPROF_TYPE_PERDOM, d, domid);
>> +
>> +    if ( (err = xsm_alloc_security_domain(d)) != 0 )
>> +        goto fail;
>> +
>>      err = -ENOMEM;
>>      if ( !zalloc_cpumask_var(&d->dirty_cpumask) )
>>          goto fail;
>>
> Just as an observation (i.e. unlikely for this patch) I doubt
> system domains need ->dirty_cpumask set up, and hence this
> allocation may also want moving down a few lines.

I agree in principle.  However, something does (or at least did)
reference this for system domains when I did the is_system_domain() cleanup.

The fix might not be as trivial as just moving the allocation.

~Andrew

