Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95988287117
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 10:59:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4419.11569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQRl6-0007lC-1D; Thu, 08 Oct 2020 08:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4419.11569; Thu, 08 Oct 2020 08:58:43 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQRl5-0007kn-TY; Thu, 08 Oct 2020 08:58:43 +0000
Received: by outflank-mailman (input) for mailman id 4419;
 Thu, 08 Oct 2020 08:58:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bIXB=DP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kQRl5-0007ki-3A
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 08:58:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6169c46-1754-4e5f-add2-634e6f4fd085;
 Thu, 08 Oct 2020 08:58:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 41913AC3C;
 Thu,  8 Oct 2020 08:58:41 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bIXB=DP=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kQRl5-0007ki-3A
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 08:58:43 +0000
X-Inumbo-ID: c6169c46-1754-4e5f-add2-634e6f4fd085
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c6169c46-1754-4e5f-add2-634e6f4fd085;
	Thu, 08 Oct 2020 08:58:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602147521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErcYGOP7VowXW+iOjYtY9CQWr866S44UL9TcmCYuLp4=;
	b=mbTM8OOixJoIfvTRqX/5E9PT92N8QpE+dzhneFw9wsDXP1jEaKujh7cLDDoHbih7Rj6ts7
	O8yTLHd8ieqkH4Z7COkNrZTK/To2EBMvmXgI3v1H6/bp6ZCin5bI+p9itvDyr7BKUWyfu1
	0oo7E2BZudxe2TptB8zMTQD5nIAmq7M=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 41913AC3C;
	Thu,  8 Oct 2020 08:58:41 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] xen/x86: add nmi continuation framework
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20201007133011.18871-1-jgross@suse.com>
 <20201007133011.18871-2-jgross@suse.com>
 <20201008084306.GJ19254@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e774053e-1f84-fd84-bafc-a2f254d70286@suse.com>
Date: Thu, 8 Oct 2020 10:58:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201008084306.GJ19254@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.10.20 10:43, Roger Pau Monné wrote:
> On Wed, Oct 07, 2020 at 03:30:10PM +0200, Juergen Gross wrote:
>> Actions in NMI context are rather limited as e.g. locking is rather
>> fragile.
>>
>> Add a generic framework to continue processing in softirq context after
>> leaving NMI processing. This is working for NMIs happening in guest
>> context as NMI exit handling will issue an IPI to itself in case a
>> softirq is pending, resulting in the continuation running before the
>> guest gets control again.
> 
> There's already kind of a nmi callback framework using nmi_callback.
> I assume that moving this existing callback code to be executed in
> softirq context is not suitable because that would be past the
> execution of an iret instruction?
> 
> Might be worth mentioning in the commit message.
> 
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   xen/arch/x86/traps.c      | 37 +++++++++++++++++++++++++++++++++++++
>>   xen/include/asm-x86/nmi.h |  8 +++++++-
>>   xen/include/xen/softirq.h |  5 ++++-
>>   3 files changed, 48 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
>> index bc5b8f8ea3..f433fe5acb 100644
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -1799,6 +1799,42 @@ void unset_nmi_callback(void)
>>       nmi_callback = dummy_nmi_callback;
>>   }
>>   
>> +static DEFINE_PER_CPU(void (*)(void *), nmi_cont_func);
>> +static DEFINE_PER_CPU(void *, nmi_cont_par);
>> +
>> +static void nmi_cont_softirq(void)
>> +{
>> +    unsigned int cpu = smp_processor_id();
>> +    void (*func)(void *par) = per_cpu(nmi_cont_func, cpu);
>> +    void *par = per_cpu(nmi_cont_par, cpu);
> 
> I think you can use this_cpu here and below, and avoid having to worry
> about the processor id at all? Also less likely to mess up and assign
> a NMI callback to a wrong CPU.

this_cpu() and smp_processor_id() are both based on get_cpu_info().
So multiple uses of this_cpu() are less efficient than per_cpu() with
cpu in a local variable (regarding code-size and speed, at least I think
so).

> 
>> +
>> +    /* Reads must be done before following write (local cpu ordering only). */
>> +    barrier();
> 
> Is this added because of the usage of RELOC_HIDE by per_cpu?

This is added because reordering of loads by the compiler must be
avoided as a NMI using those fields again might happen anytime.

> 
>> +
>> +    per_cpu(nmi_cont_func, cpu) = NULL;
> 
> Since we are using RELOC_HIDE, doesn't it imply that the compiler
> cannot reorder this, since it has no idea what variable we are
> accessing?

I'd rather be safe here than relying on per_cpu() internals.

> 
>> +
>> +    if ( func )
>> +        func(par);
>> +}
>> +
>> +int set_nmi_continuation(void (*func)(void *par), void *par)
>> +{
>> +    unsigned int cpu = smp_processor_id();
>> +
>> +    if ( per_cpu(nmi_cont_func, cpu) )
>> +    {
>> +        printk("Trying to set NMI continuation while still one active!\n");
>> +        return -EBUSY;
>> +    }
>> +
>> +    per_cpu(nmi_cont_func, cpu) = func;
>> +    per_cpu(nmi_cont_par, cpu) = par;
>> +
>> +    raise_softirq(NMI_CONT_SOFTIRQ);
>> +
>> +    return 0;
>> +}
>> +
>>   void do_device_not_available(struct cpu_user_regs *regs)
>>   {
>>   #ifdef CONFIG_PV
>> @@ -2132,6 +2168,7 @@ void __init trap_init(void)
>>   
>>       cpu_init();
>>   
>> +    open_softirq(NMI_CONT_SOFTIRQ, nmi_cont_softirq);
>>       open_softirq(PCI_SERR_SOFTIRQ, pci_serr_softirq);
>>   }
>>   
>> diff --git a/xen/include/asm-x86/nmi.h b/xen/include/asm-x86/nmi.h
>> index a288f02a50..da40fb6599 100644
>> --- a/xen/include/asm-x86/nmi.h
>> +++ b/xen/include/asm-x86/nmi.h
>> @@ -33,5 +33,11 @@ nmi_callback_t *set_nmi_callback(nmi_callback_t *callback);
>>   void unset_nmi_callback(void);
>>   
>>   DECLARE_PER_CPU(unsigned int, nmi_count);
>> -
>> +
>> +/**
>> + * set_nmi_continuation
>> + *
>> + * Schedule a function to be started in softirq context after NMI handling.
>> + */
>> +int set_nmi_continuation(void (*func)(void *par), void *par);
> 
> I would introduce a type for the nmi callback, as I think it's easier
> than having to retype the prototype everywhere:
> 
> typedef void nmi_continuation_t(void *);

Fine with me.


Juergen

