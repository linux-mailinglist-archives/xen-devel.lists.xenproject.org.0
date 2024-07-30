Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D10941500
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 17:01:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767908.1178609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYoKe-0004YN-5m; Tue, 30 Jul 2024 15:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767908.1178609; Tue, 30 Jul 2024 15:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYoKe-0004Wu-2X; Tue, 30 Jul 2024 15:00:08 +0000
Received: by outflank-mailman (input) for mailman id 767908;
 Tue, 30 Jul 2024 15:00:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYoKc-0003mk-7q
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 15:00:06 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 671a3e06-4e84-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 17:00:04 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a7ac469e4c4so917801666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 08:00:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad9101dsm659011766b.176.2024.07.30.08.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 08:00:03 -0700 (PDT)
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
X-Inumbo-ID: 671a3e06-4e84-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722351604; x=1722956404; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4zTznF0DGycIcUBkxkOh13hpTTRPBbN/qrUzfNOmm8A=;
        b=NpiVIK1PorhXG4HREbwsQgSGMMZA/iO2XmmKpW1i0EthkxRPJaFdZTFBv9K1UJr9Ul
         N9Ec/74yVfvW+lUmdmM+5CT1EPB8IZXPr1l+IzUeSeORnBQ0uGwibRToEn58jCjnnBXU
         F+upbNvEUqSYHg2KJf3dRE/XsvH3JaR/aNGNruUE2zjwdv9ppmadsJKNlmMBpHyc181b
         v9fOkCXmyfCL/ssvDCoZgsAv7cNMRnopr2c7qISaiHy8Mp+teuafZnm1iy0SZFagRP/A
         SVvlwmNqLeiFpcHktH+8CAOJY9lpQv4MKH4YQXXn4k+x81E72ILwtlQYluzODoI+MK1F
         IcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722351604; x=1722956404;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zTznF0DGycIcUBkxkOh13hpTTRPBbN/qrUzfNOmm8A=;
        b=P7arilksX6e3NSNeFchPXBg+eobhCH4+4HalOGr+h4afe29U+YsM1Os4L5UujVRiEy
         65m1HzMWiCW+J2o+qbqxKfpXmqss7KVrxRXAha2WU3l83BGvbSQJdAI8CcftCxZLTb7N
         C13xttlWOuS/EYWZsni7uxL45tDI49+8uFX8OlGUBS2hfSX4rSRe9iG1BWVlPhRRUvrG
         pOl+dPREfFCMwcQNYG/T/oi/pun5xMhr5jodQt/ugkGHrQr1MGaFg7bf73vN5yQa4N2O
         +ArNTYt3g6L6QUJaFTbgXtm2zDOCroQ3Tvpc6BCQIM2OZNTStyI6kRCRdSSA1WybvccU
         7FrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPcvUw06aRjCZE0yKVZGfXsXfvROSDqbcgr4xL0jykccONEnYn2E4ejbQrIgvc02Uzj3eft8UbAQK28FW++VgPimhkZcpVFq7f+dAvJ4g=
X-Gm-Message-State: AOJu0Yz2Vv/mmbn5Q/uJVWueZyOCD7+OOpu2ZkZbIetWsGaEdi75JiRB
	Mv/COm2dsz/JtKkyQ3iGHvfJlDUXnqbu5HQ9HiziUe3oy030wLuVdZ5ntThB1w==
X-Google-Smtp-Source: AGHT+IFQZENJCmlK8hK2mOASGnJyj98+m/qnWmlLWGu55QaL2ZHv7KuSbXdd4NUydGI1roYbO5neCw==
X-Received: by 2002:a17:907:6d07:b0:a7a:a138:dbc6 with SMTP id a640c23a62f3a-a7d8590dd7dmr236414066b.8.1722351603622;
        Tue, 30 Jul 2024 08:00:03 -0700 (PDT)
Message-ID: <8f595761-dd71-40bb-aac7-01bc5f17b7de@suse.com>
Date: Tue, 30 Jul 2024 17:00:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 9/9] xen/riscv: introduce early_fdt_map()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
 <9b1d88b2ad6ba81e925fb4a560a2a2899b5e0b36.1721834549.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <9b1d88b2ad6ba81e925fb4a560a2a2899b5e0b36.1721834549.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2024 17:31, Oleksii Kurochko wrote:
> Introduce function which allows to map FDT to Xen.
> 
> Also, initialization of device_tree_flattened happens using early_fdt_map.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with ...

> @@ -64,6 +65,14 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>  
>      setup_fixmap_mappings();
>  
> +    device_tree_flattened = early_fdt_map(dtb_addr);
> +    if ( !device_tree_flattened )
> +        panic("Invalid device tree blob at physical address %#lx.\n"
> +              "The DTB must be 8-byte aligned and must not exceed %lld "
> +              "bytes in size.\n\n"

... these two lines unwrapped, such that grep-ing for any part of the
message line will always produce a hit. Line length restrictions don't
apply in such situation, for this very reason.

Jan

