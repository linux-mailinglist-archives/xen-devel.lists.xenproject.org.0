Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09B69845D2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 14:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802723.1213025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st4Tq-0007T8-BE; Tue, 24 Sep 2024 12:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802723.1213025; Tue, 24 Sep 2024 12:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st4Tq-0007Qu-7l; Tue, 24 Sep 2024 12:17:22 +0000
Received: by outflank-mailman (input) for mailman id 802723;
 Tue, 24 Sep 2024 12:17:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vfmb=QW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1st4To-0007AZ-Bf
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 12:17:20 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f156199b-7a6e-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 14:17:18 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c4146c7b28so6918548a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 05:17:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4c514csm683501a12.63.2024.09.24.05.17.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 05:17:17 -0700 (PDT)
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
X-Inumbo-ID: f156199b-7a6e-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727180238; x=1727785038; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+SrO+kUoVpFLI6WZgHLCkEWxY/6lHm9d4JmbIFT6Wqg=;
        b=WIKxKgbNjNwgbzqH4hOVRlhNUxvV3E2SnEBhpnwJhEE2v48ozlcXn0WdqxvGv8xeJG
         Ag+Tt2gjNt397RC48TJS9AsOxoKhelJV4G/r4ym9IP3pitiHKDoxbYrKa43+AQwuwVgl
         PFljBnB3jLXeS3JKVKErhO448cjGvKAVXcRiilg7wuHCxqqU+gyg44eVsurKwY890uNM
         X78KjjtV6TuqObxLoWKgrWyschX0ZJF/xAYSIWTh6ctZe9bmnRdQ2Z309R9hedypcH06
         nU5Qbi79K4h6ExUCuQb+YoBjlNBTGeo+OwYEvz5hXJGWuk8EGOK+aGsdbshZCfJ9mqhZ
         w3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727180238; x=1727785038;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+SrO+kUoVpFLI6WZgHLCkEWxY/6lHm9d4JmbIFT6Wqg=;
        b=X6dnthBmij7Sc8vCRd4G7aT64bg3Bx2NYgw+dxgXW/eZVgv2cIufKmxpVp7difjX6V
         m4cBVopwjW3tCREezlpMh5ujTobHB5PIe7np7ySSJ1li+cTH9s6Ei1qz1W1mt0FNL2UG
         GdzIG9NPt89Qyq1wSUuIAirRTOso5fe9Lzk0VO30Dh0Vpauj8gtdvC8EvN9mhWtxRriS
         LVcTa33NTZy8RYC7lUbpQuX4MOzkgdT+tiUAub8pCJcI1zFO8/WI2kFwKDqHyjNl4gb6
         qwLDBxNCZAdnaSfXudJmESjw8E42ycpjFStPtNN6dUN5dKEj8PXNt8nm0JESZl7aIBsP
         hIhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnFI/RziQuTdt7B0oUr4PJte4Flv9f8ktvUB1qvAJcWud3QasTPSXUgIoVq66nhi5cjXeNBnwcyKs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyViTXPPiM+bU8tGpQ1dglejiptAiUMjLq0kGHJLJzrW71BaLup
	KBYW+iDfbnfu5kbqvAlmd1xS2oBbVGXl9udNn4aZKmjNGoL7MUZYoGO5ulNKkQ==
X-Google-Smtp-Source: AGHT+IFAFI+sZAu9ouzLN5brGZgNGt+wNxY9Z3BJxuMyl+u8nnm4Pzl+GdudFRRVPt/1qKwHt1ajRA==
X-Received: by 2002:a05:6402:358b:b0:5c3:cc7d:c2b1 with SMTP id 4fb4d7f45d1cf-5c464db0710mr15745186a12.7.1727180238044;
        Tue, 24 Sep 2024 05:17:18 -0700 (PDT)
Message-ID: <6499c5bd-8f51-4be4-ade1-c89ed07710c7@suse.com>
Date: Tue, 24 Sep 2024 14:17:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] x86: Align output sections for UEFI CA memory
 mitigation requirements
From: Jan Beulich <jbeulich@suse.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240919080021.20155-1-frediano.ziglio@cloud.com>
 <20240919080021.20155-4-frediano.ziglio@cloud.com>
 <f928cf8a-e047-43f0-bf1d-c864d5d0e317@suse.com>
 <CACHz=ZiFyiSaihgTL_rSqfNNag761+1QyAhytQhn5zM6tOUSsw@mail.gmail.com>
 <ac8a299d-ec25-431a-aa56-d8a10ca1220a@suse.com>
 <CACHz=Zh_Cr_Qfpz4vntBZfZ-HqYGH+DspEAJkVmeBKMNk_z-_g@mail.gmail.com>
 <89208fd4-eef5-4bb3-b9bb-b1ee6cd0dfb0@suse.com>
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
In-Reply-To: <89208fd4-eef5-4bb3-b9bb-b1ee6cd0dfb0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.09.2024 13:09, Jan Beulich wrote:
> On 24.09.2024 12:22, Frediano Ziglio wrote:
>> 4- .rodata for some reason is not marked as READONLY, even on ELF you
>> get the same issue.
> 
> I can confirm this oddity, without having an explanation. It must be
> one of the inputs; I've checked that prelink.o's .rodata is r/o. So it
> can only be some other constituent.

That's from .data.ro_after_init and .data.rel.ro*.

Jan

