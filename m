Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AC7971533
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 12:20:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794194.1202957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbVZ-0007ob-LO; Mon, 09 Sep 2024 10:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794194.1202957; Mon, 09 Sep 2024 10:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbVZ-0007lx-IB; Mon, 09 Sep 2024 10:20:33 +0000
Received: by outflank-mailman (input) for mailman id 794194;
 Mon, 09 Sep 2024 10:20:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snbVX-0007lo-Io
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 10:20:31 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24153c71-6e95-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 12:20:30 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2f74e468baeso48575721fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 03:20:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d2583c20bsm318958866b.22.2024.09.09.03.20.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 03:20:29 -0700 (PDT)
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
X-Inumbo-ID: 24153c71-6e95-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725877230; x=1726482030; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gvDibMQZtVYZP/O1qSDwwvFKBbT8Qi0RgTJLJnNOJ3s=;
        b=eSMBsS7qAjhNtH8yO5SGTTaEujlxInXMPFwTt2fcUoiYhltP9VvE9f2sVaTzL4zZ5M
         M1YgrT/nAm/ppgW9qyeM7gILVXejatcglXC1kmzryBhRwVorWmcJKDxyGAoC/2/EgJSF
         vAKbn1pEG36pUDn4TGjsofyBGR3CcdF/LAq7ymK//SSrfxXcvZbHA7QLM3J6rjUkq/Fz
         0rlNY7ktz/9XiK6AVHH48t+ZARWzKlvNDKtHbdUDbPFQ/QplMIEfs6jhqE5KmO0wYEZn
         1bzWQcKQyFEk81BgGgQJJVy17KtWsLFEhEHMfg/klhgR6obI7JsaEzLi1eFlnWm2Btru
         DKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725877230; x=1726482030;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvDibMQZtVYZP/O1qSDwwvFKBbT8Qi0RgTJLJnNOJ3s=;
        b=CwnT/RdkuRDdPx98jb7UWNfFzfE5gWmwlxFaVWvLftPIGFyHCXqh7vFGHxP3VCRiWq
         IKwFDtbCCil3lDwB72+Pbut6wFrFhOetTtwHTJz9AmIj+I8PUDhutGXv7T2TPHqdy6mR
         o6aZhvQcTTZq5cHisibAeJbz0xGIRL9b0yE6QNf7WGgvV916QRzbex0AzUxc3HV07LIZ
         XgvojKF6pqM+armqu3c1ZkxGnlZSOwHhJNWe+mcK3uSMgWWQIR+9H0ETFhSFA7zEYsgO
         GEGUegy00SgPuGUL3hfkEnYdQXgxhuOMf10N4OxFJ3eBv/3FplvB1VZHGiwtXebT3vRA
         BqCg==
X-Forwarded-Encrypted: i=1; AJvYcCUcTkDYvvk7wEzud6/+a7go2vo3nQNBb1hZuFXy3SDUtSYrSGx4AjnbWM3UqXCcCuNvSNRqAfc6C6w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywk3suTmrpo3IQ4qlWewRI3CrOp6gVe+WDhn3bPnioag/ax+L1B
	TJdj7y0hecg+HYwOUpCjXQ6CoM5WGsyeDW2RSrYCxKHK+WqVpTQd3RZmuiM4tQ==
X-Google-Smtp-Source: AGHT+IEZSXL4oYuHcFH3lC1hT+brOiRdVHZqwVxqyUcPp51L3q39r+yqX2phLbApBvHZtF4n8sLQWg==
X-Received: by 2002:a05:6512:3d89:b0:52c:9e25:978d with SMTP id 2adb3069b0e04-536587fbcb2mr7339809e87.45.1725877229961;
        Mon, 09 Sep 2024 03:20:29 -0700 (PDT)
Message-ID: <19b0f99e-ab3a-4e76-9319-211af70ad747@suse.com>
Date: Mon, 9 Sep 2024 12:20:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Optimise 32 bit C source code
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240909100428.47102-1-frediano.ziglio@cloud.com>
 <20240909100428.47102-2-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240909100428.47102-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.09.2024 12:04, Frediano Ziglio wrote:
> The various filters are removing all optimisations.
> No need to have all optimisations turned off.

Yet also no reason to optimize more than the rest of the build, using -O1
for debug builds (and iirc we meant to switch to using -Og when available).

Jan

