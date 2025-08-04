Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91643B1A26E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 15:00:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069297.1433178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiunG-0001Ri-LE; Mon, 04 Aug 2025 12:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069297.1433178; Mon, 04 Aug 2025 12:59:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiunG-0001P5-IL; Mon, 04 Aug 2025 12:59:58 +0000
Received: by outflank-mailman (input) for mailman id 1069297;
 Mon, 04 Aug 2025 12:59:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uiunF-0001Oz-Dh
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 12:59:57 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb478c6c-7132-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 14:59:55 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-af967835d0aso158910766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 05:59:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a241bdfsm731459166b.131.2025.08.04.05.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 05:59:54 -0700 (PDT)
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
X-Inumbo-ID: eb478c6c-7132-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754312395; x=1754917195; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uvRhfOKLa0jtmJMekP2DS/JttHDhPCFUw2z2lbg3hck=;
        b=gtMSxAClAGFmi7PYKZtz8Tn1CpD3TZT3+fN4GzlUNmcfqriX3mu6M2Sw94RLy+MF8B
         YPJw3Ty8yvVgANjkwvZ/bsvNNKVIrSmyQWpcfBs9gycUYBpssiJjsIu/4WLb/uY6CSzV
         4ApKrdfuDfeSfAXzyNx9amWlI3TCY7CokpPTdWkjBB36dCkBjYeVCyazV1VgsxonPoy7
         57jzRrPJQxR40GKL+aWZPf3bUyphj9P8SdjHcdY9ktBo+N1lNNe3rTjfBA+pGN0NY+kC
         bAHucUWH2/kLoOxKQcQkaIvCjvIVqtZGQcTznfaoz8L3zJZQ/6ZQT00zl0Bd96TQQraF
         kVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754312395; x=1754917195;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvRhfOKLa0jtmJMekP2DS/JttHDhPCFUw2z2lbg3hck=;
        b=Xfjk6EfGGEMDYnnWnjxXyAQO2cpEFFQ1Vcr0rRYf3IDOvjlYYJVn+1h/LPnmqqSGCh
         0aRmfymxpMAnr/4wMyiP93ksHb0JE/SUgyKoEnuoE5vuBMQ58kV0290t8W6ec6lHRVgf
         ZgdjtWGjcCrCqsfST7iemLn3ZRu6GGRwP3NUbCJRESRsAXgZt9dlfzqE/dR902Qrrjih
         tLUMZ371WS1axSv+d55nDTcLdo1O7kP6/nTGN2Q8cDoAkiYPobO+S2BJA6IcnGljgPwC
         Hv8g9BWwelfLZFYapKYt9LH1DcSju8uf5o2XlaZpom+zN7fn/b2yv6S8eCg37Zj/qrQu
         ayjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG69dM7jgFjfoJNnYlt0hISHSlI1sgQMJPSKPhYskZRH7tgzrNjzDX6v2HZfrJX6tzqtZWsV0bdfk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMCr4J92NFOKGqvByEhgXV/TQ26uovbtjgYltFQGHjmYPebdlp
	T6tCNjTsYbA4VbdUqsWZCC/X0SrGYwJLOzYZcnj/SjJYPAy15h8UAchzbKG4Srelrg==
X-Gm-Gg: ASbGncsjxRev/S2U4DV2RZGejPCMjOqO3g7OlvtalAvu33Vj43kVXvzNEkbPqpEOitS
	Y7hsbgbXuwKjfSSygXD7X3iy+55Ks6ltcIGZK5eEBio//xsyAxZ0udmu+1PUfb7/lao/tB/Ndv0
	F/qo8Xa/HZ8v69Q1eq+PlBvpt5/kVGgy6okS7MdpjXaIdd9JG+1cqntbBYzDYloFc88tLtAut8R
	AjkUZHTWrW8boNq12W113ICpFrJnlIRvhoxKqkmbtdU24vGcMzNSyGTg2OJ8Lc5GIp1xDT7Pq9U
	wrFjfjozy+P1PPHtlSVa1s6bhOvzWt862JWPXD19zKlvlQjZ2a+lSsoCC4h66Lrq3rccUKbwck3
	osknzknT0pKgsB5n5/PE8sb54sGGmguf/HhTVdKRjW8qt0s8ea0aAxUp2l7w4fjdUaIdmCrzJzs
	Rz8S1MujE=
X-Google-Smtp-Source: AGHT+IE6vQL4mYMR/dzRatPgbthtdwsYnI2mlxFEV7HAm6gEpg+OEHO74CRkdy/Ivm/jAWLznGEITA==
X-Received: by 2002:a17:907:7f05:b0:ad8:9257:573a with SMTP id a640c23a62f3a-af93ffcc3bbmr993180966b.5.1754312395234;
        Mon, 04 Aug 2025 05:59:55 -0700 (PDT)
Message-ID: <b0ecb75b-1f2c-4d23-b830-38df310dcf35@suse.com>
Date: Mon, 4 Aug 2025 14:59:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/25] xen: consolidate CONFIG_VM_EVENT
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Shawn Anastasio <sanastasio@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
 <20250803094738.3625269-5-Penny.Zheng@amd.com>
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
In-Reply-To: <20250803094738.3625269-5-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.08.2025 11:47, Penny Zheng wrote:
> File hvm/vm_event.c and x86/vm_event.c are the extend to vm_event handling
> routines, and its compilation shall be guarded by CONFIG_VM_EVENT too.
> Futhermore, features about monitor_op and memory access are both based on
> vm event subsystem, so monitor.o/mem_access.o shall be wrapped under
> CONFIG_VM_EVENT.
> 
> Although CONFIG_VM_EVENT is forcibly enabled on x86, we could disable it
> through disabling CONFIG_DOMCTL in the future.
> In consequence, a few functions, like the ones defined in hvm/monitor.h,
> needs stub to pass compilation when CONFIG_VM_EVENT=n.
> Remove the CONFIG_VM_EVENT wrapper for "#include <asm/mem_access.h>", as
> we need declaration there to pass compilation when CONFIG_VM_EVENT=n
> 
> The following functions are developed on the basis of vm event framework, or
> only invoked by vm_event.c/monitor.c/mem_access.c, so they all shall be
> wrapped with CONFIG_VM_EVENT:
> - hvm_toggle_singlestep
> - hvm_fast_singlestep
> - p2m_mem_paging_drop_page
> - p2m_mem_paging_populate_page
> - p2m_mem_paging_resume
> - hvm_enable_msr_interception
>   - hvm_function_table.enable_msr_interception
> - hvm_has_set_descriptor_access_existing
>   - hvm_function_table.set_descriptor_access_existing
> - xsm_vm_event_control
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
>  xen/arch/ppc/stubs.c                    |  2 +
>  xen/arch/x86/Makefile                   |  2 +-
>  xen/arch/x86/hvm/Makefile               |  4 +-
>  xen/arch/x86/hvm/hvm.c                  |  2 +
>  xen/arch/x86/hvm/svm/svm.c              |  8 +++
>  xen/arch/x86/hvm/vmx/vmx.c              | 10 ++++
>  xen/arch/x86/include/asm/hvm/hvm.h      | 10 ++++
>  xen/arch/x86/include/asm/hvm/monitor.h  | 65 ++++++++++++++++++++++++-
>  xen/arch/x86/include/asm/hvm/vm_event.h |  4 ++
>  xen/arch/x86/include/asm/mem_access.h   |  9 ++++
>  xen/arch/x86/include/asm/monitor.h      | 15 ++++++
>  xen/arch/x86/include/asm/p2m.h          |  6 +++
>  xen/arch/x86/mm/mem_paging.c            |  2 +
>  xen/include/xen/mem_access.h            | 36 ++++++++++++--
>  xen/include/xen/monitor.h               |  8 ++-
>  xen/include/xen/vm_event.h              | 24 ++++++++-
>  xen/include/xsm/xsm.h                   |  4 +-
>  xen/xsm/dummy.c                         |  2 +-
>  xen/xsm/flask/hooks.c                   |  4 +-
>  19 files changed, 200 insertions(+), 17 deletions(-)

Overall it looks like the patch could be split some. E.g. the XSM changes look
as if they could go separately.

> --- a/xen/arch/ppc/stubs.c
> +++ b/xen/arch/ppc/stubs.c
> @@ -60,6 +60,7 @@ void vcpu_show_execution_state(struct vcpu *v)
>      BUG_ON("unimplemented");
>  }
>  
> +#ifdef CONFIG_VM_EVENT
>  /* vm_event.c */
>  
>  void vm_event_fill_regs(vm_event_request_t *req)
> @@ -76,6 +77,7 @@ void vm_event_monitor_next_interrupt(struct vcpu *v)
>  {
>      /* Not supported on PPC. */
>  }
> +#endif /* CONFIG_VM_EVENT */

Is this really needed? I wouldn't bother editing stubs.c files unless really
necessary.

> --- a/xen/arch/x86/include/asm/monitor.h
> +++ b/xen/arch/x86/include/asm/monitor.h
> @@ -71,6 +71,7 @@ int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_op *mop)
>      return rc;
>  }
>  
> +#ifdef CONFIG_VM_EVENT
>  static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
>  {
>      uint32_t capabilities = 0;
> @@ -102,6 +103,13 @@ static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
>  
>      return capabilities;
>  }
> +#else
> +static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
> +{
> +    ASSERT_UNREACHABLE();
> +    return 0;
> +}

Instead of this, a mere declaration (with no definition) would make a possible
problem known at build time, rather than only at runtime.

> --- a/xen/arch/x86/include/asm/p2m.h
> +++ b/xen/arch/x86/include/asm/p2m.h
> @@ -775,10 +775,16 @@ static inline int relinquish_p2m_mapping(struct domain *d)
>  /* Modify p2m table for shared gfn */
>  int set_shared_p2m_entry(struct domain *d, unsigned long gfn, mfn_t mfn);
>  
> +#ifdef CONFIG_VM_EVENT
>  /* Tell xenpaging to drop a paged out frame */
>  void p2m_mem_paging_drop_page(struct domain *d, gfn_t gfn, p2m_type_t p2mt);
>  /* Start populating a paged out frame */
>  void p2m_mem_paging_populate(struct domain *d, gfn_t gfn);
> +#else
> +static inline void p2m_mem_paging_drop_page(struct domain *d, gfn_t gfn,
> +                                            p2m_type_t p2mt) {}

This, I think, isn't needed. p2m_is_paging() is already short-circuited into
0 / false when MEM_PAGING=n (implying VM_EVENT=n in your supposed future
configuration, so the call site is being DCE-ed, and hence the declaration
that was already there will suffice.

> --- a/xen/arch/x86/mm/mem_paging.c
> +++ b/xen/arch/x86/mm/mem_paging.c
> @@ -15,6 +15,7 @@
>  
>  #include "mm-locks.h"
>  
> +#ifdef CONFIG_VM_EVENT
>  /*
>   * p2m_mem_paging_drop_page - Tell pager to drop its reference to a paged page
>   * @d: guest domain
> @@ -186,6 +187,7 @@ void p2m_mem_paging_resume(struct domain *d, vm_event_response_t *rsp)
>          gfn_unlock(p2m, gfn, 0);
>      }
>  }
> +#endif /* CONFIG_VM_EVENT */

As per the previous remark: Why would this be needed? We already have

obj-$(CONFIG_MEM_PAGING) += mem_paging.o

in the corresponding Makefile.

> --- a/xen/include/xen/mem_access.h
> +++ b/xen/include/xen/mem_access.h
> @@ -33,9 +33,7 @@
>   */
>  struct vm_event_st;
>  
> -#ifdef CONFIG_VM_EVENT
>  #include <asm/mem_access.h>
> -#endif

Why?

> @@ -73,6 +71,7 @@ typedef enum {
>      /* NOTE: Assumed to be only 4 bits right now on x86. */
>  } p2m_access_t;
>  
> +#ifdef CONFIG_VM_EVENT
>  struct p2m_domain;
>  bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
>                                   xenmem_access_t xaccess,
> @@ -99,10 +98,41 @@ long p2m_set_mem_access_multi(struct domain *d,
>  int p2m_get_mem_access(struct domain *d, gfn_t gfn, xenmem_access_t *access,
>                         unsigned int altp2m_idx);
>  
> -#ifdef CONFIG_VM_EVENT
>  int mem_access_memop(unsigned long cmd,
>                       XEN_GUEST_HANDLE_PARAM(xen_mem_access_op_t) arg);
>  #else
> +struct p2m_domain;

No point in duplicating this; just move it ahead of the #ifdef.

Jan

