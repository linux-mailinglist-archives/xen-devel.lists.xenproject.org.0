Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eCQfNMywNWow3QYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 23:12:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3130D6A7C6D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 23:12:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xen.org header.s=20200302mail header.b=6JmgWyBG;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none
Received: from list by lists.xenproject.org with outflank-mailman.1342664.1602699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wagVW-0008FL-Jf; Fri, 19 Jun 2026 21:12:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342664.1602699; Fri, 19 Jun 2026 21:12:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wagVW-0008CZ-Gp; Fri, 19 Jun 2026 21:12:10 +0000
Received: by outflank-mailman (input) for mailman id 1342664;
 Fri, 19 Jun 2026 21:12:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wagVV-0008CK-50
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 21:12:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wagVU-00HVTB-1T;
 Fri, 19 Jun 2026 21:12:08 +0000
Received: from [2a02:8012:3a1:0:28f2:e98a:6c7b:919d]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wagVT-00B7aR-1c;
 Fri, 19 Jun 2026 21:12:08 +0000
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
	bh=ZT9lCx3ylW1TVeuJoWag1Jsru8p8upMZ8bmoIUn2TVA=; b=6JmgWyBGC8RJTZjvlQGQfAvV+k
	nFIgz75qdMY/4o3Mhj2zRS7eCOMAvSJW8zwTWcLgytHhBmUPkqGsEB05LjZixIjNi7l6hAfJ3e34c
	L/evgdDXIlyld/cbhdIW5VvO8pGHLmuhUDWfZUTgqk1A3V60WDTFdtzxZ5MPx2+X+oMg=;
Message-ID: <b1e5ec80-a6be-4339-a06e-a47110349cd4@xen.org>
Date: Fri, 19 Jun 2026 22:12:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for 4.23] Add GICv3 SGI boot/self tests in Xen
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260529170956.49797-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20260529170956.49797-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ayan.kumar.halder@amd.com,m:xen-devel@lists.xenproject.org,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gitlab.com:url,xen.org:dkim,xen.org:mid,xen.org:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,xenproject.org:url];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[xen.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3130D6A7C6D

Hi Ayan,

On 29/05/2026 18:09, Ayan Kumar Halder wrote:
> Boot self-tests (also referred to as boot-time tests or power-on
> self-tests) are intended to validate internal features of Xen during
> bring-up. They are meant to be run in a debug / validation environment;
> Xen is not expected to remain functional for production use after the
> self-tests have executed.

Looking at the code below, isn't Xen functional even after the self-test?

> The purpose of these tests is to catch
> hardware configuration issues early and to confirm that the platform
> on which Xen has been brought up is sane. The expected flow is:
> build Xen with the self-tests enabled, boot it, inspect the results,
> and then reboot into the usual production configuration.
> 
> Introduce the tests to confirm that:
> 1. A cpu can send SGI 0 to itself
> 2. A cpu can send SGI 0 to another specific CPU
> 3. A cpu can send SGI 0 to all the other CPUs
> 4. A cpu can send SGI 1 to another CPU

I am not sure what you meant by SGI 0 and SGI 1? Below you seem to be 
use only a SGI (which is neither 0 or 1) except for one specific test: 
cpu 0 injecting an SGI to a specific CPU (0).

> 
> These tests aim to test Xen has configured the GIC correctly to use SGIs.
> Thus, the tests invoke specific APIs of GIC driver.
> 
> Also, introduce a config CONFIG_BOOT_SELFTEST which enables these tests.
> The option defaults to N; it should be disabled for production builds and
> is intended for the validation pipeline and coverage measurement. The
> tests run during Xen boot and validate internal interfaces such as Xen's
> interface with hardware, firmware and the bootloader.
> 
> Also, introduce an integer command line parameter "gic-test". By default, it
> is set to 0 which means no tests are enabled.
> For running SGI tests, "gic-test" should be set to 1. In future if we add
> tests for distributer, ITS, LPI, etc, then we can use different numbers.
> Thus, each number denotes a functionality of GICv3 which can be tested
> independently and within a single boot of Xen.
> 
> In this way, we ensure that the tests to validate SGIs do not impact any other
> tests.
> 
> In order to keep all the boot-time self-tests together in the binary, we
> have introduced a separate section "initcallboottest". All the tests are
> registered using __initcallboottest. During the bootup of each core, Xen
> invokes do_init_boottests() to run the these tests. All these tests are
> invoked before Xen creates the domains (in case of primary core) or runs
> the idle loop (in case of secondary core).
> 
> Note: it was suggested that, once the boot self-tests have run, Xen
> should call machine_halt() rather than continue booting (since this
> build is only intended for validation). This is not wired in here
> because the SGIs are sent from the primary and secondary CPUs and
> received asynchronously on the target CPUs. There is no definite point
> in the boot flow at which Xen can know that every send has been
> observed by its receiver, so "after the tests have completed" has no
> well-defined moment at which to insert machine_halt().
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Link to v1 (RFC):
> https://lists.xenproject.org/archives/html/xen-devel/2025-09/msg00956.html
> 
> Upstream CI run (xen-project/people/ayankuma/xen fork, one commit on
> top of xen-project/xen staging — all Linux builds + tests including
> qemu-smoke-boot-selftest-arm64-gcc-debug passed; only the macos jobs
> sit pending because the personal fork has no macos runner):
> https://gitlab.com/xen-project/people/ayankuma/xen/-/pipelines/2561806695
> 
> Changes in v2:
>   - Renamed the patch from "xen/arm: Introduce GICV3 Self Tests" to
>     "Add GICv3 SGI boot/self tests in Xen", and rewrote the commit
>     message to explain the intent of boot self-tests (debug /
>     validation builds only, Xen not expected to remain functional
>     afterwards).
>   - Moved the selftest code out of gic-v3.c into a dedicated file
>     xen/arch/arm/gic-test.c, gated by CONFIG_BOOT_SELFTEST
>     (Stefano, Grygorii).
>   - Introduced a generic boot-self-test framework: new section
>     "initcallboottest", registration macro __initcallboottest, and
>     do_init_boottests() invoked once per CPU after
>     local_irq_enable(), so the test runs on every CPU (boot +
>     secondaries) and no longer collides with the IRQ-enable timing
>     in gicv3_init() (Julien #1, Julien #3).
>   - Added Kconfig option CONFIG_BOOT_SELFTEST in
>     xen/arch/arm/Kconfig (arm-only for now; arch-specific because
>     the only registered test is GICv3-specific).
>   - Reserved a dedicated SGI value GIC_SGI_TEST in enum gic_sgi
>     (xen/arch/arm/include/asm/gic.h), so the selftest never
>     reuses a functional SGI (Grygorii #3).
>   - Added a runtime integer command-line parameter "gic-test" so
>     the selftest binary can be shipped but its execution selected
>     at boot (gic-test=0 -> no-op; gic-test=1 -> SGI tests). Future
>     GICv3 features (distributor, ITS, LPI, ...) can claim further
>     values (Grygorii #2, partial).
>   - Documented why machine_halt() is not invoked after the tests:
>     SGI delivery is asynchronous, so there is no well-defined
>     point after which every send has been observed by its
>     receiver (Julien #2).
>   - Wired the tests into upstream GitLab CI: new build job
>     alpine-3.18-gcc-debug-arm64-boot-selftest, new test job
>     qemu-smoke-boot-selftest-arm64-gcc-debug, and the runner
>     script automation/scripts/qemu-boot-selftest-arm64.sh that
>     dumps the QEMU virt DTB, injects
>     "gic-test=1 console=dtuart sync_console" into
>     /chosen/xen,xen-bootargs via fdtput, boots Xen, and checks
>     for each "Sending GIC_SGI_TEST ..." followed by the matching
>     "CPU%u: GIC_SGI_TEST received".
> 
>   automation/gitlab-ci/build.yaml               |  8 ++
>   automation/gitlab-ci/test.yaml                |  8 ++
>   .../scripts/qemu-boot-selftest-arm64.sh       | 81 +++++++++++++++++++
>   xen/arch/arm/Kconfig                          | 15 ++++
>   xen/arch/arm/Makefile                         |  1 +
>   xen/arch/arm/gic-test.c                       | 52 ++++++++++++
>   xen/arch/arm/gic.c                            |  5 ++
>   xen/arch/arm/include/asm/gic.h                |  3 +
>   xen/arch/arm/setup.c                          |  2 +
>   xen/arch/arm/smpboot.c                        |  2 +
>   xen/arch/arm/xen.lds.S                        |  4 +
>   xen/common/kernel.c                           | 11 +++
>   xen/include/xen/init.h                        |  3 +
>   13 files changed, 195 insertions(+)
>   create mode 100755 automation/scripts/qemu-boot-selftest-arm64.sh
>   create mode 100644 xen/arch/arm/gic-test.c
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 7f5b5938e8..8df45caa86 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -439,6 +439,14 @@ alpine-3.18-gcc-debug-arm64:
>         CONFIG_UBSAN=y
>         CONFIG_UBSAN_FATAL=y
>   
> +alpine-3.18-gcc-debug-arm64-boot-selftest:
> +  extends: .gcc-arm64-build-debug
> +  <<: *build-test
> +  variables:
> +    CONTAINER: alpine:3.18-arm64v8
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_BOOT_SELFTEST=y
> +
>   alpine-3.18-gcc-arm64-randconfig:
>     extends: .gcc-arm64-build
>     variables:
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 8770c523e2..2398c6299a 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -524,6 +524,14 @@ qemu-smoke-dom0less-arm64-gcc-debug-gicv3:
>       - *arm64-test-needs
>       - alpine-3.18-gcc-debug-arm64
>   
> +qemu-smoke-boot-selftest-arm64-gcc-debug:
> +  extends: .qemu-arm64
> +  script:
> +    - ./automation/scripts/qemu-boot-selftest-arm64.sh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *arm64-test-needs
> +    - alpine-3.18-gcc-debug-arm64-boot-selftest
> +
>   qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
>     extends: .qemu-arm64
>     script:
> diff --git a/automation/scripts/qemu-boot-selftest-arm64.sh b/automation/scripts/qemu-boot-selftest-arm64.sh
> new file mode 100755
> index 0000000000..a37dba3e07
> --- /dev/null
> +++ b/automation/scripts/qemu-boot-selftest-arm64.sh
> @@ -0,0 +1,81 @@
> +#!/bin/bash
> +
> +set -ex -o pipefail
> +
> +# Boot the prebuilt Xen binary under QEMU with CONFIG_BOOT_SELFTEST=y enabled
> +# and gic-test=1 in xen,xen-bootargs, then verify the four GICv3 SGI self-tests
> +# pass by inspecting the serial log.
> +
> +XEN=binaries/xen
> +QEMU=./binaries/qemu-system-aarch64
> +DTB_RAW=binaries/virt.dtb
> +DTB=binaries/virt-bootselftest.dtb
> +LOG=smoke.serial
> +
> +test -x ${QEMU}
> +test -f ${XEN}
> +
> +# Dump the auto-generated DT from the QEMU virt machine, then inject
> +# /chosen/xen,xen-bootargs.  The selftest infrastructure invokes
> +# do_init_boottests() during early boot; gic-test=1 selects the GICv3 SGI
> +# tests.
> +# -net none avoids QEMU's default virtio-net-pci, whose efi-virtio.rom
> +# is not shipped with the qemu-system-aarch64 artifact used in CI.
> +${QEMU} \
> +    -machine virt,virtualization=true,gic-version=3,dumpdtb=${DTB_RAW} \
> +    -cpu cortex-a57 -m 1024 -smp 2 -display none -net none
> +
> +cp ${DTB_RAW} ${DTB}
> +fdtput -t s ${DTB} /chosen xen,xen-bootargs \
> +    "gic-test=1 console=dtuart sync_console"
> +
> +rm -f ${LOG}
> +timeout 60 ${QEMU} \
> +    -machine virt,virtualization=true,gic-version=3 \
> +    -cpu cortex-a57 -m 1024 -smp 2 \

This means that there is no much difference between "send an SGI to a 
specific CPU" and "send an SGI to others CPU". I think it would be more 
meaningful to use 3 or more pCPUs.

> +    -serial file:${LOG} \
> +    -monitor none -display none -no-reboot -net none \
> +    -dtb ${DTB} \
> +    -kernel ${XEN} || true
> +
> +# Each "Sending GIC_SGI_TEST ..." line must be followed by the matching
> +# "CPU%u: GIC_SGI_TEST received".
> +fail=0
> +check_pair() {
> +    local send_pat=$1
> +    local recv_pat=$2
> +    local send_line recv_line
> +
> +    send_line=$(grep -n -- "${send_pat}" ${LOG} | head -n1 | cut -d: -f1)
> +    if [ -z "${send_line}" ]; then
> +        echo "MISSING: ${send_pat}"
> +        fail=1
> +        return
> +    fi
> +
> +    recv_line=$(grep -n -- "${recv_pat}" ${LOG} \
> +        | awk -v bl="${send_line}" -F: '$1 > bl {print $1; exit}')
> +    if [ -z "${recv_line}" ]; then
> +        echo "MISSING (after line ${send_line}): ${recv_pat}"
> +        fail=1
> +        return
> +    fi
> +
> +    echo "OK: '${send_pat}' -> '${recv_pat}' (lines ${send_line} -> ${recv_line})"
> +}
> +
> +# Boot CPU sends SGI to itself
> +check_pair "Sending GIC_SGI_TEST to self CPU0" "CPU0: GIC_SGI_TEST received"
> +# Secondary CPU sends SGI to itself
> +check_pair "Sending GIC_SGI_TEST to self CPU1" "CPU1: GIC_SGI_TEST received"
> +# Secondary CPU sends SGI to primary
> +check_pair "Sending GIC_SGI_TEST to CPU0 from CPU1" "CPU0: GIC_SGI_TEST received"
> +# Send to all-but-self
> +check_pair "Sending GIC_SGI_TEST to all except CPU1" "CPU0: GIC_SGI_TEST received"
> +
> +if [ ${fail} -ne 0 ]; then
> +    echo "FAILED"
> +    exit 1
> +fi
> +
> +echo "PASSED"
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 79622b46a1..0e23bbf20b 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -476,6 +476,21 @@ config ARM64_HARDEN_BRANCH_PREDICTOR
>   config ARM32_HARDEN_BRANCH_PREDICTOR
>       def_bool y if ARM_32 && HARDEN_BRANCH_PREDICTOR
>   
> +config BOOT_SELFTEST
> +    bool "Enable boot-time self-tests"
> +    default n

Above you said, this is not meant for production. So I was expecting to 
see a dependency on CONFIG_DEBUG.

If the intention is to use it in release build, given the current 
behavior (e.g. breaking test), I think this should depend on UNSUPPORTED 
so we don't get security report because Xen is broken after the boot tests.

 > +    help> +      This option enables boot-time self-tests that 
validate Xen's internal
> +      interfaces with hardware, firmware and the bootloader. The tests are
> +      registered with __initcallboottest and executed by do_init_boottests()
> +      during early boot, before domains are created.
> +
> +      These tests are intended for validation and coverage measurement, not
> +      for production builds. With this option enabled, Xen may not be
> +      functional after the tests have run.

If we know a test break, I think it is best that Xen doesn't continue. 
Otherwise, it is quite confusing for the user to know what's going on.

My preference is the bootest would act like other self tests and Xen can 
continue booting normally. So the tests could also be meaningful in 
non-test setups.

> +
> +      If unsure, say N.
> +
>   source "arch/arm/platforms/Kconfig"
>   
>   source "common/Kconfig"
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 84c4062b30..0090761682 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -24,6 +24,7 @@ obj-y += domctl.o
>   obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>   obj-y += efi/
>   obj-y += gic.o
> +obj-$(CONFIG_BOOT_SELFTEST) += gic-test.init.o
>   obj-$(CONFIG_GICV2) += gic-v2.o
>   obj-$(CONFIG_GICV3) += gic-v3.o
>   obj-$(CONFIG_HAS_ITS) += gic-v3-its.o
> diff --git a/xen/arch/arm/gic-test.c b/xen/arch/arm/gic-test.c
> new file mode 100644
> index 0000000000..ca922e5d2a
> --- /dev/null
> +++ b/xen/arch/arm/gic-test.c
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/delay.h>
> +#include <xen/init.h>
> +#include <xen/param.h>
> +#include <xen/shutdown.h>

Can you clarify why you need this header?

> +#include <asm/gic.h>
> +
> +/*
> + * gic_test: Specifies the gic test to be executed.
> + * 0 = no tests are executed
> + * 1 = SGI tests are executed
> + */
> +static unsigned int __initdata gic_test = 0;
> +integer_param("gic-test", gic_test);

Given this is mean to be 0 or 1, why not using "boolean_param"?

Also, new command line option should be documented in the docs. That 
said, I am not really sure about

> +
> +/*
> + * CPU0: GIC_SGI_DUMP_STATE to self
> + * CPU{0-N}: GIC_SGI_TEST to self
> + * CPU{1-N}: GIC_SGI_TEST to CPU0
> + * CPU{N}: GIC_SGI_TEST to all but self
> + */
> +static int __init gic_self_sgi_test(void)
> +{
> +    if ( !gic_test )
> +        return 0;
> +
> +    printk("Sending GIC_SGI_TEST to self CPU%u\n", smp_processor_id());
> +    send_SGI_self(GIC_SGI_TEST);
> +
> +    if ( smp_processor_id() == 0 )
> +    {
> +        printk("Sending GIC_SGI_DUMP_STATE to CPU0\n");
> +        smp_send_state_dump(0);

OOI, why is this only called for CPU0? You also don't seem to check that 
smp_send_state_dump() in the CI test.
> +
> +        return 0;
> +    }
> +
> +    printk("Sending GIC_SGI_TEST to CPU0 from CPU%u\n", smp_processor_id());
> +    send_SGI_one(0, GIC_SGI_TEST);
> +
> +    /* Execute this test only from the last core */
> +    if ( smp_processor_id() == (smp_get_max_cpus() - 1) )

This is relying on how Xen is boot CPUs. Would it be better to check the 
number of online CPUs at the time of the check? (You might need to 
re-order some code for that)

> +    {
> +        printk("Sending GIC_SGI_TEST to all except CPU%u\n", smp_processor_id());
> +        send_SGI_allbutself(GIC_SGI_TEST);
> +    }
> +
> +    return 0;
> +
> +}
> +__initcallboottest(gic_self_sgi_test);
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index ee75258fc3..9736b0c7df 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -324,6 +324,11 @@ static void do_static_sgi(struct cpu_user_regs *regs, enum gic_sgi sgi)
>       case GIC_SGI_CALL_FUNCTION:
>           smp_call_function_interrupt();
>           break;
> +#ifdef CONFIG_BOOT_SELFTEST
> +    case GIC_SGI_TEST:
> +        printk("CPU%u: GIC_SGI_TEST received\n", smp_processor_id());

To confirm, we will solely rely on logging? IOW, there is no plan to 
have Xen self-sufficient (e.g. using a global variable).

> +        break;
> +#endif
>       default:
>           panic("Unhandled SGI %d on CPU%d\n", sgi, smp_processor_id());
>           break;
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
> index ff22dea40d..74bdd4ff63 100644
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -306,6 +306,9 @@ enum gic_sgi {
>       GIC_SGI_EVENT_CHECK,
>       GIC_SGI_DUMP_STATE,
>       GIC_SGI_CALL_FUNCTION,
> +#ifdef CONFIG_BOOT_SELFTEST
> +    GIC_SGI_TEST,
> +#endif
>       GIC_SGI_STATIC_MAX,
>   };
>   
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 6310a47d68..4e5db93027 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -470,6 +470,8 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
>       enable_errata_workarounds();
>       enable_cpu_features();
>   
> +    do_init_boottests();
> +
>       /* Create initial domain 0. */
>       if ( !is_dom0less_mode() )
>           create_dom0();
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 7f3cfa812e..a016ff00f5 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -405,6 +405,8 @@ void asmlinkage noreturn start_secondary(void)
>   
>       printk(XENLOG_DEBUG "CPU %u booted.\n", smp_processor_id());
>   
> +    do_init_boottests();
> +
>       startup_cpu_idle_loop();
>   }
>   
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index 2d5f1c516d..14f64a856c 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -146,6 +146,10 @@ SECTIONS
>          *(.initcall1.init)
>          __initcall_end = .;
>   
> +       __initcall_boot_test_start = .;
> +       *(.initcallboottest.init)
> +       __initcall_boot_test_end = .;
> +
>          . = ALIGN(4);
>          __alt_instructions = .;
>          *(.altinstructions)
> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
> index fb45f81399..2047fe2a3f 100644
> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -412,6 +412,7 @@ void add_taint(unsigned int taint)
>   
>   extern const initcall_t __initcall_start[], __presmp_initcall_end[],
>       __initcall_end[];
> +extern const initcall_t __initcall_boot_test_start[], __initcall_boot_test_end[];
>   
>   void __init do_presmp_initcalls(void)
>   {
> @@ -427,6 +428,16 @@ void __init do_initcalls(void)
>           (*call)();
>   }
>   
> +void __init do_init_boottests(void)
> +{
> +#ifdef CONFIG_BOOT_SELFTEST

I think it would be worth printing before and after to indicate the 
begin/end of the selftest.

> +    const initcall_t *call;
> +    for ( call = __initcall_boot_test_start; call < __initcall_boot_test_end;
> +          call++ )
> +        (*call)();
> +#endif
> +}
> +
>   #ifdef CONFIG_HYPFS
>   static unsigned int __read_mostly major_version;
>   static unsigned int __read_mostly minor_version;
> diff --git a/xen/include/xen/init.h b/xen/include/xen/init.h
> index 0c921672c1..bd518bcea9 100644
> --- a/xen/include/xen/init.h
> +++ b/xen/include/xen/init.h
> @@ -66,11 +66,14 @@ typedef void (*exitcall_t)(void);
>       static const initcall_t __initcall_##fn __init_call("presmp") = (fn)
>   #define __initcall(fn) \
>       static const initcall_t __initcall_##fn __init_call("1") = (fn)
> +#define __initcallboottest(fn) \
> +    static const initcall_t __initcall_##fn __init_call("boottest") = (fn)
>   #define __exitcall(fn) \
>       static exitcall_t __exitcall_##fn __exit_call = fn
>   
>   void do_presmp_initcalls(void);
>   void do_initcalls(void);
> +void do_init_boottests(void);
>   
>   #endif /* __ASSEMBLER__ */

Cheers,


-- 
Julien Grall


