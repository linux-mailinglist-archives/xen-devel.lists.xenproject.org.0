Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A207576565
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 18:42:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368346.599577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCONh-0007sP-7o; Fri, 15 Jul 2022 16:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368346.599577; Fri, 15 Jul 2022 16:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCONh-0007pH-4L; Fri, 15 Jul 2022 16:41:33 +0000
Received: by outflank-mailman (input) for mailman id 368346;
 Fri, 15 Jul 2022 16:41:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d/Zu=XU=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1oCONg-0007pB-0g
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 16:41:32 +0000
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9e068a6-045c-11ed-bd2d-47488cf2e6aa;
 Fri, 15 Jul 2022 18:41:30 +0200 (CEST)
Received: by mail-yb1-f178.google.com with SMTP id 75so9338167ybf.4
 for <xen-devel@lists.xenproject.org>; Fri, 15 Jul 2022 09:41:30 -0700 (PDT)
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
X-Inumbo-ID: f9e068a6-045c-11ed-bd2d-47488cf2e6aa
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UvwfLw66R/P7k8ZVdzukFQ8abYNVRPzG+g6tIH2YHJ8=;
        b=Zvvnqz9xlmszutx0qeMIKTYl6BeDQYMGTKHXE+j5GIfBbG+WFavgP02MxvK3FKBegN
         bgzk05yjaSdy9MWHWLT3vgYqpeCCckpM2LOI9P+pKWHc70vtf//RkG/Em/gJXLXng1ma
         EheG12HKtrFSoMxdK6xPP7E9nWO0ekUvN7DIQcAI2oIvz+GFDFC8hbomutiJwAWWu08a
         kBw0pExsGhfSr/2N/5vEBts5Js+4XZtc94wcz5NohPoZT1QcWy8WtssTNWvRs22KywgL
         sh3OvtW2UvDmWMpNhJ3bh6pZWjPD37/DJUeayutV+dWF3D/37mGPyLs9+2feUjCorfMV
         SaZw==
X-Gm-Message-State: AJIora9B8AHXO4t/mfMROYEAAk0Qd48ID45Xhrn3vjRvJCsALQUhb++f
	1wHDv7SJxV0Sj6Yp5G+mQgZd5fiu7jiRoX6L1pg=
X-Google-Smtp-Source: AGRyM1vbk52b4PTIMyepiNCX50Et3/hR2FYDZGF2luietd8kabCMCwcigDx9h7LkJfN+B4X89PhLum0ZlW4vpxO2Ga8=
X-Received: by 2002:a05:6902:1207:b0:66e:f2d2:6e91 with SMTP id
 s7-20020a056902120700b0066ef2d26e91mr15502657ybu.153.1657903288940; Fri, 15
 Jul 2022 09:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220715142549.25223-1-jgross@suse.com> <20220715142549.25223-3-jgross@suse.com>
In-Reply-To: <20220715142549.25223-3-jgross@suse.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 15 Jul 2022 18:41:17 +0200
Message-ID: <CAJZ5v0hY_D3n3m51gG6r+7P0MVGAObLTDGy4stXYFKwLqtX6ew@mail.gmail.com>
Subject: Re: [PATCH 2/3] x86: add wrapper functions for mtrr functions
 handling also pat
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "the arch/x86 maintainers" <x86@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	brchuckz@netscape.net, Jan Beulich <jbeulich@suse.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, Stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 15, 2022 at 4:25 PM Juergen Gross <jgross@suse.com> wrote:
>
> There are several MTRR functions which also do PAT handling. In order
> to support PAT handling without MTRR in the future, add some wrappers
> for those functions.
>
> Cc: <stable@vger.kernel.org> # 5.17
> Fixes: bdd8b6c98239 ("drm/i915: replace X86_FEATURE_PAT with pat_enabled()")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Do I understand correctly that this particular patch doesn't change
the behavior?

If so, it would be good to mention that in the changelog.

> ---
>  arch/x86/include/asm/mtrr.h      |  2 --
>  arch/x86/include/asm/processor.h |  7 +++++
>  arch/x86/kernel/cpu/common.c     | 44 +++++++++++++++++++++++++++++++-
>  arch/x86/kernel/cpu/mtrr/mtrr.c  | 25 +++---------------
>  arch/x86/kernel/setup.c          |  5 +---
>  arch/x86/kernel/smpboot.c        |  8 +++---
>  arch/x86/power/cpu.c             |  2 +-
>  7 files changed, 59 insertions(+), 34 deletions(-)
>
> diff --git a/arch/x86/include/asm/mtrr.h b/arch/x86/include/asm/mtrr.h
> index 12a16caed395..900083ac9f60 100644
> --- a/arch/x86/include/asm/mtrr.h
> +++ b/arch/x86/include/asm/mtrr.h
> @@ -43,7 +43,6 @@ extern int mtrr_del(int reg, unsigned long base, unsigned long size);
>  extern int mtrr_del_page(int reg, unsigned long base, unsigned long size);
>  extern void mtrr_centaur_report_mcr(int mcr, u32 lo, u32 hi);
>  extern void mtrr_ap_init(void);
> -extern void set_mtrr_aps_delayed_init(void);
>  extern void mtrr_aps_init(void);
>  extern void mtrr_bp_restore(void);
>  extern int mtrr_trim_uncached_memory(unsigned long end_pfn);
> @@ -86,7 +85,6 @@ static inline void mtrr_centaur_report_mcr(int mcr, u32 lo, u32 hi)
>  {
>  }
>  #define mtrr_ap_init() do {} while (0)
> -#define set_mtrr_aps_delayed_init() do {} while (0)
>  #define mtrr_aps_init() do {} while (0)
>  #define mtrr_bp_restore() do {} while (0)
>  #define mtrr_disable() do {} while (0)
> diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
> index 5c934b922450..e2140204fb7e 100644
> --- a/arch/x86/include/asm/processor.h
> +++ b/arch/x86/include/asm/processor.h
> @@ -865,7 +865,14 @@ bool arch_is_platform_page(u64 paddr);
>  #define arch_is_platform_page arch_is_platform_page
>  #endif
>
> +extern bool cache_aps_delayed_init;
> +
>  void cache_disable(void);
>  void cache_enable(void);
> +void cache_bp_init(void);
> +void cache_ap_init(void);
> +void cache_set_aps_delayed_init(void);
> +void cache_aps_init(void);
> +void cache_bp_restore(void);
>
>  #endif /* _ASM_X86_PROCESSOR_H */
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index e43322f8a4ef..0a1bd14f7966 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -1929,7 +1929,7 @@ void identify_secondary_cpu(struct cpuinfo_x86 *c)
>  #ifdef CONFIG_X86_32
>         enable_sep_cpu();
>  #endif
> -       mtrr_ap_init();
> +       cache_ap_init();
>         validate_apic_and_package_id(c);
>         x86_spec_ctrl_setup_ap();
>         update_srbds_msr();
> @@ -2403,3 +2403,45 @@ void cache_enable(void) __releases(cache_disable_lock)
>
>         raw_spin_unlock(&cache_disable_lock);
>  }
> +
> +void __init cache_bp_init(void)
> +{
> +       if (IS_ENABLED(CONFIG_MTRR))
> +               mtrr_bp_init();
> +       else
> +               pat_disable("PAT support disabled because CONFIG_MTRR is disabled in the kernel.");
> +}
> +
> +void cache_ap_init(void)
> +{
> +       if (cache_aps_delayed_init)
> +               return;
> +
> +       mtrr_ap_init();
> +}
> +
> +bool cache_aps_delayed_init;
> +
> +void cache_set_aps_delayed_init(void)
> +{
> +       cache_aps_delayed_init = true;
> +}
> +
> +void cache_aps_init(void)
> +{
> +       /*
> +        * Check if someone has requested the delay of AP cache initialization,
> +        * by doing cache_set_aps_delayed_init(), prior to this point. If not,
> +        * then we are done.
> +        */
> +       if (!cache_aps_delayed_init)
> +               return;
> +
> +       mtrr_aps_init();
> +       cache_aps_delayed_init = false;
> +}
> +
> +void cache_bp_restore(void)
> +{
> +       mtrr_bp_restore();
> +}
> diff --git a/arch/x86/kernel/cpu/mtrr/mtrr.c b/arch/x86/kernel/cpu/mtrr/mtrr.c
> index 2746cac9d8a9..c1593cfae641 100644
> --- a/arch/x86/kernel/cpu/mtrr/mtrr.c
> +++ b/arch/x86/kernel/cpu/mtrr/mtrr.c
> @@ -69,7 +69,6 @@ unsigned int mtrr_usage_table[MTRR_MAX_VAR_RANGES];
>  static DEFINE_MUTEX(mtrr_mutex);
>
>  u64 size_or_mask, size_and_mask;
> -static bool mtrr_aps_delayed_init;
>
>  static const struct mtrr_ops *mtrr_ops[X86_VENDOR_NUM] __ro_after_init;
>
> @@ -176,7 +175,8 @@ static int mtrr_rendezvous_handler(void *info)
>         if (data->smp_reg != ~0U) {
>                 mtrr_if->set(data->smp_reg, data->smp_base,
>                              data->smp_size, data->smp_type);
> -       } else if (mtrr_aps_delayed_init || !cpu_online(smp_processor_id())) {
> +       } else if ((use_intel() && cache_aps_delayed_init) ||
> +                  !cpu_online(smp_processor_id())) {
>                 mtrr_if->set_all();
>         }
>         return 0;
> @@ -789,7 +789,7 @@ void mtrr_ap_init(void)
>         if (!mtrr_enabled())
>                 return;
>
> -       if (!use_intel() || mtrr_aps_delayed_init)
> +       if (!use_intel())
>                 return;
>
>         /*
> @@ -823,16 +823,6 @@ void mtrr_save_state(void)
>         smp_call_function_single(first_cpu, mtrr_save_fixed_ranges, NULL, 1);
>  }
>
> -void set_mtrr_aps_delayed_init(void)
> -{
> -       if (!mtrr_enabled())
> -               return;
> -       if (!use_intel())
> -               return;
> -
> -       mtrr_aps_delayed_init = true;
> -}
> -
>  /*
>   * Delayed MTRR initialization for all AP's
>   */
> @@ -841,16 +831,7 @@ void mtrr_aps_init(void)
>         if (!use_intel() || !mtrr_enabled())
>                 return;
>
> -       /*
> -        * Check if someone has requested the delay of AP MTRR initialization,
> -        * by doing set_mtrr_aps_delayed_init(), prior to this point. If not,
> -        * then we are done.
> -        */
> -       if (!mtrr_aps_delayed_init)
> -               return;
> -
>         set_mtrr(~0U, 0, 0, 0);
> -       mtrr_aps_delayed_init = false;
>  }
>
>  void mtrr_bp_restore(void)
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index bd6c6fd373ae..27d61f73c68a 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -1001,10 +1001,7 @@ void __init setup_arch(char **cmdline_p)
>         max_pfn = e820__end_of_ram_pfn();
>
>         /* update e820 for memory not covered by WB MTRRs */
> -       if (IS_ENABLED(CONFIG_MTRR))
> -               mtrr_bp_init();
> -       else
> -               pat_disable("PAT support disabled because CONFIG_MTRR is disabled in the kernel.");
> +       cache_bp_init();
>
>         if (mtrr_trim_uncached_memory(max_pfn))
>                 max_pfn = e820__end_of_ram_pfn();
> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> index 5e7f9532a10d..535d73a47062 100644
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -1432,7 +1432,7 @@ void __init native_smp_prepare_cpus(unsigned int max_cpus)
>
>         uv_system_init();
>
> -       set_mtrr_aps_delayed_init();
> +       cache_set_aps_delayed_init();
>
>         smp_quirk_init_udelay();
>
> @@ -1443,12 +1443,12 @@ void __init native_smp_prepare_cpus(unsigned int max_cpus)
>
>  void arch_thaw_secondary_cpus_begin(void)
>  {
> -       set_mtrr_aps_delayed_init();
> +       cache_set_aps_delayed_init();
>  }
>
>  void arch_thaw_secondary_cpus_end(void)
>  {
> -       mtrr_aps_init();
> +       cache_aps_init();
>  }
>
>  /*
> @@ -1491,7 +1491,7 @@ void __init native_smp_cpus_done(unsigned int max_cpus)
>
>         nmi_selftest();
>         impress_friends();
> -       mtrr_aps_init();
> +       cache_aps_init();
>  }
>
>  static int __initdata setup_possible_cpus = -1;
> diff --git a/arch/x86/power/cpu.c b/arch/x86/power/cpu.c
> index bb176c72891c..21e014715322 100644
> --- a/arch/x86/power/cpu.c
> +++ b/arch/x86/power/cpu.c
> @@ -261,7 +261,7 @@ static void notrace __restore_processor_state(struct saved_context *ctxt)
>         do_fpu_end();
>         tsc_verify_tsc_adjust(true);
>         x86_platform.restore_sched_clock_state();
> -       mtrr_bp_restore();
> +       cache_bp_restore();
>         perf_restore_debug_store();
>
>         c = &cpu_data(smp_processor_id());
> --
> 2.35.3
>

