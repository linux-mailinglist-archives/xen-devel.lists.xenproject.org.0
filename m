Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A115AC9B3DD
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 11:58:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176096.1500660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQO4u-0000Ty-W9; Tue, 02 Dec 2025 10:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176096.1500660; Tue, 02 Dec 2025 10:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQO4u-0000Qi-Sb; Tue, 02 Dec 2025 10:57:52 +0000
Received: by outflank-mailman (input) for mailman id 1176096;
 Tue, 02 Dec 2025 10:57:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2qtr=6I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vQO4t-0007Nh-8p
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 10:57:51 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd5f9520-cf6d-11f0-980a-7dc792cee155;
 Tue, 02 Dec 2025 11:57:48 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-42e2e50c233so1155315f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Dec 2025 02:57:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5c30c4sm32584562f8f.9.2025.12.02.02.57.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Dec 2025 02:57:47 -0800 (PST)
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
X-Inumbo-ID: bd5f9520-cf6d-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764673068; x=1765277868; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iGQmzOTHQVxZhOuDPWqR9a8TFoVmUjibvWGR4WexcdI=;
        b=arGte0ma9vRd1zRSoSYTKprpLbIYSxSEGTG+ils6AG70HIO5/4j4CYCY4YCA9C5y8k
         FCg+qF/v3aXXD09kn0E6BsWTEiGO9+Nbm7hJbbN3/xldHQoP8kZJZEJqbgOtfP1knevk
         FstemwO0mjoUCkt9q5f+x73/K04ya9IXdhozYh0xKrMpqBI7JutdaPavDbGl/212PCAC
         TNOILDyIQtmX6sg8z/e7233Tao84/RVQoq7CeA6yv6ot7oS+ufzNEAN0etTkJTu9PDwC
         xRbVxir+MubaHfDRBUskOJhHY9aRxoEU+obyfqha/LJvkKDfys+ftH6Dm6hVkAqCVsYQ
         GA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764673068; x=1765277868;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGQmzOTHQVxZhOuDPWqR9a8TFoVmUjibvWGR4WexcdI=;
        b=liI6msq/qru9rfynqgFbkRQ6iR+ykSz848/sqZQ5XxgUfVmdkxNNCOmRlUQAKGdhtj
         3DdY74nBFi6SHxml+Vze9fknq75H/fWCJBSSt41NUzJ524v+quWJ5L5ioAhbfGW3wUtg
         QXJxL2Q9G5LiK49gghtykcuSZxjemzfL0XYSBqd25TUgDziSW2xmJWjWRaY4ULbWQFSN
         J7mqWGzLdV7b6rq9TXgvPoEEcqiGvNhCGWbPsp7rdsp55yAW8zEZQUfHHugYKhpipapk
         m81yx9tXalOTllTqpPSZzrk23oLK4FAG5VyL+iVthD6LU7ogEb2eDC17uqSdJU639iBn
         CmoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSd/geJVfXiFGnGQ7mxwK6KpOm00BB0X9PCWj0A350wAQOq6jet9td8iiuAtOo+bAacjEJPR9nBUU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxsrlL2FcVV6SRbxZb/e1QEm3PNNLFzN4xLjHgv6A8a/b4gsrKV
	pua8JpZao2B36ZEhGkxKSGW4N/63f+uJjGNnnG7A6oxiDbBDSlzSc/a7ZJZOWqzj8a7fCDdNReM
	1JU8=
X-Gm-Gg: ASbGncu0zt/2xYSutfLXsZkOdwt1tBEBqj55qOMBu6grD2mY+Y7uoFQJGu49laJ4QzH
	7olVlHsKHEa2E1+GZonV51DUotXDqLf44e7YE5svt9ivQIh1a25Lfi2iHrjtg6EsOmL3DvojMzS
	MznO89JhRUGEqSU5EmVhCCXqQ8p2VrblPvALlMXwzVHOAcnpVj9wWruuAK/JllAc/O/RnL1To8K
	8MQBtFLVnTPXubJ1IS8/h7tOG7rWGhHuDRWdClo/BpAOxGN4K+4EOtkeC1lb2IE1Fe5fhHQHcvp
	RfGzTwwe7rcRRAVsXVmPJdM5UmuI8l3xMhNo1tDv2EY9Uxmup6oZwa3ZerKe42VjicWTPIPwid0
	KwHSWi+W9oueixThjtB9R0dRYaWfqrEIJ8z6sqEnXaVWS5M5t46gZCOto1belt3QPKm5qd0sY4y
	MXA3FmPI5npPuMcwpvmtwc3Zs1ybUxf1zRZDG5Y9vYz74HOm8gHNE8eSRvAfTMSe1RK6cgJIwdz
	2FLVNX8ITaBtQ==
X-Google-Smtp-Source: AGHT+IG1K8guqAjyaA98CnxCpU0/Z0anMnauHlLpbS1wwhh0oPTOELEr6GehL8K+lYWtKkpTntZ0tQ==
X-Received: by 2002:a05:6000:4012:b0:428:5673:11e0 with SMTP id ffacd0b85a97d-42cc1d1999dmr46852933f8f.40.1764673067878;
        Tue, 02 Dec 2025 02:57:47 -0800 (PST)
Message-ID: <90ac9206-10ce-4c46-83e3-82ac8ef0d152@suse.com>
Date: Tue, 2 Dec 2025 11:57:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [XEN][PATCH v4] xen: make VMTRACE support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Teddy Astie <teddy.astie@vates.tech>, Penny Zheng <Penny.Zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251119193120.1011448-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20251119193120.1011448-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.11.2025 20:31, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> The VMTRACE feature is depends on Platform/Arch HW and code support and now
> can be used only on x86 HVM with Intel VT-x (INTEL_VMX) enabled.
> This makes VMTRACE support optional by introducing HVM Kconfig option:
> - CONFIG_VMTRACE to enable/disable the feature.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> changes in v4:
> - format changes
> 
> changes in v3:
> - drop vmtrace stubs for HVM=n case from hvm.h (VMTRACE depnds on HVM)
> - hvm_vmtrace_reset() fix return err code
> - add comment about using func declaration without definition
> 
> changes in v2:
>  - fix comments from Jan Beulich
>  - move CONFIG_VMTRACE in HVM
>  - drop HAS_VMTRACE
> 
> v3:
>  https://patchwork.kernel.org/project/xen-devel/patch/20251114142207.279834-1-grygorii_strashko@epam.com/
> v2:
>  https://patchwork.kernel.org/project/xen-devel/patch/20251112202442.3879997-1-grygorii_strashko@epam.com/ 
> v1:
>  https://patchwork.kernel.org/project/xen-devel/patch/20251031212005.1338212-1-grygorii_strashko@epam.com/
> 
>  xen/arch/x86/domctl.c                   |  4 +++
>  xen/arch/x86/hvm/Kconfig                | 12 +++++++++
>  xen/arch/x86/hvm/vmx/vmcs.c             |  2 ++
>  xen/arch/x86/hvm/vmx/vmx.c              | 11 ++++++++
>  xen/arch/x86/include/asm/guest-msr.h    |  2 ++
>  xen/arch/x86/include/asm/hvm/hvm.h      | 36 ++++++++++---------------
>  xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  2 ++
>  xen/arch/x86/mm/mem_sharing.c           |  2 ++
>  xen/arch/x86/vm_event.c                 |  8 +++---
>  xen/common/domain.c                     | 10 +++++++
>  xen/common/memory.c                     |  6 +++++
>  xen/common/vm_event.c                   |  3 ++-
>  xen/include/xen/domain.h                |  4 +++
>  xen/include/xen/sched.h                 |  4 +++
>  14 files changed, 80 insertions(+), 26 deletions(-)

Tamas - any chance of an ack here?

Grygorii - chasing missing acks is generally the submitter's responsibility.

Jan

> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index 6153e3c07e2d..d9521808dcba 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -154,6 +154,7 @@ void arch_get_domain_info(const struct domain *d,
>  static int do_vmtrace_op(struct domain *d, struct xen_domctl_vmtrace_op *op,
>                           XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>  {
> +#ifdef CONFIG_VMTRACE
>      struct vcpu *v;
>      int rc;
>  
> @@ -198,6 +199,9 @@ static int do_vmtrace_op(struct domain *d, struct xen_domctl_vmtrace_op *op,
>      vcpu_unpause(v);
>  
>      return rc;
> +#else
> +    return -EOPNOTSUPP;
> +#endif
>  }
>  
>  #define MAX_IOPORTS 0x10000
> diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
> index c1a131d1851a..f75dec5ea40a 100644
> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -35,6 +35,18 @@ config INTEL_VMX
>  	  If your system includes a processor with Intel VT-x support, say Y.
>  	  If in doubt, say Y.
>  
> +config VMTRACE
> +	bool "HW VM tracing support"
> +	depends on INTEL_VMX
> +	default y
> +	help
> +	  Enables HW VM tracing support which allows to configure HW processor
> +	  features (vmtrace_op) to enable capturing information about software
> +	  execution using dedicated hardware facilities with minimal interference
> +	  to the software being traced. The trace data can be retrieved using buffer
> +	  shared between Xen and domain
> +	  (see XENMEM_acquire_resource(XENMEM_resource_vmtrace_buf)).
> +
>  config HVM_FEP
>  	bool "HVM Forced Emulation Prefix support (UNSUPPORTED)" if UNSUPPORTED
>  	default DEBUG
> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> index d610988bf91b..c2e7f9aed39f 100644
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -306,6 +306,7 @@ static int vmx_init_vmcs_config(bool bsp)
>  
>      rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
>  
> +#ifdef CONFIG_VMTRACE
>      /* Check whether IPT is supported in VMX operation. */
>      if ( bsp )
>          vmtrace_available = cpu_has_proc_trace &&
> @@ -317,6 +318,7 @@ static int vmx_init_vmcs_config(bool bsp)
>                 smp_processor_id());
>          return -EINVAL;
>      }
> +#endif
>  
>      if ( caps.cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS )
>      {
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index d042e7fb927f..c98ec110d144 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -622,6 +622,7 @@ static void cf_check domain_creation_finished(struct domain *d)
>  
>  static void vmx_init_ipt(struct vcpu *v)
>  {
> +#ifdef CONFIG_VMTRACE
>      unsigned int size = v->domain->vmtrace_size;
>  
>      if ( !size )
> @@ -632,6 +633,7 @@ static void vmx_init_ipt(struct vcpu *v)
>      ASSERT(size >= PAGE_SIZE && (size & (size - 1)) == 0);
>  
>      v->arch.msrs->rtit.output_limit = size - 1;
> +#endif
>  }
>  
>  static int cf_check vmx_vcpu_initialise(struct vcpu *v)
> @@ -724,11 +726,13 @@ static void vmx_save_guest_msrs(struct vcpu *v)
>       */
>      v->arch.hvm.vmx.shadow_gs = read_gs_shadow();
>  
> +#ifdef CONFIG_VMTRACE
>      if ( v->arch.hvm.vmx.ipt_active )
>      {
>          rdmsrl(MSR_RTIT_OUTPUT_MASK, msrs->rtit.output_mask);
>          rdmsrl(MSR_RTIT_STATUS, msrs->rtit.status);
>      }
> +#endif
>  
>      if ( cp->feat.pks )
>          msrs->pkrs = rdpkrs_and_cache();
> @@ -747,12 +751,14 @@ static void vmx_restore_guest_msrs(struct vcpu *v)
>      if ( cpu_has_msr_tsc_aux )
>          wrmsr_tsc_aux(msrs->tsc_aux);
>  
> +#ifdef CONFIG_VMTRACE
>      if ( v->arch.hvm.vmx.ipt_active )
>      {
>          wrmsrl(MSR_RTIT_OUTPUT_BASE, page_to_maddr(v->vmtrace.pg));
>          wrmsrl(MSR_RTIT_OUTPUT_MASK, msrs->rtit.output_mask);
>          wrmsrl(MSR_RTIT_STATUS, msrs->rtit.status);
>      }
> +#endif
>  
>      if ( cp->feat.pks )
>          wrpkrs(msrs->pkrs);
> @@ -2626,6 +2632,7 @@ static bool cf_check vmx_get_pending_event(
>      return true;
>  }
>  
> +#ifdef CONFIG_VMTRACE
>  /*
>   * We only let vmtrace agents see and modify a subset of bits in MSR_RTIT_CTL.
>   * These all pertain to data-emitted into the trace buffer(s).  Must not
> @@ -2768,6 +2775,7 @@ static int cf_check vmtrace_reset(struct vcpu *v)
>      v->arch.msrs->rtit.status = 0;
>      return 0;
>  }
> +#endif
>  
>  static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
>  {
> @@ -2940,11 +2948,14 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
>      .altp2m_vcpu_emulate_ve = vmx_vcpu_emulate_ve,
>      .altp2m_vcpu_emulate_vmfunc = vmx_vcpu_emulate_vmfunc,
>  #endif
> +
> +#ifdef CONFIG_VMTRACE
>      .vmtrace_control = vmtrace_control,
>      .vmtrace_output_position = vmtrace_output_position,
>      .vmtrace_set_option = vmtrace_set_option,
>      .vmtrace_get_option = vmtrace_get_option,
>      .vmtrace_reset = vmtrace_reset,
> +#endif
>  
>      .get_reg = vmx_get_reg,
>      .set_reg = vmx_set_reg,
> diff --git a/xen/arch/x86/include/asm/guest-msr.h b/xen/arch/x86/include/asm/guest-msr.h
> index 5f0cb0a93995..702f47fe1e16 100644
> --- a/xen/arch/x86/include/asm/guest-msr.h
> +++ b/xen/arch/x86/include/asm/guest-msr.h
> @@ -50,6 +50,7 @@ struct vcpu_msrs
>          };
>      } misc_features_enables;
>  
> +#ifdef CONFIG_VMTRACE
>      /*
>       * 0x00000560 ... 57x - MSR_RTIT_*
>       *
> @@ -81,6 +82,7 @@ struct vcpu_msrs
>              };
>          };
>      } rtit;
> +#endif
>  
>      /*
>       * 0x000006e1 - MSR_PKRS - Protection Key Supervisor.
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> index 7412256a2dab..93da4dd2dc4b 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -234,12 +234,14 @@ struct hvm_function_table {
>      int (*altp2m_vcpu_emulate_vmfunc)(const struct cpu_user_regs *regs);
>  #endif
>  
> +#ifdef CONFIG_VMTRACE
>      /* vmtrace */
>      int (*vmtrace_control)(struct vcpu *v, bool enable, bool reset);
>      int (*vmtrace_output_position)(struct vcpu *v, uint64_t *pos);
>      int (*vmtrace_set_option)(struct vcpu *v, uint64_t key, uint64_t value);
>      int (*vmtrace_get_option)(struct vcpu *v, uint64_t key, uint64_t *value);
>      int (*vmtrace_reset)(struct vcpu *v);
> +#endif
>  
>      uint64_t (*get_reg)(struct vcpu *v, unsigned int reg);
>      void (*set_reg)(struct vcpu *v, unsigned int reg, uint64_t val);
> @@ -738,6 +740,7 @@ static inline bool altp2m_vcpu_emulate_ve(struct vcpu *v)
>  bool altp2m_vcpu_emulate_ve(struct vcpu *v);
>  #endif /* CONFIG_ALTP2M */
>  
> +#ifdef CONFIG_VMTRACE
>  static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool reset)
>  {
>      if ( hvm_funcs.vmtrace_control )
> @@ -772,13 +775,24 @@ static inline int hvm_vmtrace_get_option(
>  
>      return -EOPNOTSUPP;
>  }
> +#else
> +/*
> + * Function declaration(s) here are used without definition(s) to make compiler
> + * happy when VMTRACE=n, compiler DCE will eliminate unused code.
> + */
> +int hvm_vmtrace_output_position(struct vcpu *v, uint64_t *pos);
> +#endif
>  
>  static inline int hvm_vmtrace_reset(struct vcpu *v)
>  {
> +#ifdef CONFIG_VMTRACE
>      if ( hvm_funcs.vmtrace_reset )
>          return alternative_call(hvm_funcs.vmtrace_reset, v);
>  
>      return -EOPNOTSUPP;
> +#else
> +    return -EOPNOTSUPP;
> +#endif
>  }
>  
>  /*
> @@ -934,28 +948,6 @@ static inline bool hvm_has_set_descriptor_access_exiting(void)
>      return false;
>  }
>  
> -static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool reset)
> -{
> -    return -EOPNOTSUPP;
> -}
> -
> -static inline int hvm_vmtrace_output_position(struct vcpu *v, uint64_t *pos)
> -{
> -    return -EOPNOTSUPP;
> -}
> -
> -static inline int hvm_vmtrace_set_option(
> -    struct vcpu *v, uint64_t key, uint64_t value)
> -{
> -    return -EOPNOTSUPP;
> -}
> -
> -static inline int hvm_vmtrace_get_option(
> -    struct vcpu *v, uint64_t key, uint64_t *value)
> -{
> -    return -EOPNOTSUPP;
> -}
> -
>  static inline uint64_t hvm_get_reg(struct vcpu *v, unsigned int reg)
>  {
>      ASSERT_UNREACHABLE();
> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> index 8ff7c8045fc6..879ec10cefd0 100644
> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> @@ -154,8 +154,10 @@ struct vmx_vcpu {
>      /* Do we need to tolerate a spurious EPT_MISCONFIG VM exit? */
>      bool                 ept_spurious_misconfig;
>  
> +#ifdef CONFIG_VMTRACE
>      /* Processor Trace configured and enabled for the vcpu. */
>      bool                 ipt_active;
> +#endif
>  
>      /* Is the guest in real mode? */
>      uint8_t              vmx_realmode;
> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> index 4787b2796479..074f1b2562b3 100644
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1888,7 +1888,9 @@ static int fork(struct domain *cd, struct domain *d)
>          domain_pause(d);
>          cd->max_pages = d->max_pages;
>          *cd->arch.cpu_policy = *d->arch.cpu_policy;
> +#ifdef CONFIG_VMTRACE
>          cd->vmtrace_size = d->vmtrace_size;
> +#endif
>          cd->parent = d;
>      }
>  
> diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
> index fc349270b9c5..112d2ef66dc7 100644
> --- a/xen/arch/x86/vm_event.c
> +++ b/xen/arch/x86/vm_event.c
> @@ -253,7 +253,9 @@ void vm_event_fill_regs(vm_event_request_t *req)
>      req->data.regs.x86.shadow_gs = ctxt.shadow_gs;
>      req->data.regs.x86.dr6 = ctxt.dr6;
>  
> -    if ( hvm_vmtrace_output_position(curr, &req->data.regs.x86.vmtrace_pos) != 1 )
> +    if ( IS_ENABLED(CONFIG_VMTRACE) &&
> +         hvm_vmtrace_output_position(curr,
> +                                     &req->data.regs.x86.vmtrace_pos) != 1 )
>          req->data.regs.x86.vmtrace_pos = ~0;
>  #endif
>  }
> @@ -303,12 +305,12 @@ void vm_event_emulate_check(struct vcpu *v, vm_event_response_t *rsp)
>  #endif
>  }
>  
> +#ifdef CONFIG_VMTRACE
>  void vm_event_reset_vmtrace(struct vcpu *v)
>  {
> -#ifdef CONFIG_HVM
>      hvm_vmtrace_reset(v);
> -#endif
>  }
> +#endif
>  
>  /*
>   * Local variables:
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index e13e01c1d272..ce4f55339fb4 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -136,7 +136,9 @@ struct vcpu *idle_vcpu[NR_CPUS] __read_mostly;
>  
>  vcpu_info_t dummy_vcpu_info;
>  
> +#ifdef CONFIG_VMTRACE
>  bool __read_mostly vmtrace_available;
> +#endif
>  
>  bool __read_mostly vpmu_is_available;
>  
> @@ -318,6 +320,7 @@ static void vcpu_info_reset(struct vcpu *v)
>  
>  static void vmtrace_free_buffer(struct vcpu *v)
>  {
> +#ifdef CONFIG_VMTRACE
>      const struct domain *d = v->domain;
>      struct page_info *pg = v->vmtrace.pg;
>      unsigned int i;
> @@ -332,10 +335,12 @@ static void vmtrace_free_buffer(struct vcpu *v)
>          put_page_alloc_ref(&pg[i]);
>          put_page_and_type(&pg[i]);
>      }
> +#endif
>  }
>  
>  static int vmtrace_alloc_buffer(struct vcpu *v)
>  {
> +#ifdef CONFIG_VMTRACE
>      struct domain *d = v->domain;
>      struct page_info *pg;
>      unsigned int i;
> @@ -377,6 +382,9 @@ static int vmtrace_alloc_buffer(struct vcpu *v)
>      }
>  
>      return -ENODATA;
> +#else
> +    return 0;
> +#endif
>  }
>  
>  /*
> @@ -825,7 +833,9 @@ struct domain *domain_create(domid_t domid,
>          ASSERT(!config->altp2m.nr);
>  #endif
>  
> +#ifdef CONFIG_VMTRACE
>          d->vmtrace_size = config->vmtrace_size;
> +#endif
>      }
>  
>      /* Sort out our idea of is_control_domain(). */
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 3688e6dd5032..66dc7f7a0a41 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1155,8 +1155,10 @@ static unsigned int resource_max_frames(const struct domain *d,
>      case XENMEM_resource_ioreq_server:
>          return ioreq_server_max_frames(d);
>  
> +#ifdef CONFIG_VMTRACE
>      case XENMEM_resource_vmtrace_buf:
>          return d->vmtrace_size >> PAGE_SHIFT;
> +#endif
>  
>      default:
>          return 0;
> @@ -1198,6 +1200,7 @@ static int acquire_ioreq_server(struct domain *d,
>  #endif
>  }
>  
> +#ifdef CONFIG_VMTRACE
>  static int acquire_vmtrace_buf(
>      struct domain *d, unsigned int id, unsigned int frame,
>      unsigned int nr_frames, xen_pfn_t mfn_list[])
> @@ -1220,6 +1223,7 @@ static int acquire_vmtrace_buf(
>  
>      return nr_frames;
>  }
> +#endif
>  
>  /*
>   * Returns -errno on error, or positive in the range [1, nr_frames] on
> @@ -1238,8 +1242,10 @@ static int _acquire_resource(
>      case XENMEM_resource_ioreq_server:
>          return acquire_ioreq_server(d, id, frame, nr_frames, mfn_list);
>  
> +#ifdef CONFIG_VMTRACE
>      case XENMEM_resource_vmtrace_buf:
>          return acquire_vmtrace_buf(d, id, frame, nr_frames, mfn_list);
> +#endif
>  
>      default:
>          ASSERT_UNREACHABLE();
> diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
> index b2787c010890..cf0258223f50 100644
> --- a/xen/common/vm_event.c
> +++ b/xen/common/vm_event.c
> @@ -441,7 +441,8 @@ static int vm_event_resume(struct domain *d, struct vm_event_domain *ved)
>              if ( rsp.flags & VM_EVENT_FLAG_GET_NEXT_INTERRUPT )
>                  vm_event_monitor_next_interrupt(v);
>  
> -            if ( rsp.flags & VM_EVENT_FLAG_RESET_VMTRACE )
> +            if ( IS_ENABLED(CONFIG_VMTRACE) &&
> +                 (rsp.flags & VM_EVENT_FLAG_RESET_VMTRACE) )
>                  vm_event_reset_vmtrace(v);
>  
>              if ( rsp.flags & VM_EVENT_FLAG_VCPU_PAUSED )
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index 8aab05ae93c8..aa86a9f46022 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -191,7 +191,11 @@ void vnuma_destroy(struct vnuma_info *vnuma);
>  static inline void vnuma_destroy(struct vnuma_info *vnuma) { ASSERT(!vnuma); }
>  #endif
>  
> +#ifdef CONFIG_VMTRACE
>  extern bool vmtrace_available;
> +#else
> +#define vmtrace_available false
> +#endif
>  
>  extern bool vpmu_is_available;
>  
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 02bdc256ce37..dcd8647e0d36 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -300,9 +300,11 @@ struct vcpu
>      /* vPCI per-vCPU area, used to store data for long running operations. */
>      struct vpci_vcpu vpci;
>  
> +#ifdef CONFIG_VMTRACE
>      struct {
>          struct page_info *pg; /* One contiguous allocation of d->vmtrace_size */
>      } vmtrace;
> +#endif
>  
>      struct arch_vcpu arch;
>  
> @@ -623,7 +625,9 @@ struct domain
>      unsigned int nr_altp2m;    /* Number of altp2m tables. */
>  #endif
>  
> +#ifdef CONFIG_VMTRACE
>      unsigned int vmtrace_size; /* Buffer size in bytes, or 0 to disable. */
> +#endif
>  
>  #ifdef CONFIG_ARGO
>      /* Argo interdomain communication support */


