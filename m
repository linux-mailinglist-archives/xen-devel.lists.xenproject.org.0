Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8748EAB34E1
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 12:28:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981166.1367560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQOB-0003LT-Di; Mon, 12 May 2025 10:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981166.1367560; Mon, 12 May 2025 10:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQOB-0003J6-Ax; Mon, 12 May 2025 10:28:03 +0000
Received: by outflank-mailman (input) for mailman id 981166;
 Mon, 12 May 2025 10:28:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEQOA-0003Iy-IQ
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 10:28:02 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c77a8601-2f1b-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 12:28:00 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5fcc96b6a64so4116620a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 03:28:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2290a4cc2sm489535466b.183.2025.05.12.03.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 03:27:59 -0700 (PDT)
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
X-Inumbo-ID: c77a8601-2f1b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747045680; x=1747650480; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XX/SpC7l0v7XOnAbPzQ+K7NcMeRRtuqI9xd7Z7SsYXw=;
        b=SpTcJRuT1MkvFmUWAi4GcgaUibvUcVosCeb8hoX23zo7xrX5pb55bBV00wYFPMfDP+
         RXW8fiYtvtpzNxLyBpvxO9xveOmlIrj9HOkpdroZ/nf9mw9dXRA1RoRme4MkJZ/ZD8hL
         J9q/XoDhbwT4p0BSyIRl0A6WMFT8Xrb7+DRrkUZd0/eeyXA9YaQEH0a5FNtRcFTl/JrT
         vmYEORrzSZ5cyz0/4YmxJ361Kju05FiUOW2jDmWO0g/Xl3xgWqnGDSAN7k/dmINOk3po
         MqweqW09q5w3OE9cFNXk7c7n0Z81qszv39CDt8YiQzoaz/j1W+RK6QgPTUvzBuaHs+2e
         OUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747045680; x=1747650480;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XX/SpC7l0v7XOnAbPzQ+K7NcMeRRtuqI9xd7Z7SsYXw=;
        b=WAdnsrBZaM9Cd6FFAQ8h7e0sn5x3v7bZPkt+kyUFnlmfodRHuQ8UdBhymadRk5Q6Sn
         jBTXjnQyE/drPQ5vLSOmwyV0fmybR+Vf7lqsvm9gHdZr8dmSjpnQdz+N4738MxCCdOHT
         0ThdJNAY2BgLLMwClVgVbvYdeJFU39KpfK+JcFdE03udLgNyPOeHDRXBoBX4XgBEqDbN
         FrW+iupMjLJce+78TuZWPsEDpwcR3dG1N/3EVAThvOr3szmvum1yI02jaN7sBV9LK9Ny
         bVK9BxIuJEf3Z8CTOzduwXIYzbpWD9u2ARV4NwSURdfemZSCmxE1+3Qx86YlM4LV6UlO
         9v1w==
X-Gm-Message-State: AOJu0Yx1Sx9lQkTeoFwy49epDgd257VAGH3CclVnn8HK4myhEUNtUjHz
	lvSEK0E1iMgJGkKw2Af4Tx7r0FSqEb0VzWkiGyQ2MxZOysDTCOO+2TvrJApFlg==
X-Gm-Gg: ASbGnctJ9MftppiyFZXqCmCfxXxa58h+oE+x7ASH/00doYgUdIcKEmDh19jwXOIFAa7
	EBN/rRTDTPL2NRDzpmDsbnqwac8ZQXgKoIoIw80Ip9bw3YOHIbZbWxSMWqPQS3aQKGVrl1gR0Tj
	OGymfqxJhOHbCRQpdPiCpb7F6+cLc/jfUJwC9Z6XS0pZA7S8wqEZzGa2JAHZQFpPvhxruzi9vHL
	LDg5tLnbKyCXLZrjYsk2iYl0Jud06ab4Jo705ZXshTXHt/tIFjdII+7d3tm5IpToET1RD6bAeq0
	rY1XixspWYMTGvoxIH+LHgTDdwfQihpgVquUODd0l+UQJHTdZ0lifEHMqZaWDptOXuCWaLUbea9
	ghG6aj9WOAAL7w4MPi9ZO2DaAWPn1P/jDQIpr
X-Google-Smtp-Source: AGHT+IEfB73BdWUqScASbDsnPJRt6WdGZOSlC3Fv2mZugg7J7wYjBzdBZbmmQu3zkuNjQZ6K00jh0A==
X-Received: by 2002:a17:907:9810:b0:ad2:4144:2329 with SMTP id a640c23a62f3a-ad2414424e5mr633210566b.7.1747045680042;
        Mon, 12 May 2025 03:28:00 -0700 (PDT)
Message-ID: <10454237-2ada-4972-8e31-8ae21a6d6d22@suse.com>
Date: Mon, 12 May 2025 12:27:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add lockdown mode
To: Kevin Lampis <kevin.lampis@cloud.com>
References: <20250506162347.1676357-1-kevin.lampis@cloud.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20250506162347.1676357-1-kevin.lampis@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 18:23, Kevin Lampis wrote:
> Add lockdown mode
> 
> The intention of lockdown mode is to prevent attacks from a rogue dom0
> userspace from compromising the system. Lockdown mode can be controlled by a
> Kconfig option and a command-line parameter. It is also enabled automatically
> when Secure Boot is enabled and it cannot be disabled in that case.
> 
> Ross Lagerwall (3):
>   lib: Add strcspn function
>   efi: Add a function to check if Secure Boot mode is enabled
>   Add lockdown mode
> 
> Kevin Lampis (1):
>   Disallow most command-line options when lockdown mode is enabled

Returning from vacation, this series is a mess in my inbox (and also on
https://lists.xen.org/archives/html/xen-devel/2025-05/threads.html): Only
patch 4 is properly threaded. Please can you see about adjusting your
mail configuration?

Jan

