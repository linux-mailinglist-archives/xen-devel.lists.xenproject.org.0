Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D52BD20F0
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 10:30:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141840.1476001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Dwj-00057z-Ax; Mon, 13 Oct 2025 08:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141840.1476001; Mon, 13 Oct 2025 08:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Dwj-000567-7b; Mon, 13 Oct 2025 08:30:21 +0000
Received: by outflank-mailman (input) for mailman id 1141840;
 Mon, 13 Oct 2025 08:30:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v8Dwi-000561-52
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 08:30:20 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5cf46b4-a80e-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 10:30:12 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46e2c3b6d4cso28514465e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 01:30:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb4982b30sm172715355e9.6.2025.10.13.01.30.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 01:30:10 -0700 (PDT)
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
X-Inumbo-ID: d5cf46b4-a80e-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760344211; x=1760949011; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Pz6KC/Rn87+HnHxT5y8QCxEDmgy1wHJGbT9l6fnqoBE=;
        b=AnDD8Ngyv+TEOhfTzgjSjmgfCUUYi6P2fJlgX3Q8/12RpllnT87Uc/XbxpbNQFQkS+
         NARZRvGywW/gVRs8BCf0MS8LA4Ohwiumn93XlbjMQI4NLKe5uawQJroQ6Gn041ecoy3I
         JLB+dFiTM6hTCW4GmjwPsVr4BeYvJebDlZue9dD3YCzZJMPQx3IWPc9BrAVU/LZoMQMo
         6dJ2Um9yMLbeTvz+MfT9p1MHGhsh/XQ70Yj5MOHf4ZaTX6ln5Fn+9nNhltSjO/z9koIW
         1QW/49o1KxyfQgT/5g7Q8JSKkLZP2zcIcTyse8oLTNdQBJMzPkS24rYi3ofu68LZmOjE
         KRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760344211; x=1760949011;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pz6KC/Rn87+HnHxT5y8QCxEDmgy1wHJGbT9l6fnqoBE=;
        b=cqJCtCnQGi+ZCuSg+X2/trJKAikKeqXb0lyvpTyY9Ike85rgdOkZWKT7EaeRwIlvt2
         8JfZh9gAPDiSrvrZ7xZITZ3XKb6Wmcd9da3MGSjGfGTg6c4LFZ3L42iPjtX8hQQzFWBb
         TojIBaRsigDtQWaGkhy6tDq3dDeOkJOdKZDvcdsbZFS2SsFvMivsU6ODkruUwhKlz8Cy
         cMXm6jlPkYWXMgoSPzuUaup2m3pTNBEMzUQWL6mnZsftxTEDxk2l0toPmtZhiQGGAAb9
         h8jRp5Zw43eqwEU/FiLXy0y9d1sRa3/MAFMx4PeV88JZKh53t0dshMosqLvI7KYBDlnE
         EBIg==
X-Forwarded-Encrypted: i=1; AJvYcCWscOKVWasZwkJQOMPA6WDUX3gBs4+eesjAIukj3syIiLMm72d+NpR6xZbY+ASpgCIo0lkrSfUa/a8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKgX1k1wC0DTb38QFdpD/bxcjiqFtcsbYFSGdiI+QxCCWWbEAJ
	5OXaQjlApsFby1KCdNngEBkodgKS1LivP5ojBuAQVyfCWNDInrvPToKOTWVnGYcQCQ==
X-Gm-Gg: ASbGnctrrSeRUNTKVVZ1F05iB7J3oOynuQscFql+lnGtb1dYMV9QBx8fTSGtvWGLNoW
	J/TH6DZ4qhCbN8MmP5GRuZZm/BS7tKS8m8cusqxTmbBhoNiim5fl+SBwGwTYDMPiXIZ3GT9sOnh
	dZSnA5aeFH89hMEc6sZ0fYNx4NnAwJLYx+3EnVIZDFUPHw3IWqC4r4at/kcZ6JgIyxQo34Xhsus
	v06vnD7oKQRZ6lmsnrxYhvKdRHV4Z5HlsuEjddGr4FZV3X2bQ9/WtMgWh2cCnxtSMKeRdLp6iDT
	HhCP3OOrTr4O2YdHrjf94TUe7FrCng2w+HOFaSROaziads+51ot/zQz8zlvKTf1U7ZlnP8gtq2m
	Fvog1NcLtFQveVEA6r7TucI/tZzKj4cbRbBprWEbngj3+DURJ2n+CyeiKKru3yvVZvtkIxzRo5h
	YJRpufon7G3V510Prk6DIbKj9AYg==
X-Google-Smtp-Source: AGHT+IHMp1tHYdmVa5+RzD0QHKwTD3rZ9NI3nP/OP2ITz3ePdUSlVOk9lRAMdbro1EWxZk97a3fFsw==
X-Received: by 2002:a05:600c:1d11:b0:46e:3d50:360e with SMTP id 5b1f17b1804b1-46fa9aeff01mr144283685e9.18.1760344211206;
        Mon, 13 Oct 2025 01:30:11 -0700 (PDT)
Message-ID: <b24ca9a0-f388-4e02-b998-d0f9cbb9c5e1@suse.com>
Date: Mon, 13 Oct 2025 10:30:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/26] xen/domctl: wrap arch-specific domctl-op with
 CONFIG_MGMT_HYPERCALLS
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-25-Penny.Zheng@amd.com>
 <56024eb0-b30f-43fd-84b7-6070a1d79cf0@suse.com>
 <DM4PR12MB845153811FA7748CA058EB9AE1ECA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <fa709d35-8c7b-4c27-9bac-52a48f5b3fb3@suse.com>
 <DM4PR12MB8451A7C97D812B25A553985DE1EAA@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451A7C97D812B25A553985DE1EAA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.10.2025 09:18, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, October 13, 2025 2:41 PM
>>
>> On 11.10.2025 08:44, Penny, Zheng wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Thursday, September 11, 2025 9:03 PM
>>>>
>>>>> --- a/xen/lib/x86/Makefile
>>>>> +++ b/xen/lib/x86/Makefile
>>>>> @@ -1,3 +1,3 @@
>>>>>  obj-y += cpuid.o
>>>>>  obj-y += msr.o
>>>>> -obj-y += policy.o
>>>>> +obj-$(CONFIG_MGMT_HYPERCALLS) += policy.o
>>>>
>>>> Fair parts of cpuid.c also become unreachable. And all of msr.c afaics.
>>>>
>>>
>>> I just found that the functions defined here, as helpers/libraries, are used in
>> tools/libs/guest/xg_cpuid_x86.c too. Emmm, to make compiler happy, I still need to
>> provide stubs for them when MGMT_HYPERCALLS=n. Or any better suggestion?
>>
>> How does the Makefile change here affect tools/libs/guest/? What would you need
>> stubs for there?
>>
> 
> Like Function xc_cpu_policy_is_compatible() in tools/libs/guest/xg_cpuid_x86.c is also using x86_cpu_policies_are_compatible() to do the comparison between host and guest. If making xen/lib/x86/plocy.o guarded by MGMT_HYPERCALLS, we will have "undefined reference " error. Imo, it is not suitable to guard files tools/libs/guest/xg_cpuid_x86.o with MGMT_HYPERCALLS.

Correct, but I still don't see what you're getting at. This Makefile is used in
the hypervisor build only. In tools/libs/guest/Makefile.common we have

ifeq ($(CONFIG_X86),y) # Add libx86 to the build
vpath %.c ../../../xen/lib/x86

OBJS-y                 += cpuid.o msr.o policy.o
endif

Jan

