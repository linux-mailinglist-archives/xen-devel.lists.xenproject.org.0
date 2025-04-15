Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A85DA8A383
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 17:59:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954220.1348535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4igo-0003du-1x; Tue, 15 Apr 2025 15:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954220.1348535; Tue, 15 Apr 2025 15:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ign-0003b3-V7; Tue, 15 Apr 2025 15:59:09 +0000
Received: by outflank-mailman (input) for mailman id 954220;
 Tue, 15 Apr 2025 15:59:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4ign-0003ax-Dt
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 15:59:09 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9052607a-1a12-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 17:59:08 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso45698565e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 08:59:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4404352a536sm17754635e9.1.2025.04.15.08.59.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 08:59:07 -0700 (PDT)
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
X-Inumbo-ID: 9052607a-1a12-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744732748; x=1745337548; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GzVYbEzQU8nRqKLFEPqZDDIRnDjKZ3QtN4ZRIJgoFM0=;
        b=BfgSFrL3FYDFxAQ6l0eCF/VL8suAmhgRGyGeB55KJn7n2AJc/CaPvA6Rp7HN8ZTkqH
         6X/OlSp7h0Myui4M9hbZEguPr1Adga6rLqhvkh41CbFj4I1+DrWAFy/0r78qJwbw7dln
         o+ZuHvpzMlBOJUd/hXD436pviJpHCf2h/I5ILx0+M4mWXdJuNNtHxxP8p/72ML5UaOhg
         7jcnSaP4xFaQuYNu5nzPgR9fLva2mk8HOzkAwvwIbmbSTKLe0NEkTzXYqLCEmsuFXgtP
         v1b9Kn9LNcwv2BPHV7vVprTCuRLianmCyHTUchxT27HdbEWCLOfzYncbrRHUlZTsTrZa
         eJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744732748; x=1745337548;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzVYbEzQU8nRqKLFEPqZDDIRnDjKZ3QtN4ZRIJgoFM0=;
        b=jjYoBH+lOIMPMk/TcVgT4VqDeUyY2RZoB9LkIY4UM4tXOxEjoH5WMaof2vf8LS16rH
         TJotb7ywqI5XhwN49Jq7fXCY6RurHcyyhCQr9BU7Dw7rzJdRCsq0twLR/ovQgxnX1Zn2
         Tepa0fQ2nmJUW5SPfVqcw9rhWdcvxeQ0RQ5VEsUzaUCHxji34D0cKqPG3r5AqmDhBwTa
         LwW4PsGngnNUnW3V+1x4SQCpvo0BIs8Cu7b4mIKqAcBIDhmb9KsHuQ6/mLBtsUBK5UgN
         4NgAf7CcF2IDg02qUPRT/d6nfymVyRCyp6t8V68cDOc8JZw257u7wBxZEAG/B/a4Bae3
         l0Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXrpid3rY+scgVwOO+uxU3Gw98uYrCM//4SAthw9sy5WdebojExRxzAp0DUYOvVpa0TOaJzw9K+g1k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOPN0J0n/qUU08nij6MJt1afXPgE4mqLflFZNmIjxtzuMsgkOp
	t1zjWWxd/wP2Oexkc9vSHjPBtgchTC+vG8jGq+qBy4g+gkn3HtReEJEWRQuJVg==
X-Gm-Gg: ASbGncvydE4eutlFiOvEcpxcwRJI18pqxrR3zwe9U60bLGT62KCALPQ0FVn5h6Hn7tl
	vFuYYJpOlMCZEh33GPrzVnbI6jpVo7cyWtreyMU4dUHfXa0aRyG7bmtX1eCPGR61Q45NxrpQJhw
	OjvG5ERmaWI46lcByqxbMazV4Q9WwrCmIGtKZjxG5IFtDw40Ju4iZqU0XQrPejZIXv0tpPooaiJ
	bbxD3UHARsH6qMRekoq7fTrOeslmtv731g/B+YOdhCu+T3D4cKDaHsRWEQ4iPyOLyiwKXvUW/tL
	Kyi6IsPEQFq0XQzaKJ3EeI1Ri1/i3nBasbq8hLE4C+xC4/iOuc5RxQjV60Jada7TIRXoB9Pl07E
	Jh9CRJ0mYpYVaW9bdhBFxiF4ITw==
X-Google-Smtp-Source: AGHT+IHxGakBHJ2xoeBl9k4MvubIfjVAFIdHmQGRBF6ec+T95X1za+Dt7VxYKweCoFzLvTxBf41W+w==
X-Received: by 2002:a05:600c:4e09:b0:43d:45a:8fca with SMTP id 5b1f17b1804b1-43f3a9b035fmr183593425e9.30.1744732747733;
        Tue, 15 Apr 2025 08:59:07 -0700 (PDT)
Message-ID: <bcffc56a-5518-4bcc-9124-d49a98ae727a@suse.com>
Date: Tue, 15 Apr 2025 17:59:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/14] xen/riscv: initialize interrupt controller
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <cb730a1293f14dd7fd58f98f5ecda4e2523b2d90.1744126720.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <cb730a1293f14dd7fd58f98f5ecda4e2523b2d90.1744126720.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 17:57, Oleksii Kurochko wrote:
> Call intc_init() to do basic initialization steps for APLIC and IMISC.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
yet ...

> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -136,6 +136,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>  
>      intc_preinit();
>  
> +    intc_init();
> +
>      printk("All set up\n");
>  
>      machine_halt();

... this being everything here I wonder if this can't be folded with the
patch where the function is introduced.

Jan

