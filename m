Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D8483BB49
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 09:05:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671357.1044654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSujf-00036f-82; Thu, 25 Jan 2024 08:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671357.1044654; Thu, 25 Jan 2024 08:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSujf-00034b-5E; Thu, 25 Jan 2024 08:05:19 +0000
Received: by outflank-mailman (input) for mailman id 671357;
 Thu, 25 Jan 2024 08:05:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSuje-00034V-30
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 08:05:18 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79f3c7e1-bb58-11ee-98f5-6d05b1d4d9a1;
 Thu, 25 Jan 2024 09:05:17 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-51005675963so4334472e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 00:05:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a13-20020a056638004d00b0046e6a6482d2sm4465850jap.97.2024.01.25.00.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 00:05:16 -0800 (PST)
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
X-Inumbo-ID: 79f3c7e1-bb58-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706169917; x=1706774717; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EQfWqoPL3Zc4FUHGRm3o67KgNh0b/gQtidd9nh9cEh0=;
        b=C+TQHLoy45AbBYnsTWjNvwT1zjMpUTbu8FXSnYGTl4vmtVoHz0wigtzeOTJAthQLFV
         w45zwj+lt7lYaqkz2oPyrq/JkqSuTBn46p9IT4E36sck8/FHpjlb92/ODgy9U/jOpToj
         TQT69M2KczMOns5hWP/nUjqnhDhVU4/s8FwLZOMhLDr/Jrbc34a2swFUO3Qd5MyvgHGD
         vUr9L+7oPXlpV94BjCwmcQ/kon31fGqvC7KMHMG6IHPNj8p0H636y+IMcsKzehNVGRz+
         EeQ4Ytf/wYYYuQ+pkq1fsR7cnp5WdSJ+Owd+6IWjRucTMpmGoZps7Rc9uuhD9UBYeWUk
         uVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706169917; x=1706774717;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EQfWqoPL3Zc4FUHGRm3o67KgNh0b/gQtidd9nh9cEh0=;
        b=q2VjCavORtQv6+TRJiYpOFJqfGiZa6eEU1sniChplj6CA5Gv4vR02L/OMzHBWcWZmX
         aR2iB9pSdDj/hkbvDy8qUR0k1Xo21KaFIEt+ZZjF46shyT9PimR9EtlakvUZJLAeG7wj
         Xrpl4Mi9kwK1WoWEQAc9JAA5Ekqt/PUa1bgYsdckXFv/KKdGcB3IG373SCBb1E5vFmLD
         Gq3iKyrTu1F/m1YtJotQhpqifzp6snUoUiU+Mh3GLq6EJ04Od6i62mi8A+29V2OmOsTT
         c4vqiEXm3jYWNGVJ6qELjnKl08jZIzPu2jI6jrI6C3GGloYXJ4IiCwzmoygpudhShRue
         hWQg==
X-Gm-Message-State: AOJu0YznFTnw5yUQAZXWaWA2RvjXYcuPRzrSkiNbiuBDUExR8CLo1OcD
	lRi4lztHdD/K+xDqFgKe/lbIZrJ9FXd6fO7/li4uhaOzeuOdQtO3M/KhnnySvg==
X-Google-Smtp-Source: AGHT+IGxRoI/Itr3WhBPDTbfxIl1BcuTg/+DlpWQ0RmmWch3QKjBwlYmR7e+8TNWCas7yDzSX/SqLg==
X-Received: by 2002:a05:6512:3603:b0:510:12f4:ea36 with SMTP id f3-20020a056512360300b0051012f4ea36mr153853lfs.125.1706169916807;
        Thu, 25 Jan 2024 00:05:16 -0800 (PST)
Message-ID: <c8f3e7d4-8b7c-4835-b63b-dc784f27a936@suse.com>
Date: Thu, 25 Jan 2024 09:05:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/NMI: refine "watchdog stuck" log message
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <87108f1d-4b13-4c1e-9432-4f14d4f5c12d@suse.com>
 <add9b6b3-cc50-4165-8f63-cd4541a3ba23@citrix.com>
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
In-Reply-To: <add9b6b3-cc50-4165-8f63-cd4541a3ba23@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.01.2024 16:55, Andrew Cooper wrote:
> On 24/01/2024 3:21 pm, Jan Beulich wrote:
>> Observing
>>
>> "Testing NMI watchdog on all CPUs: 0 stuck"
>>
>> it felt like it's not quite right, but I still read it as "no CPU stuck;
>> all good", when really the system suffered from what 6bdb965178bb
>> ("x86/intel: ensure Global Performance Counter Control is setup
>> correctly") works around. Convert this to
>>
>> "Testing NMI watchdog on all CPUs: {0} stuck"
>>
>> or, with multiple CPUs having an issue, e.g.
>>
>> "Testing NMI watchdog on all CPUs: {0,40} stuck"
>>
>> to make more obvious that a lone number is not a count of CPUs.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I'd forgotten it was still opencoded like this.
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>,

Thanks (Roger, also to you).

> but if you felt
> turning this into using a scratch cpumask and %*pb then I think that
> would be nicer still.

I expected you might say that, and indeed I considered it. But then
I wanted to keep code churn limited. The way it's done it's imo an
almost purely mechanical change. Much like with Roger's consideration
of further refining the message text in the error case.

Jan

