Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C657D67ED32
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 19:14:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485837.753256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLTEr-0007NY-6g; Fri, 27 Jan 2023 18:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485837.753256; Fri, 27 Jan 2023 18:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLTEr-0007Kq-3c; Fri, 27 Jan 2023 18:14:13 +0000
Received: by outflank-mailman (input) for mailman id 485837;
 Fri, 27 Jan 2023 18:14:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BqQd=5Y=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pLTEp-0007Kk-8x
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 18:14:11 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 650f0f89-9e6e-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 19:14:10 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7849FB80B18;
 Fri, 27 Jan 2023 18:14:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078C2C433D2;
 Fri, 27 Jan 2023 18:14:06 +0000 (UTC)
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
X-Inumbo-ID: 650f0f89-9e6e-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674843248;
	bh=X99K51mQo/OW5UOP/69cHAe+79Te/Xzf01qxdjLqMWs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=R1Vdz7WNSyUL03ioLDdjZWsNPaw9vgbGRDcfqA6W52lVNvC5Bb6bGeIQNnQUUH6k/
	 gWDd6c3Y2uvE725Mpu3s/y2xB2/xLwIIevTgQdZmEbn5FgXutD+gcQKr3I8QCzDMQM
	 kQ8AzJIGOeiTl5xPPy7uUy+39tRwuYezLEXrsxmb1lvWRWNUHDiG4NdXIIv3FOjM7W
	 jsIyWUEYC9VFBSZqCkDCn1mub9DACb2cAfpkAa1FNsIFBAKWamh+ej9OhE7HGOOuNK
	 sv3rIt/VeBQNhOhMctqAY45JRm1eX5qgOjhgPMoyVhlMBHdSc6mBmmzPF8Wk4oalzh
	 N/10ST6WkZ6zg==
Date: Fri, 27 Jan 2023 10:14:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Gianluca Guida <gianluca@rivosinc.com>, Doug Goldstein <cardoe@cardoe.com>, 
    Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v7 2/2] automation: add RISC-V smoke test
In-Reply-To: <e2d722a5f3fffc5708c1cc99efad63ab04d25ec3.1674819203.git.oleksii.kurochko@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2301271013460.1978264@ubuntu-linux-20-04-desktop>
References: <cover.1674819203.git.oleksii.kurochko@gmail.com> <e2d722a5f3fffc5708c1cc99efad63ab04d25ec3.1674819203.git.oleksii.kurochko@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 27 Jan 2023, Oleksii Kurochko wrote:
> Add check if there is a message 'Hello from C env' presents
> in log file to be sure that stack is set and C part of early printk
> is working.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> Changes in V7:
>  - Fix dependecy for qemu-smoke-riscv64-gcc job
> ---
> Changes in V6:
>  - Rename container name in test.yaml for .qemu-riscv64.
> ---
> Changes in V5:
>   - Nothing changed
> ---
> Changes in V4:
>   - Nothing changed
> ---
> Changes in V3:
>   - Nothing changed
>   - All mentioned comments by Stefano in Xen mailing list will be
>     fixed as a separate patch out of this patch series.
> ---
>  automation/gitlab-ci/test.yaml           | 20 ++++++++++++++++++++
>  automation/scripts/qemu-smoke-riscv64.sh | 20 ++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100755 automation/scripts/qemu-smoke-riscv64.sh
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index afd80adfe1..4dbe1b8af7 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -54,6 +54,19 @@
>    tags:
>      - x86_64
>  
> +.qemu-riscv64:
> +  extends: .test-jobs-common
> +  variables:
> +    CONTAINER: archlinux:current-riscv64
> +    LOGFILE: qemu-smoke-riscv64.log
> +  artifacts:
> +    paths:
> +      - smoke.serial
> +      - '*.log'
> +    when: always
> +  tags:
> +    - x86_64
> +
>  .yocto-test:
>    extends: .test-jobs-common
>    script:
> @@ -234,6 +247,13 @@ qemu-smoke-x86-64-clang-pvh:
>    needs:
>      - debian-unstable-clang-debug
>  
> +qemu-smoke-riscv64-gcc:
> +  extends: .qemu-riscv64
> +  script:
> +    - ./automation/scripts/qemu-smoke-riscv64.sh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - .gcc-riscv64-cross-build

This is wrong, I think it should be: archlinux-current-gcc-riscv64 ?


>  # Yocto test jobs
>  yocto-qemuarm64:
>    extends: .yocto-test-arm64
> diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
> new file mode 100755
> index 0000000000..e0f06360bc
> --- /dev/null
> +++ b/automation/scripts/qemu-smoke-riscv64.sh
> @@ -0,0 +1,20 @@
> +#!/bin/bash
> +
> +set -ex
> +
> +# Run the test
> +rm -f smoke.serial
> +set +e
> +
> +timeout -k 1 2 \
> +qemu-system-riscv64 \
> +    -M virt \
> +    -smp 1 \
> +    -nographic \
> +    -m 2g \
> +    -kernel binaries/xen \
> +    |& tee smoke.serial
> +
> +set -e
> +(grep -q "Hello from C env" smoke.serial) || exit 1
> +exit 0
> -- 
> 2.39.0
> 

