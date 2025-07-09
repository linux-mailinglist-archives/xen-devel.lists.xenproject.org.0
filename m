Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 160ABAFECEC
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 17:00:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038362.1410848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZWHq-00042a-4x; Wed, 09 Jul 2025 15:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038362.1410848; Wed, 09 Jul 2025 15:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZWHq-0003zX-1g; Wed, 09 Jul 2025 15:00:42 +0000
Received: by outflank-mailman (input) for mailman id 1038362;
 Wed, 09 Jul 2025 15:00:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZWHo-0003zR-EF
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 15:00:40 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79f51610-5cd5-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 17:00:39 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-454aaade1fbso63588205e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jul 2025 08:00:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8431e12csm141812615ad.5.2025.07.09.08.00.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 08:00:38 -0700 (PDT)
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
X-Inumbo-ID: 79f51610-5cd5-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752073239; x=1752678039; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Plo5//PIasrUfKaGglFKAZbmoY76cR+fSALhNE4zsAg=;
        b=PXlJlp9k2nW8kEvbIzhcPClVtvQhvcPAhWiF0Xp+fgrJeYI/dQISLE7yWzuKIyyx2F
         IteCrCYEJdXKbNt5T7fronOMVD4qEm42P5JWnSxuNhfTZRua35fOTgk385aO2X/kO6U8
         fWh5k5PJdbfkkm2xcBfbwBi5TdbRg4uI1ppnjRBiJxvKBszREYi0uAUnE0F2stCcIgx8
         lKIA0RmKaIX09puHVFbRYA7HTMqIER8gKQKHSWfkuhForEFAYP52Zwfx6p5ojTlEQFL8
         9Mm/UHYMw7dqqxtpNtGmG0hXAv6sMl229C1orGVvOO1uwFvWCqso2yGClbB2pW2o0Nin
         s1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752073239; x=1752678039;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Plo5//PIasrUfKaGglFKAZbmoY76cR+fSALhNE4zsAg=;
        b=xBsvLGUgyLXAkgZ0eA61feAFdE/BzklmosDzed4JjqOXfwKcvZDD3Vm12meaaODG+r
         PXDRBZCADHVDSqQxXJ/66bQ4N41OgZEV8/k1SA2NmuHCdzT+XA9o1FJr/EqhToLxFTSR
         chR1CtXB9dkYpZ5ehPLYwTVKgJOm95fPuMODKW56YN60JM9UsFkhJvH8RtpXgG4SOWl3
         sEo4HjJwgQb2DBw+cVGEFo+dbpPUMpb8WrvXfSUBL5xBZRMS2OYp7qjliKFbEdHqmqn4
         QXNODMHeL89e/TY8HYB5aQIQhh80UkCDeeBoXI+y2YM+CfOIQYTVuqSm92PJ8OaV/VER
         nA2w==
X-Forwarded-Encrypted: i=1; AJvYcCVdds8A79F1HW58EUXvBCLf4tKoehK6LJCr3W23TRmzpuT7h6PnIkqM92FgOpU4OecVOKUedxWp8Xc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOWjPQ++bE3GaQUfiIxPnndmz5MooLUitDL2DAN3EiNyL5JFBy
	8tkt5kgEWoY/MPqla4YelNm35iExW4NllFW2LeTbNankfmaKuHUcyrTmWZLdCu4Ohg==
X-Gm-Gg: ASbGnctTWOWOOsQMNzSzwfGFM1I1BFUPo/YNeShs3XcScQ4yjVkLN6m/r8rRv0cY6rR
	b/2vQu+fVAwW+UcT1GVtdmjo7qE9M+neaMfdVxtcvb+uXOG96+wD3JjeClxb57+0ryo3VDAhF4b
	nrZhuoxDU+svDoEp9C5NpcDvo1BojkYqJZ1jbiMlKJFjPjVAGyvSYw9qAqkIBocDyOuq5Q0dF8r
	F/NfaZ6Qlw4jJUDP939oLqmFiGe4iptKGKgXCnn3H4C7UVMQCZT1P2z3kLsjLxbxc7iGacbKdoH
	AJ6QAfZh7dVlGURz1744FkjZe+PL4wKPp7ViE4VzRCxMTewni1nMi62/RU2P4JcZJm5+lCOH3Y7
	aGg1exNeoAxhi9TSSO0H2GYW1CAup74jke/VSjPwizvuR/3k=
X-Google-Smtp-Source: AGHT+IFjbIxjigSvFK9lyJRuOGk1nVMUgBWtHGrKcKcySlZEh5PUo6V7IxDFn6+ZkE+MRvuYAGUQsw==
X-Received: by 2002:a05:6000:420f:b0:3b4:5a9d:8323 with SMTP id ffacd0b85a97d-3b5e44eb05fmr2556695f8f.7.1752073238541;
        Wed, 09 Jul 2025 08:00:38 -0700 (PDT)
Message-ID: <b58222f1-daff-4f16-af30-54232eb22be5@suse.com>
Date: Wed, 9 Jul 2025 17:00:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/x86: introduce MCE_NONFATAL
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Xenia.Ragiadakou@amd.com, Jason.Andryuk@amd.com,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2507081131060.605088@ubuntu-linux-20-04-desktop>
 <20250708183238.3104638-2-stefano.stabellini@amd.com>
 <DB7FGG6STQMD.3FT6NRT4CI13@amd.com>
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
In-Reply-To: <DB7FGG6STQMD.3FT6NRT4CI13@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2025 11:46, Alejandro Vallejo wrote:
> On Tue Jul 8, 2025 at 8:32 PM CEST, Stefano Stabellini wrote:
>> Today, checking for non-fatal MCE errors on AMD is very invasive: it
>> involves a periodic timer interrupting the physical CPU execution at
>> regular intervals. Moreover, when the timer fires, the handler sends an
>> IPI to all physical CPUs.
>>
>> Both these actions are disruptive in terms of latency and deterministic
>> execution times for real-time workloads. They might miss a deadline due
>> to one of these IPIs. Make it possible to disable non-fatal MCE errors
>> checking with a new Kconfig option (MCE_NONFATAL).
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> LGTM.
> 
>     Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


