Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D80B3DB85
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 09:53:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104096.1455242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uszKq-0007zs-2d; Mon, 01 Sep 2025 07:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104096.1455242; Mon, 01 Sep 2025 07:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uszKp-0007xk-VM; Mon, 01 Sep 2025 07:52:15 +0000
Received: by outflank-mailman (input) for mailman id 1104096;
 Mon, 01 Sep 2025 07:52:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uszKo-0007xe-67
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 07:52:14 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91fb39d6-8708-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 09:52:12 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-61cf0901a72so5614296a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 00:52:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61ded4749aesm2528521a12.32.2025.09.01.00.52.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 00:52:11 -0700 (PDT)
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
X-Inumbo-ID: 91fb39d6-8708-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756713132; x=1757317932; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OhHt4UHlmSfKD3CpMl2L+yj0zfhifc+csgHlsFFcPww=;
        b=gyLmh1KMCRa173mQTfliKSg4DR3PE0yPJomUx1X5ErLgRod+YS7n+UpAWM8MZYaJ0t
         +DvkmZW2x6wSvrK4j+Q3YA+TIeE2j+tcGvqiuYLnLh1X6EY2T4SlfSB+tmr47wPxLVij
         0fvbAM1RKjCqta6mS7s7+BudMgZiBgZObaOsXcOcnxOfZYsUxpZvsHP6qneq01kmZobs
         wFLLtQ2mTRprzpdwhsff+zULs3xUEBJ0f/fzif3L6GGJ9A5733JFCUI623wVWNSGBjbB
         VSjkcn2LdQTamTfugdke2NGx8NTwNTVgVFtXgR7ZWvhG6xBg26Pr5uaC8F1J3ZdAi2Sc
         WgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756713132; x=1757317932;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhHt4UHlmSfKD3CpMl2L+yj0zfhifc+csgHlsFFcPww=;
        b=Umzhw+r13qWyWjYf9OVSRZzu9YJVMC4oopdtWUuidxpBwYxkYVkFx/XNjBCwQWIK0P
         TtJxwVQG05jCKs0C3PER814W3BVoKATMdf7CQPGDlXI+HIXXF1f+n/NrYJHalzQy+Sjw
         JjglhpzC0uS8L62XhOsKyPPfRSlNHjXpZzZxTclmiZyt1LatUpTyOJ/C0F/y2QJo5baK
         2vgUf4f+8q0h3AEmoP4H4T6Q9n9eynSa+J9ketP77i5resu0CiG0pe7CVy6k3Sc2cQsw
         rXVFkfY23Bu1jApJ/QAAZw++zL+823n0jWT67LxlxAPZzW49JUjFIgyIFcJ/py74kdyb
         xNoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2V5xH0mzOEYDcwjzPZI4AsZE4hvC7URG3HEUgUyVZ8yXKDgSrvZapqeEb9t8h5WraHCdZ8S4/nVQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIp1AVhg24SS077tSg968cPbJAqDrjFZbI+kz+okZLc6Czy4Wm
	413ZAJ1IzHmtNVfvhtHTgCVi7zIGM+S19bE0X0BTJsS9ruwMQRWXOv6rWNwI2e4sgg==
X-Gm-Gg: ASbGncsx0JDCfCKhFIx3T00KU2XRhjFHAY5GF6UpI4uczJgIQRpRq9QPZErYIGFt+fJ
	aOVcgj4OFzpeixEWaKPpslDtTosEjTLO0hDP7SCBLDUt/wAOImyNpjgugtk78WWXMCgwlfW9PIJ
	QlUlPGAyGaJ8WCnFI8i0Sv592Krbvk51qIR+13USEtL4NVKeN8B5AIjVHH+RmkOEUWDDWO4CSmA
	I7OY33WvjbSjP3MPC2cz/6iUWz7gwB+uDwUixS/03fNzVBPpCg0ND+DP5B+XHj8xgXPp/H/+kzo
	I3K8alFZIb2wQLtWQ5u+CmwV5NxzA4+a/qby2PyhdAHnBBAbf1GhHNcvQQ4rZwFiUfIVa8Ryur1
	twWbrQYxr2bYSpeQ73tSaOEa4kjVN8iFnSf5druSHHio6oScerzTBFWZTK4j77BiaufGLeHPF7L
	SI+WlzcWw8X8lPVhTC2g6eyIe5TqLe
X-Google-Smtp-Source: AGHT+IEI9fAsBoOnMM8dfOls3p79YvVT6iLwVBUPGftQyEF8U1QtMa87tZ33qUqVvAy7UMcut0fiEA==
X-Received: by 2002:a05:6402:35d5:b0:618:19d2:7251 with SMTP id 4fb4d7f45d1cf-61ea14dffd0mr1653787a12.10.1756713132339;
        Mon, 01 Sep 2025 00:52:12 -0700 (PDT)
Message-ID: <d5c7b24a-58eb-49c7-9b5a-28729b9a6620@suse.com>
Date: Mon, 1 Sep 2025 09:52:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] xen/flask: limit sidtable size
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250822095123.998313-1-Sergiy_Kibrik@epam.com>
 <1797679c-582f-4b75-a036-ad3bb00bad4d@suse.com>
 <1d34d0ae-f3f3-4b25-ae67-6c4f6be2e2bb@epam.com>
 <59e884d4-e111-474c-9794-dcb190de8eab@suse.com>
 <b24cf3dd-2f82-4470-8c6e-1f32e0564cbd@epam.com>
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
In-Reply-To: <b24cf3dd-2f82-4470-8c6e-1f32e0564cbd@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.08.2025 17:23, Sergiy Kibrik wrote:
> 29.08.25 14:44, Jan Beulich:
>> On 29.08.2025 13:33, Sergiy Kibrik wrote:
>>> 25.08.25 15:00, Jan Beulich:
>>>> On 22.08.2025 11:51, Sergiy Kibrik wrote:
>>>>> --- a/xen/common/Kconfig
>>>>> +++ b/xen/common/Kconfig
>>>>
>>>> I wonder whether we wouldn't better move XSM's controls to a dedicated Kconfig
>>>> file there.
>>>
>>> you mean something like Kconfig.xsm in the same common/ directory? Or
>>> move this Kconfig out into xsm/ directory with the rest of flask code?
>>
>> The latter would be preferable imo.
> 
> then it probably will have to be moved outside Common Features menu and 
> into the main configuration menu, while having 6-7 items. Is it ok to 
> keep such small submenu for that?

I think so.

Jan

