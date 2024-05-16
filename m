Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A57578C7434
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 11:55:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722972.1127442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xpq-0002TS-AB; Thu, 16 May 2024 09:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722972.1127442; Thu, 16 May 2024 09:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xpq-0002R4-6d; Thu, 16 May 2024 09:55:38 +0000
Received: by outflank-mailman (input) for mailman id 722972;
 Thu, 16 May 2024 09:55:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7Xpo-0002Qy-FX
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 09:55:36 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 703aa883-136a-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 11:55:34 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a59a5f81af4so277263566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 02:55:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781cd85sm978438466b.15.2024.05.16.02.55.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 02:55:33 -0700 (PDT)
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
X-Inumbo-ID: 703aa883-136a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715853334; x=1716458134; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bPEWXnJFwSWKDG4uety0TCU2Veg1SqzueaAjNBWUjN8=;
        b=W8Q7JezUr6Udk4GD4ufThdcZBBOwFReJBJq6jV9953MooQHwVO9ytP/dolR7kt1iAr
         7J5zV3J/TxJ/tbnfN7O+zOLLxp2gYpceRegVY0NfE/RUesQx/2xfmxon2Wfrlh/sJUgi
         uFN0tWEzAXdhR92cQlAXcsg6Ff//t7OEPYf2JVG3nzQQWoCXMu+Zbkc9Y64cOl8oD5Pu
         M6MWVZ6FZE4st/CyCMhgeZloyUS9afn6m1gR2oKP0CHuES7SSi/Nshgcm7AO1bIGbY6q
         v2u8ZyRQV9m5ZBoraSe/W/wkWUtml92SNfTcA033IOTviRsWKNjWHfCZjBU+beNM8Gpq
         QhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715853334; x=1716458134;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bPEWXnJFwSWKDG4uety0TCU2Veg1SqzueaAjNBWUjN8=;
        b=OH5TUFqUcnC2bA5/dsGtFJZGnhNLWv/XZGpB2qT78d1UEfwU2dXeGliS2Z5ZsETuUc
         nbmQblFsGzaY6/vGaEjThNTLtWf88nnYHaarxgr0LB+eiU1X1bwAyS3T52Fo3zmQUWws
         N6T6aTIWyHbHzrG49I1v4F0cLJJmdrqzxskLpKvyPcAV7fD02BYpb53TbrzvO+/DbhO4
         7KvhsNzD8CF+9bLTTa6xwonlFO4zwJDP9XBYFbgwK7qgOtd7njnAw+lwzC4h5WaGLCT3
         FoIs5Fwf6/VWdc3GBObf8SmeJxEjPGSCq4ZzLU8S4fRBas0XQm+SFGhll4CKi7U75qTZ
         fRew==
X-Forwarded-Encrypted: i=1; AJvYcCVj1SA7UgOhy0KYOCsIzq3LwSerdl+AZ4hyqnYJZrG1Cibfhn0yTWVYMcagewT66ntZw5/lhotlGWsLw3CTl5HLLy3FcgiwRRklaTn0+mU=
X-Gm-Message-State: AOJu0YytBFE2qEKwbYxO/wbrKmJyYvI0L2hNF+qVw9wnT+mOQKAMVTyl
	eaHwvQWapm+p3kA046IdjiQ1Hvcu5ZrDaNU97KK61ekyOYS8SxPgwdZojkXHNg==
X-Google-Smtp-Source: AGHT+IEXv69L8au3xd3YE4PBVv1qBalmdacjFNWTQwVLZTnmknG0XF6Qbeji/Zns3Y7BrjBEuVlMaQ==
X-Received: by 2002:a17:906:3197:b0:a59:cf38:5339 with SMTP id a640c23a62f3a-a5a2d55a6e6mr1317821666b.6.1715853333761;
        Thu, 16 May 2024 02:55:33 -0700 (PDT)
Message-ID: <beff1c5b-8a6c-41b9-a451-e5f656c654b6@suse.com>
Date: Thu, 16 May 2024 11:55:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 6/6] x86/MCE: optional build of AMD/Intel MCE code
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1715673586.git.Sergiy_Kibrik@epam.com>
 <def311f3206f29f919a921d459442641fc293031.1715673586.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <def311f3206f29f919a921d459442641fc293031.1715673586.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.05.2024 10:28, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/cpu/mcheck/mce.c
> +++ b/xen/arch/x86/cpu/mcheck/mce.c
> @@ -38,6 +38,10 @@ DEFINE_PER_CPU_READ_MOSTLY(unsigned int, nr_mce_banks);
>  unsigned int __read_mostly firstbank;
>  unsigned int __read_mostly ppin_msr;
>  uint8_t __read_mostly cmci_apic_vector;
> +bool __read_mostly cmci_support;
> +
> +/* If mce_force_broadcast == 1, lmce_support will be disabled forcibly. */
> +bool __read_mostly lmce_support;

While moving these, did you consider switching to __ro_after_init? Preferably
with that
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

