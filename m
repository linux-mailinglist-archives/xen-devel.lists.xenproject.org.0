Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4A4A38045
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 11:34:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890223.1299228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjySE-00063K-8M; Mon, 17 Feb 2025 10:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890223.1299228; Mon, 17 Feb 2025 10:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjySE-00060o-4k; Mon, 17 Feb 2025 10:34:22 +0000
Received: by outflank-mailman (input) for mailman id 890223;
 Mon, 17 Feb 2025 10:34:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tjySB-0005zN-R5
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 10:34:19 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd5f9412-ed1a-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 11:34:17 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aaedd529ba1so494056166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 02:34:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece2880fasm6982099a12.78.2025.02.17.02.34.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 02:34:16 -0800 (PST)
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
X-Inumbo-ID: bd5f9412-ed1a-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739788457; x=1740393257; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0n25mWO5jBj2QD65+o8vD3wBpXAZTNgg2wmzbRQ4L/w=;
        b=UhX/0rg/zbZZsYDKgDnSLQMBHS1x6oFLJ/GyApZNzAzUZCfrMkvds4le0+ps0CH1cT
         8X8eTKlSaz4WnOg5GDHrJdDYnJ5SXsYLOmmWOMdRC0hWnk+nCJta0rIbsH/VJ3KdGjew
         3u+QxHWoHcFClLrC9kCPqAIxPyM6O9OnusQqA/BV4dAA3DKRoCXqiKLKTzpdIRN4gj3I
         xuRBtURFIP16k2aZet/CgTueEk6VHqqsnc32TYi+asr5TQF14gyTYjFwIyYad7WmTlE5
         ThTDOwgND/OvNa+oM9ktg2AQPfgkazPvluqaVJM/1rwbDyGkzO9OpYXWZCoGCPGlfFzz
         IBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788457; x=1740393257;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0n25mWO5jBj2QD65+o8vD3wBpXAZTNgg2wmzbRQ4L/w=;
        b=wsAvdsHXVllFhz+LdEERBWAWEt0+jTM/S3v24fVkf/lFG+sYStPC4EqmwUBDMF/u+m
         HKDxzBtS9Cd3oOlJ3VshSzJ5Vhufe7KeoxJRJrCU3aRGi32OyV4BALxVPn8rQPE5oKzt
         gtF3NATC/yha7Nwg5FZqNx+RES22DDK6KJMbWIXhP4Embxo2rxqT1IjbFxMwP4z8GUGv
         zoZBv0g8qVmvaJ9XiKzaCZcR1pWL9DcWPlq7wH3c2hGO6yk/2VW+JqHzqw+CJC+ggdtk
         WdpnAvh8cAVWEUl0A4O2ANpCtWslSULEol1L67JWjRU6bw+GFOH4xF9a+/C2b+CDHNON
         1nkA==
X-Forwarded-Encrypted: i=1; AJvYcCUqJ95t6N5MFcuYVv0HwwTz0895Sgh/oO0tUk0o+sL4bktRrwXkax2LwQDnrLpKrwzFU+DWOEe/eoQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzALlUO7tfnApAd6GVv4CkgzpaehZNyYvdsXyy43toW/rJ5X5ND
	ISGhdFFyKu2ajC4EEIh+Jli83i1QIrIBqUBnRCqMrAQE/bqQfqA0Mr5hIjR7FA==
X-Gm-Gg: ASbGnctw1JXDIBzDM16wFRgYYp6WzCuURCZ/MdrLMmKh6Px86zU/oYLtmQLzc48e3+i
	QjmN1bd7jdBFHeo27IVQf81MR6HppMZYDkkeetiMeknVCG9kjAadTH5egEEN8OX+zZZxj23/UPD
	I/cvNLKn6YwhX0a2hdiG7AstHL4sbsCskGR0l6h7NMDbF1qAHeoR6BYTT623v0EyL3zeCfUZ8Nc
	8Mr4KYxd9es17PScERjlBYi5nACBJXamImrsol3r/+E9EZSHiVw4iDWgrXIdImQxn8arcxZglob
	UdY6Bzlppvi2h7MW+ZkunVsGHomxszBqRqTVVEIVXEPxgipuerbepQ0uhqKNGj3FtVnwXp8aagC
	u
X-Google-Smtp-Source: AGHT+IHyzQSU48k7p9kO1Wc+bXjzhLyAVUxMMGMGDUYvyzF5Mju/S9wZfy5JZ1AJbtvYM+dx7S8a/A==
X-Received: by 2002:a05:6402:234f:b0:5de:a6a8:5ec6 with SMTP id 4fb4d7f45d1cf-5e03602e275mr26442258a12.10.1739788456902;
        Mon, 17 Feb 2025 02:34:16 -0800 (PST)
Message-ID: <f9dccb9b-24e9-416f-bfd7-787b8df4b617@suse.com>
Date: Mon, 17 Feb 2025 11:34:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Andryuk, Jason"
 <Jason.Andryuk@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-4-Penny.Zheng@amd.com>
 <ed8af131-7f1b-47db-8d28-553977a4f3cd@suse.com>
 <DM4PR12MB8451A3D08427CDD412AA650DE1FB2@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451A3D08427CDD412AA650DE1FB2@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.02.2025 11:17, Penny, Zheng wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, February 11, 2025 8:09 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andryuk, Jason
>> <Jason.Andryuk@amd.com>; Andrew Cooper <andrew.cooper3@citrix.com>;
>> Anthony PERARD <anthony.perard@vates.tech>; Orzel, Michal
>> <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Roger Pau Monné
>> <roger.pau@citrix.com>; Stefano Stabellini <sstabellini@kernel.org>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v2 03/11] xen/x86: introduce "cpufreq=amd-cppc" xen cmdline
>>
>> On 06.02.2025 09:32, Penny Zheng wrote:
>>> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
>>> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
>>> @@ -148,6 +148,9 @@ static int __init cf_check cpufreq_driver_init(void)
>>>                  case CPUFREQ_none:
>>>                      ret = 0;
>>>                      break;
>>> +                default:
>>> +                    printk(XENLOG_WARNING "Unsupported cpufreq driver
>>> + for vendor Intel\n");
>>
>> Same here. The string along overruning line length is fine. But this cal then still be
>> wrapped as
>>
>>                     printk(XENLOG_WARNING
>>                            "Unsupported cpufreq driver for vendor Intel\n");
>>
>> to respect the line length limit as much as possible.
>>
>>> @@ -131,6 +131,15 @@ static int __init cf_check setup_cpufreq_option(const
>> char *str)
>>>              if ( arg[0] && arg[1] )
>>>                  ret = hwp_cmdline_parse(arg + 1, end);
>>>          }
>>> +        else if ( choice < 0 && !cmdline_strcmp(str, "amd-cppc") )
>>> +        {
>>> +            xen_processor_pmbits |= XEN_PROCESSOR_PM_CPPC;
>>> +            cpufreq_controller = FREQCTL_xen;
>>> +            cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_amd_cppc;
>>
>> While apparently again a pre-existing problem, the risk of array overrun will become
>> more manifest with this addition: People may plausibly want to pass a universal
>> option to Xen on all their instances:
>> "cpufreq=hwp,amd-cppc,xen". I think this wants taking care of in a prereq patch, i.e.
>> before you further extend it. Here you will then further want to bump
>> cpufreq_xen_opts[]'es dimension, to account for the now sensible three-fold option.
>>
> 
> Correct me if I'm wrong, We are missing dealing the scenario which looks like the following:
> "cpufreq=amd-cppc,hwp,verbose".

Not so much this one (can it even overflow). It's "cpufreq=amd-cppc,hwp,xen"
that I'm concerned about (or, prior to your change something redundant like
"cpufreq=hwp,hwp,xen").

> `verbose` is an overrun flag when parsing amd-cppc.
> I've written the following fix:
> ```
> diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
> index 860ae32c8a..0fe633d4bc 100644
> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -71,6 +71,22 @@ unsigned int __initdata cpufreq_xen_cnt = 1;
> 
>  static int __init cpufreq_cmdline_parse(const char *s, const char *e);
> 
> +static int __initdata nr_cpufreq_avail_opts = 3;
> +static const char * __initdata cpufreq_avail_opts[nr_cpufreq_avail_opts] = { "xen", "hwp", "amd-cppc" };

Does this even build? If it does, it likely won't be what you mean. You
want a constant array dimension (which could actually be omitted, given
the initializer), as ...

> +static void __init cpufreq_cmdline_trim(const char *s)
> +{
> +    unsigned int i = 0;
> +
> +    do
> +    {
> +        if ( strncmp(s, cpufreq_avail_opts[i], strlen(cpufreq_avail_opts[i] - 1) == 0 )
> +            return false;
> +    } while ( ++i < nr_cpufreq_avail_opts )

... you can use ARRAY_SIZE() here. (Style note: "do {" goes on a single line.)

> +
> +    return true;
> +}
> +
>  static int __init cf_check setup_cpufreq_option(const char *str)
>  {
>      const char *arg = strpbrk(str, ",:;");
> @@ -118,7 +134,7 @@ static int __init cf_check setup_cpufreq_option(const char *str)
>              cpufreq_controller = FREQCTL_xen;
>              cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_xen;
>              ret = 0;
> -            if ( arg[0] && arg[1] )
> +            if ( arg[0] && arg[1] && cpufreq_cmdline_trim(arg + 1) )
>                  ret = cpufreq_cmdline_parse(arg + 1, end);
>          }
>          else if ( IS_ENABLED(CONFIG_INTEL) && choice < 0 &&
> ```

For the rest of this, I guess I'd prefer to see this in context. Also with
regard to the helper function's name.

Jan

