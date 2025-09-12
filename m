Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D56B543E3
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 09:30:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121536.1465776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwyEG-0007fj-IX; Fri, 12 Sep 2025 07:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121536.1465776; Fri, 12 Sep 2025 07:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwyEG-0007di-Fx; Fri, 12 Sep 2025 07:29:56 +0000
Received: by outflank-mailman (input) for mailman id 1121536;
 Fri, 12 Sep 2025 07:29:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwyEF-0007dc-Kx
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 07:29:55 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45f94926-8faa-11f0-9809-7dc792cee155;
 Fri, 12 Sep 2025 09:29:53 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b07c28f390eso99169766b.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Sep 2025 00:29:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b30da289sm307046866b.17.2025.09.12.00.29.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 00:29:52 -0700 (PDT)
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
X-Inumbo-ID: 45f94926-8faa-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757662192; x=1758266992; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1OaZ4ACBHXcPAaQSwE2GYXsBNKUBXGC1v8dtnTOZtjQ=;
        b=N1yRLAUS2/5ZXKPbs0A5j/d9wA2/7t5CTFHAeb2kUihbszR8zGTvXFziue1DmBhtVL
         meijvjk8vKsoYNxA6pN+pNeJxJlg/Aq8Mhn/U4bqaPO3vf/Mk3mbLiUsFqWLPDuStj0v
         5EnEI3YC07WgkiclMwLrT351IRm+g+hQTlOMcsM0/OGzi5RuumZkt9OQNZrDXc8M6Wwx
         iHtcwkHvyok6Uuue+qxYoZF+pSMLVgQclFfwecBwEV8KIm1hqgspL/PGF6fcP1k+YUhi
         Qy6DYKaWhj/g700UjMJhDjM5PARJGNMmD1hwoUL1ZSxJYJSlk4ieAOFsafdJNfgMb4rw
         3I8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757662192; x=1758266992;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OaZ4ACBHXcPAaQSwE2GYXsBNKUBXGC1v8dtnTOZtjQ=;
        b=AlLJmyarIir8hOs0iQxZoDiYjw/lifLzrP9r8fslFU/daTTEJfZXPMFj1lpomjn4g7
         gGhiuG4hTc2pB0Z7wK3BE+udSTRe2Uqxr501hfsDpFV39G5fuBByONvWswjuUkFHQO6h
         yq/NbK0a7q1pUZz9c4v2hQ+YjOMEwBZ/0Yi/NIyCNyhwNFM5SGHAAyjvUzdVOZ8Qt4mJ
         ez9C3jhvPKSh0StBGzrtQiodbSVpt82XVmZEAE/XVuT/8Gq+gWfCY0eOH0a6+BQubK5T
         BpIMkeV0qByiHxkjaZidroNSjsqg+tGXFMDVFszU+2uQEorgCQ4h+6x1Qn4L6RgM4BAH
         L8AA==
X-Forwarded-Encrypted: i=1; AJvYcCV0cimtTa4B1Ao7IUWYRLDljyAZjSlxcUp87DJ0rZyGVC9WmuQ5ZjApoeIW8KZokDxzwIOZhLi8VkU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw80AX4x3WbtQjLd6fKAaQ3gXzzR3PcZtT/OgJX6AgU4vVA1eqm
	7MmrUpjLdchW1KH3lKjPrNDQPzToSH5uMtweTvrwlny8tR+Nf0ukMRJv97JJBBfX6g==
X-Gm-Gg: ASbGncurUN7JD2MMsHYKc9AOSzH2zrRWl3Srx2kLWFFfJ4C65Pn7xSK3K0yrcbGlboq
	dy4D7ymj+rQZOwkMEScjx3j5KPUnqRJHWxBeH5RFZPjG24Aguv6I+gNZTWT/zJ8+A5zXIeVVjpf
	Wk34fZZEvVSXWER84y0vqHuMesZLP5X0wD++W3fG7s1QuqBMxE+08d1/xxOGBTzpGZQxwf9/OMo
	zIQQyHEpHW98r1s0dU1VnDOLzb3mRg+BjHmIBZJxoSA19q8osvz9kx2fUkyqO4B/QQuvMV6S2FL
	GFBiUFTfYDX/zspm9GvCsC1fV5M0x1NkcRVr5C1/h9fEJ2m6NBDbaOGqpyVCjAo6l9iNtimZJjl
	9D5wgg+XzEAPeO0tut/M99RjU9LMaaALDljp/c1kz0D2wiVv7K/p5hD/KI3yj/5OcDQHey4Cay1
	YSraOfsqBltnjQBvK8NQ==
X-Google-Smtp-Source: AGHT+IEBqGfy0KWQ0edxWi2/LvF8zYRmD0eI8sUiDHIpd85tM4bid6kQzCDaOu5unS8XwDcNLXdEXA==
X-Received: by 2002:a17:907:7e8c:b0:b04:3513:5138 with SMTP id a640c23a62f3a-b07c37fca87mr188017766b.41.1757662192371;
        Fri, 12 Sep 2025 00:29:52 -0700 (PDT)
Message-ID: <e29930b6-2f13-483b-a8ce-62a93550199d@suse.com>
Date: Fri, 12 Sep 2025 09:29:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/vm_event: introduce vm_event_is_enabled()
To: Penny Zheng <Penny.Zheng@amd.com>, Tamas K Lengyel <tamas@tklengyel.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250912045254.3731398-1-Penny.Zheng@amd.com>
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
In-Reply-To: <20250912045254.3731398-1-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.09.2025 06:52, Penny Zheng wrote:
> Function vm_event_is_enabled() is introduced to check if vm event is enabled,
> and also make the checking conditional upon CONFIG_VM_EVENT, which could help
> DCE a lot calls/codes, such as hvm_monitor_io(), etc when VM_EVENT=n.
> In-place assertion of arch.vm_event is kinds of redundant and could be
> removed.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Why is this sent standalone, without even a reference to the domctl series?
Without the connection, this clearly wouldn't be valid to consider for 4.21.
Also you will want to Cc Oleksii on such past-the-deadline submissions.

> ---
>  xen/arch/x86/hvm/emulate.c          |  6 ++---
>  xen/arch/x86/hvm/hvm.c              | 41 +++++++++++++----------------
>  xen/arch/x86/hvm/svm/intr.c         |  2 +-
>  xen/arch/x86/hvm/vmx/intr.c         |  2 +-
>  xen/arch/x86/include/asm/vm_event.h |  9 +++++++
>  5 files changed, 33 insertions(+), 27 deletions(-)

With this diffstat, I think the subject prefix is misleading (should perhaps
be x86/vm_event: or x86/hvm:).

> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -105,7 +105,7 @@ static int set_context_data(void *buffer, unsigned int size)
>  {
>      struct vcpu *curr = current;
>  
> -    if ( curr->arch.vm_event )
> +    if ( vm_event_is_enabled(curr) )
>      {
>          unsigned int safe_size =
>              min(size, curr->arch.vm_event->emul.read.size);
> @@ -771,7 +771,7 @@ static void *hvmemul_map_linear_addr(
>              ASSERT(p2mt == p2m_ram_logdirty || !p2m_is_readonly(p2mt));
>          }
>  
> -        if ( unlikely(curr->arch.vm_event) &&
> +        if ( unlikely(vm_event_is_enabled(curr)) &&
>               curr->arch.vm_event->send_event &&
>               hvm_monitor_check_p2m(addr, gfn, pfec, npfec_kind_with_gla) )
>          {
> @@ -1870,7 +1870,7 @@ static int hvmemul_rep_outs_set_context(
>      int rc = X86EMUL_OKAY;
>  
>      ASSERT(bytes_per_rep <= 4);
> -    if ( !ev )
> +    if ( !vm_event_is_enabled(current) )
>          return X86EMUL_UNHANDLEABLE;

I wonder if in a case like this one the assignment (to ev) would better move
past the predicate check.

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -532,7 +532,7 @@ void hvm_do_resume(struct vcpu *v)
>      if ( !vcpu_ioreq_handle_completion(v) )
>          return;
>  
> -    if ( unlikely(v->arch.vm_event) )
> +    if ( unlikely(vm_event_is_enabled(v)) )
>          hvm_vm_event_do_resume(v);
>  
>      /* Inject pending hw/sw event */
> @@ -546,11 +546,12 @@ void hvm_do_resume(struct vcpu *v)
>          v->arch.hvm.inject_event.vector = HVM_EVENT_VECTOR_UNSET;
>      }
>  
> -    if ( unlikely(v->arch.vm_event) && v->arch.monitor.next_interrupt_enabled )
> +    if ( unlikely(vm_event_is_enabled(v)) &&

With this, ...

> +         v->arch.monitor.next_interrupt_enabled )
>      {
>          struct x86_event info;
>  
> -        if ( hvm_get_pending_event(v, &info) )
> +        if ( hvm_get_pending_event(v, &info) && vm_event_is_enabled(v) )

... why this?

> @@ -2088,7 +2089,7 @@ int hvm_handle_xsetbv(u32 index, u64 new_bv)
>  {
>      int rc;
>  
> -    if ( index == 0 )
> +    if ( index == 0 && vm_event_is_enabled(current) )
>          hvm_monitor_crX(XCR0, new_bv, current->arch.xcr0);
>  
>      rc = x86emul_write_xcr(index, new_bv, NULL);
> @@ -2337,9 +2338,7 @@ int hvm_set_cr0(unsigned long value, bool may_defer)
>      if ( may_defer && unlikely(v->domain->arch.monitor.write_ctrlreg_enabled &
>                                 monitor_ctrlreg_bitmask(VM_EVENT_X86_CR0)) )
>      {
> -        ASSERT(v->arch.vm_event);
> -
> -        if ( hvm_monitor_crX(CR0, value, old_value) )
> +        if ( vm_event_is_enabled(v) && hvm_monitor_crX(CR0, value, old_value) )
>          {

I don't think assertions (here and below) should be replaced like this.
Can't you e.g. force "may_defer" to false at the top of the function when
vm_event_is_enabled() returns false?

> @@ -2462,9 +2461,8 @@ int hvm_set_cr3(unsigned long value, bool noflush, bool may_defer)
>      if ( may_defer && unlikely(currd->arch.monitor.write_ctrlreg_enabled &
>                                 monitor_ctrlreg_bitmask(VM_EVENT_X86_CR3)) )
>      {
> -        ASSERT(curr->arch.vm_event);
> -
> -        if ( hvm_monitor_crX(CR3, value, curr->arch.hvm.guest_cr[3]) )
> +        if ( vm_event_is_enabled(curr) &&
> +             hvm_monitor_crX(CR3, value, curr->arch.hvm.guest_cr[3]) )
>          {
>              /* The actual write will occur in hvm_do_resume(), if permitted. */
>              curr->arch.vm_event->write_data.do_write.cr3 = 1;
> @@ -2544,9 +2542,7 @@ int hvm_set_cr4(unsigned long value, bool may_defer)
>      if ( may_defer && unlikely(v->domain->arch.monitor.write_ctrlreg_enabled &
>                                 monitor_ctrlreg_bitmask(VM_EVENT_X86_CR4)) )
>      {
> -        ASSERT(v->arch.vm_event);
> -
> -        if ( hvm_monitor_crX(CR4, value, old_cr) )
> +        if ( vm_event_is_enabled(v) && hvm_monitor_crX(CR4, value, old_cr) )
>          {
>              /* The actual write will occur in hvm_do_resume(), if permitted. */
>              v->arch.vm_event->write_data.do_write.cr4 = 1;
> @@ -3407,7 +3403,7 @@ static enum hvm_translation_result __hvm_copy(
>              return HVMTRANS_bad_gfn_to_mfn;
>          }
>  
> -        if ( unlikely(v->arch.vm_event) &&
> +        if ( unlikely(vm_event_is_enabled(v)) &&
>               (flags & HVMCOPY_linear) &&
>               v->arch.vm_event->send_event &&
>               hvm_monitor_check_p2m(addr, gfn, pfec, npfec_kind_with_gla) )
> @@ -3538,6 +3534,7 @@ int hvm_vmexit_cpuid(struct cpu_user_regs *regs, unsigned int inst_len)
>      struct vcpu *curr = current;
>      unsigned int leaf = regs->eax, subleaf = regs->ecx;
>      struct cpuid_leaf res;
> +    int ret = 0;
>  
>      if ( curr->arch.msrs->misc_features_enables.cpuid_faulting &&
>           hvm_get_cpl(curr) > 0 )
> @@ -3554,7 +3551,10 @@ int hvm_vmexit_cpuid(struct cpu_user_regs *regs, unsigned int inst_len)
>      regs->rcx = res.c;
>      regs->rdx = res.d;
>  
> -    return hvm_monitor_cpuid(inst_len, leaf, subleaf);
> +    if ( vm_event_is_enabled(curr) )
> +        ret = hvm_monitor_cpuid(inst_len, leaf, subleaf);
> +
> +    return ret;
>  }
>  
>  void hvm_rdtsc_intercept(struct cpu_user_regs *regs)
> @@ -3694,9 +3694,8 @@ int hvm_msr_write_intercept(unsigned int msr, uint64_t msr_content,
>          if ( ret != X86EMUL_OKAY )
>              return ret;
>  
> -        ASSERT(v->arch.vm_event);
> -
> -        if ( hvm_monitor_msr(msr, msr_content, msr_old_content) )
> +        if ( vm_event_is_enabled(v) &&
> +             hvm_monitor_msr(msr, msr_content, msr_old_content) )
>          {
>              /* The actual write will occur in hvm_do_resume(), if permitted. */
>              v->arch.vm_event->write_data.do_write.msr = 1;
> @@ -3854,12 +3853,10 @@ int hvm_descriptor_access_intercept(uint64_t exit_info,
>      struct vcpu *curr = current;
>      struct domain *currd = curr->domain;
>  
> -    if ( currd->arch.monitor.descriptor_access_enabled )
> -    {
> -        ASSERT(curr->arch.vm_event);
> +    if ( currd->arch.monitor.descriptor_access_enabled &&
> +         vm_event_is_enabled(curr) )
>          hvm_monitor_descriptor_access(exit_info, vmx_exit_qualification,
>                                        descriptor, is_write);
> -    }
>      else if ( !hvm_emulate_one_insn(is_sysdesc_access, "sysdesc access") )
>          domain_crash(currd);

Following "xen: consolidate CONFIG_VM_EVENT" this function is actually unreachable
when VM_EVENT=n, so no change should be needed here. It's instead the unreachability
which needs properly taking care of (to satisfy Misra requirements) there.

> --- a/xen/arch/x86/hvm/svm/intr.c
> +++ b/xen/arch/x86/hvm/svm/intr.c
> @@ -130,7 +130,7 @@ void asmlinkage svm_intr_assist(void)
>      enum hvm_intblk intblk;
>  
>      /* Block event injection while handling a sync vm_event. */
> -    if ( unlikely(v->arch.vm_event) && v->arch.vm_event->sync_event )
> +    if ( unlikely(vm_event_is_enabled(v)) && v->arch.vm_event->sync_event )
>          return;
>  
>      /* Crank the handle on interrupt state. */
> diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
> index b35dc8c586..a8ced95871 100644
> --- a/xen/arch/x86/hvm/vmx/intr.c
> +++ b/xen/arch/x86/hvm/vmx/intr.c
> @@ -239,7 +239,7 @@ void asmlinkage vmx_intr_assist(void)
>      }
>  
>      /* Block event injection while handling a sync vm_event. */
> -    if ( unlikely(v->arch.vm_event) && v->arch.vm_event->sync_event )
> +    if ( unlikely(vm_event_is_enabled(v)) && v->arch.vm_event->sync_event )
>          return;
>  
>  #ifdef CONFIG_MEM_SHARING
> diff --git a/xen/arch/x86/include/asm/vm_event.h b/xen/arch/x86/include/asm/vm_event.h
> index 46e77ed6d9..446d02c7d5 100644
> --- a/xen/arch/x86/include/asm/vm_event.h
> +++ b/xen/arch/x86/include/asm/vm_event.h
> @@ -45,4 +45,13 @@ void vm_event_sync_event(struct vcpu *v, bool value);
>  
>  void vm_event_reset_vmtrace(struct vcpu *v);
>  
> +static inline bool vm_event_is_enabled(struct vcpu *v)
> +{
> +#ifdef CONFIG_VM_EVENT
> +    return v->arch.vm_event != NULL;

Is "enabled" (in the function name) a good description of this condition, Tamas?

Jan

