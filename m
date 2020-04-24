Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E501B6DD1
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 08:13:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRraB-0001Jy-Ix; Fri, 24 Apr 2020 06:13:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2qtr=6I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRraA-0001Jt-L6
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 06:13:02 +0000
X-Inumbo-ID: a6c9aef4-85f2-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6c9aef4-85f2-11ea-b4f4-bc764e2007e4;
 Fri, 24 Apr 2020 06:13:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 656BBADEB;
 Fri, 24 Apr 2020 06:13:00 +0000 (UTC)
Subject: Re: [PATCH 1/3] x86/S3: Use percpu_traps_init() rather than
 opencoding SYSCALL/SYSENTER restoration
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200420145911.5708-1-andrew.cooper3@citrix.com>
 <20200420145911.5708-2-andrew.cooper3@citrix.com>
 <db70738a-4750-2780-2f44-b0bcd3a5f93b@suse.com>
 <4ff5227c-a9a4-f6cc-2068-ddd41165ebaf@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <32681985-49cb-339b-0ba2-9dbe11bbdc63@suse.com>
Date: Fri, 24 Apr 2020 08:13:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4ff5227c-a9a4-f6cc-2068-ddd41165ebaf@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.04.2020 20:24, Andrew Cooper wrote:
> On 21/04/2020 08:24, Jan Beulich wrote:
>> On 20.04.2020 16:59, Andrew Cooper wrote:
>>> @@ -46,24 +36,13 @@ void restore_rest_processor_state(void)
>>>      /* Restore full CR4 (inc MCE) now that the IDT is in place. */
>>>      write_cr4(mmu_cr4_features);
>>>  
>>> -    /* Recover syscall MSRs */
>>> -    wrmsrl(MSR_LSTAR, saved_lstar);
>>> -    wrmsrl(MSR_CSTAR, saved_cstar);
>>> -    wrmsrl(MSR_STAR, XEN_MSR_STAR);
>>> -    wrmsrl(MSR_SYSCALL_MASK, XEN_SYSCALL_MASK);
>>> +    /* (re)initialise SYSCALL/SYSENTER state, amongst other things. */
>>> +    percpu_traps_init();
>> Without tweaks to subarch_percpu_traps_init() this assumes that,
>> now and going forward, map_domain_page() will work reliably at
>> this early point of resume. I'm not opposed, i.e.
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> I think this reasonable to expect, and robust going forward.
> 
> We are properly in d[IDLE]v0 context when it comes to pagetables, and
> there is nothing interesting between this point and coming fully back
> online.
> 
> That said, I could easily move the call to later in the resume path for
> even more certainty.
> 
> diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
> index 3ad7dfc9a3..d5a468eddd 100644
> --- a/xen/arch/x86/acpi/power.c
> +++ b/xen/arch/x86/acpi/power.c
> @@ -297,6 +297,8 @@ static int enter_state(u32 state)
>      ci->spec_ctrl_flags |= (default_spec_ctrl_flags & SCF_ist_wrmsr);
>      spec_ctrl_exit_idle(ci);
>  
> +    /* (re)initialise SYSCALL/SYSENTER state, amongst other things. */
> +    percpu_traps_init();
> +
>   done:
>      spin_debug_enable();
>      local_irq_restore(flags);
> 
> In fact - I prefer this, because it works towards one low priority goal
> of deleting {save,restore}_rest_processor_state() which I've still got a
> pending series for.
> 
> Would your ack still stand if I tweak the patch in this way?

Yes.

Jan

