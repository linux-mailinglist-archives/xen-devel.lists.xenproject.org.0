Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D430E30EF0C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 09:53:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81187.149523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7aN6-0002lf-Ey; Thu, 04 Feb 2021 08:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81187.149523; Thu, 04 Feb 2021 08:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7aN6-0002lG-BT; Thu, 04 Feb 2021 08:52:16 +0000
Received: by outflank-mailman (input) for mailman id 81187;
 Thu, 04 Feb 2021 08:52:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+S2h=HG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l7aN4-0002lB-NR
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 08:52:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93328794-f744-4eae-9f5f-0fc70b945762;
 Thu, 04 Feb 2021 08:52:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7F2B3ABD5;
 Thu,  4 Feb 2021 08:52:12 +0000 (UTC)
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
X-Inumbo-ID: 93328794-f744-4eae-9f5f-0fc70b945762
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612428732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vt37sF7uqc2BxJ/7ttb8QONpFZzTlYene6dWE/QzuvE=;
	b=kANorCpj/J7Yd62nQ6DXK5kp8apxZfcDCa3KIQy0ApZaxBzIkvE5Q/nTssdbqswRWii4YM
	v1WcCRrB7hHlyf6L2BNwri/ZgukZcLnKW+OQ1TUMVOmw1Boke442LeC9rHWKqIA7TZkVF+
	NL9he0v3Sy2VW7uqhkLzjP22+/63GvA=
Subject: Re: VIRIDIAN CRASH: 3b c0000096 75b12c5 9e7f1580 0
To: James Dingwall <james@dingwall.me.uk>
Cc: James Dingwall <james-xen@dingwall.me.uk>, xen-devel@lists.xenproject.org
References: <20210201152655.GA3922797@dingwall.me.uk>
 <d30b5ee3-1fd9-a64b-1d9a-f79b6b333169@suse.com>
 <20210204084636.GA3781256@dingwall.me.uk>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fc022dd1-a5cc-62d3-49ae-bd24f22fe83a@suse.com>
Date: Thu, 4 Feb 2021 09:52:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210204084636.GA3781256@dingwall.me.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.02.2021 09:46, James Dingwall wrote:
> On Wed, Feb 03, 2021 at 03:55:07PM +0100, Jan Beulich wrote:
>> On 01.02.2021 16:26, James Dingwall wrote:
>>> I am building the xen 4.11 branch at 
>>> 310ab79875cb705cc2c7daddff412b5a4899f8c9 which includes commit 
>>> 3b5de119f0399cbe745502cb6ebd5e6633cc139c "86/msr: fix handling of 
>>> MSR_IA32_PERF_{STATUS/CTL}".  I think this should address this error 
>>> recorded in xen's dmesg:
>>>
>>> (XEN) d11v0 VIRIDIAN CRASH: 3b c0000096 75b12c5 9e7f1580 0
>>
>> It seems to me that you imply some information here which might
>> better be spelled out. As it stands I do not see the immediate
>> connection between the cited commit and the crash. C0000096 is
>> STATUS_PRIVILEGED_INSTRUCTION, which to me ought to be impossible
>> for code running in ring 0. Of course I may simply not know enough
>> about modern Windows' internals to understand the connection.
> 
> Searching for "VIRIDIAN CRASH: 3b" led me to this thread and then to the commit based on the commit log message.
> 
> https://patchwork.kernel.org/project/xen-devel/patch/20201007102032.98565-1-roger.pau@citrix.com/
> 
> I have naively assumed that the RCX register indicated MSR_IA32_PERF_CTL based on:
> 
> #define MSR_IA32_PERF_CTL             0x00000199
> 
> I've added this patch:
> 
> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> index 99c848ff41..7a764907d5 100644
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -232,12 +232,16 @@ int guest_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
>           */
>      case MSR_IA32_PERF_STATUS:
>      case MSR_IA32_PERF_CTL:
> -        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR)) )
> +        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR)) ) {
> +            printk(KERN_DEBUG "JKD: MSR %#x FAULT1: %#x & %#x\n", msr, cp->x86_vendor, (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR));
> +
>              goto gp_fault;
> +        }
>  
>          *val = 0;
>          if ( likely(!is_cpufreq_controller(d)) || rdmsr_safe(msr, *val) == 0 )
>              break;
> +        printk(KERN_DEBUG "JKD: MSR FAULT2\n");
>          goto gp_fault;
>  
>          /*
> 
> and now in the hypervisor log when the domain crashes:
> 
> (XEN) JKD: MSR 0x199 FAULT1: 0 & 0x2
> (XEN) d11v0 VIRIDIAN CRASH: 3b c0000096 1146d2c5 6346d580 0
> (XEN) avc:  denied  { reset } for domid=11 scontext=system_u:system_r:domU_t tcontext=system_u:system_r:domU_t_self tclass=event
> 
> I'm not sure what is expected in cp->x86_vendor but this is running on an Intel CPU so I would have thought 0x1 based on
> 
> #define X86_VENDOR_INTEL (1 << 0)

This is the problem - a bad backport. Therefore ...

>> The hypervisor log (at maximum log levels) accompanying this might
>> help some. And of course, if possible, trying on a newer Xen (ideally
>> current master).
> 
> We have a separate upgrade to 4.14.1 in progress and I will test on that too.

I'm sure you'll find this work there. I'll make a patch for the affected
older tree(s).

Jan

