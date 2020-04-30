Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0831BF2EA
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 10:34:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU4dw-0004iI-Ss; Thu, 30 Apr 2020 08:34:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jU4dw-0004iD-9J
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 08:34:04 +0000
X-Inumbo-ID: 57b30174-8abd-11ea-9a10-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57b30174-8abd-11ea-9a10-12813bfff9fa;
 Thu, 30 Apr 2020 08:34:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 84A34AB7F;
 Thu, 30 Apr 2020 08:33:59 +0000 (UTC)
Subject: Re: [PATCH] x86/hap: be more selective with assisted TLB flush
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200429173601.77605-1-roger.pau@citrix.com>
 <4257a323-d37f-4af0-bdc6-a3f65c19438a@suse.com>
 <20200430082844.GZ28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d5a0308b-0ac3-21f5-9a07-e1402005b663@suse.com>
Date: Thu, 30 Apr 2020 10:33:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430082844.GZ28601@Air-de-Roger>
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
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.04.2020 10:28, Roger Pau Monné wrote:
> On Thu, Apr 30, 2020 at 09:20:58AM +0200, Jan Beulich wrote:
>> On 29.04.2020 19:36, Roger Pau Monne wrote:
>>> When doing an assisted flush on HAP the purpose of the
>>> on_selected_cpus is just to trigger a vmexit on remote CPUs that are
>>> in guest context, and hence just using is_vcpu_dirty_cpu is too lax,
>>> also check that the vCPU is running.
>>
>> Am I right to understand that the change is relevant only to
>> cover the period of time between ->is_running becoming false
>> and ->dirty_cpu becoming VCPU_CPU_CLEAN? I.e. ...
>>
>>> --- a/xen/arch/x86/mm/hap/hap.c
>>> +++ b/xen/arch/x86/mm/hap/hap.c
>>> @@ -719,7 +719,7 @@ static bool flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
>>>          hvm_asid_flush_vcpu(v);
>>>  
>>>          cpu = read_atomic(&v->dirty_cpu);
>>> -        if ( cpu != this_cpu && is_vcpu_dirty_cpu(cpu) )
>>> +        if ( cpu != this_cpu && is_vcpu_dirty_cpu(cpu) && v->is_running )
>>
>> ... the previous logic would have suitably covered the switch-to
>> path, but doesn't properly cover the switch-from one, due to our
>> lazy context switch approach?
> 
> Yes. Also __context_switch is not called from context_switch when
> switching to the idle vcpu, and hence dirty_cpu is not cleared.
> 
>> If so, I agree with the change:
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> It might be worth mentioning this detail in the description then,
>> though.
> 
> Would you mind adding to the commit message if you agree:
> 
> "Due to the lazy context switching done by Xen dirty_cpu won't always be
> cleared when the guest vCPU is not running, and hence relying on
> is_running allows more fine grained control of whether the vCPU is
> actually running."

Sure; I'll give it over the weekend though for others to comment, if
so desired.

Jan

