Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F6787B89C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 08:36:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692944.1080691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfdf-000091-Oh; Thu, 14 Mar 2024 07:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692944.1080691; Thu, 14 Mar 2024 07:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfdf-00006K-M0; Thu, 14 Mar 2024 07:36:31 +0000
Received: by outflank-mailman (input) for mailman id 692944;
 Thu, 14 Mar 2024 07:36:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkfde-00006E-80
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 07:36:30 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 917cd516-e1d5-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 08:36:28 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5654f700705so884223a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 00:36:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a4-20020a170906368400b00a44936527b5sm424171ejc.99.2024.03.14.00.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 00:36:27 -0700 (PDT)
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
X-Inumbo-ID: 917cd516-e1d5-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710401787; x=1711006587; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k3dqRlcRe/o4vhkTOMhPU2eVhFfQTGacqRMrQJxnmuc=;
        b=aYynHamUuT8G1WdhCIanI6deIstgTOoHaJa7Hcg9gvU9wuES1WN6+tmXUzhWl7rXLP
         tq8GjSGG8DuPofA4pfJaWpa5uxDqCHreYdj7Ylrp/WoshSZIuxTSbZgTEJS6FU6oK+sL
         eEU8G38ppxdJ+UPszR7WPvWAxTelFo++Gaj9NlQI9mh8Ju0L4TkoamF9agChedOE0Nma
         w2lnCcNhjLW74ZDo0BI/mpYc5ecxWv6p1EhJ1Z1hNxFNgtq9ugHD0cHXq0QHtwMR5Ied
         o3QJIj0Uqj6avCupbd7omYjiiT3fAKFHCNpN0A+Znw4ULAi0zEF4PM0QSA9jJMMf7PDY
         RNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710401787; x=1711006587;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k3dqRlcRe/o4vhkTOMhPU2eVhFfQTGacqRMrQJxnmuc=;
        b=THi0FH1KKofXddGrUHkFcd+DTzhtfZqw9OBfypLTrva5MCMbERJszlodzya10vrAjq
         L3IAwlrV7X845IL63xEzjP5eaCzV/OfU8nFEM93+8kovVv1r+AW7Pw3n81TQN6KaVHrB
         ng3hVf3fCsL/5zO3XOmlZ1a+rxwNzQy5b/SxQO9uwDToDmimoFBfsxIZtL/ZXqWnCm5i
         vZl9xDrEYPpwRF4BPv83jcg3crc9lSonVoHvH67W7tN+ttW7Zxa3xIiJ76sQenbTrZ44
         RupObfq4ytqjlajfPCVgaRlCRyMDfiJ+UTLL24IX16RqqiEGcWCZ3ie5kLjOo9PK0oBT
         jU2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXD6wKzveT/iGIzLVWIFUPLwaMROzAp0WnFXHc+27wO/ZwXdQWTyRaIx200ApKxvgjpcP2mUuDRGck5NBxLWsCH5wg3Vrw4ljCO+DHcjr8=
X-Gm-Message-State: AOJu0YzM+aYOO725M+t4rVMsGtaVFOtNq4AlDHT6B3qmy3g5wGd0TLtP
	I+M255tGYtixVr20QrpEls/8tbfJ5Ge60OYqNnCICR3y2nbnq4jR3O18hdNKBw==
X-Google-Smtp-Source: AGHT+IFi2XyF7/kFS3zjUSX36HXApkTJui7R3HfkuSbr/GbdJuTFQgY8zWOZlNi7JJWkSLFXLL3TUg==
X-Received: by 2002:a17:907:d310:b0:a46:776b:1d5f with SMTP id vg16-20020a170907d31000b00a46776b1d5fmr117114ejc.73.1710401787629;
        Thu, 14 Mar 2024 00:36:27 -0700 (PDT)
Message-ID: <5bfd2a8e-afa9-4630-ae75-382edc943bc6@suse.com>
Date: Thu, 14 Mar 2024 08:36:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/misra: document the expected sizes of integer types
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, bertrand.marquis@arm.com,
 george.dunlap@citrix.com, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2403131622020.853156@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2403131622020.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 00:23, Stefano Stabellini wrote:
> Xen makes assumptions about the size of integer types on the various
> architectures. Document these assumptions.

This all reads as if we required exact widths. Is that really the case? Imo
we e.g. merely depend upon sizeof(int) >= 4 * CHAR_BITS. (I can see that,
while not technically required, we may want to specify CHAR_BITS == 8, at
least for the time being.)

Jan

> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  docs/misra/C-language-toolchain.rst | 44 +++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
> index b7c2000992..0d3bb2fe6e 100644
> --- a/docs/misra/C-language-toolchain.rst
> +++ b/docs/misra/C-language-toolchain.rst
> @@ -480,4 +480,48 @@ The table columns are as follows:
>       - See Section "4.13 Preprocessing Directives" of GCC_MANUAL and Section "11.1 Implementation-defined behavior" of CPP_MANUAL.
>  
>  
> +Sizes of Integer types
> +______________________
> +
> +.. list-table::
> +   :widths: 10 10 45
> +   :header-rows: 1
> +
> +   * - Type
> +     - Size
> +     - Architectures
> +
> +   * - char 
> +     - 8 bits
> +     - all architectures
> +
> +   * - short
> +     - 16 bits
> +     - all architectures
> +
> +   * - int
> +     - 32 bits
> +     - all architectures
> +
> +   * - long
> +     - 32 bits 
> +     - 32-bit architectures (x86_32, ARMv8-A AArch32, ARMv8-R AArch32)
> +
> +   * - long
> +     - 64 bits 
> +     - 64-bit architectures (x86_64, ARMv8-A AArch64, RV64, PPC64)
> +
> +   * - long long
> +     - 64-bit
> +     - all architectures
> +
> +   * - pointer
> +     - 32-bit
> +     - 32-bit architectures (x86_32, ARMv8-A AArch32, ARMv8-R AArch32)
> +
> +   * - pointer
> +     - 64-bit
> +     - 64-bit architectures (x86_64, ARMv8-A AArch64, RV64, PPC64)
> +
> +
>  END OF DOCUMENT.


