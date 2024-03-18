Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7B387ED09
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:09:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694872.1084077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFYF-0006au-J8; Mon, 18 Mar 2024 16:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694872.1084077; Mon, 18 Mar 2024 16:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFYF-0006ZM-GR; Mon, 18 Mar 2024 16:09:27 +0000
Received: by outflank-mailman (input) for mailman id 694872;
 Mon, 18 Mar 2024 16:09:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rE6T=KY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rmFYE-0006ZE-14
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:09:26 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3168999-e541-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:09:24 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a450bedffdfso556706466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:09:24 -0700 (PDT)
Received: from ?IPV6:2003:e5:873a:400:704b:6dbb:e7c0:786e?
 (p200300e5873a0400704b6dbbe7c0786e.dip0.t-ipconnect.de.
 [2003:e5:873a:400:704b:6dbb:e7c0:786e])
 by smtp.gmail.com with ESMTPSA id
 h26-20020a17090619da00b00a4668200ba1sm4936649ejd.207.2024.03.18.09.09.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 09:09:23 -0700 (PDT)
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
X-Inumbo-ID: e3168999-e541-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710778164; x=1711382964; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yvwn+Gfj3kr/kfwlJ1imZ5Wh57RO6P4Zq5naMkcxsZE=;
        b=EX0Cfnjcxb2+ou9pG7QYtvZJOFwMRonSzrNGA4qwR/FfAUnT5NjY4GfULYyj8+i1Sw
         RGmwxHtEo86boqcVVDalIGzWIPOY6+RkmHLdtgnDDPr6JEG+Uhl93OFts72Pmw76jxf0
         AGiZu2C5iGaTkv3+eok10MLhCoLmnyGdCkfWBwB1xhNQ/iIcYhBRP4DFHsbn55JfKigF
         0iMfHR3Tn2nQzEM0xdaNQyk1SC3/bI4tidJINKjR7RalZFM9lDksXpH8eSntD6PPhMAO
         L8GjO3MnVfC/9h9JMRHdtwyvXEcyJRzyJi5JDx6q9GBFMpGlts96O5ExBf6X4LbB5+oH
         E8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710778164; x=1711382964;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yvwn+Gfj3kr/kfwlJ1imZ5Wh57RO6P4Zq5naMkcxsZE=;
        b=BGSnQuav2s31jSCEHVieV+mn3xt1wxxNRNhV7rXrY7Pbbt55IQV2kkHvK1wxYESCqp
         Bw6WfsSRUXpR59uBobK/OsssvV4M7KpH/ov6+Y6WxaNIb/FkrED9IUFyqpizCO8gl8vW
         cYLy8lZPBjlfr9j5DfaZezdgzh6Y4PJrP2p/+7vZB2Y3ZPP7Gm7yJTUss/EN8jzhahEG
         A5EenTsd5FNUayDERK9tZ27i6Eov9a4QPbRq6gxAM7gDB1NVlKM98lQRcX4wkKh+kULP
         tkJjhzAUUj95DErm/jErNjeTT/6KG815CdgUrEaGYwKnDVtP8VExPDqV/KmSP+WmQaCk
         0wOg==
X-Forwarded-Encrypted: i=1; AJvYcCXFdXM3GlBMs97yQR760DZeSdVwPmztzKBZ0DJrb6qLBk2dqHVK4Toq+vHDWrYwA6DOX8wxvHg6MiokZ2GEh09gYNbT2JrF8oTAfiykDwk=
X-Gm-Message-State: AOJu0YxBnAmmhCy/gKKEuFa4EJIbWxkTVGnF+sjNfiVJuUXrV5H22fS+
	Vs+80zt0w8Zg3+jRrcIDWhJkMotsnnpL01lGlvwO7zDMby5wkXV+STfvX53fYqM=
X-Google-Smtp-Source: AGHT+IG1kQI8hGUPiwoT6nUyH63BgDBdOXk/yhzIgxPtEbXUbWgQ3CrBQjCMyS2bN2X4R+GucDiXpg==
X-Received: by 2002:a17:906:3750:b0:a46:ac55:8e77 with SMTP id e16-20020a170906375000b00a46ac558e77mr3546607ejc.13.1710778163608;
        Mon, 18 Mar 2024 09:09:23 -0700 (PDT)
Message-ID: <41742751-6e14-4fdb-905a-aac52d750c1b@suse.com>
Date: Mon, 18 Mar 2024 17:09:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] xen/spinlock: add
 rspin_[un]lock_irq[save|restore]()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240314072029.16937-1-jgross@suse.com>
 <20240314072029.16937-5-jgross@suse.com>
 <1b8417b8-93aa-4976-a27a-701cfdf183b4@suse.com>
 <39e1f192-9790-49da-8f33-1eeb6a245539@suse.com>
 <1ac7b3cd-2f61-4c13-8cac-f74f953ffb08@suse.com>
 <51229f1e-bfbb-41b2-82a9-4b58ce9afaa2@suse.com>
 <76443915-db52-4728-8d7e-429f0f0a53f3@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <76443915-db52-4728-8d7e-429f0f0a53f3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18.03.24 17:08, Jan Beulich wrote:
> On 18.03.2024 17:05, Jürgen Groß wrote:
>> On 18.03.24 16:59, Jan Beulich wrote:
>>> On 18.03.2024 16:55, Jürgen Groß wrote:
>>>> On 18.03.24 15:43, Jan Beulich wrote:
>>>>> On 14.03.2024 08:20, Juergen Gross wrote:
>>>>>> Instead of special casing rspin_lock_irqsave() and
>>>>>> rspin_unlock_irqrestore() for the console lock, add those functions
>>>>>> to spinlock handling and use them where needed.
>>>>>>
>>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>>
>>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>>> with two remarks:
>>>>>
>>>>>> --- a/xen/common/spinlock.c
>>>>>> +++ b/xen/common/spinlock.c
>>>>>> @@ -475,15 +475,31 @@ void _rspin_lock(rspinlock_t *lock)
>>>>>>         lock->recurse_cnt++;
>>>>>>     }
>>>>>>     
>>>>>> +unsigned long _rspin_lock_irqsave(rspinlock_t *lock)
>>>>>> +{
>>>>>> +    unsigned long flags;
>>>>>> +
>>>>>> +    local_irq_save(flags);
>>>>>> +    _rspin_lock(lock);
>>>>>> +
>>>>>> +    return flags;
>>>>>> +}
>>>>>> +
>>>>>>     void _rspin_unlock(rspinlock_t *lock)
>>>>>>     {
>>>>>>         if ( likely(--lock->recurse_cnt == 0) )
>>>>>>         {
>>>>>>             lock->recurse_cpu = SPINLOCK_NO_CPU;
>>>>>> -        spin_unlock(lock);
>>>>>> +        _spin_unlock(lock);
>>>>>
>>>>> This looks like an unrelated change. I think I can guess the purpose, but
>>>>> it would be nice if such along-the-way changes could be mentioned in the
>>>>> description.
>>>>
>>>> I think it would be better to move that change to patch 3.
>>>
>>> Hmm, it would be a secondary change there, too. I was actually meaning to
>>> commit patches 2-5, but if things want moving around I guess I better
>>> wait with doing so?
>>
>> Hmm, maybe just drop this hunk and let patch 7 handle it?
> 
> Ah yes, that seem more logical to me. I take it you don't mean "hunk"
> though, but really just this one line change.

Oh yes, of course.


Juergen


