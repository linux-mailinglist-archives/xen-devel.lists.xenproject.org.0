Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C681742DC4
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 21:48:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557062.870083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qExc5-0001hz-Om; Thu, 29 Jun 2023 19:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557062.870083; Thu, 29 Jun 2023 19:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qExc5-0001gE-M7; Thu, 29 Jun 2023 19:47:33 +0000
Received: by outflank-mailman (input) for mailman id 557062;
 Thu, 29 Jun 2023 19:47:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWGL=CR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qExc4-0001g8-17
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 19:47:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7ba632d-16b5-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 21:47:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4F1061615;
 Thu, 29 Jun 2023 19:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0569C433CA;
 Thu, 29 Jun 2023 19:47:25 +0000 (UTC)
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
X-Inumbo-ID: c7ba632d-16b5-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688068048;
	bh=t2zAU30UcWSKsqU076c71bLf3SOkoOP9HcdQJ9SHiO4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=E7APNIwQLXys+P7Ni0MiPCyQIKTh5JWcYujrRLxVht6CQT8GpFKn+1qq7w9Iz4+BM
	 zkD8GIcjq0/t+urJbsZ6up3hjGN+A67Zze4dO7vqeLLeEL01aHi7gN8RFlpRo2FdNb
	 VpVEYA+g1499nzXMAAvIDTREzJKlOYbIi4EPxBOSit9oEJavnIo1m8e28IPu4WQE7h
	 WzCu/X0XI73FTCz4c2d2F+X0QBEeZBLcA7KdQoa3XqMOA1fabrTDyWuBzBccUzdWCV
	 1UbMNyXiyc6tgoj+kn5b5LGcbQgEF+bRiWIGGYdgzkdGNv594uf65CDW5ZSKk3+UVD
	 yE8Jz68EaLNTw==
Date: Thu, 29 Jun 2023 12:47:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, 
    Tamas K Lengyel <tamas@tklengyel.com>, 
    Alexandru Isaila <aisaila@bitdefender.com>, 
    Petre Pircalabu <ppircalabu@bitdefender.com>, 
    Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH 5/5] x86: make parameter names of function declarations
 consistent
In-Reply-To: <5ee57d7bcd79daa0314f182ecb73e1eb6d8ecc03.1688049495.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2306291236580.3936094@ubuntu-linux-20-04-desktop>
References: <cover.1688049494.git.federico.serafini@bugseng.com> <5ee57d7bcd79daa0314f182ecb73e1eb6d8ecc03.1688049495.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Jun 2023, Federico Serafini wrote:
> Change the parameter names of function declarations to be consistent
> with the names used in the corresponding function definitions
> so as to fix violations of MISRA C:2012 Rule 8.3.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>  xen/arch/x86/cpu/mcheck/mce.h           |  2 +-
>  xen/arch/x86/cpu/mcheck/x86_mca.h       |  2 +-
>  xen/arch/x86/hvm/rtc.c                  |  2 +-
>  xen/arch/x86/hvm/svm/nestedhvm.h        |  2 +-
>  xen/arch/x86/hvm/vioapic.c              |  2 +-
>  xen/arch/x86/include/asm/genapic.h      |  2 +-
>  xen/arch/x86/include/asm/guest_pt.h     |  2 +-
>  xen/arch/x86/include/asm/hap.h          |  2 +-
>  xen/arch/x86/include/asm/hvm/io.h       |  2 +-
>  xen/arch/x86/include/asm/hvm/monitor.h  |  2 +-
>  xen/arch/x86/include/asm/hvm/svm/vmcb.h |  2 +-
>  xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  4 ++--
>  xen/arch/x86/include/asm/hvm/vmx/vvmx.h |  8 +++----
>  xen/arch/x86/include/asm/io_apic.h      |  2 +-
>  xen/arch/x86/include/asm/irq.h          |  6 ++---
>  xen/arch/x86/include/asm/mem_access.h   |  2 +-
>  xen/arch/x86/include/asm/mpspec.h       |  2 +-
>  xen/arch/x86/include/asm/msi.h          |  4 ++--
>  xen/arch/x86/include/asm/p2m.h          |  8 +++----
>  xen/arch/x86/include/asm/paging.h       |  2 +-
>  xen/arch/x86/include/asm/psr.h          |  2 +-
>  xen/arch/x86/include/asm/setup.h        |  2 +-
>  xen/arch/x86/include/asm/uaccess.h      |  6 ++---
>  xen/arch/x86/include/asm/xstate.h       |  2 +-
>  xen/include/xen/lib/x86/cpu-policy.h    | 29 +++++++++++++------------
>  25 files changed, 51 insertions(+), 50 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/mcheck/mce.h b/xen/arch/x86/cpu/mcheck/mce.h
> index bea08bdc74..72d8dbc471 100644
> --- a/xen/arch/x86/cpu/mcheck/mce.h
> +++ b/xen/arch/x86/cpu/mcheck/mce.h
> @@ -44,7 +44,7 @@ extern uint8_t cmci_apic_vector;
>  extern bool lmce_support;
>  
>  /* Init functions */
> -enum mcheck_type amd_mcheck_init(struct cpuinfo_x86 *c);
> +enum mcheck_type amd_mcheck_init(struct cpuinfo_x86 *ci);
>  enum mcheck_type intel_mcheck_init(struct cpuinfo_x86 *c, bool bsp);
>  
>  void amd_nonfatal_mcheck_init(struct cpuinfo_x86 *c);
> diff --git a/xen/arch/x86/cpu/mcheck/x86_mca.h b/xen/arch/x86/cpu/mcheck/x86_mca.h
> index 18116737af..36b6127a37 100644
> --- a/xen/arch/x86/cpu/mcheck/x86_mca.h
> +++ b/xen/arch/x86/cpu/mcheck/x86_mca.h
> @@ -113,7 +113,7 @@ static inline int mcabanks_test(int bit, struct mca_banks* banks)
>      return test_bit(bit, banks->bank_map);
>  }
>  
> -struct mca_banks *mcabanks_alloc(unsigned int nr);
> +struct mca_banks *mcabanks_alloc(unsigned int nr_mce_banks);
>  void mcabanks_free(struct mca_banks *banks);
>  extern struct mca_banks *mca_allbanks;
>  
> diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
> index c1ab6c7d58..ebb259586a 100644
> --- a/xen/arch/x86/hvm/rtc.c
> +++ b/xen/arch/x86/hvm/rtc.c
> @@ -59,7 +59,7 @@ enum rtc_mode {
>  static void rtc_copy_date(RTCState *s);
>  static void rtc_set_time(RTCState *s);
>  static inline int from_bcd(RTCState *s, int a);
> -static inline int convert_hour(RTCState *s, int hour);
> +static inline int convert_hour(RTCState *s, int raw);
>  
>  static void rtc_update_irq(RTCState *s)
>  {
> diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
> index 43245e13de..eb9c416307 100644
> --- a/xen/arch/x86/hvm/svm/nestedhvm.h
> +++ b/xen/arch/x86/hvm/svm/nestedhvm.h
> @@ -42,7 +42,7 @@ int cf_check nsvm_vcpu_initialise(struct vcpu *v);
>  int cf_check nsvm_vcpu_reset(struct vcpu *v);
>  int nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs);
>  int cf_check nsvm_vcpu_vmexit_event(struct vcpu *v,
> -                                    const struct x86_event *event);
> +                                    const struct x86_event *trap);
>  uint64_t cf_check nsvm_vcpu_hostcr3(struct vcpu *v);
>  bool cf_check nsvm_vmcb_guest_intercepts_event(
>      struct vcpu *v, unsigned int vector, int errcode);
> diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
> index 41e3c4d5e4..4e40d3609a 100644
> --- a/xen/arch/x86/hvm/vioapic.c
> +++ b/xen/arch/x86/hvm/vioapic.c
> @@ -43,7 +43,7 @@
>  /* HACK: Route IRQ0 only to VCPU0 to prevent time jumps. */
>  #define IRQ0_SPECIAL_ROUTING 1
>  
> -static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int irq);
> +static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin);
>  
>  static struct hvm_vioapic *addr_vioapic(const struct domain *d,
>                                          unsigned long addr)
> diff --git a/xen/arch/x86/include/asm/genapic.h b/xen/arch/x86/include/asm/genapic.h
> index beeaddf19d..970df8ffe0 100644
> --- a/xen/arch/x86/include/asm/genapic.h
> +++ b/xen/arch/x86/include/asm/genapic.h
> @@ -43,7 +43,7 @@ void cf_check send_IPI_self_legacy(uint8_t vector);
>  
>  void cf_check init_apic_ldr_flat(void);
>  unsigned int cf_check cpu_mask_to_apicid_flat(const cpumask_t *cpumask);
> -void cf_check send_IPI_mask_flat(const cpumask_t *mask, int vector);
> +void cf_check send_IPI_mask_flat(const cpumask_t *cpumask, int vector);
>  const cpumask_t *cf_check vector_allocation_cpumask_flat(int cpu);
>  #define GENAPIC_FLAT \
>  	.int_delivery_mode = dest_LowestPrio, \
> diff --git a/xen/arch/x86/include/asm/guest_pt.h b/xen/arch/x86/include/asm/guest_pt.h
> index bde7588342..f616357107 100644
> --- a/xen/arch/x86/include/asm/guest_pt.h
> +++ b/xen/arch/x86/include/asm/guest_pt.h
> @@ -422,7 +422,7 @@ static inline unsigned int guest_walk_to_page_order(const walk_t *gw)
>  
>  bool
>  guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
> -                  unsigned long va, walk_t *gw, uint32_t pfec,
> +                  unsigned long va, walk_t *gw, uint32_t walk,
>                    gfn_t top_gfn, mfn_t top_mfn, void *top_map);
>  
>  /* Pretty-print the contents of a guest-walk */
> diff --git a/xen/arch/x86/include/asm/hap.h b/xen/arch/x86/include/asm/hap.h
> index 9d12327b12..05e124ad57 100644
> --- a/xen/arch/x86/include/asm/hap.h
> +++ b/xen/arch/x86/include/asm/hap.h
> @@ -30,7 +30,7 @@ void  hap_vcpu_init(struct vcpu *v);
>  int   hap_track_dirty_vram(struct domain *d,
>                             unsigned long begin_pfn,
>                             unsigned int nr_frames,
> -                           XEN_GUEST_HANDLE(void) dirty_bitmap);
> +                           XEN_GUEST_HANDLE(void) guest_dirty_bitmap);
>  
>  extern const struct paging_mode *hap_paging_get_mode(struct vcpu *);
>  int hap_set_allocation(struct domain *d, unsigned int pages, bool *preempted);
> diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
> index 8df33eb6cc..cad082f020 100644
> --- a/xen/arch/x86/include/asm/hvm/io.h
> +++ b/xen/arch/x86/include/asm/hvm/io.h
> @@ -90,7 +90,7 @@ bool handle_mmio_with_translation(unsigned long gla, unsigned long gpfn,
>                                    struct npfec);
>  bool handle_pio(uint16_t port, unsigned int size, int dir);
>  void hvm_interrupt_post(struct vcpu *v, int vector, int type);
> -void hvm_dpci_eoi(struct domain *d, unsigned int guest_irq);
> +void hvm_dpci_eoi(struct domain *d, unsigned int guest_gsi);
>  void msix_write_completion(struct vcpu *);
>  
>  #ifdef CONFIG_HVM
> diff --git a/xen/arch/x86/include/asm/hvm/monitor.h b/xen/arch/x86/include/asm/hvm/monitor.h
> index 5276b0af08..02021be47b 100644
> --- a/xen/arch/x86/include/asm/hvm/monitor.h
> +++ b/xen/arch/x86/include/asm/hvm/monitor.h
> @@ -25,7 +25,7 @@ bool hvm_monitor_cr(unsigned int index, unsigned long value,
>                      unsigned long old);
>  #define hvm_monitor_crX(cr, new, old) \
>                          hvm_monitor_cr(VM_EVENT_X86_##cr, new, old)
> -bool hvm_monitor_msr(unsigned int msr, uint64_t value, uint64_t old_value);
> +bool hvm_monitor_msr(unsigned int msr, uint64_t new_value, uint64_t old_value);
>  void hvm_monitor_descriptor_access(uint64_t exit_info,
>                                     uint64_t vmx_exit_qualification,
>                                     uint8_t descriptor, bool is_write);
> diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
> index a1a8a7fd25..91221ff4e2 100644
> --- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
> +++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
> @@ -607,7 +607,7 @@ void setup_vmcb_dump(void);
>  #define MSR_INTERCEPT_READ    1
>  #define MSR_INTERCEPT_WRITE   2
>  #define MSR_INTERCEPT_RW      (MSR_INTERCEPT_WRITE | MSR_INTERCEPT_READ)
> -void svm_intercept_msr(struct vcpu *v, uint32_t msr, int enable);
> +void svm_intercept_msr(struct vcpu *v, uint32_t msr, int flags);
>  #define svm_disable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_NONE)
>  #define svm_enable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_RW)
>  
> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> index d07fcb2bc9..24bf409d8f 100644
> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> @@ -656,10 +656,10 @@ bool vmx_msr_is_intercepted(struct vmx_msr_bitmap *msr_bitmap,
>                              unsigned int msr, bool is_write) __nonnull(1);
>  void virtual_vmcs_enter(const struct vcpu *);
>  void virtual_vmcs_exit(const struct vcpu *);
> -u64 virtual_vmcs_vmread(const struct vcpu *, u32 encoding);
> +u64 virtual_vmcs_vmread(const struct vcpu *, u32 vmcs_encoding);

Shouldn't the first parameter be "v" to match the definition?

Or is that a different MISRA C rule?


>  enum vmx_insn_errno virtual_vmcs_vmread_safe(const struct vcpu *v,
>                                               u32 vmcs_encoding, u64 *val);
> -void virtual_vmcs_vmwrite(const struct vcpu *, u32 encoding, u64 val);
> +void virtual_vmcs_vmwrite(const struct vcpu *, u32 vmcs_encoding, u64 val);

same here


>  enum vmx_insn_errno virtual_vmcs_vmwrite_safe(const struct vcpu *v,
>                                                u32 vmcs_encoding, u64 val);
>  
> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
> index dc9db69258..1e4bbc0d78 100644
> --- a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
> @@ -144,9 +144,9 @@ enum vvmcs_encoding_type {
>      VVMCS_TYPE_HSTATE,
>  };
>  
> -u64 get_vvmcs_virtual(void *vvmcs, u32 encoding);
> +u64 get_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding);

This one should return uint64_t to match the definition. Or is that a
different MISRA C rule?


>  u64 get_vvmcs_real(const struct vcpu *, u32 encoding);
> -void set_vvmcs_virtual(void *vvmcs, u32 encoding, u64 val);
> +void set_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding, u64 val);

This one should be:
void set_vvmcs_virtual(void *vvmcs, uint32_t vmcs_encoding, uint64_t val)

Other than these, everything else checks out

