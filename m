Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8AEB00090
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 13:29:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039370.1411227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZpSy-0006ad-MS; Thu, 10 Jul 2025 11:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039370.1411227; Thu, 10 Jul 2025 11:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZpSy-0006Z4-Jg; Thu, 10 Jul 2025 11:29:28 +0000
Received: by outflank-mailman (input) for mailman id 1039370;
 Thu, 10 Jul 2025 11:29:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V320=ZX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZpSw-0006Yf-Ui
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 11:29:26 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 212ac895-5d81-11f0-a317-13f23c93f187;
 Thu, 10 Jul 2025 13:29:24 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso823964f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 04:29:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de435b7e3sm17736385ad.224.2025.07.10.04.29.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 04:29:22 -0700 (PDT)
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
X-Inumbo-ID: 212ac895-5d81-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752146963; x=1752751763; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UtnzDmjesA+augj5YKIJQQVqm7poV+vIpwtGst2ZIYs=;
        b=Gtuq3DekwyipTjOPCOx8T39eL3qYHBy3mxYtrr4Yxl4P9e6937DZkS7jrd4vZITt3F
         F3i4cEI67Apqek0/8VUX3NJo2CnHfFiJP8AwFSDCqYx9B0rupC50Pnw04o/DppOuKGRu
         A5wMpljYojbDesUNz0+BItajdd6GoWAHH9LQqDdnJ3TPvnwB6Yl8S/TgT8ieFB+X13LX
         iyp3QYvT+DulaSdwMsw0u1GullUO1046X8AY34JI/UsAC4pPnj1JHd3QG+GeeYSX/07m
         mpn8vLq1SoHTdVspeu3T38kkaXBMw2q6JQybh8kdHaHMXc31jYPzoWJHJ4SWLKzGpjX/
         szQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752146963; x=1752751763;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UtnzDmjesA+augj5YKIJQQVqm7poV+vIpwtGst2ZIYs=;
        b=ulR3boUyN3KuNQzhjXONTrN/MXfkTc7B+hq36b9Lm4HYU39+emqpaLIRNNy7YWv71G
         X+JOdKEbojH1tEQJl7X2fpvXyuP7bniQuuqoFEoQ1hS6jIeck1zGKhAkSoMmvu6s2rcn
         f0zme4rTZ1mF77+Il9hIJcDSLi7SPGiv5JZCFnD0CClpam0iYxTpqHskZGURmw3OdMqw
         dzeTGtqWXcLEA6tBUkpUrbfmUnRPy3kE4Bf/MZPyzXJ4Z2txAxcwVWH2e1BfTV/y5PaJ
         t1V+EPtXigshrFZNdA61fljwR64fppKwwmhr9kzfqi5uHNhk157jYeeoawT7ptxslGcI
         Blnw==
X-Forwarded-Encrypted: i=1; AJvYcCW+SjAWXcuQOC70R+F00O+8iKh3up/XIENmzFsUgvVTXgLobFrI+SnAE0Eov33LQVq6n8CwwmtfDD8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwG8PefPcvSrrUCaTr8rWgyON6JlKgCWpiw2UAIwrwTfLToLpEc
	ry1Y5P2DyIeWQhkizy79s2a5paC1w66XOkckv6LjlDsJgTfKktZ0EhpSNkByaghXgw==
X-Gm-Gg: ASbGncu4e4IzeR2eWFdSq5zcycA0u5zY7mxpdNIFr116wAvP3cyNiGia3OB54oZISIX
	Qu2FfZjO/Bw7ZjV1cSrzD6GyMWbdfcgItcKoN6DdqfI4E7qQlsMSIBEYdvC3MO5nSce+f7sVsac
	GMmqacANkyHO10/Q3QM5mn4yelzbFUGcLWolJiRQRd4KRKXzDKx29KSO6bk3DIBiDv5Hpt2mfS4
	P2XQyMj0DJdm5tULHorRyeBK0B4ec1N7wSd4ZQXLaP27uD5tNk0Uz329/P1+zgFeZJespCQvPRG
	oea1M/T0/gwS5IAF1y4ckZk7YHerpQU82OhAd4PYvzozmAd/Db2xif1elRspjGRo/MG16HpFQtM
	KNjVGez6xHvQtzCzwX3w2It/UoHNlPiv6l78LodbAIWs3o7E=
X-Google-Smtp-Source: AGHT+IHuahhQZWPWHKrTQMfPdlqUDDkex7t8FPeDlUHXXyVGEC7LGFgBzwSk026w/BU8PNob+c2gRQ==
X-Received: by 2002:a05:6000:490f:b0:3a5:27ba:479c with SMTP id ffacd0b85a97d-3b5e86bef07mr1991395f8f.43.1752146963261;
        Thu, 10 Jul 2025 04:29:23 -0700 (PDT)
Message-ID: <52f6418b-fd1d-41eb-834c-991f7c61d729@suse.com>
Date: Thu, 10 Jul 2025 13:29:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] xen/riscv: aplic_init() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1751876912.git.oleksii.kurochko@gmail.com>
 <a15b1426f14bb8f7f6385db9c13e584b55e4c91a.1751876912.git.oleksii.kurochko@gmail.com>
 <c49cf7bd-fbff-45b0-ab0a-ee8020d910f0@suse.com>
 <54d180df-3980-4f90-a8fe-519aed9e1870@gmail.com>
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
In-Reply-To: <54d180df-3980-4f90-a8fe-519aed9e1870@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.07.2025 13:19, Oleksii Kurochko wrote:
> On 7/8/25 3:58 PM, Jan Beulich wrote:
>> On 07.07.2025 11:01, Oleksii Kurochko wrote:
>>> +static struct aplic_priv aplic;
>> Is this altered post-init? IOW can it be __ro_after_init? Or otherwise at
>> least __read_mostly?
> 
> Looking at the current downstream code there is, at least one case, where aplic->regs
> are changing (during vaplic_emulate_store()).
> So __read_mostly would be better in this case.
> 
>> With these two taken care of (one way or another):
>> Acked-by: Jan Beulich<jbeulich@suse.com>
>> If you clarify what is wanted / needed, I'm also happy to make adjustments
>> while committing.
> 
> It would be nice to do the following:
> - Drop the inclusion of <asm/imsic.h> in aplic-priv.h.
> - Add __read_mostly to the definition of the aplic variable.

Actually - no. Patch 4 adds a spin lock in the structure. That way it's
definitely not mostly read.

Jan

