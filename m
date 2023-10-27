Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 617377D9B05
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 16:19:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624517.973103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwNfc-0000ic-O9; Fri, 27 Oct 2023 14:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624517.973103; Fri, 27 Oct 2023 14:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwNfc-0000ft-L6; Fri, 27 Oct 2023 14:18:40 +0000
Received: by outflank-mailman (input) for mailman id 624517;
 Fri, 27 Oct 2023 14:18:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HqTC=GJ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qwNfb-0000fn-Nk
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 14:18:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8f03038-74d3-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 16:18:38 +0200 (CEST)
Received: from [192.168.1.15] (host-95-247-204-25.retail.telecomitalia.it
 [95.247.204.25])
 by support.bugseng.com (Postfix) with ESMTPSA id 1425E4EE073E;
 Fri, 27 Oct 2023 16:18:38 +0200 (CEST)
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
X-Inumbo-ID: b8f03038-74d3-11ee-98d6-6d05b1d4d9a1
Message-ID: <4fc39741-40a7-4a60-8cbf-2d23bbf5a238@bugseng.com>
Date: Fri, 27 Oct 2023 16:18:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/set_{c,p}x_pminfo: address violations od MISRA
 C:2012 Rule 8.3
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <88499ca9a61b59d13d90f6c5f77cbb2e124d850e.1698322083.git.federico.serafini@bugseng.com>
 <beb4255f-76ca-2b09-a953-d02e0f04997e@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <beb4255f-76ca-2b09-a953-d02e0f04997e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/10/23 15:57, Jan Beulich wrote:
> On 26.10.2023 14:09, Federico Serafini wrote:
>> --- a/xen/drivers/cpufreq/cpufreq.c
>> +++ b/xen/drivers/cpufreq/cpufreq.c
>> @@ -457,14 +457,14 @@ static void print_PPC(unsigned int platform_limit)
>>       printk("\t_PPC: %d\n", platform_limit);
>>   }
>>   
>> -int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *dom0_px_info)
>> +int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
>>   {
>>       int ret=0, cpuid;
>>       struct processor_pminfo *pmpt;
>>       struct processor_performance *pxpt;
>>   
>>       cpuid = get_cpu_id(acpi_id);
>> -    if ( cpuid < 0 || !dom0_px_info)
>> +    if ( ( cpuid < 0 ) || !perf)
> 
> I don't see the need for the new pair of parentheses here, but if you
> add such, please don't violate style.

Noted.

> 
>> @@ -488,21 +488,21 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *dom0_px_in
>>       pmpt->acpi_id = acpi_id;
>>       pmpt->id = cpuid;
>>   
>> -    if ( dom0_px_info->flags & XEN_PX_PCT )
>> +    if ( perf->flags & XEN_PX_PCT )
>>       {
>>           /* space_id check */
>> -        if (dom0_px_info->control_register.space_id !=
>> -            dom0_px_info->status_register.space_id)
>> +        if ( perf->control_register.space_id !=
>> +             perf->status_register.space_id )
>>           {
>>               ret = -EINVAL;
>>               goto out;
>>           }
>>   
>>           memcpy ((void *)&pxpt->control_register,
>> -                (void *)&dom0_px_info->control_register,
>> +                (void *)&perf->control_register,
>>                   sizeof(struct xen_pct_register));
>>           memcpy ((void *)&pxpt->status_register,
>> -                (void *)&dom0_px_info->status_register,
>> +                (void *)&perf->status_register,
>>                   sizeof(struct xen_pct_register));
>>   
>>           if ( cpufreq_verbose )
>> @@ -512,69 +512,67 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *dom0_px_in
>>           }
>>       }
>>   
>> -    if ( dom0_px_info->flags & XEN_PX_PSS )
>> +    if ( perf->flags & XEN_PX_PSS )
>>       {
>>           /* capability check */
>> -        if (dom0_px_info->state_count <= 1)
>> +        if (perf->state_count <= 1)
> 
> Since you're adjusting style elsewhere, would you mind adding the missing
> blanks here as well?
> 
>>           {
>>               ret = -EINVAL;
>>               goto out;
>>           }
>>   
>>           if ( !(pxpt->states = xmalloc_array(struct xen_processor_px,
>> -                        dom0_px_info->state_count)) )
>> +                                            perf->state_count)) )
>>           {
>>               ret = -ENOMEM;
>>               goto out;
>>           }
>> -        if ( copy_from_guest(pxpt->states, dom0_px_info->states,
>> -                             dom0_px_info->state_count) )
>> +        if ( copy_from_guest(pxpt->states, perf->states, perf->state_count) )
>>           {
>>               ret = -EFAULT;
>>               goto out;
>>           }
>> -        pxpt->state_count = dom0_px_info->state_count;
>> +        pxpt->state_count = perf->state_count;
>>   
>>           if ( cpufreq_verbose )
>>               print_PSS(pxpt->states,pxpt->state_count);
>>       }
>>   
>> -    if ( dom0_px_info->flags & XEN_PX_PSD )
>> +    if ( perf->flags & XEN_PX_PSD )
>>       {
>>           /* check domain coordination */
>> -        if (dom0_px_info->shared_type != CPUFREQ_SHARED_TYPE_ALL &&
>> -            dom0_px_info->shared_type != CPUFREQ_SHARED_TYPE_ANY &&
>> -            dom0_px_info->shared_type != CPUFREQ_SHARED_TYPE_HW)
>> +        if (perf->shared_type != CPUFREQ_SHARED_TYPE_ALL &&
>> +            perf->shared_type != CPUFREQ_SHARED_TYPE_ANY &&
>> +            perf->shared_type != CPUFREQ_SHARED_TYPE_HW)
> 
> Same here then?
> 
> Jan

Sure, I'll pay more attention.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

