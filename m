Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AADFA6EAE0
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 08:54:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926101.1328955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twz6e-0006bk-HJ; Tue, 25 Mar 2025 07:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926101.1328955; Tue, 25 Mar 2025 07:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twz6e-0006Zg-DI; Tue, 25 Mar 2025 07:53:52 +0000
Received: by outflank-mailman (input) for mailman id 926101;
 Tue, 25 Mar 2025 07:53:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RPpQ=WM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twz6d-0006Za-AJ
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 07:53:51 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49546f23-094e-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 08:53:49 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so1359195f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 00:53:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a6326sm12702899f8f.29.2025.03.25.00.53.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 00:53:48 -0700 (PDT)
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
X-Inumbo-ID: 49546f23-094e-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742889229; x=1743494029; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gaPjOeaS1yKq+UrU7ULLpkvLzc5sxXuO0RcmwuQlI5M=;
        b=LHv6ooFkD8CejHkidSM/ohuzU8A6i5OLd6/rkEPPuP74XoEBGXbGbKM8mSmMjbmTPj
         P6jeJzEC8ALQSMtiyrTbXyKk1zDKksnQ4mcbuswDMkNCFXkMLsFmDlrMVefRDP5cQtlf
         oKYvcj+w0yw2p9V8pkclO0BpC7v2Xf2PaL/ursTrAVsaVJmylikleQ24UfxPYzTyJPF6
         MmOMPTpmNMenbzCWtd+btxTDP3uk2XoS2gAXXH389Bz/SKiks+okvXIyRiJcrvx67s1O
         hzjl7pE+MRs+fAXhO6nJmWVR8Yx1EfXYEYuJblGv9IXN7GxU/QydNmtlq90faLMWvkMu
         xXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742889229; x=1743494029;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gaPjOeaS1yKq+UrU7ULLpkvLzc5sxXuO0RcmwuQlI5M=;
        b=DQtIO+aDxqsx19bDOqIIIzrb18Vpdvbzv8WVqeBRpvUp5k8bUos0OdGGfb103a2DmZ
         i86sAtMitIEi62nJTvzUw6IDC9XOgHrJarn4K4mbWQX71kg4e7+g5iajrGTBaxvtyAw1
         2kapn6BhMIbArAXa+Scpst8gGvLMUK1mhKLpk0XXiUWCBVE7orbP0kVE1snCqDDjoGZs
         AN1/1hjVbE092TIgNLl3ygpOKvLwo3oc0OE+VQeMgb2cNlMNDaKyMEZ+G1M81waz151h
         I8UFnkxagl4kskpQGhjw0FqvvLJ/60MUHrN1/a05NoU11zlmAK7HVvg+Ev3FqBY5pv2t
         Ck6g==
X-Forwarded-Encrypted: i=1; AJvYcCW2OaMuHsWo7Il5Z4S0R+a88TkZFYAznLDEQQ6a50/vKwYv6NLlQq1E+g4cZk/5CXkvw2Hxnedgcxk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzeNiojkBfJMSJ0LwTirawQUgfaJ0eK10FOjAKyzq81vIyXeiZt
	zdQRakeMbSm/iB906VLLpVUnU92zu5rBFb0lBvSz6UrcXwj6i8K/BlyOuGWmCg==
X-Gm-Gg: ASbGncv+6HeNFbPF64C2dsXzS9Y1tmFW7TiZxZSx/tT3n7HFEA7liqE7W55KXaBIqA1
	1JWBo6TKSAI/vLCMuF/r2sjTJh3gRmaUTAI/GcOz3Snp3ikOhRcuwt7Z+xtwD9Rs1GeJeqCLNxy
	OjR/rAudX3d4FP0wnFenElUhRxgWg87AiykgtKdedDyRwh7XqB8cPKdgHy/7IG/jSQFmq8T27Ma
	UnN5TYVMs+NMWEDh79Cmm6jouVlJrnbSnEtoSHQOzQ4S2ZiuDHDWAZVPhotYC8KeYHTMrgvxkm4
	8wjRmAmykj2GoQ/PklmiSUC+R7/mjRGAdOhI/Rawv8knPK18UBdkNtkIcrcgDpL2byIH5XAtg3Y
	h7ltETUPqhH1aOYvlIGCLNMTM43KauOWNq7sE9AO2
X-Google-Smtp-Source: AGHT+IFzb8SEwGqg3ngvzqV3prWVUUA539MKL/XCcFqwjCSr7r5OoXl4UjgWoZ4z67Jikooj/q+UZw==
X-Received: by 2002:a05:6000:18ab:b0:39a:c6c4:f877 with SMTP id ffacd0b85a97d-39ac6c4fad7mr3059302f8f.20.1742889228650;
        Tue, 25 Mar 2025 00:53:48 -0700 (PDT)
Message-ID: <c46e1b7a-d765-421f-a7a8-9187bfb5b732@suse.com>
Date: Tue, 25 Mar 2025 08:53:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/15] xen/x86: introduce new sub-hypercall to
 propagate CPPC data
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-3-Penny.Zheng@amd.com>
 <19cab53d-3edc-4900-95f1-6d5d81e0ecac@suse.com>
 <DM4PR12MB845156C8C25495D7DB396ED9E1A72@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB845156C8C25495D7DB396ED9E1A72@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.03.2025 05:12, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, March 24, 2025 10:28 PM
>>
>> On 06.03.2025 09:39, Penny Zheng wrote:
>>> +    pm_info = processor_pminfo[cpuid];
>>> +    /* Must already allocated in set_psd_pminfo */
>>> +    if ( !pm_info )
>>> +    {
>>> +        ret = -EINVAL;
>>> +        goto out;
>>> +    }
>>> +    pm_info->cppc_data = *cppc_data;
>>> +
>>> +    if ( cpufreq_verbose )
>>> +        print_CPPC(&pm_info->cppc_data);
>>> +
>>> +    pm_info->init = XEN_CPPC_INIT;
>>
>> That is - whichever Dom0 invoked last will have data recorded, and the other
>> effectively is discarded? I think a warning (perhaps a one-time one) is minimally
>> needed to diagnose the case where one type of data replaces the other.
>>
> 
> In last v2 discussion, we are discussing that either set_px_pminfo or set_cppc_pminfo shall be invoked,
> which means either PX data is recorded, or CPPC data is recorded.
> Current logic is that, cpufreq cmdline logic will set the XEN_PROCESSOR_PM_PX/CPPC
> flag to reflect user preference, if user defines the fallback option, like "cpufreq=amd-cppc,xen", we will have both
>  XEN_PROCESSOR_PM_PX | XEN_PROCESSOR_PM_CPPC set in the beginning.
> Later in cpufreq driver register logic, as only one register could be registered , if amd-cppc
> being registered successfully, it will clear the  XEN_PROCESSOR_PM_PX flag bit.
> But if it fails to register, fallback scheme kicks off, we will try the legacy P-states, in the mean time,
> clearing the XEN_PROCESSOR_PM_CPPC.
> We are trying to make XEN_PROCESSOR_PM_PX and XEN_PROCESSOR_PM_CPPC exclusive
> values after driver registration, which will ensure us that either set_px_pminfo or set_cppc_pminfo
> is taken in the runtime.

Yet you realize that this implies Dom0 to know what configuration Xen uses,
in order to know which data to upload. The best approach might be to have
Dom0 upload all data it has, with us merely ignoring what we can't make use
of. The order of uploading (CPPC first or CPPC last) shouldn't matter. Then
(and only then, and - ftaod - only when uploading of the "wrong" kind of
data doesn't result in an error) things can go without warning.

Jan

