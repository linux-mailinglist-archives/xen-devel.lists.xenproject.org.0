Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD169D1D8C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 02:47:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839635.1255419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDDK4-0005jR-KV; Tue, 19 Nov 2024 01:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839635.1255419; Tue, 19 Nov 2024 01:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDDK4-0005gz-Hx; Tue, 19 Nov 2024 01:46:32 +0000
Received: by outflank-mailman (input) for mailman id 839635;
 Tue, 19 Nov 2024 01:46:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IGE8=SO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tDDK3-0005gt-SU
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 01:46:31 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15d0bb22-a618-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 02:46:25 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 75817A42164;
 Tue, 19 Nov 2024 01:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245A0C4CECC;
 Tue, 19 Nov 2024 01:46:22 +0000 (UTC)
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
X-Inumbo-ID: 15d0bb22-a618-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE0Ny43NS4xOTMuOTEiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjE1ZDBiYjIyLWE2MTgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTgwNzg1LjY4OTcwNywic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731980783;
	bh=uZ8gNZOGUyYluIRtYstj/uyEWXle5jyQ/fwwao8ihC0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MiP1t8vFdv23aTWdsug+oMdgcqgSwx1aFz9O6ZFZzFm6E6dHgd0ta5VbOZlnXwtPy
	 tctuZ4Ssb3FCmBbXWyC3iqMFEThkghSwmtVovj/1vYH4ELAgfGdKajcqvXpoMZcnMq
	 4eN94BFNtlVkTyR1TCUdkKpIjMr3ZeqFFupVs/qwKwp3LV5ogaC6Dla3Y8mnrFLrDG
	 dclUNaXFdOWSthdrBSeJS+0S0camd/dKWp9FVNbNEzzL4Uln6rJkrJZTsRPQpcRqX0
	 aIDB319TkWfnaytVjlueaiUjWmY1trbQjozmVP1KAL7ytIZUGqczvstQOkKa5jqqUy
	 LvTzqGcKtyviA==
Date: Mon, 18 Nov 2024 17:46:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, Dario Faggioli <dfaggioli@suse.com>, 
    Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: Re: [RFC PATCH] xen: add libafl-qemu fuzzer support
In-Reply-To: <20241114224636.1942089-1-volodymyr_babchuk@epam.com>
Message-ID: <alpine.DEB.2.22.394.2411181737570.1160299@ubuntu-linux-20-04-desktop>
References: <20241114224636.1942089-1-volodymyr_babchuk@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Nov 2024, Volodymyr Babchuk wrote:
> LibAFL, which is a part of AFL++ project is a instrument that allows
> us to perform fuzzing on beremetal code (Xen hypervisor in this case)
> using QEMU as an emulator. It employs QEMU's ability to create
> snapshots to run many tests relatively quickly: system state is saved
> right before executing a new test and restored after the test is
> finished.
> 
> This patch adds all necessary plumbing to run aarch64 build of Xen
> inside that LibAFL-QEMU fuzzer. From the Xen perspective we need to
> do following things:
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
> Test harness is implemented as a Zephyr-based application which launches
> as Dom0 kernel and performs different tests. As test harness can issue
> hypercall that shuts itself down, KConfig option
> CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING was added. It basically tells
> fuzzer that test was completed successfully if Dom0 tries to shut
> itself (or the whole machine) down.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> 
> I tried to fuzz the vGIC emulator and hypercall interface. While vGIC
> fuzzing didn't yield any interesting results, hypercall fuzzing found a
> way to crash the hypervisor from Dom0 on aarch64, using
> "XEN_SYSCTL_page_offline_op" with "sysctl_query_page_offline" sub-op,
> because it leads to page_is_ram_type() call which is marked
> UNREACHABLE on ARM.
> ---
>  docs/hypervisor-guide/fuzzing.rst           | 102 +++++++++++++
>  xen/arch/arm/Kconfig.debug                  |  26 ++++
>  xen/arch/arm/Makefile                       |   1 +
>  xen/arch/arm/include/asm/libafl_qemu.h      |  54 +++++++
>  xen/arch/arm/include/asm/libafl_qemu_defs.h |  37 +++++
>  xen/arch/arm/libafl_qemu.c                  | 152 ++++++++++++++++++++
>  xen/arch/arm/psci.c                         |  13 ++
>  xen/common/sched/core.c                     |  17 +++
>  xen/common/shutdown.c                       |   7 +
>  xen/drivers/char/console.c                  |   8 ++
>  10 files changed, 417 insertions(+)
>  create mode 100644 docs/hypervisor-guide/fuzzing.rst
>  create mode 100644 xen/arch/arm/include/asm/libafl_qemu.h
>  create mode 100644 xen/arch/arm/include/asm/libafl_qemu_defs.h
>  create mode 100644 xen/arch/arm/libafl_qemu.c
> 
> diff --git a/docs/hypervisor-guide/fuzzing.rst b/docs/hypervisor-guide/fuzzing.rst
> new file mode 100644
> index 0000000000..9570de7670
> --- /dev/null
> +++ b/docs/hypervisor-guide/fuzzing.rst
> @@ -0,0 +1,102 @@
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
> +Building Xen for fuzzing
> +------------------------
> +
> +Xen hypervisor should be built with these two options::
> +
> + CONFIG_LIBAFL_QEMU_FUZZER=y
> + CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING=y
> +
> +Building test harness
> +---------------------
> +
> +We need to make low-level actions, like issuing random hypercalls, so
> +for test harness we use special build of Zephyr application.
> +
> +You need to prepare environment for building Zephyr as described in
> +getting `started guide
> +<https://docs.zephyrproject.org/latest/develop/getting_started/index.html>`_.
> +
> +Next, download test harness application and built it::
> +
> +  # mkdir zephyr-harness
> +  # cd zephyr-harness
> +  # west init -m https://github.com/xen-troops/xen-fuzzer-harness
> +  # cd xen-fuzzer-harness
> +  # west update
> +  # west build
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

Is this the only way to trigger the fuzzer? Are there other ways (e.g.
other languages or scripts)? If this is the only way, do we expect it to
grow much over time, or is it just a minimal shim only to invoke the
fuzzer (so basically we need an x86 version of it but that's pretty much
it in terms of growth)?


> +Running the fuzzer
> +------------------
> +
> +Run it like this::
> +
> +  # target/debug/xen_fuzzer  -accel tcg \
> +  -machine virt,virtualization=yes,acpi=off \
> +  -m 4G \
> +  -L  target/debug/qemu-libafl-bridge/pc-bios  \
> +  -nographic \
> +  -cpu max \
> +  -append 'dom0_mem=512 loglvl=none guest_loglvl=none console=dtuart' \
> +  -kernel /path/to/xen/xen/xen \
> +  -device guest-loader,addr=0x42000000,kernel=/path/to/zephyr-harness/build/zephyr/zephyr.bin \
> +  -snapshot
> +
> +Any inputs that led to crashes will be found in `crashes` directory.
> +
> +You can use standard QEMU parameters to redirect console output,
> +change memory size, HW compisition, etc.
> +
> +
> +TODOs
> +-----
> +
> + - Add x86 support.
> + - Implement fuzzing of other external hypervisor interfaces.
> + - Better integration: user should not build manually multiple
> +   different projects
> + - Add ability to re-run fuzzer with a given input to make crash
> +   debugging more comfortable
> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
> index 7660e599c0..9e2c4649ed 100644
> --- a/xen/arch/arm/Kconfig.debug
> +++ b/xen/arch/arm/Kconfig.debug
> @@ -183,3 +183,29 @@ config EARLY_PRINTK_INC
>  	default "debug-mvebu.inc" if EARLY_UART_MVEBU
>  	default "debug-pl011.inc" if EARLY_UART_PL011
>  	default "debug-scif.inc" if EARLY_UART_SCIF
> +
> +config LIBAFL_QEMU_FUZZER
> +	bool "Enable LibAFL-QEMU calls"
> +	help
> +	  This option enables support for LibAFL-QEMU calls. Enable this
> +	  only when you are going to run hypervisor inside LibAFL-QEMU.
> +	  Xen will report code section to LibAFL and will report about
> +	  crash when it panics.
> +
> +	  Do not try to run Xen built on this option on any real hardware
> +	  or plain QEMU, because it will just crash during startup.
> +
> +config LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> +	depends on LIBAFL_QEMU_FUZZER
> +	bool "LibAFL: Report any attempt to suspend/destroy a domain as a success"
> +	help
> +	  When fuzzing hypercalls, fuzzer sometimes will issue an hypercall that
> +	  leads to a domain shutdown, or machine shutdown, or vCPU being
> +	  blocked, or something similar. In this case test harness will not be
> +	  able to report about successfully handled call to the fuzzer. Fuzzer
> +	  will report timeout and mark this as a crash, which is not true. So,
> +	  in such cases we need to report about successfully test case from the
> +	  hypervisor itself.
> +
> +          Enable this option only if fuzzing attempt can lead to a correct
> +	  stoppage, like when fuzzing hypercalls or PSCI.
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index e4ad1ce851..51b5e15b6a 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_TEE) += tee/
>  obj-$(CONFIG_HAS_VPCI) += vpci.o
>  
>  obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
> +obj-${CONFIG_LIBAFL_QEMU_FUZZER} += libafl_qemu.o
>  obj-y += cpuerrata.o
>  obj-y += cpufeature.o
>  obj-y += decode.o
> diff --git a/xen/arch/arm/include/asm/libafl_qemu.h b/xen/arch/arm/include/asm/libafl_qemu.h
> new file mode 100644
> index 0000000000..b90cf48b9a
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/libafl_qemu.h
> @@ -0,0 +1,54 @@
> +#ifndef LIBAFL_QEMU_H
> +#define LIBAFL_QEMU_H
> +
> +#include <xen/stdint.h>
> +#include "libafl_qemu_defs.h"
> +#define LIBAFL_QEMU_PRINTF_MAX_SIZE 4096
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
> +enum LibaflQemuEndStatus {
> +  LIBAFL_QEMU_END_UNKNOWN = 0,
> +  LIBAFL_QEMU_END_OK = 1,
> +  LIBAFL_QEMU_END_CRASH = 2,
> +};
> +
> +libafl_word libafl_qemu_start_virt(void *buf_vaddr, libafl_word max_len);
> +
> +libafl_word libafl_qemu_start_phys(void *buf_paddr, libafl_word max_len);
> +
> +libafl_word libafl_qemu_input_virt(void *buf_vaddr, libafl_word max_len);
> +
> +libafl_word libafl_qemu_input_phys(void *buf_paddr, libafl_word max_len);
> +
> +void libafl_qemu_end(enum LibaflQemuEndStatus status);
> +
> +void libafl_qemu_save(void);
> +
> +void libafl_qemu_load(void);
> +
> +libafl_word libafl_qemu_version(void);
> +
> +void libafl_qemu_page_current_allow(void);
> +
> +void libafl_qemu_internal_error(void);
> +
> +void __attribute__((format(printf, 1, 2))) lqprintf(const char *fmt, ...);
> +
> +void libafl_qemu_test(void);
> +
> +void libafl_qemu_trace_vaddr_range(libafl_word start, libafl_word end);
> +
> +void libafl_qemu_trace_vaddr_size(libafl_word start, libafl_word size);
> +
> +#endif
> diff --git a/xen/arch/arm/include/asm/libafl_qemu_defs.h b/xen/arch/arm/include/asm/libafl_qemu_defs.h
> new file mode 100644
> index 0000000000..2866cadaac
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/libafl_qemu_defs.h
> @@ -0,0 +1,37 @@
> +#ifndef LIBAFL_QEMU_DEFS
> +#define LIBAFL_QEMU_DEFS
> +
> +#define LIBAFL_STRINGIFY(s) #s
> +#define XSTRINGIFY(s) LIBAFL_STRINGIFY(s)
> +
> +#if __STDC_VERSION__ >= 201112L
> +  #define STATIC_CHECKS                                   \
> +    _Static_assert(sizeof(void *) <= sizeof(libafl_word), \
> +                   "pointer type should not be larger and libafl_word");
> +#else
> +  #define STATIC_CHECKS
> +#endif
> +
> +#define LIBAFL_SYNC_EXIT_OPCODE 0x66f23a0f
> +#define LIBAFL_BACKDOOR_OPCODE 0x44f23a0f
> +
> +#define LIBAFL_QEMU_TEST_VALUE 0xcafebabe
> +
> +#define LIBAFL_QEMU_HDR_VERSION_NUMBER 0111  // TODO: find a nice way to set it.
> +
> +typedef enum LibaflQemuCommand {
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
> +#endif
> diff --git a/xen/arch/arm/libafl_qemu.c b/xen/arch/arm/libafl_qemu.c
> new file mode 100644
> index 0000000000..58924ce6c6
> --- /dev/null
> +++ b/xen/arch/arm/libafl_qemu.c
> @@ -0,0 +1,152 @@
> +/* SPDX-License-Identifier: Apache-2.0 */
> +/*
> +   This file is based on libafl_qemu_impl.h and libafl_qemu_qemu_arch.h
> +   from LibAFL project.
> +*/
> +#include <xen/lib.h>
> +#include <xen/init.h>
> +#include <xen/kernel.h>
> +#include <asm/libafl_qemu.h>
> +
> +#define LIBAFL_DEFINE_FUNCTIONS(name, opcode)				\
> +	libafl_word _libafl_##name##_call0(	\
> +		libafl_word action) {					\
> +		libafl_word ret;					\
> +		__asm__ volatile (					\
> +			"mov x0, %1\n"					\
> +			".word " XSTRINGIFY(opcode) "\n"		\
> +			"mov %0, x0\n"					\
> +			: "=r"(ret)					\
> +			: "r"(action)					\
> +			: "x0"						\
> +			);						\
> +		return ret;						\
> +	}								\
> +									\
> +	libafl_word _libafl_##name##_call1(	\
> +		libafl_word action, libafl_word arg1) {			\
> +		libafl_word ret;					\
> +		__asm__ volatile (					\
> +			"mov x0, %1\n"					\
> +			"mov x1, %2\n"					\
> +			".word " XSTRINGIFY(opcode) "\n"		\
> +			"mov %0, x0\n"					\
> +			: "=r"(ret)					\
> +			: "r"(action), "r"(arg1)			\
> +			: "x0", "x1"					\
> +			);						\
> +		return ret;						\
> +	}								\
> +									\
> +	libafl_word _libafl_##name##_call2(	\
> +		libafl_word action, libafl_word arg1, libafl_word arg2) { \
> +		libafl_word ret;					\
> +		__asm__ volatile (					\
> +			"mov x0, %1\n"					\
> +			"mov x1, %2\n"					\
> +			"mov x2, %3\n"					\
> +			".word " XSTRINGIFY(opcode) "\n"		\
> +			"mov %0, x0\n"					\
> +			: "=r"(ret)					\
> +			: "r"(action), "r"(arg1), "r"(arg2)		\
> +			: "x0", "x1", "x2"				\
> +			);						\
> +		return ret;						\
> +	}
> +
> +// Generates sync exit functions
> +LIBAFL_DEFINE_FUNCTIONS(sync_exit, LIBAFL_SYNC_EXIT_OPCODE)
> +
> +// Generates backdoor functions
> +LIBAFL_DEFINE_FUNCTIONS(backdoor, LIBAFL_BACKDOOR_OPCODE)
> +
> +static char _lqprintf_buffer[LIBAFL_QEMU_PRINTF_MAX_SIZE] = {0};
> +
> +libafl_word libafl_qemu_start_virt(void       *buf_vaddr,
> +                                            libafl_word max_len) {
> +  return _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_START_VIRT,
> +                                 (libafl_word)buf_vaddr, max_len);
> +}
> +
> +libafl_word libafl_qemu_start_phys(void       *buf_paddr,
> +                                            libafl_word max_len) {
> +  return _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_START_PHYS,
> +                                 (libafl_word)buf_paddr, max_len);
> +}
> +
> +libafl_word libafl_qemu_input_virt(void       *buf_vaddr,
> +                                            libafl_word max_len) {
> +  return _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_INPUT_VIRT,
> +                                 (libafl_word)buf_vaddr, max_len);
> +}
> +
> +libafl_word libafl_qemu_input_phys(void       *buf_paddr,
> +                                            libafl_word max_len) {
> +  return _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_INPUT_PHYS,
> +                                 (libafl_word)buf_paddr, max_len);
> +}
> +
> +void libafl_qemu_end(enum LibaflQemuEndStatus status) {
> +  _libafl_sync_exit_call1(LIBAFL_QEMU_COMMAND_END, status);
> +}
> +
> +void libafl_qemu_save(void) {
> +  _libafl_sync_exit_call0(LIBAFL_QEMU_COMMAND_SAVE);
> +}
> +
> +void libafl_qemu_load(void) {
> +  _libafl_sync_exit_call0(LIBAFL_QEMU_COMMAND_LOAD);
> +}
> +
> +libafl_word libafl_qemu_version(void) {
> +  return _libafl_sync_exit_call0(LIBAFL_QEMU_COMMAND_VERSION);
> +}
> +
> +void libafl_qemu_internal_error(void) {
> +  _libafl_sync_exit_call0(LIBAFL_QEMU_COMMAND_INTERNAL_ERROR);
> +}
> +
> +void lqprintf(const char *fmt, ...) {
> +  va_list args;
> +  int res;
> +  va_start(args, fmt);
> +  res = vsnprintf(_lqprintf_buffer, LIBAFL_QEMU_PRINTF_MAX_SIZE, fmt, args);
> +  va_end(args);
> +
> +  if (res >= LIBAFL_QEMU_PRINTF_MAX_SIZE) {
> +    // buffer is not big enough, either recompile the target with more
> +    // space or print less things
> +    libafl_qemu_internal_error();
> +  }
> +
> +  _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_LQPRINTF,
> +                          (libafl_word)_lqprintf_buffer, res);
> +}
> +
> +void libafl_qemu_test(void) {
> +  _libafl_sync_exit_call1(LIBAFL_QEMU_COMMAND_TEST, LIBAFL_QEMU_TEST_VALUE);
> +}
> +
> +void libafl_qemu_trace_vaddr_range(libafl_word start,
> +                                            libafl_word end) {
> +  _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_VADDR_FILTER_ALLOW, start, end);
> +}
> +
> +void libafl_qemu_trace_vaddr_size(libafl_word start,
> +                                           libafl_word size) {
> +  libafl_qemu_trace_vaddr_range(start, start + size);
> +}
> +
> +static int init_afl(void)
> +{
> +	vaddr_t xen_text_start = (vaddr_t)_stext;
> +	vaddr_t xen_text_end = (vaddr_t)_etext;
> +
> +	lqprintf("Telling AFL about code section: %lx - %lx\n", xen_text_start, xen_text_end);
> +
> +	libafl_qemu_trace_vaddr_range(xen_text_start, xen_text_end);
> +
> +	return 0;
> +}
> +
> +__initcall(init_afl);
> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> index b6860a7760..c7a51a1144 100644
> --- a/xen/arch/arm/psci.c
> +++ b/xen/arch/arm/psci.c
> @@ -17,6 +17,7 @@
>  #include <asm/cpufeature.h>
>  #include <asm/psci.h>
>  #include <asm/acpi.h>
> +#include <asm/libafl_qemu.h>
>  
>  /*
>   * While a 64-bit OS can make calls with SMC32 calling conventions, for
> @@ -49,6 +50,10 @@ int call_psci_cpu_on(int cpu)
>  
>  void call_psci_cpu_off(void)
>  {
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> +    libafl_qemu_end(LIBAFL_QEMU_END_OK);
> +#endif

I think we should add a wrapper with an empty implementation in the
regular case and the call to libafl_qemu_end when the fuzzer is enabled.
So that here it becomes just something like:

  fuzzer_success();


>      if ( psci_ver > PSCI_VERSION(0, 1) )
>      {
>          struct arm_smccc_res res;
> @@ -62,12 +67,20 @@ void call_psci_cpu_off(void)
>  
>  void call_psci_system_off(void)
>  {
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> +    libafl_qemu_end(LIBAFL_QEMU_END_OK);
> +#endif
> +
>      if ( psci_ver > PSCI_VERSION(0, 1) )
>          arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_OFF, NULL);
>  }
>  
>  void call_psci_system_reset(void)
>  {
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> +    libafl_qemu_end(LIBAFL_QEMU_END_OK);
> +#endif
> +
>      if ( psci_ver > PSCI_VERSION(0, 1) )
>          arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_RESET, NULL);
>  }
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index d6296d99fd..fd722e0231 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -47,6 +47,10 @@
>  #define pv_shim false
>  #endif
>  
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER
> +#include <asm/libafl_qemu.h>
> +#endif
> +
>  /* opt_sched: scheduler - default to configured value */
>  static char __initdata opt_sched[10] = CONFIG_SCHED_DEFAULT;
>  string_param("sched", opt_sched);
> @@ -1452,6 +1456,10 @@ static long do_poll(const struct sched_poll *sched_poll)
>      if ( !guest_handle_okay(sched_poll->ports, sched_poll->nr_ports) )
>          return -EFAULT;
>  
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> +    libafl_qemu_end(LIBAFL_QEMU_END_OK);
> +#endif

I am not sure about this one, why is this a success?

Honestly, aside from these two comments, this looks quite good. I would
suggest adding a GitLab CI job to exercise this, if nothing else, to
serve as an integration point since multiple components are required for
this to work.


>      set_bit(_VPF_blocked, &v->pause_flags);
>      v->poll_evtchn = -1;
>      set_bit(v->vcpu_id, d->poll_mask);
> @@ -1887,12 +1895,18 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      {
>      case SCHEDOP_yield:
>      {
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> +        libafl_qemu_end(LIBAFL_QEMU_END_OK);
> +#endif
>          ret = vcpu_yield();
>          break;
>      }
>  
>      case SCHEDOP_block:
>      {
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> +        libafl_qemu_end(LIBAFL_QEMU_END_OK);
> +#endif
>          vcpu_block_enable_events();
>          break;
>      }
> @@ -1907,6 +1921,9 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  
>          TRACE_TIME(TRC_SCHED_SHUTDOWN, current->domain->domain_id,
>                     current->vcpu_id, sched_shutdown.reason);
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> +        libafl_qemu_end(LIBAFL_QEMU_END_OK);
> +#endif
>          ret = domain_shutdown(current->domain, (u8)sched_shutdown.reason);
>  
>          break;
> diff --git a/xen/common/shutdown.c b/xen/common/shutdown.c
> index c47341b977..1340f4b606 100644
> --- a/xen/common/shutdown.c
> +++ b/xen/common/shutdown.c
> @@ -11,6 +11,10 @@
>  #include <xen/kexec.h>
>  #include <public/sched.h>
>  
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER
> +#include <asm/libafl_qemu.h>
> +#endif
> +
>  /* opt_noreboot: If true, machine will need manual reset on error. */
>  bool __ro_after_init opt_noreboot;
>  boolean_param("noreboot", opt_noreboot);
> @@ -32,6 +36,9 @@ static void noreturn reboot_or_halt(void)
>  
>  void hwdom_shutdown(unsigned char reason)
>  {
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> +    libafl_qemu_end(LIBAFL_QEMU_END_OK);
> +#endif
>      switch ( reason )
>      {
>      case SHUTDOWN_poweroff:
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 7da8c5296f..1262515e70 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -41,6 +41,9 @@
>  #ifdef CONFIG_SBSA_VUART_CONSOLE
>  #include <asm/vpl011.h>
>  #endif
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER
> +#include <asm/libafl_qemu.h>
> +#endif
>  
>  /* console: comma-separated list of console outputs. */
>  static char __initdata opt_console[30] = OPT_CONSOLE_STR;
> @@ -1299,6 +1302,11 @@ void panic(const char *fmt, ...)
>  
>      kexec_crash(CRASHREASON_PANIC);
>  
> +    #ifdef CONFIG_LIBAFL_QEMU_FUZZER
> +    /* Tell the fuzzer that we crashed */
> +    libafl_qemu_end(LIBAFL_QEMU_END_CRASH);
> +    #endif
> +
>      if ( opt_noreboot )
>          machine_halt();
>      else
> -- 
> 2.47.0
> 

