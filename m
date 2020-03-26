Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E48193B99
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 10:17:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHOas-0005Md-FM; Thu, 26 Mar 2020 09:14:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dmc7=5L=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jHOaq-0005MY-Ln
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 09:14:28 +0000
X-Inumbo-ID: 30afe9c0-6f42-11ea-877f-12813bfff9fa
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 30afe9c0-6f42-11ea-877f-12813bfff9fa;
 Thu, 26 Mar 2020 09:14:26 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id z65so6032478ede.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2020 02:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NEob++TghJ+iWXVBJy147eoLOmXRzjTTBb1AJucDNAU=;
 b=KFhy8dPr1okl7/lmu7+dv0HBgCYcYybtN2rMXqDnYqvj8yPQZIk7YbfIPogAa5h4g/
 NHiXomhHyqy/jyK806Ow7swD4UCoCguUoi8/tgCFO3sg/ltUT0rjYOak/sU2AEJyik3y
 uCN3j69Ul10yGaCa1CrBgCbLoPyyK7Hnm95bUkrK0nScIXL5DjjNf9IgzoEH5luQApmo
 w0fiyjvWOyXtahD2j8kEz4UHAS/OLahZMCuCDCtRArUnmQl58AMbRiPl/ZKMQUapmZpV
 Fd8CPZhBqqhrzP0lS4kmoV93zuYK6zWYu8KdVbl3L/HOHV5VZNG8P7aJhJp2EpY6nyzH
 8oFw==
X-Gm-Message-State: ANhLgQ0WUsw4xyCXOXT0TZrPvIP0v3G0WDUsFI80sJhg40/Pi+sEi/Bx
 Ub8XutpvMfvZnwPmo1APxd0=
X-Google-Smtp-Source: ADFU+vsennd8fXRfjkEB9JcWtcfvkq/oY9vfQrBeN3F8EcGzrIOnjAkue3IWWNPKnGbH7RCWQiOj3g==
X-Received: by 2002:a50:aa9c:: with SMTP id q28mr7075375edc.10.1585214065979; 
 Thu, 26 Mar 2020 02:14:25 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-227.amazon.com.
 [54.240.197.227])
 by smtp.gmail.com with ESMTPSA id h14sm180557ejt.1.2020.03.26.02.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2020 02:14:25 -0700 (PDT)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20200325105511.20882-1-jgross@suse.com>
 <20200325105511.20882-3-jgross@suse.com>
 <1c688233-2f64-9dd0-7d98-4a0840489293@xen.org>
 <5950cabe-0065-904c-6c61-0e6eab8f8060@suse.com>
 <7539a91f-6b9a-865d-f8c3-b8124d16f17a@suse.com>
 <c060ecc2-3678-2882-8eef-442c2b8c14b9@suse.com>
 <af79fe19-ca87-747a-ad58-abfdafbf3ecf@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c119d5cd-cf35-157a-d0d4-8385b1729295@xen.org>
Date: Thu, 26 Mar 2020 09:14:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <af79fe19-ca87-747a-ad58-abfdafbf3ecf@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH v7 2/5] xen/rcu: don't use
 stop_machine_run() for rcu_barrier()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 26/03/2020 08:50, Jürgen Groß wrote:
> On 26.03.20 09:49, Jan Beulich wrote:
>> On 26.03.2020 08:24, Jürgen Groß wrote:
>>> On 26.03.20 07:58, Jan Beulich wrote:
>>>> On 25.03.2020 17:13, Julien Grall wrote:
>>>>> On 25/03/2020 10:55, Juergen Gross wrote:
>>>>>> @@ -143,51 +143,90 @@ static int qhimark = 10000;
>>>>>>     static int qlowmark = 100;
>>>>>>     static int rsinterval = 1000;
>>>>>>     -struct rcu_barrier_data {
>>>>>> -    struct rcu_head head;
>>>>>> -    atomic_t *cpu_count;
>>>>>> -};
>>>>>> +/*
>>>>>> + * rcu_barrier() handling:
>>>>>> + * Two counters are used to synchronize rcu_barrier() work:
>>>>>> + * - cpu_count holds the number of cpus required to finish 
>>>>>> barrier handling.
>>>>>> + *   It is decremented by each cpu when it has performed all 
>>>>>> pending rcu calls.
>>>>>> + * - pending_count shows whether any rcu_barrier() activity is 
>>>>>> running and
>>>>>> + *   it is used to synchronize leaving rcu_barrier() only after 
>>>>>> all cpus
>>>>>> + *   have finished their processing. pending_count is initialized 
>>>>>> to nr_cpus + 1
>>>>>> + *   and it is decremented by each cpu when it has seen that 
>>>>>> cpu_count has
>>>>>> + *   reached 0. The cpu where rcu_barrier() has been called will 
>>>>>> wait until
>>>>>> + *   pending_count has been decremented to 1 (so all cpus have 
>>>>>> seen cpu_count
>>>>>> + *   reaching 0) and will then set pending_count to 0 indicating 
>>>>>> there is no
>>>>>> + *   rcu_barrier() running.
>>>>>> + * Cpus are synchronized via softirq mechanism. rcu_barrier() is 
>>>>>> regarded to
>>>>>> + * be active if pending_count is not zero. In case rcu_barrier() 
>>>>>> is called on
>>>>>> + * multiple cpus it is enough to check for pending_count being 
>>>>>> not zero on entry
>>>>>> + * and to call process_pending_softirqs() in a loop until 
>>>>>> pending_count drops to
>>>>>> + * zero, before starting the new rcu_barrier() processing.
>>>>>> + */
>>>>>> +static atomic_t cpu_count = ATOMIC_INIT(0);
>>>>>> +static atomic_t pending_count = ATOMIC_INIT(0);
>>>>>>       static void rcu_barrier_callback(struct rcu_head *head)
>>>>>>     {
>>>>>> -    struct rcu_barrier_data *data = container_of(
>>>>>> -        head, struct rcu_barrier_data, head);
>>>>>> -    atomic_inc(data->cpu_count);
>>>>>> +    smp_mb__before_atomic();     /* Make all writes visible to 
>>>>>> other cpus. */
>>>>>
>>>>> smp_mb__before_atomic() will order both read and write. However, the
>>>>> comment suggest only the write are required to be ordered.
>>>>>
>>>>> So either the barrier is too strong or the comment is incorrect. Can
>>>>> you clarify it?
>>>>
>>>> Neither is the case, I guess: There simply is no 
>>>> smp_wmb__before_atomic()
>>>> in Linux, and if we want to follow their model we shouldn't have one
>>>> either. I'd rather take the comment to indicate that if one 
>>>> appeared, it
>>>> could be used here.
>>>
>>> Right. Currently we have the choice of either using
>>> smp_mb__before_atomic() which is too strong for Arm, or smp_wmb() which
>>> is too strong for x86.
>>
>> For x86 smp_wmb() is actually only very slightly too strong - it expands
>> to just barrier(), after all. So overall perhaps that's the better
>> choice here (with a suitable comment)?
> 
> Fine with me.

I am happy with that.

Cheers,

-- 
Julien Grall

