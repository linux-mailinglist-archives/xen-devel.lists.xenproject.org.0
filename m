Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1ABA6DF07
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 16:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925856.1328734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twk61-0008Dv-Pa; Mon, 24 Mar 2025 15:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925856.1328734; Mon, 24 Mar 2025 15:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twk61-0008Bp-Mu; Mon, 24 Mar 2025 15:52:13 +0000
Received: by outflank-mailman (input) for mailman id 925856;
 Mon, 24 Mar 2025 15:52:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twk60-0008Aq-Hb
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 15:52:12 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f23bc7ce-08c7-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 16:52:10 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso34547575e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 08:52:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d3bb2b2ffsm153554465e9.1.2025.03.24.08.52.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 08:52:09 -0700 (PDT)
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
X-Inumbo-ID: f23bc7ce-08c7-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742831530; x=1743436330; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zzvAt+I2r68GT3pOS05PzDNFELKJwqZweyTVgNvcebI=;
        b=RYdsOhnMAxfgJMjx4QAkwnQQdpoqbNe630WuxGo9yg80+DF52yDRgPa3bK//a6Lw4y
         9ZUnAzujumMtPwMPXuF2uJXgovThFMCVLP/xMClrK6H1895uLhe9g6DerxDdgWAF8q0o
         VJySkaXBUBCZ72WY/d9GaBRT1cfOxOCsNUJw6KFv4PScbke/yD+uxW3vH3rUwOKrFQG0
         i3e1+xCKVrlb0MFVRjro6FgwjesYv1Kzn5vCYYbi0AHa3al62tW2yZGj3ah9dX2mqK59
         Y2QMNTUeZhUnpcyChfXorBW1u5gUx+SuCJsIl1aokEec8R1SX4bysaobISpvKQLvYwZO
         Pm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742831530; x=1743436330;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzvAt+I2r68GT3pOS05PzDNFELKJwqZweyTVgNvcebI=;
        b=BePJg+5cROM9HQqpMAWT7wECPHFiKurXze3JgcavNO4NXOjDtMgAYz0R7Zy//U7iiX
         pP6qLeAxc8PvRHAWk5L44jHejINKZOXSf+RPnyGkJ+g7wCGVeDGooq6/LWhrX0Ez6n68
         5dQAYZ3fyUUY6c5QF6Lp0qr7+orrKJnNcMaySSE+ML0TFfXdfkUjVYU1eAEirQAyA0O4
         JQHhUA0DpQfSgIDZoNX7U2HwX68hPfVZrM1eyhKAl62v7Sf0smQO4uRoHuzA+mxc+W4k
         705QH/xj9rmy4vGvO78aqnquNFuebsbIJ24R8sSbvmbou7hGcpydnEx1hHTNKYCcXRwT
         Dz3g==
X-Forwarded-Encrypted: i=1; AJvYcCU3VkXceMA2ArZR75gSDj+b6baEDyt7QRHddCySb5l3VV6sKthXc3b0nytx3qLjGiUGvVtoxNNXaRg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOvnxYpDz3zmP/Dfk9zv1XH9fv2OZH9zIsiI3IfU2bVK1Ma0o5
	rkkQ7Y7s18wCrStN7tpusU/hf/bpw8j1mM1YEVON9Pb/84TLECeo9G9SjK6WOw==
X-Gm-Gg: ASbGncvZ1UDZu9Lk6HaHpWYSLRH2PthZP5QLQeHG6Ib/P0sI7IUUYYpugBm1J1z5LgT
	UNFzc/pZu9lYMXlaRzEHKOyzSKFcdXpl6/KCJDNIOPAk0q2cVpN4fudYICnpDwyyI6c2m5oMIYb
	LkZ4NtjOpHSkWLim+Bu+4JjOrtTixROIWgRmfjbMcPPafntmCpoGBCzepDCL0bdM01y4TP783nK
	eGJ4Zm4b5FumP3dt4Y0uH7xNheJ8aA6+myzaECfm9uvKD9ahgf669tGsjNWbDWKlIRQQP+gYCfW
	tnX5dxjMaDCPLzeeJY1BHME0qk1oROXaBgFByqbT6NodeDVPkOqKwpJEODN22EMIxkW3J+Ji9ef
	m1ciOQ1Sxi9ps9mvnErpeqxuWlqA7bDN39Kg4kTzX
X-Google-Smtp-Source: AGHT+IG7pDl8t1OjR99/XFBUtWu7BPuPDRkU1bV0Bkxa+BbR3yH/whxJfp4cr8c2ii6Vv7M3NvVyPQ==
X-Received: by 2002:a05:600c:470f:b0:43c:fe15:41e1 with SMTP id 5b1f17b1804b1-43d509e190fmr124159225e9.4.1742831529822;
        Mon, 24 Mar 2025 08:52:09 -0700 (PDT)
Message-ID: <942a11ad-c24c-4079-a0da-339ca548c569@suse.com>
Date: Mon, 24 Mar 2025 16:52:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/15] xen/amd: export processor max frequency value
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-9-Penny.Zheng@amd.com>
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
In-Reply-To: <20250306083949.1503385-9-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 09:39, Penny Zheng wrote:
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -56,6 +56,8 @@ bool __initdata amd_virt_spec_ctrl;
>  
>  static bool __read_mostly fam17_c6_disabled;
>  
> +DEFINE_PER_CPU_READ_MOSTLY(uint64_t, amd_max_freq_mhz);
> +
>  static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
>  				 unsigned int *hi)
>  {
> @@ -681,9 +683,15 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
>  		printk("CPU%u: %lu ... %lu MHz\n",
>  		       smp_processor_id(),
>  		       amd_parse_freq(c, lo), amd_parse_freq(c, hi));
> -	else
> +	else {
>  		printk("CPU%u: %lu MHz\n", smp_processor_id(),
>  		       amd_parse_freq(c, lo));
> +		return;
> +	}
> +
> +	/* Store max frequency for amd-cppc cpufreq driver */
> +	if (hi >> 63)
> +		this_cpu(amd_max_freq_mhz) = amd_parse_freq(c, hi);
>  }

As before - typically only the BSP will make it here, due to the conditional
at the top of the function. IOW you'll observe zeros in the per-CPU data for
all other CPUs.

> --- a/xen/arch/x86/include/asm/amd.h
> +++ b/xen/arch/x86/include/asm/amd.h
> @@ -174,4 +174,5 @@ bool amd_setup_legacy_ssbd(void);
>  void amd_set_legacy_ssbd(bool enable);
>  void amd_set_cpuid_user_dis(bool enable);
>  
> +DECLARE_PER_CPU(uint64_t, amd_max_freq_mhz);
>  #endif /* __AMD_H__ */

I'm also pretty sure that I did ask before to maintain a blank line ahead of
the #endif. Please may I ask that you thoroughly address earlier review
comments, before submitting a new version?

Jan

