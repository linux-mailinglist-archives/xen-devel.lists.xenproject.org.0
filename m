Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E0C9D5BEE
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 10:28:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841783.1257276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEPx8-0001tt-LP; Fri, 22 Nov 2024 09:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841783.1257276; Fri, 22 Nov 2024 09:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEPx8-0001rX-Ic; Fri, 22 Nov 2024 09:27:50 +0000
Received: by outflank-mailman (input) for mailman id 841783;
 Fri, 22 Nov 2024 09:27:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tEPx7-0001rP-Hr
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 09:27:49 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07e825ac-a8b4-11ef-99a3-01e77a169b0f;
 Fri, 22 Nov 2024 10:27:45 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4319399a411so17169925e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2024 01:27:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b45d4dd6sm88812465e9.24.2024.11.22.01.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Nov 2024 01:27:44 -0800 (PST)
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
X-Inumbo-ID: 07e825ac-a8b4-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmUiLCJoZWxvIjoibWFpbC13bTEteDMyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjA3ZTgyNWFjLWE4YjQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMjY3NjY1LjQxOTQzNSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732267665; x=1732872465; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3wTxd7G4B571njimj8AnWFbc8X0fFqJDoNtkHyMl0XU=;
        b=DsQmvgKFuR9+MNeEW6gZbZP3M8EqyayIt++1q0C1JqNyxBIieFMYIuK9pZ/0oVWPkw
         VpwYoGU8Il3JbK+/eo7ZAcRqEOUmFXtx/e7SO/qa3tKHMZP1OQ0XyXX23vrii94CVPxD
         nUlpdRsXtbl+p8kvlN7CVHTS3TB0w89iiRakf87xd5h5tmZE83u6Del7EmHVAwGnj02H
         DxISCNWSlsxmYEeCfB4cCocustPB3f1p4Z0hvJTc/h7tiopuAWO8EnPhRD9Obm892y4g
         tviJMMN1WxxlhApViPWnkGvN7xKwX4Tlkm0ZPWih3JUosfzW/0SQbCzSee6tTj9w3RLI
         j9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732267665; x=1732872465;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wTxd7G4B571njimj8AnWFbc8X0fFqJDoNtkHyMl0XU=;
        b=XnGdKWGbI7yycau0VZ2flL4jEI71vN2fm7Xu0O0o8kz7xZ9o+HH/6MMsymTa+eHoJn
         wtxRdEaoYYI8VsG/TtJImJugZUdD2QF88eHzGnC2NXGUEDbhmtRfIgBQybEzgaMSVy3p
         C8f3y3GxlfDUopP8IUxKN6zdWJNCibK96kuILdfbcEGYphHDNLR0Ke6vZAIfZgd5uQ5V
         tUPjOWJa4W5F4UDPktYTXwOIS/84rIriQS9OtsNPun+MscOnt7ugsVY4tJGpPCjZzxm+
         bCR16Zza/eX2hKXjw5DVUyVJyXUqy1h+bPl8O5G6ARWDpldaQAXAWnjtOrnwcy3FdqBy
         eB4A==
X-Forwarded-Encrypted: i=1; AJvYcCU/Vcu5lCOz7rJH6ex0+sDBuoKSaVpcHZ1QieRh/REz2+HPkWEK2CMmcvf+Om4KEuBiKusPP4j4l7U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxcqYgOXI2UklMocmXLcv39/HrrDhjrSky95pFwtLYGUgirVKa0
	z6mpwuyQ6V+gmVeh7BNlwFqTcAfyjRm3Le+TdoPMRvgxmqEgMf2dwG3q79BrPQ==
X-Gm-Gg: ASbGncthO2jKjiijWlR8LVPQoCuwialyNp4aSU1JskdzOBJPte5VgL4qmBKloT00esH
	CAE8j0NXM0EWRA6i5E+q06CxQr7A7dApL+zxIIYGTGgRiJ0DVowY1/QG9Z25Rq7FrijZhLqg8r7
	aE+1ABAuOI1Cv6F2wAYyQOdv350a0tzB43ZoqDu7AuBbcslo/WwY2kXbIV9xJsW8bpstRPesNI8
	nhd6/88K6vqOZfHxlDEMqaQUHzi2czV4/a8gZhoTL7qkLwGuf57zvnogjnKy6I2CgqSwpwaGK1r
	Kigfu1cgNsTPwhDxj0giDhatt2zbAbPZ/T0=
X-Google-Smtp-Source: AGHT+IFVZPM+4i89oByI1nwfHU7rOkKw99q2oYaI6JlT2ELLldopzTYxsgHtkYvwK/70lCbJHipjbA==
X-Received: by 2002:a05:600c:4f4e:b0:431:12a8:7f1a with SMTP id 5b1f17b1804b1-433ce426837mr19715075e9.16.1732267664733;
        Fri, 22 Nov 2024 01:27:44 -0800 (PST)
Message-ID: <f6439d68-0f10-4e7a-9135-73f7036aeeae@suse.com>
Date: Fri, 22 Nov 2024 10:27:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/irq: fix calculation of max PV dom0 pIRQs
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241120113555.38146-1-roger.pau@citrix.com>
 <20241120113555.38146-2-roger.pau@citrix.com>
 <b849f46d-501a-4083-aecd-fdf0c4319eda@suse.com> <Zz8Tugu22NPzAQUo@macbook>
 <f0c0cdca-e6a8-47c9-934a-85a91609e9e7@suse.com> <Z0A6Zz06bg3l0wju@macbook>
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
In-Reply-To: <Z0A6Zz06bg3l0wju@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.11.2024 09:01, Roger Pau Monné wrote:
> On Thu, Nov 21, 2024 at 12:39:06PM +0100, Jan Beulich wrote:
>> On 21.11.2024 12:04, Roger Pau Monné wrote:
>>> On Thu, Nov 21, 2024 at 11:49:44AM +0100, Jan Beulich wrote:
>>>> On 20.11.2024 12:35, Roger Pau Monne wrote:
>>>>> The current calculation of PV dom0 pIRQs uses:
>>>>>
>>>>> n = min(fls(num_present_cpus()), dom0_max_vcpus());
>>>>>
>>>>> The usage of fls() is wrong, as num_present_cpus() already returns the number
>>>>> of present CPUs, not the bitmap mask of CPUs.
>>>>
>>>> Hmm. Perhaps that use of fls() should have been accompanied by a comment, but
>>>> I think it might have been put there intentionally, to avoid linear growth.
>>>> Which isn't to say that I mind the adjustment, especially now that we don't
>>>> use any clustered modes anymore for I/O interrupts. I'm merely questioning
>>>> the Fixes: tag, and with that whether / how far to backport.
>>>
>>> Hm, sorry I've assumed the fls() was a typo.  It seems wrong to cap
>>> dom0 vCPUs with the fls of the present CPUs number.  For consistency,
>>> if the intention was to use fls to limit growth, I would have expected
>>> to also be applied to the dom0 number of vCPUs.
>>
>> FTR: My vague recollection (it has been nearly 10 years) is that I first had
>> it there, too. Until I realized that it hardly ever would have any effect,
>> because of the min(). And for Dom0-s with extremely few vCPU-s it seemed
>> reasonable to not apply that cap there.
> 
> I don't have a strong opinion regarding the fixes tag, but would like
> to get this sorted as soon as possible.  If you prefer just drop the
> fixes tag.  I think this wants backporting to all supported releases,
> because it's an issue XenServer has hit on real servers when dom0 is
> sized to use 16 vCPUs at most.

In which case yes, I guess we want to keep the Fixes:.

Jan

