Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3707FE775
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 03:59:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644368.1005246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8XGI-0004y4-62; Thu, 30 Nov 2023 02:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644368.1005246; Thu, 30 Nov 2023 02:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8XGI-0004wp-2M; Thu, 30 Nov 2023 02:58:46 +0000
Received: by outflank-mailman (input) for mailman id 644368;
 Thu, 30 Nov 2023 02:58:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKhV=HL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8XGG-0004wf-GY
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 02:58:44 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f1715bf-8f2c-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 03:58:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id BEC76B83E27;
 Thu, 30 Nov 2023 02:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C71C433C7;
 Thu, 30 Nov 2023 02:58:40 +0000 (UTC)
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
X-Inumbo-ID: 5f1715bf-8f2c-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701313121;
	bh=AFwk91g22GRvKR0n67ycwzPAOk//uVtS07YdWxmXeH0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GQ1XQJmpDtVIJbpIfgO/o2SmIKeW7MiwHDj75XummbGbm6FvUWcVkYLHzZQ/pIosL
	 K94m+RO3q6c2kRSEfAr2eyyavj4eyBDXVQeCyX/CY+M/zoFywuvLIUkCZQLqA5zgpU
	 KNFjZjnEUWpGjElYwsxHKDNY3jaMJ0fWO7/cJHu9+UWwC/tiQizxxPP3uLvxFsWpLr
	 hGsDA5U8+jn9N5OfYBm8RQyBd+L3sV6H8kZwm9le3cOpE0vUK9tSpB09Ql0dLNOxG9
	 ZXbis8AsbP7MiT6hXj97FODTk1w5QtJFPiTBv320ho0qbiJrzGp4lefco4ApWT9Wi4
	 cTR2iDb9oiHFw==
Date: Wed, 29 Nov 2023 18:58:38 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 3/5] xen/x86: introduce self modifying code test
In-Reply-To: <20231128100352.35430-4-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311291857340.3533093@ubuntu-linux-20-04-desktop>
References: <20231128100352.35430-1-roger.pau@citrix.com> <20231128100352.35430-4-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-922076850-1701313121=:3533093"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-922076850-1701313121=:3533093
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 28 Nov 2023, Roger Pau Monne wrote:
> Introduce a helper to perform checks related to self modifying code, and start
> by creating a simple test to check that alternatives have been applied.
> 
> Such test is hooked into the boot process and called just after alternatives
> have been applied.  In case of failure a message is printed, and the hypervisor
> is tainted as not having passed the tests, this does require introducing a new
> taint bit (printed as 'A').
> 
> A new sysctl is also introduced to run the tests on demand.  While there are no
> current users introduced here, further changes will introduce those, and it's
> helpful to have the interface defined in the sysctl header from the start.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Rework test and interface.
> ---
>  tools/include/xenctrl.h             |  2 +
>  tools/libs/ctrl/xc_misc.c           | 14 ++++++
>  xen/arch/x86/Makefile               |  1 +
>  xen/arch/x86/include/asm/test-smc.h | 18 ++++++++
>  xen/arch/x86/setup.c                |  3 ++
>  xen/arch/x86/sysctl.c               |  7 +++
>  xen/arch/x86/test-smc.c             | 68 +++++++++++++++++++++++++++++

If possible, could we name this differently?

I am asking because of these:
https://documentation-service.arm.com/static/5f8ea482f86e16515cdbe3c6?token=
https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/vsmc.c?ref_type=heads



>  xen/common/kernel.c                 |  5 ++-
>  xen/include/public/sysctl.h         |  9 ++++
>  xen/include/xen/lib.h               |  1 +
>  10 files changed, 126 insertions(+), 2 deletions(-)
>  create mode 100644 xen/arch/x86/include/asm/test-smc.h
>  create mode 100644 xen/arch/x86/test-smc.c
> 
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 2ef8b4e05422..0f87ffa4affd 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -2658,6 +2658,8 @@ int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
>                    uint32_t overlay_fdt_size, uint8_t overlay_op);
>  #endif
>  
> +int xc_test_smc(xc_interface *xch, uint32_t tests, uint32_t *result);
> +
>  /* Compat shims */
>  #include "xenctrl_compat.h"
>  
> diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
> index 5ecdfa2c7934..7f7ece589cc2 100644
> --- a/tools/libs/ctrl/xc_misc.c
> +++ b/tools/libs/ctrl/xc_misc.c
> @@ -1021,6 +1021,20 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
>      return _xc_livepatch_action(xch, name, LIVEPATCH_ACTION_REPLACE, timeout, flags);
>  }
>  
> +int xc_test_smc(xc_interface *xch, uint32_t tests, uint32_t *result)
> +{
> +    struct xen_sysctl sysctl = {
> +        .cmd = XEN_SYSCTL_test_smc,
> +        .u.smc.tests = tests,
> +    };
> +    int rc = do_sysctl(xch, &sysctl);
> +
> +    if ( !rc )
> +        *result = sysctl.u.smc.results;
> +
> +    return rc;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index f629157086d0..bdd2183a2fd7 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -65,6 +65,7 @@ obj-y += smpboot.o
>  obj-y += spec_ctrl.o
>  obj-y += srat.o
>  obj-y += string.o
> +obj-y += test-smc.o
>  obj-y += time.o
>  obj-y += traps.o
>  obj-y += tsx.o
> diff --git a/xen/arch/x86/include/asm/test-smc.h b/xen/arch/x86/include/asm/test-smc.h
> new file mode 100644
> index 000000000000..18b23dbdbf2d
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/test-smc.h
> @@ -0,0 +1,18 @@
> +#ifndef _ASM_X86_TEST_SMC_H_
> +#define _ASM_X86_TEST_SMC_H_
> +
> +#include <xen/types.h>
> +
> +int test_smc(uint32_t selection, uint32_t *results);
> +
> +#endif	/* _ASM_X86_TEST_SMC_H_ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index f6b8a3efd752..1f90d30204fe 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -58,6 +58,7 @@
>  #include <asm/microcode.h>
>  #include <asm/prot-key.h>
>  #include <asm/pv/domain.h>
> +#include <asm/test-smc.h>
>  
>  /* opt_nosmp: If true, secondary processors are ignored. */
>  static bool __initdata opt_nosmp;
> @@ -1952,6 +1953,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>  
>      alternative_branches();
>  
> +    test_smc(XEN_SYSCTL_TEST_SMC_ALL, NULL);
> +
>      /*
>       * NB: when running as a PV shim VCPUOP_up/down is wired to the shim
>       * physical cpu_add/remove functions, so launch the guest with only
> diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
> index 1d40d82c5ad2..77d091f4bd59 100644
> --- a/xen/arch/x86/sysctl.c
> +++ b/xen/arch/x86/sysctl.c
> @@ -25,6 +25,7 @@
>  #include <asm/processor.h>
>  #include <asm/setup.h>
>  #include <asm/smp.h>
> +#include <asm/test-smc.h>
>  #include <asm/numa.h>
>  #include <xen/nodemask.h>
>  #include <xen/cpu.h>
> @@ -423,6 +424,12 @@ long arch_do_sysctl(
>          break;
>      }
>  
> +    case XEN_SYSCTL_test_smc:
> +        ret = test_smc(sysctl->u.smc.tests, &sysctl->u.smc.results);
> +        if ( !ret && __copy_field_to_guest(u_sysctl, sysctl, u.smc.results) )
> +            ret = -EFAULT;
> +        break;
> +
>      default:
>          ret = -ENOSYS;
>          break;
> diff --git a/xen/arch/x86/test-smc.c b/xen/arch/x86/test-smc.c
> new file mode 100644
> index 000000000000..8916c185d60a
> --- /dev/null
> +++ b/xen/arch/x86/test-smc.c
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <xen/errno.h>
> +
> +#include <asm/alternative.h>
> +#include <asm/cpufeature.h>
> +#include <asm/test-smc.h>
> +
> +static bool cf_check test_insn_replacement(void)
> +{
> +#define EXPECTED_VALUE 2
> +    unsigned int r = ~EXPECTED_VALUE;
> +
> +    alternative_io("", "mov $" STR(EXPECTED_VALUE) ", %0",
> +                   X86_FEATURE_ALWAYS, "=r"(r));
> +
> +    return r == EXPECTED_VALUE;
> +#undef EXPECTED_VALUE
> +}
> +
> +int test_smc(uint32_t selection, uint32_t *results)
> +{
> +    struct {
> +        unsigned int mask;
> +        bool (*test)(void);
> +        const char *name;
> +    } static const tests[] = {
> +        { XEN_SYSCTL_TEST_SMC_INSN_REPL, &test_insn_replacement,
> +          "alternative instruction replacement" },
> +    };
> +    unsigned int i;
> +
> +    if ( selection & ~XEN_SYSCTL_TEST_SMC_ALL )
> +        return -EINVAL;
> +
> +    if ( results )
> +        *results = 0;
> +
> +    printk(XENLOG_INFO "Checking Self Modify Code\n");
> +
> +    for ( i = 0; i < ARRAY_SIZE(tests); i++ )
> +    {
> +        if ( !(selection & tests[i].mask) )
> +            continue;
> +
> +        if ( tests[i].test() )
> +        {
> +            if ( results )
> +                *results |= tests[i].mask;
> +            continue;
> +        }
> +
> +        add_taint(TAINT_ERROR_SMC);
> +        printk(XENLOG_ERR "%s test failed\n", tests[i].name);
> +    }
> +
> +    return 0;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
> index 08dbaa2a054c..fed7ed0d587f 100644
> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -386,13 +386,14 @@ char *print_tainted(char *str)
>  {
>      if ( tainted )
>      {
> -        snprintf(str, TAINT_STRING_MAX_LEN, "Tainted: %c%c%c%c%c%c",
> +        snprintf(str, TAINT_STRING_MAX_LEN, "Tainted: %c%c%c%c%c%c%c",
>                   tainted & TAINT_MACHINE_INSECURE ? 'I' : ' ',
>                   tainted & TAINT_MACHINE_CHECK ? 'M' : ' ',
>                   tainted & TAINT_SYNC_CONSOLE ? 'C' : ' ',
>                   tainted & TAINT_ERROR_INJECT ? 'E' : ' ',
>                   tainted & TAINT_HVM_FEP ? 'H' : ' ',
> -                 tainted & TAINT_CPU_OUT_OF_SPEC ? 'S' : ' ');
> +                 tainted & TAINT_CPU_OUT_OF_SPEC ? 'S' : ' ',
> +                 tainted & TAINT_ERROR_SMC ? 'A' : ' ');
>      }
>      else
>      {
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index 9b19679caeb1..94287009387c 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -1201,6 +1201,13 @@ struct xen_sysctl_dt_overlay {
>  };
>  #endif
>  
> +struct xen_sysctl_test_smc {
> +    uint32_t tests;     /* IN: bitmap with selected tests to execute. */
> +#define XEN_SYSCTL_TEST_SMC_INSN_REPL   (1U << 0)
> +#define XEN_SYSCTL_TEST_SMC_ALL         (XEN_SYSCTL_TEST_SMC_INSN_REPL)
> +    uint32_t results;   /* OUT: test result: 1 -> success, 0 -> failure. */
> +};
> +
>  struct xen_sysctl {
>      uint32_t cmd;
>  #define XEN_SYSCTL_readconsole                    1
> @@ -1232,6 +1239,7 @@ struct xen_sysctl {
>  /* #define XEN_SYSCTL_set_parameter              28 */
>  #define XEN_SYSCTL_get_cpu_policy                29
>  #define XEN_SYSCTL_dt_overlay                    30
> +#define XEN_SYSCTL_test_smc                      31
>      uint32_t interface_version; /* XEN_SYSCTL_INTERFACE_VERSION */
>      union {
>          struct xen_sysctl_readconsole       readconsole;
> @@ -1261,6 +1269,7 @@ struct xen_sysctl {
>          struct xen_sysctl_livepatch_op      livepatch;
>  #if defined(__i386__) || defined(__x86_64__)
>          struct xen_sysctl_cpu_policy        cpu_policy;
> +        struct xen_sysctl_test_smc          smc;
>  #endif
>  
>  #if defined(__arm__) || defined (__aarch64__)
> diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
> index 1793be5b6b89..1bec6a01b18a 100644
> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -167,6 +167,7 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c);
>  #define TAINT_HVM_FEP                   (1u << 3)
>  #define TAINT_MACHINE_INSECURE          (1u << 4)
>  #define TAINT_CPU_OUT_OF_SPEC           (1u << 5)
> +#define TAINT_ERROR_SMC                 (1U << 6)
>  extern unsigned int tainted;
>  #define TAINT_STRING_MAX_LEN            20
>  extern char *print_tainted(char *str);
> -- 
> 2.43.0
> 
--8323329-922076850-1701313121=:3533093--

