Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 847B2B5331B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 15:03:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120236.1465264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwgwm-00086A-Oq; Thu, 11 Sep 2025 13:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120236.1465264; Thu, 11 Sep 2025 13:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwgwm-00083K-Lg; Thu, 11 Sep 2025 13:02:44 +0000
Received: by outflank-mailman (input) for mailman id 1120236;
 Thu, 11 Sep 2025 13:02:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwgwk-00083E-QD
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 13:02:42 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 958b99c5-8f0f-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 15:02:34 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-62598fcf41aso910694a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 06:02:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ec33b4d63sm1133500a12.23.2025.09.11.06.02.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 06:02:33 -0700 (PDT)
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
X-Inumbo-ID: 958b99c5-8f0f-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757595754; x=1758200554; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=23RZBBF9aJ5+NKN0Qo5G3UUaRiLapvjbrInirG7jKoo=;
        b=KEejP3LC6hdVShTMemVX27m7P2Cdqcar/AR2R65jHbyZQChlpDVG9Bl0gNYUJrToNF
         ewShmGZpTz3MU95PAMBW9V7470I5bb6GFiraRB1RkCqNxxh33dPti7anDHJuUpPeLpof
         Eu7iysC9kw3Ipi6Yqh1kBZlWaQ/Cw8eCX+WnrFOL9uKRQq0jpSO23+sfIw55gZwQaaIb
         +fOfv73bP4gMt3XG2AhOtjMUefoFXOOKgXwT6nkQW9CEdmnkVWDp8MHpnTs12FFpqzIF
         V0l2Hws1k2VMm4JytLaLBQ5fjrVl9EjcTp2t1PHyuP2R+M4poHpM6d9Jq6feT0RLdW7m
         8Low==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757595754; x=1758200554;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23RZBBF9aJ5+NKN0Qo5G3UUaRiLapvjbrInirG7jKoo=;
        b=LKCAS+gerIQ5asPGiwxQLF1gL9kGM+Z62haQRPcau+iud5vxeckjrxJxE+zK6bg1Xf
         KgB392hkUJCEnL7uZTu2e3m90JDcf7dWExPywyZU6S7te3EbPPDpithVhLJ578khPsEf
         ai/eXFqK3CdD+RKuKxRO88707U0L1eQ0SGuGy4VtlGuM+vYevRSsI+vhvD7VIsICcG6t
         j0jscaQ3T0AofVjDMvXyFRayw/rGXqOdMMXClEeU21X5Vi8qPIJ84bXJ29yiKMfCOppD
         PAKKluxL443xsV9zAbKZsS5FXOAbzcJAltwREsaMynvbLfPMxLOZQrbIaTeKlBdDmrJs
         /PEw==
X-Forwarded-Encrypted: i=1; AJvYcCUu1ArQ+ZshW1r39RT99/JGtpallCPyWdyJztizbAq1W3AnpZLdEOEW296OjXs/6g5HI1jARLB/Awk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGqoF2IW+q1FJlRyTMv5EOZcfTnp02oQHx2JB5IrQNkT8RdfKH
	h/dAtHqTpTfDd8LIfgGeib8Frwi/pyfCX3dGd5h+XGBpvw05VZDW543q9Exomn2CBA==
X-Gm-Gg: ASbGncsNgjz98L2V0UlETDRsyCrhrrIfrH9lNIM6YUeJp3jmdPjoKuaByf4w9VAAeB7
	DGisYc5ynN2y4JPcnF1b3obMzDEHD3RSUSx5rFrmuUtctQQXNxez1ElvaeIwcMeXbppmh+/KSn4
	cN9N28fDjX2pKSLTmmhcws6JUkQ4JjDJ0gab9JOWa7mxC2BA8+iYS1MdkvvBTzZHieVzM71DuZT
	CVOLWxhAybrd+thX8QkAXbJq73kwGGYDjTCoT0X2Odf3Ip4vR4eaoJd2x3XRJcmfy5/1C2Ndk+b
	hcerEvrB9CpsMDDx5v9NduCslTBfjat4oEzJHkh/RifFCzbPWYH8Ym1ty4Szf62RQv1BriWmmho
	vwyYq7KIFxRnTBG5y/Wkkbzyn1v1xYl5jkc32sMxDfgt6UkkJJg3MogYkgR6mfhRoSrWvTPZlrR
	TcnOEXRcEw0/rn3fMcOQ==
X-Google-Smtp-Source: AGHT+IGzfD85p+zWbyyfT7Lx3PvSLRipfyMd5Osh+QDPyKHb3FQ5eb2JVwoewn0Xxy25QAn9AJFhZA==
X-Received: by 2002:a05:6402:3596:b0:629:949c:a653 with SMTP id 4fb4d7f45d1cf-629949cb00dmr12863519a12.24.1757595753685;
        Thu, 11 Sep 2025 06:02:33 -0700 (PDT)
Message-ID: <56024eb0-b30f-43fd-84b7-6070a1d79cf0@suse.com>
Date: Thu, 11 Sep 2025 15:02:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/26] xen/domctl: wrap arch-specific domctl-op with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-25-Penny.Zheng@amd.com>
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
In-Reply-To: <20250910073827.3622177-25-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2025 09:38, Penny Zheng wrote:
> Function arch_do_domctl() is responsible for arch-specific domctl-op,
> and shall be wrapped with CONFIG_MGMT_HYPERCALLS
> Tracking its calling chain and the following functions shall be wrapped with
> CONFIG_MGMT_HYPERCALLS:
> For x86:
> - hvm_save_one
> - hvm_acpi_power_button
> - hvm_acpi_sleep_button
> - hvm_debug_op
> - mem_sharing_domctl
> - make P2M_AUDIT depend on CONFIG_MGMT_HYPERCALLS
> - make PG_log_dirty depend on CONFIG_MGMT_HYPERCALLS
> - make policy.o depend on CONFIG_MGMT_HYPERCALLS
> - do_vmtrace_op
>   - hvm_vmtrace_control
>     - hvm_funcs.vmtrace_control
>   - hvm_vmtrace_get_option
>     - hvm_funcs.vmtrace_get_option
>   - hvm_vmtrace_set_option
>     - hvm_funcs.vmtrace_set_option
> - paging_domctl_cont
> For ARM:
> - subarch_do_domctl
> 
> Also, remove all #ifdef CONFIG_MGMT_HYPERCALLS-s in arch-specific domctl.c, as
> we put the guardian in Makefile for the whole file.
> Wrap default-case and arch_get_domain_info() transiently with
> CONFIG_MGMT_HYPERCALLS, and it will be removed when introducing
> CONFIG_MGMT_HYPERCALLS on the common/domctl.c in the last.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v1 -> v2:
> - split out xsm parts
> - adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
> - wrap default-case and arch_get_domain_info() transiently
> ---
>  xen/Kconfig.debug                  |  2 +-
>  xen/arch/arm/arm32/Makefile        |  2 +-
>  xen/arch/arm/arm64/Makefile        |  2 +-
>  xen/arch/arm/domctl.c              |  2 --

Isn't there a change missing to arm/Makefile? Or else, how can ...

> --- a/xen/arch/arm/domctl.c
> +++ b/xen/arch/arm/domctl.c
> @@ -184,7 +184,6 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>      }
>  }
>  
> -#ifdef CONFIG_MGMT_HYPERCALLS
>  void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
>  {
>      struct vcpu_guest_context *ctxt = c.nat;
> @@ -200,7 +199,6 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
>      if ( !test_bit(_VPF_down, &v->pause_flags) )
>          ctxt->flags |= VGCF_online;
>  }
> -#endif /* CONFIG_MGMT_HYPERCALLS */

... this be correct?

> --- a/xen/arch/x86/hvm/save.c
> +++ b/xen/arch/x86/hvm/save.c
> @@ -121,6 +121,7 @@ size_t hvm_save_size(struct domain *d)
>      return sz;
>  }

Both this and ...

> +#ifdef CONFIG_MGMT_HYPERCALLS
>  /*
>   * Extract a single instance of a save record, by marshalling all records of
>   * that type and copying out the one we need.
> @@ -195,6 +196,7 @@ int hvm_save_one(struct domain *d, unsigned int typecode, unsigned int instance,
>      xfree(ctxt.data);
>      return rv;
>  }
> +#endif /* CONFIG_MGMT_HYPERCALLS */
>  
>  int hvm_save(struct domain *d, hvm_domain_context_t *h)
>  {

... this and hvm_load() (and some others) will end up unreachable when
MGMT_HYPERCALLS=n and MEM_SHARING=n.

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2585,6 +2585,7 @@ static bool cf_check vmx_get_pending_event(
>      (RTIT_STATUS_FILTER_EN | RTIT_STATUS_CONTEXT_EN | RTIT_STATUS_TRIGGER_EN | \
>       RTIT_STATUS_ERROR | RTIT_STATUS_STOPPED)
>  
> +#ifdef CONFIG_MGMT_HYPERCALLS
>  static int cf_check vmtrace_get_option(
>      struct vcpu *v, uint64_t key, uint64_t *output)
>  {

This #ifdef wants to move up a few lines, to also cover the two #define-s.

> @@ -2693,6 +2694,7 @@ static int cf_check vmtrace_control(struct vcpu *v, bool enable, bool reset)
>  
>      return 0;
>  }
> +#endif /* CONFIG_MGMT_HYPERCALLS */
>  
>  static int cf_check vmtrace_output_position(struct vcpu *v, uint64_t *pos)
>  {
> @@ -2883,10 +2885,14 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
>      .altp2m_vcpu_emulate_ve = vmx_vcpu_emulate_ve,
>      .altp2m_vcpu_emulate_vmfunc = vmx_vcpu_emulate_vmfunc,
>  #endif
> +#ifdef CONFIG_MGMT_HYPERCALLS
>      .vmtrace_control = vmtrace_control,
> +#endif
>      .vmtrace_output_position = vmtrace_output_position,

Why would this remain? Patch 05 makes VM_EVENT dependent upon MGMT_HYPERCALLS,
and outside of domctl.c the only other caller is in vm_event.c.

> @@ -747,8 +751,10 @@ bool altp2m_vcpu_emulate_ve(struct vcpu *v);
>  
>  static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool reset)
>  {
> +#ifdef CONFIG_MGMT_HYPERCALLS
>      if ( hvm_funcs.vmtrace_control )
>          return alternative_call(hvm_funcs.vmtrace_control, v, enable, reset);
> +#endif
>  
>      return -EOPNOTSUPP;
>  }
> @@ -765,8 +771,10 @@ static inline int hvm_vmtrace_output_position(struct vcpu *v, uint64_t *pos)
>  static inline int hvm_vmtrace_set_option(
>      struct vcpu *v, uint64_t key, uint64_t value)
>  {
> +#ifdef CONFIG_MGMT_HYPERCALLS
>      if ( hvm_funcs.vmtrace_set_option )
>          return alternative_call(hvm_funcs.vmtrace_set_option, v, key, value);
> +#endif
>  
>      return -EOPNOTSUPP;
>  }
> @@ -774,8 +782,10 @@ static inline int hvm_vmtrace_set_option(
>  static inline int hvm_vmtrace_get_option(
>      struct vcpu *v, uint64_t key, uint64_t *value)
>  {
> +#ifdef CONFIG_MGMT_HYPERCALLS
>      if ( hvm_funcs.vmtrace_get_option )
>          return alternative_call(hvm_funcs.vmtrace_get_option, v, key, value);
> +#endif
>  
>      return -EOPNOTSUPP;
>  }

Why #ifdef inside the functions? The sole users each are in domctl.c.

> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -114,7 +114,9 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
>  
>      memcpy(info->handle, d->handle, sizeof(xen_domain_handle_t));
>  
> +#ifdef CONFIG_MGMT_HYPERCALLS
>      arch_get_domain_info(d, info);
> +#endif
>  }

This shouldn't be necessary; instead imo patch 18 should be extended to cover
getdomainfo() altogether.

> --- a/xen/lib/x86/Makefile
> +++ b/xen/lib/x86/Makefile
> @@ -1,3 +1,3 @@
>  obj-y += cpuid.o
>  obj-y += msr.o
> -obj-y += policy.o
> +obj-$(CONFIG_MGMT_HYPERCALLS) += policy.o

Fair parts of cpuid.c also become unreachable. And all of msr.c afaics.

Jan

