Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1ED6A8F03
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 02:57:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505519.778337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXufD-000121-Ku; Fri, 03 Mar 2023 01:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505519.778337; Fri, 03 Mar 2023 01:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXufD-000102-IF; Fri, 03 Mar 2023 01:56:51 +0000
Received: by outflank-mailman (input) for mailman id 505519;
 Fri, 03 Mar 2023 01:56:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVKH=63=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pXufC-0000zw-43
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 01:56:50 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a892ce6d-b966-11ed-96ad-2f268f93b82a;
 Fri, 03 Mar 2023 02:56:49 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 958B3B8161F;
 Fri,  3 Mar 2023 01:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63027C433EF;
 Fri,  3 Mar 2023 01:56:45 +0000 (UTC)
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
X-Inumbo-ID: a892ce6d-b966-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677808606;
	bh=RFMk4bNqwpsiuY41rWDiX2skM//pLsTzyQyFjORv0ZI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ApWme3FMgkWcjV2fASFbpM9ES09Hgss3VdVrGn8EtgclIlxs9KXD73nQ17YwxX0FU
	 iHE+kmloxawP6+wP71ECcbFXtTSzFrq46NNmy8RX/Rn35f5NTyeG6YjW0OPhQH7fh7
	 3CieWGThj+0gIIxqAvR5HBwQ0aYkFsCTe7gvF2n5BtWDbG1IiAsG136tq/4JSIhTjj
	 Xtq/Kyj+t4gWwQ2Pns9xr7J9GsZClbzfrmyfraYDilhDD6013ALQfd0X2Frp1sSqOR
	 LfNyO+OzLKcT/3itgZW//b/7TyBDwy0PQqmzam+CCt18IE2/JD78pQJZlOPmOpEVJD
	 1uy1xeDEYlCzw==
Date: Thu, 2 Mar 2023 17:56:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "jiamei.xie" <jiamei.xie@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, sstabellini@kernel.org, 
    bertrand.marquis@arm.com, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] automation: arm64: Create a test job for testing
 static shared memory on qemu
In-Reply-To: <20230302044421.136068-3-jiamei.xie@arm.com>
Message-ID: <alpine.DEB.2.22.394.2303021754470.863724@ubuntu-linux-20-04-desktop>
References: <20230302044421.136068-1-jiamei.xie@arm.com> <20230302044421.136068-3-jiamei.xie@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 2 Mar 2023, jiamei.xie wrote:
> Create a new test job, called qemu-smoke-dom0less-arm64-gcc-static-shared-mem.
> 
> Adjust qemu-smoke-dom0less-arm64.sh script to accomodate the static
> shared memory test as a new test variant. The test variant is determined
> based on the first argument passed to the script. For testing static
> shared memory, the argument is 'static-shared-mem'.
> 
> The test configures two dom0less DOMUs with a static shared memory
> region and adds a check in the init script.
> 
> The check consists in comparing the contents of the /proc/device-tree/reserved-memory
> xen-shmem entry with the static shared memory range and id with which
> DOMUs were configured. If the memory layout is correct, a message gets
> printed by DOMU.
> 
> At the end of the qemu run, the script searches for the specific message
> in the logs and fails if not found.
> 
> Signed-off-by: jiamei.xie <jiamei.xie@arm.com>
> ---
>  automation/gitlab-ci/build.yaml               | 18 ++++++++++++
>  automation/gitlab-ci/test.yaml                | 16 ++++++++++
>  .../scripts/qemu-smoke-dom0less-arm64.sh      | 29 +++++++++++++++++++
>  3 files changed, 63 insertions(+)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 38bb22d860..820cc0af83 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -623,6 +623,24 @@ alpine-3.12-gcc-debug-arm64-staticmem:
>        CONFIG_UNSUPPORTED=y
>        CONFIG_STATIC_MEMORY=y
>  
> +alpine-3.12-gcc-arm64-static-shared-mem:
> +  extends: .gcc-arm64-build
> +  variables:
> +    CONTAINER: alpine:3.12-arm64v8
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_UNSUPPORTED=y
> +      CONFIG_STATIC_MEMORY=y
> +      CONFIG_STATIC_SHM=y
> +
> +alpine-3.12-gcc-debug-arm64-static-shared-mem:
> +  extends: .gcc-arm64-build-debug
> +  variables:
> +    CONTAINER: alpine:3.12-arm64v8
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_UNSUPPORTED=y
> +      CONFIG_STATIC_MEMORY=y
> +      CONFIG_STATIC_SHM=y
> +
>  alpine-3.12-gcc-arm64-boot-cpupools:
>    extends: .gcc-arm64-build
>    variables:
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 5a9b88477a..f4d36babda 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -149,6 +149,22 @@ qemu-smoke-dom0less-arm64-gcc-debug-staticheap:
>     - *arm64-test-needs
>     - alpine-3.12-gcc-debug-arm64
>  
> +qemu-smoke-dom0less-arm64-gcc-static-shared-mem:
> +  extends: .qemu-arm64
> +  script:
> +    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-shared-mem 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *arm64-test-needs
> +    - alpine-3.12-gcc-arm64-static-shared-mem
> +
> +qemu-smoke-dom0less-arm64-gcc-debug-static-shared-mem:
> +  extends: .qemu-arm64
> +  script:
> +    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-shared-mem 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *arm64-test-needs
> +    - alpine-3.12-gcc-debug-arm64-static-shared-mem
> +
>  qemu-smoke-dom0less-arm64-gcc-boot-cpupools:
>    extends: .qemu-arm64
>    script:
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> index 4e73857199..fe3a282726 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> @@ -32,6 +32,25 @@ if [[ "${test_variant}" == "static-heap" ]]; then
>      domU_check="echo \"${passed}\""
>  fi
>  
> +
> +if [[ "${test_variant}" == "static-shared-mem" ]]; then
> +    passed="${test_variant} test passed"
> +    SHARED_MEM_HOST="50000000"
> +    SHARED_MEM_GUEST="4000000"
> +    SHARED_MEM_SIZE="10000000"
> +    SHARED_MEM_ID="my-shared-mem-0"
> +
> +    domU_check="
> +current_id=\$(cat /proc/device-tree/reserved-memory/xen-shmem@4000000/xen,id 2>/dev/null)
> +expected_id=\"\$(echo ${SHARED_MEM_ID})\"
> +current_reg=\$(hexdump -e '16/1 \"%02x\"' /proc/device-tree/reserved-memory/xen-shmem@4000000/reg 2>/dev/null)
> +expected_reg=$(printf \"%016x%016x\" 0x${SHARED_MEM_GUEST} 0x${SHARED_MEM_SIZE})
> +if [[ \"\${expected_reg}\" == \"\${current_reg}\" && \"\${current_id}\" == \"\${expected_id}\" ]]; then
> +    echo \"${passed}\"
> +fi
> +    "
> +fi

all good so far


>  if [[ "${test_variant}" == "boot-cpupools" ]]; then
>      # Check if domU0 (id=1) is assigned to Pool-1 with null scheduler
>      passed="${test_variant} test passed"
> @@ -133,6 +152,16 @@ if [[ "${test_variant}" == "static-mem" ]]; then
>      echo -e "\nDOMU_STATIC_MEM[0]=\"${domu_base} ${domu_size}\"" >> binaries/config
>  fi
>  
> +if [[ "${test_variant}" == "static-shared-mem" ]]; then
> +echo "NUM_DOMUS=2
> +DOMU_SHARED_MEM[0]=\""0x${SHARED_MEM_HOST} 0x${SHARED_MEM_GUEST} 0x${SHARED_MEM_SIZE}"\"
> +DOMU_SHARED_MEM_ID[0]="${SHARED_MEM_ID}"
> +DOMU_KERNEL[1]=\"Image\"
> +DOMU_RAMDISK[1]=\"initrd\"

Please move the second domU creation above to the general ImageBuilder
script. It is fine to start 2 dom0less guests for all tests (assuming it
doesn't break anything).

So here under the if [[ "${test_variant}" == "static-shared-mem" ]] we
can keep the setting of DOMU_SHARED_MEM and DOMU_SHARED_MEM_ID. (Or only
DOMU_SHARED_MEM if you follow the suggestion on the other patch.)



> +DOMU_SHARED_MEM[1]=\"0x${SHARED_MEM_HOST} 0x${SHARED_MEM_GUEST} 0x${SHARED_MEM_SIZE}\"
> +DOMU_SHARED_MEM_ID[1]=\"${SHARED_MEM_ID}\"" >> binaries/config
> +fi
> +
>  if [[ "${test_variant}" == "static-heap" ]]; then
>      # ImageBuilder uses the config file to create the uboot script. Devicetree
>      # will be set via the generated uboot script.
> -- 
> 2.25.1
> 

