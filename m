Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6996F84CF52
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 18:03:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677838.1054726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXlK2-0008JQ-LJ; Wed, 07 Feb 2024 17:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677838.1054726; Wed, 07 Feb 2024 17:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXlK2-0008HS-Hz; Wed, 07 Feb 2024 17:02:54 +0000
Received: by outflank-mailman (input) for mailman id 677838;
 Wed, 07 Feb 2024 17:02:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXlK0-0008Ax-Vx
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 17:02:52 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9d1cacd-c5da-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 18:02:50 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33b29b5eab5so578956f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 09:02:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l4-20020adfe9c4000000b0033afb963d0dsm1910765wrn.101.2024.02.07.09.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 09:02:50 -0800 (PST)
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
X-Inumbo-ID: b9d1cacd-c5da-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707325370; x=1707930170; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L65Bs2/pfBg+seYP0MIV5oa3dLYjzOjXBK7CtBddhoM=;
        b=PHAP7xDvdEjpmsh0K868QfzPt+KVC5dAI3BROYuD/Uoxeoh1lIbo837ryXApgVXotx
         K5HSsi6ZQmJH+mHPOOO1Nn0SnIHEl/rqHQZ4slUhRjyBIT1ww/Sy5/ztgEoftUwSwCzo
         hkP9rvtdoAesPdvn1S1/eeHWORnchS8VypxpSkAZ3XoxEQzrU3MpPvM6zPYD0M7qdMIC
         lkdskUfdYeFiBw5sUF9fm8HdLsy+LcSPeWLL4n3eObIjngWuGzwzBZX11auw/rc4YGtE
         bPKql94giNjdT9ST9xrBaqwFak3s9qqCyKGnK/F98qY6qzSjQS0cKDp8KqVmwuG3WgdP
         mIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707325370; x=1707930170;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L65Bs2/pfBg+seYP0MIV5oa3dLYjzOjXBK7CtBddhoM=;
        b=QDE07KcbHC/vsoeqkhk+wDD+jhk6zS2j+kCZK2nMYeSjEQCgO3HAnqmekxzdttnfZR
         QUIfwqUfH9YWrunvbinz0VTmYMYkGtfIBHpgo1g279i1DNJQaTkplOsKHOARPb66rhCk
         ruKKH6K1WfelGl8lQk+oXOH8JEz+9wG75Np1rR3ApiTNEdLamXl+g/HRTmEluVKKBZyK
         Wij6/DyAOXdTV0wMI0dGt/aC1/MQmaNC9zzQuwZvfoKrCNDfZr4ZJQ7ZIxI3yHQuq4p3
         iKA34/CwfAVNUYby/564t6oxOYjyH1uA+lk9iGF0v86jFn8dD5bXup60TWQAJqY2fErl
         zx+Q==
X-Gm-Message-State: AOJu0YyqibqYN6wfIq9fooFiKEYnxe2+4tP7G9WJf31pIx1AY1hbZ2vW
	dqqqlZkbX5tf9mrtuo9bzKI3am5xjKaydeHMdalCpJ9LIoRITphFfqAnHpRjxg==
X-Google-Smtp-Source: AGHT+IHkAx6Vu784Vhd6LABljCFiMqpRaHpKheDLXBdrcNEPy8wjzaFenR/xLN/oJGLzizGD/R7kxw==
X-Received: by 2002:a5d:4cc5:0:b0:33b:5216:ef2b with SMTP id c5-20020a5d4cc5000000b0033b5216ef2bmr890000wrt.3.1707325370216;
        Wed, 07 Feb 2024 09:02:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW95E5ivFZXn4pivFxjWdSVdI7m6xwtnhGkg8bTyWyPPFjM7CWV2DYwpajAshDfKGf2FzaoZcrH4MaNdChITtfbPlsc+yT1H7daxqjmEHOsVECWC53nKQf09Q/cR1jU6cGnbaO4pSTQ2V1xxIZhCZy/CIZh6EA=
Message-ID: <a9a44e5d-80cf-404a-abe0-985a11f6d668@suse.com>
Date: Wed, 7 Feb 2024 18:02:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/9] x86/smp: call x2apic_ap_setup() earlier
Content-Language: en-US
To: Krystian Hebel <krystian.hebel@3mdeb.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <7c13554e60cc76516922992b7faf911b91f99a2a.1699982111.git.krystian.hebel@3mdeb.com>
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
In-Reply-To: <7c13554e60cc76516922992b7faf911b91f99a2a.1699982111.git.krystian.hebel@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2023 18:50, Krystian Hebel wrote:
> It used to be called from smp_callin(), however BUG_ON() was invoked on
> multiple occasions before that. It may end up calling machine_restart()
> which tries to get APIC ID for CPU running this code. If BSP detected
> that x2APIC is enabled, get_apic_id() will try to use it for all CPUs.
> Enabling x2APIC on secondary CPUs earlier protects against an endless
> loop of #GP exceptions caused by attempts to read IA32_X2APIC_APICID
> MSR while x2APIC is disabled in IA32_APIC_BASE.
> 
> Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
> ---
>  xen/arch/x86/smpboot.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> index 8ae65ab1769f..a3895dafa267 100644
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -184,7 +184,6 @@ static void smp_callin(void)
>       * update until we finish. We are free to set up this CPU: first the APIC.
>       */
>      Dprintk("CALLIN, before setup_local_APIC().\n");
> -    x2apic_ap_setup();
>      setup_local_APIC(false);
>  
>      /* Save our processor parameters. */
> @@ -351,6 +350,14 @@ void start_secondary(void *unused)
>      get_cpu_info()->xen_cr3 = 0;
>      get_cpu_info()->pv_cr3 = 0;
>  
> +    /*
> +     * BUG_ON() used in load_system_tables() and later code may end up calling
> +     * machine_restart() which tries to get APIC ID for CPU running this code.
> +     * If BSP detected that x2APIC is enabled, get_apic_id() will try to use it
> +     * for _all_ CPUs. Enable x2APIC on secondary CPUs now so we won't end up
> +     * with endless #GP loop.
> +     */
> +    x2apic_ap_setup();
>      load_system_tables();

While I find the argument convincing, I seem to recall that there was a
firm plan to have load_system_tables() as early as possible. Andrew?

Jan

