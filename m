Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA23F8811E7
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 13:52:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695900.1086171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmvPd-0004Lp-Pj; Wed, 20 Mar 2024 12:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695900.1086171; Wed, 20 Mar 2024 12:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmvPd-0004Ip-M2; Wed, 20 Mar 2024 12:51:21 +0000
Received: by outflank-mailman (input) for mailman id 695900;
 Wed, 20 Mar 2024 12:51:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmvPb-0004Ij-PR
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 12:51:19 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b6a9bbe-e6b8-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 13:51:18 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a46d9fbb5a5so267055166b.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 05:51:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z23-20020a1709060f1700b00a46478fbbbesm7206031eji.153.2024.03.20.05.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 05:51:17 -0700 (PDT)
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
X-Inumbo-ID: 8b6a9bbe-e6b8-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710939078; x=1711543878; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZRJe4oTEQBLFAXfalqLcXnYU7K14oWigY+8BJS/reIg=;
        b=UHxiyx5L3GWGQQQU0PKxU9XAkWuPB320ncHEvo5pPf4NLuyxH7y7K1UevaVOz5fDci
         IICLiwMF4kSiFzlH3naGpP+8qOECT8INLYGYwsX3DffoMTis8h+W0nrRKiXtfXEYlEn1
         7MefFWULFInvbIeqhQ9W7AjTgTXDcoOXzMYf4wmclR37QoKLsv4AixdkmFCLXEbF2ad3
         YczR9FTaRF5sSwkwUUE6bEpUb/sMejEJPDtJYtQCT/RnaIxgkDHvuLeXYauOMDQykT/7
         z4QuDpjhCKBOqd1Jih3bJK+gPPGftbCg/5/Hyjm0/Yhg6kWjbV4IXKwduA2BS/tKs3Jz
         S+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710939078; x=1711543878;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRJe4oTEQBLFAXfalqLcXnYU7K14oWigY+8BJS/reIg=;
        b=DYEeflDkfuMgODareFsOW7Bd4DBYXRZVOmRRIJt4f+L5XdrPIpOU06L+u9L7e/yJD3
         Eu+i52uId9jXGvcFQ86cSfFDBVxJQohsEHTSY3n2KViALDyHcxMmP9BhuTQWbCRNCBxn
         /900OEdfKSNRw9laiTQywVLd6tnz9MNq2kC+hcDf9AVI6UQI4hgKGW+HC7KQbbNT3A4k
         9a7QOVddHx25vmJiENyaopNh9tcG7NH3M1FsD2IBoeQD0zR56F+USRNe8gWoHoFn+DIS
         PA3CU1OXWWh3QCk+r3g8pXnsOCmDO+mNNC7tIKMQQq/FUMkOjIjgivhYOiM8Xj41yTd7
         ZUWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyZo3ki7xKpHmKd4WTh8bXCOiA0ym7z/u/wAaYrwI6cByckbPF/DIpyugROhSwW9p3I7cuSCWXz7CLG0760RhyfEapwQNb3E82i/WEuLM=
X-Gm-Message-State: AOJu0YzG4flOtgTA1PzjQLdgmcri+m+mRjlGIXNbPpaqBEkBpdnzhsDk
	zAuxiGPxBtr3qyt8axnOKTI+g83yvJOxn48FTAdfA71Uo6pPtpEUTTgRDlb55Zip/HlO5XSoh0k
	=
X-Google-Smtp-Source: AGHT+IGfnpl65eE1PBF0ifCr6zD1JaDJN0GjGH2neM7L76rE8HOmPZMDu/0ZMoOUbq6YHGkKM1EgcQ==
X-Received: by 2002:a17:907:369:b0:a46:22fc:74d3 with SMTP id rs9-20020a170907036900b00a4622fc74d3mr3380041ejb.72.1710939077856;
        Wed, 20 Mar 2024 05:51:17 -0700 (PDT)
Message-ID: <f8bd3d96-3760-439a-af91-0ee6a93974b4@suse.com>
Date: Wed, 20 Mar 2024 13:51:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/features: More AMD features
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240318181332.3817631-1-andrew.cooper3@citrix.com>
 <8eb3d0d4-daf2-40a4-83b6-d3726e02814f@citrix.com>
 <e8898bca-7dd2-4e40-acc0-72c4d7da1d1d@suse.com>
 <9268c7e4-afb5-485b-aaf5-818b3f21c6e3@citrix.com>
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
In-Reply-To: <9268c7e4-afb5-485b-aaf5-818b3f21c6e3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2024 12:45, Andrew Cooper wrote:
> On 20/03/2024 8:12 am, Jan Beulich wrote:
>> On 19.03.2024 18:40, Andrew Cooper wrote:
>>> It occurs to me that I need this hunk too.
>>>
>>> diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
>>> index 25d329ce486f..bf3f9ec01e6e 100755
>>> --- a/xen/tools/gen-cpuid.py
>>> +++ b/xen/tools/gen-cpuid.py
>>> @@ -329,6 +329,10 @@ def crunch_numbers(state):
>>>          # In principle the TSXLDTRK insns could also be considered
>>> independent.
>>>          RTM: [TSXLDTRK],
>>>  
>>> +        # Enhanced Predictive Store-Forwarding is a informational note
>>> on top
>>> +        # of PSF.
>>> +        PSFD: [EPSF],
>>> +
>>>          # The ARCH_CAPS CPUID bit enumerates the availability of the
>>> whole register.
>>>          ARCH_CAPS: list(range(RDCL_NO, RDCL_NO + 64)),
>>>  
>>>
>>> To cause EPSF to disappear properly when levelling.
>> What exactly is wrong with exposing EPSF when PSFD is not there?
> 
> https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/white-papers/security-analysis-of-amd-predictive-store-forwarding.pdf
> 
> Final sentence before the conclusion:
> 
> "Software can determine the presence of EPSF through CPUID Fn8000_0021
> EAX[18]. All processors that support EPSF will also support PSFD."
> 
> i.e. you'll never see anything about PSF without having the controls to
> turn it off.

Ah, I only had an old copy of that. My R-b holds then with that addition.

Jan

