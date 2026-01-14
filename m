Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51693D1DB52
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 10:50:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202811.1518244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfxVg-0006od-Tq; Wed, 14 Jan 2026 09:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202811.1518244; Wed, 14 Jan 2026 09:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfxVg-0006lW-Qb; Wed, 14 Jan 2026 09:49:52 +0000
Received: by outflank-mailman (input) for mailman id 1202811;
 Wed, 14 Jan 2026 09:49:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfxVf-0006lA-2I
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 09:49:51 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d57784e-f12e-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 10:49:48 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so92838045e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 01:49:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee573e2eesm19724455e9.15.2026.01.14.01.49.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 01:49:47 -0800 (PST)
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
X-Inumbo-ID: 5d57784e-f12e-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768384188; x=1768988988; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YGfNd9JdEJdDxUNYzU7Z7H8QJOFbSS2CcL2abYsJoos=;
        b=C2GPJRtA73w9P1QSVUJiY2nv6UD0dvQg9dPrfAsTZnCSuJwA+m/DTPLM94u9vCi5LF
         Tzy6o/jfjTOAF1KHaZxE/QgsYYRR+WZzsoUnlL3XIuOV/zrQFy7jdraVvQbOFo1da0Iq
         mGL1Gsch628vwQ7VRA4S3ORijmMiU4ELqFkEowKzgn2LPdncQcYjM6vZJ+OEyAn04yCr
         VhQPb/9DMK6MKYDlaHNWh1+5tnun13bHpAVzC9AhdKoSfbcPkSbFgqJyViJmjVRCdEjB
         UAyhSt2KAwzUScygrXNWg/PEs0ZzjJBxnf2SE90wL5/XPCnphWVVBRCBmaZ24dXoS5oD
         eRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768384188; x=1768988988;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGfNd9JdEJdDxUNYzU7Z7H8QJOFbSS2CcL2abYsJoos=;
        b=Cl3FH/fGlZnjrzhz+AGMp5JYlAN3q4049k5AJJiYvaGFDBCKkvwCVPDTCQP0NRUvxK
         TnozT4qB2hpC5/BfCzYmkTrW1HXNLzaUwoxT65lJbVYQbq9XY8qFvK5ObGVxbM7/qY5W
         YjgxakqBvVlLbFZgoauPncVuSP7s9mIyFLWymI+PEs5E85/+T5IKSXe/+3V+uGYZNLhb
         iDH4u3fKdVkNS/W7mwNi72MTWZnGf6W1MQxMqK2f54i3XCxjEcLvXAqg3O0IXeKZVFDU
         Kw24cqsKm5c+rAaeD3FCP6tS3sA38u/uF1RNZ6gvKK5u+8VhT3AiU4O6xSSbQFwQaU67
         lpLw==
X-Forwarded-Encrypted: i=1; AJvYcCUEWPLNrx+X2YLopc+yGS0aV4v7v9ejyujaGBzrlJstqziwkGtWM6n63QfFpHObzzHgHXXONBL1ZWI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzuYTuAPYidA8OWdWenTvknWPNmkDo6OqyRywWn76xgZxXmQzeO
	aG3HCHauRWpT+RcALmG7LvneSvdsn3eVsBDAvbcFECqyRr9kOLdymKVzcasGLG5h0w==
X-Gm-Gg: AY/fxX7mnndDjXem9tpq1e8/uR9R7Frd5lJTv4ETKz71vQuNzTQoP2niuS4jb5lgrP6
	ZXLlxiiJ8f6v47LYt0z41X8PvFdKKwozVyNco0f7PJis6uF1owYIzq/BSlJMFM/fAGhUzVmkTXO
	2LXudvns14uJ3AJH35PQTjf2C97Wt8STklU3vCwZMUn+6jwDxAxLmezXgnCH0PX2LN2YXv//MUP
	/ecsdZqEXHBFoK1JsD33+m+IQ8Hk5HTHGJbLtooHn+6zhfrnT47ZHKwPJt5X6FNXcNA2qqHCtS5
	Ogd2E98ktMuZD5bXBVCU6T8m6gn+86UYSVy135ISxUUsII46NDWVfGo8kFy4ATiqYOEXsFhjrCm
	AdwEAI/IpA+SIzH2DDab6aZiQ69LtKBCyBt1t3mdAbCRmz8VFXdxn0t07BcVsWeKRhnSqW3nyiy
	n6zq43UER9DRrq2QiKimzwUXDlRPSZivnOFEXaCHsSENO/kZB9uMFxH7z1noSTIT6a5RzDuu42m
	vU=
X-Received: by 2002:a05:600c:8217:b0:477:9eb8:97d2 with SMTP id 5b1f17b1804b1-47ee32e074dmr23625955e9.8.1768384188042;
        Wed, 14 Jan 2026 01:49:48 -0800 (PST)
Message-ID: <00e17b41-f31e-4121-80c8-d4ea2bb02f34@suse.com>
Date: Wed, 14 Jan 2026 10:49:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] arm/sysctl: Implement cpu hotplug ops
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1768293759.git.mykyta_poturai@epam.com>
 <54a015e0e47ea311471bad7f13fbf21e14389ef3.1768293759.git.mykyta_poturai@epam.com>
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
In-Reply-To: <54a015e0e47ea311471bad7f13fbf21e14389ef3.1768293759.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.01.2026 09:45, Mykyta Poturai wrote:
> Move XEN_SYSCTL_CPU_HOTPLUG_{ONLINE,OFFLINE} handlers to common code to
> allow for enabling/disabling CPU cores in runtime on Arm64.
> 
> SMT-disable enforcement check is moved into a separate
> architecture-specific function.
> 
> For now this operations only support Arm64. For proper Arm32 support,
> there needs to be a mechanism to free per-cpu page tables, allocated in
> init_domheap_mappings.  Also, hotplug is not supported if ITS, FFA, or
> TEE is enabled, as they use non-static IRQ actions.

For all of these "not supported" cases, what if a user nevertheless tries?
Wouldn't the request better be outright denied, rather leaving the system in
a questionable state? Hmm, I see you ...

> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -7,6 +7,7 @@ config ARM_64
>  	def_bool y
>  	depends on !ARM_32
>  	select 64BIT
> +	select CPU_HOTPLUG if !TEE && !FFA && !HAS_ITS

... make the select conditional. But do TEE, FFA, and HAS_ITS each mean the
feature is actually in use when the hypervisor runs?

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -176,6 +176,9 @@ config LIBFDT
>  config MEM_ACCESS_ALWAYS_ON
>  	bool
>  
> +config CPU_HOTPLUG
> +    bool

Nit: Indentation by a single tab please. See adjacent entries.

> @@ -104,6 +105,39 @@ void smp_call_function_interrupt(void)
>      irq_exit();
>  }
>  
> +#ifdef CONFIG_CPU_HOTPLUG
> +long cf_check cpu_up_helper(void *data)
> +{
> +    unsigned int cpu = (unsigned long)data;

Note this for the first comment below on cpu_down_helper().

> +    int ret = cpu_up(cpu);
> +
> +    /* Have one more go on EBUSY. */
> +    if ( ret == -EBUSY )
> +        ret = cpu_up(cpu);
> +
> +    if ( !ret && arch_smt_cpu_disable(cpu) )

As you validly note in a comment in do_sysctl(), SMT is an arch-specific concept
and perhaps even an arch-specific term. Hence using it in the name of an arch
hook feels inappropriate. Plus - the hook could be used for other purposes. What
the arch needs to indicate is whether the CPU that was brought up may actually
stay online. That more generic purpose is what imo the name wants to cover.

> +    {
> +        ret = cpu_down_helper(data);
> +        if ( ret )
> +            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
> +        else
> +            ret = -EPERM;
> +    }
> +
> +    return ret;
> +}
> +
> +long cf_check cpu_down_helper(void *data)
> +{
> +    int cpu = (unsigned long)data;

Why is this left as plain int? Yes, it was like this in the original code,
but wrongly so.

> +    int ret = cpu_down(cpu);
> +    /* Have one more go on EBUSY. */

Also please add the missing blank line after the declarations.

> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -483,6 +483,51 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>              copyback = 1;
>          break;
>  
> +#ifdef CONFIG_CPU_HOTPLUG
> +    case XEN_SYSCTL_cpu_hotplug:

Please see the pretty recent
https://lists.xen.org/archives/html/xen-devel/2026-01/msg00329.html
(scroll down to the xen/arch/x86/platform_hypercall.c change).

> +    {
> +        unsigned int cpu = op->u.cpu_hotplug.cpu;
> +        unsigned int hp_op = op->u.cpu_hotplug.op;
> +        bool plug;
> +        long (*fn)(void *data);
> +        void *hcpu;
> +
> +        switch ( hp_op )
> +        {
> +        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
> +            plug = true;
> +            fn = cpu_up_helper;
> +            hcpu = _p(cpu);
> +            break;
> +
> +        case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
> +            plug = false;
> +            fn = cpu_down_helper;
> +            hcpu = _p(cpu);
> +            break;
> +
> +        case XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE:
> +        case XEN_SYSCTL_CPU_HOTPLUG_SMT_DISABLE:
> +            /* Use arch specific handlers as SMT is very arch-dependent */
> +            ret = arch_do_sysctl(op, u_sysctl);
> +            copyback = 0;
> +            goto out;

I wonder if it wouldn't be neater for this and actually also ...

> +        default:
> +            ret = -EOPNOTSUPP;
> +            break;

... this to fall through to ...

> +        }
> +
> +        if ( !ret )
> +            ret = plug ? xsm_resource_plug_core(XSM_HOOK)
> +                       : xsm_resource_unplug_core(XSM_HOOK);
> +
> +        if ( !ret )
> +            ret = continue_hypercall_on_cpu(0, fn, hcpu);
> +        break;
> +    }
> +#endif
> +
>      default:
>          ret = arch_do_sysctl(op, u_sysctl);

... here. (Minimally the earlier default case wants uniformly forwarding to
the arch handler, or else arch-specific additions would always require
adjustment here.)

Jan

