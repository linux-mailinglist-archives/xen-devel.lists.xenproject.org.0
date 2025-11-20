Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F89C75357
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 17:03:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167632.1493899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM77R-0004pz-8L; Thu, 20 Nov 2025 16:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167632.1493899; Thu, 20 Nov 2025 16:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM77R-0004o2-5b; Thu, 20 Nov 2025 16:02:49 +0000
Received: by outflank-mailman (input) for mailman id 1167632;
 Thu, 20 Nov 2025 16:02:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nz19=54=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vM77Q-0004nw-20
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 16:02:48 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ab9ee3f-c62a-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 17:02:46 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-64088c6b309so1857605a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 08:02:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-645363c56a4sm2379884a12.15.2025.11.20.08.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 08:02:45 -0800 (PST)
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
X-Inumbo-ID: 5ab9ee3f-c62a-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763654566; x=1764259366; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g9L21KdchEvtWYcrwk1vAhkbpl6vGAU/rGymye3VgZc=;
        b=enxjicWXWmexKs1rqO54G8fp6dn6EyRbm2cPW51O8aj87ZbWiHSPgYjddk9wVPKifr
         klysG/STHteX+w5iMk3rnPJv/jr2E0nzHV7Din/ulgWTsNwliHq0x0O0ETgdbWvKfLgE
         uk+YshJs26vRzL+j5gMQGXmCB3+d1MJUrZX5LWnEIwvokYofMvBC5FYhsdHgh82s5p+A
         UJOlxM4yMOBsxs2mkHcg0DN8+q9ZKSGfdSFJFbtssW6oUwjMpG6kGpF/4TcPFRcK9w9H
         oMkv1TW0j/0uzTG+nhiqstswo2XYowIQ30yY24IRKRkdsQZ9oeqzbeUdK/ewXypsR9Cb
         kU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763654566; x=1764259366;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9L21KdchEvtWYcrwk1vAhkbpl6vGAU/rGymye3VgZc=;
        b=m0WgsrXPnL2uEkUTdJI85eeUPv3sW28rmCE9AOkKeMSBtLhEBNJJCgM8AA4ZSrE8YX
         xCiIUn7se8YPa8zR4nRpzo3ozAqdyS92VY2e5cdCH0hRQ8qvP4Jw1Qvk1zX9jOzi+BTN
         ZRw411cnVtOdJX9A7vMNCR8H96BAaUhLN790uJfSTgb6+tkaHdmI69QBLO64yx/O4gEM
         vNM5JqWACqfT0lhrOdyI0nTmMNsHc4CVEQOvLh27xbQMFFlOeFKqyeMysqHlvoQVKFNv
         juOAJddTck5LBw+6oh6Y+AWu7LsbnB/VF21yfVqPlEKmukL024g4oF2EoYNHjE9rFlMw
         bS1g==
X-Forwarded-Encrypted: i=1; AJvYcCWbTdwgFmCU5hV3og4D14MR4LncIIA2IMiv/5fM0x6kbOAkQneJHuhZxkTLSZmG5SzHDHkvPUZaino=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypcrQrlFROpsJ55Ry6yw4ioxOrb4AEvHE1SHSvcH/ZLHwoByEm
	MzIf4cr/lGZcJ8QxMSaXTp0tdMCcC1n5zJPNGJ8ZjQPTSfBTenUaiayYfr45IexIgQ==
X-Gm-Gg: ASbGnctJRU1hnCY1/0HRFPaprel0u0kP7D/2/pTsPdEtBdfDVjxa48JXUxGhTI9856+
	hJbgnz3azqWxirEoX9A8vuh2tZaKa8AzSne8akzdfcG7a6jN2OL2HRePzlF4d4ScxhNQ3GUV5iT
	9wRdG40gF/uh7/uIeRPO0HZ5u4d1XCAkf119UrSQ8KiUAAIt/wy6lWOAxTTMpvMZvbdbXRzMaWM
	m1BAdQ1yOCtBRB6JZjsl9kJizsdu+iw/JCvqXJw1S/iZJlhmZmyb6beeO2A2jjXj8L6SBZb0Gxh
	IrzI5H9Uyf1g3DGF92j0S33GcxFYdmGp8TytiU/IlIMJzOrd2LVBJHf5EUXteuTaT1TGqpMfXBs
	jVa72Yb7jgIym/hFg0m4eG5uwoAEk9VUBg5UqdHShYOydUsGcca4fXRbDPAaNoD6H/wPrKahlub
	X93Zhibd/z6Z64dBHRIBM2Yus/hoF4/DF5Ci/Ca7IS2DrcnoOhVkLesAaTC/OU1x0d9/XmlIk6B
	GezMzvT4lLCsA==
X-Google-Smtp-Source: AGHT+IHgDsCdkeMs1PzwlsB2Jzpb0k83VV0IVKbsx6z6zx/eeU3U4xTaD2fx3ZwkPkEO3tGMcf/qVQ==
X-Received: by 2002:a05:6402:4302:b0:641:8644:f87f with SMTP id 4fb4d7f45d1cf-6453643ceebmr3582291a12.17.1763654565658;
        Thu, 20 Nov 2025 08:02:45 -0800 (PST)
Message-ID: <d439b007-ecc1-4c62-95f0-6fc73d85ce36@suse.com>
Date: Thu, 20 Nov 2025 17:02:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] x86/io-apic: fix usage of setup_ioapic_dest()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120095826.25782-1-roger.pau@citrix.com>
 <20251120095826.25782-2-roger.pau@citrix.com>
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
In-Reply-To: <20251120095826.25782-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.11.2025 10:58, Roger Pau Monne wrote:
> Attempt to clarify the purpose of setup_ioapic_dest(), as the comment ahead
> of it is outdated, and looks to be a verbatim copy from Linux from one of
> the code imports.
> 
> The function serves two purposes: shuffling the interrupts across CPUs
> after SMP bringup or re-assigning all interrupts to CPU#0 if no IRQ
> balancing is set at run time.  However the function won't perform any of
> those functions correctly, as it was unconditionally using
> desc->arch.cpu_mask as the target CPU mask for interrupts (which is the
> current target anyway).
> 
> Fix by adding a new `shuffle` parameter that's used to signal whether the
> function is intended to balance interrupts across CPUs, or to re-assign all
> interrupts to the BSP.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> I couldn't find a specific Fixes tag to use here, I think this has been
> broken all along.

Perhaps dddd88c891af ("Auto-disable IRQ balancing/affinity on buggy chipsets"),
which is where the 2nd use of the function was introduced?

> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -717,12 +717,14 @@ static int __init find_isa_irq_apic(int irq, int type)
>  static int pin_2_irq(int idx, int apic, int pin);
>  
>  /*
> - * This function currently is only a helper for the i386 smp boot process where 
> - * we need to reprogram the ioredtbls to cater for the cpus which have come online
> - * so mask in all cases should simply be TARGET_CPUS
> + * This function serves two different purposes: shuffling the IO-APIC
> + * interrupts across CPUs after SMP bringup, or re-assigning all interrupts to
> + * the BSP if IRQ balancing is disabled at runtime.  Such functional
> + * distinction is signaled by the `shuffle` parameter.
>   */
> -void /*__init*/ setup_ioapic_dest(void)
> +void setup_ioapic_dest(bool shuffle)
>  {
> +    const cpumask_t *mask = shuffle ? TARGET_CPUS : cpumask_of(0);

Don't we want to aim at getting rid of TARGET_CPUS, which is now only hiding
something invariant? IOW should we perhaps avoid introducing new uses?

Jan

