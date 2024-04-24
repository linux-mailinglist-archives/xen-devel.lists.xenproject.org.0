Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F158B177A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 01:52:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711708.1111886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzmOy-000400-1T; Wed, 24 Apr 2024 23:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711708.1111886; Wed, 24 Apr 2024 23:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzmOx-0003yU-U1; Wed, 24 Apr 2024 23:51:47 +0000
Received: by outflank-mailman (input) for mailman id 711708;
 Wed, 24 Apr 2024 23:51:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nv0e=L5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rzmOw-0003yO-Om
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 23:51:46 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99d217df-0295-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 01:51:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 011EECE17D7;
 Wed, 24 Apr 2024 23:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940A8C113CD;
 Wed, 24 Apr 2024 23:51:36 +0000 (UTC)
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
X-Inumbo-ID: 99d217df-0295-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714002697;
	bh=vlst9L3cLGdZWK5Q7beLf98lP8imeJGbGZtfMVZ5gDc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QgoQpj00PeORTmJpACgi8R8jlYI9FpTYk3QPqLsisfJMGqywRvnMlkEXdLnxm0q0W
	 sgjHcXMNU4Bk4JTQPEWl0xv0mlBN6VDVsjDdKu00CVahdQXnRv67akKkx1t/AZrjqE
	 g1rCnjldsOOQowcC0kZO/sfjTqHTYHW25SP4ISKLP13O4QsUqwlpXJTyppgUyQ1kh1
	 Qdm/H9EbtqSVKtlFQ0339y1mAn+W2T318lvV4jmM2dKmS7N5Z4u5TDdKRkrG/+B+/g
	 ul4QRYAr8gl/W/XS5d8Hu02E9EJyOrJWPXWe3ND5sDyx842HsVUzeiJ3z2Ygr1LbVm
	 UACkOnBWcoCHQ==
Date: Wed, 24 Apr 2024 16:51:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/3] automation: Add arm{64,32} earlyprintk jobs
In-Reply-To: <20240423161121.138536-3-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2404241651280.3940@ubuntu-linux-20-04-desktop>
References: <20240423161121.138536-1-michal.orzel@amd.com> <20240423161121.138536-3-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Apr 2024, Michal Orzel wrote:
> Introduce qemu based Arm earlyprintk test and build jobs to cover this
> feature in debug variant. The tests simply check for the presence of the
> last message printed by the bootstrap code before entering the C world.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/build.yaml                 | 17 +++++++++++++++++
>  automation/gitlab-ci/test.yaml                  | 16 ++++++++++++++++
>  automation/scripts/qemu-smoke-dom0less-arm32.sh |  7 +++++++
>  automation/scripts/qemu-smoke-dom0less-arm64.sh |  5 +++++
>  4 files changed, 45 insertions(+)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index f3c934471f32..49d6265ad5b4 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -402,6 +402,15 @@ debian-bookworm-gcc-arm32-debug-staticmem:
>        CONFIG_UNSUPPORTED=y
>        CONFIG_STATIC_MEMORY=y
>  
> +debian-bookworm-gcc-arm32-debug-earlyprintk:
> +  extends: .gcc-arm32-cross-build-debug
> +  variables:
> +    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
> +    HYPERVISOR_ONLY: y
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_EARLY_UART_CHOICE_PL011=y
> +      CONFIG_EARLY_UART_BASE_ADDRESS=0x9000000
> +
>  # Arm builds
>  
>  debian-bookworm-gcc-arm64:
> @@ -473,6 +482,14 @@ alpine-3.18-gcc-debug-arm64-boot-cpupools:
>      EXTRA_XEN_CONFIG: |
>        CONFIG_BOOT_TIME_CPUPOOLS=y
>  
> +alpine-3.18-gcc-debug-arm64-earlyprintk:
> +  extends: .gcc-arm64-build-debug
> +  variables:
> +    CONTAINER: alpine:3.18-arm64v8
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_EARLY_UART_CHOICE_PL011=y
> +      CONFIG_EARLY_UART_BASE_ADDRESS=0x9000000
> +
>  # RISC-V 64 cross-build
>  .riscv-fixed-randconfig:
>    variables: &riscv-fixed-randconfig
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 55a7831ad292..1e5d86763f6c 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -287,6 +287,14 @@ qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
>      - *arm64-test-needs
>      - alpine-3.18-gcc-debug-arm64-boot-cpupools
>  
> +qemu-smoke-dom0less-arm64-gcc-debug-earlyprintk:
> +  extends: .qemu-arm64
> +  script:
> +    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh earlyprintk 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *arm64-test-needs
> +    - alpine-3.18-gcc-debug-arm64-earlyprintk
> +
>  qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
>    extends: .qemu-arm64
>    script:
> @@ -359,6 +367,14 @@ qemu-smoke-dom0less-arm32-gcc-debug-without-dom0:
>      - *arm32-test-needs
>      - debian-bookworm-gcc-arm32-debug
>  
> +qemu-smoke-dom0less-arm32-gcc-debug-earlyprintk:
> +  extends: .qemu-arm32
> +  script:
> +    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh earlyprintk 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *arm32-test-needs
> +    - debian-bookworm-gcc-arm32-debug-earlyprintk
> +
>  qemu-alpine-x86_64-gcc:
>    extends: .qemu-x86-64
>    script:
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> index e31b6b9014e1..1e2b939aadf7 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> @@ -53,6 +53,13 @@ echo \"${passed}\"
>  "
>  fi
>  
> +if [[ "${test_variant}" == "earlyprintk" ]]; then
> +    # Clear dom0 prompt
> +    dom0_prompt=""
> +    # Last early printk message before entering C world
> +    passed="\- Ready \-"
> +fi
> +
>  # dom0/domU rootfs
>  # We are using the same rootfs for dom0 and domU. The only difference is
>  # that for the former, we set explictly rdinit to /bin/sh, whereas for the
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> index e748b8ef1699..fc943a1a622c 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> @@ -61,6 +61,11 @@ fi
>  "
>  fi
>  
> +if [[ "${test_variant}" == "earlyprintk" ]]; then
> +    # Last early printk message before entering C world
> +    passed="\- Ready \-"
> +fi
> +
>  # XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
>  curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
>  ./binaries/qemu-system-aarch64 \
> -- 
> 2.25.1
> 

