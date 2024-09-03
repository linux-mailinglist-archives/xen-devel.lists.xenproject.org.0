Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC12D96A06F
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 16:26:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789280.1198860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slUUS-0001q2-8r; Tue, 03 Sep 2024 14:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789280.1198860; Tue, 03 Sep 2024 14:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slUUS-0001o5-57; Tue, 03 Sep 2024 14:26:40 +0000
Received: by outflank-mailman (input) for mailman id 789280;
 Tue, 03 Sep 2024 14:26:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slUUQ-0001mA-TU
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 14:26:38 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87a41ea7-6a00-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 16:26:38 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a866cea40c4so618003866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 07:26:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89940980a1sm633071766b.47.2024.09.03.07.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 07:26:37 -0700 (PDT)
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
X-Inumbo-ID: 87a41ea7-6a00-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725373598; x=1725978398; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X8ug0RKECctaqD3XYMcpwwlQO9BTgKEmQFbY/dzRVXs=;
        b=dYj+/L+WvziwfBFfhLOqYUiHWuc90CYaq9Qd7Lrkyx2+1oQLl7lBY+Mijtoty2fDma
         DEqYycX53d+171p4GT3HBEdztwdJawmr9tkAKwI4Ren7V8v0BcSxBSzNO2SkgMjtluTE
         3+UPo3Y2hdl8HOpkvqHq98v43I8dPgnsduH4Bajthe22qP0KK0u+GTIyqllv2tV1g0XO
         m3sUZOmM66GbfABxQQK7VX32/e6uuAjv65IxWN5IfUaLiIawdUqXf0Wnyy1i2WIIFPFI
         4k4rQZFhhVf2JxQeaLxSdhRXBGG7clSg4X4AU2srVcbswkMyXfGPNLBoMnFtpoFt+ILJ
         I7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725373598; x=1725978398;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8ug0RKECctaqD3XYMcpwwlQO9BTgKEmQFbY/dzRVXs=;
        b=CXkZK1E/dgzIqUGkTPmqdKhAsD96yBqy70E34kj82+GEyNmrqcuxeuIV0SYLCXd77c
         qcOjoMkw3+VxFKtk666Vr1KW8Be3BIsm6uVWXIQ5igv3OcK1eaasJM91cmqJCUCpa1u8
         HZSwdBUKuD2TNNNSO2BkNfF0s19wrom7Z1isV+q4Ji4fJXFm8YvOjSLVFg3JJ/HA91h7
         7SqKbjRZK2DKsN5XtOtId6leVk6h8gHaIVHTAcLcQvKMZS7oBjczogAwPPcvsg1188XE
         MpX7ZDf0wcVjpUO5qhz0IW3WnPH0yiLpZzbUhF65zNKxSBNVVXKjG1FMVhyOfkguI/B+
         1kmw==
X-Forwarded-Encrypted: i=1; AJvYcCWqGLsZY1+VJntNnHA2YeNhVILOepCHSGGuCQi6JMQbzuB+J9ynivAMLhGop572x8luF5DA9zhGmlI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxROdntA1/VvHLUVCdDdbd+9IcERe4LKyU6/ioFI+T8rE5GKMLY
	KOEIadkrtm6UqEjaYUCZ2MB4YQrVgYbfZCLPWE3R/F7K1xOnX+cGY0UnmCdCzg==
X-Google-Smtp-Source: AGHT+IEwX4W/8h6LrEVeszXXoDhgnwUKgtS9ggHpfzmOgN3Mjh9VvMaxXTt6RU5OQNnRyHmAHeVSNQ==
X-Received: by 2002:a17:907:9495:b0:a86:97e5:8d4e with SMTP id a640c23a62f3a-a8a1d2c8600mr289281166b.23.1725373597658;
        Tue, 03 Sep 2024 07:26:37 -0700 (PDT)
Message-ID: <1ace3e56-9cd8-4828-aaa2-92ba7766945a@suse.com>
Date: Tue, 3 Sep 2024 16:26:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISCV/shutdown: Implement machine_{halt,restart}()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <3d32a952c7cc77fd759e211c3b60427485a75582.1725295716.git.oleksii.kurochko@gmail.com>
 <20240903141937.3552353-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240903141937.3552353-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.09.2024 16:19, Andrew Cooper wrote:
> SBI has an API for shutdown so wire it up.  However, the spec does allow the
> call not to be implemented, so we have to cope with the call return returning.
> 
> There is a reboot-capable SBI extention, but in the short term route route
> machine_restart() into machine_halt().
> 
> Then, use use machine_halt() rather than an infinite loop at the end of
> start_xen().  This avoids the Qemu smoke test needing to wait for the full
> timeout in order to succeed.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
ideally with ...

> --- /dev/null
> +++ b/xen/arch/riscv/shutdown.c
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#include <xen/shutdown.h>
> +
> +#include <asm/sbi.h>
> +
> +void machine_halt(void)
> +{
> +    sbi_shutdown();
> +
> +    for ( ;; )
> +        asm volatile ("wfi");

... the missing blanks added here, as you move that loop around.

Jan

