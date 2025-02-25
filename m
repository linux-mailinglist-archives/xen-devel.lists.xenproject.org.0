Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0254A43CF0
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 12:10:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895627.1304289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmspL-00053N-V7; Tue, 25 Feb 2025 11:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895627.1304289; Tue, 25 Feb 2025 11:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmspL-00051W-SJ; Tue, 25 Feb 2025 11:10:15 +0000
Received: by outflank-mailman (input) for mailman id 895627;
 Tue, 25 Feb 2025 11:10:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmspK-00051G-0s
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 11:10:14 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 157f1552-f369-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 12:10:13 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4397e5d5d99so33750085e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 03:10:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab156a199sm22087965e9.39.2025.02.25.03.10.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 03:10:12 -0800 (PST)
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
X-Inumbo-ID: 157f1552-f369-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740481812; x=1741086612; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1cxEuWRpsE19sPrSwBC7CAX0MomkD0jfLCXCfZiYFWE=;
        b=IhQgQcQNVU+HiwldI1s/QG9sm6AvD32xLWdN/V9CC1VNhARlVLEy1U4Z6uYM+ZCcy8
         HarbA0WpuG60S0jtqfZ8YcAiN0c6/ksMlSz6dQVBUAO2N9wyKE/tYlZd4TjSlBoUD0VT
         MwDfdL9qVgtGNGsR9n2EkHXI70mtMWqljz7T9/3MIxDmHQFyVA4qIk6zgK851CtxwMro
         /45yGSLcjud2IqPavo0R7rDmxs718eYs1cBtOHoStOI0Ll7GOIhunAJX03ScYovnhXsm
         BvAx98T9yfxh9pXsDtJPQh2qyhlYriEqd0DOF5PcYMg4i1Uqq2S3c6+GOyjAuN2uTd4u
         BgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740481812; x=1741086612;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cxEuWRpsE19sPrSwBC7CAX0MomkD0jfLCXCfZiYFWE=;
        b=Hk9hroSD8pyVMXw1V2UWpF1gOfhVAeGoabVH7G+uDEbXtZAHO01oRE4KmLrQ7nXs+R
         skwYHCbSSfuljfhIk/jLnM+AVK5nNGq2acCS/qI7V4Apw2lNXxAMB55cb3NkcEyRcrKQ
         jNsp0BI4kkQNOJL6xdoH+LV2Y4F8QE5a4+5IMfcSgbA2uymXkz6k4JHNHS0OH/M8xWwX
         xz+AGu+VYtgy9ZBVi2xvX5FSg1i2kBeYDXDOvCUwv50znLU7gCqF5vaFrUC7cmX5eJFo
         fInJRL1KCPyQCI481MlFmoNlOnzQcKxrQspN1gNMbqu6dQSM2jTTa5+7okncRQsQAqxH
         G5CA==
X-Forwarded-Encrypted: i=1; AJvYcCVVwOLiqb33LYI79E0hcpsOs4kk0Xx+y4ROKXBVTAkuDzBKerDef+46lM3srfDvp4k91pi6yKYZdCc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVEVDygr7YTByR4xUG5sP7eDQ60e/zZcFkIQMn7b3GaEXGCzt7
	Sz5hRbYEv+pEHY2fWbFGWn0XpxRho1G2j/rmIYGAShpkle7PQ/y8d4f/3mRQVQ==
X-Gm-Gg: ASbGncv1GWqyOObqEuxZHBNpy+U0IQM1nPxPm/1ZYVaUXUl601AbHDO7xInPNZNSsVa
	Qn08dzPlvBnQ2YR5wtcCKulfFvqrM4hHL2wtpbTathDtTB4ecjqJK4cBbp+57OWSFHowQFuEnPQ
	EBbff8i0+gNyvmD9LWU+eYM9vlHnVbEBvC9jvzkMJ7mt2KAtfp3nBapgeuC8wYENkP1pC9hVDu1
	eCpY/aOSLF+OQ8JbZnOb/5SXKSZeFoyMZyOLc/AgA+LaouFI+EcuxHsdR7fF836ktw5QwERy0Hn
	kSZnCt56mVvBb4J2ZHC+tkbnLeEbKFVC+DCHiFRPWksnhkBzNsVd06CIZyQLR4SaEtX8BLT4d/j
	js0bGYJ/+P+I=
X-Google-Smtp-Source: AGHT+IEwGY2sBSn58koOL8FfKc74tzIVRbtjdg621ptLLrjapIhpCCb6Hnvyfp+TQSznm+FfcECLXw==
X-Received: by 2002:a05:600c:4ecf:b0:439:a88f:8538 with SMTP id 5b1f17b1804b1-43ab0f277efmr25728835e9.5.1740481812500;
        Tue, 25 Feb 2025 03:10:12 -0800 (PST)
Message-ID: <a7d1fd12-b950-4ba2-b8e9-9131d9a2b4e7@suse.com>
Date: Tue, 25 Feb 2025 12:10:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/8] iommu/arm: Add iommu_dt_xlate()
From: Jan Beulich <jbeulich@suse.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1739182214.git.mykyta_poturai@epam.com>
 <02afc1bce09dd22865c7e2bad6cad9a804fca64b.1739182214.git.mykyta_poturai@epam.com>
 <f8f72da9-797e-44e5-93c2-cadb9fd1aae4@suse.com>
 <bab5a083-3aa2-4c5f-b798-57322e1af521@epam.com>
 <0c60434c-3899-4b1e-92c8-b72afdb698db@suse.com>
Content-Language: en-US
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
In-Reply-To: <0c60434c-3899-4b1e-92c8-b72afdb698db@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.02.2025 12:08, Jan Beulich wrote:
> On 25.02.2025 12:05, Mykyta Poturai wrote:
>> On 10.02.25 12:46, Jan Beulich wrote:
>>> On 10.02.2025 11:30, Mykyta Poturai wrote:
>>>> --- a/xen/include/xen/iommu.h
>>>> +++ b/xen/include/xen/iommu.h
>>>> @@ -238,6 +238,14 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>>>>    */
>>>>   int iommu_remove_dt_device(struct dt_device_node *np);
>>>>   
>>>> +/*
>>>> + * Status code indicating that DT device cannot be added to the IOMMU
>>>> + * or removed from it because the IOMMU is disabled or the device is not
>>>> + * connected to it.
>>>> + */
>>>> +
>>>> +#define DT_NO_IOMMU    1
>>>
>>> While an improvement, it still isn't clear whose "status code" this is.
>>> The #define is effectively hanging in the air, from all I can tell. And
>>> from it not being a normal error code it is pretty clear that it better
>>> would have only very narrow use.
>>>
>>> Also can you please omit an interspersing blank line when the comment
>>> is specifically tied to a definition or declaration?
>>
>> What would you say about removing this status code entirely and 
>> returning something like -ENODEV instead, with adding special handling 
>> for this return to the callers where needed?
> 
> I'd be okay with that; Arm folks also need to be, though.

Oh, and: Of course it then needs to be pretty clear / obvious that -ENODEV
cannot come into play for other reasons / from other origins.

Jan

