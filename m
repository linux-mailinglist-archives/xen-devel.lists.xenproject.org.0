Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFD3B43B3F
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 14:13:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109942.1459313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu8pn-0004ay-Hs; Thu, 04 Sep 2025 12:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109942.1459313; Thu, 04 Sep 2025 12:12:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu8pn-0004Yh-F2; Thu, 04 Sep 2025 12:12:59 +0000
Received: by outflank-mailman (input) for mailman id 1109942;
 Thu, 04 Sep 2025 12:12:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTa/=3P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uu8pm-0004Yb-JM
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 12:12:58 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d97b526-8988-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 14:12:56 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ad4f0so1646159a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Sep 2025 05:12:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc51e0c1sm13979947a12.42.2025.09.04.05.12.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 05:12:55 -0700 (PDT)
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
X-Inumbo-ID: 7d97b526-8988-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756987976; x=1757592776; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nOBEWNFFHPjnbNq4i67ABuyUthOxE9J2j5V1Te/Ttdk=;
        b=VYjvtrZ2fscMfYuUcSqOVs0GXZ9gG3PL8MEZSXv7edqlIpuSnWsIonZNlccDviIXqB
         3uTKOFx+JP0xOXJXwfgxIk4ogngObFHUQZbHfmlvpJyB/LjCnGfkwvp9aM8Xems97hIj
         pF1EbrnfzLtgEVS+IwDy252vfOUZibPcCnyQ5iEmO0VeWSMJwwvchg/cUgYV7wOFVfk3
         i5oGcZC27nI4wardf4m87+gBwg3yguL4PzK4aGP1rpE0wmISjmX2BKm+xDJCiWgNKwZM
         9bBTMDGJu1IaSyEoJBQUhEnR+0TvDFBAyIiRJLdgfzJPuXJif7kcRrSqziAUPhrl7W3E
         Mi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756987976; x=1757592776;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOBEWNFFHPjnbNq4i67ABuyUthOxE9J2j5V1Te/Ttdk=;
        b=F1lfI301EKjE8dhPmhjzHH3ubmIWXDv09nCY528auylD3K2POHTjUIIOhuHoYmmgnp
         qZsID+7X2oi5h4T7zCfg/RgWJN1S+Fipm8QlwcUJXOCTC8WiUGQKwR5vQlp10b71tPvJ
         RIvWd1dilivkNaxEqXCWGE8Fmx7eML69iqf8BiSy97wi1IL/tqKD6CL5iywV25R7KPLU
         FB6zdweOJteiJnt+BMA3G8tf0jwXx0f9G4H9bevBoKge0ODrm6Dasm9fKba6cTCgxT13
         ky766HTQ0XJm8lEPr334h6dPkL/meRTZ9KHdlSxNfU8TTwbNitT96SbKlmFRo1querPW
         UDKw==
X-Forwarded-Encrypted: i=1; AJvYcCVr9a1c3qfS9QDIslSKy0mJSDc8QXEmSo1LVP2ZW6Uytl/zuYgXYGEujEFKW2PC/gUVNfbuhTPNaoA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFJ5BuzxTL4j1Yst+cLYKmCanLkqFn3CfG1JBe3qB0LUQU9S/Y
	/K+fEZGrhd0iAQrGN5Mj5kjM3vHtzvwC7U5zZxKNtP9nV0nbZwFp7VPdwoGpygQ9mA==
X-Gm-Gg: ASbGncuYcDyKUs0vHgb1yHli7omp42m+Ng5TK9CcBdgZp9outT1fZlL7ujnSx2uMqIm
	yKam3OnUOxlNWSJAWseu1KyAPoJaxaIcM0irLGym37rrrEf58t0DiA9gLJ1k75Z2cnV/TZo5frP
	OG38eCrYUo9caDs5KN7xA4ywNVnGMEqgkN+LcQ5lA16LTDfG2rvH7Fe33boSg4u2uphkPYFVQkC
	G4buZC1oClSgZUQE0QKvT6XMofBf+WqbU51cLCAJ334wO83z5apcAaZbyaTlRkjwf+1T2Vd0Ysi
	Fpv8a8rTSIUruHH8mJYsV+fEDO2erIXhx3JnWIrpw59PeYvGlS4AWaXpNHyr8sqgz7M0gMF/ARF
	KkS03kAey6F+LxMKwzbk3CzSk18ete4nBneExMGL9cxGcFW2sWAR486y735P8MFUfhejhzn8xZb
	a6u86jDiw=
X-Google-Smtp-Source: AGHT+IFT/+IREivLHHAl0YQHtnZpANlRv7fpvIMIt389jc9BAEBskf1NeQHaCQEoTKr+xpftH/SdyA==
X-Received: by 2002:a05:6402:4345:b0:61c:5440:ff7b with SMTP id 4fb4d7f45d1cf-61d26eac5b6mr16848524a12.25.1756987976176;
        Thu, 04 Sep 2025 05:12:56 -0700 (PDT)
Message-ID: <afb6af88-11f6-4b18-91c9-2506e74b3ae9@suse.com>
Date: Thu, 4 Sep 2025 14:12:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/8] xen/cpufreq: implement amd-cppc-epp driver for
 CPPC in active mode
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250904063518.2097629-1-Penny.Zheng@amd.com>
 <20250904063518.2097629-4-Penny.Zheng@amd.com>
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
In-Reply-To: <20250904063518.2097629-4-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.09.2025 08:35, Penny Zheng wrote:
> ---
> v8 -> v9:
> - Adapt to changes of "Embed struct amd_cppc_drv_data{} into struct
> cpufreq_policy{}"

With problems mentioned there also extending here.

Jan

