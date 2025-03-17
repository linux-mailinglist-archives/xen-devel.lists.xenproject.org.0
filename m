Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A35EA65579
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 16:24:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917192.1322157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCK7-0007x8-Jx; Mon, 17 Mar 2025 15:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917192.1322157; Mon, 17 Mar 2025 15:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCK7-0007uw-GU; Mon, 17 Mar 2025 15:24:15 +0000
Received: by outflank-mailman (input) for mailman id 917192;
 Mon, 17 Mar 2025 15:24:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuCK5-0007uq-FK
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 15:24:13 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e09af118-0343-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 16:24:11 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso15013305e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 08:24:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe0636dsm107679465e9.11.2025.03.17.08.24.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 08:24:10 -0700 (PDT)
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
X-Inumbo-ID: e09af118-0343-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742225051; x=1742829851; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XYUKgbyzAIVAeHY1sr9eHVOWFQx2ue/MpAiPCgFtT08=;
        b=EpgOk7I6+ZCt8+p94hhAcJ09P1lbFGLg0B5FaklwQ746dqk26MmLFAstobbkOBoTS6
         uDCobr+Rulcig57WtqtfbOCpfopIYnQK2YVA7L/GGtbGU2vTR2QCvHnXss1n62M3Qrgs
         QpXR76mP3J9dBemwwVWTJJzeN2UNjvE9Il6NfLhbu3GSyWaAJoDkRfyVdVT6IhB9AVeT
         lhP4HIdHyr3Vt6uTsp6R21qF/D4SYYxkzCwkkQH+vlV07ctGm6GEEbINA2CW1WxnrDBD
         18f4Aixzv0rxhC/S182uClquA2ARPXXxOIi2ZVvz1b/MIdAeiLedaMRwCpF9vIupaga2
         QO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742225051; x=1742829851;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYUKgbyzAIVAeHY1sr9eHVOWFQx2ue/MpAiPCgFtT08=;
        b=DIuz5OB5S9mLtRvPQy4luK8h0E6LOghR41HtzM7N2X6blu+HxunjKeGBQmXmy2Ng2h
         i0z1bL5eLGRhqCTRIz5GND57XqLFq0XuRE/fUTvjbCnEhwCyN2T1soK++4Zhm0DXLDl9
         e53TfLe6Avqop65qSUB1xa+HNYZUf3T+fqv7MZ7qzvpUASfjOdmFT+qfoMto3uMU2+2v
         xCDwgzyekM8xivrI5DvurSWIphTNimTByLUK5QgWezO32jPem3rEEDEzqnWOJtRXtedb
         EvlzftZdTomPQU6gfEF/zFCh7qBBEvtN1ghWBkNQu0olKmYu9gSRjz4qJEj+1zjwkcZa
         jeWA==
X-Forwarded-Encrypted: i=1; AJvYcCXcgOIA4oQAj8b1ujpC9oUxShsLBBqbT/FTCT6ZuA7vC/Arb9x49CZpRD1AhPo5bn3v7RAwF7+Zp1Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBK0kPKxYEhD1zQMxuvbH5B/gi6L0O+4VH4G38p+zwzVXkEhsh
	WwZ+TLVlXqN/wYvQEEhvLAy2Nn/8uMGaNliMZESbr42666P/nADWxs7gXaRQnA==
X-Gm-Gg: ASbGncvNetGAAAeQRFP65e0WpDSdHVDoKjjzy9YU9VhwrBm4JgR/iIeEu5GOzl1kyYg
	OUx4YYiDc1n/U1V2G6wZBYEV1mPx+7FDXzCj8JIOIO5FmSfGQB0ZAq9msKV3Rv7aKzAmxqVPhfV
	zy0uf3qiFUkyF+wFjXkgBd1utqw8p64ppWEw6hb4UIwUn3bYj9SiZX7DRhnyzq4e2vPyISI/Ye7
	eZYbcmoGHJL6SnFy/zMcp3LBpsxxLYdHOwM3WFxSWvDScUzK6ztTuRbbljfGFWIHgg9UUVWcgX9
	Viw09eWghlF/0VTaSDiOq1yHydnpJmwCcsgZZmT3015KuHKYMHzCvUJfLr4n/YOEuFDkCB34YGK
	JF9p02RVMjrplorBtCdtEaAp6fduAWw==
X-Google-Smtp-Source: AGHT+IELr45xvOy32TTId5G0E1zntYeN2tzwUABdKIokMkgdD5HFnqhwBbV8I/9Kpl3rtvBHb8nyrQ==
X-Received: by 2002:a5d:6c62:0:b0:390:eacd:7009 with SMTP id ffacd0b85a97d-3971f9e4956mr15068127f8f.42.1742225050759;
        Mon, 17 Mar 2025 08:24:10 -0700 (PDT)
Message-ID: <f633e10b-2bde-4574-ab87-fec5a2a52b07@suse.com>
Date: Mon, 17 Mar 2025 16:24:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] xen/riscv: introduce preinit_xen_time()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 17:19, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/time.c
> @@ -0,0 +1,38 @@
> +#include <xen/device_tree.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/sections.h>
> +
> +unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
> +unsigned long __read_mostly boot_count;

Why not also __ro_after_init? And what is this variable actually needed
for? Common code doesn't use it, so a better name (describing what it
really holds) might be desirable, even if this then means not being in
sync with Arm code.

Furthermore, I can't spot a declaration of this variable. Was it meant
to be static?

> +static __initdata struct dt_device_node *timer;
> +
> +/* Set up the timer on the boot CPU (early init function) */
> +static void __init preinit_dt_xen_time(void)
> +{
> +    static const struct dt_device_match  __initconst timer_ids[] =

Nit: Stray double blank.

> +    {
> +        DT_MATCH_PATH("/cpus"),
> +        { /* sentinel */ },
> +    };
> +    u32 rate;

Nit: uint32_t please in new code.

> +    timer = dt_find_matching_node(NULL, timer_ids);
> +    if ( !timer )
> +        panic("Unable to find a compatible timer in the device tree\n");
> +
> +    dt_device_set_used_by(timer, DOMID_XEN);
> +
> +    if ( !dt_property_read_u32(timer, "timebase-frequency", &rate) )
> +        panic("Unable to find clock frequency.\n");

Please be consistent with the full stop in panic messages. (I think there
shouldn't be any.)

Jan

