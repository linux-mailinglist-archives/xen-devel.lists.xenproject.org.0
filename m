Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 105FAAB3C66
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 17:41:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981763.1368169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEVHR-0006Ux-7c; Mon, 12 May 2025 15:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981763.1368169; Mon, 12 May 2025 15:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEVHR-0006T1-4t; Mon, 12 May 2025 15:41:25 +0000
Received: by outflank-mailman (input) for mailman id 981763;
 Mon, 12 May 2025 15:41:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEVHP-0006Rg-6B
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 15:41:23 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8df788b3-2f47-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 17:41:22 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5fbf52aad74so9541022a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 08:41:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fe17c6c918sm2190808a12.23.2025.05.12.08.41.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 08:41:21 -0700 (PDT)
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
X-Inumbo-ID: 8df788b3-2f47-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747064481; x=1747669281; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=20xrL+8f4Mo1wmEMliefXpltpUJiQP3DhTavYpR2koU=;
        b=ZLVTMlOEg/JzbG68X7dUoQZ2vkt7N0sK1mc6TNM8hy6rbLZmA3Cx3aSpHW3uv9Zo3a
         fcSCVNz9MrbHnaQ0z3YyP6xlpc39eVUsN1Gv/t7KCLMIhFVAb5cPw8KQTddi7olIbvaS
         CcqvmXCr/tkoRkcJ/IMmyoIm4DLOGP8PS5RUJrHEzuSd+T/9+Q/KTu6aikkmBXqNsxCS
         xCgC0t3cMMDgCKRRIupVSMnvH+6sR9HlR3fVCEnrNMUSG/rtcmZeNtTLznv3ytH0z0iB
         mMORQMt41eu0zZFE13mp75SEFbJjFhRLfuDqCZdBMlPqU48vJS9jujvc/BpdwlTP2C3o
         KB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747064481; x=1747669281;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20xrL+8f4Mo1wmEMliefXpltpUJiQP3DhTavYpR2koU=;
        b=TTWM+awhCDyN721kjuPI+GhCLDYHfMAMFFiW/MxrwAPQf4NzxFi6tOVKJ6A6Qa/oCn
         c4ne1qS9FNefxDbfY0izmGWVh20uOWCeUbwRaKI+stSHlDVHBjLwT1MKfUMSszwj+cmu
         PbUVKR8GrieANur9blTC6F6ypH+Avx2ghR7e6zC32WjWd/G7/m7OT5elmNHPFfVI2Awi
         +a6H36V71e+7Aonri2HisN9ywR5zQYiYxMTi7YDMY8sfNXD4MAQFNb4NNjKnDVUD/Rtv
         Zgnbpje+Bh834EKk9eJ6E+phYaTk3e+15M2muAVvyRYxrVxZPnrIhvc+cVlLCn+7bmZM
         ptmg==
X-Forwarded-Encrypted: i=1; AJvYcCW1r+lCdqop6iQ8ecx09DMs53GQpEIh0jm/d2FCCH3zLUKQcGfcjsqIARMDBhperMxILiOSnknCAxk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyowywI5mJS3X/PCoIegcv4Nku0Kkg86faYXFm/zTfAo8Hk0rsK
	4VVTaJTaE9rP5S8z/3gAztNH3af71OxeRp80QJsBMK7rVP93SZyNAspY7BUZZQ==
X-Gm-Gg: ASbGncvUjtB9R7B4TIlMpZ1j5c3vV9dh3vXS5nqKGaHUTfvHVj5JWPDeb2rod68qb3s
	FdW5KiPrPkk4LAXjHSsD8d5fwehyt1Yi3ZaRfi2hivOvNZ0MnLbo0iaFv4y5pGMi8lBzHjNEfPt
	8ccb0QT39T2CkhwMcX1tt7pPb3PhOxHh78i03Qm7VbAUm5Bk1rfC/S9dvgsb8nzzcu+ZoEgeZgc
	q9pjEJPRoTspkNjD9KPokh/2jA8nBVeqCb6POnqb32M5zmuQSzvlPCM7ZSdfG9IrthTbDqwa81P
	yxiB0fwYCa7Q9HN+0o7JYGaf2psJhEKMBw+8hlQZmpOHcvpRtBpiLenuat3O62s2xZb67+0cFwP
	uoZTJDJI3DzaO0lh75zlw7B5s/kKMvWgBD9pv
X-Google-Smtp-Source: AGHT+IFZ2sqk6xq36aEbJGk2UL4LcptumihTR160i108p3SH5xk+Wa1IkpsxBjz2ADR0uk/VpR40aA==
X-Received: by 2002:a17:907:74c:b0:acf:b9b6:9608 with SMTP id a640c23a62f3a-ad1fca0fd60mr1587459766b.9.1747064481499;
        Mon, 12 May 2025 08:41:21 -0700 (PDT)
Message-ID: <03caed8e-91fc-4bfd-8623-d5a2efdaadbf@suse.com>
Date: Mon, 12 May 2025 17:41:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/15] xen/cpufreq: move "init" flag into common
 structure
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-2-Penny.Zheng@amd.com>
 <26067708-2854-4493-8801-d0fb709242d0@suse.com>
 <DM4PR12MB84516D714BA53A40978B96F8E1892@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84516D714BA53A40978B96F8E1892@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 07:33, Penny, Zheng wrote:
> [Public]
> 
> Hi,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, April 17, 2025 11:12 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v4 01/15] xen/cpufreq: move "init" flag into common structure
>>
>> On 14.04.2025 09:40, Penny Zheng wrote:
>>> AMD cpufreq cores will be intialized in two modes, legacy P-state
>>> mode, and CPPC mode. So "init" flag shall be extracted from specific
>>> "struct xen_processor_perf", and placed in the common "struct
>>> processor_pminfo".
>>
>> The code change is certainly acceptable, as being largely mechanical.
>> However, the above doesn't explain _why_ we need that change. There's
>> probably a little more connection that needs making between that's there and what
>> you mean to add.
>>
> 
> How about complement the following description:
> ```
> Otherwise, later when introducing new sub-hypercall
> to propagate CPPC data in commit "xen/x86: introduce new sub-hypercall to
> propagate CPPC data", we need to pass irrelevant px-specific
> "struct xen_processor_perf" in set_cppc_pminfo() to just set init flag.
> ```

If spelled out in more abstract terms, in particular without a forward
reference to a future commit, whose title may still change, this may
then be okay if added.

Jan

