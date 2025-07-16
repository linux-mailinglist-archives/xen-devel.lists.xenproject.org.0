Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60487B0723C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 11:54:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045004.1415071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubypy-0005dc-Sk; Wed, 16 Jul 2025 09:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045004.1415071; Wed, 16 Jul 2025 09:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubypy-0005bM-Pu; Wed, 16 Jul 2025 09:54:06 +0000
Received: by outflank-mailman (input) for mailman id 1045004;
 Wed, 16 Jul 2025 09:54:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubypy-0005bG-8Y
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 09:54:06 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9a9f255-622a-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 11:53:56 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so5040460f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 02:53:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c9f1e61d2sm1071419a91.11.2025.07.16.02.53.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 02:53:54 -0700 (PDT)
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
X-Inumbo-ID: c9a9f255-622a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752659635; x=1753264435; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rezYS78EywvW6rz8UDaNjCuenlpsdtZSeRhMiP1h91g=;
        b=XGOEw5GP8M5D2r44mh8SWGuEmYcK5Wifmep379CnLY+9Yis7jXmYMH5ZTNLE1hyF8O
         rNNIZThzWOseTT70Z+5zgheWDAefkpdkQF7U3HoY8og7MpCZeG6Yubml8MDIVoCVd87a
         +BSSdmZ4yf3SplAq23rOqWFLYSbgwhK3T2N1YTssh0wpAgbxaGpAwb2PwLz9MPLLo1ir
         iypJIP90OnEywAlUvyIyq85vyaNF1A6mlpyUtVRXMbLJ0t+SdwDQFDFJIAusZAobk1kK
         DUseWCex29hs6r73T4+Ty+K8+nC1bnKlkHsTTeC6gybtmekV1ddlNv8moFOdfhgaTdfU
         vC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752659635; x=1753264435;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rezYS78EywvW6rz8UDaNjCuenlpsdtZSeRhMiP1h91g=;
        b=gVUCxF8rUzwRuMz/OjFa4gNhK8O8N2itUjUnLgQWGQhV18A0uMOaglkJzIPkrNfubt
         QQSyQ1znGOrGNr7fsbNx6VaI2vgpOHqkyM0ApXrKOg33wtIBEuYOnrleAZKtsBEu700z
         bkmjc2rvnfz6mH6LFy3fpKrkTKbTnbzqG++CYlIwgVLn3EkQCx+zedm9mW+Yb9mS/fhE
         n9JjAXLLM8kjhHfFSNsAZ7JWFsxtsh2B965khMIZeOZg7DFU9revhPKT6xaOOrIuSnFN
         hjo0rcuyvsDcBcL+6QvhVSbHJ4KZu3TSSLUQmXZ6kvG74AIEgHnPvV+K/agm96KMNEIA
         wwMw==
X-Forwarded-Encrypted: i=1; AJvYcCWFLNSJcHzRzWEqh4RaeashNes1mSFf2QsAK7BULgdE0//GHISwzvWxTJPyUqoTcf/iuoFlxl9fJPw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPk2ehNpGI7ryjrUsuAT+vNZLi6PVrAtZtejbof9IpPB/XMSet
	oYWKJwoTp1pyQy8S+CXP9zaU/PMn6nremX7pDXBASYeTMKAx2MdlYFHnGmI5T2Ksng==
X-Gm-Gg: ASbGnctq/g9fLfXwUVgs83o0n0atjdpISipYEXz2cpKkYuSd977OJTcb+SuCGs6YGjG
	XTjCfbNr7wycNIAe2VYKvL3mrDUaZs3ruECf5zf/Q+htU48ctrjeaIZ7R9ss+CrZLbDepFAD2hq
	5oDNRMh66B2O0dbx4AOur2w+SHM6AkruU0VNEqOShUnGcmnkeTjitIzBlPr7rDDPExIFGLEKiaH
	fCjdkfQPVkh6PreoYoYSl67Y7JGBtSG0BpbPxbTI9iiTjo1a8bqq4F6RJZLTQIWPQwkBhy62MjC
	dsNJkuRP5eeEiva1q61zCKgJYZhdIWeohNoV1kGUDsyCkanSEUnmNvY9zJ3WLtZzE+CC5TDwHg5
	hHIv07t67eGN7xoE7ke91nMHbAcRH7Cijvm0ZwDHW1eaEdX8qvC8xLSelOYTVhDNq6bS2IbDZWD
	IQtF2DSj0=
X-Google-Smtp-Source: AGHT+IHSNzGWE/1BZWj4e9BDvulT03pRZSB6kcM30ME+mYwA8Urna1/KEK66tkjQNwwfPtPNEPIUGw==
X-Received: by 2002:a05:6000:2a0d:b0:3b6:1d3:f88d with SMTP id ffacd0b85a97d-3b60dd731f9mr1810276f8f.36.1752659635324;
        Wed, 16 Jul 2025 02:53:55 -0700 (PDT)
Message-ID: <0e4aaf55-9a18-48a7-821f-9248e9b6e66d@suse.com>
Date: Wed, 16 Jul 2025 11:53:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] xen: Make the maximum number of altp2m views
 configurable for x86
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1752568020.git.w1benny@gmail.com>
 <09ec625693adc92beee5885f0ed7a72363ce9ede.1752568020.git.w1benny@gmail.com>
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
In-Reply-To: <09ec625693adc92beee5885f0ed7a72363ce9ede.1752568020.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.07.2025 10:31, Petr Beneš wrote:
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -1873,6 +1873,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
>                                P2M_ALLOC | (npfec.write_access ? P2M_UNSHARE : 0),
>                                &page_order);
>  
> +#ifdef CONFIG_ALTP2M
>      if ( altp2m_active(currd) )
>      {
>          p2m = p2m_get_altp2m(curr);
> @@ -1891,6 +1892,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
>          }
>      }
>      else
> +#endif
>          p2m = hostp2m;
>  
>      /* Check access permissions first, then handle faults */

Why is this needed? I can't spot any access to a struct field here that's
unavailable when ALTP2M=n.

> @@ -2863,10 +2867,12 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
>      .update_vlapic_mode = vmx_vlapic_msr_changed,
>      .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
>      .enable_msr_interception = vmx_enable_msr_interception,
> +#ifdef CONFIG_ALTP2M
>      .altp2m_vcpu_update_p2m = vmx_vcpu_update_eptp,
>      .altp2m_vcpu_update_vmfunc_ve = vmx_vcpu_update_vmfunc_ve,
>      .altp2m_vcpu_emulate_ve = vmx_vcpu_emulate_ve,
>      .altp2m_vcpu_emulate_vmfunc = vmx_vcpu_emulate_vmfunc,
> +#endif

With this, the hook pointers in struct hvm_function_table should also become
conditional (and then of course also the wrapper functions there). Overall I
wonder whether at least part of this conditionalizing wouldn't better be a
separate, prereq patch.

> @@ -4225,6 +4231,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
>      /* Now enable interrupts so it's safe to take locks. */
>      local_irq_enable();
>  
> +#ifdef CONFIG_ALTP2M
>      /*
>       * If the guest has the ability to switch EPTP without an exit,
>       * figure out whether it has done so and update the altp2m data.
> @@ -4256,6 +4263,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
>  
>          p2m_set_altp2m(v, idx);
>      }
> +#endif /* CONFIG_ALTP2M */
>  
>      if ( unlikely(currd->arch.monitor.vmexit_enabled) )
>      {

Same question as at the top - is this really needed?

> @@ -962,16 +964,24 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
>  /* Set a specific p2m view visibility */
>  int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
>                                     uint8_t visible);
> -#else /* !CONFIG_HVM */
> -struct p2m_domain *p2m_get_altp2m(struct vcpu *v);
> -#endif /* CONFIG_HVM */
>  
> -#ifdef CONFIG_ALTP2M
>  /* Check to see if vcpu should be switched to a different p2m. */
>  void p2m_altp2m_check(struct vcpu *v, uint16_t idx);
> -#else
> +#else /* !CONFIG_ALTP2M */
> +static inline struct p2m_domain *p2m_get_altp2m(struct vcpu *v)
> +{
> +    return NULL;
> +}
> +
> +static inline bool p2m_set_altp2m(struct vcpu *v, unsigned int idx)
> +{
> +    return false;
> +}

While the "set" stub would likely be okay in this form, I don't really like
the plain NULL return of the "get" one. Looking at use sites, can't we get
away with just a declaration (but no definition) of both? As leveraged in
many other places, compiler DCE would get rid of all of the call sites at
long a altp2m_active() yields compile-time-constant "false".

> --- a/xen/arch/x86/mm/altp2m.c
> +++ b/xen/arch/x86/mm/altp2m.c
> @@ -9,12 +9,16 @@
>  #include <asm/altp2m.h>
>  #include <public/hvm/hvm_op.h>
>  #include <xen/event.h>
> +#include <xen/xvmalloc.h>
>  #include "mm-locks.h"
>  #include "p2m.h"
>  
>  void
>  altp2m_vcpu_initialise(struct vcpu *v)
>  {
> +    if ( v->domain->nr_altp2m == 0 )
> +        return;

Just as a remark, without insisting on a change: We generally prefer the
shorter ! form, much like you do e.g. ...

> @@ -122,7 +129,12 @@ int p2m_init_altp2m(struct domain *d)
>      struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
>  
>      mm_lock_init(&d->arch.altp2m_list_lock);
> -    for ( i = 0; i < MAX_ALTP2M; i++ )
> +    d->arch.altp2m_p2m = xvzalloc_array(struct p2m_domain *, d->nr_altp2m);
> +
> +    if ( !d->arch.altp2m_p2m )

... here.

> @@ -143,7 +155,10 @@ void p2m_teardown_altp2m(struct domain *d)
>      unsigned int i;
>      struct p2m_domain *p2m;
>  
> -    for ( i = 0; i < MAX_ALTP2M; i++ )
> +    if ( !d->arch.altp2m_p2m )
> +        return;

This isn't really needed, is it? The ...

> +    for ( i = 0; i < d->nr_altp2m; i++ )

... loop bound ought to be zero in that case, so nothing will be done
here, and ...

>      {
>          if ( !d->arch.altp2m_p2m[i] )
>              continue;
> @@ -151,6 +166,8 @@ void p2m_teardown_altp2m(struct domain *d)
>          d->arch.altp2m_p2m[i] = NULL;
>          p2m_free_one(p2m);
>      }
> +
> +    XVFREE(d->arch.altp2m_p2m);
>  }

... this simply ends up being a no-op.

> --- a/xen/arch/x86/mm/mem_access.c
> +++ b/xen/arch/x86/mm/mem_access.c
> @@ -79,8 +79,11 @@ bool p2m_mem_access_emulate_check(struct vcpu *v,
>      struct domain *d = v->domain;
>      struct p2m_domain *p2m = NULL;
>  
> +#ifdef CONFIG_ALTP2M
>      if ( altp2m_active(d) )
>          p2m = p2m_get_altp2m(v);
> +#endif
> +
>      if ( !p2m )
>          p2m = p2m_get_hostp2m(d);
>  
> @@ -143,8 +146,11 @@ bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
>      vm_event_request_t *req;
>      int rc;
>  
> +#ifdef CONFIG_ALTP2M
>      if ( altp2m_active(d) )
>          p2m = p2m_get_altp2m(v);
> +#endif
> +
>      if ( !p2m )
>          p2m = p2m_get_hostp2m(d);

These two changes again look as if they weren't really needed.

> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -771,8 +771,10 @@ bool ept_handle_misconfig(uint64_t gpa)
>      bool spurious;
>      int rc;
>  
> +#ifdef CONFIG_ALTP2M
>      if ( altp2m_active(curr->domain) )
>          p2m = p2m_get_altp2m(curr);
> +#endif
>  
>      p2m_lock(p2m);
>  
> @@ -994,12 +996,14 @@ out:
>      if ( is_epte_present(&old_entry) )
>          ept_free_entry(p2m, &old_entry, target);
>  
> +#ifdef CONFIG_ALTP2M
>      if ( hvm_altp2m_supported() && entry_written && p2m_is_hostp2m(p2m) )
>      {
>          ret = p2m_altp2m_propagate_change(d, _gfn(gfn), mfn, order, p2mt, p2ma);
>          if ( !rc )
>              rc = ret;
>      }
> +#endif
>  
>      return rc;
>  }

Same here.

> --- a/xen/arch/x86/mm/p2m-pt.c
> +++ b/xen/arch/x86/mm/p2m-pt.c
> @@ -519,12 +519,14 @@ int p2m_pt_handle_deferred_changes(uint64_t gpa)
>      struct p2m_domain *p2m = p2m_get_hostp2m(current->domain);
>      int rc;
>  
> +#ifdef CONFIG_ALTP2M
>      /*
>       * Should altp2m ever be enabled for NPT / shadow use, this code
>       * should be updated to make use of the active altp2m, like
>       * ept_handle_misconfig().
>       */
>      ASSERT(!altp2m_active(current->domain));
> +#endif

And again here.

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -811,6 +811,9 @@ struct domain *domain_create(domid_t domid,
>      if ( config )
>      {
>          d->options = config->flags;
> +#ifdef CONFIG_ALTP2M
> +        d->nr_altp2m = config->altp2m.nr;
> +#endif

Add #else asserting that config->altp2m.nr is zero?

Jan

