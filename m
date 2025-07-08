Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C968EAFC3D1
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 09:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036222.1408485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ2Xa-0003eT-Cl; Tue, 08 Jul 2025 07:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036222.1408485; Tue, 08 Jul 2025 07:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ2Xa-0003bp-A5; Tue, 08 Jul 2025 07:14:58 +0000
Received: by outflank-mailman (input) for mailman id 1036222;
 Tue, 08 Jul 2025 07:14:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ2XY-0003bj-Up
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 07:14:56 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f5b9ac0-5bcb-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 09:14:54 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so3885306f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 00:14:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee5f4d59sm10565839a12.35.2025.07.08.00.14.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 00:14:53 -0700 (PDT)
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
X-Inumbo-ID: 3f5b9ac0-5bcb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751958894; x=1752563694; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/EQhVO0dtm8yAtV66jJaCWVpt0FM3MlfvqdaZVEKn5U=;
        b=BcZuBSrMwU3QrTDaKkzrfeRLM5Yosam341Ti25YY+NXqKzqQGRI06sAbQfwNbFxsh4
         VG6hIDPRLBXW50vqLrzJv6mepD9gQOipRovQPZTs0pNRwnMge3lPn2vRVp4lF/luiQvN
         aNvQhwYYv8yFaWtD2knDz8jxzJRRJqivXESPXlVtfOpNXnGRKhx+I4u0vjqbrxvBav8O
         6C1muSOJwu04HUwSVVaxIWtugwR2NNhWY+BDs0QYUwssS3pfY2CzlKq/xB8EhHdN6hj0
         2P/Z8QtX1o5LiGJOJof6AyeSevm/boNloirB5px1lR2cIsHo+Zjdzg+LBkyKgkrdm0Ir
         DZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751958894; x=1752563694;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EQhVO0dtm8yAtV66jJaCWVpt0FM3MlfvqdaZVEKn5U=;
        b=sjzk+TylMNtr3Xy2hCRxr2Jr1UCjiGG27s+y4hYtJFQVN9WJv5cTSsciJjo7fnAwu+
         WjB1z1OItsv1bq7nolBwRsQpKJFRolV4ALv0gEg+EWBrsoBsYq4US/aPB2xrp8yH5RNx
         XO1IPAn8VZmP77M4LXoCPx19iWYxqMNZ5hsEQMXzAvTJfAkmNLBnFCGzezvGQcU6hKHM
         fCtYDulZojWuE4IE9jdNHaePYPnD/4hHZBxqR91hBXxQSeFxnOEbtqXTNkIsGZt83ggj
         ZEJEaVVBS7IUvM3uzVGbwe8CyF4sJnzKGRPw8L+0BTgAyOuswnHjNEE6WuCYRKcFuN9t
         NmWA==
X-Forwarded-Encrypted: i=1; AJvYcCWbVIKIcNZm+oSvay1tJCrjzsZyx11DIhzSnC71dQ29mdPVqJLAvq7clNmafVNjAHRvvlEjtFqIT1s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzob/ioLEPuMe0p1Sk2Huk28D3vgDOR3FnpT65JPP/iUV08JAST
	EWI693RPigD+ETmMrEe3TqmtAmf2U65tVGe4lo2cqhgcZXKRf8bpGY23AHOXy9qFig==
X-Gm-Gg: ASbGncsUSPjuGDXKZ5331A1YkNRlJ3vfpZ90w7bZa0R4Jv2k74FyTM3sa3k7Vn36kUd
	LQWQ4Awe0JrG9i+7dpzmVmtGGl+G+lGuynMGB07OtG7RIFjBludUKhKAdTNTUebWmdR9TSrO69x
	G5m73bzfTaAfqcspfvPI2NW6D+WWlh7vbqBDJACStTN6Ttmdm30wlTqxn85r0mF+gOePe/yu+YZ
	aKiMV54V2cL7vXgIvbBBjksph1S49bMA+GXbiYLLWPFeF8u2+xTyjv5EIIleLQZGyKZWI1V/+E/
	4jhqa+E7dpD/hMfz+xXekMsf4GzeXSh8M87BOktB6yABoLhxUh52nhoNZZC8NUDMNrqDVCxu5vY
	P3F46KiPrkCzi1hpqJ8smSAeZS3b2OKVtk4iGtq8bs3GAPBaXU0j6s1VNYQ==
X-Google-Smtp-Source: AGHT+IGHGTonQs6qOM87lHB2VLqGSFVnG26aP6lxMZJzKQZvy8TYjEDmslu0/Xin2SwZ0MiIYA/7DA==
X-Received: by 2002:a05:6000:2f85:b0:3a5:1471:d885 with SMTP id ffacd0b85a97d-3b497036450mr12409027f8f.56.1751958894252;
        Tue, 08 Jul 2025 00:14:54 -0700 (PDT)
Message-ID: <9d0b850e-116e-4361-aafb-3b66fab84dde@suse.com>
Date: Tue, 8 Jul 2025 09:14:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 18/18] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-19-Penny.Zheng@amd.com>
 <a1bf3003-d0e3-4769-948d-872bc17b5f91@suse.com>
 <DM4PR12MB8451DC192A1D18BF2C8E6139E14EA@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451DC192A1D18BF2C8E6139E14EA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2025 06:02, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, June 17, 2025 6:38 PM
>>
>> On 27.05.2025 10:48, Penny Zheng wrote:
>>> --- a/tools/misc/xenpm.c
>>> +++ b/tools/misc/xenpm.c
>>> +
>>> +    case XEN_SYSCTL_CPPC_SET_PRESET_BALANCE:
>>> +        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
>>> +            return -EINVAL;
>>> +        policy->policy = CPUFREQ_POLICY_BALANCE;
>>> +        min_perf = data->caps.lowest_perf;
>>> +        max_perf = data->caps.highest_perf;
>>> +        epp = CPPC_ENERGY_PERF_BALANCE;
>>> +        break;
>>
>> Isn't this more line "ondemand"? To me, "balance" would mean tying perf to at least
>> close around the middle of lowest and highest.
> 
> The "balance" word comes from the epp value, it is 127, which is the middle value
> In actual hardware algorithm, the value of Energy Performance Preference register(EPP) will be translated to frequency setting,
> And it sets the minimum active frequency.
>  An EPP of zero sets the min active frequency to Fmax, while an EPP of 255 sets the min active frequency to Fmin (~IdleFreq).  It is linear scaling, so epp of 127 is calculated to the middle of Fmax and Fmin.
> And Fmax corresponds to the highest perf, and Fmin corresponds to the non-linear lowest perf

I'm fine with the EPP value picked here. My question - as to the min_perf and
max_perf values that you set - remains, though.

Jan

