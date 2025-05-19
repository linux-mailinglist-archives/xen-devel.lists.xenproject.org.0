Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A778AABB51D
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 08:32:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989524.1373544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGu2f-0002qR-77; Mon, 19 May 2025 06:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989524.1373544; Mon, 19 May 2025 06:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGu2f-0002oX-3r; Mon, 19 May 2025 06:32:05 +0000
Received: by outflank-mailman (input) for mailman id 989524;
 Mon, 19 May 2025 06:32:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cAbn=YD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uGu2d-0002oN-00
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 06:32:03 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f891f4ce-347a-11f0-9ffb-bf95429c2676;
 Mon, 19 May 2025 08:32:01 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-600210e4219so5677217a12.0
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 23:32:01 -0700 (PDT)
Received: from [192.168.61.201] (server.hotelpassage.eu. [88.146.207.194])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d501fe9sm5336419a12.20.2025.05.18.23.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 23:32:00 -0700 (PDT)
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
X-Inumbo-ID: f891f4ce-347a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747636320; x=1748241120; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=inVQoYGkJNXV0yd0t5SUJvuNQY5MUANJ2cdud0HaO3Q=;
        b=YmkU2hH1qohznGQCqWSz4Bn+CCn1FohlO5/5UXeBr7Yeq2LGbpKDvA7gRdvJH7AgEV
         U+hl8Z0lsIpGWhrDzWqGfWRK04zChT8JduHC+k07GijQyJ6K4HCSLwDI/FUPSeb/DfSt
         qRadq7QHQaSM8CNQDIRV+6sg1n0qW1PwaXvq7c3ySb8i2B9oAwFskSBdrdvAawE4BDSq
         +nMFTWX8d9sTFky6r1naVybOp9TKGFSlqW6mn9Sa/0zcD0rcrKBumPHTrfMiE4A+hzs2
         0G6P9OwKUHxJhjMAo34m5m8e3EdM+1zFyn7qjKVZt6I/Fx4ibkrAZUTKPZUkfpZ/kLLk
         j6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747636320; x=1748241120;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=inVQoYGkJNXV0yd0t5SUJvuNQY5MUANJ2cdud0HaO3Q=;
        b=sUWk4RbZ6QYPr6T/Xj88JzstiqJxnTTw/HTB99TWoaJbE3o+MRw8DrX/70v4wjny4Q
         NxoxA+JoxFzc7Qil0p1YAdGTqIV8vtX1jGBqnLXQqJJmEN0Xeo+DjUJIE5NcZPBGPnXK
         ZpDUEj9kApqJCg9C/TJ/1jP2cJzDA3iXYsZwlnuxpWfix1oaQv7oEfXUPMHcqG/3d8l0
         KP15BaRRUz9e/8+ZJMG5W6p91ALKuRgwtLn6LsC0UHuXR3ZkxQKaGHE0/tUO7yVsG3vC
         G05HP4qBFXW+LwutVD6jpEdTBPN4xmPGnuD8kl2AhmfZFfEZZgrv4/tsNZYoGHGK8ekv
         COkw==
X-Forwarded-Encrypted: i=1; AJvYcCUPDlCS7D3va9/WX7gwDJAHrX6VSSYcdpSg5diKmu/fFI9uHuAdPIDdWFWmhEdcmvvYCMsayTtldSQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmZ8JV4jQWT9mZAVPS5HuDsKpTUfyLywa7nyGp09o8m5u8QmT8
	PnIjXela52AQ0Wvpgy6B1Lq/t4l/lFNUgcaHQ7PxnWTsSBXBWL2BKsGzaTYZaupc4Q==
X-Gm-Gg: ASbGncvfhwDZjadduRvNHqw662/nf3V5V5dYyXYBkgBOGXqrIq8YwZiJEvMIZNKhg+x
	r4D/uJF1VE1wvpHKrK29kKbO0G0epHF3DXkvH8DBM/WXF9im8e9YEna7o+u/2x/Uia18N5I5IAm
	A2tcVW0iKSQOey7cird5/7Aj5TxCLw86Av4UOYjzlqba2q4g7PrK05rpfd5tTeo8IJpB4V5Gm0N
	YV4ZZk01tGp3yTb9a3XAPy81LvdNLboKBkhRGhmQM42eWCsYhIxiifI2zo6WoLAVl4X/oBBqkL5
	3Gr/cg6lGMZZ/L0ep30xSGIabaSsKUTRe3i/qa80co7d9+u1Y51KT3eaXrgQ+TQgu8R9+d+jVl3
	/yMRDXLnh/w==
X-Google-Smtp-Source: AGHT+IGIlufVtEocN181MOEcmuAqbe4U/fqcmQ8xU28iVfemqt0YKq6Crv7bnL2xCBpFHvN9xcA/xA==
X-Received: by 2002:a05:6402:3085:b0:600:a694:7a23 with SMTP id 4fb4d7f45d1cf-600a6947cecmr7439718a12.0.1747636320546;
        Sun, 18 May 2025 23:32:00 -0700 (PDT)
Message-ID: <b080ef7f-0355-42ed-a74a-642299c5d997@suse.com>
Date: Mon, 19 May 2025 08:31:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-5-Penny.Zheng@amd.com>
 <2f3702f3-a46b-4161-a890-7aad9bbbcac4@suse.com>
 <889d2b2b-db42-43d2-9da0-dcd130d64d9c@suse.com>
 <DM4PR12MB845196DB77AC3D6FBCC1C69BE188A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <eeb66db3-623f-4ca8-9ea5-4d89e5b4a824@suse.com>
 <IA1PR12MB8467D276A22BAF765C9387F2E19CA@IA1PR12MB8467.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <IA1PR12MB8467D276A22BAF765C9387F2E19CA@IA1PR12MB8467.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.05.2025 08:27, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, May 12, 2025 11:58 PM
>> On 07.05.2025 05:18, Penny, Zheng wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Tuesday, April 29, 2025 7:47 PM
>>>> On 29.04.2025 12:36, Jan Beulich wrote:
>>>>> On 14.04.2025 09:40, Penny Zheng wrote:
>>>>>> --- a/xen/drivers/cpufreq/cpufreq.c
>>>>>> +++ b/xen/drivers/cpufreq/cpufreq.c
>>>>>> @@ -71,6 +71,49 @@ unsigned int __initdata cpufreq_xen_cnt = 1;
>>>>>>
>>>>>>  static int __init cpufreq_cmdline_parse(const char *s, const char
>>>>>> *e);
>>>>>>
>>>>>> +static bool __init cpufreq_opts_contain(enum cpufreq_xen_opt
>>>>>> +option) {
>>>>>> +    unsigned int count = cpufreq_xen_cnt;
>>>>>> +
>>>>>> +    while ( count )
>>>>>> +    {
>>>>>> +        if ( cpufreq_xen_opts[--count] == option )
>>>>>> +            return true;
>>>>>> +    }
>>>>>> +
>>>>>> +    return false;
>>>>>> +}
>>>>>> +
>>>>>> +static int __init handle_cpufreq_cmdline(enum cpufreq_xen_opt
>>>>>> +option) {
>>>>>> +    int ret = 0;
>>>>>> +
>>>>>> +    if ( cpufreq_opts_contain(option) )
>>>>>> +    {
>>>>>> +        const char *cpufreq_opts_str[] = { "CPUFREQ_xen",
>>>>>> + "CPUFREQ_hwp" };
>>>>>
>>>>>         const char *const __initconstrel cpufreq_opts_str[] = {
>>>>> "CPUFREQ_xen", "CPUFREQ_hwp" };
>>>>>
>>>>> (line wrapped suitably, of course) Or maybe even better
>>>>>
>>>>>         const char __initconst cpufreq_opts_str[][12] = {
>>>>> "CPUFREQ_xen", "CPUFREQ_hwp" };
>>>>>
>>>>> for the string literals to also end up in .init.rodata.
>>>>
>>>> Actually, it didn't even occur to me that there might be a "static" missing here,
>> too.
>>>
>>> Sorry, I may need more explanation, what is the "static" missing you are referring?
>>
>> In your code cpufreq_opts_str[] is an automatic variable, which the compiler needs
>> to emit code for in order to instantiate it on the stack. This can be avoided if you
>> make the array a static variable, as then all construction occurs at build time.
>>
>>>> Plus I'm missing any arrangement for the array slots to remain in
>>>> sync with the corresponding enumerators. With that ...
>>>>
>>>
>>> Thanks for the detailed instructions, learned and I'll change it to
>>>         const char __initconst cpufreq_opts_str[][4] = { "xen", "hwp"
>>> }; And for in sync with the corresponding enumerators, maybe we shall add
>> comment here,
>>>         /* The order of cpufreq string literal must be in sync with
>>> the order in "enum cpufreq_xen_opt" */
>>
>> Instead of a comment I has rather hoping for some use of dedicated array slot
>> initializers.
> 
> Understood. I'll use "CPUFREQ_xxx" as array slot index.
>         static const char __initconst cpufreq_opts_str[][5] = {
>                 [CPUFREQ_none] = "none",
>                 [CPUFREQ_xen] = "xen",
>                 [CPUFREQ_hwp] = "hwp",
>         };

Provided the "none" entry doesn't cause any anomalies, this way.

Jan

