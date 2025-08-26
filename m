Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD27B355BE
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 09:38:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093989.1449342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqoGB-000157-IU; Tue, 26 Aug 2025 07:38:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093989.1449342; Tue, 26 Aug 2025 07:38:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqoGB-00013e-Fg; Tue, 26 Aug 2025 07:38:27 +0000
Received: by outflank-mailman (input) for mailman id 1093989;
 Tue, 26 Aug 2025 07:38:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqoGA-00013Y-4E
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 07:38:26 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a628ef78-824f-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 09:38:25 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-afcb78fb04cso727610166b.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 00:38:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe6edd3414sm505998066b.65.2025.08.26.00.38.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 00:38:24 -0700 (PDT)
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
X-Inumbo-ID: a628ef78-824f-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756193904; x=1756798704; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UTUsE7oJP2EeVZhbS+YToiHaXwBeBUNSzgh2GyEiMp8=;
        b=PiiF+HJHNCN2/8bky+1v4xKgqHNcPiQv86yO9AxaQwVKbU63PHtk0b5KofNbqZWgxn
         8tPgtB6KFnGOqn8Cn+SNat9Fw1cV0+o9sN20nOkAe/BurfyGWoUyfGzJXCHFYRnbwHvO
         FwwQgqQRv8vhwbQJGRJA/9jFz7+h8huTa4ctcpdnHmCqU7iQ+wZXPJk8Rat0sU6gYYE6
         QfXWRuTyW2USr2f8h29lHZ37PIYKhdj7w4TR4jetMocSPBIWm4jLTvvViPOtjTnn4ddk
         XJ8Yne+k7Wmi6CbMti1kB3s4zNOMTve0o7z4mPgHSgqhfK7beUUBxcgi1497n+mO5bT+
         hKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756193904; x=1756798704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTUsE7oJP2EeVZhbS+YToiHaXwBeBUNSzgh2GyEiMp8=;
        b=fV1Mi3+ZmJxj3QQsGpw4XM3QLqYBPuCYZMWvNutPw8SX81nxwuyIgObFsVFiJ+dsEZ
         LWuEUO+oZIo7Tddw1PuhL1l+KSztUcFG7w8k9cJ/g8iGwtd/Lw4OOp1mLl5yhbNXFyeT
         GDsaqN2s52ykjw1k6QxRtCE0ueaS/pl0/vBccvgtYcz1qD7PTiK7q+iMkUhGt6BwXKfp
         3jnNAvfCeJNfBU/slVrLaaVfes13STXL0CNFHlWm6tngvbJMnmdNBSE+h8N11T8UHDMf
         l2Gq3REecSHvEIiGAXVwhLMJ0XZMoStLyEX6NGtEsoyhHZjD3Mc8M+p3mAGuS984ohFz
         ejow==
X-Forwarded-Encrypted: i=1; AJvYcCUxXe8VO2SyFO4OhtFSEi42JZeVTVsGBDcQY0qJDfGHdtl6/KYK7ggu/ZZq5X2krZYh3nGfzJIsvMk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywpkmkh7s3rDFmVHYRUoBQGmogkuJfKQMp1mDz0J+n4Jk9ocp7q
	TRuqSSZtohEiCV/+NfoQyaVqExhjF3rxnVJZelboklhMlBnEomfbmzu9n30wzJzMHQ==
X-Gm-Gg: ASbGncucqdpxJKAIT7/aZ8/d91dmDd3VZzFKntk4DloADJTDpFkwj5wKw7grjxsKi1b
	Mq3zV6rjyJ2sd2cpHFWlqByH9VYTttNAoMLfCIhS29seTaODUPwRP9ki8dIYhr1oxeFhu8iYbF9
	gwo8eKXZxJ8XRgh6Avr524X4r69oiqmm6fgD1jXeU3CcRvYos2X9vUYXGYnPop5PIFBvKUyyUZE
	bObUxjzoLCQgHdbD6fDSgHCAXN63OhGu6REKEdSaRfIxuLwIHQ7ieYLSeLgIa8TT+54mrzLZq0G
	wp7K+61tPGAShX6sInbDNTfER6f8kpLf37pHgW2aIdzE/l7jB9MU8iEo2d9m5nqfHfzvEHtOKNl
	+4BwQrIOuPRM9jcFf5tGtKvD4SYtRb49Ph4qvp2JrIX5tvcOLEEDudYkBhpmDdRkuCRAsk4D1ui
	MyQe+KyKHIB83kK3gFp8LAEQKiiQDi
X-Google-Smtp-Source: AGHT+IFJLW8b1P5uaAbYAIZ+Csab4nTiXd7T+JlIfLdF4+vjzNnCVuBNPW2uW9+1AHZukv/Pp7fuLQ==
X-Received: by 2002:a17:906:194d:b0:afe:7eb8:dcd4 with SMTP id a640c23a62f3a-afe7eb8e083mr455627666b.35.1756193904527;
        Tue, 26 Aug 2025 00:38:24 -0700 (PDT)
Message-ID: <b643d4b5-85d4-4053-93f7-ca6909c6e95b@suse.com>
Date: Tue, 26 Aug 2025 09:38:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/13] xen/cpufreq: refactor cmdline "cpufreq=xxx"
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-6-Penny.Zheng@amd.com>
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
In-Reply-To: <20250822105218.3601273-6-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.08.2025 12:52, Penny Zheng wrote:
> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -64,12 +64,49 @@ LIST_HEAD_READ_MOSTLY(cpufreq_governor_list);
>  /* set xen as default cpufreq */
>  enum cpufreq_controller cpufreq_controller = FREQCTL_xen;
>  
> -enum cpufreq_xen_opt __initdata cpufreq_xen_opts[2] = { CPUFREQ_xen,
> -                                                        CPUFREQ_none };
> +enum cpufreq_xen_opt __initdata cpufreq_xen_opts[2] = { CPUFREQ_xen };

The pre-push pipeline flagged a Misra rule 9.3 violation here: A dedicated
initializer is needed to have the intended effect. I've fixed this up for
you.

Jan

