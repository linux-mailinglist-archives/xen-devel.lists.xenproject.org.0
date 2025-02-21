Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6F8A3F4A2
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 13:44:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894469.1303171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlSNy-0007uy-OC; Fri, 21 Feb 2025 12:44:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894469.1303171; Fri, 21 Feb 2025 12:44:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlSNy-0007tV-LY; Fri, 21 Feb 2025 12:44:06 +0000
Received: by outflank-mailman (input) for mailman id 894469;
 Fri, 21 Feb 2025 12:44:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tlSNx-0007tP-5H
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 12:44:05 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87709409-f051-11ef-9896-31a8f345e629;
 Fri, 21 Feb 2025 13:44:02 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aaec111762bso458433766b.2
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2025 04:44:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb8d7d3035sm1079616166b.83.2025.02.21.04.44.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2025 04:44:01 -0800 (PST)
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
X-Inumbo-ID: 87709409-f051-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740141842; x=1740746642; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVCxIce40snc4QF3I2D6iivj9aYMdB22yzT9P/T9g4g=;
        b=N+7J4NwZbIxV9X+x4mpR3ytuB75LYibvqK8sNTnMoazzmGQnTZ2Nse/GrVSNb43g3J
         ovA5N6Dnd/AUtxu/DRHn23RoNuEaj5L696q88WSpVhXee4kCKm9EOwFtTz3eK0JMHJE9
         7F2RfWMyNbWbSkw4HMpGI4ZLwpnH9V04nCUA0nznvqDmsG1uks3Sn3vFW3qz8bEmCl2u
         jUYb9PQL3wYhCmRLltUZPliyRje3dWlQ0ybdxwpSKAXnXRkv2RBExoMW70dZX6NUiaJc
         0CWbiMzJqPYUTQwXorqh+PkiIYIZfsArw2+Y6fbnWIdQFCq7+OLGpvpRyGR4so4QodqO
         UFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740141842; x=1740746642;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZVCxIce40snc4QF3I2D6iivj9aYMdB22yzT9P/T9g4g=;
        b=PeVHotoFQDTI69w8pdECM7vmQu67CRp0s66YbO/NHXHbZIKWkuccqVjMYwOzEgbiLL
         PXM1V54qulvE9DZEq5vExqmJYQcSUv120MVS+K1J6QMblfErJ2j+FN3rAokuh7zTpp7F
         wyLnTpa43tPy7rv1xS6GlUjYR3jKZwUxsOj7crDIwTioWM++sebyrJeRpJnjE4k431Q1
         zQavlzw87EZaqsflmRU7q4gg53UEjA9SRFBbGlYkRy0GbAr1mEjih7vixI78dYjcRrRf
         Zc5T+3BJ/+OSjUJSwaOZdUK9kCgK50rRhpCEf545n2kYlxi86+9KofU6MGBX2I19y3nN
         lMgg==
X-Forwarded-Encrypted: i=1; AJvYcCV0/ntGUlEy8igkOJh0hEEQMzBAq3DqDyjXz39M+ELMbyTClq3LBQ6y6NGFgNZKjbJzZ1QLGu+eQcE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx17p40jHoaMwAW05NRIT8jlyhoGl/UBWB/ELrxxLMFSd8TUtO4
	g0dtAYwQ3hvS/WHvzcEOmYR/6hgd1I5+ISGuxoFZGt6rTQRVE5xSgkKebx0LShmIMFZcXpEvBVA
	=
X-Gm-Gg: ASbGncs5nuKruC8ayCYeZSeJaAcwGh1z9hRLHuS68Owe+ulazCE+evb3McmU27Vgejc
	27dkK6SbRQ4wqUSVw/scYj2i6FmjrQuQlgBL15lisRWa+w38gGOgdSFCDexqfAiw/2uTfHkNM1L
	1urvEQeshyDzCrftLTT1H4ZEan7voAuECyZHihzmPrjNZvdbgGYLdgjyqGpfirKS55lKVq1DfOW
	qTQfKsZtPTnMWU4W9gd7Z59SkZfkzmngitIQfi/W4PNSbn8CrsrNcWdk8lYDPchANpS81AUygju
	Km+ZnJyzjGWLFQe9zYnpl3QutuOtw3LBr+Zv9rISTP8gggl2LSGkbrQ1b44xCGhOn7AtrEEWDmW
	NhEWFuYJcCr0=
X-Google-Smtp-Source: AGHT+IE3SyzRegNHpqFuXRGXeRbtp54lLh78w1ff2FErNSEWDV/Fy76XmN8dRVwJpJMwsSwF7vNWTA==
X-Received: by 2002:a17:906:314a:b0:ab7:b484:73b1 with SMTP id a640c23a62f3a-abc09a4580dmr309420166b.18.1740141842180;
        Fri, 21 Feb 2025 04:44:02 -0800 (PST)
Message-ID: <6e24ee01-9b07-4180-9430-7b5ce949d140@suse.com>
Date: Fri, 21 Feb 2025 13:44:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/msr: expose MSR_FAM10H_MMIO_CONF_BASE on AMD
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250221120417.20431-1-roger.pau@citrix.com>
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
In-Reply-To: <20250221120417.20431-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.02.2025 13:04, Roger Pau Monne wrote:
> The MMIO_CONF_BASE reports the base of the MCFG range on AMD systems.
> Currently Linux is unconditionally attempting to read the MSR without a
> safe MSR accessor, and since Xen doesn't allow access to it Linux reports
> the following error:
> 
> unchecked MSR access error: RDMSR from 0xc0010058 at rIP: 0xffffffff8101d19f (xen_do_read_msr+0x7f/0xa0)
> Call Trace:
>  <TASK>
>  ? ex_handler_msr+0x11e/0x150
>  ? fixup_exception+0x81/0x300
>  ? exc_general_protection+0x138/0x410
>  ? asm_exc_general_protection+0x22/0x30
>  ? xen_do_read_msr+0x7f/0xa0
>  xen_read_msr+0x1e/0x30
>  amd_get_mmconfig_range+0x2b/0x80
>  quirk_amd_mmconfig_area+0x28/0x100
>  ? quirk_system_pci_resources+0x2b/0x150
>  pnp_fixup_device+0x39/0x50
>  __pnp_add_device+0xf/0x150
>  pnp_add_device+0x3d/0x100
>  ? __pfx_pnpacpi_allocated_resource+0x10/0x10
>  ? __pfx_pnpacpi_allocated_resource+0x10/0x10
>  ? acpi_walk_resources+0xbb/0xd0
>  pnpacpi_add_device_handler+0x1f9/0x280
>  acpi_ns_get_device_callback+0x104/0x1c0
>  ? _raw_spin_unlock_irqrestore+0x18/0x20
>  ? down_timeout+0x3a/0x60
>  ? _raw_spin_lock_irqsave+0x14/0x40
>  acpi_ns_walk_namespace+0x1d0/0x260
>  ? _raw_spin_unlock_irqrestore+0x18/0x20
>  ? __pfx_acpi_ns_get_device_callback+0x10/0x10
>  acpi_get_devices+0x8a/0xb0
>  ? __pfx_pnpacpi_add_device_handler+0x10/0x10
>  ? __pfx_pnpacpi_init+0x10/0x10
>  pnpacpi_init+0x50/0x80
>  do_one_initcall+0x46/0x2e0
>  kernel_init_freeable+0x1da/0x2f0
>  ? __pfx_kernel_init+0x10/0x10
>  kernel_init+0x16/0x1b0
>  ret_from_fork+0x30/0x50
>  ? __pfx_kernel_init+0x10/0x10
>  ret_from_fork_asm+0x1b/0x30
>  </TASK>

Across all the halfway recent Linux versions I've never seen this. The MSR
access therefore can't be entirely unconditional, I expect. Or is this new
in 6.14, which I haven't tried yet?

> Fix by allowing access to the MSR on AMD systems, returning 0 for
> unprivileged domains (MMIO configuration space disabled), and the native
> value for the hardware domain.
> 
> The non hardware domain logic will need to be adjusted if in the future we
> expose an MCFG region to such domains.
> 
> Write attempts to the MSR will still result in #GP for all domain types.
> 
> Fixes: 84e848fd7a16 ('x86/hvm: disallow access to unknown MSRs')
> Fixes: 322ec7c89f66 ('x86/pv: disallow access to unknown MSRs')

Hmm, if we consider this a bug fix, then perhaps we'd need to go quite a bit
farther with what MSRs we permit at least read access for. More generally in
this event I'd wonder whether for any MSR that's in principle writable we
shouldn't silently ignore same-value writes.

Jan

