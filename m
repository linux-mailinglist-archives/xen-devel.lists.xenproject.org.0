Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32948B51A7A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 16:57:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118401.1464194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwMFt-0003wi-35; Wed, 10 Sep 2025 14:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118401.1464194; Wed, 10 Sep 2025 14:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwMFs-0003tz-W1; Wed, 10 Sep 2025 14:57:04 +0000
Received: by outflank-mailman (input) for mailman id 1118401;
 Wed, 10 Sep 2025 14:57:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwMFq-0003tr-Qi
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 14:57:02 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67c3b860-8e56-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 16:57:01 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b0418f6fc27so1148310166b.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 07:57:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0783047b9bsm179425366b.13.2025.09.10.07.56.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 07:56:59 -0700 (PDT)
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
X-Inumbo-ID: 67c3b860-8e56-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757516220; x=1758121020; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=15cYQVjB6Bko11Is5/dYR/Umn5ijIKC3kxDHPdxDkiM=;
        b=DwQD8XijE3CnVlzG0MLzzgIMHzSaaxSWPYIisVYRjQlxQp4lwUFkIDCawRCba+1CzS
         xpCENmCHqtYOBk2N5IEI/Kp7YXKVbYFSE2qhjzCoRNeOqqdHtQ+6jhfE2vN4CV124IQB
         H1kWpLSi3NFvZ2YOWwAPzpNP2aokeuYBcRgHCN3UFTb6wBtZWd+QBarxe8sukD9f2ris
         07xZLemC5YkN0qBSI7SgHPwST/Tw6ce0Hjmd8rAdKf18tNkIIfKDU42N+2SHwfewvo3w
         VxA8kOrrzfjispa4FtgeHwxECSw9Py26ljX5s62zVDL6r7eiBLjkvQYugi9+lnRJsLLe
         xEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757516220; x=1758121020;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15cYQVjB6Bko11Is5/dYR/Umn5ijIKC3kxDHPdxDkiM=;
        b=WG7/fyuCT/0Dkd1X5pe4gdunZ/Lu3GKcXukOF8I4JvyzEMEaw6VGqDx5YCJ/jP5PpK
         Cc0ROcwfV1q4FmPDrJUi9JB+d/Agmdh8/vjxTxoWp5YHZNqCfnRHmz2rrryGCHFOo3sv
         6lWlR4DMhEcojYXXKurR5v7y7o/R1M0HhwMjYW1o//84M6ICZfUm2b4q2FQqUJf/+xWH
         Cs95dZ11QlAar+uci7n3pHXqNqCUa7wkt8kDfUf5UnXy/md/Y1g7i4RJMqAHmPII0h4+
         5yNpo29G+4+WNVcTPwYXpz9Nwk71PAra9sxNRcalPz06EwKPTGQL20dK0z3FeRmeoI6M
         eXjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY0G8RBFqtR69DnZN9VgEK3NwSm68gY1oy96t5eOIn1m2N/ERJ2GWjNLmES42xkgimImsNw4hX478=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOw27fRcoJFjjXuuP0tiQGdS19dNAEQdCTReebxDfdb+32PiUP
	Ge5IXK6cisB59ufDwQPvCBmubX5ijm0u5S19OEd55Iow8AQjLsk7/Y+sUtVQABnfbA==
X-Gm-Gg: ASbGncsiGE3OpmGDfPVcnZ/nFAFoRa9R0ziNmOLbgM5EYoWoePYFvuuq7HLFnZjRmtl
	MWktm0afCDBYgKZ/LhHRQGqYybSk8sBrQy5Ld0l55mqs2QxHkSCUMeXYFM/i7s6Vj+mrREaYI1J
	KHzmYf+dVZKvMo+AN41hEe0sUkjfJUT/VHbFUfJ3v+cs+LPb+ocMCG98hWOXToLgRhHtxQ8WDL4
	IyXEG1QamPWhJzPBQUhfjQWvuUr2ay0LvpVdLb3wAAfhpIYiJng7Y7bX4tkDsCzn6qXAwMlWJFG
	U2jfcC+Bzv0vZ5LqTYNxGkQblTrtuYOmcf1rS5NdmdaGSBlWb581R8GcTM69QI36/ZiVDR8oSA4
	KnLQHnz2bqoEOLDfAoyEq/Ao4QSoL8yFHx2sz2ao1/LOzgQQv7byAFzFguipF8IWatr6b/013kw
	571yAwBOHamrjaCIYnnw==
X-Google-Smtp-Source: AGHT+IFr09DYlgXsLIVaZOvNGub5Ek7Opv2Xbme58zhVraW4jrG3tuyMHtAqrksVw3G4Vlg1fTmang==
X-Received: by 2002:a17:906:456:b0:b07:6214:79f9 with SMTP id a640c23a62f3a-b0762148115mr734727866b.19.1757516220138;
        Wed, 10 Sep 2025 07:57:00 -0700 (PDT)
Message-ID: <b8430631-f857-426a-a144-c6b8fbf94ee9@suse.com>
Date: Wed, 10 Sep 2025 16:56:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/26] xen: consolidate CONFIG_VM_EVENT
To: Penny Zheng <Penny.Zheng@amd.com>, Tamas K Lengyel <tamas@tklengyel.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-5-Penny.Zheng@amd.com>
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
In-Reply-To: <20250910073827.3622177-5-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2025 09:38, Penny Zheng wrote:
> @@ -2456,9 +2460,13 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
>      .fpu_dirty_intercept  = svm_fpu_dirty_intercept,
>      .msr_read_intercept   = svm_msr_read_intercept,
>      .msr_write_intercept  = svm_msr_write_intercept,
> +#ifdef CONFIG_VM_EVENT
>      .enable_msr_interception = svm_enable_msr_interception,
> +#endif
>      .set_rdtsc_exiting    = svm_set_rdtsc_exiting,
> +#ifdef CONFIG_VM_EVENT
>      .set_descriptor_access_exiting = svm_set_descriptor_access_exiting,
> +#endif

I think in such a case it would be preferable to move one of the existing
lines, so we can get away with just a single #ifdef.

> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -192,7 +192,9 @@ struct hvm_function_table {
>      void (*handle_cd)(struct vcpu *v, unsigned long value);
>      void (*set_info_guest)(struct vcpu *v);
>      void (*set_rdtsc_exiting)(struct vcpu *v, bool enable);
> +#ifdef CONFIG_VM_EVENT
>      void (*set_descriptor_access_exiting)(struct vcpu *v, bool enable);
> +#endif
>  
>      /* Nested HVM */
>      int (*nhvm_vcpu_initialise)(struct vcpu *v);
> @@ -224,7 +226,9 @@ struct hvm_function_table {
>                                  paddr_t *L1_gpa, unsigned int *page_order,
>                                  uint8_t *p2m_acc, struct npfec npfec);
>  
> +#ifdef CONFIG_VM_EVENT
>      void (*enable_msr_interception)(struct domain *d, uint32_t msr);
> +#endif

Possibly same here.

> @@ -435,7 +439,11 @@ static inline bool using_svm(void)
>  
>  static inline bool hvm_has_set_descriptor_access_exiting(void)
>  {
> +#ifdef CONFIG_VM_EVENT
>      return hvm_funcs.set_descriptor_access_exiting;
> +#else
> +    return false;
> +#endif
>  }

This is actively wrong. It being only monitor.[ch] which use the function,
I don't see why it can't just be wrapped in an #ifdef. With what you do,
some new caller might function fine until run in a VM_EVENT=n build.

> @@ -681,7 +689,9 @@ static inline int nhvm_hap_walk_L1_p2m(
>  
>  static inline void hvm_enable_msr_interception(struct domain *d, uint32_t msr)
>  {
> +#ifdef CONFIG_VM_EVENT
>      alternative_vcall(hvm_funcs.enable_msr_interception, d, msr);
> +#endif
>  }

Mostly the same here.

> --- a/xen/arch/x86/include/asm/hvm/monitor.h
> +++ b/xen/arch/x86/include/asm/hvm/monitor.h
> @@ -17,14 +17,16 @@ enum hvm_monitor_debug_type
>      HVM_MONITOR_DEBUG_EXCEPTION,
>  };
>  
> +#define hvm_monitor_crX(cr, new, old) \
> +                        hvm_monitor_cr(VM_EVENT_X86_##cr, new, old)
> +
> +#ifdef CONFIG_VM_EVENT
>  /*
>   * Called for current VCPU on crX/MSR changes by guest. Bool return signals
>   * whether emulation should be postponed.
>   */
>  bool hvm_monitor_cr(unsigned int index, unsigned long value,
>                      unsigned long old);
> -#define hvm_monitor_crX(cr, new, old) \
> -                        hvm_monitor_cr(VM_EVENT_X86_##cr, new, old)
>  bool hvm_monitor_msr(unsigned int msr, uint64_t new_value, uint64_t old_value);
>  void hvm_monitor_descriptor_access(uint64_t exit_info,
>                                     uint64_t vmx_exit_qualification,
> @@ -45,6 +47,65 @@ int hvm_monitor_vmexit(unsigned long exit_reason,
>  
>  int hvm_monitor_io(unsigned int port, unsigned int bytes,
>                     bool in, bool str);
> +#else
> +static inline bool hvm_monitor_cr(unsigned int index, unsigned long value,
> +                                  unsigned long old)
> +{
> +    return false;
> +}
> +
> +static inline bool hvm_monitor_msr(unsigned int msr, uint64_t new_value,
> +                                   uint64_t old_value)
> +{
> +    return false;
> +}
> +
> +static inline void hvm_monitor_descriptor_access(uint64_t exit_info,
> +                                        uint64_t vmx_exit_qualification,
> +                                        uint8_t descriptor, bool is_write) {}
> +
> +static inline int hvm_monitor_debug(unsigned long rip,
> +                                    enum hvm_monitor_debug_type type,
> +                                    unsigned int trap_type,
> +                                    unsigned int insn_length,
> +                                    unsigned int pending_dbg)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +static inline int hvm_monitor_cpuid(unsigned long insn_length,
> +                                    unsigned int leaf, unsigned int subleaf)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +static inline void hvm_monitor_interrupt(unsigned int vector,
> +                                         unsigned int type,
> +                                         unsigned int err, uint64_t cr2) {}
> +
> +static inline bool hvm_monitor_emul_unimplemented(void)
> +{
> +    return false;
> +}
> +
> +static inline bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn,
> +                                         uint32_t pfec, uint16_t kind)
> +{
> +    return false;
> +}
> +
> +static inline int hvm_monitor_vmexit(unsigned long exit_reason,
> +                                     unsigned long exit_qualification)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +static inline int hvm_monitor_io(unsigned int port, unsigned int bytes,
> +                                 bool in, bool str)
> +{
> +    return -EOPNOTSUPP;
> +}

For this one it's perhaps easiest to see that -EOPNOTSUPP (or in fact any
negative value) is wrong to return from the stub: Just go look at both
use sites. Guests wouldn't be able to use I/O insns anymore for intercepted
ports. Others look to have similar issues, while the ones returning "false"
look okay.

> --- a/xen/include/xen/mem_access.h
> +++ b/xen/include/xen/mem_access.h
> @@ -33,9 +33,7 @@
>   */
>  struct vm_event_st;
>  
> -#ifdef CONFIG_VM_EVENT
>  #include <asm/mem_access.h>
> -#endif

Aiui this breaks the build on PPC and RISC-V, which don't have such a
header. If this change is really needed (which I'm not convinced of, as
x86's hvm/hvm.c could as well include asm/mem_access.h directly), you'll
need to use has_include() here.

> @@ -74,6 +72,7 @@ typedef enum {
>  } p2m_access_t;
>  
>  struct p2m_domain;
> +#ifdef CONFIG_VM_EVENT
>  bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
>                                   xenmem_access_t xaccess,
>                                   p2m_access_t *paccess);
> @@ -99,10 +98,40 @@ long p2m_set_mem_access_multi(struct domain *d,
>  int p2m_get_mem_access(struct domain *d, gfn_t gfn, xenmem_access_t *access,
>                         unsigned int altp2m_idx);
>  
> -#ifdef CONFIG_VM_EVENT
>  int mem_access_memop(unsigned long cmd,
>                       XEN_GUEST_HANDLE_PARAM(xen_mem_access_op_t) arg);
>  #else
> +static inline bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
> +                                               xenmem_access_t xaccess,
> +                                               p2m_access_t *paccess)
> +{
> +    return false;
> +}

So this is needed when VM_EVENT=n and ALTP2M=y. Tamas, is this a configuration
which makes sense?

> +static inline long p2m_set_mem_access(struct domain *d, gfn_t gfn, uint32_t nr,
> +                                      uint32_t start, uint32_t mask,
> +                                      xenmem_access_t access,
> +                                      unsigned int altp2m_idx)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +static inline long p2m_set_mem_access_multi(struct domain *d,
> +                            const XEN_GUEST_HANDLE(const_uint64) pfn_list,
> +                            const XEN_GUEST_HANDLE(const_uint8) access_list,
> +                            uint32_t nr, uint32_t start, uint32_t mask,
> +                            unsigned int altp2m_idx)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +static inline int p2m_get_mem_access(struct domain *d, gfn_t gfn,
> +                                     xenmem_access_t *access,
> +                                     unsigned int altp2m_idx)
> +{
> +    return -EOPNOTSUPP;
> +}

Instead of these, I wonder whether a single #ifdef in do_altp2m_op()
wouldn't be more appropriate (assuming the above config makes some sense
in the first place). Actually, it would need to be two #ifdef-s, one in
each of the two switch() blocks.

> --- a/xen/include/xen/monitor.h
> +++ b/xen/include/xen/monitor.h
> @@ -30,6 +30,7 @@ struct xen_domctl_monitor_op;
>  #ifdef CONFIG_VM_EVENT
>  int monitor_domctl(struct domain *d, struct xen_domctl_monitor_op *mop);
>  void monitor_guest_request(void);
> +int monitor_traps(struct vcpu *v, bool sync, vm_event_request_t *req);
>  #else /* !CONFIG_VM_EVENT */
>  static inline int monitor_domctl(struct domain *d,
>                                   struct xen_domctl_monitor_op *mop)
> @@ -37,8 +38,11 @@ static inline int monitor_domctl(struct domain *d,
>      return -EOPNOTSUPP;
>  }
>  static inline void monitor_guest_request(void) {}
> +static inline int monitor_traps(struct vcpu *v, bool sync,
> +                                vm_event_request_t *req)
> +{
> +    return -EOPNOTSUPP;
> +}

Is this needed? There's only one call that needs taking care of afaics,
in hvm_hap_nested_page_fault(). That's gated on "req_ptr" being non-NULL
though, which isn't possible when p2m_mem_access_check() also is a stub.
Hence the compiler ought to be able to DCE the call.

> --- a/xen/include/xen/vm_event.h
> +++ b/xen/include/xen/vm_event.h
> @@ -50,6 +50,7 @@ struct vm_event_domain
>      unsigned int last_vcpu_wake_up;
>  };
>  
> +#ifdef CONFIG_VM_EVENT
>  /* Returns whether a ring has been set up */
>  bool vm_event_check_ring(struct vm_event_domain *ved);
>  
> @@ -68,6 +69,20 @@ bool vm_event_check_ring(struct vm_event_domain *ved);
>   */
>  int __vm_event_claim_slot(struct domain *d, struct vm_event_domain *ved,
>                            bool allow_sleep);
> +#else
> +static inline bool vm_event_check_ring(struct vm_event_domain *ved)
> +{
> +    return false;
> +}

Which call site is in need of this stub? I was first considering
mem_paging_enabled(), but MEM_PAGING already now depends on VM_EVENT.

> +static inline int __vm_event_claim_slot(struct domain *d,
> +                                        struct vm_event_domain *ved,
> +                                        bool allow_sleep)
> +{
> +    return -EOPNOTSUPP;
> +}

Sadly this looks to be needed when MEM_SHARING=y and VM_EVENT=n.

> @@ -82,23 +97,28 @@ static inline int vm_event_claim_slot_nosleep(struct domain *d,
>  
>  void vm_event_cancel_slot(struct domain *d, struct vm_event_domain *ved);
>  
> +#ifdef CONFIG_VM_EVENT
>  void vm_event_put_request(struct domain *d, struct vm_event_domain *ved,
>                            vm_event_request_t *req);
>  
> -#ifdef CONFIG_VM_EVENT
>  /* Clean up on domain destruction */
>  void vm_event_cleanup(struct domain *d);
>  int vm_event_domctl(struct domain *d, struct xen_domctl_vm_event_op *vec);
> +
> +void vm_event_vcpu_pause(struct vcpu *v);
>  #else /* !CONFIG_VM_EVENT */
> +static inline void vm_event_put_request(struct domain *d,
> +                                        struct vm_event_domain *ved,
> +                                        vm_event_request_t *req) {}

Same here and ...

>  static inline void vm_event_cleanup(struct domain *d) {}
>  static inline int vm_event_domctl(struct domain *d,
>                                    struct xen_domctl_vm_event_op *vec)
>  {
>      return -EOPNOTSUPP;
>  }
> +static inline void vm_event_vcpu_pause(struct vcpu *v) {};

... here.

>  #endif /* !CONFIG_VM_EVENT */
>  
> -void vm_event_vcpu_pause(struct vcpu *v);
>  void vm_event_vcpu_unpause(struct vcpu *v);

Please move vm_event_vcpu_unpause() as well (without adding a stub). The
two would better stay together.

Jan

