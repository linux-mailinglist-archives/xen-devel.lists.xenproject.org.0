Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C45224978D
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 09:37:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8Iex-0000xu-TZ; Wed, 19 Aug 2020 07:37:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b5Wx=B5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k8Iew-0000x3-Gn
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 07:37:22 +0000
X-Inumbo-ID: 99dac1b1-f6e0-4657-8595-6faaa4f5edcb
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99dac1b1-f6e0-4657-8595-6faaa4f5edcb;
 Wed, 19 Aug 2020 07:37:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 42C00ACDF;
 Wed, 19 Aug 2020 07:37:47 +0000 (UTC)
Subject: Re: [PATCH v2 7/7] x86: don't include domctl and alike in
 shim-exclusive builds
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <3a8356a9-313c-6de8-f409-977eae1fbfa5@suse.com>
 <be0dbe7b-3feb-1a5b-b523-2293a7442707@suse.com>
 <20200818130824.GM828@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7d19daec-5f5a-c2f9-9ec7-8e20bc0ed655@suse.com>
Date: Wed, 19 Aug 2020 09:37:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200818130824.GM828@Air-de-Roger>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.08.2020 15:08, Roger Pau Monné wrote:
> On Fri, Aug 07, 2020 at 01:35:08PM +0200, Jan Beulich wrote:
>> There is no need for platform-wide, system-wide, or per-domain control
>> in this case. Hence avoid including this dead code in the build.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> --- a/xen/arch/x86/mm/paging.c
>> +++ b/xen/arch/x86/mm/paging.c
>> @@ -47,6 +47,8 @@
>>  /* Per-CPU variable for enforcing the lock ordering */
>>  DEFINE_PER_CPU(int, mm_lock_level);
>>  
>> +#ifndef CONFIG_PV_SHIM_EXCLUSIVE
>> +
>>  /************************************************/
>>  /*              LOG DIRTY SUPPORT               */
>>  /************************************************/
>> @@ -628,6 +630,8 @@ void paging_log_dirty_init(struct domain
>>      d->arch.paging.log_dirty.ops = ops;
>>  }
>>  
>> +#endif /* CONFIG_PV_SHIM_EXCLUSIVE */
>> +
>>  /************************************************/
>>  /*           CODE FOR PAGING SUPPORT            */
>>  /************************************************/
>> @@ -667,7 +671,7 @@ void paging_vcpu_init(struct vcpu *v)
>>          shadow_vcpu_init(v);
>>  }
>>  
>> -
>> +#ifndef CONFIG_PV_SHIM_EXCLUSIVE
>>  int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
>>                    XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl,
>>                    bool_t resuming)
>> @@ -788,6 +792,7 @@ long paging_domctl_continuation(XEN_GUES
>>  
>>      return ret;
>>  }
>> +#endif /* CONFIG_PV_SHIM_EXCLUSIVE */
>>  
>>  /* Call when destroying a domain */
>>  int paging_teardown(struct domain *d)
>> @@ -803,10 +808,12 @@ int paging_teardown(struct domain *d)
>>      if ( preempted )
>>          return -ERESTART;
>>  
>> +#ifndef CONFIG_PV_SHIM_EXCLUSIVE
>>      /* clean up log dirty resources. */
>>      rc = paging_free_log_dirty_bitmap(d, 0);
>>      if ( rc == -ERESTART )
>>          return rc;
>> +#endif
> 
> Adding all this ifndefs make the code worse IMO, is it really that much
> of a win in terms of size?
> 
> TBH I'm not sure it's worth it.

Without these the entire patch would need dropping, and excluding
domctl / sysctl in general is useful imo (I didn't even go check
whether further code has now ended up being dead, that'll be
incremental work over time). I agree the #ifdef-ary isn't ideal,
and I'd be happy to see some or all of it go away again in favor
of whichever better solution.

Jan

