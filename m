Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15117695564
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 01:33:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494901.765086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRjFJ-0000Ah-Qp; Tue, 14 Feb 2023 00:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494901.765086; Tue, 14 Feb 2023 00:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRjFJ-00007T-Ng; Tue, 14 Feb 2023 00:32:33 +0000
Received: by outflank-mailman (input) for mailman id 494901;
 Tue, 14 Feb 2023 00:32:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nHuR=6K=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pRjFI-0008Jd-8V
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 00:32:32 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11392cc6-abff-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 01:32:31 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D3805B81A2B;
 Tue, 14 Feb 2023 00:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE6CCC4339B;
 Tue, 14 Feb 2023 00:32:28 +0000 (UTC)
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
X-Inumbo-ID: 11392cc6-abff-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676334749;
	bh=Iko+bq06Ug3Z5JNn58WE7Wj2iLf6aIMHm/3cFv7xpJs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EhLdV79I/6i80Yd8Aiz2Vg3Zi+a3bjaqeFgjqr8nW3FLxVi0RJgEe188ojSAUj54w
	 1Bf8Imhc5E4LWJAX6bcGAa5dI7Xwt7yHg5EeYed6VkmFSULiPQ2bvspK3C42CoaqWn
	 gah+G8A0N/zjapmMAr5ojgyQKVsZc5rbAgnoxk2xn3eo17Lv90YAi/ZvYfThZ4+we0
	 P6lw6dDln8SeU+vWVEV+tmw8iOSmuy+1mv4xXug0NpkSdGEYDanrriKakrqfZhk1QV
	 FrPZ9lhCkXq2Gnvtl31Da2LmWMQW95TVJkqxT0VH6NV6RyCvmL46m7J58jV1+CgvWQ
	 Rl3wcPLKvzC1w==
Date: Mon, 13 Feb 2023 16:32:27 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/3] automation: Add a static memory allocation test on
 arm32
In-Reply-To: <20230213142210.11728-3-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2302131545140.4661@ubuntu-linux-20-04-desktop>
References: <20230213142210.11728-1-michal.orzel@amd.com> <20230213142210.11728-3-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Feb 2023, Michal Orzel wrote:
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
>  automation/gitlab-ci/build.yaml               | 20 +++++++++++++++++++
>  automation/gitlab-ci/test.yaml                | 16 +++++++++++++++
>  .../scripts/qemu-smoke-dom0less-arm32.sh      | 17 ++++++++++++++++
>  3 files changed, 53 insertions(+)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index a053c5c7325d..166182bc595f 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -565,6 +565,26 @@ debian-unstable-gcc-arm32-debug-randconfig:
>      HYPERVISOR_ONLY: y
>      RANDCONFIG: y
>  
> +debian-unstable-gcc-arm32-staticmem:
> +  extends: .gcc-arm32-cross-build
> +  variables:
> +    CONTAINER: debian:unstable-arm32-gcc
> +    HYPERVISOR_ONLY: y
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_EXPERT=y
> +      CONFIG_UNSUPPORTED=y
> +      CONFIG_STATIC_MEMORY=y
> +
> +debian-unstable-gcc-arm32-debug-staticmem:
> +  extends: .gcc-arm32-cross-build-debug
> +  variables:
> +    CONTAINER: debian:unstable-arm32-gcc
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
> index c81529cbbfd0..f89ee8b6464a 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> @@ -17,6 +17,19 @@ echo \"${passed}\"
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
>  # domU rootfs
>  mkdir rootfs
>  cd rootfs
> @@ -62,6 +75,10 @@ BOOT_CMD="bootm"
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

