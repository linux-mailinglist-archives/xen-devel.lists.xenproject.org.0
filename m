Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E87C20712
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 15:03:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153742.1484025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vETEh-0005ZL-UM; Thu, 30 Oct 2025 14:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153742.1484025; Thu, 30 Oct 2025 14:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vETEh-0005Wa-RX; Thu, 30 Oct 2025 14:02:43 +0000
Received: by outflank-mailman (input) for mailman id 1153742;
 Thu, 30 Oct 2025 14:02:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vETEg-0005WU-2u
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 14:02:42 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 195ed061-b599-11f0-9d16-b5c5bf9af7f9;
 Thu, 30 Oct 2025 15:02:41 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4270491e9easo953580f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 07:02:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289998f3sm45864045e9.4.2025.10.30.07.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 07:02:35 -0700 (PDT)
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
X-Inumbo-ID: 195ed061-b599-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761832960; x=1762437760; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AIIpxdlwCUOmzKFZxheSOItWeFjhOMloaDwDc0bVDaE=;
        b=DjXvogeWgCVHwYTlPDEXvhzBN8YxYHyU768F3iQVlcgDLA97UDzQieMZvcYmGZ45ns
         aJTgMz+FZx2wdppQTq5AtDNLGoJXmtPLt/QZfDnAE4vgY8hKvehBrycA+vtvAfFtNKs1
         8D3eWLFDxnUso6PjFvOtUZd2UYRIPOAuOX4LPuwTkzBmCNVa7fknJuY6mGB77VskQSq6
         RSD0eS2IM7iwX1F4sZYIBJLVrh8WSs0raIHYCBCWia+TG2rQd7R4gq7SP06dMK/DdsgB
         1er45IWNV/tm7qsERIwQHj1TvDN7P+X6Ye6vJe3E8BvYCmx+Fw0F6AW9HDtjpXVyXyum
         XGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761832960; x=1762437760;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIIpxdlwCUOmzKFZxheSOItWeFjhOMloaDwDc0bVDaE=;
        b=EG/ueGLNhJvwWRUkEuOpr/2BFb2S/lBOvuk4RL9JYbyPau6glNgQKRdKd0n1nxF8x5
         GMpBx7BuAWhEd4uZFN4rmKteeTfPk0KApYpp2doUt5AN6ksSEKij1MfL1NyEJ/t6noBg
         YTbaoVyykfY2GqLJhxi6RV+R2Qh0TQCeKNHd4fur4O2Cx3bfrv95pebLZ9hG1EZE8R5K
         4UKozc/UtfTJN4fxvMo7JrXV+Acu/o9rvmQOZW14tRoYOIufO5ZppCvSxFF88GtffX8k
         gjCPkgEsguBTgc3o2pMaXtCl3znBJgQ5Z/Je7YlKh9H/sY+9QsqMkrm3iLPBFiXGCjV+
         fQNg==
X-Forwarded-Encrypted: i=1; AJvYcCUd+5wJBn4ayPl0RP1a6/cLuRu3d3YewvYwhw9QXMjWsIcPfDndQLXjgw/KqphA2YhygngQZ5dPpRc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZkeKhQJjGWvJ2CSAy4yjoin5gPcbKlYQyEhHntXL+dZ27teAX
	x8xz8caT0mtim3Jk45k916HKHQo2t8hfcEsN1RckUx6izrVd1t6yxb0H+j3HUnJ51g==
X-Gm-Gg: ASbGncs3W0p22/tbdU1qbq97z+O8YpU/yUBNe4SUbI0FmLSx80orbcvboYPh3P2SMH5
	D6vQorw5JSRnlPJHGh7RkHdAo2R/qXYsmYJSSOASC2IGvzseHACm42cZyEIGZigxhORzmE9G+5X
	mmrs+4+LiDjSEABmsQCKzXSF85fNj/rIWTCJe0gNWaPNMCKVWxsP7cIo2M7x6BUSMDNrYC+Ib4B
	l2UXfCUins6GaerR/5mMy9Zp5x3Vxm6zwfT6mLJOMntf5zgzgYNfwNzfocJOVfjAIILkgV7lfwj
	ZFI5QWEKHX4v9d2842GG2nhNBX4Qye2NF0+RiN31Q/Kty6YYwAwNeh5anynYCSIhU4CvBWlGE32
	DcU1mDog6NzPWawk4FFMMp5AqOhNTsxLr2gZHgo0EGEQiMIXe7HI3hlBIV/4B1xPkXd9j2Cb3pb
	Aa5XQG47o+r8anghhTCQbwI3rssxJWEJArwi5C7/VdwZWm4OL6ELxQnCYLLl21vDiFB4gzG+h78
	7kaLXrw+Q==
X-Google-Smtp-Source: AGHT+IFDB8GbDuRElEIpCogsxGFFKNQ1FkXLX4vEqgQqSINjpEhTLKuNkAMPOIkLBYfQbNbT54jbUw==
X-Received: by 2002:a05:6000:4706:b0:429:b9bc:e81c with SMTP id ffacd0b85a97d-429b9bce911mr1453665f8f.48.1761832955607;
        Thu, 30 Oct 2025 07:02:35 -0700 (PDT)
Message-ID: <453a06cc-f1ba-4ac0-af61-43c24640fd2e@suse.com>
Date: Thu, 30 Oct 2025 15:02:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH for-4.22 v2 3/3] xenpm: Add get-intel-temp subcommand
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1761752801.git.teddy.astie@vates.tech>
 <6ed4d320ca4a69ca8b05b0af45d32ff4b330a779.1761752801.git.teddy.astie@vates.tech>
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
In-Reply-To: <6ed4d320ca4a69ca8b05b0af45d32ff4b330a779.1761752801.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.10.2025 16:59, Teddy Astie wrote:
> @@ -1354,6 +1356,95 @@ void enable_turbo_mode(int argc, char *argv[])
>                  errno, strerror(errno));
>  }
>  
> +#define MSR_DTS_THERM_STATUS         0x0000019c
> +#define MSR_DTS_TEMPERATURE_TARGET   0x000001a2
> +#define MSR_DTS_PACKAGE_THERM_STATUS 0x000001b1

DTS infix question again. Actually, can't we use the hypervisor's msr-index.h here?
We already use it from the emulator test harness.

> +static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package, int *temp)
> +{
> +    xc_resource_entry_t entries[2] = {
> +        (xc_resource_entry_t){
> +            .idx = package ? MSR_DTS_PACKAGE_THERM_STATUS : MSR_DTS_THERM_STATUS
> +        },
> +        (xc_resource_entry_t){ .idx = MSR_DTS_TEMPERATURE_TARGET },
> +    };
> +    struct xc_resource_op ops = {
> +        .cpu = cpu,
> +        .entries = entries,
> +        .nr_entries = 2,
> +    };
> +    int tjmax;

Plain int? (Same for the last function parameter.)

> +    int ret = xc_resource_op(xch, 1, &ops);
> +
> +    if ( ret <= 0 )
> +        /* This CPU isn't online or can't query this MSR */
> +        return ret ?: -EOPNOTSUPP;
> +
> +    if ( ret == 2 )
> +        tjmax = (entries[1].val >> 16) & 0xff;
> +    else
> +    {
> +        /*
> +         * The CPU doesn't support MSR_IA32_TEMPERATURE_TARGET, we assume it's 100 which
> +         * is correct aside a few selected Atom CPUs. Check coretemp source code for more
> +         * information.
> +         */
> +        fprintf(stderr, "[CPU%d] MSR_IA32_TEMPERATURE_TARGET is not supported, assume "
> +                "tjmax=100°C, readings may be incorrect\n", cpu);

As per remarks elsewhere, I don't see why there is an IA32 infix here.

> +        tjmax = 100;
> +    }
> +    
> +    *temp = tjmax - ((entries[0].val >> 16) & 0xff);
> +    return 0;
> +}
> +
> +
> +void get_intel_temp(int argc, char *argv[])
> +{
> +    int temp, cpu = -1, socket;

Plain int question again, for temp and socket.

> +    bool has_data = false;
> +
> +    if (argc > 0)

This and ...

> +        parse_cpuid(argv[0], &cpu);
> +
> +    if (cpu != -1)

... this if() don't fit the (hypervisor) style used elsewhere.

Jan

