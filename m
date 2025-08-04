Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A71D0B19C50
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 09:17:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068810.1432669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uipRo-0005Wx-IG; Mon, 04 Aug 2025 07:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068810.1432669; Mon, 04 Aug 2025 07:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uipRo-0005VE-F2; Mon, 04 Aug 2025 07:17:28 +0000
Received: by outflank-mailman (input) for mailman id 1068810;
 Mon, 04 Aug 2025 07:17:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uipRm-0005V8-GX
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 07:17:26 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11b64a24-7103-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 09:17:24 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-61530559887so5162760a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 00:17:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8fe7a15sm6234192a12.40.2025.08.04.00.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 00:17:23 -0700 (PDT)
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
X-Inumbo-ID: 11b64a24-7103-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754291844; x=1754896644; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d8Zzm6iRwAjQSFzHFCHsjlipTKMqH5iUjf4H5vvmiS4=;
        b=N2DqGmT0iMJqU9tK0ZqicbZ1I+jVl44l1CLacw+Y5oxxRcB/PM2bXZ2MpLmYb9+Pwd
         lUH7NIxKRIAbQy06a+aETxDz6N82Y2/1gBB1PR5xkWUpSbRlYtdbKtzf/d6cDgdggctw
         yr0LjVLkkkgsVdY8UxyNz/UZdjz3rJEuux1hXkc6tUaDEq9w+DqZP0wj2HT73fHrHGrf
         rd8xgDvGh0pSREjr2ptJv03BXpmxKJzMKDDGP6z/bjXV8v+PWgm/nhCuzYA01TURkoJz
         1rTQ8MQoJMJSv6QLvvIJW0YJI0l2daOrj/ZN6gK5Tk8dVWHfZQnuFHYwWorG0PgRVj/6
         5Bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754291844; x=1754896644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8Zzm6iRwAjQSFzHFCHsjlipTKMqH5iUjf4H5vvmiS4=;
        b=Q7WGl9NZgn7F/8lycFXhzEO47NF9od/gfMHyAXglQ/wtdZ1Y6LeGKP+lW93IkKVkRx
         3SnMBY1kNDi/r7UywvpCY30gkJXAwPxmTW1nNJvt6ZGrA/6YzNeoxR+GSpCd+FOrOGE3
         PEjJd5j/ZAxeLeF2i8FbWRqJb0bof5jQyi2YQCAVYqmo6cjHf/gDZ23Qm4NFL6phGKHv
         TJmlJKwGECriSJLdIy6lYmDaj0xG/xs40vhJsctyfOYsibk8CJZssKF05B/E9tTROK8q
         Wjt7Dg0fitqjCpFmS0nhwoy2/RkTyW8xhOcqInyegPYO7G0h6H5jWDC02DPXsHJ1Tn+e
         HC4w==
X-Forwarded-Encrypted: i=1; AJvYcCXWEh3pBNl3bcBvSwdzZFle4+Wz0IMGsnDPFb9lO9mikS7nqKPWNbB7Nyv36s7OPCeEZy64B2sJvMY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSqu1N6cS/EwnqB/ognrvmSy6dT1zbS2B/pmDvwxs5E/hCNh2c
	4KtHoDHBFYl9mIuKErP2ZxUxIrH/loJXsYtQF+NA9fZk+pcByk/EDBGRRJb7VOVobA==
X-Gm-Gg: ASbGncsBnDkyRYyxNAFvkzXmdlawLQZ+EMWqQvBG7TTDwgOL0LIRkSFtsekZqPAdHLr
	hZ1F3H2V8x2sKfszmElPjz0xdu93IC2yxHdJe3kJQvWQwqAeymkWZyVaBJpHmNIZz1OugV4O2fd
	pfwcQjJA4LBKpmYY+ExzWXCYD1XGvCP6frFSM6YT4Zm1bFdD7VWCx6uuOCa5L4mDk2E0x/ono0I
	8YmLG1ApJdVQPGklHRUAsgH2OYxxpxNO389J8lkzZUK+4EsuVL6lLiSvsoOzK24Fyz2+ZofYxXs
	y6MDELWsPiyDO5peKGdhrpEXEIHb/Uwrim0IaDcaoOiRGKeeH1qEDmNad1pFiEeidl5icZCbnk0
	qnrO0bqOhcsg+QnXoaNHjebYse9ZTzId1K5i5YLS1RJjRM30/CEzC/JOgWQn9XyXz39bFF+kNn+
	tVhZTgMOo=
X-Google-Smtp-Source: AGHT+IGSL4cQ0r4D3kSCGd44cgH89CnGRAY2hKFh9VG5sjWgrZDjENQDywn0UuFrW4aIlt8Yiv9p4A==
X-Received: by 2002:a05:6402:3593:b0:60e:404:a931 with SMTP id 4fb4d7f45d1cf-615e6f015fcmr7200583a12.15.1754291844020;
        Mon, 04 Aug 2025 00:17:24 -0700 (PDT)
Message-ID: <9688eba1-d6f3-4d7b-8d4a-21f28ab152b1@suse.com>
Date: Mon, 4 Aug 2025 09:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/19] xen/cpufreq: refactor cmdline "cpufreq=xxx"
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-6-Penny.Zheng@amd.com>
 <e9bc1036-2ab4-4e9a-9d43-8e11d4f67776@suse.com>
 <DM4PR12MB8451C4DA5340306CAB9E6BE5E123A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <DM4PR12MB8451C4DA5340306CAB9E6BE5E123A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.08.2025 08:04, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, July 16, 2025 11:01 PM
>>
>> On 11.07.2025 05:50, Penny Zheng wrote:
>>> --- a/xen/drivers/cpufreq/cpufreq.c
>>> +++ b/xen/drivers/cpufreq/cpufreq.c
>>> @@ -64,12 +64,53 @@ LIST_HEAD_READ_MOSTLY(cpufreq_governor_list);
>>>  /* set xen as default cpufreq */
>>>  enum cpufreq_controller cpufreq_controller = FREQCTL_xen;
>>>
>>> -enum cpufreq_xen_opt __initdata cpufreq_xen_opts[2] = { CPUFREQ_xen,
>>> -                                                        CPUFREQ_none };
>>> +enum cpufreq_xen_opt __initdata cpufreq_xen_opts[NR_CPUFREQ_OPTS] = {
>>> +    CPUFREQ_xen,
>>> +    CPUFREQ_none
>>> +};
>>>  unsigned int __initdata cpufreq_xen_cnt = 1;
>>
>> Given this, isn't the array index 1 initializer quite pointless above? Or else, if you
>> really mean to explicitly fill all slots with CPUFREQ_none (despite that deliberately
>> having numeric value 0), why not
>> "[1 ... NR_CPUFREQ_OPTS - 1] = CPUFREQ_none" (or using ARRAY_SIZE(), as
>> per below)?
>>
>>>  static int __init cpufreq_cmdline_parse(const char *s, const char
>>> *e);
>>>
>>> +static bool __init cpufreq_opts_contain(enum cpufreq_xen_opt option)
>>> +{
>>> +    unsigned int count = cpufreq_xen_cnt;
>>> +
>>> +    while ( count-- )
>>> +    {
>>> +        if ( cpufreq_xen_opts[count] == option )
>>> +            return true;
>>> +    }
>>> +
>>> +    return false;
>>> +}
>>> +
>>> +static int __init handle_cpufreq_cmdline(enum cpufreq_xen_opt option)
>>> +{
>>> +    int ret = 0;
>>> +
>>> +    if ( cpufreq_opts_contain(option) )
>>> +        return 0;
>>> +
>>> +    cpufreq_controller = FREQCTL_xen;
>>> +    ASSERT(cpufreq_xen_cnt < NR_CPUFREQ_OPTS);
>>
>> This would better use ARRAY_SIZE(), at which point NR_CPUFREQ_OPTS can go
>> away again. What's worse, though, is that on release builds ...
> 
> I found that we already have array index check in setup_cpufreq_option(), before calling handle_cpufreq_cmdline()
> Then maybe there is no need to do it again here

Well, you will still need to deal with the release build aspect, as per your
earlier reply. At which point you can easily place an ASSERT_UNREACHABLE()
there as well.

Jan

