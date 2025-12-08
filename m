Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DB5CADBC2
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 17:23:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180940.1504035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSe0U-00067W-8v; Mon, 08 Dec 2025 16:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180940.1504035; Mon, 08 Dec 2025 16:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSe0U-000660-56; Mon, 08 Dec 2025 16:22:38 +0000
Received: by outflank-mailman (input) for mailman id 1180940;
 Mon, 08 Dec 2025 16:22:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSe0T-00065u-FB
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 16:22:37 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a4294c4-d452-11f0-9cce-f158ae23cfc8;
 Mon, 08 Dec 2025 17:22:34 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-477b5e0323bso29493095e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 08:22:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479311e712fsm255673825e9.9.2025.12.08.08.22.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 08:22:32 -0800 (PST)
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
X-Inumbo-ID: 1a4294c4-d452-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765210954; x=1765815754; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mk8PxYWGsC5xpEbfFbAkZZOsjHO6VGK2YuOX+AiKTtg=;
        b=bG2C+6UYPkpSJvO4Wa/QT3Hr3NTQd7F+pjoNM2m0zQQb1hhNIfmdM1EgEhiLH/vznk
         nD3xWXMq/RN8dfqroX+tb+5AT6Myw1lNPJt6sKo1mlotmbXmovBOhU/P3u95O8wQhFvJ
         RoSccDR9e1nsv6+tAvetsM1LObvbX+F4EnWczlRKoKaytWK0TygJtCyR0mU1fsra95sn
         vK2fXCl6dKeFx3CoEYSD22KBYKRIPdlCh7sVOUuJLXYyWg8amD8KPnGJD/IjGldXe/tC
         IGjaOiaf9Nfy6zmuT+8ikdckqqzRzWu/O5zD9tx+E3RKF1denuGYXRvnq7cUFXSparJ+
         GV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765210954; x=1765815754;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mk8PxYWGsC5xpEbfFbAkZZOsjHO6VGK2YuOX+AiKTtg=;
        b=MBRVdrqjuNUdhPIvIc3MvrMAoGSaIMpMlnflymyN2fUpGaAdpZ0Y67VGLWzSVaWEdD
         lY/GcFLkCv2N67yZqD8EtE+VUSteC8cEIZzRSd8gL860qgSlTl6vqJbaweXQcpBy+pyY
         2DANv5B/FAp73ktR4ubUpoX1Hn5R9gJFj8mjL64GgvcrA18daz6lItHUSZzsu7ftBN29
         kdyMrWT1uhgOfIqs8l3QX2dHjpwa/9V1Cfn6BxGWnQXIZ1PhWCicffc4Kp1uz16MqItV
         ErBoL1dPGYZ49QX02EspppNHCLBxBbfMb2FfnIjmHHo9hzWlzCB2RLsx/ugyjliLlcRj
         0rPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGJiUQEByFhHPTQiKDx+tTnqfS/0PRpPaIEZs1XyJ3NMCVLpv00il7AlxNhRNuS6ktPHHzoMR3+Vk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyk3bhAHqYCdI+8VH29q9On7APwOVz9V9+R60/CGlvSDKUJaCpm
	b7arMx4vr8UaiYUmJ5isa56/2DEhAxqHPpu9dxh0H2gy7R571asm/RKRdbsuAOqmeQ==
X-Gm-Gg: ASbGncvcf+Dmg63bwnexrJNjML0J1AjOczRB35cbJpXIpjmyr6U5ZTxvAt5aksGTWQU
	MkWlgzLgs8jRMzccvp8uFzFAdXagD5wsWEgv+hSLRRBGHTkOQduA3r0Khp5dN8ZGsw5imQ8MU/x
	5UFL8X0pOB2x2IBoVgOTTN8+zPiOvg/VeW08JeBv4lik47I4TRwFFN3wIZJlXZoW7JHGxtDRwHz
	Sv8W2TGgpkwhBOmvBgjfKXtx4MFz5bboh3ckpwtjV6fQKPRyFs1QgZYLm1SzVHLHXWZJWvKOvFr
	l8O0XD8s2xMbhyOmmXLz9oUua9yS+jzMQ3Bmq7lTHnSesIwym9wqnHH4VDZaQ5RpaiJRiQwA4BD
	0kWE1xOA1MkU+6FXovNc5pxmwD00+OseEBWqHFh7QfMW05blc8bljlWQbYwfnP47gkwkW0IvkHz
	jDyuFXoNqtfId9HLWVZa17CmR+Z7X0/D5ijxKChaEzFSdWVsyY1ttRt2TztRSlDzpB3B3ih3wQU
	6k=
X-Google-Smtp-Source: AGHT+IGRkuWmQJ+83eh3oHAt1OCZfRX2hCw5BwjLsm57j4aXVvZtO+DhQ+gKch0ANCx3ZcQ4sLfwcA==
X-Received: by 2002:a05:600c:78a:b0:477:75b4:d2d1 with SMTP id 5b1f17b1804b1-4792eb73092mr113938295e9.15.1765210953608;
        Mon, 08 Dec 2025 08:22:33 -0800 (PST)
Message-ID: <67c222b8-fafe-4af4-be5e-2eb4638af4cf@suse.com>
Date: Mon, 8 Dec 2025 17:22:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/19] xen/riscv: detect and initialize G-stage mode
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
 <0e32a6bd86828952d7494b8d49b48d512f53cada.1763986955.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <0e32a6bd86828952d7494b8d49b48d512f53cada.1763986955.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2025 13:33, Oleksii Kurochko wrote:
> +static void __init gstage_mode_detect(void)
> +{
> +    static const struct gstage_mode_desc modes[] __initconst = {
> +        /*
> +         * Based on the RISC-V spec:
> +         *   Bare mode is always supported, regardless of SXLEN.
> +         *   When SXLEN=32, the only other valid setting for MODE is Sv32.
> +         *   When SXLEN=64, three paged virtual-memory schemes are defined:
> +         *   Sv39, Sv48, and Sv57.
> +         */
> +#ifdef CONFIG_RISCV_32
> +        { HGATP_MODE_SV32X4, 2, "Sv32x4" }
> +#else
> +        { HGATP_MODE_SV39X4, 3, "Sv39x4" },
> +        { HGATP_MODE_SV48X4, 4, "Sv48x4" },
> +        { HGATP_MODE_SV57X4, 5, "Sv57x4" },
> +#endif
> +    };
> +
> +    unsigned int mode_idx;

Can't this move ...

> +    for ( mode_idx = ARRAY_SIZE(modes); mode_idx-- > 0; )

... into here? You don't use the variable outside of the loop.

> +    {
> +        unsigned long mode = modes[mode_idx].mode;
> +
> +        csr_write(CSR_HGATP, MASK_INSR(mode, HGATP_MODE_MASK));
> +
> +        if ( MASK_EXTR(csr_read(CSR_HGATP), HGATP_MODE_MASK) == mode )
> +        {
> +            max_gstage_mode.mode = modes[mode_idx].mode;
> +            max_gstage_mode.paging_levels = modes[mode_idx].paging_levels;
> +            safe_strcpy(max_gstage_mode.name, modes[mode_idx].name);

This looks as if you were overwriting .rodata here (the string literal
"Bare"). You aren't, but why can't the whole copying be a single struct
assignment?

Preferably with the adjustments:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

