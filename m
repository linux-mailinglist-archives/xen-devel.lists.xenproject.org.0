Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4E3A7A006
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 11:28:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936411.1337666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Grs-0004JN-DI; Thu, 03 Apr 2025 09:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936411.1337666; Thu, 03 Apr 2025 09:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Grs-0004HV-Ai; Thu, 03 Apr 2025 09:28:12 +0000
Received: by outflank-mailman (input) for mailman id 936411;
 Thu, 03 Apr 2025 09:28:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0Grr-0004HP-Fw
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 09:28:11 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f493f1cf-106d-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 11:28:09 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so576972f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 02:28:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301a6796sm1296979f8f.31.2025.04.03.02.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 02:28:08 -0700 (PDT)
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
X-Inumbo-ID: f493f1cf-106d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743672488; x=1744277288; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WbHficwKeEUZee6X6aRVG/cBQmmbqxXJlSiN6zVTZXI=;
        b=QjxHWAIPbWryrb7wEJourzM7OrZrQl9IS94sUolJUFr6mjwV2zef6EDsAfVSPYAwZV
         yAVFK2wC1Z0J1Utb1mvwM0mwE/jB73cvp8zowV/6gYk2m8X1zdYFr2TtLB9OuWn338lN
         eV/myBfUlT+j0lmogpQuaOA0A9pZbNvGTmX5o4U8qpp6TUaZ9MbF3PjuOh2v28m6+rbL
         AzMRCrWyfP0EjIGfIBnGykHLDCuKhCJfiI6zv91bOocoCC+VsDPJou0xX3CmRqV6yGP8
         +vFnnPhWf8ynIcIUlVFmw01vlJwuJtubXblRRNcifGc5NVTzEN3nSHrYe3MAfJ5AWTOb
         /LUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743672488; x=1744277288;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbHficwKeEUZee6X6aRVG/cBQmmbqxXJlSiN6zVTZXI=;
        b=JFAB9jefVT/sYWnVxr1kzvDx4INIorRpFzeCZAS31X+U7WCKnN6/hEMQN+3OGBZf65
         2RNBnvabVua7uhPkzBc0sWrXF9Ba/EBs5uQsVR5f/kWKHCZF95fZpfjHZbnhU5QK1plJ
         McZwLpOGoVh1EPqGzZ/dYDjqQ2dmx74nP9itQNgVjtHUhfWv3Ya1bEXWEYss0tCQ/+Li
         lDlwv0LorSQwe5D4UP0usdm8TkRufu6ti+D1WKghpequ4Z/YBtbziGMpl0k3eLY4PjQC
         FpNhg3PKyj0nr/h/NT/5iFzVjgmD1fmgAfcLJ6Pwip/1U+Gxryr/hd5ypUCFCMATuIy9
         kK6A==
X-Forwarded-Encrypted: i=1; AJvYcCUMwrJa8Hu5BYlNnFuQc/vyEow6rpfkTwXZoH0nmdO3rII+BOc4qrCYZHBXZwRNnGU/juvWkGKgIgY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtGMmberkGldvQcyUpLQTZfUWT4LZCF+TjS8+bL5xzvyf3or8H
	NTnISW+RUosskI0468P7/vS8UzmKT0HyHT/LsBxOf6wakkgUKwS4Hjuwn0AnOg==
X-Gm-Gg: ASbGnctXaMeOxMHubPXYZZLcafFAlkbXb7yjWZ0+JYPYooUYtkb0FPVV82TzJryMfPJ
	SI4m3r2Kuw6iSiukveU2o4tWfq+EFYoeLfOg9NUHQ2IJ174UCOXydYnrZJNciHvmBIyn2EgOPHp
	MLGHnZGOKzV+qCkVP3gsU6rlY09AT0b0v4AzIi1HzJkD3Hp+sg15PfS0Y4hjLIGne8buYouaagh
	6FeGc1+Vspg31icyUUB9YeIfSdEYSyM+X2Ff0zNvQtmBqLYPDREvbuITQFqEB+7xndFoGsjvk8I
	qqoCZknyGUrSR3PkLdzxnsX5cCh6PKOQtJOuNV9i+1DayD71Fwne7uxLtNIzM7XKduR+U/8zUMx
	UKlHc2NHrMCstO1bt1CyYOyeOQ2zunA==
X-Google-Smtp-Source: AGHT+IF0+8DTdWAW0eA1UIN28ZWQ4IRGJVaZbYd+nYIRqGbwWpioEqD+K9eJaB62aitdnhfekT5Cnw==
X-Received: by 2002:a05:6000:2483:b0:39c:142a:ed6c with SMTP id ffacd0b85a97d-39c142aed73mr16349170f8f.40.1743672488481;
        Thu, 03 Apr 2025 02:28:08 -0700 (PDT)
Message-ID: <235cb577-b28f-49ab-b0a3-94ab35572d83@suse.com>
Date: Thu, 3 Apr 2025 11:28:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation: Add Arm64 MPU build job
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
References: <20250403081916.6834-1-michal.orzel@amd.com>
 <20ac780b-f5ac-4531-997e-362d72adddd2@suse.com>
 <2a8ab261-480f-4bfe-b2b7-7fdff4516078@amd.com>
 <a67d260e-fe1a-44bb-8b49-fa0509716da2@suse.com>
 <44500161-1346-4c9e-bcb3-a4301c197913@amd.com>
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
In-Reply-To: <44500161-1346-4c9e-bcb3-a4301c197913@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2025 11:17, Orzel, Michal wrote:
> On 03/04/2025 10:58, Jan Beulich wrote:
>> On 03.04.2025 10:44, Orzel, Michal wrote:
>>> On 03/04/2025 10:43, Jan Beulich wrote:
>>>> On 03.04.2025 10:19, Michal Orzel wrote:
>>>>> Just like for RISCV and PPC, the earlier we enable the CI build the
>>>>> better.
>>>>
>>>> What about Arm32?
>>> The series to enable compilation of Arm32 with MPU is still under review on the ML.
>>
>> Oh. Is MPU in Kconfig then missing a dependency on 64BIT?
> Well, yes you're right although when I think about it, it's been like that (for
> both 64 and 32) since the introduction of CONFIG_MPU by commit (in October last
> year):
> 0388a5979b21 ("xen/arm: mpu: Introduce choice between MMU and MPU")
> 
> If you're saying that all the Kconfig combinations + targets like allyes/allno
> need to build successfully also for new ports (MPU on Arm is kind of like a new
> port), then I agree (I did not think about it and clearly others too seeing the
> MPU patch above) although I'd prefer to avoid sending a patch adding dependency
> just to be removed in 1-2 weeks. But I can do whatever you think needs to be done.

I'm far from insisting on a change here; you're a maintainer of that code while
I am not. Yet I indeed think Kconfig needs to have the dependencies right, or
else randconfig CI jobs may randomly fail.

Jan

