Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC30965440
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 02:49:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786164.1195700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjpoA-00023h-AQ; Fri, 30 Aug 2024 00:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786164.1195700; Fri, 30 Aug 2024 00:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjpoA-00022E-7S; Fri, 30 Aug 2024 00:48:10 +0000
Received: by outflank-mailman (input) for mailman id 786164;
 Fri, 30 Aug 2024 00:48:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D3iD=P5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sjpo7-000227-Rg
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 00:48:07 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 844d18b1-6669-11ef-99a0-01e77a169b0f;
 Fri, 30 Aug 2024 02:48:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6F023A43CD1;
 Fri, 30 Aug 2024 00:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D02C4CEC1;
 Fri, 30 Aug 2024 00:48:03 +0000 (UTC)
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
X-Inumbo-ID: 844d18b1-6669-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724978884;
	bh=8FyekvWU0IwLmVVV62jL2vD5xmEyaX7IbOJyjrc88Iw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GykdardJTWJDXKxMJqCXi5AShoU1AsNHY+Tmqv3du2r6P7iDPRL3QPxqh9+i3lK/b
	 /KbwLMPI4QOXzP1Ciw0qmeOF3etDiB+zS0hwvQQuMAo5MQmJh3TRChp91IjfzSfu5G
	 p7FRtNHBq+AimSQ+GG3sCSy0NR15FhSI1W+pc3P0KT4d0dxM8TwYTx00P4TbrQQXTr
	 NLmAN3z/SEwolDUt6S01MDDUf7sKeNJkWD6/5wjXXGYUru5QnSQXJFOSs9GhDUhQuI
	 vvaP7fJyM3EbGV03vrHX3pH64hcqGDGuBN/eIaHbt6vR93k6kL8oXcDlxWXM9/Ot9w
	 NkBS3qKW1rv0w==
Date: Thu, 29 Aug 2024 17:48:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 1/2] automation: fix false success in qemu tests
In-Reply-To: <9b60c6473aa084e4e47c64aa2347db6e3ca9ac91.1724967614.git.victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2408291747540.53815@ubuntu-linux-20-04-desktop>
References: <cover.1724967614.git.victorm.lira@amd.com> <9b60c6473aa084e4e47c64aa2347db6e3ca9ac91.1724967614.git.victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Aug 2024, victorm.lira@amd.com wrote:
> From: Victor Lira <victorm.lira@amd.com>
> 
> Fix flaw in qemu-*.sh tests that producess a false success. The following
> lines produces success despite the "expect" script producing nonzero exit
> status:
> 
>     set +e
> ...
>     ./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
>     (end of file)
> 
> The default exit status for a pipeline using "|" operator is that of the
> rightmost command. Fix this by setting the "pipefail" option in the shell,
> and removing "set +e" allowing the expect script to determine the result.
> 
> Signed-off-by: Victor Lira <victorm.lira@amd.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Michal Orzel <michal.orzel@amd.com>
> Cc: xen-devel@lists.xenproject.org
> ---
>  automation/scripts/qemu-alpine-x86_64.sh        | 3 +--
>  automation/scripts/qemu-key.exp                 | 2 +-
>  automation/scripts/qemu-smoke-dom0-arm32.sh     | 3 +--
>  automation/scripts/qemu-smoke-dom0-arm64.sh     | 3 +--
>  automation/scripts/qemu-smoke-dom0less-arm32.sh | 3 +--
>  automation/scripts/qemu-smoke-dom0less-arm64.sh | 3 +--
>  automation/scripts/qemu-smoke-ppc64le.sh        | 3 +--
>  automation/scripts/qemu-smoke-riscv64.sh        | 3 +--
>  automation/scripts/qemu-smoke-x86-64.sh         | 3 +--
>  automation/scripts/qemu-xtf-dom0less-arm64.sh   | 3 +--
>  10 files changed, 10 insertions(+), 19 deletions(-)
> 
> diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
> index 42a89e86b021..93914c41bc24 100755
> --- a/automation/scripts/qemu-alpine-x86_64.sh
> +++ b/automation/scripts/qemu-alpine-x86_64.sh
> @@ -1,6 +1,6 @@
>  #!/bin/bash
> 
> -set -ex
> +set -ex -o pipefail
> 
>  # DomU Busybox
>  cd binaries
> @@ -76,7 +76,6 @@ EOF
> 
>  # Run the test
>  rm -f smoke.serial
> -set +e
>  export QEMU_CMD="qemu-system-x86_64 \
>      -cpu qemu64,+svm \
>      -m 2G -smp 2 \
> diff --git a/automation/scripts/qemu-key.exp b/automation/scripts/qemu-key.exp
> index 787f1f08cb96..66c416483146 100755
> --- a/automation/scripts/qemu-key.exp
> +++ b/automation/scripts/qemu-key.exp
> @@ -14,7 +14,7 @@ eval spawn $env(QEMU_CMD)
> 
>  expect_after {
>      -re "(.*)\r" {
> -        exp_continue
> +        exp_continue -continue_timer
>      }
>      timeout {send_error "ERROR-Timeout!\n"; exit 1}
>      eof {send_error "ERROR-EOF!\n"; exit 1}
> diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
> index fd64b19358ae..7c282eff3a58 100755
> --- a/automation/scripts/qemu-smoke-dom0-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
> @@ -1,6 +1,6 @@
>  #!/bin/bash
> 
> -set -ex
> +set -ex -o pipefail
> 
>  serial_log="$(pwd)/smoke.serial"
> 
> @@ -77,7 +77,6 @@ git clone --depth 1 https://gitlab.com/xen-project/imagebuilder.git
>  bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
> 
>  rm -f ${serial_log}
> -set +e
>  export QEMU_CMD="./qemu-system-arm \
>     -machine virt \
>     -machine virtualization=true \
> diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
> index e0cea742b0a0..81f210f7f50e 100755
> --- a/automation/scripts/qemu-smoke-dom0-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
> @@ -1,6 +1,6 @@
>  #!/bin/bash
> 
> -set -ex
> +set -ex -o pipefail
> 
>  # DomU Busybox
>  cd binaries
> @@ -93,7 +93,6 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf
> 
>  # Run the test
>  rm -f smoke.serial
> -set +e
>  export QEMU_CMD="./binaries/qemu-system-aarch64 \
>      -machine virtualization=true \
>      -cpu cortex-a57 -machine type=virt \
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> index e824cb7c2a3d..38e8a0b0bd7d 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> @@ -1,6 +1,6 @@
>  #!/bin/bash
> 
> -set -ex
> +set -ex -o pipefail
> 
>  test_variant=$1
> 
> @@ -130,7 +130,6 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
> 
>  # Run the test
>  rm -f ${serial_log}
> -set +e
>  export QEMU_CMD="./qemu-system-arm \
>      -machine virt \
>      -machine virtualization=true \
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> index f42ba5d196bc..ea67650e17da 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> @@ -1,6 +1,6 @@
>  #!/bin/bash
> 
> -set -ex
> +set -ex -o pipefail
> 
>  test_variant=$1
> 
> @@ -204,7 +204,6 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf
> 
>  # Run the test
>  rm -f smoke.serial
> -set +e
>  export QEMU_CMD="./binaries/qemu-system-aarch64 \
>      -machine virtualization=true \
>      -cpu cortex-a57 -machine type=virt,gic-version=$gic_version \
> diff --git a/automation/scripts/qemu-smoke-ppc64le.sh b/automation/scripts/qemu-smoke-ppc64le.sh
> index 594f92c19cc2..49e189c37058 100755
> --- a/automation/scripts/qemu-smoke-ppc64le.sh
> +++ b/automation/scripts/qemu-smoke-ppc64le.sh
> @@ -1,6 +1,6 @@
>  #!/bin/bash
> 
> -set -ex
> +set -ex -o pipefail
> 
>  serial_log="$(pwd)/smoke.serial"
> 
> @@ -9,7 +9,6 @@ machine=$1
> 
>  # Run the test
>  rm -f ${serial_log}
> -set +e
> 
>  export QEMU_CMD="qemu-system-ppc64 \
>      -bios skiboot.lid \
> diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
> index c2595f657ff3..422ee03e0d26 100755
> --- a/automation/scripts/qemu-smoke-riscv64.sh
> +++ b/automation/scripts/qemu-smoke-riscv64.sh
> @@ -1,10 +1,9 @@
>  #!/bin/bash
> 
> -set -ex
> +set -ex -o pipefail
> 
>  # Run the test
>  rm -f smoke.serial
> -set +e
> 
>  export QEMU_CMD="qemu-system-riscv64 \
>      -M virt \
> diff --git a/automation/scripts/qemu-smoke-x86-64.sh b/automation/scripts/qemu-smoke-x86-64.sh
> index 3440b1761db4..7495185d9fc6 100755
> --- a/automation/scripts/qemu-smoke-x86-64.sh
> +++ b/automation/scripts/qemu-smoke-x86-64.sh
> @@ -1,6 +1,6 @@
>  #!/bin/bash
> 
> -set -ex
> +set -ex -o pipefail
> 
>  # variant should be either pv or pvh
>  variant=$1
> @@ -15,7 +15,6 @@ case $variant in
>  esac
> 
>  rm -f smoke.serial
> -set +e
>  export QEMU_CMD="qemu-system-x86_64 -nographic -kernel binaries/xen \
>          -initrd xtf/tests/example/$k \
>          -append \"loglvl=all console=com1 noreboot console_timestamps=boot $extra\" \
> diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
> index 4042fe50602b..acef1637e25b 100755
> --- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
> +++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
> @@ -1,6 +1,6 @@
>  #!/bin/bash
> 
> -set -ex
> +set -ex -o pipefail
> 
>  # Name of the XTF test
>  xtf_test=$1
> @@ -50,7 +50,6 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf
> 
>  # Run the test
>  rm -f smoke.serial
> -set +e
>  export QEMU_CMD="./binaries/qemu-system-aarch64 \
>      -machine virtualization=true \
>      -cpu cortex-a57 -machine type=virt \
> --
> 2.25.1
> 

