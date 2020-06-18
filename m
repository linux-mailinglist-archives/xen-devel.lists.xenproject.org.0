Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD0F1FF682
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 17:23:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlwNo-0006lg-F6; Thu, 18 Jun 2020 15:23:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jlwNm-0006lb-IQ
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 15:23:14 +0000
X-Inumbo-ID: a012be38-b177-11ea-baac-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a012be38-b177-11ea-baac-12813bfff9fa;
 Thu, 18 Jun 2020 15:23:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D95ABAAC7;
 Thu, 18 Jun 2020 15:23:11 +0000 (UTC)
Subject: Re: [RFC PATCH v1 4/6] xentop: collect IRQ and HYP time statistics.
To: Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-5-volodymyr_babchuk@epam.com>
 <2a0ff6f5-1ada-9d0a-5014-709c873ec3e3@suse.com>
 <88eac035-8769-24f7-45e6-11a1c4739ccb@xen.org>
 <a5d7bbe8-a9ff-1396-bd7f-3b6143bddac7@suse.com>
 <78910b5c27a3711726d53e931feb075c5cc4a64c.camel@suse.com>
 <bb2449e47c3bb97b004dac8b58123aba8452ccaf.camel@epam.com>
 <b4e35492-6ccc-c7a1-36e9-0239f01c4eb4@suse.com> <87tuz92i6y.fsf@epam.com>
 <8b87612e-52e3-8f75-27a9-557ed9e7991f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eed1c098-7a70-27e5-57ae-3a2c0addd47a@suse.com>
Date: Thu, 18 Jun 2020 17:23:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <8b87612e-52e3-8f75-27a9-557ed9e7991f@xen.org>
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>, "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "dfaggioli@suse.com" <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.06.2020 17:17, Julien Grall wrote:
> 
> 
> On 18/06/2020 03:58, Volodymyr Babchuk wrote:
>>
>> Hi Jürgen,
>>
>> Jürgen Groß writes:
>>
>>> On 13.06.20 00:27, Volodymyr Babchuk wrote:
>>>> On Fri, 2020-06-12 at 17:29 +0200, Dario Faggioli wrote:
>>>>> On Fri, 2020-06-12 at 14:41 +0200, Jürgen Groß wrote:
>>>>>> On 12.06.20 14:29, Julien Grall wrote:
>>>>>>> On 12/06/2020 05:57, Jürgen Groß wrote:
>>>>>>>> On 12.06.20 02:22, Volodymyr Babchuk wrote:
>>>>>>>>> @@ -994,9 +998,22 @@ s_time_t sched_get_time_correction(struct
>>>>>>>>> sched_unit *u)
>>>>>>>>>                 break;
>>>>>>>>>         }
>>>>>>>>> +    spin_lock_irqsave(&sched_stat_lock, flags);
>>>>>>>>> +    sched_stat_irq_time += irq;
>>>>>>>>> +    sched_stat_hyp_time += hyp;
>>>>>>>>> +    spin_unlock_irqrestore(&sched_stat_lock, flags);
>>>>>>>>
>>>>>>>> Please don't use a lock. Just use add_sized() instead which will
>>>>>>>> add
>>>>>>>> atomically.
>>>>>>>
>>>>>>> If we expect sched_get_time_correction to be called concurrently
>>>>>>> then we
>>>>>>> would need to introduce atomic64_t or a spin lock.
>>>>>>
>>>>>> Or we could use percpu variables and add the cpu values up when
>>>>>> fetching the values.
>>>>>>
>>>>> Yes, either percpu or atomic looks much better than locking, to me, for
>>>>> this.
>>>>
>>>> Looks like we going to have atomic64_t after all. So, I'll prefer to to
>>>> use atomics there.
>>>
>>> Performance would be better using percpu variables, as those would avoid
>>> the cacheline moved between cpus a lot.
>>
>> I see. But don't we need locking in this case? I can see scenario, when
>> one pCPU updates own counters while another pCPU is reading them.
>>
>> IIRC, ARMv8 guarantees that 64 bit read of aligned data would be
>> consistent. "Consistent" in the sense that, for example, we would not
>> see lower 32 bits of the new value and upper 32 bits of the old value.
> 
> That's right. Although this would be valid so long you use {read, 
> write}_atomic().
> 
>>
>> I can't say for sure about ARMv7 and about x86.
> ARMv7 with LPAE support will guarantee 64-bit atomicity when using 
> strd/ldrd as long as the alignment is correct. LPAE is mandatory when 
> supporting HYP mode, so you can safely assume this will work.
> 
> 64-bit on x86 is also guaranteed to be atomic when using write_atomic().

... and when again the data is suitably aligned, or at the very least
(for WB RAM) doesn't cross certain boundaries.

Jan

