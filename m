Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E15EAB201E
	for <lists+xen-devel@lfdr.de>; Sat, 10 May 2025 00:52:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980479.1366934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDWZv-0008Ck-0m; Fri, 09 May 2025 22:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980479.1366934; Fri, 09 May 2025 22:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDWZu-0008AZ-Tp; Fri, 09 May 2025 22:52:26 +0000
Received: by outflank-mailman (input) for mailman id 980479;
 Fri, 09 May 2025 22:52:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/D4s=XZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uDWZt-0008AT-Bt
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 22:52:25 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42d466d4-2d28-11f0-9ffb-bf95429c2676;
 Sat, 10 May 2025 00:52:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 74AA8629F9;
 Fri,  9 May 2025 22:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629BCC4CEE4;
 Fri,  9 May 2025 22:52:16 +0000 (UTC)
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
X-Inumbo-ID: 42d466d4-2d28-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746831138;
	bh=l6wl/aVoDG0TYZAH5JTusoihTfz7hbpN55vdut+Xm1g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=L4UHUC12bf5oxaJGFiogBBvY3k3B5Q/cpAC/F8fLM0CU2Oc8vF0uQGeEz+DLkM8YF
	 TSkgeJ+PYczmcT6ZhNZSGnvZ21nSifu+CEUNv2QeHwrFOrwVBk/zFCApszKwqIF325
	 CT1yZn2JhEGXZvrgeeH1VUNwSmSxYNeUKms3sXYsSjrESjRu8wKvsB10YefcSw9MNC
	 neIdJ2u7vmYVN4GoVKwu0ASesHHvxyA7UTsRuwaZtVj3KVyh0qJFw4DSx0oJnmBLde
	 4jh29joi6m7q8oNXvb8cvTabTDo4bwf/27Mg+7xgUsw3B5gMljpQUK0oPtakR1eCh4
	 wSbTi8s1AKzhg==
Date: Fri, 9 May 2025 15:52:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, 
    George Dunlap <gwd@xenproject.org>
Subject: Re: [RFC PATCH v3 1/2] xen: add libafl-qemu fuzzer support
In-Reply-To: <20250507095338.735228-2-volodymyr_babchuk@epam.com>
Message-ID: <alpine.DEB.2.22.394.2505091541310.3879245@ubuntu-linux-20-04-desktop>
References: <20250507095338.735228-1-volodymyr_babchuk@epam.com> <20250507095338.735228-2-volodymyr_babchuk@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 May 2025, Volodymyr Babchuk wrote:
> LibAFL, which is a part of AFL++ project is a instrument that allows
> us to perform fuzzing on beremetal code (Xen hypervisor in this case)
> using QEMU as an emulator. It employs QEMU's ability to create
> snapshots to run many tests relatively quickly: system state is saved
> right before executing a new test and restored after the test is
> finished.
> 
> This patch adds all necessary plumbing to run aarch64 build of Xen
> inside that LibAFL-QEMU fuzzer. While, most of the code is in common
> section and can be used by any supported architecture, final calls to
> LibAFL-QEMU are arch-specific and were tested only on aarch64 for
> now. But LibAFL-QEMU itself supports many different architectures,
> including x86_64 and riscv.
> 
> >From the Xen perspective we need to do following things:
> 
> 1. Able to communicate with LibAFL-QEMU fuzzer. This is done by
> executing special opcodes, that only LibAFL-QEMU can handle.
> 
> 2. Use interface from p.1 to tell the fuzzer about code Xen section,
> so fuzzer know which part of code to track and gather coverage data.
> 
> 3. Report fuzzer about crash. This is done in panic() function.
> 
> 4. Prevent test harness from shooting itself in knee.
> 
> Right now test harness is an external component, because we want to
> test external Xen interfaces, but it is possible to fuzz internal code
> if we want to.
> 
> Test harness is implemented XTF-based test-case(s). As test harness
> can issue hypercall that shuts itself down, KConfig option
> CONFIG_FUZZER_PASS_BLOCKING was added. It basically tells
> fuzzer that test was completed successfully if Dom0 tries to shut
> itself (or the whole machine) down.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

The patch looks much better than before. Only a couple of very minor
comments that could be even fixed on commit. See below.

With those fixed:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> Changes in v3:
> 
>  - Added fuzzer.h
>  - Kconfig entries were reworked to be more generic and support
>    other fuzzers in the future
>  - Moved all the code into common area, as there is nothing
>    arch-specific in it
>  - Created arch-specific header file form ARM
>  - Removed not used definitions in libafl-qemu.h
>  - Removed not used functions from libafl-qemu.c
>  - Folded libafl-qemu-defs.h into libafl-qemu.h as we don't
>    need two separate headers
>  - Aligned code with xen coding style
>  - Added SPDX identifiers with MIT license to libafl-* files
> ---
>  docs/hypervisor-guide/fuzzing.rst      | 91 ++++++++++++++++++++++++++
>  xen/arch/arm/Kconfig.debug             | 37 +++++++++++
>  xen/arch/arm/include/asm/libafl-qemu.h | 48 ++++++++++++++
>  xen/arch/arm/psci.c                    |  5 ++
>  xen/common/Makefile                    |  1 +
>  xen/common/domain.c                    |  3 +
>  xen/common/libafl-qemu.c               | 80 ++++++++++++++++++++++
>  xen/common/sched/core.c                |  6 ++
>  xen/common/shutdown.c                  |  3 +
>  xen/drivers/char/console.c             |  3 +
>  xen/include/xen/fuzzer.h               | 52 +++++++++++++++
>  xen/include/xen/libafl-qemu.h          | 63 ++++++++++++++++++
>  12 files changed, 392 insertions(+)
>  create mode 100644 docs/hypervisor-guide/fuzzing.rst
>  create mode 100644 xen/arch/arm/include/asm/libafl-qemu.h
>  create mode 100644 xen/common/libafl-qemu.c
>  create mode 100644 xen/include/xen/fuzzer.h
>  create mode 100644 xen/include/xen/libafl-qemu.h
> 
> diff --git a/docs/hypervisor-guide/fuzzing.rst b/docs/hypervisor-guide/fuzzing.rst
> new file mode 100644
> index 0000000000..895d858edc
> --- /dev/null
> +++ b/docs/hypervisor-guide/fuzzing.rst
> @@ -0,0 +1,91 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Fuzzing
> +=======
> +
> +It is possible to use LibAFL-QEMU for fuzzing hypervisor. Right now
> +only aarch64 is supported and only hypercall fuzzing is enabled in the
> +test harness, but there are plans to add vGIC interface fuzzing, PSCI
> +fuzzing and vPL011 fuzzing as well.
> +
> +
> +Principle of operation
> +----------------------
> +
> +LibAFL-QEMU is a part of American Fuzzy lop plus plus (AKA AFL++)
> +project. It uses special build of QEMU, that allows to fuzz baremetal
> +software like Xen hypervisor or Linux kernel. Basic idea is that we
> +have software under test (Xen hypervisor in our case) and a test
> +harness application. Test harness uses special protocol to communicate
> +with LibAFL outside of QEMU to get input data and report test
> +result. LibAFL monitors which branches are taken by Xen and mutates
> +input data in attempt to discover new code paths that eventually can
> +lead to a crash or other unintended behavior.
> +
> +LibAFL uses QEMU's `snapshot` feature to run multiple test without
> +restarting the whole system every time. This speeds up fuzzing process
> +greatly.
> +
> +So, to try Xen fuzzing we need three components: LibAFL-based fuzzer,
> +test harness and Xen itself.
> +
> +Building Xen for fuzzing with LibAFL-QEMU
> +-----------------------------------------
> +
> +Xen hypervisor should be built with these three options::
> +
> +  CONFIG_FUZZING=y
> +  CONFIG_FUZZER_LIBAFL_QEMU=y
> +  CONFIG_FUZZER_PASS_BLOCKING=y
> +
> +Building LibAFL-QEMU based fuzzer
> +---------------------------------
> +
> +Fuzzer is written in Rust, so you need Rust toolchain and `cargo` tool
> +in your system. Please refer to your distro documentation on how to
> +obtain them.
> +
> +Once Rust is ready, fetch and build the fuzzer::
> +
> +  # git clone https://github.com/xen-troops/xen-fuzzer-rs
> +  # cd xen-fuzzer-rs
> +  # cargo build
> +
> +Building test harness
> +---------------------
> +
> +We need to make low-level actions, like issuing random hypercalls, so
> +for test harness we use special build of XTF (Xen Testing Framework).
> +You can build XTF manually, or let fuzzer to do this::
> +
> +  # cargo make build_xtf
> +
> +This fill download and build XTF for ARM.
> +
> +Running the fuzzer
> +------------------
> +
> +Please refer to README.md that comes with the fuzzer, but the most
> +versatile way is to run it like this::
> +
> +  # target/debug/xen_fuzzer -t 3600 /path/to/xen \
> +      target/xtf/tests/arm-vgic-fuzzer/test-mmu64le-arm-vgic-fuzzer
> +
> +(assuming that you built XTF with `cargo make build_xtf`)
> +
> +Any inputs that led to crashes will be found in `crashes` directory.
> +
> +You can replay a crash with `-r` option::
> +
> +  # target/debug/xen_fuzzer -r crashes/0195e4fc65828c17 run \
> +      /path/to/xen \
> +      /path/to/harness
> +
> +
> +Fuzzer will return non-zero error code if it encountered any crashes.
> +
> +TODOs
> +-----
> +
> + - Add x86 support.
> + - Implement fuzzing of other external hypervisor interfaces.
> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
> index 5a03b220ac..1a51c5d221 100644
> --- a/xen/arch/arm/Kconfig.debug
> +++ b/xen/arch/arm/Kconfig.debug
> @@ -190,3 +190,40 @@ config EARLY_PRINTK_INC
>  	default "debug-mvebu.inc" if EARLY_UART_MVEBU
>  	default "debug-pl011.inc" if EARLY_UART_PL011
>  	default "debug-scif.inc" if EARLY_UART_SCIF
> +
> +config FUZZING
> +       bool "Build Xen for fuzzing"
> +       help
> +          Enable this option only if you are going to run the hypervisor
> +	  inside a fuzzer. Do not try to run run Xen built with this option
> +	  on any real hardware, because it will likely crash during boot.
> +
> +choice FUZZER
> +       depends on FUZZING
> +       prompt "Fuzzer"
> +
> +config FUZZER_LIBAFL_QEMU
> +	depends on ARM_64
> +	bool "LibAFL-QEMU"
> +	help
> +	  This option enables support for LibAFL-QEMU fuzzer. Choose this
> +	  option only when you are going to run hypervisor inside LibAFL-QEMU.
> +	  Xen will report code section to LibAFL and will report about
> +	  crash when it panics.
> +
> +endchoice
> +
> +config FUZZER_PASS_BLOCKING
> +	depends on FUZZING
> +	bool "Fuzzing: Report any attempt to suspend/destroy a domain as a success"
> +	help
> +	  When fuzzing hypercalls, a fuzzer might make Xen to do something
> +	  that prevents from returning to the caller: reboot or turn off the
> +	  machine, block calling vCPU, crash a domain, etc. Depending on
> +	  fuzzing goal this may be a valid behavior, but as control is not
> +	  returned to the fuzzing harness, it can't tell the fuzzer about
> +	  success. With this option enabled, Xen will do this by itself.
> +
> +          Enable this option only if fuzzing attempt can lead to a
> +	  correct stop, like when fuzzing hypercalls or PSCI.


We have a mix of tabs and spaces here


> diff --git a/xen/arch/arm/include/asm/libafl-qemu.h b/xen/arch/arm/include/asm/libafl-qemu.h
> new file mode 100644
> index 0000000000..9b87eafca9
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/libafl-qemu.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Arch-specific portions of LibAFL-QEMU interface
> + */
> +#ifndef __ASM_ARM_LIBAFL_QEMU_H
> +#define __ASM_ARM_LIBAFL_QEMU_H
> +
> +#define LIBAFL_DEFINE_FUNCTIONS(name, opcode)                           \
> +    libafl_word _libafl_##name##_call0(                                 \
> +        libafl_word action) {                                           \
> +        register unsigned long r0 ASM_REG(0) = action;                  \
> +        __asm__ volatile (                                              \
> +            ".word " XSTRINGIFY(opcode) "\n"                            \
> +            : "+r"(r0)                                                  \
> +            :                                                           \
> +            : "memory"                                                  \
> +            );                                                          \
> +        return r0;                                                      \
> +    }                                                                   \
> +                                                                        \
> +    libafl_word _libafl_##name##_call1(                                 \
> +        libafl_word action, libafl_word arg1) {                         \
> +        register unsigned long r0 ASM_REG(0) = action;                  \
> +        register unsigned long r1 ASM_REG(1) = arg1;                    \
> +        __asm__ volatile (                                              \
> +            ".word " XSTRINGIFY(opcode) "\n"                            \
> +            : "+r"(r0)                                                  \
> +            : "r"(r1)                                                   \
> +            : "memory"                                                  \
> +            );                                                          \
> +        return r0;                                                      \
> +    }                                                                   \
> +                                                                        \
> +    libafl_word _libafl_##name##_call2(                                 \
> +        libafl_word action, libafl_word arg1, libafl_word arg2) {       \
> +        register unsigned long r0 ASM_REG(0) = action;                  \
> +        register unsigned long r1 ASM_REG(1) = arg1;                    \
> +        register unsigned long r2 ASM_REG(2) = arg2;                    \
> +        __asm__ volatile (                                              \
> +            ".word " XSTRINGIFY(opcode) "\n"                            \
> +            : "+r"(r0)                                                  \
> +            : "r"(r1), "r"(r2)                                          \
> +            : "memory"                                                  \
> +            );                                                          \
> +        return r0;                                                      \
> +    }
> +
> +#endif
> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> index b6860a7760..43253b3f71 100644
> --- a/xen/arch/arm/psci.c
> +++ b/xen/arch/arm/psci.c
> @@ -10,6 +10,7 @@
>  
>  
>  #include <xen/acpi.h>
> +#include <xen/fuzzer.h>
>  #include <xen/types.h>
>  #include <xen/init.h>
>  #include <xen/mm.h>
> @@ -62,12 +63,16 @@ void call_psci_cpu_off(void)
>  
>  void call_psci_system_off(void)
>  {
> +    fuzzer_on_block();
> +
>      if ( psci_ver > PSCI_VERSION(0, 1) )
>          arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_OFF, NULL);
>  }
>  
>  void call_psci_system_reset(void)
>  {
> +    fuzzer_on_block();
> +
>      if ( psci_ver > PSCI_VERSION(0, 1) )
>          arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_RESET, NULL);
>  }
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 98f0873056..f2fbf54911 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -78,6 +78,7 @@ extra-y := symbols-dummy.o
>  obj-$(CONFIG_COVERAGE) += coverage/
>  obj-y += sched/
>  obj-$(CONFIG_UBSAN) += ubsan/
> +obj-$(CONFIG_FUZZER_LIBAFL_QEMU) += libafl-qemu.o
>  
>  obj-$(CONFIG_NEEDS_LIBELF) += libelf/
>  obj-$(CONFIG_LIBFDT) += libfdt/
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index abf1969e60..e63a80c26e 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <xen/compat.h>
> +#include <xen/fuzzer.h>
>  #include <xen/init.h>
>  #include <xen/lib.h>
>  #include <xen/ctype.h>
> @@ -1317,6 +1318,8 @@ int domain_shutdown(struct domain *d, u8 reason)
>  
>      spin_unlock(&d->shutdown_lock);
>  
> +    fuzzer_on_block();
> +
>      return 0;
>  }
>  
> diff --git a/xen/common/libafl-qemu.c b/xen/common/libafl-qemu.c
> new file mode 100644
> index 0000000000..a09a2931c6
> --- /dev/null
> +++ b/xen/common/libafl-qemu.c
> @@ -0,0 +1,80 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> +  This file is based on libafl_qemu_impl.h, libafl_qemu_qemu_arch.h
> +  and libafl_qemu_defs.h from LibAFL project.
> +*/
> +#include <xen/lib.h>
> +#include <xen/init.h>
> +#include <xen/kernel.h>
> +#include <xen/spinlock.h>
> +#include <xen/libafl-qemu.h>
> +#include <asm/libafl-qemu.h>
> +
> +/* Generates sync exit functions */
> +LIBAFL_DEFINE_FUNCTIONS(sync_exit, LIBAFL_SYNC_EXIT_OPCODE)
> +
> +    void libafl_qemu_end(enum LibaflQemuEndStatus status)
> +{
> +    _libafl_sync_exit_call1(LIBAFL_QEMU_COMMAND_END, status);
> +}
> +
> +void libafl_qemu_internal_error(void)
> +{
> +    _libafl_sync_exit_call0(LIBAFL_QEMU_COMMAND_INTERNAL_ERROR);
> +}
> +
> +void lqprintf(const char *fmt, ...)
> +{
> +    static DEFINE_SPINLOCK(lock);
> +    static char buffer[LIBAFL_QEMU_PRINTF_MAX_SIZE] = {0};
> +    va_list args;
> +    int res;
> +
> +    spin_lock(&lock);
> +
> +    va_start(args, fmt);
> +    res = vsnprintf(buffer, LIBAFL_QEMU_PRINTF_MAX_SIZE, fmt, args);
> +    va_end(args);
> +
> +    if ( res >= LIBAFL_QEMU_PRINTF_MAX_SIZE )
> +    {
> +        /* buffer is not big enough, either recompile the target with more */
> +        /* space or print less things */
> +        libafl_qemu_internal_error();
> +    }
> +
> +    _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_LQPRINTF,
> +                            (libafl_word)buffer, res);
> +    spin_unlock(&lock);
> +}
> +
> +void libafl_qemu_trace_vaddr_range(libafl_word start,
> +                                   libafl_word end)
> +{
> +    _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_VADDR_FILTER_ALLOW, start, end);
> +}
> +
> +static int init_afl(void)
> +{
> +    vaddr_t xen_text_start = (vaddr_t)_stext;
> +    vaddr_t xen_text_end = (vaddr_t)_etext;
> +
> +    lqprintf("Telling AFL about code section: %lx - %lx\n", xen_text_start,
> +             xen_text_end);
> +
> +    libafl_qemu_trace_vaddr_range(xen_text_start, xen_text_end);
> +
> +    return 0;
> +}
> +
> +__initcall(init_afl);
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> +
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 9043414290..b109a8de44 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -16,6 +16,7 @@
>  #ifndef COMPAT
>  #include <xen/init.h>
>  #include <xen/lib.h>
> +#include <xen/fuzzer.h>
>  #include <xen/param.h>
>  #include <xen/sched.h>
>  #include <xen/sections.h>
> @@ -1429,6 +1430,8 @@ void vcpu_block(void)
>          TRACE_TIME(TRC_SCHED_BLOCK, v->domain->domain_id, v->vcpu_id);
>          raise_softirq(SCHEDULE_SOFTIRQ);
>      }
> +
> +    fuzzer_on_block();
>  }
>  
>  static void vcpu_block_enable_events(void)
> @@ -1502,6 +1505,8 @@ static long do_poll(const struct sched_poll *sched_poll)
>      TRACE_TIME(TRC_SCHED_BLOCK, d->domain_id, v->vcpu_id);
>      raise_softirq(SCHEDULE_SOFTIRQ);
>  
> +    fuzzer_on_block();
> +
>      return 0;
>  
>   out:
> @@ -1529,6 +1534,7 @@ long vcpu_yield(void)
>  
>      TRACE_TIME(TRC_SCHED_YIELD, current->domain->domain_id, current->vcpu_id);
>      raise_softirq(SCHEDULE_SOFTIRQ);
> +
>      return 0;
>  }

Spurious change


> diff --git a/xen/common/shutdown.c b/xen/common/shutdown.c
> index c47341b977..8e82678626 100644
> --- a/xen/common/shutdown.c
> +++ b/xen/common/shutdown.c
> @@ -1,5 +1,6 @@
>  #include <xen/init.h>
>  #include <xen/lib.h>
> +#include <xen/fuzzer.h>
>  #include <xen/param.h>
>  #include <xen/sched.h>
>  #include <xen/sections.h>
> @@ -32,6 +33,8 @@ static void noreturn reboot_or_halt(void)
>  
>  void hwdom_shutdown(unsigned char reason)
>  {
> +    fuzzer_on_block();
> +
>      switch ( reason )
>      {
>      case SHUTDOWN_poweroff:
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index c3150fbdb7..45048351d5 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -16,6 +16,7 @@
>  #include <xen/event.h>
>  #include <xen/console.h>
>  #include <xen/param.h>
> +#include <xen/fuzzer.h>
>  #include <xen/serial.h>
>  #include <xen/softirq.h>
>  #include <xen/keyhandler.h>
> @@ -1289,6 +1290,8 @@ void panic(const char *fmt, ...)
>  
>      kexec_crash(CRASHREASON_PANIC);
>  
> +    fuzzer_crash();
> +
>      if ( opt_noreboot )
>          machine_halt();
>      else
> diff --git a/xen/include/xen/fuzzer.h b/xen/include/xen/fuzzer.h
> new file mode 100644
> index 0000000000..852917fe50
> --- /dev/null
> +++ b/xen/include/xen/fuzzer.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef XEN__FUZZER_H
> +#define XEN__FUZZER_H
> +
> +#include <xen/compiler.h>
> +
> +#ifdef CONFIG_FUZZER_LIBAFL_QEMU
> +#include <xen/libafl-qemu.h>
> +#endif
> +
> +/* Unconditional failure */
> +static always_inline void fuzzer_crash(void)
> +{
> +#ifdef CONFIG_FUZZER_LIBAFL_QEMU
> +    libafl_qemu_end(LIBAFL_QEMU_END_CRASH);
> +#endif
> +}
> +
> +/* Unconditional success */
> +static always_inline void fuzzer_success(void)
> +{
> +#ifdef CONFIG_FUZZER_LIBAFL_QEMU
> +    libafl_qemu_end(LIBAFL_QEMU_END_OK);
> +#endif
> +}
> +
> +/*
> + * Conditional success
> + *
> + * Sometimes a fuzzer might make Xen to do something that prevents
> + * from returning to the caller: reboot or turn off the machine, block
> + * calling vCPU, crash a domain, etc. Depending on fuzzing goal this
> + * may be a valid behavior, but as control is not returned to the
> + * fuzzing harness, it can't tell the fuzzer about success, so we need
> + * to do this ourselves.
> + */
> +static always_inline void fuzzer_on_block(void)
> +{
> +#ifdef CONFIG_FUZZER_PASS_BLOCKING
> +    fuzzer_success();
> +#endif
> +}
> +
> +#endif
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/xen/libafl-qemu.h b/xen/include/xen/libafl-qemu.h
> new file mode 100644
> index 0000000000..f3b32adeca
> --- /dev/null
> +++ b/xen/include/xen/libafl-qemu.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: MIT */
> +#ifndef __XEN_LIBAFL_QEMU_H
> +#define __XEN_LIBAFL_QEMU_H
> +
> +#include <xen/stdint.h>
> +#define LIBAFL_QEMU_PRINTF_MAX_SIZE 4096
> +
> +#define LIBAFL_STRINGIFY(s) #s
> +#define XSTRINGIFY(s) LIBAFL_STRINGIFY(s)
> +
> +#define LIBAFL_SYNC_EXIT_OPCODE 0x66f23a0f
> +
> +typedef enum LibaflQemuCommand
> +{
> +  LIBAFL_QEMU_COMMAND_START_VIRT = 0,
> +  LIBAFL_QEMU_COMMAND_START_PHYS = 1,
> +  LIBAFL_QEMU_COMMAND_INPUT_VIRT = 2,
> +  LIBAFL_QEMU_COMMAND_INPUT_PHYS = 3,
> +  LIBAFL_QEMU_COMMAND_END = 4,
> +  LIBAFL_QEMU_COMMAND_SAVE = 5,
> +  LIBAFL_QEMU_COMMAND_LOAD = 6,
> +  LIBAFL_QEMU_COMMAND_VERSION = 7,
> +  LIBAFL_QEMU_COMMAND_VADDR_FILTER_ALLOW = 8,
> +  LIBAFL_QEMU_COMMAND_INTERNAL_ERROR = 9,
> +  LIBAFL_QEMU_COMMAND_LQPRINTF = 10,
> +  LIBAFL_QEMU_COMMAND_TEST = 11,
> +} LibaflExit;
> +
> +typedef uint64_t libafl_word;
> +
> +/**
> + * LibAFL QEMU header file.
> + *
> + * This file is a portable header file used to build target harnesses more
> + * conveniently. Its main purpose is to generate ready-to-use calls to
> + * communicate with the fuzzer. The list of commands is available at the bottom
> + * of this file. The rest mostly consists of macros generating the code used by
> + * the commands.
> + */
> +
> +enum LibaflQemuEndStatus
> +{
> +  LIBAFL_QEMU_END_UNKNOWN = 0,
> +  LIBAFL_QEMU_END_OK = 1,
> +  LIBAFL_QEMU_END_CRASH = 2,
> +};
> +
> +void libafl_qemu_end(enum LibaflQemuEndStatus status);
> +
> +void libafl_qemu_internal_error(void);
> +
> +void __attribute__((format(printf, 1, 2))) lqprintf(const char *fmt, ...);
> +
> +void libafl_qemu_trace_vaddr_range(libafl_word start, libafl_word end);
> +
> +static always_inline void libafl_qemu_success_on_block(void)
> +{
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> +    libafl_qemu_end(LIBAFL_QEMU_END_OK);
> +#endif
> +}
> +
> +#endif
> -- 
> 2.48.1
> 

