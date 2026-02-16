Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0C/rMlv+kmkn0wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 12:24:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFA8142DF4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 12:24:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234018.1537389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrwhg-0002vC-Fw; Mon, 16 Feb 2026 11:23:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234018.1537389; Mon, 16 Feb 2026 11:23:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrwhg-0002si-Cw; Mon, 16 Feb 2026 11:23:48 +0000
Received: by outflank-mailman (input) for mailman id 1234018;
 Mon, 16 Feb 2026 11:23:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vrwhf-0002sc-1z
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 11:23:47 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4b6c3a9-0b29-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 12:23:45 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-480706554beso29280795e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 03:23:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371998777sm295430595e9.1.2026.02.16.03.23.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 03:23:44 -0800 (PST)
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
X-Inumbo-ID: f4b6c3a9-0b29-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771241025; x=1771845825; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d0MRGEe9PhdyZSVoZm7FCFw+73byShpcGFnVOpsdpPk=;
        b=V2D1mry7c0/sGmKAQ+luiwNur7qjHf0U8rFUaI7XtZHL2xHzeP62FHdRpJ53s+5Ncf
         SbNfmH9+hM4B9vMYZx+YKMcKjnvJd+BBgcmsSESLcgsGns798x1ha7fqCPjuOf3ED3mZ
         /CBEehPSWUszrspNDgk82OrYhgQb9sUhUysIdLL9kAGCMQpRboK3NT/dT3DyQNEHlxH5
         q+/auf2qBo7dVYjNgL5y78G3t6yhXEqJzD9DBOhxTMrG+Lz2Fy0Fgu0ueywVpbIFJeq0
         vAIqsjX2iAAQRPYhNNbmVrim+x31qCUeculaH1+fmErsYV/0PT5ihaLz1MVQLG0vbNjW
         vL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771241025; x=1771845825;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0MRGEe9PhdyZSVoZm7FCFw+73byShpcGFnVOpsdpPk=;
        b=TMQpV5UeZQTIuxahxlHizi12f/SmlfXJgjMY6b8BtOIgXGAb1hzgqvZKABMewiOCwZ
         7w0JBTOE0pr6oue3vcLeEK/iHuSBsQzhsc5J4XaghXXL+LQX4FisJuzzLxRgcgv/OmiC
         Po7wqDbw0gjVuYRG2sEj8w6BZeeGCOxO68E4Wmt/aTEcEOw4iIyW/hoFby5cXgIicO2n
         F8mPzBKMcSa6xyuaneRedHmenR9N8boqU/PG2FBd1Q9hu9/1xXzENxebhDSxxjVm5loE
         5flpB/7ST+Mwl2JXW/CwW2SIbLxX3wDFgMkgkYpk/R66X2Xv99AZ+zKzi+GnoHbsAE5o
         YKDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNw8qR04CIUIAbPsH41z1BIGgnuwvtsaHx5J47ZOCsidez8nSzsGSt9tW2VGELnp9lPB619R/Zi8Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywk3hYHS14k56j+UkExr+HjWhyqCE1Ac9hxHlLIegEBO7aEstkm
	OLZNcsRbgJhjdmn/1Bkfq8/UYf3wnzUV9fsibp2Egq9ZYiH3LVppXwfbM+pTU7rwUA==
X-Gm-Gg: AZuq6aKB5ndS0NtWcgZlzPuXKV0+9SmwwMDjPamKBELO2jZvjfZhybtgMg/x2Mczfn6
	Q9Cr1P8+6QxFGMbq3tTH/bnbZfCJann31A14AAzG6Ri3B5zm3UYoeqR9ndc/FFz+FqTNo2UwasQ
	OfnOYHwvOQtnTTqN4G2VpxU1a75sXucxow+ZI1wbKW0LMDAdQH+YkLnDYc6TM1RUhg8402s1mze
	K4vXhwA5uSswn7gJRiTqQmqlyXkzZN+lyPr8ADwRbjbuJgcfaI0WzPymU3s9NWfyGBlGNYHlUgs
	6/j3iEnohoI5lh7an2rQa7oBSqLxpULDTe2OGAhKjyqlx6D6eHWEC4YtlT6xkaiTK+IxYvf9xPw
	uJUGQ+VJdAgrmyUUe1hhf40+PwhYOyspHHXwbAvxIepEKZHEhxnSCciIQ++GTQMl7tbmVwE/+xf
	n0z8yS9NABT6s4KoyRnMHPDndOOdVgpHxDBcanx1zHtbbZW4ybfparYYR1ncWwOjXbJ/+uM52el
	Hic+QPpjEsDkao=
X-Received: by 2002:a05:600c:4e45:b0:47e:e48b:506d with SMTP id 5b1f17b1804b1-48379bab48bmr144721495e9.16.1771241024628;
        Mon, 16 Feb 2026 03:23:44 -0800 (PST)
Message-ID: <444c41c8-a0ed-4780-81a2-c04df7938ed2@suse.com>
Date: Mon, 16 Feb 2026 12:23:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/cpufreq: Add Kconfig option for CPU frequency
 scaling
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, jason.andryuk@amd.com,
 alejandro.garciavallejo@amd.com, xen-devel@lists.xenproject.org
References: <20260213235102.359472-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20260213235102.359472-1-stefano.stabellini@amd.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:mid,suse.com:dkim];
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
X-Rspamd-Queue-Id: 3BFA8142DF4
X-Rspamd-Action: no action

On 14.02.2026 00:51, Stefano Stabellini wrote:
> Add CONFIG_CPUFREQ to allow CPU frequency scaling support to be
> disabled at build time. When disabled, this removes cpufreq code
> from the build.
> 
> Introduce IS_ENABLED(CONFIG_CPUFREQ) checks for relevant do_pm_op and
> do_platform_op subops and other functions that require CONFIG_CPUFREQ to
> work.
> 
> Add stubs where necessary.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v4:
> - fix IS_ENABLED(CPUFREQ)
> - remove #ifdef in platform_hypercall.c and use DCE
> - move cpufreq_controller enum out of #ifdef

Where did the v3 revlog go? Especially when submit patches faster than people
can look at them, they might skip a version (or more), while still having
looked at a yet earlier one.

> --- a/xen/drivers/acpi/pm-op.c
> +++ b/xen/drivers/acpi/pm-op.c
> @@ -367,7 +367,8 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
>          return ret;
>      }
>  
> -    if ( op->cpuid >= nr_cpu_ids || !cpu_online(op->cpuid) )
> +    if ( op->cpuid >= nr_cpu_ids || !cpu_online(op->cpuid) ||
> +         !IS_ENABLED(CONFIG_CPUFREQ) )

Have the compile time constant part first? Else any possible side effects
of the other expressions may prevent the compiler from fully dropping all
code here.

> --- a/xen/include/acpi/cpufreq/cpufreq.h
> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> @@ -381,8 +381,19 @@ int write_ondemand_up_threshold(unsigned int up_threshold);
>  
>  int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq);
>  
> +#ifdef CONFIG_CPUFREQ
> +int cpufreq_add_cpu(unsigned int cpu);
> +int cpufreq_del_cpu(unsigned int cpu);
> +
>  void cpufreq_dbs_timer_suspend(void);
>  void cpufreq_dbs_timer_resume(void);
> +#else
> +static inline int cpufreq_add_cpu(unsigned int cpu) { return -EOPNOTSUPP; }
> +static inline int cpufreq_del_cpu(unsigned int cpu) { return -EOPNOTSUPP; }

Returning an error here looks wrong, even if technically it is benign right now
(as the one [each] remaining call doesn't check the error code).

> --- a/xen/include/xen/acpi.h
> +++ b/xen/include/xen/acpi.h
> @@ -186,7 +186,15 @@ static inline void acpi_set_csubstate_limit(unsigned int new_limit) { return; }
>  #endif
>  
>  #ifdef XEN_GUEST_HANDLE
> +#ifdef CONFIG_CPUFREQ
>  int acpi_set_pdc_bits(unsigned int acpi_id, XEN_GUEST_HANDLE(uint32));
> +#else
> +static inline int acpi_set_pdc_bits(unsigned int acpi_id,
> +                                    XEN_GUEST_HANDLE(uint32) pdc)
> +{
> +    return -EOPNOTSUPP;

Here use of an error indicator would result in the XENPF_set_processor_pminfo
sub-op failing. That's not correct, as this is a notification from Dom0 to us.
If we can't make use of the provided data, we should silently ignore it.

> --- a/xen/include/xen/pmstat.h
> +++ b/xen/include/xen/pmstat.h
> @@ -5,10 +5,23 @@
>  #include <public/platform.h> /* for struct xen_processor_power */
>  #include <public/sysctl.h>   /* for struct pm_cx_stat */
>  
> +#ifdef CONFIG_CPUFREQ
>  int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf);
> -long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power);
>  int set_cppc_pminfo(unsigned int acpi_id,
>                      const struct xen_processor_cppc *cppc_data);
> +#else
> +static inline int set_px_pminfo(uint32_t acpi_id,
> +                                struct xen_processor_performance *perf)
> +{
> +    return -EOPNOTSUPP;
> +}
> +static inline int set_cppc_pminfo(unsigned int acpi_id,
> +                                  const struct xen_processor_cppc *cppc_data)
> +{
> +    return -EOPNOTSUPP;
> +}

Same here, I suppose.

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1259,6 +1259,7 @@ extern enum cpufreq_controller {
>      FREQCTL_none, FREQCTL_dom0_kernel, FREQCTL_xen
>  } cpufreq_controller;

As previously indicated, these might better be invisible when CPUFREQ=n. But
see also below.

How about (name subject to improvement)

static inline is_hwdom_cpufreq_controller(void)
{
#ifdef CONFIG_CPUFREQ
    return cpufreq_controller == FREQCTL_dom0_kernel;
#else
    return false;
#endif
}

for use both ...

> +#ifdef CONFIG_CPUFREQ
>  static always_inline bool is_cpufreq_controller(const struct domain *d)
>  {
>      /*
> @@ -1274,6 +1275,12 @@ static always_inline bool is_cpufreq_controller(const struct domain *d)
>      return (is_pv_domain(d) && is_hardware_domain(d) &&
>              cpufreq_controller == FREQCTL_dom0_kernel);

... here and in do_platform_op()? Or, keeping the enum visible,

static inline is_hwdom_cpufreq_controller(void)
{
    return IS_ENABLED(CONFIG_CPUFREQ) &&
           cpufreq_controller == FREQCTL_dom0_kernel;
}

Of course the possibly-compile-time-constant part of the expression would
then want to move first, to allow the fencing in is_pv_domain() to also be
dropped.

>  }
> +#else
> +static always_inline bool is_cpufreq_controller(const struct domain *d)
> +{
> +    return false;
> +}
> +#endif

Too much redundancy: The #ifdef would better be in the function body. But
with the other adjustment the need for an #ifdef would disappear here
anyway.

Jan

