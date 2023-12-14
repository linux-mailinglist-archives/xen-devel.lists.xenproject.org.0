Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F4B812C89
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 11:10:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654394.1021264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDifo-0004Ai-50; Thu, 14 Dec 2023 10:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654394.1021264; Thu, 14 Dec 2023 10:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDifo-000489-1B; Thu, 14 Dec 2023 10:10:32 +0000
Received: by outflank-mailman (input) for mailman id 654394;
 Thu, 14 Dec 2023 10:10:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDifm-000483-L5
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 10:10:30 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 023aa689-9a69-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 11:10:29 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a22fb5f71d9so87233666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 02:10:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 tq14-20020a170907c50e00b00a1f83646eb6sm7769527ejc.149.2023.12.14.02.10.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 02:10:28 -0800 (PST)
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
X-Inumbo-ID: 023aa689-9a69-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702548629; x=1703153429; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8TmD0kjhQymP/vgz+jd/OdLaJt8E7UaUV89SxBVkUII=;
        b=glJ0tZ7D2Hu7wesVyEUYMiirA2AyLSGaREV7uB4Tl4PHkL25qj410rHRZd9H73rKE5
         MCr3c0Pj1rdqJ5HWSm2BMaFEwmK/z/OULH9040TeTHtXyywm06CJVyr+qgcX9KfZkdpF
         Kh6hf0AA7RBCLPKhauPx4o7cLN510iidKLNcPrz2OAaTIe9U+8Cu8q7dqBdFhyzR5twU
         iHAYj9FcHBe9v79NEE2w240qCEbyPkSSEbEd0n4+0i6UJJaUIFbZlmq0YFk6wORR//WF
         pQDnmpnlDvwd/ln62n8egXuXfRQ4Jdk0s9aDmDCwHVGxvP7NqFrv5tqF3Yc+PDfByDNn
         Lt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702548629; x=1703153429;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8TmD0kjhQymP/vgz+jd/OdLaJt8E7UaUV89SxBVkUII=;
        b=YUzFMON54Z7fdHxB1t5UqK1U/6N4gPScrz5nF3w8Aq/1SPnXZTazq+MY7iARqmgN0+
         7P69lhxHxiMKPXEyaYyblLkJHHpA7XF2OO5u4AAfWZUuGo39+b/wvVGBe5HFiWNkZ8Rk
         E4T4U4xzcCni/vSULqz3ExyQ583VPJ5eWRNs755Ob69D4g4IFHdjfJ2OiRXicMCKYAIh
         Gbz68iJoJ4/jYCRFPvLR3nN/ZxcXdRXFyNCEDpbIPgTpew2noBejqsBRPRZ/lGzHCuGs
         CSKsPX6RZWoJJThPScQQjUz4yiimzJ1ue/wCylacEyH5eCJuN8KlSMv6qOfKTxxHEFSx
         Vs2A==
X-Gm-Message-State: AOJu0YyHbAEHYaT7V0FigAHsqgFM2hmGF6ayUVjDMDKknPLTfzJmUgL4
	eDX8r/DxWQpEd91OB9Gp34SZ
X-Google-Smtp-Source: AGHT+IHk/ijmfiNrjRlEiOK2E3x4xdMOD7bYmbIXvPDGlSrTjqyi/6Gqpg+ADOsEHd8Cx8pSbCsMDw==
X-Received: by 2002:a17:907:1dc9:b0:a22:ef8b:76cd with SMTP id og9-20020a1709071dc900b00a22ef8b76cdmr3419687ejc.38.1702548629050;
        Thu, 14 Dec 2023 02:10:29 -0800 (PST)
Message-ID: <b17bb7d1-1206-4ad1-96b1-7b903a740c83@suse.com>
Date: Thu, 14 Dec 2023 11:10:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/x86: io_apic: Introduce a command line option
 to skip timer check
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20231211122322.15815-1-julien@xen.org>
 <20231211122322.15815-2-julien@xen.org>
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
In-Reply-To: <20231211122322.15815-2-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2023 13:23, Julien Grall wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2535,6 +2535,17 @@ pages) must also be specified via the tbuf_size parameter.
>  ### tickle_one_idle_cpu
>  > `= <boolean>`
>  
> +### pit-irq-works (x86)
> +> `=<boolean>`
> +
> +> Default: `false`
> +
> +Disables the code which tests for broken timer IRQ sources. Enabling
> +this option will reduce boot time on HW where the timer works properly.
> +
> +If the system is unstable when enabling the option, then it means you
> +may have a broken HW and therefore the testing cannot be be skipped.
> +
>  ### timer_slop
>  > `= <integer>`

With the rename this now needs to move up to retain sorting.

> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -57,6 +57,14 @@ bool __initdata ioapic_ack_forced;
>  int __read_mostly nr_ioapic_entries[MAX_IO_APICS];
>  int __read_mostly nr_ioapics;
>  
> +/*
> + * The logic to check if the timer is working is expensive. So allow
> + * the admin to bypass it if they know their platform doesn't have
> + * a buggy timer.
> + */
> +static bool __initdata pit_irq_works;
> +boolean_param("pit-irq-works", pit_irq_works);
> +
>  /*
>   * Rough estimation of how many shared IRQs there are, can
>   * be changed anytime.
> @@ -1502,6 +1510,9 @@ static int __init timer_irq_works(void)
>  {
>      unsigned long t1, flags;
>  
> +    if ( pit_irq_works )
> +        return 1;

When the check is placed here, what exactly use of the option means is
system dependent. I consider this somewhat risky, so I'd prefer if the
check was put on the "normal" path in check_timer(). That way it'll
affect only the one case which we can generally consider "known good",
but not the cases where the virtual wire setups are being probed. I.e.

    if (pin1 != -1) {
        /*
         * Ok, does IRQ0 through the IOAPIC work?
         */
        unmask_IO_APIC_irq(irq_to_desc(0));
        if (pit_irq_works || timer_irq_works()) {
            local_irq_restore(flags);
            return;
        }

Plus this way changes to the various fallback paths can also be done
without needing to consider users who might be making use of the new
option.

Jan

