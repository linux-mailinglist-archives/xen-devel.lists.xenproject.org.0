Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB93BC6DFDA
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 11:30:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165720.1492417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLfSN-0007lC-5x; Wed, 19 Nov 2025 10:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165720.1492417; Wed, 19 Nov 2025 10:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLfSN-0007jX-32; Wed, 19 Nov 2025 10:30:35 +0000
Received: by outflank-mailman (input) for mailman id 1165720;
 Wed, 19 Nov 2025 10:30:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nJND=53=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLfSL-0007jR-Pk
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 10:30:33 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c65d0ebd-c532-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 11:30:31 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6418b55f86dso10532004a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Nov 2025 02:30:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad4635sm1588751866b.26.2025.11.19.02.30.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Nov 2025 02:30:30 -0800 (PST)
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
X-Inumbo-ID: c65d0ebd-c532-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763548231; x=1764153031; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jTS4Im0Sg+nrKJf1Md2EMB2alv2JVlFEjAtTpF9/yxE=;
        b=FS6gQhpnX3z55VJWNLfgfaOgTHib9kWCgBh5DGapqa6/qQ1yf8zYhHxP8BwP3VN4kp
         wySUxez6OMMHZLodoAMKAZ9gA/MM2EgSnkPkDYlf03vvC5iUm+cVLg8ZrvP1R1lEP18U
         B0sOqLeac0He6FlOqh3gdvRGtzz8E2RkOxrqAMuxbw0TxfH4ISuq2mmXLlzhg2qC7rTK
         mnSLW8wg36DSgyTGwcWdRzgJhwEAzjDoMMygFzOZO6YEHk/oLntmUeCDmz68dV1WzTNx
         9Zf81CHXdTMFebOuq1CCX99G+NADFyaIGTvt6yUr1nBp/GZ3qxt4TACP8lMVdum9eF6u
         KBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763548231; x=1764153031;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTS4Im0Sg+nrKJf1Md2EMB2alv2JVlFEjAtTpF9/yxE=;
        b=sElmhb9ZvZLCMzHN9oTfqAjdDKOGst9RI8EsjAS7kCV4Xl+dV6usY6m8CcBhQHy8yx
         TgA+feftcu6ecW8YF4YrnQtF2Vmdl0YPvceHp3k62u4dm9PfFLnQvYouVImXaCly9oHG
         E+dvAtHYMlbnUDbp5f0drSn7xwROcmWr54TqmOb5F5Q9Cjkil4Zcm9QI0s4KCJvT9lcC
         O0WDrRj29AHzM1tVAmzWOo34kbx0aXKMjOUEBzUn7PGkqzN28OTe75xoYjlQ7wXs0Kx3
         Z6spj5SLi99TaL/6IK6NGr+mE2YYDEgGC2JEglKnRRpRHJZyib3ATucXnu4QlhVC+Igb
         bVlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKRqlrX7hXBoPjZsg1RGBifYrgebyHpwhG9Dd311XTLLJcBlC5voE9onBNT1hKFIOOo05CzCKRhSQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLrhrnM+vr0tKSlAcvt3M2Lwdo102j+g7lMpCRvNU1duADjTwo
	mC3xcAnep7uGDgXCJ+QYhLr1vyaP2oSUaevwUAdSG5XMRjY9SmItl1hNvvGrjmi31A==
X-Gm-Gg: ASbGnctxdgZLvU/13FDOuVgwOPPmr3PlCHDx5BUsc0YpsF7i5q903ZFmwJylMcwuNvZ
	pTqW4yqE+3mepblj1QCmoaTmKJKd+SsOUE2AugNQRJwLfDFg99h7geW7pMf6Seu/ErxiZwNN/Mp
	dwASZpCo4IxqS85K6t3sjtDeopOXe3MWzKpkl9hnRMEi3kol9exQYxFvlLFAlTqHtMxwIAWf/H4
	dNkppQ9LO39+cFOvU5jl3h156UfaTZPLngaU0VvrWBwwLooY+9/xxVa9OPQilOz4k9SAcdq6iI5
	eX+368WjIUmqodml20Hpj7fFLp1+Q5ORBT2MlEmgMeg6z/IHyZhcnUPB4PxvLw/+hI7jIlph0dF
	GjSEiAOx41xfao+zvYYUDWlQz7oAb7ek20bn10GnvNDUh+0WpJgCRhxfBoPlG9HoJqZO3prlhpf
	y/J56ZJwb6A41N+la098/TusOz4HUg/GZF++fWemKkV4AnR/pE8P4RykYkYLKJP6Cw+2RaZBclp
	zPGbSRxn7O+UBXNFcAjFkc726O+3C06QWw=
X-Google-Smtp-Source: AGHT+IHhUAItv2Ihm0FhDkPpUn+rz5A1BoSOdh6GktkOZ8tjTslVwS9KFQ0J3lCbie1ybcGaXd4jjw==
X-Received: by 2002:a17:907:72c9:b0:b73:a1e3:8de1 with SMTP id a640c23a62f3a-b73a1e39018mr1159686466b.15.1763548231013;
        Wed, 19 Nov 2025 02:30:31 -0800 (PST)
Message-ID: <92c0d9cb-2350-416f-b10d-22d10f3a1021@suse.com>
Date: Wed, 19 Nov 2025 11:30:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] amd/iommu: Remove dead non-atomic update checking
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1762961527.git.teddy.astie@vates.tech>
 <b0e81bd67c3f135a4102d12ed95a52ce56482992.1762961527.git.teddy.astie@vates.tech>
 <367dc942-7113-46cf-9c54-fa77dc6b4c53@suse.com>
 <f9193b72-dcb2-4140-8b6b-46e7b509ed1b@vates.tech>
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
In-Reply-To: <f9193b72-dcb2-4140-8b6b-46e7b509ed1b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.11.2025 11:22, Teddy Astie wrote:
> Le 13/11/2025 à 12:39, Jan Beulich a écrit :
>> On 12.11.2025 16:37, Teddy Astie wrote:
>>> When updating a DTE, amd_iommu_setup_domain_device() would check if
>>> the update had been non-atomic (i.e rc > 0) and throw a warning if
>>> such non-atomic update could be dangerous.  However since commit
>>> 3fc44151d83d, rc can no longer be positive, making this branch
>>> unreachable code.
>>
>> I.e. it addresses a Misra concern and hence ...
>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>>
>> ... wants at least an Amends: tag, likely a Fixes: one. Then:
> 
> With :
> 
> Fixes: 3fc44151d83d ("x86/iommu: remove non-CX16 logic from DMA remapping")
> 
> ?
> 
> As it is the commit that removed the rc > 0 case.

Yes, that looks to be the one.

Jan

