Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9B193ADA9
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 10:01:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763855.1174194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWWvf-0005O3-63; Wed, 24 Jul 2024 08:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763855.1174194; Wed, 24 Jul 2024 08:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWWvf-0005LH-38; Wed, 24 Jul 2024 08:00:55 +0000
Received: by outflank-mailman (input) for mailman id 763855;
 Wed, 24 Jul 2024 08:00:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWWvd-0004ld-C3
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 08:00:53 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d917a3ec-4992-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 10:00:52 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52efdf02d13so5859923e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 01:00:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c922cecsm617999766b.161.2024.07.24.01.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 01:00:42 -0700 (PDT)
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
X-Inumbo-ID: d917a3ec-4992-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721808052; x=1722412852; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e864SaE6RLYrcS9xg0pzLY8iOuy2IgLhlRL59RW/wBM=;
        b=Oz3QWRusxEJ8rDXFWnTksGwna9zhzybjWYXgsAcGO4JdVWvfv7mf4C7mF3FjPsA7lp
         1Wg1BirMi2ooXn9HTSrYHrvQN2yrt8KQTVckVEN0lZF/qHBdvDhv6H4b73tPb4ffePM6
         +JqXu8vLabJXcEwYmb32x60LFR6MhQUKIZR8zd8xqHNeRcCUsgKAi/k88B1kRSwPIPjS
         2ybCTJjH8PwH6JWeQCfiqeSg7bhmrWy4g7I86uFFKH3/9/Lj4NSwNnnbePensH5pcuJA
         oicT5l48C2yrvNGw7GhNbaADAFP69uc3/ct9T8txqgMGW2u81FASvUgT2ePP8YIFwBMI
         A49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721808052; x=1722412852;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e864SaE6RLYrcS9xg0pzLY8iOuy2IgLhlRL59RW/wBM=;
        b=Lva39hg3K+4LMi1hGTNm1NACTWN7VhOL2DLBfE+UC/TFOZOqzi1VOl9Q+Dkb3qguB+
         2JxV5080Ln9fCgII0fbt4xBhVWPvul2HDgT/24xbsh6Gtmua8B+809aJDqbgKVg6bLsG
         FN30A2YQj9OOVCmH3i/i2yxWQTU5JjA2HggH1qi/2x/V9GeG0gUhrEvTCFPv+GX40bqr
         COoaEDTW87IsKOWjScldVR3E5Ja2XpbwFHlKgRNal7Ua6sMG9xcg5Pqg6qwhAd4Vc7yH
         8X/3t62nIaUZUoPTZPp+bMUUdN/X8MZgDiiuQeXgcS5dv8hOo4bwup4gFgRoomIgh5o6
         8LHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYRkote4CElE/CsVwqBJMDZvnBS0aByCET8j4xCE5udeH/fHXWo0NpbTx4/VfZE8Q2LOlPIqr4BRlZ4QqX8cGcx5yTjeHjELi57MevHLo=
X-Gm-Message-State: AOJu0Yx7R/6tsFkp9a9BVViKLEQxks3eNtXgoYR6n4rOgP1i2Y4QPm/M
	dz7l99oSkkHKHP9YlHdMRtPz1+C9f3enJgqjhQWkQOGvsZ5PqyuyKIqgguK9X5ewR8YBh6wBEaU
	=
X-Google-Smtp-Source: AGHT+IGGowLoTSYCS+Q72628AekdZTtmuZ0EhquKE33QtrAaTtfr6qVza1QX14Yt0tm4FAaFqi8u6Q==
X-Received: by 2002:a05:6512:10d5:b0:52c:e05f:9052 with SMTP id 2adb3069b0e04-52fcda9b503mr1453227e87.47.1721808046929;
        Wed, 24 Jul 2024 01:00:46 -0700 (PDT)
Message-ID: <80b22fb7-f4e7-44ce-9693-db0c84c5aca5@suse.com>
Date: Wed, 24 Jul 2024 10:00:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/APIC: Change APIC reg types to unsigned int
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240723210500.248261-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240723210500.248261-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2024 23:05, Andrew Cooper wrote:
> They're all within a 12 bit range of their respective bases, and this prevents
> all the MSR coordinates being calculated in %rcx.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> There's one unpleasant surprise hidden:
> 
>   add/remove: 0/0 grow/shrink: 2/6 up/down: 18/-99 (-81)
>   Function                                     old     new   delta
>   trace_exit_reason.part                       229     245     +16
>   check_for_unexpected_msi                      73      75      +2
>   fixup_irqs                                  1239    1237      -2
>   lapic_resume                                 860     844     -16
>   irq_move_cleanup_interrupt                   683     667     -16
>   intel_mcheck_init                           1840    1824     -16
>   setup_local_APIC                             985     968     -17
>   clear_local_APIC                            1141    1109     -32
> 
> This causes check_for_unexpected_msi() to gain a CLTQ sign extending reg
> before adding it to APIC_BASE.  Furthermore it retains it's SAR from the start
> of apic_isr_read().
> 
> If the vector parameter changes from uint8_t to unsigned int, both the CLTQ
> and SAR go away and and are replaced with regular unsigned logic.
> 
> (uint8_t) & ~0x1f undergoes promotion to int, but can't be negative due to
> it's range, and I'm quite surprised that GCC-12 can't figure this out.

Odd indeed. But certainly no the only odd thing in code generation.

> --- a/xen/arch/x86/include/asm/apic.h
> +++ b/xen/arch/x86/include/asm/apic.h
> @@ -49,12 +49,12 @@ const struct genapic *apic_x2apic_probe(void);
>   * Basic functions accessing APICs.
>   */
>  
> -static inline void apic_mem_write(unsigned long reg, u32 v)
> +static inline void apic_mem_write(unsigned int reg, u32 v)

Mind me asking that on lines you touch anyway you also change u32 to
uint32_t?

Jan

