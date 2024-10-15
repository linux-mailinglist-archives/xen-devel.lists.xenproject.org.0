Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FE599DE77
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 08:34:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818969.1232255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0b7k-0002NK-C2; Tue, 15 Oct 2024 06:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818969.1232255; Tue, 15 Oct 2024 06:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0b7k-0002KC-9D; Tue, 15 Oct 2024 06:33:40 +0000
Received: by outflank-mailman (input) for mailman id 818969;
 Tue, 15 Oct 2024 06:33:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ic8h=RL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t0b7i-0002K6-On
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 06:33:38 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68841cf0-8abf-11ef-a0be-8be0dac302b0;
 Tue, 15 Oct 2024 08:33:37 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a9a0474e70eso328261866b.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 23:33:37 -0700 (PDT)
Received: from ?IPV6:2003:ca:b721:c8b5:94fc:ce22:8335:8123?
 (p200300cab721c8b594fcce2283358123.dip0.t-ipconnect.de.
 [2003:ca:b721:c8b5:94fc:ce22:8335:8123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a29822de7sm31404766b.131.2024.10.14.23.33.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 23:33:35 -0700 (PDT)
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
X-Inumbo-ID: 68841cf0-8abf-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728974016; x=1729578816; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fgxEfrimOvPF4K21x6maK2pOXQSzUV4tkiIp99DUg3k=;
        b=RUfBOnst5htgUBHnePSDF9ic+w9GPV7wg5DSDzsZmmjAbSWeIMxRSYmJP+uSKphnCs
         hsd63zqhIK0J1JG6gXO4qfE7UdpijbCljuXd38X83B1LfcvGi4mOcSj2mQuxXufLwKR6
         LWsBoR/5riWxIh6jOJJTzppwJP4sRM5BMszMM2gLwSdllAOZjn6Z7DZjQIwpnSKv1gNF
         V0mo42U3Irv6wnzac2obc5yR9kaLaeInFwBjklXw/qOso9IztL6o/QKubq5eWlITvkGm
         qAufqlQkVZJCXJhmrSFVyIMkZAnJFPv6q7d3tgYHA8nrVb/gyGVWfMDwXjyrGeJvIaWH
         eJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728974016; x=1729578816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgxEfrimOvPF4K21x6maK2pOXQSzUV4tkiIp99DUg3k=;
        b=knsOZwekWjV8B9RAW5Leu2C0KcPPsi1t8g6la9VMDHdKontFOjGYBqsjD/aEnCIWVj
         Kx+6JT6t72OIGspMOm+r6HRuIrsXqgpUFtXtlXVHbueZdSKrtkUIDw2T3z9U7sWjO1y0
         Un5YS7D23SsftUoob4TxMPs/XcCwrexewhok4kJxFHKM0rI/cYMbVsd2nkckhIo59zF2
         y0SFtN0ExNBHW7SsO7IqrBZeNZUW2sTsknRro0cIvzOITSk2LSFfl9sxqEGG4l8dW5Bi
         EuN13ijdLgn+44JobbQXAaxonwhKY8T4gRuyo5kAU8+3s3GEQp4VFt5p1zuoapyB5ZN8
         iJmw==
X-Forwarded-Encrypted: i=1; AJvYcCUQMEURODhUnaOS8/z3VzbmbOKrWo5DfMBWbSUvhrHORzthc1QI265V0ahSI46IS8VcGUWLhcrdYJk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQFx4w7Gt8S1y0TujoUTyaM6MCq7RGGp5lV+6xq7zLezEAwcah
	LEe40wq+bm3a7BhadHwm4e2vdyXAsJMq/HeP7hr7UYXcH6uU02oofCzsiw41tQ==
X-Google-Smtp-Source: AGHT+IE4V8GXYcBcQCjOaBoslyp6IovlRGWm8S9MDvk8+EMiIZZaDCjwIS3b3h+h+tSyVAM1ex8wog==
X-Received: by 2002:a17:907:948c:b0:a89:f5f6:395 with SMTP id a640c23a62f3a-a99e3b1db20mr1039997966b.1.1728974016346;
        Mon, 14 Oct 2024 23:33:36 -0700 (PDT)
Message-ID: <7e3399d7-f41c-4696-919b-dc7f57168bf9@suse.com>
Date: Tue, 15 Oct 2024 08:33:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/riscv: initialize bootinfo from dtb
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1728481578.git.oleksii.kurochko@gmail.com>
 <70c98147d7f977649ca3eb1a82cd76aeb0df1b14.1728481578.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <70c98147d7f977649ca3eb1a82cd76aeb0df1b14.1728481578.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.10.2024 17:30, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -50,6 +50,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>                            _end - _start, false) )
>          panic("Failed to add BOOTMOD_XEN\n");
>  
> +    BUG_ON(!boot_fdt_info(device_tree_flattened, dtb_addr));

We generally aim at avoiding side effects in BUG_ON() (or ASSERT()). With

    if (!boot_fdt_info(device_tree_flattened, dtb_addr))
        BUG();

Acked-by: Jan Beulich <jbeulich@suse.com>

I can make the adjustment while committing, if desired.

Jan

