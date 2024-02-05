Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1688496C3
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 10:40:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675739.1051165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWvSF-0000mD-P2; Mon, 05 Feb 2024 09:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675739.1051165; Mon, 05 Feb 2024 09:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWvSF-0000kU-MQ; Mon, 05 Feb 2024 09:39:55 +0000
Received: by outflank-mailman (input) for mailman id 675739;
 Mon, 05 Feb 2024 09:39:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWvSE-0000kO-Fn
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 09:39:54 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83b1ebc9-c40a-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 10:39:53 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-51025cafb51so6276957e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 01:39:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ay2-20020a05600c1e0200b0040fdb17e66csm2725405wmb.4.2024.02.05.01.39.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 01:39:52 -0800 (PST)
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
X-Inumbo-ID: 83b1ebc9-c40a-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707125993; x=1707730793; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HFtPtIsiMgcY2W79MV1g1dHWCE1ow2sFdFokur2UR5M=;
        b=NuyMVVS20DbhxKU4FXC+GxRBjiF3vGGP2zfgu77he2zya1JX0uFdeik/DOi8eJL0/6
         zhAm1bvDSdRGaWHJrCfGucxwGhxH0otOi08yQwc+YI4Gb56pqwQQ/ce+8UD2z948VK9k
         BX32diXVryARbqkEjeHTCHAPp+SFgCVGHPuJVNW6n65NU9uRswzxQgMnzsmV4gWtSQzq
         8zc1SG+4aTfg5D0l2Q/5pYnL2C92PGfmg4WeJI7/brp/yDDXqnZo3thagazQ0TzVicHq
         5qihbzEyhs3O/0KG5WgobKpvjmOk/KEUopEsYdPGgzaYFBjQxshA/m35TS05V1bzSidw
         hnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707125993; x=1707730793;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HFtPtIsiMgcY2W79MV1g1dHWCE1ow2sFdFokur2UR5M=;
        b=r+gVS+kc0S5PKJgqipEyvMnw5fSw7kDUWAjqN5XwCaAYPl4KLbm/tEkxKB64qoz9fr
         GYtAdpH1TZbejiVuuEupIl4PT4zaeQkdu0SeF9Zg7ByCqt5O71aW4/J5aLrG578+NDu/
         hTAuSJ6Hs5an2J4cUxxYAMycowXDj3B+0ZaggTFxAnfuYnjulM1etVK5OKYCWijsBQ+4
         sa9HrCNAgyswj7sEMrfAl8Fp3IIYzMigLlu3vZx3zgVZdR8/M3CR1kkDIcTgaaoBMQTy
         OjnwZmlpWGFS8wcjCtRDDnKQwdZWv9/1lKv21IQy5vBdLJwuKdrpT28iwO8tIy2EblcP
         gn2Q==
X-Gm-Message-State: AOJu0YzuJf7iFuKv0Xkh7c4Q+pqMblsr0u52v5F8ZddSIToV5EMryffu
	Qak68n/u5Lz5QkmHcyRKldAnzBoSi5H7wu8KU8rrGMhHWhZrllGlrZKL8JFfpg==
X-Google-Smtp-Source: AGHT+IFQXeyjawxy0vjE4cMv5Sg+C7Z38vPKSwitDcAxSdyAcT+fN/Cntt4BeyMCVqfFbQxHtl+E7w==
X-Received: by 2002:a05:6512:31ca:b0:50e:7c70:f8da with SMTP id j10-20020a05651231ca00b0050e7c70f8damr6378955lfe.16.1707125993015;
        Mon, 05 Feb 2024 01:39:53 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWRFRxn6duz6IXN0MpPZ+hOwnG4yqPpZahDgctq4h8oZrlpcJaH7r8iEXuGeAzjNo7QO36jt/dFRcwLUUtU+78RGcVdndBpoE9hFvIZ/1klDWNVVJ/XxJZLmBLmvSNmZ8WUP7gyXI5vx9fo/Jymdm2Fx2/9CY8d41nwDz4KJbEFkKaECRhgqqz5tl7oghXYehOpyzNMoI7e4ZqMHES/VaumDOLoFtiblAIg+RPIYkMe72eng7a5xAPKJRnRvB5SSFLW/K810HU7AwNPMCgok1WZUqa1piZ0oJajzKkN57BfA9KC3VXW3nTg3wWd5Z9EjlKZKW3LPhlVYubXUyluzsEepTabye79R1qVt7AKO9Tng+IQeRnzgX04mHaJNdjrleIYpQ==
Message-ID: <26815df2-bfe5-4767-b1a6-94666e535f4e@suse.com>
Date: Mon, 5 Feb 2024 10:39:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/15] xen/arm: add support for cache coloring
 configuration via device-tree
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-8-carlo.nonato@minervasys.tech>
 <a6ffb4a5-cd83-4c04-9e5a-12d605863b5d@suse.com>
 <CAG+AhRUG8nNF0cTtFYLu1TrV4fWEbix57Ah_-Zsz=U2yRWcGpw@mail.gmail.com>
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
In-Reply-To: <CAG+AhRUG8nNF0cTtFYLu1TrV4fWEbix57Ah_-Zsz=U2yRWcGpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.02.2024 12:43, Carlo Nonato wrote:
> On Thu, Feb 1, 2024 at 3:19 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 29.01.2024 18:18, Carlo Nonato wrote:
>>> @@ -950,6 +951,11 @@ void __init create_domUs(void)
>>>  #endif
>>>          }
>>>
>>> +        dt_property_read_string(node, "llc-colors", &llc_colors_str);
>>> +        if ( !llc_coloring_enabled && llc_colors_str)
>>> +            printk(XENLOG_WARNING
>>> +                   "'llc-colors' found, but LLC coloring is disabled\n");
>>
>> Why's this just a warning, when ...
> 
> This informs the user that this configuration will be ignored, but the DomU can
> be constructed anyway...

Yet that's a violation of the principle that Julien had outlined when
discussing whether to panic() in such cases. The property indicates to
me that the domain ought to be run with coloring enabled, i.e. not much
different from ...

>>> @@ -960,6 +966,11 @@ void __init create_domUs(void)
>>>              panic("Error creating domain %s (rc = %ld)\n",
>>>                    dt_node_name(node), PTR_ERR(d));
>>>
>>> +        if ( llc_coloring_enabled &&
>>> +             (rc = domain_set_llc_colors_from_str(d, llc_colors_str)) )
>>> +            panic("Error initializing LLC coloring for domain %s (rc = %d)\n",
>>> +                  dt_node_name(node), rc);
>>
>> ... this results in panic()?
> 
> ... while here we can't continue because there's some error in the
> configuration and the DomU can't be constructed. Domains must have a valid
> coloring configuration.

... the request not being possible to fulfill here.

Jan

