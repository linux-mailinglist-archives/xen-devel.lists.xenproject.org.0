Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7930FABD30C
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 11:16:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990562.1374508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHJ4k-0006R3-P4; Tue, 20 May 2025 09:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990562.1374508; Tue, 20 May 2025 09:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHJ4k-0006Pc-M6; Tue, 20 May 2025 09:15:54 +0000
Received: by outflank-mailman (input) for mailman id 990562;
 Tue, 20 May 2025 09:15:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHJ4j-0006PU-TB
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 09:15:53 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 073b52a4-355b-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 11:15:52 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-602039559d8so1756295a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 02:15:52 -0700 (PDT)
Received: from [10.10.4.69] (server.hotelpassage.eu. [88.146.207.194])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ac33d7asm6855871a12.52.2025.05.20.02.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 02:15:51 -0700 (PDT)
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
X-Inumbo-ID: 073b52a4-355b-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747732552; x=1748337352; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mjHeF0aeesIbq3TXLdkw9Qco1LOsm+HoVeaXU8yUpxU=;
        b=LQFNqdEKYUrSlDePK2i+b1RqkQ6E9PfUl/StWwfNyr/A6VdYpQoGZ89A3jjmdoFHL4
         bGcK/qplDwcSpIuB3HAzXImp8xd/tjWq7VhXt6LzhZjttv/IqpcEszrUh8NlYosqxEBo
         yqAuf7AEIcLs0ThSS/qPovcp+a09eYx7AFmUhu2zX0WSDlrGYtnSE1wAH3u1mtRNYZ2y
         GAVjBHmvchhVYb1iwWl9wH60pQG683696GQdtEIX1LTMcPZJ48WIBcQBt0RnQpFZK5VQ
         nI3OW0Ky58PTVkzC3WssqCe5fdcSo2bBx/MTgz4acVuv7LcHODUWvb7gqJufAfZcJAIC
         z3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747732552; x=1748337352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mjHeF0aeesIbq3TXLdkw9Qco1LOsm+HoVeaXU8yUpxU=;
        b=gU4zr8CO9rB5e3Z5sVWRCemOEga35Q+m0H9DVMAQ93EPwA/nJZ93QU7Mhezm7ZeJZi
         vWD3QlDkxy9H+8XRNaEB31V9uiJi2Kq1TBodCHL8F87XZH/xy6/FwelHnMK6rZdUWnXu
         JPvsSkoPaPjbyjZ48fRRjs6E3u8PtHnYC3gfPF878TVaEMs4/NoS1uE8UOAW6tL+kdCs
         UeQL1oqFBQT12+uvaQ5suBqdi31T6jAF0mNuBXmthC0TTSui9P5bUQU3cDfbwAhv3E4H
         TwjfZCka3z0DVpm6lbRj2rOBFkTDjqPaHAOHQi2RsPHSfQTvkygY+Pg5yn33XOeBzxNH
         E4sA==
X-Forwarded-Encrypted: i=1; AJvYcCVLdXMaaEqPAhqQngb7sWUoH3FMJdVR5G/YzVFoklV6sqyWxOM+hXYolatFMaSTrGGvBzJA0gZi7CA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxM2A18fSZGLlyVtJOb2IH1vcv8i/tt7M2444egBpjCDOdB/aow
	IwBKMDlrKHExv2d0Hi6FSXR4gISOKKcTxaaUKVnTcnS+vozYLVEsZjNR6wBowSY2OQ==
X-Gm-Gg: ASbGnctyZqOwpynUTsE5CUJNgFLgfm4LvfjynTuJbUhaMNE477Eo1DKjAghRwi7KGTT
	CguojT10HcAg2ECvUck/LMVI67wKu5jEgqj5TOhCcXUIe2sB3HHrGYcZgGs0hnyloo0N5+XB6mC
	92NA2OzaET+4z9uZL8UTSyZtnf1qMb/rm1PJ8DXJl4+UaLPFgYWwq16eWzVBidoIEPwf3as8ume
	f41EyuPLMQ6f8kEVhUu6XuXyhwqlou0QgicOgkpHg1xoRd3Nx7i2DQ3ty+rDbMj/hHpPgvcymtC
	JbKVyNbSWHGlbriT+nbk58zkUzFlctmPaTyqU+a3qirhAM7hYXtOxVpWXx8PvGIXesmhP//Q01c
	PjYuU1BSFB10zXwk=
X-Google-Smtp-Source: AGHT+IHbFE+DhWnGoq6b48voS5NZMg1MP+EOVA/4296k7JHOBjxfPewQ1ACcdEavuu7+7750RVCZhQ==
X-Received: by 2002:a05:6402:4304:b0:602:1d01:2869 with SMTP id 4fb4d7f45d1cf-6021d012c1cmr383709a12.28.1747732552243;
        Tue, 20 May 2025 02:15:52 -0700 (PDT)
Message-ID: <c3ab4e1d-83b8-47fc-a110-31d4620a156d@suse.com>
Date: Tue, 20 May 2025 11:15:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-6-Penny.Zheng@amd.com>
 <57a3b2c0-d57d-46e3-b248-0e243f715423@suse.com>
 <IA1PR12MB846717BD0A9E985C9E22AEFDE19CA@IA1PR12MB8467.namprd12.prod.outlook.com>
 <0f673a09-840c-4319-bec8-62fd920a6b84@suse.com>
 <DM4PR12MB8451084DB70D19B5284E1CB8E19FA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DM4PR12MB8451084DB70D19B5284E1CB8E19FA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.05.2025 10:28, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, May 19, 2025 9:19 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Anthony PERARD <anthony.perard@vates.tech>;
>> Orzel, Michal <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Roger Pau
>> Monné <roger.pau@citrix.com>; Stefano Stabellini <sstabellini@kernel.org>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v4 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen
>> cmdline
>>
>> On 19.05.2025 10:36, Penny, Zheng wrote:
>>> [Public]
>>>
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Tuesday, April 29, 2025 8:52 PM
>>>> To: Penny, Zheng <penny.zheng@amd.com>
>>>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>>>> <andrew.cooper3@citrix.com>; Anthony PERARD
>>>> <anthony.perard@vates.tech>; Orzel, Michal <Michal.Orzel@amd.com>;
>>>> Julien Grall <julien@xen.org>; Roger Pau Monné
>>>> <roger.pau@citrix.com>; Stefano Stabellini <sstabellini@kernel.org>;
>>>> xen- devel@lists.xenproject.org
>>>> Subject: Re: [PATCH v4 05/15] xen/x86: introduce "cpufreq=amd-cppc"
>>>> xen cmdline
>>>>
>>>> On 14.04.2025 09:40, Penny Zheng wrote:
>>>>> --- a/xen/include/acpi/cpufreq/processor_perf.h
>>>>> +++ b/xen/include/acpi/cpufreq/processor_perf.h
>>>>> @@ -5,6 +5,9 @@
>>>>>  #include <public/sysctl.h>
>>>>>  #include <xen/acpi.h>
>>>>>
>>>>> +/* ability bits */
>>>>> +#define XEN_PROCESSOR_PM_CPPC   8
>>>>
>>>> This needs correlating (at least via commentary, better by build-time
>>>> checking) with the other XEN_PROCESSOR_PM_* values. Otherwise
>> someone
>>>> adding a new #define in the public header may not (easily) notice a
>>>> possible conflict. With that in mind I also question whether 8 is
>>>> actually a good choice: That's the obvious next value to use in the
>>>> public interface. SIF_PM_MASK is 8 bits wide, so a sensible value to use here
>> would by e.g. 0x100.
>>>>
>>>
>>> I've added a public flag anchor "XEN_PROCESSOR_PM_PUBLIC_END" in
>> public header:
>>>          #define XEN_PROCESSOR_PM_PUBLIC_END
>> XEN_PROCESSOR_PM_TX
>>> and will do the following build-time checking:
>>>         BUILD_BUG_ON(XEN_PROCESSOR_PM_CPPC <=
>>> XEN_PROCESSOR_PM_PUBLIC_END);
>>
>> I don't really see why anything would need to be added to the public header (and we
>> really should strive to avoid unnecessary additions).
> 
> If I put such definition
> "#define XEN_PROCESSOR_PM_PUBLIC_END XEN_PROCESSOR_PM_TX"
> in internal header, I'm afraid it won't be updated if new ones added in the public in the future.
> Or any other suggestions to provide build-time checking?

Imo it's sufficient to check that the new #define doesn't overlap with
SIF_PM_MASK.

Jan

