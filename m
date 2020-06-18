Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3ED1FF66A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 17:18:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlwId-0005pz-FG; Thu, 18 Jun 2020 15:17:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AXO0=77=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jlwIc-0005pu-N4
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 15:17:54 +0000
X-Inumbo-ID: e1c72ac2-b176-11ea-8496-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1c72ac2-b176-11ea-8496-bc764e2007e4;
 Thu, 18 Jun 2020 15:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2FLD38ENoAnOrLYIFvwSzGEuWsSJR2OlVzUCD6ih7/o=; b=VJUBZiZpRYsOqZgyMpESDHH+Gf
 hxK0cypzCxtek8qcs0szrzQeDIjE7jb6BURJzO3LiZNVYZbz5BA3Y280JdPAIBpfYqfY1EZH34aj0
 e8AbGv6NO3THdoqy+2U3v4YFEqTXDcucIRoj0aZpIHCSYMcX8MntTbFH76oxpaMH+jAw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jlwIZ-0002wH-Vd; Thu, 18 Jun 2020 15:17:51 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jlwIZ-0005sa-OS; Thu, 18 Jun 2020 15:17:51 +0000
Subject: Re: [RFC PATCH v1 4/6] xentop: collect IRQ and HYP time statistics.
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-5-volodymyr_babchuk@epam.com>
 <2a0ff6f5-1ada-9d0a-5014-709c873ec3e3@suse.com>
 <88eac035-8769-24f7-45e6-11a1c4739ccb@xen.org>
 <a5d7bbe8-a9ff-1396-bd7f-3b6143bddac7@suse.com>
 <78910b5c27a3711726d53e931feb075c5cc4a64c.camel@suse.com>
 <bb2449e47c3bb97b004dac8b58123aba8452ccaf.camel@epam.com>
 <b4e35492-6ccc-c7a1-36e9-0239f01c4eb4@suse.com> <87tuz92i6y.fsf@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8b87612e-52e3-8f75-27a9-557ed9e7991f@xen.org>
Date: Thu, 18 Jun 2020 16:17:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <87tuz92i6y.fsf@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "dfaggioli@suse.com" <dfaggioli@suse.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 18/06/2020 03:58, Volodymyr Babchuk wrote:
> 
> Hi Jürgen,
> 
> Jürgen Groß writes:
> 
>> On 13.06.20 00:27, Volodymyr Babchuk wrote:
>>> On Fri, 2020-06-12 at 17:29 +0200, Dario Faggioli wrote:
>>>> On Fri, 2020-06-12 at 14:41 +0200, Jürgen Groß wrote:
>>>>> On 12.06.20 14:29, Julien Grall wrote:
>>>>>> On 12/06/2020 05:57, Jürgen Groß wrote:
>>>>>>> On 12.06.20 02:22, Volodymyr Babchuk wrote:
>>>>>>>> @@ -994,9 +998,22 @@ s_time_t sched_get_time_correction(struct
>>>>>>>> sched_unit *u)
>>>>>>>>                 break;
>>>>>>>>         }
>>>>>>>> +    spin_lock_irqsave(&sched_stat_lock, flags);
>>>>>>>> +    sched_stat_irq_time += irq;
>>>>>>>> +    sched_stat_hyp_time += hyp;
>>>>>>>> +    spin_unlock_irqrestore(&sched_stat_lock, flags);
>>>>>>>
>>>>>>> Please don't use a lock. Just use add_sized() instead which will
>>>>>>> add
>>>>>>> atomically.
>>>>>>
>>>>>> If we expect sched_get_time_correction to be called concurrently
>>>>>> then we
>>>>>> would need to introduce atomic64_t or a spin lock.
>>>>>
>>>>> Or we could use percpu variables and add the cpu values up when
>>>>> fetching the values.
>>>>>
>>>> Yes, either percpu or atomic looks much better than locking, to me, for
>>>> this.
>>>
>>> Looks like we going to have atomic64_t after all. So, I'll prefer to to
>>> use atomics there.
>>
>> Performance would be better using percpu variables, as those would avoid
>> the cacheline moved between cpus a lot.
> 
> I see. But don't we need locking in this case? I can see scenario, when
> one pCPU updates own counters while another pCPU is reading them.
> 
> IIRC, ARMv8 guarantees that 64 bit read of aligned data would be
> consistent. "Consistent" in the sense that, for example, we would not
> see lower 32 bits of the new value and upper 32 bits of the old value.

That's right. Although this would be valid so long you use {read, 
write}_atomic().

> 
> I can't say for sure about ARMv7 and about x86.
ARMv7 with LPAE support will guarantee 64-bit atomicity when using 
strd/ldrd as long as the alignment is correct. LPAE is mandatory when 
supporting HYP mode, so you can safely assume this will work.

64-bit on x86 is also guaranteed to be atomic when using write_atomic().

-- 
Julien Grall

