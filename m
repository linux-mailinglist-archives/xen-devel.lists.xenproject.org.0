Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E9883AD7D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 16:37:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671114.1044282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSfJd-0002cv-6O; Wed, 24 Jan 2024 15:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671114.1044282; Wed, 24 Jan 2024 15:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSfJd-0002bM-2j; Wed, 24 Jan 2024 15:37:25 +0000
Received: by outflank-mailman (input) for mailman id 671114;
 Wed, 24 Jan 2024 15:37:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bgOV=JC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSfJc-0002bG-Dr
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 15:37:24 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77d6fc01-bace-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 16:37:23 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a30e445602cso241080366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 07:37:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c14-20020a056602334e00b007bc102fb67asm7117305ioz.10.2024.01.24.07.37.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 07:37:22 -0800 (PST)
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
X-Inumbo-ID: 77d6fc01-bace-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706110643; x=1706715443; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XvSbzhrxHs2/32DEGN2m/4q8IW70rWnO9+XaRiyIRAc=;
        b=Q6hGhR+RJhnv/UAtmL7PUZRPkCfN8d9QkcHSnvADj7j7mEQ7oqqEPu1OApjCzFdwa6
         Gk/41kQG/QhaFXOwezzm6Ib6eDLe1FYkaANe8rlKK37ozyFl8hKotfBj4iYgvn6LVFIt
         PWVQnl2aXkrFQtmLyLyAeW5XL78pumdVpY667IhRSF1ujsmsWe+ikJhvDJdL3XZWXEsU
         1Tx7YHwxxIWXDO12rF0aBQCDWVsd0EWrw5XnqLSknvyB8vcupM1mf6SeRX4/JQMHtT3J
         +OzsV5NeGc/poW2o2ntpacaX3rKFCevLvP7D8CkHObym9SIStetrGeOkaY/bdGohtt6w
         F4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706110643; x=1706715443;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XvSbzhrxHs2/32DEGN2m/4q8IW70rWnO9+XaRiyIRAc=;
        b=ljAI8x9MOCSbl81H2JT1cDJbp00kZqVTLfRWEqOkzmk2e92BBetdacI0MUkMR9piTB
         JGUhw0cuZnCqfEZUm7S0uPZZKu8zeMcW1Hp5O2v8NZNs4dlgv6nScx0KnYCMmsJmOHDy
         dsKpmonuB5a0Wv56TTdaSFpbnfo/Gr5c6ftQcQNVxOyEIFR6oCR/U+rdytSKsCU0tJ9s
         w3yoQ9V18OC9+/1/VzO7HdKLbTjtQ+efUPiOVncCLSUTW8GAGoqniDdn9ENz1fSliT5a
         Ts9DJ7yoZReges4+k8YePaw0f02wKhEDWYJjm35miHsJ2yfYB0e+HMqfaTuKiOhq5T5O
         qtbw==
X-Gm-Message-State: AOJu0YwICw4nd8gQCSnWYsp3iifag5X4rktwZvGKmw4UvYlA7aDiEc5c
	O4XHv6lQcGaeZlUAyB7/jHQvSVpZuSUx+28flRns6jEb+zoVF12Zh+0buiYfpw==
X-Google-Smtp-Source: AGHT+IEoEqyG3fgVrLmBRylmgNYzku7dBD60YakiVnwaMfupmn1VhmLrEhQWRwmHn43pKPsa0Bplhg==
X-Received: by 2002:a17:906:53d6:b0:a2b:4ee:3b6c with SMTP id p22-20020a17090653d600b00a2b04ee3b6cmr1649201ejo.7.1706110642830;
        Wed, 24 Jan 2024 07:37:22 -0800 (PST)
Message-ID: <090f64ae-ecf3-4edc-a6c6-8be3a09ea1ba@suse.com>
Date: Wed, 24 Jan 2024 16:37:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Fix stability of the Raw CPU Policy rescan
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240123205948.1782556-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240123205948.1782556-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.01.2024 21:59, Andrew Cooper wrote:
> Always run microcode_update_helper() on the BSP, so the the updated Raw CPU
> policy doesn't get non-BSP topology details included.

Wouldn't it be better (and consistent with ...

> Have calculate_raw_cpu_policy() clear the instantanious XSTATE sizes.  The
> value XCR0 | MSR_XSS had when we scanned the policy isn't terribly interesting
> to report.

... this) to purge these details from the raw policy as well then?

> When CPUID Masking is active, it affects CPUID instructions issued by Xen
> too.  Transiently disable masking to get a clean scan.
> 
> Fixes: 694d79ed5aac ("x86/ucode: Refresh raw CPU policy after microcode load")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Irrespective of the question above, I'm also okay with the change as is:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

