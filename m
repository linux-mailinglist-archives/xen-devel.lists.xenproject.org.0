Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D995197A5C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 13:06:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIsBu-00041m-O7; Mon, 30 Mar 2020 11:02:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QcrT=5P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jIsBt-00041d-Lz
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 11:02:49 +0000
X-Inumbo-ID: fe142d8c-7275-11ea-b9bf-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe142d8c-7275-11ea-b9bf-12813bfff9fa;
 Mon, 30 Mar 2020 11:02:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 33B79AF26;
 Mon, 30 Mar 2020 11:02:48 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>
References: <20200329045512.GA28203@simran-Inspiron-5558>
 <20200329133651.yra3nesdqrwwgbte@debian>
 <20200330100559.GO28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <47914165-4bf9-23e8-1a8a-15bd4a59ee8f@suse.com>
Date: Mon, 30 Mar 2020 13:02:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200330100559.GO28601@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH v2] xen/x86: Remove unnecessary cast on void
 pointer
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Simran Singhal <singhalsimran0@gmail.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.03.2020 12:05, Roger Pau Monné wrote:
> On Sun, Mar 29, 2020 at 02:36:51PM +0100, Wei Liu wrote:
>> On Sun, Mar 29, 2020 at 10:25:12AM +0530, Simran Singhal wrote:
>>> Assignment to a typed pointer is sufficient in C.
>>> No cast is needed.
>>>
>>> Also, changed some u64/u32 to uint64_t/uint32_t.
>>>
>>> Signed-off-by: Simran Singhal <singhalsimran0@gmail.com>
>>> ---
>>> Changes in v2:
>>> 	- Took the chance to change some uintX to uintX_t.
>>>
>>>  xen/arch/x86/acpi/cpufreq/powernow.c |  2 +-
>>>  xen/arch/x86/cpu/vpmu.c              |  2 +-
>>>  xen/arch/x86/hpet.c                  |  2 +-
>>>  xen/arch/x86/hvm/save.c              |  2 +-
>>>  xen/arch/x86/hvm/vmx/vvmx.c          | 12 ++++++------
>>>  5 files changed, 10 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
>>> index 3cf9c6cd05..f620bebc7e 100644
>>> --- a/xen/arch/x86/acpi/cpufreq/powernow.c
>>> +++ b/xen/arch/x86/acpi/cpufreq/powernow.c
>>> @@ -58,7 +58,7 @@ static void transition_pstate(void *pstate)
>>>  
>>>  static void update_cpb(void *data)
>>>  {
>>> -    struct cpufreq_policy *policy = (struct cpufreq_policy *)data;
>>> +    struct cpufreq_policy *policy = data;
>>>  
>>>      if (policy->turbo != CPUFREQ_TURBO_UNSUPPORTED) {
>>>          uint64_t msr_content;
>>> diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
>>> index e50d478d23..1ed39ef03f 100644
>>> --- a/xen/arch/x86/cpu/vpmu.c
>>> +++ b/xen/arch/x86/cpu/vpmu.c
>>> @@ -337,7 +337,7 @@ void vpmu_do_interrupt(struct cpu_user_regs *regs)
>>>  
>>>  static void vpmu_save_force(void *arg)
>>>  {
>>> -    struct vcpu *v = (struct vcpu *)arg;
>>> +    struct vcpu *v = arg;
>>>      struct vpmu_struct *vpmu = vcpu_vpmu(v);
>>>  
>>>      if ( !vpmu_is_set(vpmu, VPMU_CONTEXT_LOADED) )
>>> diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
>>> index 86929b9ba1..c46e7cf4ee 100644
>>> --- a/xen/arch/x86/hpet.c
>>> +++ b/xen/arch/x86/hpet.c
>>> @@ -215,7 +215,7 @@ again:
>>>  static void hpet_interrupt_handler(int irq, void *data,
>>>          struct cpu_user_regs *regs)
>>>  {
>>> -    struct hpet_event_channel *ch = (struct hpet_event_channel *)data;
>>> +    struct hpet_event_channel *ch = data;
>>>  
>>>      this_cpu(irq_count)--;
>>>  
>>> diff --git a/xen/arch/x86/hvm/save.c b/xen/arch/x86/hvm/save.c
>>> index 0fc59d3487..a2c56fbc1e 100644
>>> --- a/xen/arch/x86/hvm/save.c
>>> +++ b/xen/arch/x86/hvm/save.c
>>> @@ -417,7 +417,7 @@ void _hvm_read_entry(struct hvm_domain_context *h, void *dest,
>>>      memcpy(dest, &h->data[h->cur], d->length);
>>>  
>>>      if ( d->length < dest_len )
>>> -        memset((char *)dest + d->length, 0, dest_len - d->length);
>>> +        memset(dest + d->length, 0, dest_len - d->length);
>>
>> I believe you shouldn't drop the cast here either because dest is of
>> type void*.
>>
>> Although the calculation in the end is the same (void* considered of
>> size 1), I would still keep the cast such that the semantics is correct.
> 
> IMO dropping the case here is fine, as dest is of type void * the
> calculation is correct and the cast just obfuscates it.

+1

Jan

