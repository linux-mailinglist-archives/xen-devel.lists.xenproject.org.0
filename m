Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E8674451A
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 01:19:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557659.871200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFNO4-0007I3-6q; Fri, 30 Jun 2023 23:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557659.871200; Fri, 30 Jun 2023 23:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFNO4-0007Eu-3k; Fri, 30 Jun 2023 23:18:48 +0000
Received: by outflank-mailman (input) for mailman id 557659;
 Fri, 30 Jun 2023 23:18:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JzuJ=CS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qFNO2-0007Eo-0m
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 23:18:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73c814ab-179c-11ee-b237-6b7b168915f2;
 Sat, 01 Jul 2023 01:18:43 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6B0CE61773;
 Fri, 30 Jun 2023 23:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4ACDC433C8;
 Fri, 30 Jun 2023 23:18:38 +0000 (UTC)
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
X-Inumbo-ID: 73c814ab-179c-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688167120;
	bh=sm6KoKXjaQtz55gOsvMrNJrAlizz93ECFjKqHM73CKI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XsFcxqgpK/d/VqFR7IK0QTdgtGwo0XlZyuZkaN0hcpJ8V8kLdq8NvuComKyPPIBLE
	 246H93/lymCULjK/Zc+JF/whCvZCwTv/DjB4GrNQQzKlkPARIKJlIJ2bnedEbSzQdP
	 bR9pkE9pCJTRxpb91ZbTbXV+K5PLJ/sb5GQmCdJsuZsIifiRrJreJVROQU1Acipg4+
	 SfJlXeXDZZ7Ps+wm/ciH+ngXQVgNeK1M0cHw61uESS/NdXOXTUKV7+GWfNbEz+5rS6
	 w1/ZyOHFLoQdh70VXRCaoo0zoGBVSNW2xgzyGUi7a81DiW0l4aZgBO6S0gpTK27MXL
	 dfGrXzljDhLiA==
Date: Fri, 30 Jun 2023 16:18:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>, 
    Community Manager <community.manager@xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
In-Reply-To: <20230630091210.3742121-1-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2306301618310.3936094@ubuntu-linux-20-04-desktop>
References: <20230630091210.3742121-1-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 29 Jun 2023, Luca Fancellu wrote:
> The "dom0less" feature was intended to be the feature where a domU
> domain could be launched without the control domain (Dom0)
> intervention, however the name seems to suggest that Dom0 cannot
> be part of the configuration, while instead it's a possible use case.
> 
> To avoid that, rename the "dom0less" configuration with the name
> "hyperlaunch", that is less misleading.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

I tested this patch on gitlab-ci and everything works as expected. I
also confirmed that there are no other mentions of "dom0less", except
for docs/designs/launch/hyperlaunch*.

I think this patch could go in as-is and
docs/designs/launch/hyperlaunch* could be fixed later, because the
changes here are mechanical, while docs/designs/launch/hyperlaunch* will
need rewording.

So:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> This is an RFC to get the feeling of the community about the name
> change, for now it's everything in one patch just to see how it
> will look like, if there is interest on proceeding into it, I can
> split in more commit.
> Please note that I've left intentionally "dom0less" into the
> docs/design/ and CHANGELOG.md
> ---
> ---
>  .gitignore                                    |  2 +-
>  CHANGELOG.md                                  |  2 +
>  SUPPORT.md                                    |  8 +-
>  automation/gitlab-ci/test.yaml                | 88 +++++++++----------
>  ...m32.sh => qemu-smoke-hyperlaunch-arm32.sh} |  0
>  ...m64.sh => qemu-smoke-hyperlaunch-arm64.sh} |  2 +-
>  ...arm64.sh => qemu-xtf-hyperlaunch-arm64.sh} |  0
>  ...4.sh => xilinx-smoke-hyperlaunch-arm64.sh} |  2 +-
>  docs/INDEX                                    |  2 +-
>  .../{dom0less.pandoc => hyperlaunch.pandoc}   | 33 +++----
>  docs/misc/arm/device-tree/booting.txt         |  4 +-
>  docs/misc/efi.pandoc                          | 14 +--
>  docs/misc/xen-command-line.pandoc             |  2 +-
>  docs/misc/xenstore-ring.txt                   |  6 +-
>  tools/helpers/Makefile                        | 20 ++---
>  ...t-dom0less.c => init-hyperlaunch-guests.c} |  4 +-
>  xen/arch/arm/Kconfig                          |  4 +-
>  xen/arch/arm/domain_build.c                   | 18 ++--
>  xen/arch/arm/efi/efi-boot.h                   |  9 +-
>  xen/arch/arm/include/asm/kernel.h             | 32 +++----
>  xen/arch/arm/setup.c                          |  8 +-
>  21 files changed, 132 insertions(+), 128 deletions(-)
>  rename automation/scripts/{qemu-smoke-dom0less-arm32.sh => qemu-smoke-hyperlaunch-arm32.sh} (100%)
>  rename automation/scripts/{qemu-smoke-dom0less-arm64.sh => qemu-smoke-hyperlaunch-arm64.sh} (99%)
>  rename automation/scripts/{qemu-xtf-dom0less-arm64.sh => qemu-xtf-hyperlaunch-arm64.sh} (100%)
>  rename automation/scripts/{xilinx-smoke-dom0less-arm64.sh => xilinx-smoke-hyperlaunch-arm64.sh} (98%)
>  rename docs/features/{dom0less.pandoc => hyperlaunch.pandoc} (84%)
>  rename tools/helpers/{init-dom0less.c => init-hyperlaunch-guests.c} (98%)
> 
> diff --git a/.gitignore b/.gitignore
> index c1b73b096893..c9d569247079 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -167,7 +167,7 @@ tools/flask/utils/flask-loadpolicy
>  tools/flask/utils/flask-setenforce
>  tools/flask/utils/flask-set-bool
>  tools/flask/utils/flask-label-pci
> -tools/helpers/init-dom0less
> +tools/helpers/init-hyperlaunch-guests
>  tools/helpers/init-xenstore-domain
>  tools/helpers/xen-init-dom0
>  tools/hotplug/common/hotplugpath.sh
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 7d7e0590f8c6..cf01e004b017 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -13,6 +13,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     known user doesn't use it properly, leading to in-guest breakage.
>   - The "dom0" option is now supported on Arm and "sve=" sub-option can be used
>     to enable dom0 guest to use SVE/SVE2 instructions.
> + - The "dom0less" feature, currently supported only on arm, is renamed to
> +   "hyperlaunch".
>  
>  ### Added
>   - On x86, support for features new in Intel Sapphire Rapids CPUs:
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 35a6249e03b2..fe500652828c 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -342,7 +342,7 @@ Allow sharing of identical pages between guests
>  
>  ### Static Memory Sharing
>  
> -Allow to statically set up shared memory on dom0less system,
> +Allow to statically set up shared memory on hyperlaunch system,
>  enabling domains to do shm-based communication
>  
>      Status, ARM: Tech Preview
> @@ -945,20 +945,20 @@ OVMF firmware implements the UEFI boot protocol.
>  
>      Status, qemu-xen: Supported
>  
> -## Dom0less
> +## Hyperlaunch
>  
>  Guest creation from the hypervisor at boot without Dom0 intervention.
>  
>      Status, ARM: Supported
>  
> -Memory of dom0less DomUs is not scrubbed at boot when bootscrub=on or
> +Memory of hyperlaunch DomUs is not scrubbed at boot when bootscrub=on or
>  bootscrub=off are passed as Xen command line parameters. (Memory should
>  be scrubbed with bootscrub=idle.) No XSAs will be issues due to
>  unscrubbed memory.
>  
>  ## Static Event Channel
>  
> -Allow to setup the static event channel on dom0less system, enabling domains
> +Allow to setup the static event channel on hyperlaunch system, enabling domains
>  to send/receive notifications.
>  
>      Status, ARM: Tech Preview
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index d5cb238b0ad8..d309c784b643 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -136,18 +136,18 @@ build-each-commit-gcc:
>    tags:
>      - x86_64
>  
> -xilinx-smoke-dom0less-arm64-gcc:
> +xilinx-smoke-hyperlaunch-arm64-gcc:
>    extends: .xilinx-arm64
>    script:
> -    - ./automation/scripts/xilinx-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/xilinx-smoke-hyperlaunch-arm64.sh 2>&1 | tee ${LOGFILE}
>    needs:
>      - *arm64-test-needs
>      - alpine-3.12-gcc-arm64
>  
> -xilinx-smoke-dom0less-arm64-gcc-gem-passthrough:
> +xilinx-smoke-hyperlaunch-arm64-gcc-gem-passthrough:
>    extends: .xilinx-arm64
>    script:
> -    - ./automation/scripts/xilinx-smoke-dom0less-arm64.sh gem-passthrough 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/xilinx-smoke-hyperlaunch-arm64.sh gem-passthrough 2>&1 | tee ${LOGFILE}
>    needs:
>      - *arm64-test-needs
>      - alpine-3.12-gcc-arm64
> @@ -234,98 +234,98 @@ qemu-smoke-dom0-arm64-gcc-debug:
>      - *arm64-test-needs
>      - alpine-3.12-gcc-debug-arm64
>  
> -qemu-smoke-dom0less-arm64-gcc:
> +qemu-smoke-hyperlaunch-arm64-gcc:
>    extends: .qemu-arm64
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-smoke-hyperlaunch-arm64.sh 2>&1 | tee ${LOGFILE}
>    needs:
>      - *arm64-test-needs
>      - alpine-3.12-gcc-arm64
>  
> -qemu-smoke-dom0less-arm64-gcc-debug:
> +qemu-smoke-hyperlaunch-arm64-gcc-debug:
>    extends: .qemu-arm64
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-smoke-hyperlaunch-arm64.sh 2>&1 | tee ${LOGFILE}
>    needs:
>      - *arm64-test-needs
>      - alpine-3.12-gcc-debug-arm64
>  
> -qemu-smoke-dom0less-arm64-gcc-staticmem:
> +qemu-smoke-hyperlaunch-arm64-gcc-staticmem:
>    extends: .qemu-arm64
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-mem 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-smoke-hyperlaunch-arm64.sh static-mem 2>&1 | tee ${LOGFILE}
>    needs:
>      - *arm64-test-needs
>      - alpine-3.12-gcc-arm64-staticmem
>  
> -qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
> +qemu-smoke-hyperlaunch-arm64-gcc-debug-staticmem:
>    extends: .qemu-arm64
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-mem 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-smoke-hyperlaunch-arm64.sh static-mem 2>&1 | tee ${LOGFILE}
>    needs:
>      - *arm64-test-needs
>      - alpine-3.12-gcc-debug-arm64-staticmem
>  
> -qemu-smoke-dom0less-arm64-gcc-staticheap:
> +qemu-smoke-hyperlaunch-arm64-gcc-staticheap:
>   extends: .qemu-arm64
>   script:
> -   - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-heap 2>&1 | tee ${LOGFILE}
> +   - ./automation/scripts/qemu-smoke-hyperlaunch-arm64.sh static-heap 2>&1 | tee ${LOGFILE}
>   needs:
>     - *arm64-test-needs
>     - alpine-3.12-gcc-arm64
>  
> -qemu-smoke-dom0less-arm64-gcc-debug-staticheap:
> +qemu-smoke-hyperlaunch-arm64-gcc-debug-staticheap:
>   extends: .qemu-arm64
>   script:
> -   - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-heap 2>&1 | tee ${LOGFILE}
> +   - ./automation/scripts/qemu-smoke-hyperlaunch-arm64.sh static-heap 2>&1 | tee ${LOGFILE}
>   needs:
>     - *arm64-test-needs
>     - alpine-3.12-gcc-debug-arm64
>  
> -qemu-smoke-dom0less-arm64-gcc-static-shared-mem:
> +qemu-smoke-hyperlaunch-arm64-gcc-static-shared-mem:
>    extends: .qemu-arm64
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-shared-mem 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-smoke-hyperlaunch-arm64.sh static-shared-mem 2>&1 | tee ${LOGFILE}
>    needs:
>      - *arm64-test-needs
>      - alpine-3.12-gcc-arm64-static-shared-mem
>  
> -qemu-smoke-dom0less-arm64-gcc-debug-static-shared-mem:
> +qemu-smoke-hyperlaunch-arm64-gcc-debug-static-shared-mem:
>    extends: .qemu-arm64
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-shared-mem 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-smoke-hyperlaunch-arm64.sh static-shared-mem 2>&1 | tee ${LOGFILE}
>    needs:
>      - *arm64-test-needs
>      - alpine-3.12-gcc-debug-arm64-static-shared-mem
>  
> -qemu-smoke-dom0less-arm64-gcc-boot-cpupools:
> +qemu-smoke-hyperlaunch-arm64-gcc-boot-cpupools:
>    extends: .qemu-arm64
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh boot-cpupools 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-smoke-hyperlaunch-arm64.sh boot-cpupools 2>&1 | tee ${LOGFILE}
>    needs:
>      - *arm64-test-needs
>      - alpine-3.12-gcc-arm64-boot-cpupools
>  
> -qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
> +qemu-smoke-hyperlaunch-arm64-gcc-debug-boot-cpupools:
>    extends: .qemu-arm64
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh boot-cpupools 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-smoke-hyperlaunch-arm64.sh boot-cpupools 2>&1 | tee ${LOGFILE}
>    needs:
>      - *arm64-test-needs
>      - alpine-3.12-gcc-debug-arm64-boot-cpupools
>  
> -qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
> +qemu-xtf-hyperlaunch-arm64-gcc-hyp-xen-version:
>    extends: .qemu-arm64
>    script:
> -    - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-xtf-hyperlaunch-arm64.sh hyp-xen-version 2>&1 | tee ${LOGFILE}
>    needs:
>      - alpine-3.12-gcc-arm64
>      - qemu-system-aarch64-6.0.0-arm64-export
>  
> -qemu-xtf-dom0less-arm64-gcc-debug-hyp-xen-version:
> +qemu-xtf-hyperlaunch-arm64-gcc-debug-hyp-xen-version:
>    extends: .qemu-arm64
>    script:
> -    - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-xtf-hyperlaunch-arm64.sh hyp-xen-version 2>&1 | tee ${LOGFILE}
>    needs:
>      - alpine-3.12-gcc-debug-arm64
>      - qemu-system-aarch64-6.0.0-arm64-export
> @@ -338,66 +338,66 @@ qemu-smoke-dom0-arm32-gcc:
>      - *arm32-test-needs
>      - yocto-qemuarm
>  
> -qemu-smoke-dom0less-arm32-gcc:
> +qemu-smoke-hyperlaunch-arm32-gcc:
>    extends: .qemu-arm32
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-smoke-hyperlaunch-arm32.sh 2>&1 | tee ${LOGFILE}
>    needs:
>      - *arm32-test-needs
>      - debian-unstable-gcc-arm32
>  
> -qemu-smoke-dom0less-arm32-gcc-debug:
> +qemu-smoke-hyperlaunch-arm32-gcc-debug:
>    extends: .qemu-arm32
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-smoke-hyperlaunch-arm32.sh 2>&1 | tee ${LOGFILE}
>    needs:
>      - *arm32-test-needs
>      - debian-unstable-gcc-arm32-debug
>  
> -qemu-smoke-dom0less-arm32-gcc-staticmem:
> +qemu-smoke-hyperlaunch-arm32-gcc-staticmem:
>    extends: .qemu-arm32
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh static-mem 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-smoke-hyperlaunch-arm32.sh static-mem 2>&1 | tee ${LOGFILE}
>    needs:
>      - *arm32-test-needs
>      - debian-unstable-gcc-arm32-staticmem
>  
> -qemu-smoke-dom0less-arm32-gcc-debug-staticmem:
> +qemu-smoke-hyperlaunch-arm32-gcc-debug-staticmem:
>    extends: .qemu-arm32
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh static-mem 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-smoke-hyperlaunch-arm32.sh static-mem 2>&1 | tee ${LOGFILE}
>    needs:
>      - *arm32-test-needs
>      - debian-unstable-gcc-arm32-debug-staticmem
>  
> -qemu-smoke-dom0less-arm32-gcc-gzip:
> +qemu-smoke-hyperlaunch-arm32-gcc-gzip:
>    extends: .qemu-arm32
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh gzip 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-smoke-hyperlaunch-arm32.sh gzip 2>&1 | tee ${LOGFILE}
>    needs:
>      - *arm32-test-needs
>      - debian-unstable-gcc-arm32
>  
> -qemu-smoke-dom0less-arm32-gcc-debug-gzip:
> +qemu-smoke-hyperlaunch-arm32-gcc-debug-gzip:
>    extends: .qemu-arm32
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh gzip 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-smoke-hyperlaunch-arm32.sh gzip 2>&1 | tee ${LOGFILE}
>    needs:
>      - *arm32-test-needs
>      - debian-unstable-gcc-arm32-debug
>  
> -qemu-smoke-dom0less-arm32-gcc-without-dom0:
> +qemu-smoke-hyperlaunch-arm32-gcc-without-dom0:
>    extends: .qemu-arm32
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh without-dom0 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-smoke-hyperlaunch-arm32.sh without-dom0 2>&1 | tee ${LOGFILE}
>    needs:
>      - *arm32-test-needs
>      - debian-unstable-gcc-arm32
>  
> -qemu-smoke-dom0less-arm32-gcc-debug-without-dom0:
> +qemu-smoke-hyperlaunch-arm32-gcc-debug-without-dom0:
>    extends: .qemu-arm32
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh without-dom0 2>&1 | tee ${LOGFILE}
> +    - ./automation/scripts/qemu-smoke-hyperlaunch-arm32.sh without-dom0 2>&1 | tee ${LOGFILE}
>    needs:
>      - *arm32-test-needs
>      - debian-unstable-gcc-arm32-debug
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-hyperlaunch-arm32.sh
> similarity index 100%
> rename from automation/scripts/qemu-smoke-dom0less-arm32.sh
> rename to automation/scripts/qemu-smoke-hyperlaunch-arm32.sh
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-hyperlaunch-arm64.sh
> similarity index 99%
> rename from automation/scripts/qemu-smoke-dom0less-arm64.sh
> rename to automation/scripts/qemu-smoke-hyperlaunch-arm64.sh
> index 75f575424a4e..db22cfaa1fd6 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/qemu-smoke-hyperlaunch-arm64.sh
> @@ -113,7 +113,7 @@ echo "#!/bin/bash
>  export LD_LIBRARY_PATH=/usr/local/lib
>  bash /etc/init.d/xencommons start
>  
> -/usr/local/lib/xen/bin/init-dom0less
> +/usr/local/lib/xen/bin/init-hyperlaunch-guests
>  
>  brctl addbr xenbr0
>  brctl addif xenbr0 eth0
> diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-hyperlaunch-arm64.sh
> similarity index 100%
> rename from automation/scripts/qemu-xtf-dom0less-arm64.sh
> rename to automation/scripts/qemu-xtf-hyperlaunch-arm64.sh
> diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-hyperlaunch-arm64.sh
> similarity index 98%
> rename from automation/scripts/xilinx-smoke-dom0less-arm64.sh
> rename to automation/scripts/xilinx-smoke-hyperlaunch-arm64.sh
> index 075305241c8d..35b60720fe08 100755
> --- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/xilinx-smoke-hyperlaunch-arm64.sh
> @@ -73,7 +73,7 @@ echo "#!/bin/bash
>  export LD_LIBRARY_PATH=/usr/local/lib
>  bash /etc/init.d/xencommons start
>  
> -/usr/local/lib/xen/bin/init-dom0less
> +/usr/local/lib/xen/bin/init-hyperlaunch-guests
>  
>  ${dom0_check}
>  " > etc/local.d/xen.start
> diff --git a/docs/INDEX b/docs/INDEX
> index e673edd75c31..ed3d2e6198ec 100644
> --- a/docs/INDEX
> +++ b/docs/INDEX
> @@ -25,4 +25,4 @@ misc/arm/early-printk		Enabling early printk on ARM
>  misc/arm/passthrough		Passthrough a device described in the Device Tree to a guest
>  misc/arm/device-tree/booting	Device tree bindings to boot Xen
>  misc/arm/device-tree/passthrough	Device tree binding to passthrough a device
> -features/dom0less.markdown	Boot multiple domains from Xen in parallel
> +features/hyperlaunch.markdown	Boot multiple domains from Xen in parallel
> diff --git a/docs/features/dom0less.pandoc b/docs/features/hyperlaunch.pandoc
> similarity index 84%
> rename from docs/features/dom0less.pandoc
> rename to docs/features/hyperlaunch.pandoc
> index 725afa055838..a62d534696e3 100644
> --- a/docs/features/dom0less.pandoc
> +++ b/docs/features/hyperlaunch.pandoc
> @@ -1,7 +1,7 @@
> -Dom0less
> -========
> +Hyperlaunch
> +===========
>  
> -"Dom0less" is a set of Xen features that enable the deployment of a Xen
> +"Hyperlaunch" is a set of Xen features that enable the deployment of a Xen
>  system without an control domain (often referred to as "dom0"). Each
>  feature can be used independently from the others, unless otherwise
>  stated.
> @@ -93,26 +93,26 @@ See docs/misc/arm/device-tree/booting.txt for more information.
>  PV Drivers
>  ----------
>  
> -It is possible to use PV drivers with dom0less guests with some
> +It is possible to use PV drivers with hyperlaunch started guests with some
>  restrictions:
>  
> -- dom0less domUs that want to use PV drivers support should have the
> +- hyperlaunch started domUs that want to use PV drivers support should have the
>    "xen,enhanced" property set under their device tree nodes (see
>    docs/misc/arm/device-tree/booting.txt)
>  - a dom0 must be present (or another domain with enough privileges to
>    run the toolstack)
> -- after dom0 is booted, the utility "init-dom0less" must be run
> -- do not run "init-dom0less" while creating other guests with xl
> +- after dom0 is booted, the utility "init-hyperlaunch-guests" must be run
> +- do not run "init-hyperlaunch-guests" while creating other guests with xl
>  
> -After the execution of init-dom0less, it is possible to use "xl" to
> -hotplug PV drivers to dom0less guests. E.g. xl network-attach domU.
> +After the execution of init-hyperlaunch-guests, it is possible to use "xl" to
> +hotplug PV drivers to hyperlaunch started guests. E.g. xl network-attach domU.
>  
>  The implementation works as follows:
> -- Xen allocates the xenstore event channel for each dom0less domU that
> -  has the "xen,enhanced" property, and sets HVM_PARAM_STORE_EVTCHN
> +- Xen allocates the xenstore event channel for each hyperlaunch started domU
> +  that has the "xen,enhanced" property, and sets HVM_PARAM_STORE_EVTCHN
>  - Xen does *not* allocate the xenstore page and sets HVM_PARAM_STORE_PFN
>    to ~0ULL (invalid)
> -- Dom0less domU kernels check that HVM_PARAM_STORE_PFN is set to invalid
> +- Hyperlaunch started domU kernels check that HVM_PARAM_STORE_PFN is set to invalid
>      - Old kernels will continue without xenstore support (Note: some old
>        buggy kernels might crash because they don't check the validity of
>        HVM_PARAM_STORE_PFN before using it! Disable "xen,enhanced" in
> @@ -120,7 +120,7 @@ The implementation works as follows:
>      - New kernels will wait for a notification on the xenstore event
>        channel (HVM_PARAM_STORE_EVTCHN) before continuing with the
>        initialization
> -- Once dom0 is booted, init-dom0less is executed:
> +- Once dom0 is booted, init-hyperlaunch-guests is executed:
>      - it allocates the xenstore shared page and sets HVM_PARAM_STORE_PFN
>      - it calls xs_introduce_domain
>  - Xenstored notices the new domain, initializes interfaces as usual, and
> @@ -159,12 +159,13 @@ Notes
>  -----
>  
>  - 'xl console' command will not attach to the domain's console in case
> -  of dom0less. DomU are domains created by Xen (similar to Dom0) and
> -  therefore they are all managed by Xen and some of the commands may not work.
> +  of hyperlaunch started guests. DomU are domains created by Xen (similar to
> +  Dom0) and therefore they are all managed by Xen and some of the commands may
> +  not work.
>  
>    A user is allowed to configure the key sequence to switch input.
>    Pressing the Xen "conswitch" (Ctrl-A by default) three times
> -  switches input in case of dom0less mode.
> +  switches input in case of hyperlaunch mode.
>  
>  - Domains created by Xen will have no name at boot. Domain-0 has a name
>    thanks to the helper xen-init-dom0 called at boot by the initscript.
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index bbd955e9c2f6..10ec1910a75a 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -572,8 +572,8 @@ Static Shared Memory
>  ====================
>  
>  The static shared memory device tree nodes allow users to statically set up
> -shared memory on dom0less system, enabling domains to do shm-based
> -communication.
> +shared memory on Hyperlaunch started guests system, enabling domains to do
> +shm-based communication.
>  
>  - compatible
>  
> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> index 11c1ac334600..d15cb87b49d1 100644
> --- a/docs/misc/efi.pandoc
> +++ b/docs/misc/efi.pandoc
> @@ -194,12 +194,12 @@ chosen {
>  	};
>  }
>  
> -## UEFI boot and dom0less on ARM
> +## UEFI boot and Hyperlaunch on ARM
>  
> -Dom0less feature is supported by ARM and it is possible to use it when Xen is
> +Hyperlaunch feature is supported by ARM and it is possible to use it when Xen is
>  started as an EFI application.
>  The way to specify the domU domains is by Device Tree as specified in the
> -[dom0less](dom0less.html) documentation page under the "Device Tree
> +[Hyperlaunch](hyperlaunch.html) documentation page under the "Device Tree
>  configuration" section, but instead of declaring the reg property in the boot
>  module, the user must specify the "xen,uefi-binary" property containing the name
>  of the binary file that has to be loaded in memory.
> @@ -236,7 +236,7 @@ domU1 {
>  These are the different ways to boot a Xen system from UEFI:
>  
>   - Boot Xen and Dom0 (minimum required)
> - - Boot Xen and DomU(s) (true dom0less, only on ARM)
> + - Boot Xen and DomU(s) (only on ARM)
>   - Boot Xen, Dom0 and DomU(s) (only on ARM)
>  
>  ### Boot Xen and Dom0
> @@ -247,7 +247,7 @@ example above.
>  ### Boot Xen and DomU(s)
>  
>  This configuration needs the domU domain(s) specified in the /chosen node,
> -examples of how to do that are provided by the documentation about dom0less
> +examples of how to do that are provided by the documentation about Hyperlaunch
>  and the example above shows how to use the "xen,uefi-binary" property to use the
>  UEFI stub for module loading.
>  When adding DomU modules to device tree, also add the property
> @@ -258,7 +258,7 @@ can specify the Xen boot arguments in the configuration file with the "options="
>  keyword or in the device tree with the "xen,xen-bootargs" property, but be
>  aware that the Xen configuration file value has a precedence over the DT value.
>  
> -Example 1 of how to boot a true dom0less configuration:
> +Example 1 of how to boot an Hyperlaunch configuration with only domU(s):
>  
>  Xen configuration file: skipped.
>  
> @@ -301,7 +301,7 @@ chosen {
>  };
>  ```
>  
> -Example 2 of how to boot a true dom0less configuration:
> +Example 2 of how to boot an Hyperlaunch configuration with only domU(s):
>  
>  Xen configuration file:
>  
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 4060ebdc5d76..35d7c9821963 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1156,7 +1156,7 @@ to use the default.
>  > Default : `true`
>  
>  Flag to enable or disable support for extended regions for Dom0 and
> -Dom0less DomUs.
> +Hyperlaunch started DomUs.
>  
>  Extended regions are ranges of unused address space exposed to the guest
>  as "safe to use" for special memory mappings. Disable if your board
> diff --git a/docs/misc/xenstore-ring.txt b/docs/misc/xenstore-ring.txt
> index dbc7335e24b8..f84dedd8016e 100644
> --- a/docs/misc/xenstore-ring.txt
> +++ b/docs/misc/xenstore-ring.txt
> @@ -115,9 +115,9 @@ and reconnect is in progress") and signalling the event channel.
>  The guest must now ignore all fields except the Connection state and
>  wait for it to be set to 0 ("Ring is connected").
>  
> -In certain circumstances (e.g. dom0less guests with PV drivers support)
> -it is possible for the guest to find the Connection state already set to
> -1 by someone else during xenstore initialization. In that case, like in
> +In certain circumstances (e.g. Hyperlaunch started guests with PV drivers
> +support) it is possible for the guest to find the Connection state already set
> +to 1 by someone else during xenstore initialization. In that case, like in
>  the previous case, the guest must ignore all fields except the
>  Connection state and wait for it to be set to 0 before proceeding.
>  
> diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
> index 09590eb5b6f0..332ab47da318 100644
> --- a/tools/helpers/Makefile
> +++ b/tools/helpers/Makefile
> @@ -11,7 +11,7 @@ ifeq ($(CONFIG_X86),y)
>  TARGETS += init-xenstore-domain
>  endif
>  ifeq ($(CONFIG_ARM),y)
> -TARGETS += init-dom0less
> +TARGETS += init-hyperlaunch-guests
>  endif
>  endif
>  
> @@ -31,13 +31,13 @@ $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += $(CFLAGS_libxenlight)
>  $(INIT_XENSTORE_DOMAIN_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h
>  init-xenstore-domain: LDLIBS += $(call xenlibs-ldlibs,toollog store ctrl guest light)
>  
> -INIT_DOM0LESS_OBJS = init-dom0less.o init-dom-json.o
> -$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
> -$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenstore)
> -$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenlight)
> -$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenctrl)
> -$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenevtchn)
> -init-dom0less: LDLIBS += $(call xenlibs-ldlibs,ctrl evtchn toollog store light guest foreignmemory)
> +INIT_HYPERLAUNCH_OBJS = init-hyperlaunch-guests.o init-dom-json.o
> +$(INIT_HYPERLAUNCH_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
> +$(INIT_HYPERLAUNCH_OBJS): CFLAGS += $(CFLAGS_libxenstore)
> +$(INIT_HYPERLAUNCH_OBJS): CFLAGS += $(CFLAGS_libxenlight)
> +$(INIT_HYPERLAUNCH_OBJS): CFLAGS += $(CFLAGS_libxenctrl)
> +$(INIT_HYPERLAUNCH_OBJS): CFLAGS += $(CFLAGS_libxenevtchn)
> +init-hyperlaunch-guests: LDLIBS += $(call xenlibs-ldlibs,ctrl evtchn toollog store light guest foreignmemory)
>  
>  .PHONY: all
>  all: $(TARGETS)
> @@ -48,8 +48,8 @@ xen-init-dom0: $(XEN_INIT_DOM0_OBJS)
>  init-xenstore-domain: $(INIT_XENSTORE_DOMAIN_OBJS)
>  	$(CC) $(LDFLAGS) -o $@ $(INIT_XENSTORE_DOMAIN_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
>  
> -init-dom0less: $(INIT_DOM0LESS_OBJS)
> -	$(CC) $(LDFLAGS) -o $@ $(INIT_DOM0LESS_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
> +init-hyperlaunch-guests: $(INIT_HYPERLAUNCH_OBJS)
> +	$(CC) $(LDFLAGS) -o $@ $(INIT_HYPERLAUNCH_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
>  
>  .PHONY: install
>  install: all
> diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-hyperlaunch-guests.c
> similarity index 98%
> rename from tools/helpers/init-dom0less.c
> rename to tools/helpers/init-hyperlaunch-guests.c
> index fee93459c4b9..c786a5fd37b2 100644
> --- a/tools/helpers/init-dom0less.c
> +++ b/tools/helpers/init-hyperlaunch-guests.c
> @@ -129,7 +129,7 @@ static int create_xenstore(struct xs_handle *xsh,
>      rc = snprintf(id_str, STR_MAX_LENGTH, "%u", domid);
>      if (rc < 0 || rc >= STR_MAX_LENGTH)
>          return rc;
> -    rc = snprintf(dom_name_str, STR_MAX_LENGTH, "dom0less-%u", domid);
> +    rc = snprintf(dom_name_str, STR_MAX_LENGTH, "hyperlaunch-%u", domid);
>      if (rc < 0 || rc >= STR_MAX_LENGTH)
>          return rc;
>      rc = snprintf(uuid_str, STR_MAX_LENGTH, LIBXL_UUID_FMT, LIBXL_UUID_BYTES(uuid));
> @@ -232,7 +232,7 @@ static int init_domain(struct xs_handle *xsh,
>      int rc;
>      struct xenstore_domain_interface *intf;
>  
> -    printf("Init dom0less domain: %u\n", info->domid);
> +    printf("Init hyperlaunch domain: %u\n", info->domid);
>  
>      rc = xc_hvm_param_get(xch, info->domid, HVM_PARAM_STORE_EVTCHN,
>                            &xenstore_evtchn);
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 61e581b8c2b0..c5cb8f28011a 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -179,10 +179,10 @@ config TEE
>  source "arch/arm/tee/Kconfig"
>  
>  config STATIC_SHM
> -	bool "Statically shared memory on a dom0less system" if UNSUPPORTED
> +	bool "Statically shared memory on an Hyperlaunch system" if UNSUPPORTED
>  	depends on STATIC_MEMORY
>  	help
> -	  This option enables statically shared memory on a dom0less system.
> +	  This option enables statically shared memory on an Hyperlaunch system.
>  
>  endmenu
>  
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d0d6be922db1..897e1f2de39e 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -42,7 +42,7 @@ integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
>  
>  /*
>   * If true, the extended regions support is enabled for dom0 and
> - * dom0less domUs.
> + * Hyperlaunch started domUs.
>   */
>  static bool __initdata opt_ext_regions = true;
>  boolean_param("ext_regions", opt_ext_regions);
> @@ -3347,7 +3347,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>              goto err;
>      }
>  
> -    if ( kinfo->dom0less_feature & DOM0LESS_ENHANCED_NO_XS )
> +    if ( kinfo->hyperlaunch_feature & HYPERLAUNCH_ENHANCED_NO_XS )
>      {
>          ret = make_hypervisor_node(d, kinfo, addrcells, sizecells);
>          if ( ret )
> @@ -3810,7 +3810,7 @@ static int __init construct_domU(struct domain *d,
>                                   const struct dt_device_node *node)
>  {
>      struct kernel_info kinfo = {};
> -    const char *dom0less_enhanced;
> +    const char *hyperlaunch_enhanced;
>      int rc;
>      u64 mem;
>      u32 p2m_mem_mb;
> @@ -3841,18 +3841,18 @@ static int __init construct_domU(struct domain *d,
>  
>      kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
>  
> -    rc = dt_property_read_string(node, "xen,enhanced", &dom0less_enhanced);
> +    rc = dt_property_read_string(node, "xen,enhanced", &hyperlaunch_enhanced);
>      if ( rc == -EILSEQ ||
>           rc == -ENODATA ||
> -         (rc == 0 && !strcmp(dom0less_enhanced, "enabled")) )
> +         (rc == 0 && !strcmp(hyperlaunch_enhanced, "enabled")) )
>      {
>          if ( hardware_domain )
> -            kinfo.dom0less_feature = DOM0LESS_ENHANCED;
> +            kinfo.hyperlaunch_feature = HYPERLAUNCH_ENHANCED;
>          else
>              panic("At the moment, Xenstore support requires dom0 to be present\n");
>      }
> -    else if ( rc == 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
> -        kinfo.dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
> +    else if ( rc == 0 && !strcmp(hyperlaunch_enhanced, "no-xenstore") )
> +        kinfo.hyperlaunch_feature = HYPERLAUNCH_ENHANCED_NO_XS;
>  
>      if ( vcpu_create(d, 0) == NULL )
>          return -ENOMEM;
> @@ -3902,7 +3902,7 @@ static int __init construct_domU(struct domain *d,
>      if ( rc < 0 )
>          return rc;
>  
> -    if ( kinfo.dom0less_feature & DOM0LESS_XENSTORE )
> +    if ( kinfo.hyperlaunch_feature & HYPERLAUNCH_XENSTORE )
>      {
>          ASSERT(hardware_domain);
>          rc = alloc_xenstore_evtchn(d);
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index bb64925d708c..cccf90817279 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -807,9 +807,9 @@ static int __init handle_module_node(const EFI_LOADED_IMAGE *loaded_image,
>   * in the DT.
>   * Returns number of multiboot,module found or negative number on error.
>   */
> -static int __init handle_dom0less_domain_node(const EFI_LOADED_IMAGE *loaded_image,
> -                                              EFI_FILE_HANDLE *dir_handle,
> -                                              int domain_node)
> +static int __init
> +handle_hyperlaunch_domain_node(const EFI_LOADED_IMAGE *loaded_image,
> +                               EFI_FILE_HANDLE *dir_handle, int domain_node)
>  {
>      int module_node, addr_cells, size_cells, len;
>      const struct fdt_property *prop;
> @@ -879,7 +879,8 @@ static int __init efi_check_dt_boot(const EFI_LOADED_IMAGE *loaded_image)
>          if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
>          {
>              /* Found a node with compatible xen,domain; handle this node. */
> -            ret = handle_dom0less_domain_node(loaded_image, &dir_handle, node);
> +            ret = handle_hyperlaunch_domain_node(loaded_image, &dir_handle,
> +                                                 node);
>              if ( ret < 0 )
>                  return ERROR_DT_MODULE_DOMU;
>          }
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index 4617cdc83bac..042e250e172a 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -10,23 +10,23 @@
>  #include <asm/setup.h>
>  
>  /*
> - * List of possible features for dom0less domUs
> + * List of possible features for Hyperlaunch started domUs
>   *
> - * DOM0LESS_ENHANCED_NO_XS: Notify the OS it is running on top of Xen. All the
> - *                          default features (excluding Xenstore) will be
> - *                          available. Note that an OS *must* not rely on the
> - *                          availability of Xen features if this is not set.
> - * DOM0LESS_XENSTORE:       Xenstore will be enabled for the VM. This feature
> - *                          can't be enabled without the
> - *                          DOM0LESS_ENHANCED_NO_XS.
> - * DOM0LESS_ENHANCED:       Notify the OS it is running on top of Xen. All the
> - *                          default features (including Xenstore) will be
> - *                          available. Note that an OS *must* not rely on the
> - *                          availability of Xen features if this is not set.
> + * HYPERLAUNCH_ENHANCED_NO_XS: Notify the OS it is running on top of Xen. All
> + *                             the default features (excluding Xenstore) will be
> + *                             available. Note that an OS *must* not rely on the
> + *                             availability of Xen features if this is not set.
> + * HYPERLAUNCH_XENSTORE:       Xenstore will be enabled for the VM. This feature
> + *                             can't be enabled without the
> + *                             HYPERLAUNCH_ENHANCED_NO_XS.
> + * HYPERLAUNCH_ENHANCED:       Notify the OS it is running on top of Xen. All
> + *                             the default features (including Xenstore) will be
> + *                             available. Note that an OS *must* not rely on the
> + *                             availability of Xen features if this is not set.
>   */
> -#define DOM0LESS_ENHANCED_NO_XS  BIT(0, U)
> -#define DOM0LESS_XENSTORE        BIT(1, U)
> -#define DOM0LESS_ENHANCED        (DOM0LESS_ENHANCED_NO_XS | DOM0LESS_XENSTORE)
> +#define HYPERLAUNCH_ENHANCED_NO_XS  BIT(0, U)
> +#define HYPERLAUNCH_XENSTORE        BIT(1, U)
> +#define HYPERLAUNCH_ENHANCED        (HYPERLAUNCH_ENHANCED_NO_XS | HYPERLAUNCH_XENSTORE)
>  
>  struct kernel_info {
>  #ifdef CONFIG_ARM_64
> @@ -57,7 +57,7 @@ struct kernel_info {
>      bool vpl011;
>  
>      /* Enable/Disable PV drivers interfaces */
> -    uint16_t dom0less_feature;
> +    uint16_t hyperlaunch_feature;
>  
>      /* GIC phandle */
>      uint32_t phandle_gic;
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index bbf72b69aae6..955c6b9e2e9e 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -1041,7 +1041,7 @@ static void __init setup_mm(void)
>  }
>  #endif
>  
> -static bool __init is_dom0less_mode(void)
> +static bool __init is_hyperlaunch_mode(void)
>  {
>      struct bootmodules *mods = &bootinfo.modules;
>      struct bootmodule *mod;
> @@ -1068,7 +1068,7 @@ static bool __init is_dom0less_mode(void)
>  
>      /*
>       * If there is no dom0 kernel but at least one domU, then we are in
> -     * dom0less mode
> +     * Hyperlaunch mode
>       */
>      return ( !dom0found && domUfound );
>  }
> @@ -1242,10 +1242,10 @@ void __init start_xen(unsigned long boot_phys_offset,
>      enable_cpu_features();
>  
>      /* Create initial domain 0. */
> -    if ( !is_dom0less_mode() )
> +    if ( !is_hyperlaunch_mode() )
>          create_dom0();
>      else
> -        printk(XENLOG_INFO "Xen dom0less mode detected\n");
> +        printk(XENLOG_INFO "Xen Hyperlaunch mode detected\n");
>  
>      if ( acpi_disabled )
>      {
> -- 
> 2.34.1
> 

