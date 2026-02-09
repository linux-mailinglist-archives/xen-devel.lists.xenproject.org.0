Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEJDKhIKimnKFwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:23:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18278112782
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:23:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225723.1532289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpU2t-00083w-Rz; Mon, 09 Feb 2026 16:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225723.1532289; Mon, 09 Feb 2026 16:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpU2t-00082V-Op; Mon, 09 Feb 2026 16:23:31 +0000
Received: by outflank-mailman (input) for mailman id 1225723;
 Mon, 09 Feb 2026 16:23:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpU2s-00082M-7x
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:23:30 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa2ac9d4-05d3-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 17:23:27 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4801d7c72a5so27099085e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:23:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5d77b3sm176865e9.2.2026.02.09.08.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 08:23:26 -0800 (PST)
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
X-Inumbo-ID: aa2ac9d4-05d3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770654207; x=1771259007; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WLZBlF7qRqVbL5N08knlrO7uAkOzZVVxD6CZc/XwX90=;
        b=VFOy4Z8QBxh+tTyu6U8vxLDeAxmMokK8XQ+450vRuGGWJj6wpHjceIlYZ3gPPjyU/M
         if77AUgc3YWADAAC4FV5ZYYyl4S4ZuEahPr7n+cftTUyNSTP1951klQ/ijmBo+E3hWx9
         Lz/SSeayk7vIhexZUD6OIKAUDfBbXv+I8yitHD79Tz2pfBQUel1UNai69u9KerHKjcw6
         sT5Ypdjg5Ao+1Jw1I4IeSB9giMPMRcQ6Czkc8VjhkT3IVg+YbynoHU1+BKVLlq0pec58
         WQ/VgeOSU0demQWOq8gberCdOUl0+Stgn+6LkFSuXnRoJBYg6OVfELtT2nFoz6uPKAdj
         wRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770654207; x=1771259007;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLZBlF7qRqVbL5N08knlrO7uAkOzZVVxD6CZc/XwX90=;
        b=i+VKc9rzKc1oFIeMensl8t6QTL88I+ExUqwP7tBFD+lgQaWw8375BsfAXUghSSnwq4
         WO53FzPddCu+rsOM/uRHLpQLOZbO08mILsOlb4T9rnQ4qtaEH4SdD0VSM/+vI9T9bJR7
         jiuAAAugGKtcD04wLj4Rg6KxU83k0Qx9lld8lCIqh5Q393R+rXpBDapctYn4JIIPld+w
         EVo71x7YN4w0ybnYJJQKVcbS6X3DBvBBPbyN5KFeE8s4TpKf/mcWkXyoKFxxQGi5zNJ4
         mHFLHkryWeReU8+bsrBnbkZ2sBFMCenFO6xTjsh8VFkFJhErvHnc15xk+KNoGkSJBlW9
         5yyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfBPXfsycga1GT1B7mpi3VnhSts/ZEQqbMn1wHzdN4uYWuKVEfU/TihOfVgNzwLF154mOgJcRi54g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSJkzGHip2/KfpzN65/ZYDWcGe2cp07Xhdd7iXkj4LfquVBpjo
	DCFKB1CUzsYqta3u3gj9FfLbDuvjc8nj7bAIi/dTnIMmz5kpP9DzBPmMi4igkTZxaw==
X-Gm-Gg: AZuq6aKVZi3W+eyhNS3vPbsNqfA7ZToqx7rsW1NRPFlFqhEoc/G94tPVYNlAcqvCJIm
	P7G1kaFWJNOSKeNaUz4HFtoLqekpF47dOIfznoN0ii4UYA7zKM1C6kH0BaLYhv19dociRfPxFQ/
	AA0791nCUVLQRsm1/Duu7ZW1MXO+Iu5mtN6gYOPTPrZ9OhzknEFmgES7waSrJ5bk2eMjyD41+WV
	efZzQXZvLiQ1mQMw0KhBdy2PgTXwjbq2saeIb8wc+AQ5pxWs/5jbYeRLJXNEPu67zJSmGSxPww6
	T7Ljdo+bEYhdNCGEJrWKBFJiDzzDmBHdHza2yneHnmx8ZLGwPBNUAejNTbv5npF/pLn/co3TFu3
	ajlXvtf80mmQjY7DkUP8QpB3WRaoq1e8mkFQ8me/w90CVcCLMbMXa3Egq+PpN3mKxEfe2cnm17e
	BU3r0JRjWCaWEc0Lz7uqgXo9Pae2N2/2YTZih8hSq0DWFm9dX3o0j8rl6FLvqLSfaohWjADoRS3
	chGWSber6VThg==
X-Received: by 2002:a05:600c:1d01:b0:480:1a9a:e571 with SMTP id 5b1f17b1804b1-48320213a37mr177302595e9.22.1770654207090;
        Mon, 09 Feb 2026 08:23:27 -0800 (PST)
Message-ID: <42c248e7-9747-4281-9fca-1b9950a06bf8@suse.com>
Date: Mon, 9 Feb 2026 17:23:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/cpufreq: Add Kconfig option for CPU frequency
 scaling
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, jason.andryuk@amd.com,
 alejandro.garciavallejo@amd.com, xen-devel@lists.xenproject.org
References: <20260206233005.417233-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20260206233005.417233-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stefano.stabellini@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 18278112782
X-Rspamd-Action: no action

On 07.02.2026 00:30, Stefano Stabellini wrote:> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -652,7 +652,7 @@ endmenu
>  
>  config PM_OP
>  	bool "Enable Performance Management Operation"
> -	depends on ACPI && HAS_CPUFREQ && SYSCTL
> +	depends on ACPI && CPUFREQ && SYSCTL
>  	default y
>  	help
>  	  This option shall enable userspace performance management control
> @@ -660,7 +660,7 @@ config PM_OP
>  
>  config PM_STATS
>  	bool "Enable Performance Management Statistics"
> -	depends on ACPI && HAS_CPUFREQ && SYSCTL
> +	depends on ACPI && CPUFREQ && SYSCTL
>  	default y
>  	help
>  	  Enable collection of performance management statistics to aid in

Is the original HAS_CPUFREQ misleading here? do_pm_op() (in pm-op.c) is also
doing some C-state related work. You may not compile that out just because of
CPUFREQ=n. Same for pmstat.c.

> --- a/xen/drivers/cpufreq/Kconfig
> +++ b/xen/drivers/cpufreq/Kconfig
> @@ -1,3 +1,17 @@
> -
>  config HAS_CPUFREQ
>  	bool
> +
> +config CPUFREQ
> +	bool "CPU Frequency scaling"
> +	default y
> +	depends on HAS_CPUFREQ
> +	help
> +	  Enable CPU frequency scaling and power management governors.
> +	  This allows Xen to dynamically adjust CPU P-states (performance
> +	  states) based on system load.
> +
> +	  Disabling this option removes all cpufreq governors and power
> +	  management interfaces. This is useful for real-time systems or
> +	  minimal hypervisor builds.
> +
> +	  If unsure, say Y.

Looks like we're trying to get rid of such re-stating of what the default
is.

> --- a/xen/include/acpi/cpufreq/cpufreq.h
> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> @@ -381,8 +381,19 @@ int write_ondemand_up_threshold(unsigned int up_threshold);
>  
>  int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq);
>  
> +#ifdef CONFIG_CPUFREQ
> +int  cpufreq_add_cpu(unsigned int cpu);
> +int  cpufreq_del_cpu(unsigned int cpu);

If already you move these, please also get rid of the double blanks.

>  void cpufreq_dbs_timer_suspend(void);
>  void cpufreq_dbs_timer_resume(void);
> +#else
> +static inline int  cpufreq_add_cpu(unsigned int cpu) { return -ENOSYS; }
> +static inline int  cpufreq_del_cpu(unsigned int cpu) { return -ENOSYS; }

Here and below - no use of ENOSYS, please. EOPNOTSUPP it is everywhere else
(unless dating back very far).

> --- a/xen/include/xen/acpi.h
> +++ b/xen/include/xen/acpi.h
> @@ -185,8 +185,14 @@ static inline unsigned int acpi_get_csubstate_limit(void) { return 0; }
>  static inline void acpi_set_csubstate_limit(unsigned int new_limit) { return; }
>  #endif
>  
> -#ifdef XEN_GUEST_HANDLE

If you leave this as-is, ...

> +#if defined(XEN_GUEST_HANDLE) && defined(CONFIG_CPUFREQ)
>  int acpi_set_pdc_bits(unsigned int acpi_id, XEN_GUEST_HANDLE(uint32));
> +#elif defined(XEN_GUEST_HANDLE)
> +static inline int acpi_set_pdc_bits(unsigned int acpi_id,
> +                                    XEN_GUEST_HANDLE(uint32) pdc)
> +{
> +    return -ENOSYS;
> +}
>  #endif

... the overall result may be a tiny bit tidier.

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1255,9 +1255,14 @@ static always_inline bool is_iommu_enabled(const struct domain *d)
>  extern bool sched_smt_power_savings;
>  extern bool sched_disable_smt_switching;
>  
> -extern enum cpufreq_controller {
> +enum cpufreq_controller {
>      FREQCTL_none, FREQCTL_dom0_kernel, FREQCTL_xen
> -} cpufreq_controller;

This enum would better ...

> +};
> +#ifdef CONFIG_CPUFREQ
> +extern enum cpufreq_controller cpufreq_controller;

... stay inside here, then also making the split of type and var decl unnecessary.
The two affected platform-ops likely want compiling out, too.

Jan

