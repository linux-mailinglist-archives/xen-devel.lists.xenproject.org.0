Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E512A36112
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 16:10:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888883.1298162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tixK8-0007bp-OM; Fri, 14 Feb 2025 15:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888883.1298162; Fri, 14 Feb 2025 15:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tixK8-0007Z3-KR; Fri, 14 Feb 2025 15:09:48 +0000
Received: by outflank-mailman (input) for mailman id 888883;
 Fri, 14 Feb 2025 15:09:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5vTB=VF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tixK6-0007YB-Q4
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 15:09:46 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b846a378-eae5-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 16:09:43 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43937cf2131so15211415e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 07:09:43 -0800 (PST)
Received: from [10.81.43.157] ([46.149.103.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439618a98cesm46308215e9.37.2025.02.14.07.09.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 07:09:41 -0800 (PST)
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
X-Inumbo-ID: b846a378-eae5-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739545783; x=1740150583; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ezyp9QqnF0eVkE5NTIYfV1LrBjBamzcU4v1Jih1r4hg=;
        b=J+iJx77kYrKns9yMI/3foabEN2RY2Ccu5WGpBXcyzykzpJYHTE/Pc2WNWiuEHuqA5r
         BVo+3G15Ushi5PsqY1etT5N3bHT1l7nIpmAhLzX8SZ8QbMDu6wjdux1QiEdlKEcf1ses
         dRGdRBLH5+qN3RVXS0+jdAn7S83CLXU/uiZOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739545783; x=1740150583;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ezyp9QqnF0eVkE5NTIYfV1LrBjBamzcU4v1Jih1r4hg=;
        b=XjuNTnHHfUDwioARogo3BHvUrMHljsz/VMJhh+4OgjzrHRzII7lp6mEP2bjZw5K/Jp
         LixTTT7kBxSzAoaVaXAMZFwNVPXRsMBVAtd/7W7mYr6ddG92FGW3qe1x1kYsjXH3Ghju
         3Ie6AoJdntkcQGRJzn8g0iiSzpf1KMe086vILWf8Fe6l7p1KhrGKFo8s6hhtNFgtnmw0
         DoWuqTrkWOMpVdgzg3cw8AxNaIfObrU6WPn1KMXvMcH2h4NA2R2j+2o4oJc9LntBcIyz
         mTkTxvhTzZWr/Mo1piClH/yGKc2jF45wxsPwMVpoqFCnF9aux3GJYp7dxC6KQJS2a4P9
         HsUA==
X-Forwarded-Encrypted: i=1; AJvYcCU/Uf8k3hlJ+UduYJmS6Gre/7e3MituYDVZfpe75X4sfmvpHhCD4KaBbvTtq1LPy6LBMAbj0huzhh8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPBdPL/p31Gs7Qx+9YtX9pz/0brdcKqTLAIaeI5p4FeyJXZAmW
	kfiiQikp8krri7EC4i+z24lRG55jhSDLvntm1jhWYU+vriT6JR427ELJJHP320c=
X-Gm-Gg: ASbGnctBL2S5E9BeEc4c/I4dmw6Ld5vVa+RwVPfM7cxx1CXiMFAHCHP+Ldhriz6fUzM
	uHv2uuBXACUOMtJ/AvVRcXFVocmH8R3p8Jkuq3/v6If3RTh/3uMryQhv147ONSHIHRoro3wrmDt
	1CzTR5DRF7PoXUYTKJi1P1mRZqcSCb2nYem38dughcVjsZ/wZ2xBxXesx1palFlvAaqHAJP/BFQ
	0NG+kn7IwJTfQVGWORUieNKhlkbl/xDeVaFm0AkgXwRZj4BYiqYX02qXmsmoCyjPUWU35GavwXv
	e2iu+WgHfItYbktXbromlvHW6g==
X-Google-Smtp-Source: AGHT+IEcxXi7ewBiZXNmyFGCHXyrFEgpDcvnmJpZZwhB9j4TXLAx6uhjysFr76w9lFhy6nV4nkf4aQ==
X-Received: by 2002:a05:600c:1c82:b0:439:5803:414f with SMTP id 5b1f17b1804b1-43959925af0mr145774475e9.5.1739545781707;
        Fri, 14 Feb 2025 07:09:41 -0800 (PST)
Message-ID: <3e4f1f62-137a-48c9-a402-cb6017ed440d@citrix.com>
Date: Fri, 14 Feb 2025 15:09:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/watchdog: Identify which domain watchdog fired
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250213164618.38167-1-andrew.cooper3@citrix.com>
 <7f105533-f80c-41f3-bf3b-8cf8dabdf02c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7f105533-f80c-41f3-bf3b-8cf8dabdf02c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/02/2025 5:00 pm, Jan Beulich wrote:
> On 13.02.2025 17:46, Andrew Cooper wrote:
>> When a watchdog fires, the domain is crashed and can't dump any state.
>>
>> Xen allows a domain to have two separate watchdogs.  Therefore, for a
>> domain running multiple watchdogs (e.g. one based around network, one
>> for disk), it is important for diagnostics to know which watchdog
>> fired.
>>
>> As the printk() is in a timer callback, this is a bit awkward to
>> arrange, but there are 12 spare bits in the bottom of the domain
>> pointer owing to its alignment.
>>
>> Reuse these bits to encode the watchdog id too, so the one which fired
>> is identified when the domain is crashed.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
> You'll eventually need a scheduler maintainer's ack, yet you didn't Cc any
> of them.

Oops yes.  Although really SCHEDOP and the scheduler shouldn't be mixed
like this.

>
>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -1534,12 +1534,17 @@ long vcpu_yield(void)
>>  
>>  static void cf_check domain_watchdog_timeout(void *data)
>>  {
>> -    struct domain *d = data;
>> +    /*
>> +     * The data parameter encodes the watchdog id in the low bits of
>> +     * the domain pointer.
>> +     */
>> +    struct domain *d = _p((unsigned long)data & PAGE_MASK);
>> +    unsigned int id = (unsigned long)data & ~PAGE_MASK;
>>  
>>      if ( d->is_shutting_down || d->is_dying )
>>          return;
>>  
>> -    printk("Watchdog timer fired for domain %u\n", d->domain_id);
>> +    printk("Watchdog timer %u fired for %pd\n", id, d);
> And apriori knowledge will be required to associate the number with whichever
> watchdog it was (network or disk in your example)? (No question that logging
> the number is better than not doing so.)

Indeed, but that's up to the entities in the domain requesting the watchdog.

(Yes, we do have this logged.)

>
>> @@ -1593,7 +1598,17 @@ void watchdog_domain_init(struct domain *d)
>>      d->watchdog_inuse_map = 0;
>>  
>>      for ( i = 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
>> -        init_timer(&d->watchdog_timer[i], domain_watchdog_timeout, d, 0);
>> +    {
>> +        void *data = d;
>> +
>> +        BUILD_BUG_ON(NR_DOMAIN_WATCHDOG_TIMERS >= PAGE_SIZE);
>> +
>> +        /*
>> +         * For the timer callback parameter, encode the watchdog id in
>> +         * the low bits of the domain pointer.
>> +         */
>> +        init_timer(&d->watchdog_timer[i], domain_watchdog_timeout, data + i, 0);
>> +    }
> This way we'll be promising to ourselves that we're never going to alter
> the allocation mechanism of struct domain instances, always requiring
> them to have at least page alignment. If someone wanted to change that,
> they'll have a hard time spotting the logic here. Sadly I have no good
> suggestion towards improving the situation.

I wasn't terribly happy either, but something has occurred to me.

For both struct domain and vcpu, we could have an __aligned(PAGE_SIZE)
attribute.  It's accurate and unlikely to change (and helps x86 code
generation at least).

Then, we can use:

    BUILD_BUG_ON((NR_DOMAIN_WATCHDOG_TIMERS > alignof(d));

which should trigger cleanly if the precondition is violated.

For watchdog specifically, we only actually need uint16_t alignment to
be safe, and there's no way that's going to break in practice.

~Andrew

