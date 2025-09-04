Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18692B4394A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 12:55:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109840.1459250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu7c3-0000Yw-PG; Thu, 04 Sep 2025 10:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109840.1459250; Thu, 04 Sep 2025 10:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu7c3-0000X6-M8; Thu, 04 Sep 2025 10:54:43 +0000
Received: by outflank-mailman (input) for mailman id 1109840;
 Thu, 04 Sep 2025 10:54:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTa/=3P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uu7c1-0000X0-Sk
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 10:54:41 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e789bed-897d-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 12:54:40 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b046f6fb2a9so133838566b.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Sep 2025 03:54:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b04129eccbfsm1192486066b.7.2025.09.04.03.54.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 03:54:39 -0700 (PDT)
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
X-Inumbo-ID: 8e789bed-897d-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756983280; x=1757588080; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nndLkPmvnacWgHdzXqA87PRQh0VWmzTHUS3W4634x2I=;
        b=G0Wp16q/gb8bvzOcXZ6oVdHTFsAqbgUKiqx+u0UMKeAMF+gWMB/iaj0iXj09FRmAjK
         YSBzS3Buzk77V2w+T9X2dx6kAog1/L4arCitdvr9xhDoJ9ynFoYiD+YEO2B0CPVNAU6J
         yT039aZvzGHsv8Ty8PhstWwk4SdzZrx/g6RHdcFzZqidTDSK5WyCx82JetqG9jYBZsNH
         SLpLbzoq1lznXAD8rdAGPgmxOgAKgF2aLz1f1J0zqdIID5lZRAbr1KkFU6N8FiHRiWsA
         AyNWbJAtpXfG8IhIB6UV5Rxsyi7lJeDmqjBZKjUc4XhfJ1rBAtVQKdzyoZmdWTUbS8z3
         bsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756983280; x=1757588080;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nndLkPmvnacWgHdzXqA87PRQh0VWmzTHUS3W4634x2I=;
        b=BgGKr2ouJKRcKq+ZNmB4J3SFRfvVzPjRXC4S+wJgi29m831HeI3neoGHxVA1smfzJg
         ItM1u+D/t0m4EdFAORWqDfcOvIxJCwPBrkeOYCi0JGYhrv0n79ER8MiGIDZJH6mlt2HY
         DP9h1F39GuUKmSD9vZQy0+3NWfulfm56SbcWzQ/FVlywI2rdjFCE5pTFngWTHbcEk39J
         UQbW5NE2mR44poLuG8H2UvliO8q6D9rXsRuQ7TLWoqUQxn23uqcZf2dz+eQvdTkbL9BR
         hflY0O2rzdmYm69lg5hyfu0MAs//jr1s3HGYUOsAekqrdcTBr6rBljpe9PWp472tRoVE
         cyNw==
X-Gm-Message-State: AOJu0YxGK1FglRPGTAce7XXIAjnik8h65ufSo4YElqHq47KIZYGs+eDO
	GpaWIwF+aJV/3vbLF8be/Zhq3ZNdO1cw7qQxlpPOycfQxvejF7z3pSHCShNsu/eP9w==
X-Gm-Gg: ASbGncttWO9BQ7sbCuA0vH0pZQttm02YIM14lN/asi2Uub2BEPLp0vbVVcae/YdXizu
	ecKLiUecPIjfs5d/+28PJceUur4z0mLvOmRzWOBboNwAKh9Q9Q9CTfPuDiULXfzNvSsPAQVSINE
	kPep86/DLwCDYeiDU/jgGaY9gae/B3TihtvrEZVybrFOtX/sOty6gSazVncr7WlTICo2Uch2W37
	S/d4Sdxir/7xQFPuhj5YuNxe3bSPs47YDZ+rI0X1BlQNi7nLcAiBc62AsV7v0FigfunEzy4VspP
	HjWHnQTuFY8QSqpu0qq8MvQN/noO3Q5jHhsqs2em2TD634p3ewye7T3s8jEhJw+vX69sEXc1znP
	QQGo6+swtMbLvGH7E7LGMmdrDBpyt00Ft/Tw2ddVYrglGC4uhFW1UTb3O79JZgf/7hr82CJrmWX
	AP8LIRP/8=
X-Google-Smtp-Source: AGHT+IFYlWQU3xUc1hgux9vt256dVEJU2Kwk9qhbad5o4Cvlgzth0bOEOavEdZorJDN7KA86XCWvBg==
X-Received: by 2002:a17:906:ef0e:b0:ae3:a78d:a08a with SMTP id a640c23a62f3a-b01d8a2fcd6mr1363538966b.6.1756983279698;
        Thu, 04 Sep 2025 03:54:39 -0700 (PDT)
Message-ID: <3344c30d-99b7-4b0b-a86e-25063f925638@suse.com>
Date: Thu, 4 Sep 2025 12:54:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging-4.18 | 51190865
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <68b862c0518f3_2cdd2ac12775d@gitlab-sidekiq-catchall-v2-5996545549-kk9d8.mail>
 <8319cf73-52f9-48e2-a571-452da53c36d9@suse.com> <aLhm5OMSUjGvQYAW@mail-itl>
 <0fb22103-c928-40ff-8be9-bf8d3914f028@suse.com>
 <15650736-585b-4b5c-b2d2-53f4670d8530@suse.com> <aLltQFCZyz_JQzqB@mail-itl>
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
In-Reply-To: <aLltQFCZyz_JQzqB@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.09.2025 12:43, Marek Marczykowski wrote:
> On Thu, Sep 04, 2025 at 08:27:14AM +0200, Jan Beulich wrote:
>> On 04.09.2025 07:58, Jan Beulich wrote:
>>> On 03.09.2025 18:03, Marek Marczykowski wrote:
>>>> On Wed, Sep 03, 2025 at 05:58:32PM +0200, Jan Beulich wrote:
>>>>> On 03.09.2025 17:46, GitLab wrote:
>>>>>>
>>>>>>
>>>>>> Pipeline #2019390073 has failed!
>>>>>>
>>>>>> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
>>>>>> Branch: staging-4.18 ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging-4.18 )
>>>>>>
>>>>>> Commit: 51190865 ( https://gitlab.com/xen-project/hardware/xen/-/commit/51190865a4918c443c310c0478247d5f9caa5dad )
>>>>>> Commit Message: x86/suspend: unconditionally raise a timer soft...
>>>>>> Commit Author: Roger Pau Monné
>>>>>> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
>>>>>>
>>>>>>
>>>>>> Pipeline #2019390073 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/2019390073 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
>>>>>> had 5 failed jobs.
>>>>>>
>>>>>> Job #11230955404 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/11230955404/raw )
>>>>>>
>>>>>> Stage: test
>>>>>> Name: adl-suspend-x86-64-gcc-debug
>>>>>> Job #11230955410 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/11230955410/raw )
>>>>>>
>>>>>> Stage: test
>>>>>> Name: adl-pci-pv-x86-64-gcc-debug
>>>>>> Job #11230955417 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/11230955417/raw )
>>>>>>
>>>>>> Stage: test
>>>>>> Name: adl-pci-hvm-x86-64-gcc-debug
>>>>>> Job #11233274365 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/11233274365/raw )
>>>>>>
>>>>>> Stage: test
>>>>>> Name: adl-smoke-x86-64-gcc-debug
>>>>>> Job #11233405609 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/11233405609/raw )
>>>>>>
>>>>>> Stage: test
>>>>>> Name: adl-smoke-x86-64-dom0pvh-gcc-debug
>>>>>
>>>>> While the same tests are fine for 4.19 and 4.20, all five show rubbish in the log,
>>>>> and then fail. No idea what's going on.
>>>>
>>>> The log says "baudrate is    : 115200", but looking at the state after
>>>> the test I see 9600. No idea if that was simply switched back after, or
>>>> setting to 115200 didn't work. Anyway I suggest to restart (now that
>>>> other jobs completed). I set it manually to 115200 now too (not sure if
>>>> that will remain there...).
>>>
>>> The rubbish in the output looks to have gone away, but the adl-* tests fail
>>> as before. I'm retrying two of them another time, but with little hope.
>>
>> As opposed to 4.19, where we have this
>>
>> minimal cmds is: no
>> !! STDIN is not a TTY !! Continue anyway...
>> Type [C-a] [C-h] to see available commands
>> Terminal ready
>>  Xen 4.19.4-pre
>> (XEN) [00000043ae35c0c9] Xen version 4.19.4-pre (root@) (gcc (Alpine 12.2.1_git20220924-r10) 12.2.1 20220924) debug=y Wed Sep  3 12:15:19 UTC 2025
>>
>> for 4.18 things (consistently across the tests) look like this
>>
>> minimal cmds is: no
>> !! STDIN is not a TTY !! Continue anyway...
>> Type [C-a] [C-h] to see available commands
>> Terminal ready
>> Accessing Gembird #0 USB device 038
>> Switched outlet 2 on
>> Setting boot mode for 2 to gitlabci... done
>> + trap 'ssh control@thor.testnet poweroff; : > /tmp/console-stdin' EXIT
>> + '[' -n  ]
>> + set +x
>>  Xen 4.18.5
>> (XEN) Xen version 4.18.5 (root@) (gcc (Alpine 12.2.1_git20220924-r10) 12.2.1 20220924) debug=y Wed Sep  3 12:27:30 UTC 2025
>>
>> For 4.19 there's no visible delay between "Terminal ready" and the first Xen
>> message, whereas for 4.18 there is an approx 1:30min (±10s) delay after the
>> "+ set +x". That's a lot when the timeout is 2min.
> 
> That makes no sense to me, at this point there isn't really much
> Xen-specific code running yet, so there shouldn't be any difference
> between branches. I think this is only different presentation of the
> output, because 4.18 doesn't use expect in that script yet.

Except that one can observe that 1:30min delay when watching the job progressing.

> As for the actual reason, at least one job ends at "Waiting for uevents
> to be processed", which sounds like USB devices enumeration. Just in
> case I reset that emulated USB now.

Others (e.g. the suspend job) timed out elsewhere, though.

Jan

