Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB42E81B1B4
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 10:10:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658682.1028009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGF3P-0005Ij-9D; Thu, 21 Dec 2023 09:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658682.1028009; Thu, 21 Dec 2023 09:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGF3P-0005GS-5f; Thu, 21 Dec 2023 09:09:19 +0000
Received: by outflank-mailman (input) for mailman id 658682;
 Thu, 21 Dec 2023 09:09:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGF3N-0005GE-I4
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 09:09:17 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b66b7ed-9fe0-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 10:09:12 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33680da01d6so453178f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 01:09:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w14-20020adfee4e000000b0033609750752sm1537722wro.8.2023.12.21.01.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 01:09:12 -0800 (PST)
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
X-Inumbo-ID: 9b66b7ed-9fe0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703149753; x=1703754553; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yrqW1/PlxKaYS19aoNg+9x4LpEq9/KEdMpuiy32bMEI=;
        b=RNmtjzKXneBRBsbjPdUp7J0WPB8+J+ZPlJoqFvX2eG87zsLoJ32yi+XriyHcO760u1
         ta9nxxvK+Pt+yLJoBYIt4EzkWpeqvirI0Vem8KogvSz8opVL/No202fasBAe/VAXXIrt
         8T2HP1pkrO+ONKpWlrdYCkGN0dJSKRz7dOJVuDK96TpqGEhr7A/uRRYZy/vx8DTgVWKf
         lN2lDaeg8PzYCWBI4m1xdmRTraSMOfQwfKFgFkvq+DPWKreBPYCFVBuvhAqYBDwEuqD3
         5+E0cCpQc1PkR0YUKuJinyoYUQ8vmk2pz1ME+PQQ5sgkHx8GE52kzjvWu+H2Cy8aUJwi
         Riew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703149753; x=1703754553;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yrqW1/PlxKaYS19aoNg+9x4LpEq9/KEdMpuiy32bMEI=;
        b=eudpwAvFSoSc/4OL2HNDRY8DezSBCppMC1te9ITv49jl8ISn7L1h+wBqpa5TnPUj9P
         sKV9lUc37LVR+obfPiYziCFNQ0xtV1jmsVCkrRg8zw7HJ6AIkl7uIDyrHNwsdgNjbRho
         HCkZ5zLuQTbflv1lT3cjixCZnzvKnFA7UbzY6x0bZ6ocX9Jn1XWic2xzTX9salFFO3md
         nPkFjmzFUzyPEr6ZQG6aNNMdUukOEluGXMVNPMywAskHFDYnLvLWW0wN3aw8ZqCsbU3z
         ITH4i5YQBHPtSrnKQFE3ukvqbXHj+0iiiYoOL5c4A4dzezhqCHRZ4igVbdpgQvnl82A0
         CPXg==
X-Gm-Message-State: AOJu0YxDA5duKr33WwZ8ABGSjWSVlORtlJkqiP8wnjCLEs/b9ZT6UKfT
	k5RusbxETJNLevDR22za/ITNbBjcG/ZV9azj/6+t
X-Google-Smtp-Source: AGHT+IHMJ0h2qk4YUQ6MpXVUkfDGFdzD0m6eRN8Jwe+dHR9jrdAI/dUB+/1A+QWxLVpFc/yQDgmP3g==
X-Received: by 2002:a5d:6ace:0:b0:336:8c13:f785 with SMTP id u14-20020a5d6ace000000b003368c13f785mr95547wrw.129.1703149752921;
        Thu, 21 Dec 2023 01:09:12 -0800 (PST)
Message-ID: <5d9754f3-8f6e-482a-a447-6e132090b4f1@suse.com>
Date: Thu, 21 Dec 2023 10:09:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
Content-Language: en-US
To: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Cc: xen-devel@lists.xenproject.org
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <e83e7254-0c90-4912-ae63-ea7221a10071@suse.com>
 <CAKm-UmbDNbeakVQtDT47o4Qc4oQvi0dqmBDb5Q=pRqTHFY0C5w@mail.gmail.com>
 <CAKm-UmZtN2o3d13cE9GyyLKfMmZ855MfrAAw9O6zE-5ob0-iYg@mail.gmail.com>
 <64d738b7-08c1-4b2c-a828-a137c870408e@suse.com>
 <CAKm-UmayUxd8F337g+BnR=_50_o__oV_PeUv9Z+9gNZ5MXYmrA@mail.gmail.com>
 <b4f46a91-b3b9-49b9-9a26-e2f962dee54c@suse.com>
 <CAKm-UmY9yYv2gOwm-O3DF7dBBNeNjs+3pDGuU+sYgJ+OHwcLNw@mail.gmail.com>
 <CAKm-UmZ1Q77EqUit9J6RX0-MCALdu4gjaU2zrX6oneW+45a+Kw@mail.gmail.com>
 <CAKm-UmYZcsY=C2Yhmy_EeZi0iAguVH0Eqy83upBLa_ikQtPwnw@mail.gmail.com>
 <CAKm-Umapq5LW9yhSOGk8TOg1iuvUogUDKbEXbUcE5T5-vVzW3w@mail.gmail.com>
 <CAKm-UmaUZ=rj-F3RvMoR7H3OvBHm1iy4PTRZAjyi=MQUVTuYVg@mail.gmail.com>
 <CAKm-Umat77MTh6=GEuH+bf1WRX+_B4-N5hY4xwADALfhj4QCPA@mail.gmail.com>
 <6ba9568a-ff8e-48ad-907f-74303e04d3a2@suse.com>
 <CAKm-UmZVoUhidEV15Xk+J_XN5a2GsBqMbXL9wqdFdoAFf_u5AA@mail.gmail.com>
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
In-Reply-To: <CAKm-UmZVoUhidEV15Xk+J_XN5a2GsBqMbXL9wqdFdoAFf_u5AA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.12.2023 17:34, Sébastien Chaumat wrote:
> Here are the patches I made to xen and linux kernel
> Plus dmesg (bare metal,xen) and "xl dmesg"

So only a single setup_gsi then, after all. Or else I must be missing
something. And there it's all consistent as well: Level/low like for any
other pin (IO-APIC) based PCI IRQ. The issue may then rather be with
xen_register_pirq(), where 1st and 2nd invocation are clearly different.
I'll try to get to looking into that some more later in the day.

Jan

