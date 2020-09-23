Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C195276218
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 22:30:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLBOT-0006wf-AD; Wed, 23 Sep 2020 20:29:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Zf1=DA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kLBOR-0006wa-Qh
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 20:29:35 +0000
X-Inumbo-ID: 1c666828-279b-4a8f-a4df-96fd9d2e5274
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c666828-279b-4a8f-a4df-96fd9d2e5274;
 Wed, 23 Sep 2020 20:29:34 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id y4so742736ljk.8
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2020 13:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=8yRl+VYMiKavRyAAgQ2ZJOX7KnRqoVXAfE44SEV1hcw=;
 b=PEYME4XYclxm4ABhbOg1NPvxC90e3zE9kTYy4NFBzybk0WMtjlUv46q3hUmHPbCzwX
 H1XDoxv9RrPDHqxAa9w20tEwGecdAWeAer5MWymIq9tCibGG+j5e8FfOpG6LEd3yHhaR
 r2EsdHy9T4CUoys9n7nAiPdZEzuhPjIkBQz/i/Q84wMKvX/Z/4h/h24SLC1xjCJNNhSS
 nHyKADeH4bfwdg6mEhAE8/MJGxZ7o4TMv6RD8GyIgZAC9yVEPdUgh2PDw+FfGvjGOy9D
 8n/0IsVDq4QbF3TdykhHv59QrIjkZnu6QKsjBIi5yfcC5moVr1rox15tNf/a8bJZRdRp
 rXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=8yRl+VYMiKavRyAAgQ2ZJOX7KnRqoVXAfE44SEV1hcw=;
 b=mT6tY+Ippgw4OEkODS/7yU1jcn/Xw4TvGHKOJ/tBaGrpiuE+uEXu9NjPUGCijhkv9d
 jxajO/ZlZUSSwzImw3KwKFem8gMMjWlLHxphIXpLUW6vz8EjEYDA6qsIZH+QJxvGsZbq
 61qXN8wqucL52W5knykc5rWxNjfca+FfojoHWrT73GvWuzs+vEUHkKTGpvzFEVjWEx2Y
 r0V4SW+bQNnavbHzm3FN45rm/sLTRAf211HYLzfmLV9CFfKOVJHwo0vmKgTA29BbkVie
 t0oWxwGi9Ixldq0FPZeAlXZU3HlvthFUTFnWRYdrzLGsk05C8ckG4aYJTG9k1ATvYtVe
 TwtQ==
X-Gm-Message-State: AOAM530Ap1da/v0q7zi/HbSe25zYYD07sF1nbgSiupa3BNs7VB6ncW9B
 5YOwMUWs4GYwvhHwPF67SUs=
X-Google-Smtp-Source: ABdhPJy5vtbSJ+aZlr+/3FiN6qPsOIz3IJ7Y+Sbh24hKe4gGa5QGI87apPpZZjdSg3Ey+H2HVOnYpg==
X-Received: by 2002:a2e:7307:: with SMTP id o7mr465025ljc.323.1600892973336;
 Wed, 23 Sep 2020 13:29:33 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v13sm428533lfo.30.2020.09.23.13.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2020 13:29:32 -0700 (PDT)
Subject: Re: [PATCH V1 14/16] xen/ioreq: Use guest_cmpxchg64() instead of
 cmpxchg()
To: Julien Grall <julien@xen.org>, paul@xen.org,
 'Jan Beulich' <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <jgrall@amazon.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-15-git-send-email-olekstysh@gmail.com>
 <44b19ee1-dc34-3a46-0b4b-7196faadcb5c@suse.com>
 <c87089d5-39d2-55e6-5539-97af32c3d6cd@xen.org>
 <002b01d68c09$12df32a0$389d97e0$@xen.org>
 <b43a814a-3788-010e-768b-75211748b05c@xen.org>
 <3e58dc8a-4ecb-1ed5-3179-82f96cc40ca7@gmail.com>
 <e2ac245b-ca3c-77e1-160a-9f664b4a3339@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a6d2d349-7a9f-6091-c6b5-8fcd4bf8338d@gmail.com>
Date: Wed, 23 Sep 2020 23:29:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e2ac245b-ca3c-77e1-160a-9f664b4a3339@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 23.09.20 21:12, Julien Grall wrote:

Hi Julien

>
>>>>>
>>>>>
>>>>> On 16/09/2020 10:04, Jan Beulich wrote:
>>>>>> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
>>>>>>> @@ -1325,7 +1327,7 @@ static int hvm_send_buffered_ioreq(struct 
>>>>>>> hvm_ioreq_server *s, ioreq_t *p)
>>>>>>>
>>>>>>>            new.read_pointer = old.read_pointer - n * 
>>>>>>> IOREQ_BUFFER_SLOT_NUM;
>>>>>>>            new.write_pointer = old.write_pointer - n * 
>>>>>>> IOREQ_BUFFER_SLOT_NUM;
>>>>>>> -        cmpxchg(&pg->ptrs.full, old.full, new.full);
>>>>>>> +        guest_cmpxchg64(d, &pg->ptrs.full, old.full, new.full);
>>>>>>
>>>>>> But the memory we're updating is shared with s->emulator, not 
>>>>>> with d,
>>>>>> if I'm not mistaken.
>>>>>
>>>>> It is unfortunately shared with both s->emulator and d when using the
>>>>> legacy interface.
>>>>
>>>> When using magic pages they should be punched out of the P2M by the 
>>>> time the code gets here, so the memory should not be guest-visible.
>>>
>>> Can you point me to the code that doing this?
>>>
>>> Cheers,
>>>
>> If we are not going to use legacy interface on Arm we will have a 
>> page to be mapped in a single domain at the time.
> Right, but this is common code... You have to think what would be the 
> implication if we are using the legacy interface.
>
> Thankfully the only user of the legacy interface is x86 so far and 
> there is not concern regarding the atomics operations.
>
> If we are happy to consider that the legacy interface will never be 
> used (I am starting to be worry that one will ask it on Arm...) then 
> we should be fine.
>
> I think would be worth documenting in the commit message and the code 
> (hvm_allow_set_param()) that the legacy interface *must* not be used 
> without revisiting the code.

Will do.


-- 
Regards,

Oleksandr Tyshchenko


