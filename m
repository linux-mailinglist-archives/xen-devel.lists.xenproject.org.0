Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5768A85C6
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 16:18:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707538.1105559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx66h-0000Ex-Sf; Wed, 17 Apr 2024 14:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707538.1105559; Wed, 17 Apr 2024 14:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx66h-0000CC-Ov; Wed, 17 Apr 2024 14:17:51 +0000
Received: by outflank-mailman (input) for mailman id 707538;
 Wed, 17 Apr 2024 14:17:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rx66g-0008UZ-Js
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 14:17:50 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4565eeb2-fcc5-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 16:17:50 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-418d33ee188so859755e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 07:17:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w17-20020a05600c475100b004162d06768bsm3008515wmo.21.2024.04.17.07.17.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 07:17:49 -0700 (PDT)
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
X-Inumbo-ID: 4565eeb2-fcc5-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713363469; x=1713968269; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xcf3nxJwqBelyg6Kg+IY10nMzaWe+DFYaPaJvSH2lek=;
        b=ToEpZfBtR3ytZXgfg/IwGLJsYqvHai78ryuKnk+SGfT5KoXoWxTzJ9T/ihK6Cs1aua
         ruSKSiCfhpWKAss9hdKw0ME/yfKWZDnXK/Z0XMR++uffXL/nielMyHvfxWc9wzraRnfT
         qPIwxn4zHg4le+K0sePFLKLfmPUgzcJ0Uo6ltmxr2LWcqw6yo91xDOynLaI97Q9y1SPt
         nbjaYMMkWzfQUNyTIFaUxkWU+VhMrFAfM4hRKyhN70dVj+FSrdYsjkomGgevsL5F2bKj
         AOWHH7GaNFRj3wlMByhLIKyzuEIgxmTOlc0RTHbRi8gtGp1Av7DbqB3sYw4a5Y2F4FRL
         25nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713363469; x=1713968269;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xcf3nxJwqBelyg6Kg+IY10nMzaWe+DFYaPaJvSH2lek=;
        b=hMQBbeIu/vNawn6Qg5xPQX0BU2a+qEMcfJD49tMUa550AXeqo+nh0VntRr6ckpAePV
         F+Agz70s3WT2B5EY1rZ7eosULav4urC6yomLH9UfWPTUcKJOojaMRTkZC7jL4IVe1A9c
         8Hh5LAzkbAk4va1vmpVSdYfezFXp8dFUlFH9V8MuaAOdOrA2M4DZcsyMd6Z7MepGTre0
         YdFABAhuXjwRQTEimLX+KfDCg5HsJZiK5GvEdeMX6RkB/QRift+dBVDxBPXBxaUcrZlM
         P6NUuFQBKbhjo/dCRoQi1bwUxOq2EyZcM4PLEEBFmqfby/LOI9tEUvzdIjc8sSVq66bD
         bczg==
X-Forwarded-Encrypted: i=1; AJvYcCWgXuwbzd/eczk305EDfGksU4lCDlo1ab2X/hwSXol7v5fZA5xh0LBRL3226x5zmRALaNic2GK88H3drCYesz+hhixvMRo/lSORPvMh2jA=
X-Gm-Message-State: AOJu0YydgyUTve6MJAhGbpBwLuK5W7vjfco3yTwE9Yyp9h4WKtW60fR2
	Eq8gUpbUTso0ftYJhXKKBFd6F/a/FBn/AR+dEpwTXeXG/osr5+4iy94R4SX8PA==
X-Google-Smtp-Source: AGHT+IGyLc+BZRJ5H9Jt7bXmxD2XrIiyInYHh4iKlTJo0yPA1izhIs6VkrctG0psu4WAf7gjoMVm1Q==
X-Received: by 2002:a05:600c:4511:b0:415:540e:74e3 with SMTP id t17-20020a05600c451100b00415540e74e3mr14739198wmo.40.1713363469414;
        Wed, 17 Apr 2024 07:17:49 -0700 (PDT)
Message-ID: <4324974a-0a0c-4d81-87c0-6b7d27d2ff46@suse.com>
Date: Wed, 17 Apr 2024 16:17:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drivers/char: mark extra reserved device memory in
 memory map
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20240327025454.514521-1-marmarek@invisiblethingslab.com>
 <20240327025454.514521-2-marmarek@invisiblethingslab.com>
 <0d7daae5-97c3-4982-8301-7ed2fda24ff9@suse.com> <ZhskJAL1fz3lNdg7@mail-itl>
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
In-Reply-To: <ZhskJAL1fz3lNdg7@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.04.2024 02:32, Marek Marczykowski-Górecki wrote:
> On Wed, Apr 03, 2024 at 09:10:40AM +0200, Jan Beulich wrote:
>> On 27.03.2024 03:53, Marek Marczykowski-Górecki wrote:
>>> The IOMMU driver checks if RMRR/IVMD are marked as reserved in memory
>>> map. This should be true for addresses coming from the firmware, but
>>> when extra pages used by Xen itself are included in the mapping, those
>>> are taken from usable RAM used. Mark those pages as reserved too.
>>>
>>> Not marking the pages as reserved didn't caused issues before due to
>>> another a bug in IOMMU driver code, that was fixed in 83afa3135830
>>> ("amd-vi: fix IVMD memory type checks").
>>>
>>> Failing to reserve memory will lead to panic in IOMMU setup code. And
>>> not including the page in IOMMU mapping will lead to broken console (due
>>> to IOMMU faults). The pages chosen by the XHCI console driver should
>>> still be usable by the CPU though, and the console code already can deal
>>> with too slow console by dropping characters (and console not printing
>>> anything is a special case of "slow"). When reserving fails print an error
>>> message showing which pages failed and who requested them. This should
>>> be enough hint to find why XHCI console doesn't work.
>>>
>>> Fixes: 3a1a7b809ffa "drivers/char: mark DMA buffers as reserved for the XHCI"
>>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Is any ack missing here, or has it just fallen through the cracks?

??? (commit dd5101a6169f89b9e3f3b72f0b0fcdb38db2fb35)

Jan

