Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B56CF7555
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 09:43:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195900.1513782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd2ex-0002TA-V9; Tue, 06 Jan 2026 08:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195900.1513782; Tue, 06 Jan 2026 08:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd2ex-0002QE-S2; Tue, 06 Jan 2026 08:43:23 +0000
Received: by outflank-mailman (input) for mailman id 1195900;
 Tue, 06 Jan 2026 08:43:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A8PS=7L=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vd2ew-0002Q8-54
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 08:43:22 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bff25556-eadb-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 09:43:19 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-64b608ffca7so952348a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 00:43:19 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507b9d4c0asm1549446a12.9.2026.01.06.00.43.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 00:43:15 -0800 (PST)
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
X-Inumbo-ID: bff25556-eadb-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767688998; x=1768293798; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Cv2Ql8VdVagTE0RWAlWbZxKzTc4eqa0BtII0luXEeQ=;
        b=IECy8ddzR47lBJqteZ69Czfl7ma9dMlu5ZfUPKr1yjh1QJq3YGuvVY8FJb8GAnvs2V
         ONJTlmpjGx70GkMZcIIgu1MNpoqXhifr9YqtN+ictpVTlOouKjmzOGIfnJsuYsU7ih1k
         F7dxtpC2fAjXf6xeBtYEUiHZ8hg/Zwm2HUjztcTq4FoBj9dm7E68uy306oE17KQuKMMh
         wKj1QlHC1z4DsffeXvRmzkMo5ZtVYAM7u4c10jl2F6Q6tMc/k+7Y6aFFtw/5UdB/NbdM
         kqDZvaSos9zRn+lvj3/Swe86aABkf0l93EgIodz2kJOCkW9JTT3OgV2yhMHyOs/4qR9p
         FG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767688998; x=1768293798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Cv2Ql8VdVagTE0RWAlWbZxKzTc4eqa0BtII0luXEeQ=;
        b=cYGaNfxdRxJDvQZrI/Pbt+i13n4Pc3HJsQ1NZxhvPqOkiHWdMiEKKuW7J9ziifsMXE
         WTV59QEii1Po+j8eAUCb/CcJIi9qyV5DP8sysdr83xoO03Liz0yGO4bOlTo2nu+BvG13
         CABbmrD9cjliv6lkL4Vw5ASjJdCjSVgdy9ysSMQOOw/xFdNk5FHnUrJ2ZPPnA3QZQovT
         DbKzki5NIfuaCGkH3R4uIIqti5vFgtkDcDyerZF562rZP9opY+hgRyKdxpCY0k+ydYbd
         Tek9Gn/4GUPwLjhyo0lSQIjolH+NPFsXoffH6+1J0PS1JrV9bFjjRNm7Y01ACInxGtey
         wRqw==
X-Forwarded-Encrypted: i=1; AJvYcCWUCor2F31tJzmE2OuwglUfieG6PAWV+jVuWRvlDNwU8mGTwG+rUxnULiENnbBPSRc8YXq0qXoYKd8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5h59Tk/m+DaUp6KiPAciugXMgoePbBeTF2xQ1f0v3EdAKoidB
	YkzsIcyL0QYTW3+NgfJbLe5jUBFLjQw07aICim1jO77yikDuSgNjjgHG
X-Gm-Gg: AY/fxX6Ruo+0EH2Di0MSAqpGdnVOaoNJeB2puiOWK/kEZtQMk825LMoiWyeEwQFSCMt
	0EtTkdbKbomnO1Y8X8HQxGPqlliYrctdNmoSPEjSKzU0fU4YriUyBiftJ7OOsOoa73SYrJWhpyH
	OXfa7kwyKiUoomBYxS0zkaVVSaP2kHgOlLBnUFBSWBxK+k7u+yjgJmvtnLJ59/4qsZ2RnZpAek+
	ff2rDpL+/w76lBmwZeDwilk1yt9BQuTNGsFPjKF1WdVdUIW0thAAi9FFEyUkQXaFaPg/nePDbGd
	YcpsoKxWKB7tfYFMh+rzhjDsHzTjknUN5RujG5J5Pb16u7qPXuwAH2bvbIUE9+mFNyEGW1PQ9ak
	PfkSQIijUNOfR0+DONlAtk75CUdjMxNTSWM5k5j1ce772ju3wXqp9IweeM0it+1waX5MT+T9sLb
	pH+6nwgDTc72j4mFlK5ThD4ZI7BLPtX/z2mHqUa3AgZI3cNjHPvSxgHzVmFcqWTyU=
X-Google-Smtp-Source: AGHT+IH5YKS4rbka398AK4n+4Jm7WsK7PTvxTCF7SUO7xrL7W3OoXqSGp9bzNeXepI3sGjYbL/V8TQ==
X-Received: by 2002:a05:6402:2113:b0:64d:4f75:aa28 with SMTP id 4fb4d7f45d1cf-65079561dd7mr2140089a12.18.1767688996223;
        Tue, 06 Jan 2026 00:43:16 -0800 (PST)
Message-ID: <724e78ef-b6ed-40db-a5c0-bd6473b6fe16@gmail.com>
Date: Tue, 6 Jan 2026 09:43:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Drop xenoprofile support
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20260105195717.601500-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260105195717.601500-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/5/26 8:57 PM, Andrew Cooper wrote:
> The most recent xenoprof change was 300ef0cb4fde ("x86: Add Xenoprofile
> support for AMD Family16h") in 2013, despite there being 42 changes worth of
> other cleanup/rearranging since then.
>
> Oprofile themselves dropped Xen support in commit 0c142c3a096d ("Remove
> opcontrol and the GUI and processor models dependent on it") in 2014, as part
> of releasing version 1.0 and switching over to using operf based on the Linux
> perf_event subsystem.  Linux's version of this patch was merged in commit
> 24880bef417f ("Merge tag 'oprofile-removal-5.12'") in 2021.
>
> Drop xenoprof and all supporting infrastructure, including the hypercall, the
> XSM hook and flask vectors which lose their only caller, and even shrinks
> struct domain by one pointer which wasn't properly excluded in
> !CONFIG_XENOPROF builds.
>
> Retain the public xenoprof.h header as it is ABI, but note that the
> functionality is removed.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
>
> Despite appearing to be architecture neutral, the internals of Xenoprof were
> entirely x86-specific.  Another curiosity is that only the VMX MSR hooks
> called passive_domain_do_{rd,wr}msr(), and I can't see how this was correct
> for SVM.
>
> The real reason for finally getting around to this is the number of MISRA
> violations reported by the eclair-x86_64-allcode job that I don't feel like
> fixing.
> ---
>   CHANGELOG.md                            |   3 +
>   docs/misc/xen-command-line.pandoc       |   6 -
>   tools/flask/policy/modules/dom0.te      |   2 -
>   xen/arch/x86/Makefile                   |   1 -
>   xen/arch/x86/cpu/vpmu_amd.c             |   7 -
>   xen/arch/x86/cpu/vpmu_intel.c           |   6 -
>   xen/arch/x86/hvm/svm/entry.S            |   1 -
>   xen/arch/x86/hvm/svm/svm.c              |   2 -
>   xen/arch/x86/hvm/vmx/vmx.c              |   9 -
>   xen/arch/x86/include/asm/xenoprof.h     |  95 ---
>   xen/arch/x86/oprofile/Makefile          |   6 -
>   xen/arch/x86/oprofile/backtrace.c       | 145 ----
>   xen/arch/x86/oprofile/nmi_int.c         | 485 ------------
>   xen/arch/x86/oprofile/op_counter.h      |  41 -
>   xen/arch/x86/oprofile/op_model_athlon.c | 547 -------------
>   xen/arch/x86/oprofile/op_model_p4.c     | 721 -----------------
>   xen/arch/x86/oprofile/op_model_ppro.c   | 348 ---------
>   xen/arch/x86/oprofile/op_x86_model.h    |  58 --
>   xen/arch/x86/oprofile/xenoprof.c        | 106 ---
>   xen/arch/x86/traps.c                    |   4 -
>   xen/common/Kconfig                      |  11 -
>   xen/common/Makefile                     |   1 -
>   xen/common/compat/xenoprof.c            |  42 -
>   xen/common/domain.c                     |   6 -
>   xen/common/xenoprof.c                   | 977 ------------------------
>   xen/include/Makefile                    |   1 -
>   xen/include/hypercall-defs.c            |   6 -
>   xen/include/public/xen.h                |   2 +-
>   xen/include/public/xenoprof.h           |   2 +-
>   xen/include/xen/sched.h                 |   3 -
>   xen/include/xen/xenoprof.h              |  49 --
>   xen/include/xsm/dummy.h                 |   7 -
>   xen/include/xsm/xsm.h                   |   7 -
>   xen/xsm/dummy.c                         |   2 -
>   xen/xsm/flask/hooks.c                   |  35 -
>   xen/xsm/flask/policy/access_vectors     |   4 -
>   36 files changed, 5 insertions(+), 3743 deletions(-)
>   delete mode 100644 xen/arch/x86/include/asm/xenoprof.h
>   delete mode 100644 xen/arch/x86/oprofile/Makefile
>   delete mode 100644 xen/arch/x86/oprofile/backtrace.c
>   delete mode 100644 xen/arch/x86/oprofile/nmi_int.c
>   delete mode 100644 xen/arch/x86/oprofile/op_counter.h
>   delete mode 100644 xen/arch/x86/oprofile/op_model_athlon.c
>   delete mode 100644 xen/arch/x86/oprofile/op_model_p4.c
>   delete mode 100644 xen/arch/x86/oprofile/op_model_ppro.c
>   delete mode 100644 xen/arch/x86/oprofile/op_x86_model.h
>   delete mode 100644 xen/arch/x86/oprofile/xenoprof.c
>   delete mode 100644 xen/common/compat/xenoprof.c
>   delete mode 100644 xen/common/xenoprof.c
>   delete mode 100644 xen/include/xen/xenoprof.h
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 3aaf5986231c..1663f6878ef2 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -15,6 +15,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>      - The cpuid_mask_* command line options for legacy AMD CPUs.  These were
>        deprecated in Xen 4.7 and noted not to work correctly with AMD CPUs from
>        2011 onwards.
> +   - Xenoprofile support.  Oprofile themselves removed support for Xen in 2014
> +     prior to the version 1.0 release, and there has been no development since
> +     before then in Xen.

LGTM:
Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com> # CHANGELOG.md

Nit: It is necessary to drop the extra space before "  Oprofile themselves...".

Thanks.

~ Oleksii

>   
>   ## [4.21.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.21.0) - 2025-11-19
>   
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 805da22c44a5..189d0d2c9d4b 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -508,12 +508,6 @@ character, but for xen to keep the console.
>   
>   > Default: `power`
>   
> -### cpu_type (x86)
> -> `= arch_perfmon`
> -
> -If set, force use of the performance counters for oprofile, rather than detecting
> -available support.
> -
>   ### cpufreq
>   > `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] } [,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]] | amd-cppc[:[active][,verbose]]`
>   
> diff --git a/tools/flask/policy/modules/dom0.te b/tools/flask/policy/modules/dom0.te
> index ad2b4f9ea75f..d30edf8be1fb 100644
> --- a/tools/flask/policy/modules/dom0.te
> +++ b/tools/flask/policy/modules/dom0.te
> @@ -21,8 +21,6 @@ allow dom0_t xen_t:xen {
>   	writeconsole
>   	readapic
>   	writeapic
> -	privprofile
> -	nonprivprofile
>   	kexec
>   	firmware
>   	sleep
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index 1fc651146f10..d8b41cec1620 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -7,7 +7,6 @@ obj-$(CONFIG_GUEST) += guest/
>   obj-$(CONFIG_HVM) += hvm/
>   obj-y += lib/
>   obj-y += mm/
> -obj-$(CONFIG_XENOPROF) += oprofile/
>   obj-$(CONFIG_PV) += pv/
>   obj-y += x86_64/
>   obj-y += x86_emulate/
> diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
> index fa157d45dd01..aee99bb88128 100644
> --- a/xen/arch/x86/cpu/vpmu_amd.c
> +++ b/xen/arch/x86/cpu/vpmu_amd.c
> @@ -12,7 +12,6 @@
>   
>   #include <xen/err.h>
>   #include <xen/sched.h>
> -#include <xen/xenoprof.h>
>   
>   #include <asm/apic.h>
>   #include <asm/hvm/save.h>
> @@ -363,8 +362,6 @@ static int cf_check amd_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
>       if ( (type == MSR_TYPE_CTRL) &&
>           is_pmu_enabled(msr_content) && !vpmu_is_set(vpmu, VPMU_RUNNING) )
>       {
> -        if ( !acquire_pmu_ownership(PMU_OWNER_HVM) )
> -            return 0;
>           vpmu_set(vpmu, VPMU_RUNNING);
>   
>           if ( is_svm_vcpu(v) && is_msr_bitmap_on(vpmu) )
> @@ -378,7 +375,6 @@ static int cf_check amd_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
>           vpmu_reset(vpmu, VPMU_RUNNING);
>           if ( is_svm_vcpu(v) && is_msr_bitmap_on(vpmu) )
>                amd_vpmu_unset_msr_bitmap(v);
> -        release_pmu_ownership(PMU_OWNER_HVM);
>       }
>   
>       if ( !vpmu_is_set(vpmu, VPMU_CONTEXT_LOADED)
> @@ -426,9 +422,6 @@ static void cf_check amd_vpmu_destroy(struct vcpu *v)
>       vpmu->context = NULL;
>       vpmu->priv_context = NULL;
>   
> -    if ( vpmu_is_set(vpmu, VPMU_RUNNING) )
> -        release_pmu_ownership(PMU_OWNER_HVM);
> -
>       vpmu_clear(vpmu);
>   }
>   
> diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
> index 7ce98ee42e54..1e3b06ef8e68 100644
> --- a/xen/arch/x86/cpu/vpmu_intel.c
> +++ b/xen/arch/x86/cpu/vpmu_intel.c
> @@ -9,7 +9,6 @@
>   
>   #include <xen/err.h>
>   #include <xen/sched.h>
> -#include <xen/xenoprof.h>
>   #include <asm/system.h>
>   #include <asm/regs.h>
>   #include <asm/apic.h>
> @@ -441,9 +440,6 @@ static int cf_check core2_vpmu_alloc_resource(struct vcpu *v)
>       struct xen_pmu_intel_ctxt *core2_vpmu_cxt = NULL;
>       uint64_t *p = NULL;
>   
> -    if ( !acquire_pmu_ownership(PMU_OWNER_HVM) )
> -        return 0;
> -
>       if ( is_vmx_vcpu(v) )
>       {
>           if ( vmx_add_host_load_msr(v, MSR_CORE_PERF_GLOBAL_CTRL, 0) )
> @@ -487,7 +483,6 @@ static int cf_check core2_vpmu_alloc_resource(struct vcpu *v)
>       return 1;
>   
>   out_err:
> -    release_pmu_ownership(PMU_OWNER_HVM);
>   
>       xfree(core2_vpmu_cxt);
>       xfree(p);
> @@ -814,7 +809,6 @@ static void cf_check core2_vpmu_destroy(struct vcpu *v)
>       vpmu->priv_context = NULL;
>       if ( is_vmx_vcpu(v) && cpu_has_vmx_msr_bitmap )
>           core2_vpmu_unset_msr_bitmap(v);
> -    release_pmu_ownership(PMU_OWNER_HVM);
>       vpmu_clear(vpmu);
>   }
>   
> diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
> index 610c64bf4c97..af8db23b033f 100644
> --- a/xen/arch/x86/hvm/svm/entry.S
> +++ b/xen/arch/x86/hvm/svm/entry.S
> @@ -155,7 +155,6 @@ __UNLIKELY_END(nsvm_hap)
>            * to safely resolve any Spectre-v1 concerns in the above logic.
>            */
>           stgi
> -LABEL(svm_stgi_label, 0)
>           call svm_vmexit_handler
>           jmp  .Lsvm_do_resume
>   
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 1208999454d3..da113f488b71 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -36,7 +36,6 @@
>   #include <asm/paging.h>
>   #include <asm/processor.h>
>   #include <asm/x86_emulate.h>
> -#include <asm/xenoprof.h>
>   
>   #include <public/sched.h>
>   
> @@ -1152,7 +1151,6 @@ static int cf_check svm_vcpu_initialise(struct vcpu *v)
>   static void cf_check svm_vcpu_destroy(struct vcpu *v)
>   {
>       svm_destroy_vmcb(v);
> -    passive_domain_destroy(v);
>   }
>   
>   /*
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 05b59cb8e4d2..f4beac192d75 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -48,7 +48,6 @@
>   #include <asm/spec_ctrl.h>
>   #include <asm/stubs.h>
>   #include <asm/x86_emulate.h>
> -#include <asm/xenoprof.h>
>   
>   #include <public/arch-x86/cpuid.h>
>   #include <public/hvm/ioreq.h>
> @@ -692,7 +691,6 @@ static void cf_check vmx_vcpu_destroy(struct vcpu *v)
>        */
>       vmx_vcpu_disable_pml(v);
>       vmx_destroy_vmcs(v);
> -    passive_domain_destroy(v);
>   }
>   
>   /*
> @@ -3560,9 +3558,6 @@ static int cf_check vmx_msr_read_intercept(
>           break;
>   
>       default:
> -        if ( passive_domain_do_rdmsr(msr, msr_content) )
> -            goto done;
> -
>           if ( vmx_read_guest_msr(curr, msr, msr_content) == 0 )
>               break;
>   
> @@ -3582,7 +3577,6 @@ static int cf_check vmx_msr_read_intercept(
>           goto gp_fault;
>       }
>   
> -done:
>       HVM_DBG_LOG(DBG_LEVEL_MSR, "returns: ecx=%#x, msr_value=%#"PRIx64,
>                   msr, *msr_content);
>       return X86EMUL_OKAY;
> @@ -3875,9 +3869,6 @@ static int cf_check vmx_msr_write_intercept(
>           break;
>   
>       default:
> -        if ( passive_domain_do_wrmsr(msr, msr_content) )
> -            return X86EMUL_OKAY;
> -
>           if ( vmx_write_guest_msr(v, msr, msr_content) == 0 ||
>                is_last_branch_msr(msr) )
>               break;
> diff --git a/xen/arch/x86/include/asm/xenoprof.h b/xen/arch/x86/include/asm/xenoprof.h
> deleted file mode 100644
> index dc6f822d3220..000000000000
> --- a/xen/arch/x86/include/asm/xenoprof.h
> +++ /dev/null
> @@ -1,95 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> -/******************************************************************************
> - * asm-x86/xenoprof.h
> - * xenoprof x86 arch specific header file
> - *
> - * Copyright (c) 2006 Isaku Yamahata <yamahata at valinux co jp>
> - *                    VA Linux Systems Japan K.K.
> - */
> -
> -#ifndef __ASM_X86_XENOPROF_H__
> -#define __ASM_X86_XENOPROF_H__
> -
> -struct vcpu;
> -
> -#ifdef CONFIG_XENOPROF
> -
> -#include <public/xen.h>
> -
> -int nmi_reserve_counters(void);
> -int nmi_setup_events(void);
> -int nmi_enable_virq(void);
> -int nmi_start(void);
> -void nmi_stop(void);
> -void nmi_disable_virq(void);
> -void nmi_release_counters(void);
> -
> -int xenoprof_arch_init(int *num_events, char *cpu_type);
> -#define xenoprof_arch_reserve_counters()        nmi_reserve_counters()
> -#define xenoprof_arch_setup_events()            nmi_setup_events()
> -#define xenoprof_arch_enable_virq()             nmi_enable_virq()
> -#define xenoprof_arch_start()                   nmi_start()
> -#define xenoprof_arch_stop()                    nmi_stop()
> -#define xenoprof_arch_disable_virq()            nmi_disable_virq()
> -#define xenoprof_arch_release_counters()        nmi_release_counters()
> -
> -int xenoprof_arch_counter(XEN_GUEST_HANDLE_PARAM(void) arg);
> -int compat_oprof_arch_counter(XEN_GUEST_HANDLE_PARAM(void) arg);
> -int xenoprof_arch_ibs_counter(XEN_GUEST_HANDLE_PARAM(void) arg);
> -
> -struct cpu_user_regs;
> -
> -/* AMD IBS support */
> -void ibs_init(void);
> -extern u32 ibs_caps;
> -
> -int xenoprofile_get_mode(struct vcpu *, const struct cpu_user_regs *);
> -
> -static inline int xenoprof_backtrace_supported(void)
> -{
> -    return 1;
> -}
> -
> -void xenoprof_backtrace(struct vcpu *, const struct cpu_user_regs *,
> -                        unsigned long depth, int mode);
> -
> -int passive_domain_do_rdmsr(unsigned int msr, uint64_t *msr_content);
> -int passive_domain_do_wrmsr(unsigned int msr, uint64_t msr_content);
> -void passive_domain_destroy(struct vcpu *v);
> -
> -bool nmi_oprofile_send_virq(void);
> -
> -#else
> -
> -static inline int passive_domain_do_rdmsr(unsigned int msr,
> -                                          uint64_t *msr_content)
> -{
> -    return 0;
> -}
> -
> -static inline int passive_domain_do_wrmsr(unsigned int msr,
> -                                          uint64_t msr_content)
> -{
> -    return 0;
> -}
> -
> -static inline void passive_domain_destroy(struct vcpu *v) {}
> -
> -static inline bool nmi_oprofile_send_virq(void)
> -{
> -    return false;
> -}
> -
> -#endif /* CONFIG_XENOPROF */
> -
> -#endif /* __ASM_X86_XENOPROF_H__ */
> -
> -/*
> - * Local variables:
> - * mode: C
> - * c-file-style: "BSD"
> - * c-basic-offset: 4
> - * tab-width: 4
> - * indent-tabs-mode: nil
> - * End:
> - */
> diff --git a/xen/arch/x86/oprofile/Makefile b/xen/arch/x86/oprofile/Makefile
> deleted file mode 100644
> index 956e3d1b5d05..000000000000
> --- a/xen/arch/x86/oprofile/Makefile
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -obj-y += xenoprof.o
> -obj-y += nmi_int.o
> -obj-y += op_model_p4.o
> -obj-y += op_model_ppro.o
> -obj-y += op_model_athlon.o
> -obj-y += backtrace.o
> diff --git a/xen/arch/x86/oprofile/backtrace.c b/xen/arch/x86/oprofile/backtrace.c
> deleted file mode 100644
> index 61de18c8d596..000000000000
> --- a/xen/arch/x86/oprofile/backtrace.c
> +++ /dev/null
> @@ -1,145 +0,0 @@
> -/**
> - * @file backtrace.c
> - *
> - * @remark Copyright 2002 OProfile authors
> - * @remark Read the file COPYING
> - *
> - * @author John Levon
> - * @author David Smith
> - * Modified for Xen by Amitabha Roy
> - *
> - */
> -
> -#include <xen/types.h>
> -#include <asm/page.h>
> -#include <xen/xenoprof.h>
> -#include <xen/guest_access.h>
> -
> -struct __packed frame_head {
> -    struct frame_head * ebp;
> -    unsigned long ret;
> -};
> -typedef struct frame_head frame_head_t;
> -
> -struct __packed frame_head_32bit {
> -    uint32_t ebp;
> -    uint32_t ret;
> -};
> -typedef struct frame_head_32bit frame_head32_t;
> -
> -static struct frame_head *
> -dump_hypervisor_backtrace(struct vcpu *vcpu, const struct frame_head *head,
> -                          int mode)
> -{
> -    if (!xenoprof_add_trace(vcpu, head->ret, mode))
> -        return 0;
> -
> -    /* frame pointers should strictly progress back up the stack
> -     * (towards higher addresses) */
> -    if (head >= head->ebp)
> -        return NULL;
> -
> -    return head->ebp;
> -}
> -
> -static inline int is_32bit_vcpu(struct vcpu *vcpu)
> -{
> -    if (is_hvm_vcpu(vcpu))
> -        return !hvm_long_mode_active(vcpu);
> -    else
> -        return is_pv_32bit_vcpu(vcpu);
> -}
> -
> -static struct frame_head *
> -dump_guest_backtrace(struct vcpu *vcpu, const struct frame_head *head,
> -                     int mode)
> -{
> -    /* Also check accessibility of one struct frame_head beyond. */
> -    frame_head_t bufhead[2];
> -
> -    if ( is_32bit_vcpu(vcpu) )
> -    {
> -        frame_head32_t bufhead32[2];
> -
> -        if ( raw_copy_from_guest(bufhead32, head, sizeof(bufhead32)) )
> -            return 0;
> -        bufhead[0].ebp = (struct frame_head *)(unsigned long)bufhead32[0].ebp;
> -        bufhead[0].ret = bufhead32[0].ret;
> -    }
> -    else if ( raw_copy_from_guest(bufhead, head, sizeof(bufhead)) )
> -        return 0;
> -
> -    if ( !xenoprof_add_trace(vcpu, bufhead[0].ret, mode) )
> -        return 0;
> -
> -    /* frame pointers should strictly progress back up the stack
> -     * (towards higher addresses) */
> -    if ( head >= bufhead[0].ebp )
> -        return NULL;
> -
> -    return bufhead[0].ebp;
> -}
> -
> -/*
> - * |             | /\ Higher addresses
> - * |             |
> - * --------------- stack base (address of current_thread_info)
> - * | thread info |
> - * .             .
> - * |    stack    |
> - * --------------- saved regs->ebp value if valid (frame_head address)
> - * .             .
> - * --------------- saved regs->rsp value if x86_64
> - * |             |
> - * --------------- struct pt_regs * stored on stack if 32-bit
> - * |             |
> - * .             .
> - * |             |
> - * --------------- %esp
> - * |             |
> - * |             | \/ Lower addresses
> - *
> - * Thus, regs (or regs->rsp for x86_64) <-> stack base restricts the
> - * valid(ish) ebp values. Note: (1) for x86_64, NMI and several other
> - * exceptions use special stacks, maintained by the interrupt stack table
> - * (IST). These stacks are set up in trap_init() in
> - * arch/x86_64/kernel/traps.c. Thus, for x86_64, regs now does not point
> - * to the kernel stack; instead, it points to some location on the NMI
> - * stack. On the other hand, regs->rsp is the stack pointer saved when the
> - * NMI occurred. (2) For 32-bit, regs->esp is not valid because the
> - * processor does not save %esp on the kernel stack when interrupts occur
> - * in the kernel mode.
> - */
> -#if defined(CONFIG_FRAME_POINTER)
> -static int valid_hypervisor_stack(const struct frame_head *head,
> -				  const struct cpu_user_regs *regs)
> -{
> -    unsigned long headaddr = (unsigned long)head;
> -    unsigned long stack = (unsigned long)regs->rsp;
> -    unsigned long stack_base = (stack & ~(STACK_SIZE - 1)) + STACK_SIZE;
> -
> -    return headaddr > stack && headaddr < stack_base;
> -}
> -#else
> -/* without fp, it's just junk */
> -static int valid_hypervisor_stack(const struct frame_head *head,
> -				  const struct cpu_user_regs *regs)
> -{
> -    return 0;
> -}
> -#endif
> -
> -void xenoprof_backtrace(struct vcpu *vcpu, const struct cpu_user_regs *regs,
> -			unsigned long depth, int mode)
> -{
> -    const struct frame_head *head = (void *)regs->rbp;
> -
> -    if (mode > 1) {
> -        while (depth-- && valid_hypervisor_stack(head, regs))
> -            head = dump_hypervisor_backtrace(vcpu, head, mode);
> -        return;
> -    }
> -
> -    while (depth-- && head)
> -        head = dump_guest_backtrace(vcpu, head, mode);
> -}
> diff --git a/xen/arch/x86/oprofile/nmi_int.c b/xen/arch/x86/oprofile/nmi_int.c
> deleted file mode 100644
> index 1d6454cf39e8..000000000000
> --- a/xen/arch/x86/oprofile/nmi_int.c
> +++ /dev/null
> @@ -1,485 +0,0 @@
> -/**
> - * @file nmi_int.c
> - *
> - * @remark Copyright 2002 OProfile authors
> - * @remark Read the file COPYING
> - *
> - * @author John Levon <levon@movementarian.org>
> - *
> - * Modified for Xen: by Aravind Menon & Jose Renato Santos
> - *   These modifications are:
> - *   Copyright (C) 2005 Hewlett-Packard Co.
> - */
> -
> -#include <xen/event.h>
> -#include <xen/types.h>
> -#include <xen/errno.h>
> -#include <xen/init.h>
> -#include <xen/param.h>
> -#include <xen/string.h>
> -#include <xen/delay.h>
> -#include <xen/xenoprof.h>
> -#include <xen/xvmalloc.h>
> -
> -#include <public/xenoprof.h>
> -
> -#include <asm/msr.h>
> -#include <asm/apic.h>
> -#include <asm/regs.h>
> -#include <asm/current.h>
> -#include <asm/nmi.h>
> -
> -#include "op_counter.h"
> -#include "op_x86_model.h"
> -
> -struct op_counter_config counter_config[OP_MAX_COUNTER];
> -struct op_ibs_config ibs_config;
> -
> -struct op_x86_model_spec const *__read_mostly model;
> -static struct op_msrs cpu_msrs[NR_CPUS];
> -static unsigned long saved_lvtpc[NR_CPUS];
> -
> -static const char *cpu_type;
> -
> -static DEFINE_PER_CPU(struct vcpu *, nmi_cont_vcpu);
> -
> -static int passive_domain_msr_op_checks(unsigned int msr, int *typep, int *indexp)
> -{
> -	struct vpmu_struct *vpmu = vcpu_vpmu(current);
> -	if ( model == NULL )
> -		return 0;
> -	if ( model->is_arch_pmu_msr == NULL )
> -		return 0;
> -	if ( !model->is_arch_pmu_msr(msr, typep, indexp) )
> -		return 0;
> -
> -	if ( !vpmu_is_set(vpmu, VPMU_PASSIVE_DOMAIN_ALLOCATED) )
> -		if ( ! model->allocated_msr(current) )
> -			return 0;
> -	return 1;
> -}
> -
> -int passive_domain_do_rdmsr(unsigned int msr, uint64_t *msr_content)
> -{
> -	int type, index;
> -
> -	if ( !passive_domain_msr_op_checks(msr, &type, &index))
> -		return 0;
> -
> -	model->load_msr(current, type, index, msr_content);
> -	return 1;
> -}
> -
> -int passive_domain_do_wrmsr(unsigned int msr, uint64_t msr_content)
> -{
> -	int type, index;
> -
> -	if ( !passive_domain_msr_op_checks(msr, &type, &index))
> -		return 0;
> -
> -	model->save_msr(current, type, index, msr_content);
> -	return 1;
> -}
> -
> -void passive_domain_destroy(struct vcpu *v)
> -{
> -	struct vpmu_struct *vpmu = vcpu_vpmu(v);
> -	if ( vpmu_is_set(vpmu, VPMU_PASSIVE_DOMAIN_ALLOCATED) )
> -		model->free_msr(v);
> -}
> -
> -bool nmi_oprofile_send_virq(void)
> -{
> -	struct vcpu *v = xchg(&this_cpu(nmi_cont_vcpu), NULL);
> -
> -	if (v)
> -		send_guest_vcpu_virq(v, VIRQ_XENOPROF);
> -
> -	return v;
> -}
> -
> -static int cf_check nmi_callback(const struct cpu_user_regs *regs, int cpu)
> -{
> -	int xen_mode, ovf;
> -
> -	ovf = model->check_ctrs(cpu, &cpu_msrs[cpu], regs);
> -	xen_mode = ring_0(regs);
> -	if (ovf && is_active(current->domain) && !xen_mode &&
> -	    !this_cpu(nmi_cont_vcpu)) {
> -		this_cpu(nmi_cont_vcpu) = current;
> -		trigger_nmi_continuation();
> -	}
> -
> -	if ( ovf == 2 )
> -		current->arch.nmi_pending = true;
> -	return 1;
> -}
> -
> -
> -static void nmi_cpu_save_registers(struct op_msrs *msrs)
> -{
> -	unsigned int const nr_ctrs = model->num_counters;
> -	unsigned int const nr_ctrls = model->num_controls;
> -	struct op_msr *counters = msrs->counters;
> -	struct op_msr *controls = msrs->controls;
> -	unsigned int i;
> -
> -	for (i = 0; i < nr_ctrs; ++i) {
> -		rdmsrl(counters[i].addr, counters[i].value);
> -	}
> -
> -	for (i = 0; i < nr_ctrls; ++i) {
> -		rdmsrl(controls[i].addr, controls[i].value);
> -	}
> -}
> -
> -
> -static void cf_check nmi_save_registers(void *dummy)
> -{
> -	int cpu = smp_processor_id();
> -	struct op_msrs * msrs = &cpu_msrs[cpu];
> -	model->fill_in_addresses(msrs);
> -	nmi_cpu_save_registers(msrs);
> -}
> -
> -
> -static void free_msrs(void)
> -{
> -	unsigned int i;
> -
> -	for (i = 0; i < nr_cpu_ids; ++i) {
> -		XVFREE(cpu_msrs[i].counters);
> -		XVFREE(cpu_msrs[i].controls);
> -	}
> -}
> -
> -
> -static int allocate_msrs(void)
> -{
> -	unsigned int i;
> -	int success = 1;
> -
> -	for_each_online_cpu (i) {
> -		cpu_msrs[i].counters = xvmalloc_array(struct op_msr,
> -						      model->num_counters);
> -		if (!cpu_msrs[i].counters) {
> -			success = 0;
> -			break;
> -		}
> -		cpu_msrs[i].controls = xvmalloc_array(struct op_msr,
> -						      model->num_controls);
> -		if (!cpu_msrs[i].controls) {
> -			success = 0;
> -			break;
> -		}
> -	}
> -
> -	if (!success)
> -		free_msrs();
> -
> -	return success;
> -}
> -
> -
> -static void cf_check nmi_cpu_setup(void *dummy)
> -{
> -	int cpu = smp_processor_id();
> -	struct op_msrs * msrs = &cpu_msrs[cpu];
> -	model->setup_ctrs(msrs);
> -}
> -
> -
> -int nmi_setup_events(void)
> -{
> -	on_each_cpu(nmi_cpu_setup, NULL, 1);
> -	return 0;
> -}
> -
> -int nmi_reserve_counters(void)
> -{
> -	if (!allocate_msrs())
> -		return -ENOMEM;
> -
> -	/*
> -	 * We need to be careful to install our NMI handler
> -	 * without actually triggering any NMIs as this will
> -	 * break the core code horrifically.
> -	 */
> -	if (reserve_lapic_nmi() < 0) {
> -		free_msrs();
> -		return -EBUSY;
> -	}
> -	/* We need to serialize save and setup for HT because the subset
> -	 * of msrs are distinct for save and setup operations
> -	 */
> -	on_each_cpu(nmi_save_registers, NULL, 1);
> -	return 0;
> -}
> -
> -int nmi_enable_virq(void)
> -{
> -	set_nmi_callback(nmi_callback);
> -	return 0;
> -}
> -
> -
> -void nmi_disable_virq(void)
> -{
> -	unset_nmi_callback();
> -}
> -
> -
> -static void nmi_restore_registers(struct op_msrs * msrs)
> -{
> -	unsigned int const nr_ctrs = model->num_counters;
> -	unsigned int const nr_ctrls = model->num_controls;
> -	struct op_msr * counters = msrs->counters;
> -	struct op_msr * controls = msrs->controls;
> -	unsigned int i;
> -
> -	for (i = 0; i < nr_ctrls; ++i) {
> -		wrmsrl(controls[i].addr, controls[i].value);
> -	}
> -
> -	for (i = 0; i < nr_ctrs; ++i) {
> -		wrmsrl(counters[i].addr, counters[i].value);
> -	}
> -}
> -
> -
> -static void cf_check nmi_cpu_shutdown(void *dummy)
> -{
> -	int cpu = smp_processor_id();
> -	struct op_msrs * msrs = &cpu_msrs[cpu];
> -	nmi_restore_registers(msrs);
> -}
> -
> -
> -void nmi_release_counters(void)
> -{
> -	on_each_cpu(nmi_cpu_shutdown, NULL, 1);
> -	release_lapic_nmi();
> -	free_msrs();
> -}
> -
> -
> -static void cf_check nmi_cpu_start(void *dummy)
> -{
> -	int cpu = smp_processor_id();
> -	struct op_msrs const * msrs = &cpu_msrs[cpu];
> -	saved_lvtpc[cpu] = apic_read(APIC_LVTPC);
> -	apic_write(APIC_LVTPC, APIC_DM_NMI);
> -	model->start(msrs);
> -}
> -
> -
> -int nmi_start(void)
> -{
> -	on_each_cpu(nmi_cpu_start, NULL, 1);
> -	return 0;
> -}
> -
> -
> -static void cf_check nmi_cpu_stop(void *dummy)
> -{
> -	unsigned int v;
> -	int cpu = smp_processor_id();
> -	struct op_msrs const * msrs = &cpu_msrs[cpu];
> -	model->stop(msrs);
> -
> -	/* restoring APIC_LVTPC can trigger an apic error because the delivery
> -	 * mode and vector nr combination can be illegal. That's by design: on
> -	 * power on apic lvt contain a zero vector nr which are legal only for
> -	 * NMI delivery mode. So inhibit apic err before restoring lvtpc
> -	 */
> -	if ( (apic_read(APIC_LVTPC) & APIC_DM_MASK) != APIC_DM_NMI
> -	     || (apic_read(APIC_LVTPC) & APIC_LVT_MASKED) )
> -	{
> -		printk("nmi_stop: APIC not good %ul\n", apic_read(APIC_LVTPC));
> -		mdelay(5000);
> -	}
> -	v = apic_read(APIC_LVTERR);
> -	apic_write(APIC_LVTERR, v | APIC_LVT_MASKED);
> -	apic_write(APIC_LVTPC, saved_lvtpc[cpu]);
> -	apic_write(APIC_LVTERR, v);
> -}
> -
> -
> -void nmi_stop(void)
> -{
> -	on_each_cpu(nmi_cpu_stop, NULL, 1);
> -}
> -
> -
> -static int __init p4_init(const char **cpu_type)
> -{
> -	unsigned int cpu_model = current_cpu_data.x86_model;
> -
> -	if ((cpu_model > 6) || (cpu_model == 5)) {
> -		printk("xenoprof: Initialization failed. "
> -		       "Intel processor model %u for pentium 4 family is not "
> -		       "supported\n", cpu_model);
> -		return 0;
> -	}
> -
> -	switch (current_cpu_data.x86_num_siblings) {
> -		case 1:
> -			*cpu_type = "i386/p4";
> -			model = &op_p4_spec;
> -			return 1;
> -
> -		case 2:
> -			*cpu_type = "i386/p4-ht";
> -			model = &op_p4_ht2_spec;
> -			return 1;
> -	}
> -
> -	printk("Xenoprof ERROR: P4 HyperThreading detected with > 2 threads\n");
> -
> -	return 0;
> -}
> -
> -
> -static int force_arch_perfmon;
> -
> -static int __init cf_check force_cpu_type(const char *str)
> -{
> -	if (!strcmp(str, "arch_perfmon")) {
> -		force_arch_perfmon = 1;
> -		printk(KERN_INFO "oprofile: forcing architectural perfmon\n");
> -	}
> -	else
> -		return -EINVAL;
> -
> -	return 0;
> -}
> -custom_param("cpu_type", force_cpu_type);
> -
> -static int __init ppro_init(const char **cpu_type)
> -{
> -	if (force_arch_perfmon && cpu_has_arch_perfmon)
> -		return 0;
> -
> -	switch (current_cpu_data.x86_model) {
> -	case 14:
> -		*cpu_type = "i386/core";
> -		break;
> -	case 15:
> -		*cpu_type = "i386/core_2";
> -		ppro_has_global_ctrl = 1;
> -		break;
> -	default:
> -		/* Unknown */
> -		return 0;
> -	}
> -
> -	model = &op_ppro_spec;
> -	return 1;
> -}
> -
> -static int __init arch_perfmon_init(const char **cpu_type)
> -{
> -	if (!cpu_has_arch_perfmon)
> -		return 0;
> -	*cpu_type = "i386/arch_perfmon";
> -	model = &op_arch_perfmon_spec;
> -	arch_perfmon_setup_counters();
> -	ppro_has_global_ctrl = 1;
> -	return 1;
> -}
> -
> -static int __init cf_check nmi_init(void)
> -{
> -	unsigned int vendor = current_cpu_data.x86_vendor;
> -	unsigned int family = current_cpu_data.x86;
> -
> -	if (!cpu_has_apic) {
> -		printk("xenoprof: Initialization failed. No APIC\n");
> -		return -ENODEV;
> -	}
> -
> -	switch (vendor) {
> -		case X86_VENDOR_AMD:
> -			/* Needs to be at least an Athlon (or hammer in 32bit mode) */
> -
> -			switch (family) {
> -			default:
> -				printk("xenoprof: Initialization failed. "
> -				       "AMD processor family %u is not "
> -				       "supported\n", family);
> -				return -ENODEV;
> -			case 0xf:
> -				model = &op_athlon_spec;
> -				cpu_type = "x86-64/hammer";
> -				break;
> -			case 0x10:
> -				model = &op_athlon_spec;
> -				cpu_type = "x86-64/family10";
> -				ibs_init();
> -				break;
> -			case 0x11:
> -				model = &op_athlon_spec;
> -				cpu_type = "x86-64/family11h";
> -				break;
> -                        case 0x12:
> -				model = &op_athlon_spec;
> -				cpu_type = "x86-64/family12h";
> -				break;
> -			case 0x14:
> -                                model = &op_athlon_spec;
> -                                cpu_type = "x86-64/family14h";
> -                                break;
> -                        case 0x15:
> -                                model = &op_amd_fam15h_spec;
> -                                cpu_type = "x86-64/family15h";
> -                                break;
> -			case 0x16:
> -				model = &op_athlon_spec;
> -				cpu_type = "x86-64/family16h";
> -				break;
> -			}
> -			break;
> -
> -		case X86_VENDOR_INTEL:
> -			switch (family) {
> -				/* Pentium IV */
> -				case 0xf:
> -					p4_init(&cpu_type);
> -					break;
> -
> -				/* A P6-class processor */
> -				case 6:
> -					ppro_init(&cpu_type);
> -					break;
> -
> -				default:
> -				break;
> -			}
> -			if (!cpu_type && !arch_perfmon_init(&cpu_type)) {
> -				printk("xenoprof: Initialization failed. "
> -				       "Intel processor family %u model %d is not supported\n",
> -				       family, current_cpu_data.x86_model);
> -				return -ENODEV;
> -			}
> -			break;
> -
> -		default:
> -			printk("xenoprof: Initialization failed. "
> -			       "Unsupported processor. Unknown vendor %u\n",
> -				vendor);
> -			return -ENODEV;
> -	}
> -
> -	return 0;
> -}
> -
> -__initcall(nmi_init);
> -
> -int xenoprof_arch_init(int *num_events, char *_cpu_type)
> -{
> -	if (cpu_type == NULL)
> -		return -ENODEV;
> -	*num_events = model->num_counters;
> -	strlcpy(_cpu_type, cpu_type, XENOPROF_CPU_TYPE_SIZE);
> -	return 0;
> -}
> diff --git a/xen/arch/x86/oprofile/op_counter.h b/xen/arch/x86/oprofile/op_counter.h
> deleted file mode 100644
> index b515ac9ebc8e..000000000000
> --- a/xen/arch/x86/oprofile/op_counter.h
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -/**
> - * @file op_counter.h
> - *
> - * @remark Copyright 2002 OProfile authors
> - * @remark Read the file COPYING
> - *
> - * @author John Levon
> - */
> -
> -#ifndef OP_COUNTER_H
> -#define OP_COUNTER_H
> -
> -#define OP_MAX_COUNTER 8
> -
> -/* Per-perfctr configuration as set via
> - * oprofilefs.
> - */
> -struct op_counter_config {
> -        unsigned long count;
> -        unsigned long enabled;
> -        unsigned long event;
> -        unsigned long kernel;
> -        unsigned long user;
> -        unsigned long unit_mask;
> -};
> -
> -extern struct op_counter_config counter_config[];
> -
> -/* AMD IBS configuration */
> -struct op_ibs_config {
> -    unsigned long op_enabled;
> -    unsigned long fetch_enabled;
> -    unsigned long max_cnt_fetch;
> -    unsigned long max_cnt_op;
> -    unsigned long rand_en;
> -    unsigned long dispatched_ops;
> -};
> -
> -extern struct op_ibs_config ibs_config;
> -
> -#endif /* OP_COUNTER_H */
> diff --git a/xen/arch/x86/oprofile/op_model_athlon.c b/xen/arch/x86/oprofile/op_model_athlon.c
> deleted file mode 100644
> index 4c016624a69b..000000000000
> --- a/xen/arch/x86/oprofile/op_model_athlon.c
> +++ /dev/null
> @@ -1,547 +0,0 @@
> -/**
> - * @file op_model_athlon.h
> - * athlon / K7 model-specific MSR operations
> - *
> - * @remark Copyright 2002 OProfile authors
> - * @remark Read the file COPYING
> - *
> - * @author John Levon
> - * @author Philippe Elie
> - * @author Graydon Hoare
> - */
> -
> -#include <xen/sched.h>
> -#include <xen/types.h>
> -#include <asm/msr.h>
> -#include <asm/io.h>
> -#include <asm/apic.h>
> -#include <asm/processor.h>
> -#include <xen/xenoprof.h>
> -#include <asm/regs.h>
> -#include <asm/current.h>
> -#include <xen/pci_regs.h>
> -#include <xen/pci_ids.h>
> -
> -#include "op_x86_model.h"
> -#include "op_counter.h"
> -
> -#define K7_NUM_COUNTERS 4
> -#define K7_NUM_CONTROLS 4
> -
> -#define FAM15H_NUM_COUNTERS 6
> -#define FAM15H_NUM_CONTROLS 6
> -
> -#define MAX_COUNTERS FAM15H_NUM_COUNTERS
> -
> -#define CTR_READ(msr_content,msrs,c) do {rdmsrl(msrs->counters[(c)].addr, (msr_content));} while (0)
> -#define CTR_WRITE(l,msrs,c) wrmsr(msrs->counters[(c)].addr, -(l))
> -#define CTR_OVERFLOWED(n) (!((n) & (1ULL<<31)))
> -
> -#define CTRL_READ(msr_content,msrs,c) do {rdmsrl(msrs->controls[(c)].addr, (msr_content));} while (0)
> -#define CTRL_WRITE(msr_content,msrs,c) do {wrmsrl(msrs->controls[(c)].addr, (msr_content));} while (0)
> -#define CTRL_SET_ACTIVE(n) (n |= (1ULL<<22))
> -#define CTRL_SET_INACTIVE(n) (n &= ~(1ULL<<22))
> -#define CTRL_CLEAR(val) (val &= (1ULL<<21))
> -#define CTRL_SET_ENABLE(val) (val |= 1ULL<<20)
> -#define CTRL_SET_USR(val,u) (val |= ((u & 1) << 16))
> -#define CTRL_SET_KERN(val,k) (val |= ((k & 1) << 17))
> -#define CTRL_SET_UM(val, m) (val |= ((m & 0xff) << 8))
> -#define CTRL_SET_EVENT(val, e) (val |= (((e >> 8) & 0xf) | (e & 0xff)))
> -#define CTRL_SET_HOST_ONLY(val, h) (val |= ((h & 0x1ULL) << 41))
> -#define CTRL_SET_GUEST_ONLY(val, h) (val |= ((h & 0x1ULL) << 40))
> -
> -static unsigned long reset_value[MAX_COUNTERS];
> -
> -extern char svm_stgi_label[];
> -
> -u32 ibs_caps = 0;
> -static u64 ibs_op_ctl;
> -
> -/* IBS cpuid feature detection */
> -#define IBS_CPUID_FEATURES              0x8000001b
> -
> -/* IBS MSRs */
> -#define MSR_AMD64_IBSFETCHCTL           0xc0011030
> -#define MSR_AMD64_IBSFETCHLINAD         0xc0011031
> -#define MSR_AMD64_IBSFETCHPHYSAD        0xc0011032
> -#define MSR_AMD64_IBSOPCTL              0xc0011033
> -#define MSR_AMD64_IBSOPRIP              0xc0011034
> -#define MSR_AMD64_IBSOPDATA             0xc0011035
> -#define MSR_AMD64_IBSOPDATA2            0xc0011036
> -#define MSR_AMD64_IBSOPDATA3            0xc0011037
> -#define MSR_AMD64_IBSDCLINAD            0xc0011038
> -#define MSR_AMD64_IBSDCPHYSAD           0xc0011039
> -#define MSR_AMD64_IBSCTL                0xc001103a
> -
> -/*
> - * Same bit mask as for IBS cpuid feature flags (Fn8000_001B_EAX), but
> - * bit 0 is used to indicate the existence of IBS.
> - */
> -#define IBS_CAPS_AVAIL                  (1LL<<0)
> -#define IBS_CAPS_RDWROPCNT              (1LL<<3)
> -#define IBS_CAPS_OPCNT                  (1LL<<4)
> -
> -/* IBS randomization macros */
> -#define IBS_RANDOM_BITS                 12
> -#define IBS_RANDOM_MASK                 ((1ULL << IBS_RANDOM_BITS) - 1)
> -#define IBS_RANDOM_MAXCNT_OFFSET        (1ULL << (IBS_RANDOM_BITS - 5))
> -
> -/* IbsFetchCtl bits/masks */
> -#define IBS_FETCH_RAND_EN               (1ULL<<57)
> -#define IBS_FETCH_VAL                   (1ULL<<49)
> -#define IBS_FETCH_ENABLE                (1ULL<<48)
> -#define IBS_FETCH_CNT                   0xFFFF0000ULL
> -#define IBS_FETCH_MAX_CNT               0x0000FFFFULL
> -
> -/* IbsOpCtl bits */
> -#define IBS_OP_CNT_CTL                  (1ULL<<19)
> -#define IBS_OP_VAL                      (1ULL<<18)
> -#define IBS_OP_ENABLE                   (1ULL<<17)
> -#define IBS_OP_MAX_CNT                  0x0000FFFFULL
> -
> -/* IBS sample identifier */
> -#define IBS_FETCH_CODE                  13
> -#define IBS_OP_CODE                     14
> -
> -#define clamp(val, min, max) ({			\
> -	typeof(val) __val = (val);		\
> -	typeof(min) __min = (min);		\
> -	typeof(max) __max = (max);		\
> -	(void) (&__val == &__min);		\
> -	(void) (&__val == &__max);		\
> -	__val = __val < __min ? __min: __val;	\
> -	__val > __max ? __max: __val; })
> -
> -/*
> - * 16-bit Linear Feedback Shift Register (LFSR)
> - */
> -static unsigned int lfsr_random(void)
> -{
> -    static unsigned int lfsr_value = 0xF00D;
> -    unsigned int bit;
> -
> -    /* Compute next bit to shift in */
> -    bit = ((lfsr_value >> 0) ^
> -           (lfsr_value >> 2) ^
> -           (lfsr_value >> 3) ^
> -           (lfsr_value >> 5)) & 0x0001;
> -
> -    /* Advance to next register value */
> -    lfsr_value = (lfsr_value >> 1) | (bit << 15);
> -
> -    return lfsr_value;
> -}
> -
> -/*
> - * IBS software randomization
> - *
> - * The IBS periodic op counter is randomized in software. The lower 12
> - * bits of the 20 bit counter are randomized. IbsOpCurCnt is
> - * initialized with a 12 bit random value.
> - */
> -static inline u64 op_amd_randomize_ibs_op(u64 val)
> -{
> -    unsigned int random = lfsr_random();
> -
> -    if (!(ibs_caps & IBS_CAPS_RDWROPCNT))
> -        /*
> -         * Work around if the hw can not write to IbsOpCurCnt
> -         *
> -         * Randomize the lower 8 bits of the 16 bit
> -         * IbsOpMaxCnt [15:0] value in the range of -128 to
> -         * +127 by adding/subtracting an offset to the
> -         * maximum count (IbsOpMaxCnt).
> -         *
> -         * To avoid over or underflows and protect upper bits
> -         * starting at bit 16, the initial value for
> -         * IbsOpMaxCnt must fit in the range from 0x0081 to
> -         * 0xff80.
> -         */
> -        val += (int8_t)(random >> 4);
> -    else
> -        val |= (u64)(random & IBS_RANDOM_MASK) << 32;
> -
> -    return val;
> -}
> -
> -static void cf_check athlon_fill_in_addresses(struct op_msrs * const msrs)
> -{
> -	msrs->counters[0].addr = MSR_K7_PERFCTR0;
> -	msrs->counters[1].addr = MSR_K7_PERFCTR1;
> -	msrs->counters[2].addr = MSR_K7_PERFCTR2;
> -	msrs->counters[3].addr = MSR_K7_PERFCTR3;
> -
> -	msrs->controls[0].addr = MSR_K7_EVNTSEL0;
> -	msrs->controls[1].addr = MSR_K7_EVNTSEL1;
> -	msrs->controls[2].addr = MSR_K7_EVNTSEL2;
> -	msrs->controls[3].addr = MSR_K7_EVNTSEL3;
> -}
> -
> -static void cf_check fam15h_fill_in_addresses(struct op_msrs * const msrs)
> -{
> -	msrs->counters[0].addr = MSR_AMD_FAM15H_PERFCTR0;
> -	msrs->counters[1].addr = MSR_AMD_FAM15H_PERFCTR1;
> -	msrs->counters[2].addr = MSR_AMD_FAM15H_PERFCTR2;
> -	msrs->counters[3].addr = MSR_AMD_FAM15H_PERFCTR3;
> -	msrs->counters[4].addr = MSR_AMD_FAM15H_PERFCTR4;
> -	msrs->counters[5].addr = MSR_AMD_FAM15H_PERFCTR5;
> -
> -	msrs->controls[0].addr = MSR_AMD_FAM15H_EVNTSEL0;
> -	msrs->controls[1].addr = MSR_AMD_FAM15H_EVNTSEL1;
> -	msrs->controls[2].addr = MSR_AMD_FAM15H_EVNTSEL2;
> -	msrs->controls[3].addr = MSR_AMD_FAM15H_EVNTSEL3;
> -	msrs->controls[4].addr = MSR_AMD_FAM15H_EVNTSEL4;
> -	msrs->controls[5].addr = MSR_AMD_FAM15H_EVNTSEL5;
> -}
> -
> -static void cf_check athlon_setup_ctrs(struct op_msrs const * const msrs)
> -{
> -	uint64_t msr_content;
> -	int i;
> -	unsigned int const nr_ctrs = model->num_counters;
> -	unsigned int const nr_ctrls = model->num_controls;
> -
> -	/* clear all counters */
> -	for (i = 0 ; i < nr_ctrls; ++i) {
> -		CTRL_READ(msr_content, msrs, i);
> -		CTRL_CLEAR(msr_content);
> -		CTRL_WRITE(msr_content, msrs, i);
> -	}
> -	
> -	/* avoid a false detection of ctr overflows in NMI handler */
> -	for (i = 0; i < nr_ctrs; ++i) {
> -		CTR_WRITE(1, msrs, i);
> -	}
> -
> -	/* enable active counters */
> -	for (i = 0; i < nr_ctrs; ++i) {
> -		if (counter_config[i].enabled) {
> -			reset_value[i] = counter_config[i].count;
> -
> -			CTR_WRITE(counter_config[i].count, msrs, i);
> -
> -			CTRL_READ(msr_content, msrs, i);
> -			CTRL_CLEAR(msr_content);
> -			CTRL_SET_ENABLE(msr_content);
> -			CTRL_SET_USR(msr_content, counter_config[i].user);
> -			CTRL_SET_KERN(msr_content, counter_config[i].kernel);
> -			CTRL_SET_UM(msr_content, counter_config[i].unit_mask);
> -			CTRL_SET_EVENT(msr_content, counter_config[i].event);
> -			CTRL_SET_HOST_ONLY(msr_content, 0);
> -			CTRL_SET_GUEST_ONLY(msr_content, 0);
> -			CTRL_WRITE(msr_content, msrs, i);
> -		} else {
> -			reset_value[i] = 0;
> -		}
> -	}
> -}
> -
> -static inline void
> -ibs_log_event(u64 data, struct cpu_user_regs const * const regs, int mode)
> -{
> -	struct vcpu *v = current;
> -	u32 temp = 0;
> -
> -	temp = data & 0xFFFFFFFF;
> -	xenoprof_log_event(v, regs, temp, mode, 0);
> -	
> -	temp = (data >> 32) & 0xFFFFFFFF;
> -	xenoprof_log_event(v, regs, temp, mode, 0);
> -	
> -}
> -
> -static inline int handle_ibs(int mode, struct cpu_user_regs const * const regs)
> -{
> -	u64 val, ctl;
> -	struct vcpu *v = current;
> -
> -	if (!ibs_caps)
> -		return 1;
> -
> -	if (ibs_config.fetch_enabled) {
> -		rdmsrl(MSR_AMD64_IBSFETCHCTL, ctl);
> -		if (ctl & IBS_FETCH_VAL) {
> -			rdmsrl(MSR_AMD64_IBSFETCHLINAD, val);
> -			xenoprof_log_event(v, regs, IBS_FETCH_CODE, mode, 0);
> -			xenoprof_log_event(v, regs, val, mode, 0);
> -
> -			ibs_log_event(val, regs, mode);
> -			ibs_log_event(ctl, regs, mode);
> -
> -			rdmsrl(MSR_AMD64_IBSFETCHPHYSAD, val);
> -			ibs_log_event(val, regs, mode);
> -		
> -			/* reenable the IRQ */
> -			ctl &= ~(IBS_FETCH_VAL | IBS_FETCH_CNT);
> -			ctl |= IBS_FETCH_ENABLE;
> -			wrmsrl(MSR_AMD64_IBSFETCHCTL, ctl);
> -		}
> -	}
> -
> -	if (ibs_config.op_enabled) {
> -		rdmsrl(MSR_AMD64_IBSOPCTL, ctl);
> -		if (ctl & IBS_OP_VAL) {
> -
> -			rdmsrl(MSR_AMD64_IBSOPRIP, val);
> -			xenoprof_log_event(v, regs, IBS_OP_CODE, mode, 0);
> -			xenoprof_log_event(v, regs, val, mode, 0);
> -			
> -			ibs_log_event(val, regs, mode);
> -
> -			rdmsrl(MSR_AMD64_IBSOPDATA, val);
> -			ibs_log_event(val, regs, mode);
> -			rdmsrl(MSR_AMD64_IBSOPDATA2, val);
> -			ibs_log_event(val, regs, mode);
> -			rdmsrl(MSR_AMD64_IBSOPDATA3, val);
> -			ibs_log_event(val, regs, mode);
> -			rdmsrl(MSR_AMD64_IBSDCLINAD, val);
> -			ibs_log_event(val, regs, mode);
> -			rdmsrl(MSR_AMD64_IBSDCPHYSAD, val);
> -			ibs_log_event(val, regs, mode);
> -
> -			/* reenable the IRQ */
> -			ctl = op_amd_randomize_ibs_op(ibs_op_ctl);
> -			wrmsrl(MSR_AMD64_IBSOPCTL, ctl);
> -		}
> -	}
> -
> -    return 1;
> -}
> -
> -static int cf_check athlon_check_ctrs(
> -	unsigned int const cpu, struct op_msrs const * const msrs,
> -	struct cpu_user_regs const * const regs)
> -
> -{
> -	uint64_t msr_content;
> -	int i;
> -	unsigned long eip = regs->rip;
> -	int mode = 0;
> -	struct vcpu *v = current;
> -	unsigned int const nr_ctrs = model->num_counters;
> -
> -#ifdef CONFIG_AMD_SVM
> -	struct cpu_user_regs *guest_regs = guest_cpu_user_regs();
> -
> -	if (!guest_mode(regs) &&
> -	    (eip == (unsigned long)svm_stgi_label)) {
> -		/* SVM guest was running when NMI occurred */
> -		ASSERT(is_hvm_vcpu(v));
> -		eip = guest_regs->rip;
> -		mode = xenoprofile_get_mode(v, guest_regs);
> -	} else
> -#endif
> -		mode = xenoprofile_get_mode(v, regs);
> -
> -	for (i = 0 ; i < nr_ctrs; ++i) {
> -		CTR_READ(msr_content, msrs, i);
> -		if (CTR_OVERFLOWED(msr_content)) {
> -			xenoprof_log_event(current, regs, eip, mode, i);
> -			CTR_WRITE(reset_value[i], msrs, i);
> -		}
> -	}
> -
> -	/* See op_model_ppro.c */
> -	return handle_ibs(mode, regs);
> -}
> -
> -static inline void start_ibs(void)
> -{
> -	u64 val = 0;
> -
> -	if (!ibs_caps)
> -		return;
> -
> -	if (ibs_config.fetch_enabled) {
> -		val = (ibs_config.max_cnt_fetch >> 4) & IBS_FETCH_MAX_CNT;
> -		val |= ibs_config.rand_en ? IBS_FETCH_RAND_EN : 0;
> -		val |= IBS_FETCH_ENABLE;
> -		wrmsrl(MSR_AMD64_IBSFETCHCTL, val);
> -	}
> -
> -	if (ibs_config.op_enabled) {
> -		ibs_op_ctl = ibs_config.max_cnt_op >> 4;
> -		if (!(ibs_caps & IBS_CAPS_RDWROPCNT)) {
> -			/*
> -			 * IbsOpCurCnt not supported.  See
> -			 * op_amd_randomize_ibs_op() for details.
> -			 */
> -			ibs_op_ctl = clamp((unsigned long long)ibs_op_ctl,
> -							0x0081ULL, 0xFF80ULL);
> -		} else {
> -			/*
> -			 * The start value is randomized with a
> -			 * positive offset, we need to compensate it
> -			 * with the half of the randomized range. Also
> -			 * avoid underflows.
> -			 */
> -		ibs_op_ctl = min(ibs_op_ctl + IBS_RANDOM_MAXCNT_OFFSET,
> -					IBS_OP_MAX_CNT);
> -		}
> -		if (ibs_caps & IBS_CAPS_OPCNT && ibs_config.dispatched_ops)
> -			ibs_op_ctl |= IBS_OP_CNT_CTL;
> -		ibs_op_ctl |= IBS_OP_ENABLE;
> -		val = op_amd_randomize_ibs_op(ibs_op_ctl);
> -		wrmsrl(MSR_AMD64_IBSOPCTL, val);
> -	}
> -}
> -
> -static void cf_check athlon_start(struct op_msrs const * const msrs)
> -{
> -	uint64_t msr_content;
> -	int i;
> -	unsigned int const nr_ctrs = model->num_counters;
> -	for (i = 0 ; i < nr_ctrs ; ++i) {
> -		if (reset_value[i]) {
> -			CTRL_READ(msr_content, msrs, i);
> -			CTRL_SET_ACTIVE(msr_content);
> -			CTRL_WRITE(msr_content, msrs, i);
> -		}
> -	}
> -	start_ibs();
> -}
> -
> -static void stop_ibs(void)
> -{
> -	if (!ibs_caps)
> -		return;
> -
> -	if (ibs_config.fetch_enabled)
> -		/* clear max count and enable */
> -		wrmsrl(MSR_AMD64_IBSFETCHCTL, 0);
> -
> -	if (ibs_config.op_enabled)
> -		/* clear max count and enable */
> -		wrmsrl(MSR_AMD64_IBSOPCTL, 0);
> -}
> -
> -static void cf_check athlon_stop(struct op_msrs const * const msrs)
> -{
> -	uint64_t msr_content;
> -	int i;
> -	unsigned int const nr_ctrs = model->num_counters;
> -
> -	/* Subtle: stop on all counters to avoid race with
> -	 * setting our pm callback */
> -	for (i = 0 ; i < nr_ctrs ; ++i) {
> -		CTRL_READ(msr_content, msrs, i);
> -		CTRL_SET_INACTIVE(msr_content);
> -		CTRL_WRITE(msr_content, msrs, i);
> -	}
> -
> -	stop_ibs();
> -}
> -
> -#define IBSCTL_LVTOFFSETVAL             (1 << 8)
> -#define APIC_EILVT_MSG_NMI              0x4
> -#define APIC_EILVT_LVTOFF_IBS           1
> -#define APIC_EILVTn(n)                  (0x500 + 0x10 * n)
> -static inline void __init cf_check init_ibs_nmi_per_cpu(void *arg)
> -{
> -	unsigned long reg;
> -
> -	reg = (APIC_EILVT_LVTOFF_IBS << 4) + APIC_EILVTn(0);
> -	apic_write(reg, APIC_EILVT_MSG_NMI << 8);
> -}
> -
> -#define PCI_DEVICE_ID_AMD_10H_NB_MISC   0x1203
> -#define IBSCTL                          0x1cc
> -static int __init init_ibs_nmi(void)
> -{
> -	int bus, dev, func;
> -	u32 id, value;
> -	u16 vendor_id, dev_id;
> -	int nodes;
> -
> -	/* per CPU setup */
> -	on_each_cpu(init_ibs_nmi_per_cpu, NULL, 1);
> -
> -	nodes = 0;
> -	for (bus = 0; bus < 256; bus++) {
> -		for (dev = 0; dev < 32; dev++) {
> -			for (func = 0; func < 8; func++) {
> -				id = pci_conf_read32(PCI_SBDF(0, bus, dev, func),
> -						     PCI_VENDOR_ID);
> -
> -				vendor_id = id & 0xffff;
> -				dev_id = (id >> 16) & 0xffff;
> -
> -				if ((vendor_id == PCI_VENDOR_ID_AMD) &&
> -					(dev_id == PCI_DEVICE_ID_AMD_10H_NB_MISC)) {
> -
> -					pci_conf_write32(
> -						PCI_SBDF(0, bus, dev, func),
> -						IBSCTL,
> -						IBSCTL_LVTOFFSETVAL | APIC_EILVT_LVTOFF_IBS);
> -
> -					value = pci_conf_read32(PCI_SBDF(0, bus, dev, func),
> -								IBSCTL);
> -
> -					if (value != (IBSCTL_LVTOFFSETVAL |
> -						APIC_EILVT_LVTOFF_IBS)) {
> -						printk("Xenoprofile: Failed to setup IBS LVT offset, "
> -							"IBSCTL = %#x\n", value);
> -						return 1;
> -					}
> -					nodes++;
> -				}
> -			}
> -		}
> -	}
> -
> -	if (!nodes) {
> -		printk("Xenoprofile: No CPU node configured for IBS\n");
> -		return 1;
> -	}
> -
> -	return 0;
> -}
> -
> -static void __init get_ibs_caps(void)
> -{
> -	if (!boot_cpu_has(X86_FEATURE_IBS))
> -		return;
> -
> -    /* check IBS cpuid feature flags */
> -	if (current_cpu_data.extended_cpuid_level >= IBS_CPUID_FEATURES)
> -		ibs_caps = cpuid_eax(IBS_CPUID_FEATURES);
> -	if (!(ibs_caps & IBS_CAPS_AVAIL))
> -		/* cpuid flags not valid */
> -		ibs_caps = 0;
> -}
> -
> -void __init ibs_init(void)
> -{
> -	get_ibs_caps();
> -
> -	if ( !ibs_caps )
> -		return;
> -
> -	if (init_ibs_nmi()) {
> -		ibs_caps = 0;
> -		return;
> -	}
> -
> -	printk("Xenoprofile: AMD IBS detected (%#x)\n",
> -		(unsigned)ibs_caps);
> -}
> -
> -struct op_x86_model_spec const op_athlon_spec = {
> -	.num_counters = K7_NUM_COUNTERS,
> -	.num_controls = K7_NUM_CONTROLS,
> -	.fill_in_addresses = &athlon_fill_in_addresses,
> -	.setup_ctrs = &athlon_setup_ctrs,
> -	.check_ctrs = &athlon_check_ctrs,
> -	.start = &athlon_start,
> -	.stop = &athlon_stop
> -};
> -
> -struct op_x86_model_spec const op_amd_fam15h_spec = {
> -	.num_counters = FAM15H_NUM_COUNTERS,
> -	.num_controls = FAM15H_NUM_CONTROLS,
> -	.fill_in_addresses = &fam15h_fill_in_addresses,
> -	.setup_ctrs = &athlon_setup_ctrs,
> -	.check_ctrs = &athlon_check_ctrs,
> -	.start = &athlon_start,
> -	.stop = &athlon_stop
> -};
> diff --git a/xen/arch/x86/oprofile/op_model_p4.c b/xen/arch/x86/oprofile/op_model_p4.c
> deleted file mode 100644
> index d047258644db..000000000000
> --- a/xen/arch/x86/oprofile/op_model_p4.c
> +++ /dev/null
> @@ -1,721 +0,0 @@
> -/**
> - * @file op_model_p4.c
> - * P4 model-specific MSR operations
> - *
> - * @remark Copyright 2002 OProfile authors
> - * @remark Read the file COPYING
> - *
> - * @author Graydon Hoare
> - */
> -
> -#include <xen/types.h>
> -#include <asm/msr.h>
> -#include <asm/io.h>
> -#include <asm/apic.h>
> -#include <asm/processor.h>
> -#include <xen/xenoprof.h>
> -#include <asm/regs.h>
> -#include <asm/current.h>
> -
> -#include "op_x86_model.h"
> -#include "op_counter.h"
> -
> -#define NUM_EVENTS 39
> -
> -#define NUM_COUNTERS_NON_HT 8
> -#define NUM_ESCRS_NON_HT 45
> -#define NUM_CCCRS_NON_HT 18
> -#define NUM_CONTROLS_NON_HT (NUM_ESCRS_NON_HT + NUM_CCCRS_NON_HT)
> -
> -#define NUM_COUNTERS_HT2 4
> -#define NUM_ESCRS_HT2 23
> -#define NUM_CCCRS_HT2 9
> -#define NUM_CONTROLS_HT2 (NUM_ESCRS_HT2 + NUM_CCCRS_HT2)
> -
> -static unsigned int num_counters = NUM_COUNTERS_NON_HT;
> -
> -
> -/* this has to be checked dynamically since the
> -   hyper-threadedness of a chip is discovered at
> -   kernel boot-time. */
> -static inline void setup_num_counters(void)
> -{
> -	if (boot_cpu_data.x86_num_siblings == 2) 	/* XXX */
> -		num_counters = NUM_COUNTERS_HT2;
> -}
> -
> -static int inline addr_increment(void)
> -{
> -	return boot_cpu_data.x86_num_siblings == 2 ? 2 : 1;
> -}
> -
> -
> -/* tables to simulate simplified hardware view of p4 registers */
> -struct p4_counter_binding {
> -	int virt_counter;
> -	int counter_address;
> -	int cccr_address;
> -};
> -
> -struct p4_event_binding {
> -	int escr_select;  /* value to put in CCCR */
> -	int event_select; /* value to put in ESCR */
> -	struct {
> -		int virt_counter; /* for this counter... */
> -		int escr_address; /* use this ESCR       */
> -	} bindings[2];
> -};
> -
> -/* nb: these CTR_* defines are a duplicate of defines in
> -   event/i386.p4*events. */
> -
> -
> -#define CTR_BPU_0      (1 << 0)
> -#define CTR_MS_0       (1 << 1)
> -#define CTR_FLAME_0    (1 << 2)
> -#define CTR_IQ_4       (1 << 3)
> -#define CTR_BPU_2      (1 << 4)
> -#define CTR_MS_2       (1 << 5)
> -#define CTR_FLAME_2    (1 << 6)
> -#define CTR_IQ_5       (1 << 7)
> -
> -static struct p4_counter_binding p4_counters [NUM_COUNTERS_NON_HT] = {
> -	{ CTR_BPU_0,   MSR_P4_BPU_PERFCTR0,   MSR_P4_BPU_CCCR0 },
> -	{ CTR_MS_0,    MSR_P4_MS_PERFCTR0,    MSR_P4_MS_CCCR0 },
> -	{ CTR_FLAME_0, MSR_P4_FLAME_PERFCTR0, MSR_P4_FLAME_CCCR0 },
> -	{ CTR_IQ_4,    MSR_P4_IQ_PERFCTR4,    MSR_P4_IQ_CCCR4 },
> -	{ CTR_BPU_2,   MSR_P4_BPU_PERFCTR2,   MSR_P4_BPU_CCCR2 },
> -	{ CTR_MS_2,    MSR_P4_MS_PERFCTR2,    MSR_P4_MS_CCCR2 },
> -	{ CTR_FLAME_2, MSR_P4_FLAME_PERFCTR2, MSR_P4_FLAME_CCCR2 },
> -	{ CTR_IQ_5,    MSR_P4_IQ_PERFCTR5,    MSR_P4_IQ_CCCR5 }
> -};
> -
> -#define NUM_UNUSED_CCCRS	NUM_CCCRS_NON_HT - NUM_COUNTERS_NON_HT
> -
> -/* All cccr we don't use. */
> -static int p4_unused_cccr[NUM_UNUSED_CCCRS] = {
> -	MSR_P4_BPU_CCCR1,	MSR_P4_BPU_CCCR3,
> -	MSR_P4_MS_CCCR1,	MSR_P4_MS_CCCR3,
> -	MSR_P4_FLAME_CCCR1,	MSR_P4_FLAME_CCCR3,
> -	MSR_P4_IQ_CCCR0,	MSR_P4_IQ_CCCR1,
> -	MSR_P4_IQ_CCCR2,	MSR_P4_IQ_CCCR3
> -};
> -
> -/* p4 event codes in libop/op_event.h are indices into this table. */
> -
> -static const struct p4_event_binding p4_events[NUM_EVENTS] = {
> -	
> -	{ /* BRANCH_RETIRED */
> -		0x05, 0x06,
> -		{ {CTR_IQ_4, MSR_P4_CRU_ESCR2},
> -		  {CTR_IQ_5, MSR_P4_CRU_ESCR3} }
> -	},
> -	
> -	{ /* MISPRED_BRANCH_RETIRED */
> -		0x04, 0x03,
> -		{ { CTR_IQ_4, MSR_P4_CRU_ESCR0},
> -		  { CTR_IQ_5, MSR_P4_CRU_ESCR1} }
> -	},
> -	
> -	{ /* TC_DELIVER_MODE */
> -		0x01, 0x01,
> -		{ { CTR_MS_0, MSR_P4_TC_ESCR0},
> -		  { CTR_MS_2, MSR_P4_TC_ESCR1} }
> -	},
> -	
> -	{ /* BPU_FETCH_REQUEST */
> -		0x00, 0x03,
> -		{ { CTR_BPU_0, MSR_P4_BPU_ESCR0},
> -		  { CTR_BPU_2, MSR_P4_BPU_ESCR1} }
> -	},
> -
> -	{ /* ITLB_REFERENCE */
> -		0x03, 0x18,
> -		{ { CTR_BPU_0, MSR_P4_ITLB_ESCR0},
> -		  { CTR_BPU_2, MSR_P4_ITLB_ESCR1} }
> -	},
> -
> -	{ /* MEMORY_CANCEL */
> -		0x05, 0x02,
> -		{ { CTR_FLAME_0, MSR_P4_DAC_ESCR0},
> -		  { CTR_FLAME_2, MSR_P4_DAC_ESCR1} }
> -	},
> -
> -	{ /* MEMORY_COMPLETE */
> -		0x02, 0x08,
> -		{ { CTR_FLAME_0, MSR_P4_SAAT_ESCR0},
> -		  { CTR_FLAME_2, MSR_P4_SAAT_ESCR1} }
> -	},
> -
> -	{ /* LOAD_PORT_REPLAY */
> -		0x02, 0x04,
> -		{ { CTR_FLAME_0, MSR_P4_SAAT_ESCR0},
> -		  { CTR_FLAME_2, MSR_P4_SAAT_ESCR1} }
> -	},
> -
> -	{ /* STORE_PORT_REPLAY */
> -		0x02, 0x05,
> -		{ { CTR_FLAME_0, MSR_P4_SAAT_ESCR0},
> -		  { CTR_FLAME_2, MSR_P4_SAAT_ESCR1} }
> -	},
> -
> -	{ /* MOB_LOAD_REPLAY */
> -		0x02, 0x03,
> -		{ { CTR_BPU_0, MSR_P4_MOB_ESCR0},
> -		  { CTR_BPU_2, MSR_P4_MOB_ESCR1} }
> -	},
> -
> -	{ /* PAGE_WALK_TYPE */
> -		0x04, 0x01,
> -		{ { CTR_BPU_0, MSR_P4_PMH_ESCR0},
> -		  { CTR_BPU_2, MSR_P4_PMH_ESCR1} }
> -	},
> -
> -	{ /* BSQ_CACHE_REFERENCE */
> -		0x07, 0x0c,
> -		{ { CTR_BPU_0, MSR_P4_BSU_ESCR0},
> -		  { CTR_BPU_2, MSR_P4_BSU_ESCR1} }
> -	},
> -
> -	{ /* IOQ_ALLOCATION */
> -		0x06, 0x03,
> -		{ { CTR_BPU_0, MSR_P4_FSB_ESCR0},
> -		  { 0, 0 } }
> -	},
> -
> -	{ /* IOQ_ACTIVE_ENTRIES */
> -		0x06, 0x1a,
> -		{ { CTR_BPU_2, MSR_P4_FSB_ESCR1},
> -		  { 0, 0 } }
> -	},
> -
> -	{ /* FSB_DATA_ACTIVITY */
> -		0x06, 0x17,
> -		{ { CTR_BPU_0, MSR_P4_FSB_ESCR0},
> -		  { CTR_BPU_2, MSR_P4_FSB_ESCR1} }
> -	},
> -
> -	{ /* BSQ_ALLOCATION */
> -		0x07, 0x05,
> -		{ { CTR_BPU_0, MSR_P4_BSU_ESCR0},
> -		  { 0, 0 } }
> -	},
> -
> -	{ /* BSQ_ACTIVE_ENTRIES */
> -		0x07, 0x06,
> -		{ { CTR_BPU_2, MSR_P4_BSU_ESCR1 /* guess */},
> -		  { 0, 0 } }
> -	},
> -
> -	{ /* X87_ASSIST */
> -		0x05, 0x03,
> -		{ { CTR_IQ_4, MSR_P4_CRU_ESCR2},
> -		  { CTR_IQ_5, MSR_P4_CRU_ESCR3} }
> -	},
> -
> -	{ /* SSE_INPUT_ASSIST */
> -		0x01, 0x34,
> -		{ { CTR_FLAME_0, MSR_P4_FIRM_ESCR0},
> -		  { CTR_FLAME_2, MSR_P4_FIRM_ESCR1} }
> -	},
> -
> -	{ /* PACKED_SP_UOP */
> -		0x01, 0x08,
> -		{ { CTR_FLAME_0, MSR_P4_FIRM_ESCR0},
> -		  { CTR_FLAME_2, MSR_P4_FIRM_ESCR1} }
> -	},
> -
> -	{ /* PACKED_DP_UOP */
> -		0x01, 0x0c,
> -		{ { CTR_FLAME_0, MSR_P4_FIRM_ESCR0},
> -		  { CTR_FLAME_2, MSR_P4_FIRM_ESCR1} }
> -	},
> -
> -	{ /* SCALAR_SP_UOP */
> -		0x01, 0x0a,
> -		{ { CTR_FLAME_0, MSR_P4_FIRM_ESCR0},
> -		  { CTR_FLAME_2, MSR_P4_FIRM_ESCR1} }
> -	},
> -
> -	{ /* SCALAR_DP_UOP */
> -		0x01, 0x0e,
> -		{ { CTR_FLAME_0, MSR_P4_FIRM_ESCR0},
> -		  { CTR_FLAME_2, MSR_P4_FIRM_ESCR1} }
> -	},
> -
> -	{ /* 64BIT_MMX_UOP */
> -		0x01, 0x02,
> -		{ { CTR_FLAME_0, MSR_P4_FIRM_ESCR0},
> -		  { CTR_FLAME_2, MSR_P4_FIRM_ESCR1} }
> -	},
> -
> -	{ /* 128BIT_MMX_UOP */
> -		0x01, 0x1a,
> -		{ { CTR_FLAME_0, MSR_P4_FIRM_ESCR0},
> -		  { CTR_FLAME_2, MSR_P4_FIRM_ESCR1} }
> -	},
> -
> -	{ /* X87_FP_UOP */
> -		0x01, 0x04,
> -		{ { CTR_FLAME_0, MSR_P4_FIRM_ESCR0},
> -		  { CTR_FLAME_2, MSR_P4_FIRM_ESCR1} }
> -	},
> -
> -	{ /* X87_SIMD_MOVES_UOP */
> -		0x01, 0x2e,
> -		{ { CTR_FLAME_0, MSR_P4_FIRM_ESCR0},
> -		  { CTR_FLAME_2, MSR_P4_FIRM_ESCR1} }
> -	},
> -
> -	{ /* MACHINE_CLEAR */
> -		0x05, 0x02,
> -		{ { CTR_IQ_4, MSR_P4_CRU_ESCR2},
> -		  { CTR_IQ_5, MSR_P4_CRU_ESCR3} }
> -	},
> -
> -	{ /* GLOBAL_POWER_EVENTS */
> -		0x06, 0x13 /* older manual says 0x05, newer 0x13 */,
> -		{ { CTR_BPU_0, MSR_P4_FSB_ESCR0},
> -		  { CTR_BPU_2, MSR_P4_FSB_ESCR1} }
> -	},
> -
> -	{ /* TC_MS_XFER */
> -		0x00, 0x05,
> -		{ { CTR_MS_0, MSR_P4_MS_ESCR0},
> -		  { CTR_MS_2, MSR_P4_MS_ESCR1} }
> -	},
> -
> -	{ /* UOP_QUEUE_WRITES */
> -		0x00, 0x09,
> -		{ { CTR_MS_0, MSR_P4_MS_ESCR0},
> -		  { CTR_MS_2, MSR_P4_MS_ESCR1} }
> -	},
> -
> -	{ /* FRONT_END_EVENT */
> -		0x05, 0x08,
> -		{ { CTR_IQ_4, MSR_P4_CRU_ESCR2},
> -		  { CTR_IQ_5, MSR_P4_CRU_ESCR3} }
> -	},
> -
> -	{ /* EXECUTION_EVENT */
> -		0x05, 0x0c,
> -		{ { CTR_IQ_4, MSR_P4_CRU_ESCR2},
> -		  { CTR_IQ_5, MSR_P4_CRU_ESCR3} }
> -	},
> -
> -	{ /* REPLAY_EVENT */
> -		0x05, 0x09,
> -		{ { CTR_IQ_4, MSR_P4_CRU_ESCR2},
> -		  { CTR_IQ_5, MSR_P4_CRU_ESCR3} }
> -	},
> -
> -	{ /* INSTR_RETIRED */
> -		0x04, 0x02,
> -		{ { CTR_IQ_4, MSR_P4_CRU_ESCR0},
> -		  { CTR_IQ_5, MSR_P4_CRU_ESCR1} }
> -	},
> -
> -	{ /* UOPS_RETIRED */
> -		0x04, 0x01,
> -		{ { CTR_IQ_4, MSR_P4_CRU_ESCR0},
> -		  { CTR_IQ_5, MSR_P4_CRU_ESCR1} }
> -	},
> -
> -	{ /* UOP_TYPE */
> -		0x02, 0x02,
> -		{ { CTR_IQ_4, MSR_P4_RAT_ESCR0},
> -		  { CTR_IQ_5, MSR_P4_RAT_ESCR1} }
> -	},
> -
> -	{ /* RETIRED_MISPRED_BRANCH_TYPE */
> -		0x02, 0x05,
> -		{ { CTR_MS_0, MSR_P4_TBPU_ESCR0},
> -		  { CTR_MS_2, MSR_P4_TBPU_ESCR1} }
> -	},
> -
> -	{ /* RETIRED_BRANCH_TYPE */
> -		0x02, 0x04,
> -		{ { CTR_MS_0, MSR_P4_TBPU_ESCR0},
> -		  { CTR_MS_2, MSR_P4_TBPU_ESCR1} }
> -	}
> -};
> -
> -
> -#define MISC_PMC_ENABLED_P(x) ((x) & 1ULL << 7)
> -
> -#define ESCR_RESERVED_BITS 0x80000003ULL
> -#define ESCR_CLEAR(escr) ((escr) &= ESCR_RESERVED_BITS)
> -#define ESCR_SET_USR_0(escr, usr) ((escr) |= (((usr) & 1ULL) << 2))
> -#define ESCR_SET_OS_0(escr, os) ((escr) |= (((os) & 1ULL) << 3))
> -#define ESCR_SET_USR_1(escr, usr) ((escr) |= (((usr) & 1ULL)))
> -#define ESCR_SET_OS_1(escr, os) ((escr) |= (((os) & 1ULL) << 1))
> -#define ESCR_SET_EVENT_SELECT(escr, sel) ((escr) |= (((sel) & 0x3fULL) << 25))
> -#define ESCR_SET_EVENT_MASK(escr, mask) ((escr) |= (((mask) & 0xffffULL) << 9))
> -#define ESCR_READ(escr,ev,i) do {rdmsrl(ev->bindings[(i)].escr_address, (escr));} while (0)
> -#define ESCR_WRITE(escr,ev,i) do {wrmsrl(ev->bindings[(i)].escr_address, (escr));} while (0)
> -
> -#define CCCR_RESERVED_BITS 0x38030FFFULL
> -#define CCCR_CLEAR(cccr) ((cccr) &= CCCR_RESERVED_BITS)
> -#define CCCR_SET_REQUIRED_BITS(cccr) ((cccr) |= 0x00030000ULL)
> -#define CCCR_SET_ESCR_SELECT(cccr, sel) ((cccr) |= (((sel) & 0x07ULL) << 13))
> -#define CCCR_SET_PMI_OVF_0(cccr) ((cccr) |= (1ULL<<26))
> -#define CCCR_SET_PMI_OVF_1(cccr) ((cccr) |= (1ULL<<27))
> -#define CCCR_SET_ENABLE(cccr) ((cccr) |= (1ULL<<12))
> -#define CCCR_SET_DISABLE(cccr) ((cccr) &= ~(1ULL<<12))
> -#define CCCR_READ(msr_content, i) do {rdmsrl(p4_counters[(i)].cccr_address, (msr_content));} while (0)
> -#define CCCR_WRITE(msr_content, i) do {wrmsrl(p4_counters[(i)].cccr_address, (msr_content));} while (0)
> -#define CCCR_OVF_P(cccr) ((cccr) & (1ULL<<31))
> -#define CCCR_CLEAR_OVF(cccr) ((cccr) &= (~(1ULL<<31)))
> -
> -#define CTR_READ(msr_content,i) do {rdmsrl(p4_counters[(i)].counter_address, (msr_content));} while (0)
> -#define CTR_WRITE(msr_content,i) do {wrmsrl(p4_counters[(i)].counter_address, -(msr_content));} while (0)
> -#define CTR_OVERFLOW_P(ctr) (!((ctr) & 0x80000000ULL))
> -
> -
> -/* this assigns a "stagger" to the current CPU, which is used throughout
> -   the code in this module as an extra array offset, to select the "even"
> -   or "odd" part of all the divided resources. */
> -static unsigned int get_stagger(void)
> -{
> -	int cpu = smp_processor_id();
> -	return (cpu != cpumask_first(per_cpu(cpu_sibling_mask, cpu)));
> -}
> -
> -
> -/* finally, mediate access to a real hardware counter
> -   by passing a "virtual" counter numer to this macro,
> -   along with your stagger setting. */
> -#define VIRT_CTR(stagger, i) ((i) + ((num_counters) * (stagger)))
> -
> -static unsigned long reset_value[NUM_COUNTERS_NON_HT];
> -
> -
> -static void cf_check p4_fill_in_addresses(struct op_msrs * const msrs)
> -{
> -	unsigned int i;
> -	unsigned int addr, stag;
> -
> -	setup_num_counters();
> -	stag = get_stagger();
> -
> -	/* the counter registers we pay attention to */
> -	for (i = 0; i < num_counters; ++i) {
> -		msrs->counters[i].addr =
> -			p4_counters[VIRT_CTR(stag, i)].counter_address;
> -	}
> -
> -	/* FIXME: bad feeling, we don't save the 10 counters we don't use. */
> -
> -	/* 18 CCCR registers */
> -	for (i = 0, addr = MSR_P4_BPU_CCCR0 + stag;
> -	     addr <= MSR_P4_IQ_CCCR5; ++i, addr += addr_increment()) {
> -		msrs->controls[i].addr = addr;
> -	}
> -	
> -	/* 43 ESCR registers in three or four discontiguous group */
> -	for (addr = MSR_P4_BSU_ESCR0 + stag;
> -	     addr < MSR_P4_IQ_ESCR0; ++i, addr += addr_increment()) {
> -		msrs->controls[i].addr = addr;
> -	}
> -
> -	/* no IQ_ESCR0/1 on some models, we save a seconde time BSU_ESCR0/1
> -	 * to avoid special case in nmi_{save|restore}_registers() */
> -	if (boot_cpu_data.x86_model >= 0x3) {
> -		for (addr = MSR_P4_BSU_ESCR0 + stag;
> -		     addr <= MSR_P4_BSU_ESCR1; ++i, addr += addr_increment()) {
> -			msrs->controls[i].addr = addr;
> -		}
> -	} else {
> -		for (addr = MSR_P4_IQ_ESCR0 + stag;
> -		     addr <= MSR_P4_IQ_ESCR1; ++i, addr += addr_increment()) {
> -			msrs->controls[i].addr = addr;
> -		}
> -	}
> -
> -	for (addr = MSR_P4_RAT_ESCR0 + stag;
> -	     addr <= MSR_P4_SSU_ESCR0; ++i, addr += addr_increment()) {
> -		msrs->controls[i].addr = addr;
> -	}
> -	
> -	for (addr = MSR_P4_MS_ESCR0 + stag;
> -	     addr <= MSR_P4_TC_ESCR1; ++i, addr += addr_increment()) {
> -		msrs->controls[i].addr = addr;
> -	}
> -	
> -	for (addr = MSR_P4_IX_ESCR0 + stag;
> -	     addr <= MSR_P4_CRU_ESCR3; ++i, addr += addr_increment()) {
> -		msrs->controls[i].addr = addr;
> -	}
> -
> -	/* there are 2 remaining non-contiguously located ESCRs */
> -
> -	if (num_counters == NUM_COUNTERS_NON_HT) {		
> -		/* standard non-HT CPUs handle both remaining ESCRs*/
> -		msrs->controls[i++].addr = MSR_P4_CRU_ESCR5;
> -		msrs->controls[i++].addr = MSR_P4_CRU_ESCR4;
> -
> -	} else if (stag == 0) {
> -		/* HT CPUs give the first remainder to the even thread, as
> -		   the 32nd control register */
> -		msrs->controls[i++].addr = MSR_P4_CRU_ESCR4;
> -
> -	} else {
> -		/* and two copies of the second to the odd thread,
> -		   for the 22st and 23nd control registers */
> -		msrs->controls[i++].addr = MSR_P4_CRU_ESCR5;
> -		msrs->controls[i++].addr = MSR_P4_CRU_ESCR5;
> -	}
> -}
> -
> -
> -static void pmc_setup_one_p4_counter(unsigned int ctr)
> -{
> -	int i;
> -	int const maxbind = 2;
> -	uint64_t cccr = 0;
> -	uint64_t escr = 0;
> -	unsigned int counter_bit;
> -	const struct p4_event_binding *ev = NULL;
> -	unsigned int stag;
> -
> -	stag = get_stagger();
> -	
> -	/* convert from counter *number* to counter *bit* */
> -	counter_bit = 1 << VIRT_CTR(stag, ctr);
> -	
> -	/* find our event binding structure. */
> -	if (counter_config[ctr].event <= 0 || counter_config[ctr].event > NUM_EVENTS) {
> -		printk(KERN_ERR "oprofile: P4 event code %#lx out of range\n",
> -		       counter_config[ctr].event);
> -		return;
> -	}
> -	
> -	ev = &(p4_events[counter_config[ctr].event - 1]);
> -	
> -	for (i = 0; i < maxbind; i++) {
> -		if (ev->bindings[i].virt_counter & counter_bit) {
> -
> -			/* modify ESCR */
> -			ESCR_READ(escr, ev, i);
> -			ESCR_CLEAR(escr);
> -			if (stag == 0) {
> -				ESCR_SET_USR_0(escr, counter_config[ctr].user);
> -				ESCR_SET_OS_0(escr, counter_config[ctr].kernel);
> -			} else {
> -				ESCR_SET_USR_1(escr, counter_config[ctr].user);
> -				ESCR_SET_OS_1(escr, counter_config[ctr].kernel);
> -			}
> -			ESCR_SET_EVENT_SELECT(escr, ev->event_select);
> -			ESCR_SET_EVENT_MASK(escr, counter_config[ctr].unit_mask);			
> -			ESCR_WRITE(escr, ev, i);
> -		
> -			/* modify CCCR */
> -			CCCR_READ(cccr, VIRT_CTR(stag, ctr));
> -			CCCR_CLEAR(cccr);
> -			CCCR_SET_REQUIRED_BITS(cccr);
> -			CCCR_SET_ESCR_SELECT(cccr, ev->escr_select);
> -			if (stag == 0) {
> -				CCCR_SET_PMI_OVF_0(cccr);
> -			} else {
> -				CCCR_SET_PMI_OVF_1(cccr);
> -			}
> -			CCCR_WRITE(cccr, VIRT_CTR(stag, ctr));
> -			return;
> -		}
> -	}
> -
> -	printk(KERN_ERR
> -	       "oprofile: P4 event code %#lx no binding, stag %d ctr %d\n",
> -	       counter_config[ctr].event, stag, ctr);
> -}
> -
> -
> -static void cf_check p4_setup_ctrs(struct op_msrs const * const msrs)
> -{
> -	unsigned int i;
> -	uint64_t msr_content;
> -	unsigned int addr;
> -	unsigned int stag;
> -
> -	stag = get_stagger();
> -
> -	rdmsrl(MSR_IA32_MISC_ENABLE, msr_content);
> -	if (! MISC_PMC_ENABLED_P(msr_content)) {
> -		printk(KERN_ERR "oprofile: P4 PMC not available\n");
> -		return;
> -	}
> -
> -	/* clear the cccrs we will use */
> -	for (i = 0 ; i < num_counters ; i++) {
> -		rdmsrl(p4_counters[VIRT_CTR(stag, i)].cccr_address, msr_content);
> -		CCCR_CLEAR(msr_content);
> -		CCCR_SET_REQUIRED_BITS(msr_content);
> -		wrmsrl(p4_counters[VIRT_CTR(stag, i)].cccr_address, msr_content);
> -	}
> -
> -	/* clear cccrs outside our concern */
> -	for (i = stag ; i < NUM_UNUSED_CCCRS ; i += addr_increment()) {
> -		rdmsrl(p4_unused_cccr[i], msr_content);
> -		CCCR_CLEAR(msr_content);
> -		CCCR_SET_REQUIRED_BITS(msr_content);
> -		wrmsrl(p4_unused_cccr[i], msr_content);
> -	}
> -
> -	/* clear all escrs (including those outside our concern) */
> -	for (addr = MSR_P4_BSU_ESCR0 + stag;
> -	     addr <  MSR_P4_IQ_ESCR0; addr += addr_increment()) {
> -		wrmsrl(addr, 0x0ULL);
> -	}
> -
> -	/* On older models clear also MSR_P4_IQ_ESCR0/1 */
> -	if (boot_cpu_data.x86_model < 0x3) {
> -		wrmsrl(MSR_P4_IQ_ESCR0, 0x0ULL);
> -		wrmsrl(MSR_P4_IQ_ESCR1, 0x0ULL);
> -	}
> -
> -	for (addr = MSR_P4_RAT_ESCR0 + stag;
> -	     addr <= MSR_P4_SSU_ESCR0; ++i, addr += addr_increment()) {
> -		wrmsrl(addr, 0x0ULL);
> -	}
> -	
> -	for (addr = MSR_P4_MS_ESCR0 + stag;
> -	     addr <= MSR_P4_TC_ESCR1; addr += addr_increment()){
> -		wrmsrl(addr, 0x0ULL);
> -	}
> -	
> -	for (addr = MSR_P4_IX_ESCR0 + stag;
> -	     addr <= MSR_P4_CRU_ESCR3; addr += addr_increment()){
> -		wrmsrl(addr, 0x0ULL);
> -	}
> -
> -	if (num_counters == NUM_COUNTERS_NON_HT) {		
> -		wrmsrl(MSR_P4_CRU_ESCR4, 0x0ULL);
> -		wrmsrl(MSR_P4_CRU_ESCR5, 0x0ULL);
> -	} else if (stag == 0) {
> -		wrmsrl(MSR_P4_CRU_ESCR4, 0x0ULL);
> -	} else {
> -		wrmsrl(MSR_P4_CRU_ESCR5, 0x0ULL);
> -	}		
> -	
> -	/* setup all counters */
> -	for (i = 0 ; i < num_counters ; ++i) {
> -		if (counter_config[i].enabled) {
> -			reset_value[i] = counter_config[i].count;
> -			pmc_setup_one_p4_counter(i);
> -			CTR_WRITE(counter_config[i].count, VIRT_CTR(stag, i));
> -		} else {
> -			reset_value[i] = 0;
> -		}
> -	}
> -}
> -
> -static int cf_check p4_check_ctrs(
> -	unsigned int const cpu, struct op_msrs const * const msrs,
> -	struct cpu_user_regs const * const regs)
> -{
> -	unsigned long ctr, stag, real;
> -	uint64_t msr_content;
> -	int i;
> -	int ovf = 0;
> -	unsigned long eip = regs->rip;
> -	int mode = xenoprofile_get_mode(current, regs);
> -
> -	stag = get_stagger();
> -
> -	for (i = 0; i < num_counters; ++i) {
> -		
> -		if (!reset_value[i])
> -			continue;
> -
> -		/*
> -		 * there is some eccentricity in the hardware which
> -		 * requires that we perform 2 extra corrections:
> -		 *
> -		 * - check both the CCCR:OVF flag for overflow and the
> -		 *   counter high bit for un-flagged overflows.
> -		 *
> -		 * - write the counter back twice to ensure it gets
> -		 *   updated properly.
> -		 *
> -		 * the former seems to be related to extra NMIs happening
> -		 * during the current NMI; the latter is reported as errata
> -		 * N15 in intel doc 249199-029, pentium 4 specification
> -		 * update, though their suggested work-around does not
> -		 * appear to solve the problem.
> -		 */
> -		
> -		real = VIRT_CTR(stag, i);
> -
> -		CCCR_READ(msr_content, real);
> - 		CTR_READ(ctr, real);
> -		if (CCCR_OVF_P(msr_content) || CTR_OVERFLOW_P(ctr)) {
> -			xenoprof_log_event(current, regs, eip, mode, i);
> -			CTR_WRITE(reset_value[i], real);
> -			CCCR_CLEAR_OVF(msr_content);
> -			CCCR_WRITE(msr_content, real);
> - 			CTR_WRITE(reset_value[i], real);
> -			ovf = 1;
> -		}
> -	}
> -
> -	/* P4 quirk: you have to re-unmask the apic vector */
> -	apic_write(APIC_LVTPC, apic_read(APIC_LVTPC) & ~APIC_LVT_MASKED);
> -
> -	return ovf;
> -}
> -
> -
> -static void cf_check p4_start(struct op_msrs const * const msrs)
> -{
> -	unsigned int stag;
> -	uint64_t msr_content;
> -	int i;
> -
> -	stag = get_stagger();
> -
> -	for (i = 0; i < num_counters; ++i) {
> -		if (!reset_value[i])
> -			continue;
> -		CCCR_READ(msr_content, VIRT_CTR(stag, i));
> -		CCCR_SET_ENABLE(msr_content);
> -		CCCR_WRITE(msr_content, VIRT_CTR(stag, i));
> -	}
> -}
> -
> -
> -static void cf_check p4_stop(struct op_msrs const * const msrs)
> -{
> -	unsigned int stag;
> -	uint64_t msr_content;
> -	int i;
> -
> -	stag = get_stagger();
> -
> -	for (i = 0; i < num_counters; ++i) {
> -		CCCR_READ(msr_content, VIRT_CTR(stag, i));
> -		CCCR_SET_DISABLE(msr_content);
> -		CCCR_WRITE(msr_content, VIRT_CTR(stag, i));
> -	}
> -}
> -
> -
> -struct op_x86_model_spec const op_p4_ht2_spec = {
> -	.num_counters = NUM_COUNTERS_HT2,
> -	.num_controls = NUM_CONTROLS_HT2,
> -	.fill_in_addresses = &p4_fill_in_addresses,
> -	.setup_ctrs = &p4_setup_ctrs,
> -	.check_ctrs = &p4_check_ctrs,
> -	.start = &p4_start,
> -	.stop = &p4_stop
> -};
> -
> -
> -struct op_x86_model_spec const op_p4_spec = {
> -	.num_counters = NUM_COUNTERS_NON_HT,
> -	.num_controls = NUM_CONTROLS_NON_HT,
> -	.fill_in_addresses = &p4_fill_in_addresses,
> -	.setup_ctrs = &p4_setup_ctrs,
> -	.check_ctrs = &p4_check_ctrs,
> -	.start = &p4_start,
> -	.stop = &p4_stop
> -};
> diff --git a/xen/arch/x86/oprofile/op_model_ppro.c b/xen/arch/x86/oprofile/op_model_ppro.c
> deleted file mode 100644
> index 4bbb4502c7da..000000000000
> --- a/xen/arch/x86/oprofile/op_model_ppro.c
> +++ /dev/null
> @@ -1,348 +0,0 @@
> -/**
> - * @file op_model_ppro.h
> - * pentium pro / P6 model-specific MSR operations
> - *
> - * @remark Copyright 2002 OProfile authors
> - * @remark Read the file COPYING
> - *
> - * @author John Levon
> - * @author Philippe Elie
> - * @author Graydon Hoare
> - */
> -
> -#include <xen/sched.h>
> -#include <xen/types.h>
> -#include <xen/xenoprof.h>
> -#include <xen/xvmalloc.h>
> -
> -#include <asm/msr.h>
> -#include <asm/io.h>
> -#include <asm/apic.h>
> -#include <asm/processor.h>
> -#include <asm/regs.h>
> -#include <asm/current.h>
> -#include <asm/vpmu.h>
> -
> -#include "op_x86_model.h"
> -#include "op_counter.h"
> -
> -struct arch_msr_pair {
> -    u64 counter;
> -    u64 control;
> -};
> -
> -/*
> - * Intel "Architectural Performance Monitoring" CPUID
> - * detection/enumeration details:
> - */
> -union cpuid10_eax {
> -	struct {
> -		unsigned int version_id:8;
> -		unsigned int num_counters:8;
> -		unsigned int bit_width:8;
> -		unsigned int mask_length:8;
> -	} split;
> -	unsigned int full;
> -};
> -
> -static int num_counters = 2;
> -static int counter_width = 32;
> -
> -#define CTR_OVERFLOWED(n) (!((n) & (1ULL<<(counter_width-1))))
> -
> -#define CTRL_READ(msr_content,msrs,c) do {rdmsrl((msrs->controls[(c)].addr), (msr_content));} while (0)
> -#define CTRL_WRITE(msr_content,msrs,c) do {wrmsrl((msrs->controls[(c)].addr), (msr_content));} while (0)
> -#define CTRL_SET_ACTIVE(n) (n |= (1ULL<<22))
> -#define CTRL_SET_INACTIVE(n) (n &= ~(1ULL<<22))
> -#define CTRL_CLEAR(x) (x &= (1ULL<<21))
> -#define CTRL_SET_ENABLE(val) (val |= 1ULL<<20)
> -#define CTRL_SET_USR(val,u) (val |= ((u & 1ULL) << 16))
> -#define CTRL_SET_KERN(val,k) (val |= ((k & 1ULL) << 17))
> -#define CTRL_SET_UM(val, m) (val |= (m << 8))
> -#define CTRL_SET_EVENT(val, e) (val |= e)
> -#define IS_ACTIVE(val) (val & (1ULL << 22) )
> -#define IS_ENABLE(val) (val & (1ULL << 20) )
> -static unsigned long reset_value[OP_MAX_COUNTER];
> -int ppro_has_global_ctrl = 0;
> -
> -static void cf_check ppro_fill_in_addresses(struct op_msrs * const msrs)
> -{
> -	int i;
> -
> -	for (i = 0; i < num_counters; i++)
> -		msrs->counters[i].addr = MSR_P6_PERFCTR(i);
> -	for (i = 0; i < num_counters; i++)
> -		msrs->controls[i].addr = MSR_P6_EVNTSEL(i);
> -}
> -
> -
> -static void cf_check ppro_setup_ctrs(struct op_msrs const * const msrs)
> -{
> -	uint64_t msr_content;
> -	int i;
> -
> -	if (cpu_has_arch_perfmon) {
> -		union cpuid10_eax eax;
> -		eax.full = cpuid_eax(0xa);
> -
> -		/*
> -		 * For Core2 (family 6, model 15), don't reset the
> -		 * counter width:
> -		 */
> -		if (!(eax.split.version_id == 0 &&
> -			current_cpu_data.x86 == 6 &&
> -				current_cpu_data.x86_model == 15)) {
> -
> -			if (counter_width < eax.split.bit_width)
> -				counter_width = eax.split.bit_width;
> -		}
> -	}
> -
> -	/* clear all counters */
> -	for (i = 0 ; i < num_counters; ++i) {
> -		CTRL_READ(msr_content, msrs, i);
> -		CTRL_CLEAR(msr_content);
> -		CTRL_WRITE(msr_content, msrs, i);
> -	}
> -
> -	/* avoid a false detection of ctr overflows in NMI handler */
> -	for (i = 0; i < num_counters; ++i)
> -		wrmsrl(msrs->counters[i].addr, ~0x0ULL);
> -
> -	/* enable active counters */
> -	for (i = 0; i < num_counters; ++i) {
> -		if (counter_config[i].enabled) {
> -			reset_value[i] = counter_config[i].count;
> -
> -			wrmsrl(msrs->counters[i].addr, -reset_value[i]);
> -
> -			CTRL_READ(msr_content, msrs, i);
> -			CTRL_CLEAR(msr_content);
> -			CTRL_SET_ENABLE(msr_content);
> -			CTRL_SET_USR(msr_content, counter_config[i].user);
> -			CTRL_SET_KERN(msr_content, counter_config[i].kernel);
> -			CTRL_SET_UM(msr_content, counter_config[i].unit_mask);
> -			CTRL_SET_EVENT(msr_content, counter_config[i].event);
> -			CTRL_WRITE(msr_content, msrs, i);
> -		} else {
> -			reset_value[i] = 0;
> -		}
> -	}
> -}
> -
> -static int cf_check ppro_check_ctrs(
> -	unsigned int const cpu, struct op_msrs const * const msrs,
> -	struct cpu_user_regs const * const regs)
> -{
> -	u64 val;
> -	int i;
> -	int ovf = 0;
> -	unsigned long eip = regs->rip;
> -	int mode = xenoprofile_get_mode(current, regs);
> -	struct arch_msr_pair *msrs_content = vcpu_vpmu(current)->context;
> -
> -	for (i = 0 ; i < num_counters; ++i) {
> -		if (!reset_value[i])
> -			continue;
> -		rdmsrl(msrs->counters[i].addr, val);
> -		if (CTR_OVERFLOWED(val)) {
> -			xenoprof_log_event(current, regs, eip, mode, i);
> -			wrmsrl(msrs->counters[i].addr, -reset_value[i]);
> -			if ( is_passive(current->domain) && (mode != 2) &&
> -				vpmu_is_set(vcpu_vpmu(current),
> -                                            VPMU_PASSIVE_DOMAIN_ALLOCATED) )
> -			{
> -				if ( IS_ACTIVE(msrs_content[i].control) )
> -				{
> -					msrs_content[i].counter = val;
> -					if ( IS_ENABLE(msrs_content[i].control) )
> -						ovf = 2;
> -				}
> -			}
> -			if ( !ovf )
> -				ovf = 1;
> -		}
> -	}
> -
> -	/* Only P6 based Pentium M need to re-unmask the apic vector but it
> -	 * doesn't hurt other P6 variant */
> -	apic_write(APIC_LVTPC, apic_read(APIC_LVTPC) & ~APIC_LVT_MASKED);
> -
> -	return ovf;
> -}
> -
> -
> -static void cf_check ppro_start(struct op_msrs const * const msrs)
> -{
> -	uint64_t msr_content;
> -	int i;
> -
> -	for (i = 0; i < num_counters; ++i) {
> -		if (reset_value[i]) {
> -			CTRL_READ(msr_content, msrs, i);
> -			CTRL_SET_ACTIVE(msr_content);
> -			CTRL_WRITE(msr_content, msrs, i);
> -		}
> -	}
> -    /* Global Control MSR is enabled by default when system power on.
> -     * However, this may not hold true when xenoprof starts to run.
> -     */
> -    if ( ppro_has_global_ctrl )
> -        wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, (1ULL<<num_counters) - 1);
> -}
> -
> -
> -static void cf_check ppro_stop(struct op_msrs const * const msrs)
> -{
> -	uint64_t msr_content;
> -	int i;
> -
> -	for (i = 0; i < num_counters; ++i) {
> -		if (!reset_value[i])
> -			continue;
> -		CTRL_READ(msr_content, msrs, i);
> -		CTRL_SET_INACTIVE(msr_content);
> -		CTRL_WRITE(msr_content, msrs, i);
> -	}
> -    if ( ppro_has_global_ctrl )
> -        wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, 0x0ULL);
> -}
> -
> -static int cf_check ppro_is_arch_pmu_msr(u64 msr_index, int *type, int *index)
> -{
> -	if ( (msr_index >= MSR_IA32_PERFCTR0) &&
> -            (msr_index < (MSR_IA32_PERFCTR0 + num_counters)) )
> -	{
> -		*type = MSR_TYPE_ARCH_COUNTER;
> -		*index = msr_index - MSR_IA32_PERFCTR0;
> -		return 1;
> -        }
> -        if ( (msr_index >= MSR_P6_EVNTSEL(0)) &&
> -            (msr_index < (MSR_P6_EVNTSEL(num_counters))) )
> -        {
> -		*type = MSR_TYPE_ARCH_CTRL;
> -		*index = msr_index - MSR_P6_EVNTSEL(0);
> -		return 1;
> -        }
> -
> -        return 0;
> -}
> -
> -static int cf_check ppro_allocate_msr(struct vcpu *v)
> -{
> -	struct vpmu_struct *vpmu = vcpu_vpmu(v);
> -	struct arch_msr_pair *msr_content;
> -
> -	msr_content = xvzalloc_array(struct arch_msr_pair, num_counters);
> -	if ( !msr_content )
> -		goto out;
> -	vpmu->context = (void *)msr_content;
> -	vpmu_clear(vpmu);
> -	vpmu_set(vpmu, VPMU_PASSIVE_DOMAIN_ALLOCATED);
> -	return 1;
> -out:
> -	printk(XENLOG_G_WARNING "Insufficient memory for oprofile,"
> -	       " oprofile is unavailable on dom%d vcpu%d\n",
> -	       v->vcpu_id, v->domain->domain_id);
> -	return 0;
> -}
> -
> -static void cf_check ppro_free_msr(struct vcpu *v)
> -{
> -	struct vpmu_struct *vpmu = vcpu_vpmu(v);
> -
> -	if ( !vpmu_is_set(vpmu, VPMU_PASSIVE_DOMAIN_ALLOCATED) )
> -		return;
> -	XVFREE(vpmu->context);
> -	vpmu_reset(vpmu, VPMU_PASSIVE_DOMAIN_ALLOCATED);
> -}
> -
> -static void cf_check ppro_load_msr(
> -	struct vcpu *v, int type, int index, u64 *msr_content)
> -{
> -	struct arch_msr_pair *msrs = vcpu_vpmu(v)->context;
> -	switch ( type )
> -	{
> -	case MSR_TYPE_ARCH_COUNTER:
> -		*msr_content = msrs[index].counter;
> -		break;
> -	case MSR_TYPE_ARCH_CTRL:
> -		*msr_content = msrs[index].control;
> -		break;
> -	}
> -}
> -
> -static void cf_check ppro_save_msr(
> -	struct vcpu *v, int type, int index, u64 msr_content)
> -{
> -	struct arch_msr_pair *msrs = vcpu_vpmu(v)->context;
> -
> -	switch ( type )
> -	{
> -	case MSR_TYPE_ARCH_COUNTER:
> -		msrs[index].counter = msr_content;
> -		break;
> -	case MSR_TYPE_ARCH_CTRL:
> -		msrs[index].control = msr_content;
> -		break;
> -	}
> -}
> -
> -/*
> - * Architectural performance monitoring.
> - *
> - * Newer Intel CPUs (Core1+) have support for architectural
> - * events described in CPUID 0xA. See the IA32 SDM Vol3b.18 for details.
> - * The advantage of this is that it can be done without knowing about
> - * the specific CPU.
> - */
> -void arch_perfmon_setup_counters(void)
> -{
> -	union cpuid10_eax eax;
> -
> -	eax.full = cpuid_eax(0xa);
> -
> -	/* Workaround for BIOS bugs in 6/15. Taken from perfmon2 */
> -	if (eax.split.version_id == 0 && current_cpu_data.x86 == 6 &&
> -	    current_cpu_data.x86_model == 15) {
> -		eax.split.version_id = 2;
> -		eax.split.num_counters = 2;
> -		eax.split.bit_width = 40;
> -	}
> -
> -	num_counters = min_t(u8, eax.split.num_counters, OP_MAX_COUNTER);
> -
> -	op_arch_perfmon_spec.num_counters = num_counters;
> -	op_arch_perfmon_spec.num_controls = num_counters;
> -	op_ppro_spec.num_counters = num_counters;
> -	op_ppro_spec.num_controls = num_counters;
> -}
> -
> -struct op_x86_model_spec __read_mostly op_ppro_spec = {
> -	.num_counters = 2,
> -	.num_controls = 2,
> -	.fill_in_addresses = &ppro_fill_in_addresses,
> -	.setup_ctrs = &ppro_setup_ctrs,
> -	.check_ctrs = &ppro_check_ctrs,
> -	.start = &ppro_start,
> -	.stop = &ppro_stop,
> -	.is_arch_pmu_msr = &ppro_is_arch_pmu_msr,
> -	.allocated_msr = &ppro_allocate_msr,
> -	.free_msr = &ppro_free_msr,
> -	.load_msr = &ppro_load_msr,
> -	.save_msr = &ppro_save_msr
> -};
> -
> -struct op_x86_model_spec __read_mostly op_arch_perfmon_spec = {
> -	/* num_counters/num_controls filled in at runtime */
> -	.fill_in_addresses = &ppro_fill_in_addresses,
> -	.setup_ctrs = &ppro_setup_ctrs,
> -	.check_ctrs = &ppro_check_ctrs,
> -	.start = &ppro_start,
> -	.stop = &ppro_stop,
> -	.is_arch_pmu_msr = &ppro_is_arch_pmu_msr,
> -	.allocated_msr = &ppro_allocate_msr,
> -	.free_msr = &ppro_free_msr,
> -	.load_msr = &ppro_load_msr,
> -	.save_msr = &ppro_save_msr
> -};
> diff --git a/xen/arch/x86/oprofile/op_x86_model.h b/xen/arch/x86/oprofile/op_x86_model.h
> deleted file mode 100644
> index 35bc3c1e222c..000000000000
> --- a/xen/arch/x86/oprofile/op_x86_model.h
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -/**
> - * @file op_x86_model.h
> - * interface to x86 model-specific MSR operations
> - *
> - * @remark Copyright 2002 OProfile authors
> - * @remark Read the file COPYING
> - *
> - * @author Graydon Hoare
> - */
> -
> -#ifndef OP_X86_MODEL_H
> -#define OP_X86_MODEL_H
> -
> -struct op_msr {
> -	unsigned long addr;
> -	uint64_t value;
> -};
> -
> -struct op_msrs {
> -	struct op_msr * counters;
> -	struct op_msr * controls;
> -};
> -
> -struct pt_regs;
> -
> -/* The model vtable abstracts the differences between
> - * various x86 CPU model's perfctr support.
> - */
> -struct op_x86_model_spec {
> -	unsigned int num_counters;
> -	unsigned int num_controls;
> -	void (*fill_in_addresses)(struct op_msrs * const msrs);
> -	void (*setup_ctrs)(struct op_msrs const * const msrs);
> -	int (*check_ctrs)(unsigned int const cpu,
> -			  struct op_msrs const * const msrs,
> -			  struct cpu_user_regs const * const regs);
> -	void (*start)(struct op_msrs const * const msrs);
> -	void (*stop)(struct op_msrs const * const msrs);
> -	int (*is_arch_pmu_msr)(u64 msr_index, int *type, int *index);
> -	int (*allocated_msr)(struct vcpu *v);
> -	void (*free_msr)(struct vcpu *v);
> -	void (*load_msr)(struct vcpu * const v, int type, int index, u64 *msr_content);
> -        void (*save_msr)(struct vcpu * const v, int type, int index, u64 msr_content);
> -};
> -
> -extern struct op_x86_model_spec op_ppro_spec;
> -extern struct op_x86_model_spec op_arch_perfmon_spec;
> -extern struct op_x86_model_spec const op_p4_spec;
> -extern struct op_x86_model_spec const op_p4_ht2_spec;
> -extern struct op_x86_model_spec const op_athlon_spec;
> -extern struct op_x86_model_spec const op_amd_fam15h_spec;
> -
> -void arch_perfmon_setup_counters(void);
> -
> -extern int ppro_has_global_ctrl;
> -extern struct op_x86_model_spec const *model;
> -
> -#endif /* OP_X86_MODEL_H */
> diff --git a/xen/arch/x86/oprofile/xenoprof.c b/xen/arch/x86/oprofile/xenoprof.c
> deleted file mode 100644
> index 7f2525bfb4d6..000000000000
> --- a/xen/arch/x86/oprofile/xenoprof.c
> +++ /dev/null
> @@ -1,106 +0,0 @@
> -/*
> - * Copyright (C) 2005 Hewlett-Packard Co.
> - * written by Aravind Menon & Jose Renato Santos
> - *            (email: xenoprof@groups.hp.com)
> - *
> - * Copyright (c) 2006 Isaku Yamahata <yamahata at valinux co jp>
> - *                    VA Linux Systems Japan K.K.
> - * x86 specific part
> - */
> -
> -#include <xen/guest_access.h>
> -#include <xen/sched.h>
> -#include <xen/xenoprof.h>
> -#include <public/xenoprof.h>
> -
> -#include "op_counter.h"
> -
> -int xenoprof_arch_counter(XEN_GUEST_HANDLE_PARAM(void) arg)
> -{
> -    struct xenoprof_counter counter;
> -
> -    if ( copy_from_guest(&counter, arg, 1) )
> -        return -EFAULT;
> -
> -    if ( counter.ind >= OP_MAX_COUNTER )
> -        return -E2BIG;
> -
> -    counter_config[counter.ind].count     = counter.count;
> -    counter_config[counter.ind].enabled   = counter.enabled;
> -    counter_config[counter.ind].event     = counter.event;
> -    counter_config[counter.ind].kernel    = counter.kernel;
> -    counter_config[counter.ind].user      = counter.user;
> -    counter_config[counter.ind].unit_mask = counter.unit_mask;
> -
> -    return 0;
> -}
> -
> -int xenoprof_arch_ibs_counter(XEN_GUEST_HANDLE_PARAM(void) arg)
> -{
> -    struct xenoprof_ibs_counter ibs_counter;
> -
> -    if ( copy_from_guest(&ibs_counter, arg, 1) )
> -        return -EFAULT;
> -
> -    ibs_config.op_enabled = ibs_counter.op_enabled;
> -    ibs_config.fetch_enabled = ibs_counter.fetch_enabled;
> -    ibs_config.max_cnt_fetch = ibs_counter.max_cnt_fetch;
> -    ibs_config.max_cnt_op = ibs_counter.max_cnt_op;
> -    ibs_config.rand_en = ibs_counter.rand_en;
> -    ibs_config.dispatched_ops = ibs_counter.dispatched_ops;
> -
> -    return 0;
> -}
> -
> -#ifdef CONFIG_COMPAT
> -#include <compat/xenoprof.h>
> -
> -int compat_oprof_arch_counter(XEN_GUEST_HANDLE_PARAM(void) arg)
> -{
> -    struct compat_oprof_counter counter;
> -
> -    if ( copy_from_guest(&counter, arg, 1) )
> -        return -EFAULT;
> -
> -    if ( counter.ind >= OP_MAX_COUNTER )
> -        return -E2BIG;
> -
> -    counter_config[counter.ind].count     = counter.count;
> -    counter_config[counter.ind].enabled   = counter.enabled;
> -    counter_config[counter.ind].event     = counter.event;
> -    counter_config[counter.ind].kernel    = counter.kernel;
> -    counter_config[counter.ind].user      = counter.user;
> -    counter_config[counter.ind].unit_mask = counter.unit_mask;
> -
> -    return 0;
> -}
> -#endif
> -
> -int xenoprofile_get_mode(struct vcpu *curr, const struct cpu_user_regs *regs)
> -{
> -    if ( !guest_mode(regs) )
> -        return 2;
> -
> -    if ( !is_hvm_vcpu(curr) )
> -        return guest_kernel_mode(curr, regs);
> -
> -    switch ( hvm_guest_x86_mode(curr) )
> -    {
> -    case X86_MODE_REAL:
> -        return 1;
> -    case X86_MODE_VM86:
> -        return 0;
> -    default: /* 16BIT | 32BIT | 64BIT */
> -        return hvm_get_cpl(curr) != 3;
> -    }
> -}
> -
> -/*
> - * Local variables:
> - * mode: C
> - * c-file-style: "BSD"
> - * c-basic-offset: 4
> - * tab-width: 4
> - * indent-tabs-mode: nil
> - * End:
> - */
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index 6ba7ae5202ca..f621b99a5fcc 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -50,7 +50,6 @@
>   #include <asm/system.h>
>   #include <asm/traps.h>
>   #include <asm/uaccess.h>
> -#include <asm/xenoprof.h>
>   
>   /*
>    * opt_nmi: one of 'ignore', 'dom0', or 'fatal'.
> @@ -1943,9 +1942,6 @@ bool nmi_check_continuation(void)
>       if ( pci_serr_nmicont() )
>           ret = true;
>   
> -    if ( nmi_oprofile_send_virq() )
> -        ret = true;
> -
>       return ret;
>   }
>   
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 401d5046f6f5..38320b248a90 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -374,17 +374,6 @@ config EFI_SET_VIRTUAL_ADDRESS_MAP
>   
>         If unsure, say N.
>   
> -config XENOPROF
> -	bool "Xen Oprofile Support" if EXPERT
> -	depends on X86
> -	help
> -	  Xen OProfile (Xenoprof) is a system-wide profiler for Xen virtual
> -	  machine environments, capable of profiling the Xen virtual machine
> -	  monitor, multiple Linux guest operating systems, and applications
> -	  running on them.
> -
> -	  If unsure, say Y.
> -
>   config XSM
>   	bool "Xen Security Modules support"
>   	default ARM
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 8486c0b5106d..92c97d641e67 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -63,7 +63,6 @@ obj-$(CONFIG_HAS_VMAP) += vmap.o
>   obj-y += vsprintf.o
>   obj-y += wait.o
>   obj-bin-y += warning.init.o
> -obj-$(CONFIG_XENOPROF) += xenoprof.o
>   obj-y += xmalloc_tlsf.o
>   
>   obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd earlycpio,$(n).init.o)
> diff --git a/xen/common/compat/xenoprof.c b/xen/common/compat/xenoprof.c
> deleted file mode 100644
> index 8fbd86c24c01..000000000000
> --- a/xen/common/compat/xenoprof.c
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -/*
> - * compat/xenoprof.c
> - */
> -
> -#include <compat/xenoprof.h>
> -
> -#define COMPAT
> -#define ret_t int
> -
> -#define do_xenoprof_op compat_xenoprof_op
> -
> -#define xen_oprof_init xenoprof_init
> -CHECK_oprof_init;
> -#undef xen_oprof_init
> -
> -#define xenoprof_get_buffer compat_oprof_get_buffer
> -#define xenoprof_op_get_buffer compat_oprof_op_get_buffer
> -#define xenoprof_arch_counter compat_oprof_arch_counter
> -
> -#define xen_domid_t domid_t
> -#define compat_domid_t domid_compat_t
> -CHECK_TYPE(domid);
> -#undef compat_domid_t
> -#undef xen_domid_t
> -
> -#define xen_oprof_passive xenoprof_passive
> -CHECK_oprof_passive;
> -#undef xen_oprof_passive
> -
> -#define xenoprof_counter compat_oprof_counter
> -
> -#include "../xenoprof.c"
> -
> -/*
> - * Local variables:
> - * mode: C
> - * c-file-style: "BSD"
> - * c-basic-offset: 4
> - * tab-width: 4
> - * indent-tabs-mode: nil
> - * End:
> - */
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 93c71bc766b0..2f4fd844441e 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -31,7 +31,6 @@
>   #include <xen/rcupdate.h>
>   #include <xen/wait.h>
>   #include <xen/grant_table.h>
> -#include <xen/xenoprof.h>
>   #include <xen/irq.h>
>   #include <xen/argo.h>
>   #include <xen/llc-coloring.h>
> @@ -1452,11 +1451,6 @@ static void cf_check complete_domain_destroy(struct rcu_head *head)
>   
>       sched_destroy_domain(d);
>   
> -    /* Free page used by xen oprofile buffer. */
> -#ifdef CONFIG_XENOPROF
> -    free_xenoprof_pages(d);
> -#endif
> -
>   #ifdef CONFIG_MEM_PAGING
>       xfree(d->vm_event_paging);
>   #endif
> diff --git a/xen/common/xenoprof.c b/xen/common/xenoprof.c
> deleted file mode 100644
> index 1926a92fe481..000000000000
> --- a/xen/common/xenoprof.c
> +++ /dev/null
> @@ -1,977 +0,0 @@
> -/*
> - * Copyright (C) 2005 Hewlett-Packard Co.
> - * written by Aravind Menon & Jose Renato Santos
> - *            (email: xenoprof@groups.hp.com)
> - *
> - * arch generic xenoprof and IA64 support.
> - * dynamic map/unmap xenoprof buffer support.
> - * Copyright (c) 2006 Isaku Yamahata <yamahata at valinux co jp>
> - *                    VA Linux Systems Japan K.K.
> - */
> -
> -#ifndef COMPAT
> -#include <xen/guest_access.h>
> -#include <xen/sched.h>
> -#include <xen/event.h>
> -#include <xen/xenoprof.h>
> -#include <public/xenoprof.h>
> -#include <xen/paging.h>
> -#include <xsm/xsm.h>
> -#include <xen/hypercall.h>
> -
> -/* Override macros from asm/page.h to make them work with mfn_t */
> -#undef virt_to_mfn
> -#define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> -
> -#define XENOPROF_DOMAIN_IGNORED    0
> -#define XENOPROF_DOMAIN_ACTIVE     1
> -#define XENOPROF_DOMAIN_PASSIVE    2
> -
> -#define XENOPROF_IDLE              0
> -#define XENOPROF_INITIALIZED       1
> -#define XENOPROF_COUNTERS_RESERVED 2
> -#define XENOPROF_READY             3
> -#define XENOPROF_PROFILING         4
> -
> -#ifndef CONFIG_COMPAT
> -#define XENOPROF_COMPAT(x) false
> -typedef struct xenoprof_buf xenoprof_buf_t;
> -#define xenoprof_buf(d, b, field) ACCESS_ONCE((b)->field)
> -#else
> -#include <compat/xenoprof.h>
> -#define XENOPROF_COMPAT(x) ((x)->is_compat)
> -typedef union {
> -    struct xenoprof_buf native;
> -    struct compat_oprof_buf compat;
> -} xenoprof_buf_t;
> -#define xenoprof_buf(d, b, field) ACCESS_ONCE(*(!(d)->xenoprof->is_compat \
> -                                                ? &(b)->native.field \
> -                                                : &(b)->compat.field))
> -#endif
> -
> -/* Limit amount of pages used for shared buffer (per domain) */
> -#define MAX_OPROF_SHARED_PAGES 32
> -
> -/* Lock protecting the following global state */
> -static DEFINE_SPINLOCK(xenoprof_lock);
> -
> -static DEFINE_SPINLOCK(pmu_owner_lock);
> -int pmu_owner = 0;
> -int pmu_hvm_refcount = 0;
> -
> -struct xenoprof_vcpu {
> -    int event_size;
> -    xenoprof_buf_t *buffer;
> -};
> -
> -struct xenoprof {
> -    char *rawbuf;
> -    int npages;
> -    int nbuf;
> -    int bufsize;
> -    int domain_type;
> -#ifdef CONFIG_COMPAT
> -    bool is_compat;
> -#endif
> -    struct xenoprof_vcpu *vcpu;
> -};
> -
> -static struct domain *active_domains[MAX_OPROF_DOMAINS];
> -static int active_ready[MAX_OPROF_DOMAINS];
> -static unsigned int adomains;
> -
> -static struct domain *passive_domains[MAX_OPROF_DOMAINS];
> -static unsigned int pdomains;
> -
> -static unsigned int activated;
> -static struct domain *xenoprof_primary_profiler;
> -static int xenoprof_state = XENOPROF_IDLE;
> -static unsigned long backtrace_depth;
> -
> -static u64 total_samples;
> -static u64 invalid_buffer_samples;
> -static u64 corrupted_buffer_samples;
> -static u64 lost_samples;
> -static u64 active_samples;
> -static u64 passive_samples;
> -static u64 idle_samples;
> -static u64 others_samples;
> -
> -int acquire_pmu_ownership(int pmu_ownership)
> -{
> -    spin_lock(&pmu_owner_lock);
> -    if ( pmu_owner == PMU_OWNER_NONE )
> -    {
> -        pmu_owner = pmu_ownership;
> -        goto out;
> -    }
> -
> -    if ( pmu_owner == pmu_ownership )
> -        goto out;
> -
> -    spin_unlock(&pmu_owner_lock);
> -    return 0;
> - out:
> -    if ( pmu_owner == PMU_OWNER_HVM )
> -        pmu_hvm_refcount++;
> -    spin_unlock(&pmu_owner_lock);
> -    return 1;
> -}
> -
> -void release_pmu_ownership(int pmu_ownership)
> -{
> -    spin_lock(&pmu_owner_lock);
> -    if ( pmu_ownership == PMU_OWNER_HVM )
> -        pmu_hvm_refcount--;
> -    if ( !pmu_hvm_refcount )
> -        pmu_owner = PMU_OWNER_NONE;
> -    spin_unlock(&pmu_owner_lock);
> -}
> -
> -int is_active(struct domain *d)
> -{
> -    struct xenoprof *x = d->xenoprof;
> -    return ((x != NULL) && (x->domain_type == XENOPROF_DOMAIN_ACTIVE));
> -}
> -
> -int is_passive(struct domain *d)
> -{
> -    struct xenoprof *x = d->xenoprof;
> -    return ((x != NULL) && (x->domain_type == XENOPROF_DOMAIN_PASSIVE));
> -}
> -
> -static int is_profiled(struct domain *d)
> -{
> -    return (is_active(d) || is_passive(d));
> -}
> -
> -static void xenoprof_reset_stat(void)
> -{
> -    total_samples = 0;
> -    invalid_buffer_samples = 0;
> -    corrupted_buffer_samples = 0;
> -    lost_samples = 0;
> -    active_samples = 0;
> -    passive_samples = 0;
> -    idle_samples = 0;
> -    others_samples = 0;
> -}
> -
> -static void xenoprof_reset_buf(struct domain *d)
> -{
> -    int j;
> -    xenoprof_buf_t *buf;
> -
> -    if ( d->xenoprof == NULL )
> -    {
> -        printk("xenoprof_reset_buf: ERROR - Unexpected "
> -               "Xenoprof NULL pointer \n");
> -        return;
> -    }
> -
> -    for ( j = 0; j < d->max_vcpus; j++ )
> -    {
> -        buf = d->xenoprof->vcpu[j].buffer;
> -        if ( buf != NULL )
> -        {
> -            xenoprof_buf(d, buf, event_head) = 0;
> -            xenoprof_buf(d, buf, event_tail) = 0;
> -        }
> -    }
> -}
> -
> -static int
> -share_xenoprof_page_with_guest(struct domain *d, mfn_t mfn, int npages)
> -{
> -    int i;
> -
> -    /* Check if previous page owner has released the page. */
> -    for ( i = 0; i < npages; i++ )
> -    {
> -        struct page_info *page = mfn_to_page(mfn_add(mfn, i));
> -
> -        if ( (page->count_info & (PGC_allocated|PGC_count_mask)) != 0 )
> -        {
> -            printk(XENLOG_G_INFO "dom%d mfn %#lx page->count_info %#lx\n",
> -                   d->domain_id, mfn_x(mfn_add(mfn, i)), page->count_info);
> -            return -EBUSY;
> -        }
> -        page_set_owner(page, NULL);
> -    }
> -
> -    for ( i = 0; i < npages; i++ )
> -        share_xen_page_with_guest(mfn_to_page(mfn_add(mfn, i)), d, SHARE_rw);
> -
> -    return 0;
> -}
> -
> -static void
> -unshare_xenoprof_page_with_guest(struct xenoprof *x)
> -{
> -    int i, npages = x->npages;
> -    mfn_t mfn = virt_to_mfn(x->rawbuf);
> -
> -    for ( i = 0; i < npages; i++ )
> -    {
> -        struct page_info *page = mfn_to_page(mfn_add(mfn, i));
> -
> -        BUG_ON(page_get_owner(page) != current->domain);
> -        put_page_alloc_ref(page);
> -    }
> -}
> -
> -static void
> -xenoprof_shared_gmfn_with_guest(
> -    struct domain *d, unsigned long maddr, unsigned long gmaddr, int npages)
> -{
> -    int i;
> -
> -    for ( i = 0; i < npages; i++, maddr += PAGE_SIZE, gmaddr += PAGE_SIZE )
> -    {
> -        BUG_ON(page_get_owner(maddr_to_page(maddr)) != d);
> -        if ( i == 0 )
> -            gdprintk(XENLOG_WARNING,
> -                     "xenoprof unsupported with autotranslated guests\n");
> -
> -    }
> -}
> -
> -static int alloc_xenoprof_struct(
> -    struct domain *d, int max_samples, int is_passive)
> -{
> -    struct vcpu *v;
> -    int nvcpu, npages, bufsize, max_bufsize;
> -    unsigned max_max_samples;
> -    int i;
> -
> -    nvcpu = 0;
> -    for_each_vcpu ( d, v )
> -        nvcpu++;
> -
> -    if ( !nvcpu )
> -        return -EINVAL;
> -
> -    d->xenoprof = xzalloc(struct xenoprof);
> -    if ( d->xenoprof == NULL )
> -    {
> -        printk("alloc_xenoprof_struct(): memory allocation failed\n");
> -        return -ENOMEM;
> -    }
> -
> -    d->xenoprof->vcpu = xzalloc_array(struct xenoprof_vcpu, d->max_vcpus);
> -    if ( d->xenoprof->vcpu == NULL )
> -    {
> -        xfree(d->xenoprof);
> -        d->xenoprof = NULL;
> -        printk("alloc_xenoprof_struct(): vcpu array allocation failed\n");
> -        return -ENOMEM;
> -    }
> -
> -    bufsize = sizeof(struct xenoprof_buf);
> -    i = sizeof(struct event_log);
> -#ifdef CONFIG_COMPAT
> -    d->xenoprof->is_compat = is_pv_32bit_domain(is_passive ? hardware_domain : d);
> -    if ( XENOPROF_COMPAT(d->xenoprof) )
> -    {
> -        bufsize = sizeof(struct compat_oprof_buf);
> -        i = sizeof(struct compat_event_log);
> -    }
> -#endif
> -
> -    /* reduce max_samples if necessary to limit pages allocated */
> -    max_bufsize = (MAX_OPROF_SHARED_PAGES * PAGE_SIZE) / nvcpu;
> -    max_max_samples = ( (max_bufsize - bufsize) / i ) + 1;
> -    if ( (unsigned)max_samples > max_max_samples )
> -        max_samples = max_max_samples;
> -
> -    bufsize += (max_samples - 1) * i;
> -    npages = (nvcpu * bufsize - 1) / PAGE_SIZE + 1;
> -
> -    d->xenoprof->rawbuf = alloc_xenheap_pages(get_order_from_pages(npages), 0);
> -    if ( d->xenoprof->rawbuf == NULL )
> -    {
> -        xfree(d->xenoprof->vcpu);
> -        xfree(d->xenoprof);
> -        d->xenoprof = NULL;
> -        return -ENOMEM;
> -    }
> -
> -    for ( i = 0; i < npages; ++i )
> -        clear_page(d->xenoprof->rawbuf + i * PAGE_SIZE);
> -
> -    d->xenoprof->npages = npages;
> -    d->xenoprof->nbuf = nvcpu;
> -    d->xenoprof->bufsize = bufsize;
> -    d->xenoprof->domain_type = XENOPROF_DOMAIN_IGNORED;
> -
> -    /* Update buffer pointers for active vcpus */
> -    i = 0;
> -    for_each_vcpu ( d, v )
> -    {
> -        xenoprof_buf_t *buf = (xenoprof_buf_t *)
> -            &d->xenoprof->rawbuf[i * bufsize];
> -
> -        d->xenoprof->vcpu[v->vcpu_id].event_size = max_samples;
> -        d->xenoprof->vcpu[v->vcpu_id].buffer = buf;
> -        xenoprof_buf(d, buf, event_size) = max_samples;
> -        xenoprof_buf(d, buf, vcpu_id) = v->vcpu_id;
> -
> -        i++;
> -        /* in the unlikely case that the number of active vcpus changes */
> -        if ( i >= nvcpu )
> -            break;
> -    }
> -
> -    return 0;
> -}
> -
> -void free_xenoprof_pages(struct domain *d)
> -{
> -    struct xenoprof *x;
> -    int order;
> -
> -    x = d->xenoprof;
> -    if ( x == NULL )
> -        return;
> -
> -    if ( x->rawbuf != NULL )
> -    {
> -        order = get_order_from_pages(x->npages);
> -        free_xenheap_pages(x->rawbuf, order);
> -    }
> -
> -    xfree(x->vcpu);
> -    xfree(x);
> -    d->xenoprof = NULL;
> -}
> -
> -static int active_index(struct domain *d)
> -{
> -    int i;
> -
> -    for ( i = 0; i < adomains; i++ )
> -        if ( active_domains[i] == d )
> -            return i;
> -
> -    return -1;
> -}
> -
> -static int set_active(struct domain *d)
> -{
> -    int ind;
> -    struct xenoprof *x;
> -
> -    ind = active_index(d);
> -    if ( ind < 0 )
> -        return -EPERM;
> -
> -    x = d->xenoprof;
> -    if ( x == NULL )
> -        return -EPERM;
> -
> -    x->domain_type = XENOPROF_DOMAIN_ACTIVE;
> -    active_ready[ind] = 1;
> -    activated++;
> -
> -    return 0;
> -}
> -
> -static int reset_active(struct domain *d)
> -{
> -    int ind;
> -    struct xenoprof *x;
> -
> -    ind = active_index(d);
> -    if ( ind < 0 )
> -        return -EPERM;
> -
> -    x = d->xenoprof;
> -    if ( x == NULL )
> -        return -EPERM;
> -
> -    x->domain_type = XENOPROF_DOMAIN_IGNORED;
> -    active_ready[ind] = 0;
> -    active_domains[ind] = NULL;
> -    activated--;
> -    put_domain(d);
> -
> -    if ( activated <= 0 )
> -        adomains = 0;
> -
> -    return 0;
> -}
> -
> -static void reset_passive(struct domain *d)
> -{
> -    struct xenoprof *x;
> -
> -    if ( d == NULL )
> -        return;
> -
> -    x = d->xenoprof;
> -    if ( x == NULL )
> -        return;
> -
> -    x->domain_type = XENOPROF_DOMAIN_IGNORED;
> -    unshare_xenoprof_page_with_guest(x);
> -}
> -
> -static void reset_active_list(void)
> -{
> -    int i;
> -
> -    for ( i = 0; i < adomains; i++ )
> -        if ( active_ready[i] )
> -            reset_active(active_domains[i]);
> -
> -    adomains = 0;
> -    activated = 0;
> -}
> -
> -static void reset_passive_list(void)
> -{
> -    int i;
> -
> -    for ( i = 0; i < pdomains; i++ )
> -    {
> -        reset_passive(passive_domains[i]);
> -        put_domain(passive_domains[i]);
> -        passive_domains[i] = NULL;
> -    }
> -
> -    pdomains = 0;
> -}
> -
> -static int add_active_list(domid_t domid)
> -{
> -    struct domain *d;
> -
> -    if ( adomains >= MAX_OPROF_DOMAINS )
> -        return -E2BIG;
> -
> -    d = get_domain_by_id(domid);
> -    if ( d == NULL )
> -        return -EINVAL;
> -
> -    active_domains[adomains] = d;
> -    active_ready[adomains] = 0;
> -    adomains++;
> -
> -    return 0;
> -}
> -
> -static int add_passive_list(XEN_GUEST_HANDLE_PARAM(void) arg)
> -{
> -    struct xenoprof_passive passive;
> -    struct domain *d;
> -    int ret = 0;
> -
> -    if ( pdomains >= MAX_OPROF_DOMAINS )
> -        return -E2BIG;
> -
> -    if ( copy_from_guest(&passive, arg, 1) )
> -        return -EFAULT;
> -
> -    d = get_domain_by_id(passive.domain_id);
> -    if ( d == NULL )
> -        return -EINVAL;
> -
> -    if ( d->xenoprof == NULL )
> -    {
> -        ret = alloc_xenoprof_struct(d, passive.max_samples, 1);
> -        if ( ret < 0 )
> -        {
> -            put_domain(d);
> -            return -ENOMEM;
> -        }
> -    }
> -
> -    ret = share_xenoprof_page_with_guest(
> -        current->domain, virt_to_mfn(d->xenoprof->rawbuf),
> -        d->xenoprof->npages);
> -    if ( ret < 0 )
> -    {
> -        put_domain(d);
> -        return ret;
> -    }
> -
> -    d->xenoprof->domain_type = XENOPROF_DOMAIN_PASSIVE;
> -    passive.nbuf = d->xenoprof->nbuf;
> -    passive.bufsize = d->xenoprof->bufsize;
> -    if ( !paging_mode_translate(current->domain) )
> -        passive.buf_gmaddr = __pa(d->xenoprof->rawbuf);
> -    else
> -        xenoprof_shared_gmfn_with_guest(
> -            current->domain, __pa(d->xenoprof->rawbuf),
> -            passive.buf_gmaddr, d->xenoprof->npages);
> -
> -    if ( __copy_to_guest(arg, &passive, 1) )
> -    {
> -        put_domain(d);
> -        return -EFAULT;
> -    }
> -
> -    passive_domains[pdomains] = d;
> -    pdomains++;
> -
> -    return ret;
> -}
> -
> -
> -/* Get space in the buffer */
> -static int xenoprof_buf_space(int head, int tail, int size)
> -{
> -    return ((tail > head) ? 0 : size) + tail - head - 1;
> -}
> -
> -/* Check for space and add a sample. Return 1 if successful, 0 otherwise. */
> -static int xenoprof_add_sample(const struct domain *d,
> -                               const struct xenoprof_vcpu *v,
> -                               uint64_t eip, int mode, int event)
> -{
> -    xenoprof_buf_t *buf = v->buffer;
> -    int head, tail, size;
> -
> -    head = xenoprof_buf(d, buf, event_head);
> -    tail = xenoprof_buf(d, buf, event_tail);
> -    size = v->event_size;
> -
> -    /* make sure indexes in shared buffer are sane */
> -    if ( (head < 0) || (head >= size) || (tail < 0) || (tail >= size) )
> -    {
> -        corrupted_buffer_samples++;
> -        return 0;
> -    }
> -
> -    if ( xenoprof_buf_space(head, tail, size) > 0 )
> -    {
> -        xenoprof_buf(d, buf, event_log[head].eip) = eip;
> -        xenoprof_buf(d, buf, event_log[head].mode) = mode;
> -        xenoprof_buf(d, buf, event_log[head].event) = event;
> -        head++;
> -        if ( head >= size )
> -            head = 0;
> -
> -        xenoprof_buf(d, buf, event_head) = head;
> -    }
> -    else
> -    {
> -        xenoprof_buf(d, buf, lost_samples)++;
> -        lost_samples++;
> -        return 0;
> -    }
> -
> -    return 1;
> -}
> -
> -int xenoprof_add_trace(struct vcpu *vcpu, uint64_t pc, int mode)
> -{
> -    struct domain *d = vcpu->domain;
> -
> -    /* Do not accidentally write an escape code due to a broken frame. */
> -    if ( pc == XENOPROF_ESCAPE_CODE )
> -    {
> -        invalid_buffer_samples++;
> -        return 0;
> -    }
> -
> -    return xenoprof_add_sample(d, &d->xenoprof->vcpu[vcpu->vcpu_id],
> -                               pc, mode, 0);
> -}
> -
> -void xenoprof_log_event(struct vcpu *vcpu, const struct cpu_user_regs *regs,
> -                        uint64_t pc, int mode, int event)
> -{
> -    struct domain *d = vcpu->domain;
> -    struct xenoprof_vcpu *v;
> -    xenoprof_buf_t *buf;
> -
> -    total_samples++;
> -
> -    /* Ignore samples of un-monitored domains. */
> -    if ( !is_profiled(d) )
> -    {
> -        others_samples++;
> -        return;
> -    }
> -
> -    v = &d->xenoprof->vcpu[vcpu->vcpu_id];
> -    if ( v->buffer == NULL )
> -    {
> -        invalid_buffer_samples++;
> -        return;
> -    }
> -
> -    buf = v->buffer;
> -
> -    /* Provide backtrace if requested. */
> -    if ( backtrace_depth > 0 )
> -    {
> -        if ( xenoprof_buf_space(xenoprof_buf(d, buf, event_head),
> -                                xenoprof_buf(d, buf, event_tail),
> -                                v->event_size) < 2 )
> -        {
> -            xenoprof_buf(d, buf, lost_samples)++;
> -            lost_samples++;
> -            return;
> -        }
> -
> -        /* xenoprof_add_sample() will increment lost_samples on failure */
> -        if ( !xenoprof_add_sample(d, v, XENOPROF_ESCAPE_CODE, mode,
> -                                  XENOPROF_TRACE_BEGIN) )
> -            return;
> -    }
> -
> -    if ( xenoprof_add_sample(d, v, pc, mode, event) )
> -    {
> -        if ( is_active(vcpu->domain) )
> -            active_samples++;
> -        else
> -            passive_samples++;
> -        if ( mode == 0 )
> -            xenoprof_buf(d, buf, user_samples)++;
> -        else if ( mode == 1 )
> -            xenoprof_buf(d, buf, kernel_samples)++;
> -        else
> -            xenoprof_buf(d, buf, xen_samples)++;
> -
> -    }
> -
> -    if ( backtrace_depth > 0 )
> -        xenoprof_backtrace(vcpu, regs, backtrace_depth, mode);
> -}
> -
> -
> -
> -static int xenoprof_op_init(XEN_GUEST_HANDLE_PARAM(void) arg)
> -{
> -    struct domain *d = current->domain;
> -    struct xenoprof_init xenoprof_init;
> -    int ret;
> -
> -    if ( copy_from_guest(&xenoprof_init, arg, 1) )
> -        return -EFAULT;
> -
> -    if ( (ret = xenoprof_arch_init(&xenoprof_init.num_events,
> -                                   xenoprof_init.cpu_type)) )
> -        return ret;
> -
> -    /* Only the hardware domain may become the primary profiler here because
> -     * there is currently no cleanup of xenoprof_primary_profiler or associated
> -     * profiling state when the primary profiling domain is shut down or
> -     * crashes.  Once a better cleanup method is present, it will be possible to
> -     * allow another domain to be the primary profiler.
> -     */
> -    xenoprof_init.is_primary =
> -        ((xenoprof_primary_profiler == d) ||
> -         ((xenoprof_primary_profiler == NULL) && is_hardware_domain(d)));
> -    if ( xenoprof_init.is_primary )
> -        xenoprof_primary_profiler = current->domain;
> -
> -    return __copy_to_guest(arg, &xenoprof_init, 1) ? -EFAULT : 0;
> -}
> -
> -#define ret_t long
> -
> -#endif /* !COMPAT */
> -
> -static int xenoprof_op_get_buffer(XEN_GUEST_HANDLE_PARAM(void) arg)
> -{
> -    struct xenoprof_get_buffer xenoprof_get_buffer;
> -    struct domain *d = current->domain;
> -    int ret;
> -
> -    if ( copy_from_guest(&xenoprof_get_buffer, arg, 1) )
> -        return -EFAULT;
> -
> -    /*
> -     * We allocate xenoprof struct and buffers only at first time
> -     * get_buffer is called. Memory is then kept until domain is destroyed.
> -     */
> -    if ( d->xenoprof == NULL )
> -    {
> -        ret = alloc_xenoprof_struct(d, xenoprof_get_buffer.max_samples, 0);
> -        if ( ret < 0 )
> -            return ret;
> -    }
> -    else
> -        d->xenoprof->domain_type = XENOPROF_DOMAIN_IGNORED;
> -
> -    ret = share_xenoprof_page_with_guest(
> -        d, virt_to_mfn(d->xenoprof->rawbuf), d->xenoprof->npages);
> -    if ( ret < 0 )
> -        return ret;
> -
> -    xenoprof_reset_buf(d);
> -
> -    xenoprof_get_buffer.nbuf = d->xenoprof->nbuf;
> -    xenoprof_get_buffer.bufsize = d->xenoprof->bufsize;
> -    if ( !paging_mode_translate(d) )
> -        xenoprof_get_buffer.buf_gmaddr = __pa(d->xenoprof->rawbuf);
> -    else
> -        xenoprof_shared_gmfn_with_guest(
> -            d, __pa(d->xenoprof->rawbuf), xenoprof_get_buffer.buf_gmaddr,
> -            d->xenoprof->npages);
> -
> -    return __copy_to_guest(arg, &xenoprof_get_buffer, 1) ? -EFAULT : 0;
> -}
> -
> -#define NONPRIV_OP(op) ( (op == XENOPROF_init)          \
> -                      || (op == XENOPROF_enable_virq)   \
> -                      || (op == XENOPROF_disable_virq)  \
> -                      || (op == XENOPROF_get_buffer))
> -
> -ret_t do_xenoprof_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg)
> -{
> -    int ret = 0;
> -
> -    if ( (op < 0) || (op > XENOPROF_last_op) )
> -    {
> -        gdprintk(XENLOG_DEBUG, "invalid operation %d\n", op);
> -        return -EINVAL;
> -    }
> -
> -    if ( !NONPRIV_OP(op) && (current->domain != xenoprof_primary_profiler) )
> -    {
> -        gdprintk(XENLOG_DEBUG, "denied privileged operation %d\n", op);
> -        return -EPERM;
> -    }
> -
> -    ret = xsm_profile(XSM_HOOK, current->domain, op);
> -    if ( ret )
> -        return ret;
> -
> -    spin_lock(&xenoprof_lock);
> -
> -    switch ( op )
> -    {
> -    case XENOPROF_init:
> -        ret = xenoprof_op_init(arg);
> -        if ( (ret == 0) &&
> -             (current->domain == xenoprof_primary_profiler) )
> -            xenoprof_state = XENOPROF_INITIALIZED;
> -        break;
> -
> -    case XENOPROF_get_buffer:
> -        if ( !acquire_pmu_ownership(PMU_OWNER_XENOPROF) )
> -        {
> -            ret = -EBUSY;
> -            break;
> -        }
> -        ret = xenoprof_op_get_buffer(arg);
> -        break;
> -
> -    case XENOPROF_reset_active_list:
> -        reset_active_list();
> -        ret = 0;
> -        break;
> -
> -    case XENOPROF_reset_passive_list:
> -        reset_passive_list();
> -        ret = 0;
> -        break;
> -
> -    case XENOPROF_set_active:
> -    {
> -        domid_t domid;
> -        if ( xenoprof_state != XENOPROF_INITIALIZED )
> -        {
> -            ret = -EPERM;
> -            break;
> -        }
> -        if ( copy_from_guest(&domid, arg, 1) )
> -        {
> -            ret = -EFAULT;
> -            break;
> -        }
> -        ret = add_active_list(domid);
> -        break;
> -    }
> -
> -    case XENOPROF_set_passive:
> -        if ( xenoprof_state != XENOPROF_INITIALIZED )
> -        {
> -            ret = -EPERM;
> -            break;
> -        }
> -        ret = add_passive_list(arg);
> -        break;
> -
> -    case XENOPROF_reserve_counters:
> -        if ( xenoprof_state != XENOPROF_INITIALIZED )
> -        {
> -            ret = -EPERM;
> -            break;
> -        }
> -        ret = xenoprof_arch_reserve_counters();
> -        if ( !ret )
> -            xenoprof_state = XENOPROF_COUNTERS_RESERVED;
> -        break;
> -
> -    case XENOPROF_counter:
> -        if ( (xenoprof_state != XENOPROF_COUNTERS_RESERVED) ||
> -             (adomains == 0) )
> -        {
> -            ret = -EPERM;
> -            break;
> -        }
> -        ret = xenoprof_arch_counter(arg);
> -        break;
> -
> -    case XENOPROF_setup_events:
> -        if ( xenoprof_state != XENOPROF_COUNTERS_RESERVED )
> -        {
> -            ret = -EPERM;
> -            break;
> -        }
> -        ret = xenoprof_arch_setup_events();
> -        if ( !ret )
> -            xenoprof_state = XENOPROF_READY;
> -        break;
> -
> -    case XENOPROF_enable_virq:
> -    {
> -        int i;
> -
> -        if ( current->domain == xenoprof_primary_profiler )
> -        {
> -            if ( xenoprof_state != XENOPROF_READY )
> -            {
> -                ret = -EPERM;
> -                break;
> -            }
> -            xenoprof_arch_enable_virq();
> -            xenoprof_reset_stat();
> -            for ( i = 0; i < pdomains; i++ )
> -                xenoprof_reset_buf(passive_domains[i]);
> -        }
> -        xenoprof_reset_buf(current->domain);
> -        ret = set_active(current->domain);
> -        break;
> -    }
> -
> -    case XENOPROF_start:
> -        ret = -EPERM;
> -        if ( (xenoprof_state == XENOPROF_READY) &&
> -             (activated == adomains) )
> -            ret = xenoprof_arch_start();
> -        if ( ret == 0 )
> -            xenoprof_state = XENOPROF_PROFILING;
> -        break;
> -
> -    case XENOPROF_stop:
> -    {
> -        struct domain *d;
> -        struct vcpu *v;
> -        int i;
> -
> -        if ( xenoprof_state != XENOPROF_PROFILING )
> -        {
> -            ret = -EPERM;
> -            break;
> -        }
> -        xenoprof_arch_stop();
> -
> -        /* Flush remaining samples. */
> -        for ( i = 0; i < adomains; i++ )
> -        {
> -            if ( !active_ready[i] )
> -                continue;
> -            d = active_domains[i];
> -            for_each_vcpu(d, v)
> -                send_guest_vcpu_virq(v, VIRQ_XENOPROF);
> -        }
> -        xenoprof_state = XENOPROF_READY;
> -        break;
> -    }
> -
> -    case XENOPROF_disable_virq:
> -    {
> -        struct xenoprof *x;
> -        if ( (xenoprof_state == XENOPROF_PROFILING) &&
> -             (is_active(current->domain)) )
> -        {
> -            ret = -EPERM;
> -            break;
> -        }
> -        if ( (ret = reset_active(current->domain)) != 0 )
> -            break;
> -        x = current->domain->xenoprof;
> -        unshare_xenoprof_page_with_guest(x);
> -        release_pmu_ownership(PMU_OWNER_XENOPROF);
> -        break;
> -    }
> -
> -    case XENOPROF_release_counters:
> -        ret = -EPERM;
> -        if ( (xenoprof_state == XENOPROF_COUNTERS_RESERVED) ||
> -             (xenoprof_state == XENOPROF_READY) )
> -        {
> -            xenoprof_state = XENOPROF_INITIALIZED;
> -            xenoprof_arch_release_counters();
> -            xenoprof_arch_disable_virq();
> -            reset_passive_list();
> -            ret = 0;
> -        }
> -        break;
> -
> -    case XENOPROF_shutdown:
> -        ret = -EPERM;
> -        if ( xenoprof_state == XENOPROF_INITIALIZED )
> -        {
> -            activated = 0;
> -            adomains=0;
> -            xenoprof_primary_profiler = NULL;
> -            backtrace_depth=0;
> -            ret = 0;
> -        }
> -        break;
> -
> -    case XENOPROF_set_backtrace:
> -        ret = 0;
> -        if ( !xenoprof_backtrace_supported() )
> -            ret = -EINVAL;
> -        else if ( copy_from_guest(&backtrace_depth, arg, 1) )
> -            ret = -EFAULT;
> -        break;
> -
> -    case XENOPROF_ibs_counter:
> -        if ( (xenoprof_state != XENOPROF_COUNTERS_RESERVED) ||
> -             (adomains == 0) )
> -        {
> -            ret = -EPERM;
> -            break;
> -        }
> -        ret = xenoprof_arch_ibs_counter(arg);
> -        break;
> -
> -    case XENOPROF_get_ibs_caps:
> -        ret = ibs_caps;
> -        break;
> -
> -    default:
> -        ret = -ENOSYS;
> -    }
> -
> -    spin_unlock(&xenoprof_lock);
> -
> -    if ( ret < 0 )
> -        gdprintk(XENLOG_DEBUG, "operation %d failed: %d\n", op, ret);
> -
> -    return ret;
> -}
> -
> -#if defined(CONFIG_COMPAT) && !defined(COMPAT)
> -#undef ret_t
> -#include "compat/xenoprof.c"
> -#endif
> -
> -/*
> - * Local variables:
> - * mode: C
> - * c-file-style: "BSD"
> - * c-basic-offset: 4
> - * tab-width: 4
> - * indent-tabs-mode: nil
> - * End:
> - */
> diff --git a/xen/include/Makefile b/xen/include/Makefile
> index e71f419e8c22..b3184a395b50 100644
> --- a/xen/include/Makefile
> +++ b/xen/include/Makefile
> @@ -31,7 +31,6 @@ headers-$(CONFIG_HVM)     += compat/hvm/hvm_vcpu.h
>   headers-$(CONFIG_HYPFS)   += compat/hypfs.h
>   headers-$(CONFIG_KEXEC)   += compat/kexec.h
>   headers-$(CONFIG_TRACEBUFFER) += compat/trace.h
> -headers-$(CONFIG_XENOPROF) += compat/xenoprof.h
>   headers-$(CONFIG_XSM_FLASK) += compat/xsm/flask_op.h
>   
>   headers-n := $(sort $(filter-out $(headers-y),$(headers-n) $(headers-)))
> diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
> index 5782cdfd1496..63755bb8df6e 100644
> --- a/xen/include/hypercall-defs.c
> +++ b/xen/include/hypercall-defs.c
> @@ -127,9 +127,6 @@ argo_op(unsigned int cmd, void *arg1, void *arg2, unsigned long arg3, unsigned l
>   #ifdef CONFIG_PV
>   iret()
>   nmi_op(unsigned int cmd, void *arg)
> -#ifdef CONFIG_XENOPROF
> -xenoprof_op(int op, void *arg)
> -#endif
>   #endif /* CONFIG_PV */
>   
>   #ifdef CONFIG_COMPAT
> @@ -269,9 +266,6 @@ xsm_op                             compat   do       compat   do       do
>   nmi_op                             compat   do       -        -        -
>   sched_op                           compat   do       compat   do       do
>   callback_op                        compat   do       -        -        -
> -#ifdef CONFIG_XENOPROF
> -xenoprof_op                        compat   do       -        -        -
> -#endif
>   event_channel_op                   do       do       do:1     do:1     do:1
>   physdev_op                         compat   do       hvm      hvm      do_arm
>   #ifdef CONFIG_HVM
> diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
> index 7f15204c3885..b12fd10e6315 100644
> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -106,7 +106,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
>   #define __HYPERVISOR_nmi_op               28
>   #define __HYPERVISOR_sched_op             29
>   #define __HYPERVISOR_callback_op          30
> -#define __HYPERVISOR_xenoprof_op          31
> +#define __HYPERVISOR_xenoprof_op          31 /* Dropped in Xen 4.22 */
>   #define __HYPERVISOR_event_channel_op     32
>   #define __HYPERVISOR_physdev_op           33
>   #define __HYPERVISOR_hvm_op               34
> diff --git a/xen/include/public/xenoprof.h b/xen/include/public/xenoprof.h
> index 2298b6759ed3..f97a67042e07 100644
> --- a/xen/include/public/xenoprof.h
> +++ b/xen/include/public/xenoprof.h
> @@ -3,7 +3,7 @@
>    * xenoprof.h
>    *
>    * Interface for enabling system wide profiling based on hardware performance
> - * counters
> + * counters.  Dropped from Xen in 4.22.
>    *
>    * Copyright (C) 2005 Hewlett-Packard Co.
>    * Written by Aravind Menon & Jose Renato Santos
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 1f77e0869b5d..dc06f6f1131a 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -573,9 +573,6 @@ struct domain
>       /* Control-plane tools handle for this domain. */
>       xen_domain_handle_t handle;
>   
> -    /* OProfile support. */
> -    struct xenoprof *xenoprof;
> -
>       /* Domain watchdog. */
>   #define NR_DOMAIN_WATCHDOG_TIMERS 2
>       spinlock_t watchdog_lock;
> diff --git a/xen/include/xen/xenoprof.h b/xen/include/xen/xenoprof.h
> deleted file mode 100644
> index c3dac447d334..000000000000
> --- a/xen/include/xen/xenoprof.h
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -/******************************************************************************
> - * xenoprof.h
> - *
> - * Xenoprof: Xenoprof enables performance profiling in Xen
> - *
> - * Copyright (C) 2005 Hewlett-Packard Co.
> - * written by Aravind Menon & Jose Renato Santos
> - */
> -
> -#ifndef __XEN_XENOPROF_H__
> -#define __XEN_XENOPROF_H__
> -
> -#define PMU_OWNER_NONE          0
> -#define PMU_OWNER_XENOPROF      1
> -#define PMU_OWNER_HVM           2
> -
> -#ifdef CONFIG_XENOPROF
> -
> -#include <xen/stdint.h>
> -#include <asm/xenoprof.h>
> -
> -struct domain;
> -struct vcpu;
> -struct cpu_user_regs;
> -
> -int acquire_pmu_ownership(int pmu_ownership);
> -void release_pmu_ownership(int pmu_ownership);
> -
> -int is_active(struct domain *d);
> -int is_passive(struct domain *d);
> -void free_xenoprof_pages(struct domain *d);
> -
> -int xenoprof_add_trace(struct vcpu *, uint64_t pc, int mode);
> -
> -void xenoprof_log_event(struct vcpu *, const struct cpu_user_regs *,
> -                        uint64_t pc, int mode, int event);
> -
> -#else
> -static inline int acquire_pmu_ownership(int pmu_ownership)
> -{
> -    return 1;
> -}
> -
> -static inline void release_pmu_ownership(int pmu_ownership)
> -{
> -}
> -#endif /* CONFIG_XENOPROF */
> -
> -#endif  /* __XEN__XENOPROF_H__ */
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index e801dbcdbaef..b8fd7aeedd9e 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -278,13 +278,6 @@ static XSM_INLINE int cf_check xsm_console_io(
>       return xsm_default_action(XSM_PRIV, d, NULL);
>   }
>   
> -static XSM_INLINE int cf_check xsm_profile(
> -    XSM_DEFAULT_ARG struct domain *d, int op)
> -{
> -    XSM_ASSERT_ACTION(XSM_HOOK);
> -    return xsm_default_action(action, d, NULL);
> -}
> -
>   static XSM_INLINE int cf_check xsm_kexec(XSM_DEFAULT_VOID)
>   {
>       XSM_ASSERT_ACTION(XSM_PRIV);
> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index 2d831d774541..cc32a6c09104 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -101,8 +101,6 @@ struct xsm_ops {
>   
>       int (*console_io)(struct domain *d, int cmd);
>   
> -    int (*profile)(struct domain *d, int op);
> -
>       int (*kexec)(void);
>       int (*schedop_shutdown)(struct domain *d1, struct domain *d2);
>   
> @@ -450,11 +448,6 @@ static inline int xsm_console_io(xsm_default_t def, struct domain *d, int cmd)
>       return alternative_call(xsm_ops.console_io, d, cmd);
>   }
>   
> -static inline int xsm_profile(xsm_default_t def, struct domain *d, int op)
> -{
> -    return alternative_call(xsm_ops.profile, d, op);
> -}
> -
>   static inline int xsm_kexec(xsm_default_t def)
>   {
>       return alternative_call(xsm_ops.kexec);
> diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
> index 96dc82ac2e29..244ef557528b 100644
> --- a/xen/xsm/dummy.c
> +++ b/xen/xsm/dummy.c
> @@ -61,8 +61,6 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
>   
>       .console_io                    = xsm_console_io,
>   
> -    .profile                       = xsm_profile,
> -
>       .kexec                         = xsm_kexec,
>       .schedop_shutdown              = xsm_schedop_shutdown,
>   
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index 9f3915617cc8..b250b2706535 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -19,7 +19,6 @@
>   #include <xen/cpumask.h>
>   #include <xen/errno.h>
>   #include <xen/guest_access.h>
> -#include <xen/xenoprof.h>
>   #include <xen/iommu.h>
>   #ifdef CONFIG_HAS_PCI_MSI
>   #include <asm/msi.h>
> @@ -512,38 +511,6 @@ static int cf_check flask_console_io(struct domain *d, int cmd)
>       return domain_has_xen(d, perm);
>   }
>   
> -static int cf_check flask_profile(struct domain *d, int op)
> -{
> -    uint32_t perm;
> -
> -    switch ( op )
> -    {
> -    case XENOPROF_init:
> -    case XENOPROF_enable_virq:
> -    case XENOPROF_disable_virq:
> -    case XENOPROF_get_buffer:
> -        perm = XEN__NONPRIVPROFILE;
> -        break;
> -    case XENOPROF_reset_active_list:
> -    case XENOPROF_reset_passive_list:
> -    case XENOPROF_set_active:
> -    case XENOPROF_set_passive:
> -    case XENOPROF_reserve_counters:
> -    case XENOPROF_counter:
> -    case XENOPROF_setup_events:
> -    case XENOPROF_start:
> -    case XENOPROF_stop:
> -    case XENOPROF_release_counters:
> -    case XENOPROF_shutdown:
> -        perm = XEN__PRIVPROFILE;
> -        break;
> -    default:
> -        return avc_unknown_permission("xenoprof op", op);
> -    }
> -
> -    return domain_has_xen(d, perm);
> -}
> -
>   static int cf_check flask_kexec(void)
>   {
>       return domain_has_xen(current->domain, XEN__KEXEC);
> @@ -1930,8 +1897,6 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
>   
>       .console_io = flask_console_io,
>   
> -    .profile = flask_profile,
> -
>       .kexec = flask_kexec,
>       .schedop_shutdown = flask_schedop_shutdown,
>   
> diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
> index 51a1577a66c7..ce907d50a45e 100644
> --- a/xen/xsm/flask/policy/access_vectors
> +++ b/xen/xsm/flask/policy/access_vectors
> @@ -38,10 +38,6 @@ class xen
>       readapic
>   # PHYSDEVOP_apic_write
>       writeapic
> -# Most XENOPROF_*
> -    privprofile
> -# XENOPROF_{init,enable_virq,disable_virq,get_buffer}
> -    nonprivprofile
>   # kexec hypercall
>       kexec
>   # XENPF_firmware_info, XENPF_efi_runtime_call
>
> base-commit: c36ddba28e314e9350f4024972023b52e34ec73e

