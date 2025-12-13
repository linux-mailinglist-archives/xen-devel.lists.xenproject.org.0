Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CD9CBA651
	for <lists+xen-devel@lfdr.de>; Sat, 13 Dec 2025 07:59:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186176.1508007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUJaq-00031U-Jr; Sat, 13 Dec 2025 06:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186176.1508007; Sat, 13 Dec 2025 06:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUJaq-0002yN-Gp; Sat, 13 Dec 2025 06:59:04 +0000
Received: by outflank-mailman (input) for mailman id 1186176;
 Sat, 13 Dec 2025 06:59:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q/lp=6T=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vUJao-0002yH-E0
 for xen-devel@lists.xenproject.org; Sat, 13 Dec 2025 06:59:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32b91ab9-d7f1-11f0-9cce-f158ae23cfc8;
 Sat, 13 Dec 2025 07:58:59 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id AD3434EEBFCB;
 Sat, 13 Dec 2025 07:58:57 +0100 (CET)
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
X-Inumbo-ID: 32b91ab9-d7f1-11f0-9cce-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1765609137;
	b=ee1JvJ7YL0fGuUmGoCwjCyjvrZNhektGjWZn+qhio6HvWbe6OuIXStYPtCzebHxJlhoU
	 5jOYV4SGVvuVAclgYTXsYfPYYw0REMX5A8vEBvsM5IBHrBXIJ0CPJGSkN3KtUtbRh6WFa
	 cUQ8dr6es+45PTv0TisikotuMSdnH3ZVtXm6gfxIV0/VJDdN6VmQBq/t28TWcAos4Sv84
	 i0wShnUaea8Px+qrVkU5sgzhONQ0IPtFC90uSr20da5eKWlfoYmdX3/UsiQ+YURncVziA
	 l5O9raLVuQCUaZcaUIkMT4Z5+PjGSiJME6lraf84EV7zMo0g9S/ByZ6+dXVIxwO9ziePV
	 b9Uw6m3OxlJKmu1lmW8lOEcxkFezFk2+oED3qHYvSnl6pNa3A6dLo2TWwftubPthOCYz7
	 I53M0uoS2qEKsr23DKGyBZqUtj3FZhIEqejBSmWaBZeMvIOHJPQh4jAlf3Jodtm2J37/V
	 nnxMBFOsCYjqtDwCpFJazmeoA/TVW/OdInoYVDOAzfZS4a2sOIIMzOBl1yKpDE2EkdU5X
	 d/QI1RolzwSwgeT7IVOElroNTtz2VXoqKo0S3XUBZPr/abSjM/DEw+UkOEKLho2F3RhUR
	 lEqfFKqloqtCX/2iPBfVAVUfeVetjYhbHpuEq58++FBGQQizGDsOhz0KE9xVICI=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1765609137;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=Pcx8SiybhlyKkT/ZaGb4kPqoouWaFapIw9UHGFrMoEU=;
	b=4J3J0Hq/lyslM/YXaloWADT3iX/+ebnXrBK4OCUQ5zseCvWyNO49o53hWobL8w0kYjDQ
	 +vZFeWP2lSvQk5MnThWh+w4uDoXwIV96+d1APva8zjeV4H21YrCevj06ke4WH7Mo1PN02
	 1/OyGu0kWcyQppo+zCCr0dyF8s5vPZP7r50EDVftY/RVjaMCViYCUOg0PQZBToPJXFH1j
	 t+dtfI9shJhqrCxKPoSZc02EuNM43GjbTgqh1DA3XgJkgQ5mvxxTGYx7bFq0TXHg+mSdi
	 ax/9RB4e/bgyA2X3PnR1sEfmHFGX2C7/dZ0qS91apu2WdIaxXr9UVXVkay+ArKYe5M67s
	 yphHrjdVu88Ig9zCtukaKOvY6Gt0z4vuhmyCXbN1tySI4j21Pp5Q0/HtR5CZDmtjaU6Da
	 fbUPkQkKzyYA53ShXL2bwyTroH9CQi/8HLjfATs0hWpmt1CCN7zsp+MJwjlH/GDETsNRi
	 XskLhCGHRA394kT3/pwHNJb+zjDEBjrrFU79yCop1MJ+Z10HrPl8YstmfW9ISqeC3Ro1l
	 W05q0ZfNelOh2GaDzZk8FpEDOtF/hEv3XLWxeqhHNRkdydZm9OUnuYnRqd/ttc/tGBsr9
	 pd5FBOrqCdSihhoNUVhbd+TycIKrN5pmLj5LCjv2BTLfz9y7TwC2vYzEKxWZjb0=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1765609137; bh=lAL3siz0ooYXY+hDQpQsUtV99kmjC4wXOBwu24AIX0M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LhUaMYCAJe9AiF0hc3hLGUflYCxG2wtrVVYRKKMP+aguDau0rOTPfoA5qRuH+6jeu
	 eTj2W0vvWp5X25REf7GS69ysd+QOKrSY2iSq6Uc3ZZj9YFol9xWNoefL84RKdidYIS
	 E7rWRdyIBFMNRINZ37Nurp2h0LKlWUNdjFlYs1IK0xovBlGBNex9iPlin3Lqz16c2f
	 Tzjnt+HYN0FxVlK1+IPwFi6Sh6d8eSvxpiVPVnMumWWCHshX/WcHas8qvm2yziyNSP
	 23cu3ls16k047uvAwG/BsqUJttAVyXvj7xz+njvHlANRA3OfXyFA1M152AYitSIENJ
	 /Ken8Y9LCHTEg==
MIME-Version: 1.0
Date: Sat, 13 Dec 2025 07:58:57 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH 3/5] x86: Address MIRSA R8.3 (declaration/definition
 mismatch) issues
In-Reply-To: <20251212222032.2640580-4-andrew.cooper3@citrix.com>
References: <20251212222032.2640580-1-andrew.cooper3@citrix.com>
 <20251212222032.2640580-4-andrew.cooper3@citrix.com>
Message-ID: <a965c6d701243f840ad67e7916118450@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

s/MIRSA/MISRA/ in the subject, here and in patch 4

On 2025-12-12 23:20, Andrew Cooper wrote:
> These are mostly name mismatches, but a couple have type alias 
> mismatches too.
> 
> For shadow_put_top_level() and is_patch(), the declaration name is the 
> better
> choice so change the name in the function.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/arch/x86/include/asm/hypercall.h |  4 ++--
>  xen/arch/x86/include/asm/pv/mm.h     |  4 ++--
>  xen/arch/x86/include/asm/shadow.h    |  2 +-
>  xen/arch/x86/mm.c                    |  4 ++--
>  xen/arch/x86/mm/shadow/common.c      |  8 ++++----
>  xen/arch/x86/mm/shadow/multi.h       |  4 ++--
>  xen/arch/x86/mm/shadow/private.h     | 10 +++++-----
>  xen/common/kimage.c                  |  2 +-
>  xen/common/livepatch.c               | 14 +++++++-------
>  xen/include/xen/livepatch.h          |  2 +-
>  10 files changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/hypercall.h 
> b/xen/arch/x86/include/asm/hypercall.h
> index f6e9e2313b3c..bf2f0e169aef 100644
> --- a/xen/arch/x86/include/asm/hypercall.h
> +++ b/xen/arch/x86/include/asm/hypercall.h
> @@ -22,8 +22,8 @@
>  void pv_hypercall(struct cpu_user_regs *regs);
>  #endif
> 
> -void pv_ring1_init_hypercall_page(void *ptr);
> -void pv_ring3_init_hypercall_page(void *ptr);
> +void pv_ring1_init_hypercall_page(void *p);
> +void pv_ring3_init_hypercall_page(void *p);
> 
>  /*
>   * Both do_mmuext_op() and do_mmu_update():
> diff --git a/xen/arch/x86/include/asm/pv/mm.h 
> b/xen/arch/x86/include/asm/pv/mm.h
> index 182764542c1f..a5745908206a 100644
> --- a/xen/arch/x86/include/asm/pv/mm.h
> +++ b/xen/arch/x86/include/asm/pv/mm.h
> @@ -18,7 +18,7 @@ int pv_set_gdt(struct vcpu *v, const unsigned long 
> frames[],
>                 unsigned int entries);
>  void pv_destroy_gdt(struct vcpu *v);
> 
> -bool pv_map_ldt_shadow_page(unsigned int off);
> +bool pv_map_ldt_shadow_page(unsigned int offset);
>  bool pv_destroy_ldt(struct vcpu *v);
> 
>  int validate_segdesc_page(struct page_info *page);
> @@ -40,7 +40,7 @@ static inline int pv_set_gdt(struct vcpu *v, const 
> unsigned long frames[],
>  { ASSERT_UNREACHABLE(); return -EINVAL; }
>  static inline void pv_destroy_gdt(struct vcpu *v) { 
> ASSERT_UNREACHABLE(); }
> 
> -static inline bool pv_map_ldt_shadow_page(unsigned int off) { return 
> false; }
> +static inline bool pv_map_ldt_shadow_page(unsigned int offset) { 
> return false; }
>  static inline bool pv_destroy_ldt(struct vcpu *v)
>  { ASSERT_UNREACHABLE(); return false; }
> 
> diff --git a/xen/arch/x86/include/asm/shadow.h 
> b/xen/arch/x86/include/asm/shadow.h
> index 9a8d1b8353cd..60589c3cacee 100644
> --- a/xen/arch/x86/include/asm/shadow.h
> +++ b/xen/arch/x86/include/asm/shadow.h
> @@ -63,7 +63,7 @@ int shadow_enable(struct domain *d, u32 mode);
> 
>  /* Enable VRAM dirty bit tracking. */
>  int shadow_track_dirty_vram(struct domain *d,
> -                            unsigned long first_pfn,
> +                            unsigned long begin_pfn,
>                              unsigned int nr_frames,
>                              XEN_GUEST_HANDLE(void) 
> guest_dirty_bitmap);
> 
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index b929d15d0050..0d0d5292953b 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4566,7 +4566,7 @@ static int __do_update_va_mapping(
>  }
> 
>  long do_update_va_mapping(
> -    unsigned long va, u64 val64, unsigned long flags)
> +    unsigned long va, uint64_t val64, unsigned long flags)
>  {
>      int rc = __do_update_va_mapping(va, val64, flags, 
> current->domain);
> 
> @@ -4578,7 +4578,7 @@ long do_update_va_mapping(
>  }
> 
>  long do_update_va_mapping_otherdomain(
> -    unsigned long va, u64 val64, unsigned long flags, domid_t domid)
> +    unsigned long va, uint64_t val64, unsigned long flags, domid_t 
> domid)
>  {
>      struct domain *pg_owner;
>      int rc;
> diff --git a/xen/arch/x86/mm/shadow/common.c 
> b/xen/arch/x86/mm/shadow/common.c
> index f2aee5be46a7..f9310d008de6 100644
> --- a/xen/arch/x86/mm/shadow/common.c
> +++ b/xen/arch/x86/mm/shadow/common.c
> @@ -751,7 +751,7 @@ void shadow_promote(struct domain *d, mfn_t gmfn, 
> unsigned int type)
>      TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_PROMOTE);
>  }
> 
> -void shadow_demote(struct domain *d, mfn_t gmfn, u32 type)
> +void shadow_demote(struct domain *d, mfn_t gmfn, unsigned int type)
>  {
>      struct page_info *page = mfn_to_page(gmfn);
> 
> @@ -2615,11 +2615,11 @@ pagetable_t sh_set_toplevel_shadow(struct vcpu 
> *v,
>   * Helper invoked when releasing of a top-level shadow's reference was
>   * deferred in sh_set_toplevel_shadow() above.
>   */
> -void shadow_put_top_level(struct domain *d, pagetable_t old_entry)
> +void shadow_put_top_level(struct domain *d, pagetable_t old)
>  {
> -    ASSERT(!pagetable_is_null(old_entry));
> +    ASSERT(!pagetable_is_null(old));
>      paging_lock(d);
> -    sh_put_ref(d, pagetable_get_mfn(old_entry), 0);
> +    sh_put_ref(d, pagetable_get_mfn(old), 0);
>      paging_unlock(d);
>  }
> 
> diff --git a/xen/arch/x86/mm/shadow/multi.h 
> b/xen/arch/x86/mm/shadow/multi.h
> index 0e938594345a..fc86d7a8d9cd 100644
> --- a/xen/arch/x86/mm/shadow/multi.h
> +++ b/xen/arch/x86/mm/shadow/multi.h
> @@ -89,11 +89,11 @@ SHADOW_INTERNAL_NAME(sh_paging_mode, GUEST_LEVELS);
>  #if SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC
>  extern void
>  SHADOW_INTERNAL_NAME(sh_resync_l1, GUEST_LEVELS)
> -     (struct vcpu *v, mfn_t gmfn, mfn_t snpmfn);
> +     (struct vcpu *v, mfn_t gl1mfn, mfn_t snpmfn);
> 
>  extern int
>  SHADOW_INTERNAL_NAME(sh_safe_not_to_sync, GUEST_LEVELS)
> -     (struct vcpu*v, mfn_t gmfn);
> +     (struct vcpu*v, mfn_t gl1mfn);
> 
>  extern int
>  SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, GUEST_LEVELS)
> diff --git a/xen/arch/x86/mm/shadow/private.h 
> b/xen/arch/x86/mm/shadow/private.h
> index bc99e00100f7..12cfb52f095b 100644
> --- a/xen/arch/x86/mm/shadow/private.h
> +++ b/xen/arch/x86/mm/shadow/private.h
> @@ -364,11 +364,11 @@ bool  shadow_hash_delete(struct domain *d,
>                           unsigned long n, unsigned int t, mfn_t smfn);
> 
>  /* shadow promotion */
> -void shadow_promote(struct domain *d, mfn_t gmfn, u32 type);
> -void shadow_demote(struct domain *d, mfn_t gmfn, u32 type);
> +void shadow_promote(struct domain *d, mfn_t gmfn, unsigned int type);
> +void shadow_demote(struct domain *d, mfn_t gmfn, unsigned int type);
> 
>  /* Shadow page allocation functions */
> -bool __must_check shadow_prealloc(struct domain *d, unsigned int 
> shadow_type,
> +bool __must_check shadow_prealloc(struct domain *d, unsigned int type,
>                                    unsigned int count);
>  mfn_t shadow_alloc(struct domain *d,
>                      u32 shadow_type,
> @@ -392,11 +392,11 @@ int sh_validate_guest_entry(struct vcpu *v, mfn_t 
> gmfn, void *entry, u32 size);
>   * Returns non-zero if we need to flush TLBs.
>   * level and fault_addr desribe how we found this to be a pagetable;
>   * level==0 means we have some other reason for revoking write access. 
> */
> -extern int sh_remove_write_access(struct domain *d, mfn_t 
> readonly_mfn,
> +extern int sh_remove_write_access(struct domain *d, mfn_t gmfn,
>                                    unsigned int level,
>                                    unsigned long fault_addr);
>  #else
> -static inline int sh_remove_write_access(struct domain *d, mfn_t 
> readonly_mfn,
> +static inline int sh_remove_write_access(struct domain *d, mfn_t gmfn,
>                                           unsigned int level,
>                                           unsigned long fault_addr)
>  {
> diff --git a/xen/common/kimage.c b/xen/common/kimage.c
> index 9961eac187e9..e1aec5a18a54 100644
> --- a/xen/common/kimage.c
> +++ b/xen/common/kimage.c
> @@ -66,7 +66,7 @@
>  static int kimage_is_destination_range(struct kexec_image *image,
>                                         paddr_t start, paddr_t end);
>  static struct page_info *kimage_alloc_page(struct kexec_image *image,
> -                                           paddr_t dest);
> +                                           paddr_t destination);
> 
>  static struct page_info *kimage_alloc_zeroed_page(unsigned memflags)
>  {
> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> index d0da2aa28132..7446533c8cfb 100644
> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -107,7 +107,7 @@ static int verify_payload(const struct 
> xen_sysctl_livepatch_upload *upload, char
>      return 0;
>  }
> 
> -bool is_patch(const void *ptr)
> +bool is_patch(const void *addr)
>  {
>      const struct payload *data;
>      bool r = false;
> @@ -115,12 +115,12 @@ bool is_patch(const void *ptr)
>      rcu_read_lock(&rcu_payload_lock);
>      list_for_each_entry_rcu ( data, &payload_list, list )
>      {
> -        if ( (ptr >= data->rw_addr &&
> -              ptr < (data->rw_addr + data->rw_size)) ||
> -             (ptr >= data->ro_addr &&
> -              ptr < (data->ro_addr + data->ro_size)) ||
> -             (ptr >= data->text_addr &&
> -              ptr < (data->text_addr + data->text_size)) )
> +        if ( (addr >= data->rw_addr &&
> +              addr < (data->rw_addr + data->rw_size)) ||
> +             (addr >= data->ro_addr &&
> +              addr < (data->ro_addr + data->ro_size)) ||
> +             (addr >= data->text_addr &&
> +              addr < (data->text_addr + data->text_size)) )
>          {
>              r = 1;
>              break;
> diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
> index 3f5ad01f1bdd..45c8924f3412 100644
> --- a/xen/include/xen/livepatch.h
> +++ b/xen/include/xen/livepatch.h
> @@ -89,7 +89,7 @@ enum va_type {
>   * Function to secure the allocate pages (from 
> arch_livepatch_alloc_payload)
>   * with the right page permissions.
>   */
> -int arch_livepatch_secure(const void *va, unsigned int pages, enum 
> va_type types);
> +int arch_livepatch_secure(const void *va, unsigned int pages, enum 
> va_type type);
> 
>  void arch_livepatch_init(void);

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

