Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDD49E8E0C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 09:56:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851057.1265209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKZYD-0007yF-OC; Mon, 09 Dec 2024 08:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851057.1265209; Mon, 09 Dec 2024 08:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKZYD-0007vO-LJ; Mon, 09 Dec 2024 08:55:33 +0000
Received: by outflank-mailman (input) for mailman id 851057;
 Mon, 09 Dec 2024 08:55:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKZYB-0007vI-IB
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 08:55:31 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56a1c995-b60b-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 09:55:28 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-385e87b25f0so2969257f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 00:55:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef4600d14fsm7440557a91.45.2024.12.09.00.55.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 00:55:27 -0800 (PST)
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
X-Inumbo-ID: 56a1c995-b60b-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733734528; x=1734339328; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gKu8jIF81IdEzzup9N3m72LnSHXp6igxpM34Tbn8zvE=;
        b=cD9xCPkl8IiFf+XCuBzSz1mHik6MWn4Xb5//GHBKPJhabEEFIB9RP++7QhjlEfGt68
         Db34n0HHxGPPahcuzAn+9kd7fVwN22G79/aWlWr0A6LuLq/OkYD7nmwBzYbaMLUy9TfP
         s2pUNGwD4uTTcp9JiCVlS847LoYebvmexlNk6G2kMal9bOe6cOSc6WLn2gIYvAtJZPV2
         1l9GVbPpDl9vRmx53UWJVxCN8T0hdP/OQxCvDyquZXhJQonXJ8ILDumGQ1vpoX8Y4PT2
         MxvElLPA3LMO814SiRjTAizNBXtjbrH7HCO/WCQummdoFR4vUoB+U6bmRvMhhoYV45q6
         tNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733734528; x=1734339328;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKu8jIF81IdEzzup9N3m72LnSHXp6igxpM34Tbn8zvE=;
        b=lOKHkVgZmBf/yVOlwRj2QltNETDT21G3bzGQNDolBa/ZYL3MIuXzo1mdM9TAskh/Av
         zJ7peey3GYv4AjwnH1VjRBH5T2IUyzbMZBV2UL85gEvcGKRlQZlfCXyK/oGO5HJihNrJ
         JzX0RcLCpbN7ykfv9RTNt6fPup7eyh9v16XzmUZLQ0FJ4aUu6aL3YapwyKN42POUlGQX
         CrhUerQKbp46hDRzXiUbBnoDfqkXoJz9KWFA7Bc7RTAkMUR3tI3uSDYdKmn3KKLuqCma
         3WWj2qn6pMpW0Ic2Ll3hAJbWTydSDENRS2ys+OdAPWhfJAt/XK5i+kV8QAs/2IS5uYBF
         jUJg==
X-Forwarded-Encrypted: i=1; AJvYcCWm1/ipLF6ad+AAhUwpD2VtbR9QQ/9WIQiew5cIjBqjUPPj4+eaSEbkI2v/OOwGnUy4lseTmvM3unY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6Dza45w+jDE4+a/36gYDSR91u4clPggKNkKzrmvO3AMkx7zLN
	6aK/Om1L21k5p7JrgAYdY8CTk1M7tmQdBbFCehM4gRNswoJScu2yIIptNxZV3w==
X-Gm-Gg: ASbGncssvpaEX3rx94kEplNRXEQYthsIX/4TcDOYgpRJzV6rKeGwMm2UPlrLgciv6X4
	yEQZORQAX9iGyX0f5eS2ConaHsBYqLtmYsOeQ6ALJH49Z2TPXeXRAMWyHWfU92kRnSqlkLZB5iS
	4j7L+8plpq+vB9i6ry/EZ/HLVqRWXN6lU2VGihBBYk6EEsYjuK3jEYxhIBqJZYZdupPqr5LfFYV
	tDlsx3+aJuAiyxYDAgaqSIZQwq4S0uFhlxiwRr4TLzMahTnnmKUz++2EpZfmlzae5iHyzWPXd3V
	mlTJoBeBzaNeEmRLAzd3lkNjMLNUxcVx4J8=
X-Google-Smtp-Source: AGHT+IHjR4jLu5DeaQ/1dilEB8XCModuXFf5dD4Hb05m/I/JOwjPmLMd5m+IjWuYrDArvOVbjvKqAQ==
X-Received: by 2002:a05:6000:1864:b0:386:42b1:d7e4 with SMTP id ffacd0b85a97d-38642b1dab8mr866272f8f.19.1733734528233;
        Mon, 09 Dec 2024 00:55:28 -0800 (PST)
Message-ID: <7f40d7ba-26ec-4301-abbc-aef5d1ade44c@suse.com>
Date: Mon, 9 Dec 2024 09:55:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/6] x86/boot: introduce domid field to struct
 boot_domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
 <20241115131204.32135-6-dpsmith@apertussolutions.com>
 <bfbd15eb-9888-4988-b9a1-8191a696a4c2@suse.com>
 <83e3b0a9-e0e6-4d36-a3ce-4687b1886733@apertussolutions.com>
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
In-Reply-To: <83e3b0a9-e0e6-4d36-a3ce-4687b1886733@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.12.2024 17:45, Daniel P. Smith wrote:
> On 11/27/24 05:32, Jan Beulich wrote:
>> On 15.11.2024 14:12, Daniel P. Smith wrote:
>>>       init_dom0_cpuid_policy(d);
>>>   
>>>       if ( alloc_dom0_vcpu0(d) == NULL )
>>> -        panic("Error creating d%uv0\n", domid);
>>> +        panic("Error creating d%uv0\n", bd->domid);
>>
>> Imo this would better use d->domain_id. And while touching it, %u would also
>> want swapping for %d.
> 
> hmm, I was actually considering s/d%u/%pd/ and just pass in d, but was 
> certain if there was an explicit reason it wasn't used before. If I am 
> going to change it, would %pd not be more desired here?

When writing my original reply, I certainly considered this. The anomaly
here is that you really mean to log a vCPU ID, which would require a
struct vcpu * and use of %pv. Yet you don't have that here, precisely
because the creation of the vCPU failed. That said, since
vsprintf.c:print_vcpu() calls print_domain(), using %pd is certainly an
option here (inconsistencies would arise if %pv and %pd presented domain
IDs in [perhaps just slightly] different ways).

Jan

