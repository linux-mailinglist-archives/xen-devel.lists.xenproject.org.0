Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 486721EBAC1
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 13:51:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg5RS-0003tV-6g; Tue, 02 Jun 2020 11:50:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jg5RQ-0003tQ-Ji
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 11:50:48 +0000
X-Inumbo-ID: 4bee20de-a4c7-11ea-abe3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4bee20de-a4c7-11ea-abe3-12813bfff9fa;
 Tue, 02 Jun 2020 11:50:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1A66CACA3;
 Tue,  2 Jun 2020 11:50:48 +0000 (UTC)
Subject: Re: [PATCH v2 for-4.14 2/3] xen/vm_event: add
 vm_event_check_pending_op
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1590028160.git.tamas@tklengyel.com>
 <52492e7b44f311b09e9a433f2e5a2ba607a85c78.1590028160.git.tamas@tklengyel.com>
 <20200602114722.GX1195@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e761e845-26dd-7e38-d220-5e0a6f1995c1@suse.com>
Date: Tue, 2 Jun 2020 13:50:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200602114722.GX1195@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alexandru Isaila <aisaila@bitdefender.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.06.2020 13:47, Roger Pau Monné wrote:
> On Wed, May 20, 2020 at 08:31:53PM -0600, Tamas K Lengyel wrote:
>> Perform sanity checking when shutting vm_event down to determine whether
>> it is safe to do so. Error out with -EAGAIN in case pending operations
>> have been found for the domain.
>>
>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
>> ---
>>  xen/arch/x86/vm_event.c        | 23 +++++++++++++++++++++++
>>  xen/common/vm_event.c          | 17 ++++++++++++++---
>>  xen/include/asm-arm/vm_event.h |  7 +++++++
>>  xen/include/asm-x86/vm_event.h |  2 ++
>>  4 files changed, 46 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
>> index 848d69c1b0..a23aadc112 100644
>> --- a/xen/arch/x86/vm_event.c
>> +++ b/xen/arch/x86/vm_event.c
>> @@ -297,6 +297,29 @@ void vm_event_emulate_check(struct vcpu *v, vm_event_response_t *rsp)
>>      };
>>  }
>>  
>> +bool vm_event_check_pending_op(const struct vcpu *v)
>> +{
>> +    struct monitor_write_data *w = &v->arch.vm_event->write_data;
> 
> const
> 
>> +
>> +    if ( !v->arch.vm_event->sync_event )
>> +        return false;
>> +
>> +    if ( w->do_write.cr0 )
>> +        return true;
>> +    if ( w->do_write.cr3 )
>> +        return true;
>> +    if ( w->do_write.cr4 )
>> +        return true;
>> +    if ( w->do_write.msr )
>> +        return true;
>> +    if ( v->arch.vm_event->set_gprs )
>> +        return true;
>> +    if ( v->arch.vm_event->emulate_flags )
>> +        return true;
> 
> Can you please group this into a single if, ie:
> 
> if ( w->do_write.cr0 || w->do_write.cr3 || ... )
>     return true;
> 
>> +
>> +    return false;
>> +}
>> +
>>  /*
>>   * Local variables:
>>   * mode: C
>> diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
>> index 127f2d58f1..2df327a42c 100644
>> --- a/xen/common/vm_event.c
>> +++ b/xen/common/vm_event.c
>> @@ -183,6 +183,7 @@ static int vm_event_disable(struct domain *d, struct vm_event_domain **p_ved)
>>      if ( vm_event_check_ring(ved) )
>>      {
>>          struct vcpu *v;
>> +        bool pending_op = false;
>>  
>>          spin_lock(&ved->lock);
>>  
>> @@ -192,9 +193,6 @@ static int vm_event_disable(struct domain *d, struct vm_event_domain **p_ved)
>>              return -EBUSY;
>>          }
>>  
>> -        /* Free domU's event channel and leave the other one unbound */
>> -        free_xen_event_channel(d, ved->xen_port);
>> -
>>          /* Unblock all vCPUs */
>>          for_each_vcpu ( d, v )
>>          {
>> @@ -203,8 +201,21 @@ static int vm_event_disable(struct domain *d, struct vm_event_domain **p_ved)
>>                  vcpu_unpause(v);
>>                  ved->blocked--;
>>              }
>> +
>> +            if ( vm_event_check_pending_op(v) )
>> +                pending_op = true;
> 
> You could just do:
> 
> pending_op |= vm_event_check_pending_op(v);
> 
> and avoid the initialization of pending_op above.

The initialization has to stay, or it couldn't be |= afaict.

> Or alternatively:
> 
> if ( !pending_op && vm_event_check_pending_op(v) )
>     pending_op = true;
> 
> Which avoid repeated calls to vm_event_check_pending_op when at least
> one vCPU is known to be busy.

    if ( !pending_op )
        pending_op = vm_event_check_pending_op(v);

?

Jan

