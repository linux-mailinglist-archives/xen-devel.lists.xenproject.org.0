Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DABBA6C66E
	for <lists+xen-devel@lfdr.de>; Sat, 22 Mar 2025 00:32:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924665.1327776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvlpr-0002Dy-Mk; Fri, 21 Mar 2025 23:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924665.1327776; Fri, 21 Mar 2025 23:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvlpr-0002CW-Jl; Fri, 21 Mar 2025 23:31:31 +0000
Received: by outflank-mailman (input) for mailman id 924665;
 Fri, 21 Mar 2025 23:31:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tvlpq-0002CA-S7
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 23:31:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tvlpn-00HI4j-2A;
 Fri, 21 Mar 2025 23:31:27 +0000
Received: from [2a02:8012:3a1:0:d473:3eed:4e56:a8b]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tvlpn-00FMw5-0K;
 Fri, 21 Mar 2025 23:31:27 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=npC1m6wXTjGWEjiR/cRcB3ogVL17yIF4FyZWnyUxW5s=; b=1lKp7nyqE8ga8erKJBdyGV+Vjh
	ZUUfsoR0m/G14uuJdM5Do2DAmZeNJMRZONNvNIXJ4WHWLTrwX3eE3Nb3of47d0+l3MWV2Y1L+7Ehp
	OhClzalLx8G6g6m4Wwkfw1n/VOe+A+8YklemvrrBVytEbivDeNcqGSPaNNSbVwgdWgqE=;
Message-ID: <5d519ffd-8747-4367-b92f-01c20a483e72@xen.org>
Date: Fri, 21 Mar 2025 23:31:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] xen: add libafl-qemu fuzzer support
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>
References: <20250315003544.1101488-1-volodymyr_babchuk@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250315003544.1101488-1-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Volodymyr,

On 15/03/2025 00:36, Volodymyr Babchuk wrote:
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
> Test harness is implemented XTF-based test-case(s). As test harness
> can issue hypercall that shuts itself down, KConfig option
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
> 
> In v2:
> 
>   - Moved to XTF-based test harness
>   - Severely reworked the fuzzer itself. Now it has user-friendly
>     command-line interface and is capable of running in CI, as it now
>     returns an appropriate error code if any faults were found
>   - Also I found, debugged and fixed a nasty bug in LibAFL-QEMU fork,
>     which crashed the whole fuzzer.
> 
> Right now the fuzzer is lockated at Xen Troops repo:
> 
> https://github.com/xen-troops/xen-fuzzer-rs
> 
> But I believe that it is ready to be included into
> gitlab.com/xen-project/
> 
> XTF-based harness is at
> 
> https://gitlab.com/vlad.babchuk/xtf/-/tree/mr_libafl
> 
> and there is corresponding MR for including it into
> 
> https://gitlab.com/xen-project/fusa/xtf/-/tree/xtf-arm
> 
> So, to sum up. All components are basically ready for initial
> inclusion. There will be smaller, integration-related changes
> later. For example - we will need to update URLs for various
> components after they are moved to correct places.
> ---
>   docs/hypervisor-guide/fuzzing.rst           |  90 ++++++++++++
>   xen/arch/arm/Kconfig.debug                  |  26 ++++
>   xen/arch/arm/Makefile                       |   1 +
>   xen/arch/arm/include/asm/libafl_qemu.h      |  54 +++++++
>   xen/arch/arm/include/asm/libafl_qemu_defs.h |  37 +++++
>   xen/arch/arm/libafl_qemu.c                  | 152 ++++++++++++++++++++
>   xen/arch/arm/psci.c                         |  13 ++
>   xen/common/sched/core.c                     |  17 +++
>   xen/common/shutdown.c                       |   7 +
>   xen/drivers/char/console.c                  |   8 ++
>   10 files changed, 405 insertions(+)
>   create mode 100644 docs/hypervisor-guide/fuzzing.rst
>   create mode 100644 xen/arch/arm/include/asm/libafl_qemu.h
>   create mode 100644 xen/arch/arm/include/asm/libafl_qemu_defs.h
>   create mode 100644 xen/arch/arm/libafl_qemu.c
> 
> diff --git a/docs/hypervisor-guide/fuzzing.rst b/docs/hypervisor-guide/fuzzing.rst
> new file mode 100644
> index 0000000000..a5de71dd25
> --- /dev/null
> +++ b/docs/hypervisor-guide/fuzzing.rst
> @@ -0,0 +1,90 @@
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
> +for test harness we use special build of Zephyr application. We use
> +XTF as a test harness. You can build XTF manually, or let fuzzer to do this::
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
> index 5a03b220ac..3b00c77d3a 100644
> --- a/xen/arch/arm/Kconfig.debug
> +++ b/xen/arch/arm/Kconfig.debug
> @@ -190,3 +190,29 @@ config EARLY_PRINTK_INC
>   	default "debug-mvebu.inc" if EARLY_UART_MVEBU
>   	default "debug-pl011.inc" if EARLY_UART_PL011
>   	default "debug-scif.inc" if EARLY_UART_SCIF
> +
> +config LIBAFL_QEMU_FUZZER
> +	bool "Enable LibAFL-QEMU calls"

Looking at the code below, I kind of doubt this is working on arm32. Can 
you confirm? If it doesn't work, then this needs to be "depends on".

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
> index fb0948f067..7b4eaab680 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_TEE) += tee/
>   obj-$(CONFIG_HAS_VPCI) += vpci.o
>   
>   obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
> +obj-${CONFIG_LIBAFL_QEMU_FUZZER} += libafl_qemu.o
>   obj-y += cpuerrata.o
>   obj-y += cpufeature.o
>   obj-y += decode.o
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

Is this defined by libafl or an internal decision?

[...]

> diff --git a/xen/arch/arm/include/asm/libafl_qemu_defs.h b/xen/arch/arm/include/asm/libafl_qemu_defs.h
> new file mode 100644
> index 0000000000..2866cadaac
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/libafl_qemu_defs.h
> @@ -0,0 +1,37 @@

Missing license. Also, is this file taken from somewhere?

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

No-one seems to use STATIC_CHECKS? Is this intended?

> +
> +#define LIBAFL_SYNC_EXIT_OPCODE 0x66f23a0f
 > +#define LIBAFL_BACKDOOR_OPCODE 0x44f23a0f

Are the opcode valid for arm32? If not, they should be protected with 
#ifdef CONFIG_ARM_64.

> +
> +#define LIBAFL_QEMU_TEST_VALUE 0xcafebabe
 > +> +#define LIBAFL_QEMU_HDR_VERSION_NUMBER 0111  // TODO: find a nice 
way to set it.
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

Missing emacs magic.

> diff --git a/xen/arch/arm/libafl_qemu.c b/xen/arch/arm/libafl_qemu.c
> new file mode 100644
> index 0000000000..58924ce6c6
> --- /dev/null
> +++ b/xen/arch/arm/libafl_qemu.c
> @@ -0,0 +1,152 @@
> +/* SPDX-License-Identifier: Apache-2.0 */

See my other reply about the license. I think this need to be resolved 
before sending a new version.

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

Can we store the action directly in x0 (same for the other argunments 
below)? This would avoid to clobber two registers (See smccc.h as an 
example).

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

AFAICT, this buffer is only used by lqprintf(). So it would be better to 
move it in lqprintf(). Also, you don't need {0}.

> +
> +libafl_word libafl_qemu_start_virt(void       *buf_vaddr,
> +                                            libafl_word max_len) {

What coding style is this file meant to use?

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

I am not sure I understand the value of lqprinf(). Why can't we use the 
console? When is this meant to be used?

> +  va_list args;
> +  int res;
> +  va_start(args, fmt);
> +  res = vsnprintf(_lqprintf_buffer, LIBAFL_QEMU_PRINTF_MAX_SIZE, fmt, args);
 > +  va_end(args);

What if lqprintf() is called concurrently?

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
 > +> +	libafl_qemu_trace_vaddr_range(xen_text_start, xen_text_end);
 > +> +	return 0;
> +}
> +
> +__initcall(init_afl);
> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> index b6860a7760..c7a51a1144 100644
> --- a/xen/arch/arm/psci.c
> +++ b/xen/arch/arm/psci.c
> @@ -17,6 +17,7 @@
>   #include <asm/cpufeature.h>
>   #include <asm/psci.h>
>   #include <asm/acpi.h>
> +#include <asm/libafl_qemu.h>
>   
>   /*
>    * While a 64-bit OS can make calls with SMC32 calling conventions, for
> @@ -49,6 +50,10 @@ int call_psci_cpu_on(int cpu)
>   
>   void call_psci_cpu_off(void)
>   {
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> +    libafl_qemu_end(LIBAFL_QEMU_END_OK);
> +#endif

I am a bit confused with this call. For a first, this cannot be reached 
from a VM (or even dom0). Then, even if it is reached, shouldn't we 
allow the test continue while other pCPUs are running?

That said, the call to QEMU is not PSCI related. So shouldn't this be 
called from the callers (same applies to all the changes in PSCI)?

> +
>       if ( psci_ver > PSCI_VERSION(0, 1) )
>       {
>           struct arm_smccc_res res;
> @@ -62,12 +67,20 @@ void call_psci_cpu_off(void)
>   
>   void call_psci_system_off(void)
>   {
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> +    libafl_qemu_end(LIBAFL_QEMU_END_OK);
> +#endif
> +
>       if ( psci_ver > PSCI_VERSION(0, 1) )
>           arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_OFF, NULL);
>   }
>   
>   void call_psci_system_reset(void)
>   {
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> +    libafl_qemu_end(LIBAFL_QEMU_END_OK);
> +#endif
> +
>       if ( psci_ver > PSCI_VERSION(0, 1) )
>           arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_RESET, NULL);
>   }
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 9043414290..55eb132568 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -47,6 +47,10 @@
>   #define pv_shim false
>   #endif
>   
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER

This Kconfig is only defined on Arm but you are using in common code. 
Even if this can't be supported right now, shouldn't this be defined in 
common code?

> +#include <asm/libafl_qemu.h>
> +#endif
> +
>   /* opt_sched: scheduler - default to configured value */
>   static char __initdata opt_sched[10] = CONFIG_SCHED_DEFAULT;
>   string_param("sched", opt_sched);
> @@ -1452,6 +1456,10 @@ static long do_poll(const struct sched_poll *sched_poll)
>       if ( !guest_handle_okay(sched_poll->ports, sched_poll->nr_ports) )
>           return -EFAULT;
>   
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> +    libafl_qemu_end(LIBAFL_QEMU_END_OK);
> +#endif

I think this and all the changes in sched/core need a comment explaning 
why we want to stop the fuzzing. For instance, this one sort of makes 
sense but...

> +
>       set_bit(_VPF_blocked, &v->pause_flags);
>       v->poll_evtchn = -1;
>       set_bit(v->vcpu_id, d->poll_mask);
> @@ -1904,12 +1912,18 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>       {
>       case SCHEDOP_yield:
>       {
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> +        libafl_qemu_end(LIBAFL_QEMU_END_OK);
> +#endif

... this doesn't not. It is just a yield, there is no blocking operations.

>           ret = vcpu_yield();
>           break;
>       }
>   
>       case SCHEDOP_block:
>       {
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> +        libafl_qemu_end(LIBAFL_QEMU_END_OK);
> +#endif
>           vcpu_block_enable_events();
>           break;
>       }
> @@ -1924,6 +1938,9 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>   
>           TRACE_TIME(TRC_SCHED_SHUTDOWN, current->domain->domain_id,
>                      current->vcpu_id, sched_shutdown.reason);
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> +        libafl_qemu_end(LIBAFL_QEMU_END_OK);
> +#endif

Shouldn't this be called from domain_shutdown() to cover all the 
possible shutdown case? I am mainly thinking about domain_crash() which 
you don't seem to handle.

>           ret = domain_shutdown(current->domain, (u8)sched_shutdown.reason);
>   
>           break;
> diff --git a/xen/common/shutdown.c b/xen/common/shutdown.c
> index c47341b977..1340f4b606 100644
> --- a/xen/common/shutdown.c
> +++ b/xen/common/shutdown.c
> @@ -11,6 +11,10 @@
>   #include <xen/kexec.h>
>   #include <public/sched.h>
>   
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER
> +#include <asm/libafl_qemu.h>
> +#endif
> +
>   /* opt_noreboot: If true, machine will need manual reset on error. */
>   bool __ro_after_init opt_noreboot;
>   boolean_param("noreboot", opt_noreboot);
> @@ -32,6 +36,9 @@ static void noreturn reboot_or_halt(void)
>   
>   void hwdom_shutdown(unsigned char reason)
>   {
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> +    libafl_qemu_end(LIBAFL_QEMU_END_OK);
> +#endif

If you call libalf_qemu_end() from domain_shutdown(), then you shouldn't 
need a special case for the hardware domain.

>       switch ( reason )
>       {
>       case SHUTDOWN_poweroff:
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index ba428199d2..55d33fa744 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -40,6 +40,9 @@
>   #ifdef CONFIG_SBSA_VUART_CONSOLE
>   #include <asm/vpl011.h>
>   #endif
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER
> +#include <asm/libafl_qemu.h>
> +#endif
>   
>   /* console: comma-separated list of console outputs. */
>   static char __initdata opt_console[30] = OPT_CONSOLE_STR;
> @@ -1289,6 +1292,11 @@ void panic(const char *fmt, ...)
>   
>       kexec_crash(CRASHREASON_PANIC);
>   
> +    #ifdef CONFIG_LIBAFL_QEMU_FUZZER
> +    /* Tell the fuzzer that we crashed */
> +    libafl_qemu_end(LIBAFL_QEMU_END_CRASH);
> +    #endif
> +
>       if ( opt_noreboot )
>           machine_halt();
>       else

Cheers,

-- 
Julien Grall


