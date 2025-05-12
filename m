Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBF0AB3CEA
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 18:02:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981820.1368230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEVbr-0004h4-VL; Mon, 12 May 2025 16:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981820.1368230; Mon, 12 May 2025 16:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEVbr-0004eo-Ra; Mon, 12 May 2025 16:02:31 +0000
Received: by outflank-mailman (input) for mailman id 981820;
 Mon, 12 May 2025 16:02:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEVbq-0004ei-Bk
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 16:02:30 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80ad1046-2f4a-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 18:02:28 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ad1b94382b8so755324666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 09:02:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2290a4cc2sm526861366b.183.2025.05.12.09.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 09:02:27 -0700 (PDT)
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
X-Inumbo-ID: 80ad1046-2f4a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747065748; x=1747670548; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nBDzpcpLffFQaUT3+67+bqNJ0RPcHCafk40SE2v99U4=;
        b=OFPAEyiQwQ1hbxDTLaAuRVg53K0D4f5B/75puT3ekeSTmYDieZ/xAW897iQcKDNBcq
         f6IfiP5u85iA8r+v1yK2j/9bfylctwxugnCiQ06YGQ86+8hh+GcdXv7LBvWIK4Y5WrvE
         rj2YJ6+b26ZVgsvg7mDjQpp9I3tPK4BwdS5DNWD7VlCwBLrziC0RU8ozb7UaiiHuaS/P
         gWhL8AinsSmZiCuLrXNgqZRb4wgVq75+c8CVmUkFUbR4nthic4fOI0EQiB2mT1wU5LGY
         crYLRaDZ+GSCt0NvgNXeXX9J/i9nA8WeJ1oznR7XQBaJTEmpbe1nJICb9dTYZZYD66DV
         m+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747065748; x=1747670548;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBDzpcpLffFQaUT3+67+bqNJ0RPcHCafk40SE2v99U4=;
        b=CZZH/MaFtGIhsolcJJOJ4fukR8D65Y3SaEXdr7LE4fGrLyPMUPRcygQ+gsXtpoNafT
         44ab/m9LcZU+wcQEby8I/2/j3pebz4i41EyUlrxAbdzUOrT4zHiQYEWBnoooQAXAcwiC
         oS5nmRcRKL+pCX3C2rGGPSlBU7SwPB7t4qYjQjM+Iijdzmw1L+u7Ki9aBqRoG5EWbOA+
         /bJ8in7u7jp+2a7A3LEzD7oHZF+K6M7ZHevXcyxA4Rg7r5Q3dHLckhRQRKcWIwjdgc+w
         JW+NzwVGm9+Dm3lyy6WJprWA/oYt+TmeZtnfSa9ti8ysBiXd4RYguafYMXnQ4QWiwUTq
         ytMw==
X-Forwarded-Encrypted: i=1; AJvYcCXmZUwoccaMcWEqKZ38OoGEHLqFr6h+A7bAqraGzWhH3M6GdLOjDCYnxH+aK6VZIRp96/C/TjAvPAs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWYleOSm0I8xxryr1Cn3UJAH2Ohy99cy3uCIuOxy3uKCRdEWV3
	ceMBqqbMdehRu9YLlCZcYAHO8XJjUmzE59NrGM6URaFrlsN+QVQZ4zPvLeOM6Q==
X-Gm-Gg: ASbGnctU9UN+jXlIWeI2G6sbiOVuzhx6cMNwFyat+zoG4Lxa9aPAE80GW8IC//Q993/
	/osD9hiaF/x2+44bYuhx4aT9llecw3/FkBSKSTd79nv/VQkuaX7MIU08fkN4VMd2dKcsetcTXFU
	tGLteNo1vxg7F+a6qrcbvbyjP+V4Z5YbmHAoZG5a2J/f1KPg+CPqW7wof1mOVGOEc0OyLinoToo
	gayeJBNnyLcWwXF8ToXuBi6hnQjtASyCFLKdjCi9owwm6RY/BwhUci4IgcfRNGUfH1XZfRfTk4E
	WCUMMhp/MgPKbUmvBmBJsG/p8d2iMKh4efpbtoYZa7rNgiH82mht4DrQezuetc+OMjLUMGsszB+
	u5pJtzGlPap+noDlkWk4Tn0NFh3B5s+nQoVNg
X-Google-Smtp-Source: AGHT+IFEBteYHD2pe1od47+0ZyqZSEHibimfVYcVMHJD8zvi6WL6upUaJ8ZvrWCRlyafv2yNSljCDQ==
X-Received: by 2002:a17:907:3f11:b0:ace:d710:a8d1 with SMTP id a640c23a62f3a-ad218f1bafcmr1251884266b.24.1747065747621;
        Mon, 12 May 2025 09:02:27 -0700 (PDT)
Message-ID: <9ca29295-717b-46c6-be00-a86217ec4550@suse.com>
Date: Mon, 12 May 2025 18:02:26 +0200
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
 <DM4PR12MB84510753F3B015F1404803FDE188A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84510753F3B015F1404803FDE188A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.05.2025 07:27, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, April 29, 2025 8:52 PM
>>
>> On 14.04.2025 09:40, Penny Zheng wrote:
>>> @@ -573,6 +576,14 @@ ret_t do_platform_op(
>>>          }
>>>
>>>          case XEN_PM_CPPC:
>>> +            if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_CPPC) )
>>> +            {
>>> +                ret = -EOPNOTSUPP;
>>> +                break;
>>> +            }
>>
>> While at least you no longer use -ENOSYS here, I question this behavior, including
>> that for the pre-existing cases: How is the caller supposed to know whether to
>> invoke this sub-op? Ignoring errors is generally not a good idea, so it would be
>> better if the caller could blindly issue this request, getting back success unless
>> there really was an issue with the data provided.
>>
> 
> Understood.
> I will change it to ret = 0. Do you think we shall add warning info here?

No, for precisely ...

> Dom0 will send the CPPC data whenever it could.

... this reason.

Jan

> XEN_PROCESSOR_PM_CPPC
> is not set could largely be users choosing not to. In such case, silently getting back success
> shall be enough.
> 
> 
>> Jan


