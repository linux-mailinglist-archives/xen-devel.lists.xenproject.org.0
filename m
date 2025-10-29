Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BB1C1BDB7
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 16:57:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152901.1483399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE8YS-0006Q7-2W; Wed, 29 Oct 2025 15:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152901.1483399; Wed, 29 Oct 2025 15:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE8YR-0006NT-VP; Wed, 29 Oct 2025 15:57:43 +0000
Received: by outflank-mailman (input) for mailman id 1152901;
 Wed, 29 Oct 2025 15:57:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vE8YQ-0006NN-RJ
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 15:57:42 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa86091e-b4df-11f0-980a-7dc792cee155;
 Wed, 29 Oct 2025 16:57:32 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso101953885e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Oct 2025 08:57:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e387a14sm53579255e9.3.2025.10.29.08.57.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 08:57:31 -0700 (PDT)
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
X-Inumbo-ID: fa86091e-b4df-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761753452; x=1762358252; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yrdbv7/6R+owcnVgM0SN08zWix41mbp9ERzud4tG19s=;
        b=QU1ylMpGlczzGN0VgHQ9CUUDSGt1fIzvr/YxAN+argG0tXnhoy1fgV95lmXnZsVRft
         PM/YTXOpbmWQWQRUVZ/tpE6cvJjQ9YyR9JuYSrUMB9G3RyDO2Sk8CTypaTWmJKAF+Idf
         gh6ytvzrxYDjrwl8hPZ4o7+c2ZdA9XKKb7oJH+A5J22LEc9aQsM0yL6qr722GzdepBHq
         4jsrhXElt3krZRYiMh0z+iJc/zASQKnrE07DDXlpUyPId6oBJJSVzyQ3nZSgqSZQz68a
         qHziLdCwRLuITV/Avqoyb+F6KfjFEgLxsrIe+vu+5SlUw7K5ay4p77eyuufqgVJzkJM4
         sOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761753452; x=1762358252;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrdbv7/6R+owcnVgM0SN08zWix41mbp9ERzud4tG19s=;
        b=r2HvdtzRuPp+VvpDc0NPnPcwS5GAXk1mg8x06zZXtVTkjM7DKX7cPJFexgFw8mcUTm
         4tOBdKfbBj3LFv39Xkz4i85kCu0vwXbckBnr4SJb9zodBP0SIXtNqok/CBqgWh+aUMcW
         31dcvwL8CedrwGs+g5TN9Ma01Iqc1tb0dPXIr/sPb49UbnEZbgPBGRK6c06b49X4gZn+
         2nN3AmqIs0ZH8WTgcfiJSew02ioT2n4vgvy2L/Oc4YJXr3fYggUCmM7z9Lt3mPgshfWr
         WFtQgWj+HB7DjzNCcSUc8ipaAwQiUVXHCqt0qqS+aBBpG3NRDk3YEV6FaPgNae6gZ/eY
         YfWg==
X-Forwarded-Encrypted: i=1; AJvYcCVmXOvU+6i5c8sSK9dcWX66DTHmNh4/vtGkT1XIAoyELCj2OFtaCVv3EW+NFCTAK0HPsAcKpOwvZvQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yws6A/XJGfGaNXKtUs2yScmJ5tc5c1Rai4yBaxlo+gsKsE5bl7E
	YIuE4aTA2xANblF+3Y/Y96SNsSp5Gq8vqOIdu+jtcqHb14OUdd3/HG7EUQZ05bCEz925xkdXO3z
	wRMI=
X-Gm-Gg: ASbGncuxGEpU5/eH+GIyoIY8cvm96Xn4A+5zbQozybZKJjGcxACRPthe2E7I0Pb1z1l
	fJqmpDuwJALQtnQuza2kYN2o8CAI8uid51bNcgz6QibHCnIVxdhyye5I1EVvI1fQvPzluD69K7j
	gsVJM2y4qZI5eKHtC8zD9Wb0ynIXGTE4ghyYTqIXoXKCPrVV1xCsTPjMEZBrt5bdiOMnoZ+eZZr
	sF1GZ7pybYhiNdbhsOm8Jy5K/Sr+GyltqxtvqDzdeyidWPPrXWFm05ciLj/elr4IlmT2V21+Efv
	rMZQzqwnfJHPrm3SY25GaPwZv4e4nNHSYE1gw056g3FEQf4fwsCGg5JRwGQeBdK7gjigDcI+fPe
	ZVCVQMt5aIWSKfGr5lUW5CLmQPb4KVPyPX0nahZUeBv05vGgXryL9pKS8pWcpTQZxt8IXaQOhNV
	zvELGVfoSnwOkF4/ARWHFel5MaYsmTVKQmRkddqb4U42URUiV4EW4h9Xk6Lywssybo9+vXLuU=
X-Google-Smtp-Source: AGHT+IHXgay+EZLbL3wlQnjzv8BRF2rRG+dcclecvvVX9gHs+NKSZkUIfAj1xFnH2tmjV7oAVi17Pg==
X-Received: by 2002:a05:600c:828d:b0:475:faaa:8620 with SMTP id 5b1f17b1804b1-4771e1ca0c9mr29359975e9.20.1761753451709;
        Wed, 29 Oct 2025 08:57:31 -0700 (PDT)
Message-ID: <1a9ac91c-2295-4749-8807-668fcecf8f8e@suse.com>
Date: Wed, 29 Oct 2025 16:57:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/28] xen/vm_event: consolidate CONFIG_VM_EVENT
To: Penny Zheng <Penny.Zheng@amd.com>, Tamas K Lengyel <tamas@tklengyel.com>
Cc: ray.huang@amd.com, oleksii.kurochko@gmail.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-10-Penny.Zheng@amd.com>
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
In-Reply-To: <20251013101540.3502842-10-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.10.2025 12:15, Penny Zheng wrote:
> File hvm/vm_event.c and x86/vm_event.c are the extend to vm_event handling
> routines, and its compilation shall be guarded by CONFIG_VM_EVENT too.
> Futhermore, features about monitor_op and memory access are both based on
> vm event subsystem, so monitor.o/mem_access.o shall be wrapped under
> CONFIG_VM_EVENT.
> 
> Although CONFIG_VM_EVENT is right now forcibly enabled on x86 via
> MEM_ACCESS_ALWAYS_ON, we could disable it through disabling
> CONFIG_MGMT_HYPERCALLS later. So we remove MEM_ACCESS_ALWAYS_ON and
> make VM_EVENT=y on default only on x86 to retain the same.
> 
> In consequence, a few switch-blocks need in-place stubs in do_altp2m_op()
> to pass compilation when ALTP2M=y and VM_EVENT=n(, hence MEM_ACCESS=n), like
> HVMOP_altp2m_set_mem_access, etc.
> And the following functions still require stubs to pass compilation:
> - vm_event_check_ring()
> - p2m_mem_access_check()
> - xenmem_access_to_p2m_access()
> 
> The following functions are developed on the basis of vm event framework, or
> only invoked by vm_event.c/monitor.c/mem_access.c, so they all shall be
> wrapped with CONFIG_VM_EVENT (otherwise they will become unreachable and
> violate Misra rule 2.1 when VM_EVENT=n):
> - hvm_toggle_singlestep
> - hvm_fast_singlestep
> - hvm_enable_msr_interception
>   - hvm_function_table.enable_msr_interception
> - hvm_has_set_descriptor_access_existing
>   - hvm_function_table.set_descriptor_access_existing
> - arch_monitor_domctl_op
> - arch_monitor_allow_userspace
> - arch_monitor_get_capabilities
> - hvm_emulate_one_vm_event
> - hvmemul_write{,cmpxchg,rep_ins,rep_outs,rep_movs,rep_stos,read_io,write_io}_discard
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Overall I agree with Grygorii's remark towards this preferably wanting (a) splitting
off and perhaps (b) also splitting up some. If at all possible, of course.

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -50,6 +50,7 @@
>  #include <asm/hvm/vm_event.h>
>  #include <asm/hvm/vpt.h>
>  #include <asm/i387.h>
> +#include <asm/mem_access.h>
>  #include <asm/mc146818rtc.h>
>  #include <asm/mce.h>
>  #include <asm/monitor.h>
> @@ -4861,15 +4862,20 @@ static int do_altp2m_op(
>          break;
>  
>      case HVMOP_altp2m_set_mem_access:
> +#ifdef CONFIG_VM_EVENT
>          if ( a.u.mem_access.pad )
>              rc = -EINVAL;
>          else
>              rc = p2m_set_mem_access(d, _gfn(a.u.mem_access.gfn), 1, 0, 0,
>                                      a.u.mem_access.access,
>                                      a.u.mem_access.view);
> +#else
> +        rc = -EOPNOTSUPP;
> +#endif
>          break;

I think this (and if possible the others below here) would better use
IS_ENABLED(). (Would also shrink the diff.)

> @@ -5030,6 +5043,7 @@ static int compat_altp2m_op(
>      switch ( a.cmd )
>      {
>      case HVMOP_altp2m_set_mem_access_multi:
> +#ifdef CONFIG_VM_EVENT
>  #define XLAT_hvm_altp2m_set_mem_access_multi_HNDL_pfn_list(_d_, _s_); \
>          guest_from_compat_handle((_d_)->pfn_list, (_s_)->pfn_list)
>  #define XLAT_hvm_altp2m_set_mem_access_multi_HNDL_access_list(_d_, _s_); \
> @@ -5038,6 +5052,7 @@ static int compat_altp2m_op(
>                                               &a.u.set_mem_access_multi);
>  #undef XLAT_hvm_altp2m_set_mem_access_multi_HNDL_pfn_list
>  #undef XLAT_hvm_altp2m_set_mem_access_multi_HNDL_access_list
> +#endif
>          break;
>  
>      default:
> @@ -5056,6 +5071,7 @@ static int compat_altp2m_op(
>      switch ( a.cmd )
>      {
>      case HVMOP_altp2m_set_mem_access_multi:
> +#ifdef CONFIG_VM_EVENT
>          if ( rc == -ERESTART )
>          {
>              a.u.set_mem_access_multi.opaque =
> @@ -5065,6 +5081,9 @@ static int compat_altp2m_op(
>                                         &a, u.set_mem_access_multi.opaque) )
>                  rc = -EFAULT;
>          }
> +#else
> +        rc = -EOPNOTSUPP;
> +#endif
>          break;
>  
>      default:

Are these changes really needed?

> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -192,7 +192,10 @@ struct hvm_function_table {
>      void (*handle_cd)(struct vcpu *v, unsigned long value);
>      void (*set_info_guest)(struct vcpu *v);
>      void (*set_rdtsc_exiting)(struct vcpu *v, bool enable);
> +#ifdef CONFIG_VM_EVENT
>      void (*set_descriptor_access_exiting)(struct vcpu *v, bool enable);
> +    void (*enable_msr_interception)(struct domain *d, uint32_t msr);
> +#endif
>  
>      /* Nested HVM */
>      int (*nhvm_vcpu_initialise)(struct vcpu *v);

Another blank line ahead of the #ifdef?

> @@ -433,10 +434,12 @@ static inline bool using_svm(void)
>  
>  #define hvm_long_mode_active(v) (!!((v)->arch.hvm.guest_efer & EFER_LMA))
>  
> +#ifdef CONFIG_VM_EVENT
>  static inline bool hvm_has_set_descriptor_access_exiting(void)
>  {
>      return hvm_funcs.set_descriptor_access_exiting;
>  }
> +#endif
>  
>  static inline void hvm_domain_creation_finished(struct domain *d)
>  {
> @@ -679,10 +682,12 @@ static inline int nhvm_hap_walk_L1_p2m(
>          v, L2_gpa, L1_gpa, page_order, p2m_acc, npfec);
>  }
>  
> +#ifdef CONFIG_VM_EVENT
>  static inline void hvm_enable_msr_interception(struct domain *d, uint32_t msr)
>  {
>      alternative_vcall(hvm_funcs.enable_msr_interception, d, msr);
>  }
> +#endif

Move this up into the earlier #ifdef?

> --- a/xen/arch/x86/include/asm/mem_access.h
> +++ b/xen/arch/x86/include/asm/mem_access.h
> @@ -14,6 +14,7 @@
>  #ifndef __ASM_X86_MEM_ACCESS_H__
>  #define __ASM_X86_MEM_ACCESS_H__
>  
> +#ifdef CONFIG_VM_EVENT
>  /*
>   * Setup vm_event request based on the access (gla is -1ull if not available).
>   * Handles the rw2rx conversion. Boolean return value indicates if event type
> @@ -25,6 +26,14 @@
>  bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
>                            struct npfec npfec,
>                            struct vm_event_st **req_ptr);
> +#else
> +static inline bool p2m_mem_access_check(paddr_t gpa, unsigned long gla,
> +                                        struct npfec npfec,
> +                                        struct vm_event_st **req_ptr)
> +{
> +    return false;

Leaving *req_ptr untouched feels dangerous; the fact that the sole caller has
what it uses set to NULL up front is secondary.

From looking at the function it's also not quite clear to me whether "false" is
the correct return value here. Tamas?

> --- a/xen/arch/x86/include/asm/monitor.h
> +++ b/xen/arch/x86/include/asm/monitor.h
> @@ -32,6 +32,7 @@ struct monitor_msr_bitmap {
>      DECLARE_BITMAP(high, 8192);
>  };
>  
> +#ifdef COMFIG_VM_EVENT

Typo aside, isn't the entire file (perhaps minus some stubs) useful only when
VM_EVENT=y?

> --- a/xen/include/xen/mem_access.h
> +++ b/xen/include/xen/mem_access.h
> @@ -74,9 +74,19 @@ typedef enum {
>  } p2m_access_t;
>  
>  struct p2m_domain;
> +#ifdef CONFIG_VM_EVENT
>  bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
>                                   xenmem_access_t xaccess,
>                                   p2m_access_t *paccess);
> +#else
> +static inline bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
> +                                               xenmem_access_t xaccess,
> +                                               p2m_access_t *paccess)
> +{
> +    *paccess = p2m_access_rwx;

Why not p2m->default_access, as the full function has it? And should xaccess
other than XENMEM_access_default be rejected, by returning false? (In turn I
wonder whether the real function may not want to move elsewhere, so that a
stub open-coding part of it wouldn't be necessary.)

Jan

