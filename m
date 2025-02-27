Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 227DCA476AB
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 08:35:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897834.1306462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnYQ4-0002f8-RK; Thu, 27 Feb 2025 07:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897834.1306462; Thu, 27 Feb 2025 07:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnYQ4-0002ca-Ob; Thu, 27 Feb 2025 07:34:56 +0000
Received: by outflank-mailman (input) for mailman id 897834;
 Thu, 27 Feb 2025 07:34:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKxr=VS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnYQ3-0002cU-H6
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 07:34:55 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56412020-f4dd-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 08:34:54 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4398ec2abc2so5520055e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 23:34:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba58713bsm47108655e9.34.2025.02.26.23.34.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 23:34:53 -0800 (PST)
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
X-Inumbo-ID: 56412020-f4dd-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740641694; x=1741246494; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4Yhcfv5GRCQQiGJeTtlRnAWU/UU5pFIXgD9kp9YURk8=;
        b=MzsWoaL3/T5WdrbrYYL55ft06Ohlg3UmpZTH7hC9/qMaaJ/n2moLlOdJvVCP247WTW
         zVjOcAmw7uTEoVrFrMeMeXgDAGKoH6Akm2//OHep3wbQdc0osftNM1RvUBLdH8Hz26F1
         g2CjdfB27KMEulcYDGvgty8nIJzYI/zs4H/M3FOHg7XO000rbt7qBMVZa5NyBiV36xgH
         j4q27bY/56zaeRlY9L2odMKvWFxLvLtQpvBgFOIWGhawrcH59nvYasj0eUTbE8JkmPct
         6ra1096ECQfFfAbvuCp/aYaVUibMkNiX7nqgEYkkFWmlbczDxRoVY9I+B9CnCGSPUVWi
         DD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740641694; x=1741246494;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Yhcfv5GRCQQiGJeTtlRnAWU/UU5pFIXgD9kp9YURk8=;
        b=avPyS4dKkqV/FAgexL4X4OGYLoTvMFOnuWcauCzygwiENIgUEtOW0dThhQh+M50c6a
         cS4BEajtMux6JGKH42OepQwVLZejQsYjSmBLQYvqymp6Vx6ba0rgJFsZSB0fQs1/Ig6t
         IiHdwKcTEdB3zQbjDenGpzPdtkxPCSx7ibv2DgRLPdv29i/xEmfXw2p2ZhGOzQwhPGbi
         Ahh+aQ4eSwmgMhu8NyNTiglsciwexgv5anSKawSZDKpBj5KylSrwYd8CmaRl1wEX00te
         YXuB9/uA16AqR+0Tm7Q66u27+eXg3+ria0QS0gBU6R8NMnelSmepvMLS7V/ap7/Rnpme
         rL4g==
X-Forwarded-Encrypted: i=1; AJvYcCXI/RUdAWIj32t9cqbQ7i1/Xxoya+L/WVg4Y7R282+/FSQcW/vAQ0TfYqsl6YA5ThIkF/KaWTFZOCg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyoWm6VN0jgrNY8qfqvCBUmilmcpW9KXcwWaNxE1GACl511AyJ
	FGJUK2vyBRNE2cVscHE8gQjOFUo8jea7uV5n9X1bK/EUtRDlBXB25tjH54zhfw==
X-Gm-Gg: ASbGncsQrUveK0YHsvG5KcqRmclYqQfctNwl++T0X8+EKr/Axebzjmogh9NbzAj/B6E
	5aKPI6R48/0EsVmu3FxGJfjDCa67XXr14VzfjNcNsT+Or7CjW5STKFRms+oIPZ5uY83gNn2b0Di
	Hj6A/Dw+/dI0KnPQyHQ8x64Klr1mLzXF4poGZ52UI7btGIl24aVNdseShX1QArYlOtywLrF+cXV
	0WUbQ0HeyLdrDQ6Cewprl5TwPPUSxLYuzwn7/w04RatW7fQHPvt8Jbuv/xXBy5U+d2Hr30I+UQy
	ILcGjLFkVzXR8mYqFCXIDDYTsoW10sf4v3R++f41OVpzYeYc+P9WcIxf9Cia6vIQbVpYqU0wP6U
	tEln0E0A+Mi0=
X-Google-Smtp-Source: AGHT+IGCIFF/A6rBZYQ+cRjVoZOCiBJzuwhAFHU3OVTKCu/xkvPzT2kXVKilbXWtCTjLB7qbw0Kpww==
X-Received: by 2002:a05:600c:3589:b0:439:6925:4d42 with SMTP id 5b1f17b1804b1-43ab8fd20bfmr54759305e9.5.1740641693955;
        Wed, 26 Feb 2025 23:34:53 -0800 (PST)
Message-ID: <b91400d0-351a-49fb-8e8a-1c588c59350d@suse.com>
Date: Thu, 27 Feb 2025 08:34:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] xen/x86: introduce a new amd cppc driver for
 cpufreq scaling
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Andryuk, Jason"
 <Jason.Andryuk@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-6-Penny.Zheng@amd.com>
 <0fe9e3b1-3d2c-4ddf-87c4-b0de2a586182@suse.com>
 <DM4PR12MB8451A44498B3B0E990DED17CE1CD2@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451A44498B3B0E990DED17CE1CD2@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.02.2025 07:53, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, February 12, 2025 12:46 AM
>>
>> On 06.02.2025 09:32, Penny Zheng wrote:
>>> --- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
>>> +++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
>>> +}
>>> +
>>> +static int cf_check amd_cppc_write_request(int cpu, uint8_t min_perf,
>>> +                                           uint8_t des_perf, uint8_t
>>> +max_perf) {
>>> +    struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
>>> +    uint64_t prev = data->req.raw;
>>> +
>>> +    data->req.min_perf = min_perf;
>>> +    data->req.max_perf = max_perf;
>>> +    data->req.des_perf = des_perf;
>>> +
>>> +    if ( prev == data->req.raw )
>>> +        return 0;
>>> +
>>> +    on_selected_cpus(cpumask_of(cpu), amd_cppc_write_request_msrs,
>>> + data, 1);
>>> +
>>> +    return data->err;
>>> +}
>>
>> ... in this function. Then the field would be written to (and the cacheline change
>> ownership) only in the error case.
>>
>> As to the function's parameters - why's there a plain int?
> 
> Are you asking why "int cpu" here?

Yes. I don't expect negative values are okay to be passed in? And variables
(incl parameters) which can't hold negative values want to be of an unsigned
type.

>>> + err:
>>> +    data->err = -EINVAL;
>>> +}
>>
>> At this point you may have set the enable bit already, which you can't undo.
>> What effect will this have on the system when the error path is taken here?
>> Especially if we then try to fall back to another driver?
> 
> On current code logic, when the error path is taken, amd-cppc cpufreq driver fails
> to initialize. And we will also not fall back to another driver.
> As we could register *only one* cpufreq driver. If amd-cppc is registered properly
> before, then legacy P-states will not get registered.
> In amd-cppc registration code:
> ```
> +int __init amd_cppc_register_driver(void)
> +{
> +    if ( !cpu_has_cppc )
> +        return -ENODEV;
> +
> +    return cpufreq_register_driver(&amd_cppc_cpufreq_driver);
> +}
> ```
> CPPC feature MSR gets checked before the registration, which is to check whether the
> hardware has CPPC msr support.

Yet still there's the possibility of a later error. If it's not an option to
gracefully handle such errors, I think you want to put in a code comment
explaining the situation and effect.

Jan

