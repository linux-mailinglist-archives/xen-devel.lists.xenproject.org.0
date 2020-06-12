Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D71D31F7810
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 14:45:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjj3h-0006ad-2t; Fri, 12 Jun 2020 12:45:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kdnc=7Z=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jjj3f-0006aY-Bq
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 12:45:19 +0000
X-Inumbo-ID: 920bf240-acaa-11ea-b5c2-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 920bf240-acaa-11ea-b5c2-12813bfff9fa;
 Fri, 12 Jun 2020 12:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vf6RO9DnxhGqSJUdZRusZQultkSQT/emTqL8Ehivgso=; b=UtQyt1++BjOY+3/pDvIKGTF+W8
 kX2qlHavYCgIZkpUOgg4tDhXQ+ZhInR40YyZ3oGCJm0C6eQFq3+m9tcI9qz9oGAdeOuhOPyOpNDLi
 AQFrSLqIC0s6UYuRcLL6S9+Yv4T/yDaq6rWBBnk5zSoeBsc+1+fk91rNke88mTlHJZmU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjj3b-00012X-WD; Fri, 12 Jun 2020 12:45:16 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjj3b-0006dJ-PR; Fri, 12 Jun 2020 12:45:15 +0000
Subject: Re: [RFC PATCH v1 4/6] xentop: collect IRQ and HYP time statistics.
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "jgross@suse.com" <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-5-volodymyr_babchuk@epam.com>
 <2a0ff6f5-1ada-9d0a-5014-709c873ec3e3@suse.com>
 <1fcd5d89691b775d1230bf3405e29893107edcb3.camel@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <92d81acb-fd78-3483-68fb-f52c7bfb3d65@xen.org>
Date: Fri, 12 Jun 2020 13:45:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1fcd5d89691b775d1230bf3405e29893107edcb3.camel@epam.com>
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
 "jbeulich@suse.com" <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Volodymyr,

On 12/06/2020 12:44, Volodymyr Babchuk wrote:
> 
> On Fri, 2020-06-12 at 06:57 +0200, Jürgen Groß wrote:
>> On 12.06.20 02:22, Volodymyr Babchuk wrote:
>>> As scheduler code now collects time spent in IRQ handlers and in
>>> do_softirq(), we can present those values to userspace tools like
>>> xentop, so system administrator can see how system behaves.
>>>
>>> We are updating counters only in sched_get_time_correction() function
>>> to minimize number of taken spinlocks. As atomic_t is 32 bit wide, it
>>> is not enough to store time with nanosecond precision. So we need to
>>> use 64 bit variables and protect them with spinlock.
>>>
>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>> ---
>>>    xen/common/sched/core.c     | 17 +++++++++++++++++
>>>    xen/common/sysctl.c         |  1 +
>>>    xen/include/public/sysctl.h |  4 +++-
>>>    xen/include/xen/sched.h     |  2 ++
>>>    4 files changed, 23 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>>> index a7294ff5c3..ee6b1d9161 100644
>>> --- a/xen/common/sched/core.c
>>> +++ b/xen/common/sched/core.c
>>> @@ -95,6 +95,10 @@ static struct scheduler __read_mostly ops;
>>>    
>>>    static bool scheduler_active;
>>>    
>>> +static DEFINE_SPINLOCK(sched_stat_lock);
>>> +s_time_t sched_stat_irq_time;
>>> +s_time_t sched_stat_hyp_time;
>>> +
>>>    static void sched_set_affinity(
>>>        struct sched_unit *unit, const cpumask_t *hard, const cpumask_t *soft);
>>>    
>>> @@ -994,9 +998,22 @@ s_time_t sched_get_time_correction(struct sched_unit *u)
>>>                break;
>>>        }
>>>    
>>> +    spin_lock_irqsave(&sched_stat_lock, flags);
>>> +    sched_stat_irq_time += irq;
>>> +    sched_stat_hyp_time += hyp;
>>> +    spin_unlock_irqrestore(&sched_stat_lock, flags);
>>
>> Please don't use a lock. Just use add_sized() instead which will add
>> atomically.
> 
> Looks like arm does not support 64 bit variables. >
> Julien, I believe, this is armv7 limitation? Should armv8 work with 64-
> bit atomics?

64-bit atomics can work on both Armv7 and Armv8 :). It just haven't been 
plumbed yet.

I am happy to write a patch if you need atomic64_t or even a 64-bit 
add_sized().

Cheers,

-- 
Julien Grall

