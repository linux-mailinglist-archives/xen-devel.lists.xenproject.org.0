Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2993AED73E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 10:26:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028935.1402651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW9qI-0007A5-Hz; Mon, 30 Jun 2025 08:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028935.1402651; Mon, 30 Jun 2025 08:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW9qI-00078H-FN; Mon, 30 Jun 2025 08:26:22 +0000
Received: by outflank-mailman (input) for mailman id 1028935;
 Mon, 30 Jun 2025 08:26:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uW9qH-00078B-BO
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 08:26:21 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5afa3be-558b-11f0-b894-0df219b8e170;
 Mon, 30 Jun 2025 10:26:19 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so1517009f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 01:26:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3508116203sm2878542a12.36.2025.06.30.01.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 01:26:17 -0700 (PDT)
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
X-Inumbo-ID: e5afa3be-558b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751271978; x=1751876778; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8Z0jirSpwuvYhmfU5z5hYP/f2F/uKbhsT4EYPkGtkQk=;
        b=G5+FUlK8KZCQn7VIvFfLiRdoJSDNM0iaFZ2UK2ctk5EtJH5q2WQu6mzcPykjPLfLjG
         4Ateex8x0qLm+QU/yNYL+yfjlNSMEik9Pke+UEoFQj3DngRz+BfH9bfWC8jf74X254+L
         fghZwVM0xhQGtII3JZiPFmEqSVVO0sUXaTNh5WH1cnMRgc+PNckecSNKQFuklY7gBFNZ
         KWqftqFwfRutZ26WXTmKqp0tMalwX5DHC1MYR+tV/1H2zvP2FMAI1vXJmPTGK3y5jB0x
         o8UqHvcSOSGlbEqqUShzvtKtEmUj1msw325JPjXbt4Dv5GZmFO1D0gANGVSfw/32QdTA
         OVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751271978; x=1751876778;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Z0jirSpwuvYhmfU5z5hYP/f2F/uKbhsT4EYPkGtkQk=;
        b=W7siiDh07LaHDYtO6JNL9PoCf0S9ScuMMFKL4pyNlJC//Kfm9v3isQSIFNN3ahgfhz
         +5A0NY1rcy8PzCec/Di+c01pPDv19Zq+0t6EpPJT8/HSWkkKPem4TwKl6nutef0WH9jh
         c1qfUkz+S7JTtvnQmKqJ446bZArkplHIA8UiTw+0nZ+e1NUNavEz4K4zv8jY+whcZni8
         8J1aoMwJ+kExJc/b+MSsI2j2z/uXzMWrCnFilVpPzW8tV4RrkJjPgFiG4Y2RVTPWPGiQ
         xWiVW+BKEXMlJP7od853uYeENi7hE+JzyFRxwIBwQScKQPiEW2UiY0i2IkJPWS4EBdBR
         3UZA==
X-Forwarded-Encrypted: i=1; AJvYcCVNwu9naei7HUYS2OJexK9O9Fj1giO/b2aVdWLlEGTVDPcvJtmhjNDEBGyNC+qFCyC8paKUAbk3Xoc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwLpF+oY1mYEcz+zoPlv7Qai57ys5iAh9Ny266rcpz0yXw0wyE
	171EuS/gUS0gZUeDIGl3Oa4bZsxC1rvIUyL9a6j9cRxeo/wNbe+eb79ppJuKOm+AHEc5oCpRc1O
	57zo=
X-Gm-Gg: ASbGncsfLfcDz2qG20vZSWd/yiGrpa+Gipj+ImCS/tEQSqc6lR0SHoESePUBSTCh7rm
	4S7btvVTk0x0lnPphCcQeqYagX5hkSTabDUfSjdRAWaVzPRJPq16au/837A7uWScdkp2wZLmfYU
	ELlwdfvIpPiyHXjJc8ZSPOL+OXXCM2VGyb7wwS42gNcKjSieCBV2xnjmK23UAOhmqXweSSnRuA5
	lAVuZQSIdxg1D0o6rInbELFxjzNL91mfOtDQuuyuKI3iTOw21p8hJ5KL1Eacuxe3To470GwALjj
	W0CJFbE9ImOz7yaFjlbjPiUCcNaMMEpcdw6ObR31TRGX0dBCCOhEvasK5OEmC2OiMldfpCr0TIr
	s3DqjOWIG1L9QYgMa0OPUXZ1C2mv34JU8VYp336RVuok7Tryb7yAPO6bqiQ==
X-Google-Smtp-Source: AGHT+IF82ociMjkx29dVW+6NW3McarsU8OjBiUbpz8QoW4VGz/aBTQEA0trWBKtQtcfgPs+uzbFvRg==
X-Received: by 2002:adf:b19b:0:b0:3a3:6e85:a529 with SMTP id ffacd0b85a97d-3a8ffcc9ea5mr7625513f8f.51.1751271978485;
        Mon, 30 Jun 2025 01:26:18 -0700 (PDT)
Message-ID: <7e69e568-b426-49bf-958a-231e25936cbc@suse.com>
Date: Mon, 30 Jun 2025 10:26:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/18] xen/pmstat: introduce CONFIG_PM_OP
From: Jan Beulich <jbeulich@suse.com>
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250616064128.581164-1-Penny.Zheng@amd.com>
 <20250616064128.581164-10-Penny.Zheng@amd.com>
 <d24bf708-6a02-4ef0-99bb-fa642a8594a9@suse.com>
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
In-Reply-To: <d24bf708-6a02-4ef0-99bb-fa642a8594a9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.06.2025 10:24, Jan Beulich wrote:
> On 16.06.2025 08:41, Penny Zheng wrote:
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -620,4 +620,12 @@ config SYSCTL
>>  
>>  endmenu
>>  
>> +config PM_OP
>> +	bool "Enable Performance Management Operation"
>> +	depends on ACPI && HAS_CPUFREQ && SYSCTL
>> +	default y
> 
> Btw, doesn't this also require adding an override to pvshim_defconfig? And
> the similarly for PM_STATS in the next patch?

Not sure though whether that needs doing here or in the !PV_SHIM_EXCLUSIVE,
once that was moved to near the end of the series.

Jan

