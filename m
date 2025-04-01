Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C06A774A4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 08:38:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933516.1335448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzVGQ-0006dw-Ii; Tue, 01 Apr 2025 06:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933516.1335448; Tue, 01 Apr 2025 06:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzVGQ-0006bG-G3; Tue, 01 Apr 2025 06:38:22 +0000
Received: by outflank-mailman (input) for mailman id 933516;
 Tue, 01 Apr 2025 06:38:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzVGO-0006bA-I2
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 06:38:20 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e614d7c9-0ec3-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 08:38:19 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3913b539aabso2979220f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 23:38:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d90000f48sm144489275e9.37.2025.03.31.23.38.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 23:38:18 -0700 (PDT)
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
X-Inumbo-ID: e614d7c9-0ec3-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743489498; x=1744094298; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3KyJcf0Q5Z+31C42hrAx9ma9jZnCwyV2rBRy4XkZjYg=;
        b=TbCJpQAcqVE0bWgx+qCeW/SywRDmrc+3cbXH/ZS+9RVQDJ5rsPnq1obg75SXiaZJfu
         1HDHWfTrEGOZB+3Gza9TQ1KOfOVVS/xcujq5ImNAqu+xYBv/mOtQVNAHhY++hbFgzxFb
         MmLYxP/AdT0xo9WOzVBJ7T627lPzmPKW6xkRosgDdmkBuuxpS+1mGXJt822SvxG8T+pt
         vWe+htInBq20ZtOJC9fP5xC6MNRr7pu9DGBGf2ONqUlgTlmgj6orQWVOhaISafFdu6Jm
         bYEs3DG/unZl6XsH384v4JYVY2QFMCn3lJqZnsupO6sCNQ8gpIJfZidNWSNlNekvjih5
         nG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743489498; x=1744094298;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KyJcf0Q5Z+31C42hrAx9ma9jZnCwyV2rBRy4XkZjYg=;
        b=tLOmc3AR6FBHVWBRrIjRqUlHuHYrjTG/pmgyWOOznyWRUV+Lzz4Mpz4+FgBtRmWNcj
         839fSSI52l9WNaB79c2PPkJLYJJTpD+5SVa1P7Xn0AAQzOGWCwZNi8aUnOUfW5zM9rE+
         dGdD2sp/9F5NN/xFTg55bqCq6x5ySkYyhp5tVsV+C8xO7KpaOkwPX4U8MZHMudV3pNdn
         WXDVIj7KdxqMdzRh3/vszqBOZ8egu8BTjIKqu7CPIoV8nchU4q+rfyLxZqRAXuzoIVJS
         gEoUvxWy20pihGpQ6RUoEMyI8WB2VnSBeQwVCgiNYJQ1m2mY1J1VPPGLhRqTROppNOyT
         TmiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCsXReqpbdGN8AHpQeoMJlrZNPa0izUfbEUMO4O/nwmZHvfYfh3vH7q8fVZ7Qa1uH0z68Qia0on10=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkRbwvCb1SOnZAZjGiADdlzldqnRiEjXPzaQu735rduUYPTmA8
	Jtb00YwkBCvUBCQq7nZIw676jGEVa8ZgvxQpGfRDi01ySOGwvQrgsaE+4F41cA==
X-Gm-Gg: ASbGncvMS2Wg07JUIdVUhMSP56x8I2z8pov+B+M2CTW3hf6+rpRgOlvfXqSckHJn2gB
	vwdq6hpgqY0hknlWZlRHAsYi3To1LROw6ufxRi7Am+76bwGgcFhBI53vAJLkifIr5vyOCAMY6xU
	03bHpj7C9wJlZDkoLhm/M2av+m0zvCQnCuX04x4RVDnfpMu/8CLz4jqr19dfs9ITRnBZT9PuxNT
	VCH2/x5BrMNOninh0VSsTpkK4Kx1k42foLKxKIIHAml0MbPPHZ8TAejZQwiA+8fZOPZM5vrP/jD
	iLUj2vce+fbIICl4XH9pTPX8rim1DAyFJ7yUIz1V98YILxi8MClcE7M5Agy+ZPZ3ZNp8WFf7IZQ
	poBSkqy7VG6JLkDtT5GkYze4c1bOJfQ==
X-Google-Smtp-Source: AGHT+IFhMY8eTFmb3+UJZUxSrwIorwQ4grpB7wy1aUBvO4Jpj2H7PWppNYE8Ltgwcel0jjesjke9sQ==
X-Received: by 2002:a05:6000:18a8:b0:390:fb37:1ca with SMTP id ffacd0b85a97d-39c12119c94mr9231553f8f.53.1743489498532;
        Mon, 31 Mar 2025 23:38:18 -0700 (PDT)
Message-ID: <3cd17873-5905-4d2f-86cb-9875edd8025f@suse.com>
Date: Tue, 1 Apr 2025 08:38:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-4-Penny.Zheng@amd.com>
 <80963bfa-a19e-49a7-8de2-0d8508af450f@suse.com>
 <DM4PR12MB8451F07287ABC9BB683D7BD3E1A62@DM4PR12MB8451.namprd12.prod.outlook.com>
 <94160460-357a-4852-b56d-3d89febd0e68@suse.com>
 <DM4PR12MB845172547933E0618DC27EEDE1AC2@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB845172547933E0618DC27EEDE1AC2@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.04.2025 07:44, Penny, Zheng wrote:
> [Public]
> 
> Hi
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, March 26, 2025 6:43 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Anthony PERARD <anthony.perard@vates.tech>;
>> Orzel, Michal <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Roger
>> Pau Monné <roger.pau@citrix.com>; Stefano Stabellini <sstabellini@kernel.org>;
>> xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v3 03/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
>>
>> On 26.03.2025 08:20, Penny, Zheng wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Monday, March 24, 2025 11:01 PM
>>>>
>>>> On 06.03.2025 09:39, Penny Zheng wrote:
>>> Maybe I mis-understood the previous comment you said ```
>>>         >          else if ( IS_ENABLED(CONFIG_INTEL) && choice < 0 &&
>>>         > ```
>>>
>>>         For the rest of this, I guess I'd prefer to see this in context. Also with
>>>         regard to the helper function's name.
>>> ```
>>> I thought you suggested to introduce helper function to wrap the conditional
>> codes...
>>> Or may you were suggesting something like:
>>> ```
>>> #ifdef CONFIG_INTEL
>>> else if ( choice < 0 && !cmdline_strcmp(str, "hwp") ) {
>>>     xen_processor_pmbits |= XEN_PROCES
>>>     ...
>>> }
>>> #endif
>>> ```
>>
>> Was this reply of yours misplaced? It doesn't fit with the part of my reply in context
>> above. Or maybe I'm not understanding what you mean to say.
>>
>>>> In the end I'm also not entirely convinced that we need these two
>>>> almost identical helpers (with a 3rd likely appearing in a later patch).
>>
>> Instead it feels as if this response of yours was to this part of my comment.
>> Indeed iirc I was suggesting to introduce a helper function. Note, however, the
>> singular here as well as in your response above.
>>
> 
> Correct if I understood wrongly, you are suggesting that we shall use one single helper
> function here to cover all scenarios, maybe as follows:
> ```
> +static int __init handle_cpufreq_cmdline(const char *arg, const char *end,
> +                                         enum cpufreq_xen_opt option)
> +{
> +    int ret;
> +
> +    if ( cpufreq_opts_contain(option) )
> +    {
> +        const char *cpufreq_opts_str[] = { "CPUFREQ_xen", "CPUFREQ_hwp" };
> +
> +        printk(XENLOG_WARNING
> +               "Duplicate cpufreq driver option: %s",
> +               cpufreq_opts_str[option - 1]);
> +        return 0;
> +    }
> +
> +    xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
> +    cpufreq_controller = FREQCTL_xen;
> +    cpufreq_xen_opts[cpufreq_xen_cnt++] = option;
> +    switch ( option )
> +    {
> +    case CPUFREQ_hwp:
> +        if ( arg[0] && arg[1] )
> +            ret = hwp_cmdline_parse(arg + 1, end);
> +    case CPUFREQ_xen:
> +        if ( arg[0] && arg[1] )
> +            ret = cpufreq_cmdline_parse(arg + 1, end);
> +    default:
> +        ret = -EINVAL;
> +    }

Apart from the switch() missing all break statements, the helper I was thinking
of would end right before the switch(). The <xyz>_cmdline_parse() calls would
remain at the call sites of the helper.

Jan

