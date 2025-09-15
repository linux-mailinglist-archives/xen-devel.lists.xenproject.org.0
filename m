Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0F6B57EB0
	for <lists+xen-devel@lfdr.de>; Mon, 15 Sep 2025 16:18:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124327.1466733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyA1j-000369-2j; Mon, 15 Sep 2025 14:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124327.1466733; Mon, 15 Sep 2025 14:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyA1i-00034e-W7; Mon, 15 Sep 2025 14:17:54 +0000
Received: by outflank-mailman (input) for mailman id 1124327;
 Mon, 15 Sep 2025 14:17:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ya+N=32=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uyA1h-00034W-Hd
 for xen-devel@lists.xenproject.org; Mon, 15 Sep 2025 14:17:53 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3e90db1-923e-11f0-9d13-b5c5bf9af7f9;
 Mon, 15 Sep 2025 16:17:52 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3c6abcfd142so2078556f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Sep 2025 07:17:52 -0700 (PDT)
Received: from [172.20.3.155] ([12.157.112.82])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54b03cf65csm8902679a12.16.2025.09.15.07.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Sep 2025 07:17:50 -0700 (PDT)
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
X-Inumbo-ID: c3e90db1-923e-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757945871; x=1758550671; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zgUeb6mKZu68/qZ3rmFRYrVD6wnpBm5BM45eW203xEk=;
        b=APxk2yHaS57snpjonrVOvMfSZBzxLSY81xTwzbZKJEZZ7X3801QA8xL+VrnBbDq7Pq
         be3AFheVCDtOVzGJwbfh/ThqJQXPPZT2pNBPL/0bceQhioIwkhz4eo0N0t4aqAlMKUdA
         PnpiufSC8Y0l/9W7pMbFEqsS7a0GkWrt+eojS2LKcC/S0HjvvN/De1O9F4cxGFR7VQfY
         Fp8RVcgg2UB64T7P9DepjqU+Yr1N62X3P2g2IJ6K7fwEeQcA/N+jjnj5KHensVq/NJBO
         vQf2Xms9N8WYUIQFy4FUJGx1nqzIVaoYF7vmsvimGfNsYCFJi7h9IYKS0Ab3p1ppIlI1
         EFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757945871; x=1758550671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zgUeb6mKZu68/qZ3rmFRYrVD6wnpBm5BM45eW203xEk=;
        b=N3BLSgJFmofj8DSMniRGCXg6b34uEvwM/v2NdimLIa6GAkxp9z18Hj4sjdSq8KBbGy
         zMsjcUBzho8RQYB5LE5P0O470+/ol/s7FgGpNKiWNEABhi2HjTcalyym8GVWE5yWlRpL
         wh+SGRa0LkXnOOZsD7bDG0/p+OxzElNj1ywZOPadriQ02ysFleAsIRKSuzFzinmXSxn1
         x/KKI2ocTR8Iob9J9Bu4VYonkCz8YXfEXCpZYGW8speGqPOLovEJSw3ywFkP1ywgXtyQ
         9beTrNY1fkQbw6+5SZ8Xl7kTGe5DJPYAR5Kvgt7iCiV/yqsbS4nvBvwtlAUxXr1Rj5W1
         2K5w==
X-Forwarded-Encrypted: i=1; AJvYcCXXJdWBUtaphgmIvZDMzNvaoS/L8fEy6x8AQg4p+ivFoTjYwHm5fEFGUV4qye83CVBhdIZBo2+LQiM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZHY/IFIZUVBu+g9M/PQqhcile+tVk7/RDZ9z6DwU/g3yXTmmg
	s26Eef8cvWsVmJgIeHOCmEOpewFa7+ei6L711pwBDsLGwX/dqt4DtAMinQ/Cgd74Vw==
X-Gm-Gg: ASbGncs1ZfbHQSjl2RXLDUawZVxyEJT7LyVyvzVCY8pDgoyNH4jz6smPbDE6xw4J14i
	q4gQVyPO9NiHV1Dmv+yNU+j9h1B5LunhoBxLTswx5jEzSJrE6l4hb09szyCWu/SudXojobZJ0uY
	S/qE27M82T31Un/RqQCotzp/BWiIySmkzTsgJxOQuuHOnUlIujLZEvs22pMqY9gM1hBzoYuCTUX
	dnh+LAv4FXaW9zW9jjtD+BkRksny8t0EzHi1hHK10f9i2dEusUN4GrVlS0wXXAI5N0CW1z8goVp
	HeZdYrkhge1AAiyPiotuotMB54b7STFXVi+t2s5qPEKCRJ69YC5fI7f1a12fG+VUTK5E+ZsBnsn
	gwPN6XB3dFNsQ+CrlSttOUI52xw/47TWKy5bffok7RA==
X-Google-Smtp-Source: AGHT+IEsKgnM5nqqUr0Nu/3YNyQyfCPieD57ZIq4FjErX4TjjlZTUUbkxYzPMiyPeultZ5LkkMfMIw==
X-Received: by 2002:a05:6000:2011:b0:3e8:ee5d:f31e with SMTP id ffacd0b85a97d-3e8ee5df6cemr6464675f8f.25.1757945871461;
        Mon, 15 Sep 2025 07:17:51 -0700 (PDT)
Message-ID: <492013c4-340a-4fee-81f1-348f9c646546@suse.com>
Date: Mon, 15 Sep 2025 16:17:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/8] xen/cpufreq: embed hwp into struct
 cpufreq_policy{}
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Andryuk, Jason" <Jason.Andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Huang, Ray" <Ray.Huang@amd.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250904063518.2097629-1-Penny.Zheng@amd.com>
 <20250904063518.2097629-2-Penny.Zheng@amd.com>
 <849f73f1-4004-4d17-a7a9-d755fb0f889b@suse.com>
 <DM4PR12MB8451C5D54EFEC8F6E0B76E43E103A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <a76aa498-512e-4797-b6d7-b7045cffa21b@suse.com>
 <DM4PR12MB84517C725A32419A97B9F5A1E115A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DM4PR12MB84517C725A32419A97B9F5A1E115A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.09.2025 05:49, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, September 8, 2025 6:02 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Andryuk, Jason <Jason.Andryuk@amd.com>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v9 1/8] xen/cpufreq: embed hwp into struct cpufreq_policy{}
>>
>> (re-adding the list)
>>
>> On 05.09.2025 06:58, Penny, Zheng wrote:
>>> [Public]
>>>
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Thursday, September 4, 2025 7:51 PM
>>>> To: Penny, Zheng <penny.zheng@amd.com>; Andryuk, Jason
>>>> <Jason.Andryuk@amd.com>
>>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Roger Pau Monné
>>>> <roger.pau@citrix.com>; xen-devel@lists.xenproject.org
>>>> Subject: Re: [PATCH v9 1/8] xen/cpufreq: embed hwp into struct
>>>> cpufreq_policy{}
>>>>
>>>> On 04.09.2025 08:35, Penny Zheng wrote:
>>>>> For cpus sharing one cpufreq domain, cpufreq_driver.init() is only
>>>>> invoked on the firstcpu, so current per-CPU hwp driver data struct
>>>>> hwp_drv_data{} actually fails to be allocated for cpus other than
>>>>> the first one. There is no need to make it per-CPU.
>>>>> We embed struct hwp_drv_data{} into struct cpufreq_policy{}, then
>>>>> cpus could share the hwp driver data allocated for the firstcpu,
>>>>> like the way they share struct cpufreq_policy{}. We also make it a
>>>>> union, with "hwp", and later "amd-cppc" as a sub-struct.
>>>>
>>>> And ACPI, as per my patch (which then will need re-basing).
>>>>
>>>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> Not quite, this really is Reported-by: as it's a bug you fix, and in
>>>> turn it also wants to gain a Fixes: tag. This also will need backporting.
>>>>
>>>> It would also have been nice if you had Cc-ed Jason right away,
>>>> seeing that this code was all written by him.
>>>>
>>>>> @@ -259,7 +258,7 @@ static int cf_check hwp_cpufreq_target(struct
>>>> cpufreq_policy *policy,
>>>>>                                         unsigned int relation)  {
>>>>>      unsigned int cpu = policy->cpu;
>>>>> -    struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
>>>>> +    struct hwp_drv_data *data = policy->u.hwp;
>>>>>      /* Zero everything to ensure reserved bits are zero... */
>>>>>      union hwp_request hwp_req = { .raw = 0 };
>>>>
>>>> Further down in this same function we have
>>>>
>>>>     on_selected_cpus(cpumask_of(cpu), hwp_write_request, policy, 1);
>>>>
>>>> That's similarly problematic when the CPU denoted by policy->cpu
>>>> isn't online anymore. (It's not quite clear whether all related
>>>> issues would want fixing together, or in multiple patches.)
>>>
>>> Checking the logic in cpufreq_del_cpu(), once any processor in the
>>> domain gets offline, the governor will stop.
>>
>> Yet with HWP and CPPC drivers being governor-less, how would that matter?
>>
>>> That is to say, only all processors in the domain are online, cpufreq driver could
>> still be effective. Which is also complies to the description in _PSD ACPI SPEC
>> for "Num Processors" [1]:
>>> ```
>>> The number of processors belonging to the domain for this logical processor’s
>> P-states. OSPM will not start performing power state transitions to a particular P-
>> state until this number of processors belonging to the same domain have been
>> detected and started.
>>> ```
>>> [1]
>>> https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control
>>> .html?highlight=cppc#pstatedependency-package-values
>>>
>>> I know that AMD CPPC is obeying the _PSD dependency relation too, even if
>> both CPPC Request register (ccd[15:0]_lthree0_core[7:0]_thread[1:0];
>> MSRC001_02B3) and CPPC Capability Register
>> (_ccd[15:0]_lthree0_core[7:0]_thread[1:0]; MSRC001_02B0) is Per-thread MSR.
>>> I don't have the hardware to test "sharing" logic. All my platform says
>> "HW_ALL" in _PSD.
>>
>> Aiui that's not mandated by the CPU spec, though. Plus HW_ALL still doesn't say
>> anything about the scope/size of each domain.
> 
> Sorry for the late reply.

No worries. From feedback from Stefano I was fearing much of a delay.

> I have discussed this with hardware team now, they said that we shall not expect any value other than "HW_ALL" from _PSD, if we have _CPC table, aka, CPPC enabled. Maybe except for some initial implementations, which may or may have not reached product release, this may still need a few time to look for conclusion
> And if it is HW_ALL, it means, in codes, we are invoking per-cpu cpufreq_driver.init, allocating per-cpu copufreq_policy, and etc. In HW_ALL, OSPM can make different state requests for processors in the domain, while hardware determines the resulting state for all processors in the domain.

Okay, so going back to v8 (and doing some unrelated adjustments there)
looks (to me) to be the best option. Eventually (I wouldn't insist on
this happening right away) we may want to actually reject non-HW_ALL
configurations when using this new driver.

Jan

