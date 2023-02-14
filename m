Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6530F6971C0
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 00:22:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495613.765973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS4cf-0004c7-60; Tue, 14 Feb 2023 23:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495613.765973; Tue, 14 Feb 2023 23:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS4cf-0004a8-2W; Tue, 14 Feb 2023 23:22:05 +0000
Received: by outflank-mailman (input) for mailman id 495613;
 Tue, 14 Feb 2023 23:22:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nHuR=6K=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pS4cd-0003yL-3m
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 23:22:03 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62f160bb-acbe-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 00:22:02 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CF7E4B81E9A;
 Tue, 14 Feb 2023 23:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11C8C433EF;
 Tue, 14 Feb 2023 23:21:59 +0000 (UTC)
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
X-Inumbo-ID: 62f160bb-acbe-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676416920;
	bh=nPyJql4QNTJm7KNH0jPKRMdPZGiUK5xbF8Yei2iby6A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qKDASw/JuWOQB20+Sm9bf+EE/W3HBCBzaHhXGfdqCjR+59qf6x5y1fXyjeRPJ+ACy
	 RUVCndBai2V53rLbcTEE5KATKkRkFAqiiEghf724TYWFVQt9TKnltfSOg/48Sfqvu3
	 a3QWgs0kQKxtFQNgBUi2nEQBhonkeJMMBUc32LcxiSPVaQRntAfUpOIvz7xVuY6N4T
	 p5ldcGwSd2V/eiXGDUAJtbNYpTg+kVYBusg9REgUxlRicH7PTc2NkXC1RVqdEKoePJ
	 LWqjYQ6q0y11iInwGGo6015ZGGfqqSmGGzokqisrW6cwM2/TW9UDy43qw+vcXNTAGD
	 4Ej7O4wh7I08w==
Date: Tue, 14 Feb 2023 15:21:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 3/5] automation: Add a static memory allocation test
 on arm32
In-Reply-To: <20230214153842.15637-4-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2302141521230.2025117@ubuntu-linux-20-04-desktop>
References: <20230214153842.15637-1-michal.orzel@amd.com> <20230214153842.15637-4-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Feb 2023, Michal Orzel wrote:
> Add a new test job qemu-smoke-dom0less-arm32-gcc-staticmem in debug
> and non-debug variant that will execute qemu-smoke-dom0less-arm32.sh
> script to test static memory allocation feature. The test case itself
> is directly taken from dom0less arm64 testing.
> 
> Populate build jobs to compile Xen with config options necessary to
> enable static memory feature. Populate test jobs passing "static-mem"
> as a test variant. The test configures domU with a static memory region
> (direct-mapped) and adds a check using /proc/iomem to determine the
> memory region marked as "System RAM".
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
>  - take into account new container for arm32 cross builds
>  - drop Rb as a result of code changes
> ---
>  automation/gitlab-ci/build.yaml               | 20 +++++++++++++++++++
>  automation/gitlab-ci/test.yaml                | 16 +++++++++++++++
>  .../scripts/qemu-smoke-dom0less-arm32.sh      | 17 ++++++++++++++++
>  3 files changed, 53 insertions(+)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index f8e156e0a994..079e9b73f659 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -565,6 +565,26 @@ debian-unstable-gcc-arm32-debug-randconfig:
>      HYPERVISOR_ONLY: y
>      RANDCONFIG: y
>  
> +debian-unstable-gcc-arm32-staticmem:
> +  extends: .gcc-arm32-cross-build
> +  variables:
> +    CONTAINER: debian:unstable-arm64v8-arm32-gcc
> +    HYPERVISOR_ONLY: y
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_EXPERT=y
> +      CONFIG_UNSUPPORTED=y
> +      CONFIG_STATIC_MEMORY=y
> +
> +debian-unstable-gcc-arm32-debug-staticmem:
> +  extends: .gcc-arm32-cross-build-debug
> +  variables:
> +    CONTAINER: debian:unstable-arm64v8-arm32-gcc
> +    HYPERVISOR_ONLY: y
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_EXPERT=y
> +      CONFIG_UNSUPPORTED=y
> +      CONFIG_STATIC_MEMORY=y
> +
>  # Arm builds
>  
>  debian-unstable-gcc-arm64:
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 84ab1fee50a4..c2bcc5d4d3e5 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -226,6 +226,22 @@ qemu-smoke-dom0less-arm32-gcc-debug:
>      - *arm32-test-needs
>      - debian-unstable-gcc-arm32-debug
>  
> +qemu-smoke-dom0less-arm32-gcc-staticmem:
> +  extends: .qemu-arm32
> +  script:
> +    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh static-mem 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *arm32-test-needs
> +    - debian-unstable-gcc-arm32-staticmem
> +
> +qemu-smoke-dom0less-arm32-gcc-debug-staticmem:
> +  extends: .qemu-arm32
> +  script:
> +    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh static-mem 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *arm32-test-needs
> +    - debian-unstable-gcc-arm32-debug-staticmem
> +
>  qemu-alpine-x86_64-gcc:
>    extends: .qemu-x86-64
>    script:
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> index e3f2b28f3f89..bd89a3f8b45e 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> @@ -20,6 +20,19 @@ echo \"${passed}\"
>  "
>  fi
>  
> +if [[ "${test_variant}" == "static-mem" ]]; then
> +    # Memory range that is statically allocated to domU1
> +    domu_base="0x50000000"
> +    domu_size="0x20000000"
> +    passed="${test_variant} test passed"
> +    domU_check="
> +mem_range=$(printf \"%08x-%08x\" ${domu_base} $(( ${domu_base} + ${domu_size} - 1 )))
> +if grep -q -x \"\${mem_range} : System RAM\" /proc/iomem; then
> +    echo \"${passed}\"
> +fi
> +"
> +fi
> +
>  # dom0/domU rootfs
>  # We are using the same rootfs for dom0 and domU. The only difference is
>  # that for the former, we set explictly rdinit to /bin/sh, whereas for the
> @@ -72,6 +85,10 @@ BOOT_CMD="bootm"
>  UBOOT_SOURCE="boot.source"
>  UBOOT_SCRIPT="boot.scr"' > config
>  
> +if [[ "${test_variant}" == "static-mem" ]]; then
> +    echo -e "\nDOMU_STATIC_MEM[0]=\"${domu_base} ${domu_size}\"" >> config
> +fi
> +
>  rm -rf imagebuilder
>  git clone https://gitlab.com/ViryaOS/imagebuilder
>  bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
> -- 
> 2.25.1
> 

