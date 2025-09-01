Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1441B3EB7E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 17:52:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105163.1456122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut6pf-0002QR-NO; Mon, 01 Sep 2025 15:52:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105163.1456122; Mon, 01 Sep 2025 15:52:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut6pf-0002OI-Ji; Mon, 01 Sep 2025 15:52:35 +0000
Received: by outflank-mailman (input) for mailman id 1105163;
 Mon, 01 Sep 2025 15:52:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut6pd-0002OC-FX
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 15:52:33 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab3d8fa5-874b-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 17:52:31 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-61e8fe26614so2533114a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 08:52:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c775fsm7582253a12.4.2025.09.01.08.52.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 08:52:30 -0700 (PDT)
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
X-Inumbo-ID: ab3d8fa5-874b-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756741951; x=1757346751; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rYLyisd9bmPMm7TCrLfdkb3IkCPhuSy+bd/S5yno8yc=;
        b=Nn+4zdbmK3xkKDH5ZZhLU0d8U5vsImmagzG3dNsLWdqam6UQRJeflBWCFK/JpNXyf/
         Gs52gvse4lGhemsV4Gs9a+LvVkp7sPzbfdZF2vfk+sIiYUIt6+Y0ZeBogfy2LbBGUdL3
         t3FOvj65n+xMagJdHvgg6q17HVnekm/146d0uU2gv6/QRqEUF2nsQZKVOwMq03OItf80
         r7mttqlaR+HA+dTPOYG5IO7eRatIz00y9cNPtaFHRxe61LrxVnAB85twN1oziBGg6G3D
         eyG6YDzGHGn7wm4Z1tjw5roYJ5QncIo6f98WYU4ML4Xjbj6npb1wNu2A0lbyri3ZVpbq
         FlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756741951; x=1757346751;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYLyisd9bmPMm7TCrLfdkb3IkCPhuSy+bd/S5yno8yc=;
        b=rmMqNREqPEFj3OE1xeQRvd9X7SxlaEPovjFcQUjIbJw0fUmzoab1LoJecXSDOVArEr
         zFSOC00B5a9ErEdJx+rqOM25YMuK3yCWFEIXGtTQTXT/i/QII+Y53lEpquZnbN0AiiH6
         tMD24Jul/N1H+whPaaMg7zyj6ZC1RV0s8HMJ+/N41DtA42cD6SMuSvIMEQScIq8SaAap
         WMmohdPtt39FyP+pf7m7aHmYkzhqAo4TNrzZwrzydO2DPL0+3lwutrFwKNe3BS8rSzkJ
         fbwG3dfGd40t+eojMDAwAgp1gYjbaOfBhKBipbGjrdAttgiSjFfXgkRKYL8A+L5q8hQK
         iRUg==
X-Forwarded-Encrypted: i=1; AJvYcCXfJZqp6QJ37jcgdpEoLg60LQBEIpufmWZAotR+1Nvi0LUXVListloUloeQbELJ/FBi2tVSsPZ43EA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWsOeJB1qNLDex5Ffm4rNNp333IowQxoyqajkeT+ksZqk1+8cL
	O+3ancETa6UCVD8SgpbB9e/WFEdv12lDOoQIm1j1A18fKA7bHqu0g4yK+IYYiTEMAw==
X-Gm-Gg: ASbGncvMI/d6qwr5hNg84JzaDJxEcgRX4wCiHq474V1nFfdIT23kkLLt6YMWV6DRH8e
	cg0FADYBIV5sgpAYttpnli5soSl/ady5VyiQL+tkkeYoYruhKHwqiEfqCWWnxYkF3nd7d4DmcFy
	V8KyF9fpRGflz3fhKdjfbg/qutqKI8nZlQNg/OB3AHqP4ahHy5kJ/wcNOmUcJswiR4H+qSH+4kz
	21UaeLtRvrR4+AzSKnwExqYM41PoFHpDBF7uKfqNceWPjOm8vDqbDz7z51EzQXLWjD2J7eIemL7
	bTOxYsF4oWdQNaVnpuJY1FLxhVA2fPPZnNHZeoWKyvE/sAOnsHseh8h3kpgTxG5nY0Xdle3bKir
	DHW6luV26J6lVBHLr8BOctK7ka7udfULRs3mmqzqxnbKuw9/Fu0ZCajsFrLHlbfNkIWxStAKVMR
	77psbbNiU=
X-Google-Smtp-Source: AGHT+IHRawh4zG+e4nfwX3uF1okGQnJjaQq4t9rpRDxT/TXijxTm1iO4ny3U+6tbR+9/1eubElm4ug==
X-Received: by 2002:a05:6402:5210:b0:61c:9852:bbb0 with SMTP id 4fb4d7f45d1cf-61d26c3e514mr6521655a12.19.1756741950871;
        Mon, 01 Sep 2025 08:52:30 -0700 (PDT)
Message-ID: <9695f099-456c-4ec0-9eaf-847134823353@suse.com>
Date: Mon, 1 Sep 2025 17:52:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/9] docs/x86: Introduce FastABI
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1755785258.git.teddy.astie@vates.tech>
 <64800d22220f31bf052713ce61ecedeaa8a36b6f.1755785258.git.teddy.astie@vates.tech>
 <2fcdb264-15a3-47f7-915d-83d1c1e06765@suse.com>
 <c5e62944-d519-4931-af20-1a737099148b@vates.tech>
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
In-Reply-To: <c5e62944-d519-4931-af20-1a737099148b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.08.2025 15:59, Teddy Astie wrote:
> Le 28/08/2025 à 14:35, Jan Beulich a écrit :
>> On 21.08.2025 17:25, Teddy Astie wrote:
>>> FastABI is a alternative ABI designed with performance and coco-enabled
>>> guest in mind. It is register-oriented instead of refering to C structures
>>> in the guest memory (through a virtual memory pointer).
>>>
>>> It only focuses on kernel-side hypercalls, it doesn't aim to provide toolstack
>>> operations.
>>
>> And even there it excludes certain pretty relevant ones, like many of the
>> gnttabop sub-ops. As alluded to by a reply to an earlier patch, I don't
>> think having an ABI for just a subset of the hypercalls is going to help.
>>
> 
> Many hypercalls are missing in current RFC, including the grant 
> map/unmap ones.

Yet the built-in batching that these come with would make it particularly
interesting to see how you envision to support them without needing to
access guest memory. (I simply can't see how that could work.)

Jan

> But a part of the idea is to still having some 
> hypercalls out of scope (mainly legacy and toolstack-specific ones) to 
> reduce the complexity.
> 
> Teddy Astie | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech
> 
> 


