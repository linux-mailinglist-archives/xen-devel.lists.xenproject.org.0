Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A75E66971C2
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 00:22:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495617.765984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS4d4-000579-EU; Tue, 14 Feb 2023 23:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495617.765984; Tue, 14 Feb 2023 23:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS4d4-000546-BC; Tue, 14 Feb 2023 23:22:30 +0000
Received: by outflank-mailman (input) for mailman id 495617;
 Tue, 14 Feb 2023 23:22:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nHuR=6K=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pS4d2-0004UA-KQ
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 23:22:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70cbca1c-acbe-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 00:22:26 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2EACF6194D;
 Tue, 14 Feb 2023 23:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E844BC433EF;
 Tue, 14 Feb 2023 23:22:23 +0000 (UTC)
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
X-Inumbo-ID: 70cbca1c-acbe-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676416944;
	bh=QhDrj1PmCcmZPwKVipGefL51808RwRvE4NjD85r5vCs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NaZutr/vYWYzsl3FYUwKv2yk9A8leUKDCE7CgPi/nuvYROKcc8KuH01dDjCm2elXB
	 GKHquDWs+rQO/rS8sFkfe64UR1x7+TX7eeNAUzkvjcfd0gcoJDAhUG0TU8VR4xCn8I
	 m/i4c/I5z6neBWIlYvxFn8lF/KmhvGdxNOlOx7p5ITT/McPbwTBmE1tmbtAafO7ZfN
	 f5OIod1FxLzpfp+OOc8sYwgh9ePWunJGmGEs5M3i+DmxBx3V1Yjji6GIi5N2YdqVa/
	 jBNJBMiCVuJHEiWwGH5PiKATNLcpWH4oy/PiwmFkHoVh6nxlD2M+KwyZilKUg2V21v
	 JATpN3Uy3GLJw==
Date: Tue, 14 Feb 2023 15:22:22 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 4/5] automation: Add a gzip compressed kernel image
 test on arm32
In-Reply-To: <20230214153842.15637-5-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2302141522060.2025117@ubuntu-linux-20-04-desktop>
References: <20230214153842.15637-1-michal.orzel@amd.com> <20230214153842.15637-5-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Feb 2023, Michal Orzel wrote:
> Xen supports booting gzip compressed kernels, therefore add a new test
> job qemu-smoke-dom0less-arm32-gcc-gzip in debug and non-debug variant
> that will execute qemu-smoke-dom0less-arm32.sh script to test booting
> a domU with a gzip compressed kernel image (in our case zImage).
> 
> By passing "gzip" as a test variant, the test will call gzip command
> to compress kernel image and use it in ImageBuilder configuration for
> domU1. No need for a specific check to be executed from domU. Being able
> to see a test message from a boot log is sufficient to mark a test as
> passed.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
>  - take into account dom0 presence
>  - drop Rb as a result of code changes
> ---
>  automation/gitlab-ci/test.yaml                  | 16 ++++++++++++++++
>  automation/scripts/qemu-smoke-dom0less-arm32.sh | 13 +++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index c2bcc5d4d3e5..be7a55d89708 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -242,6 +242,22 @@ qemu-smoke-dom0less-arm32-gcc-debug-staticmem:
>      - *arm32-test-needs
>      - debian-unstable-gcc-arm32-debug-staticmem
>  
> +qemu-smoke-dom0less-arm32-gcc-gzip:
> +  extends: .qemu-arm32
> +  script:
> +    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh gzip 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *arm32-test-needs
> +    - debian-unstable-gcc-arm32
> +
> +qemu-smoke-dom0less-arm32-gcc-debug-gzip:
> +  extends: .qemu-arm32
> +  script:
> +    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh gzip 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *arm32-test-needs
> +    - debian-unstable-gcc-arm32-debug
> +
>  qemu-alpine-x86_64-gcc:
>    extends: .qemu-x86-64
>    script:
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> index bd89a3f8b45e..c2e331451d99 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> @@ -33,6 +33,15 @@ fi
>  "
>  fi
>  
> +if [[ "${test_variant}" == "gzip" ]]; then
> +    # Compress kernel image with gzip (keep unmodified one for dom0)
> +    gzip -k vmlinuz
> +    passed="${test_variant} test passed"
> +    domU_check="
> +echo \"${passed}\"
> +"
> +fi
> +
>  # dom0/domU rootfs
>  # We are using the same rootfs for dom0 and domU. The only difference is
>  # that for the former, we set explictly rdinit to /bin/sh, whereas for the
> @@ -89,6 +98,10 @@ if [[ "${test_variant}" == "static-mem" ]]; then
>      echo -e "\nDOMU_STATIC_MEM[0]=\"${domu_base} ${domu_size}\"" >> config
>  fi
>  
> +if [[ "${test_variant}" == "gzip" ]]; then
> +    sed -i 's/DOMU_KERNEL\[0\]=.*/DOMU_KERNEL\[0\]="vmlinuz.gz"/' config
> +fi
> +
>  rm -rf imagebuilder
>  git clone https://gitlab.com/ViryaOS/imagebuilder
>  bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
> -- 
> 2.25.1
> 

