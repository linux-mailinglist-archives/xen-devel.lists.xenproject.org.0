Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 841336A8EFA
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 02:51:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505514.778327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXuZL-0000P2-1L; Fri, 03 Mar 2023 01:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505514.778327; Fri, 03 Mar 2023 01:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXuZK-0000Mi-UK; Fri, 03 Mar 2023 01:50:46 +0000
Received: by outflank-mailman (input) for mailman id 505514;
 Fri, 03 Mar 2023 01:50:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVKH=63=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pXuZK-0000Mc-7l
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 01:50:46 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cde271bf-b965-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 02:50:42 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A3F4FB81620;
 Fri,  3 Mar 2023 01:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F1DBC433EF;
 Fri,  3 Mar 2023 01:50:39 +0000 (UTC)
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
X-Inumbo-ID: cde271bf-b965-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677808240;
	bh=J4jq6uQhFtdRXuZ1EBQsnhna5276jBkAgGExuHkgetc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ihVgY7Nk0vloYX++qkIRiPGAl+YQ3qDHKqVurRj5j3GOZP47aHnPH4XbtUeF91iJ6
	 AT2uBNPx4085x59iqgaWdgI78PEuuU+2B9TUXS205demTh7ok30P5ExrW0BIb3xKtR
	 ljqHAQZOYbWVRQUupaB9htYETdBgbuc4WfbTq/Gx1q+Jrwx95IJUuM4pPP4PMELBj9
	 1PcM8q+BltsOS/aOCo700n8XjLnHn+kz1VsuS+4jvusD/4A/7E6ir2irBv0TnXHBQD
	 GQz9BeWDUKuJfWe19IHJDjDE/6vm+uFgQMeaF4G5buwsqYwaNs5ZFLwiCfxNLSZjmq
	 +59osOiVPXaww==
Date: Thu, 2 Mar 2023 17:50:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "jiamei.xie" <jiamei.xie@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, sstabellini@kernel.org, 
    bertrand.marquis@arm.com, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/2] automation: arm64: Create a test job for testing
 static heap on qemu
In-Reply-To: <20230302044421.136068-2-jiamei.xie@arm.com>
Message-ID: <alpine.DEB.2.22.394.2303021748290.863724@ubuntu-linux-20-04-desktop>
References: <20230302044421.136068-1-jiamei.xie@arm.com> <20230302044421.136068-2-jiamei.xie@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 2 Mar 2023, jiamei.xie wrote:
> From: Jiamei Xie <jiamei.xie@arm.com>
> 
> Create a new test job, called qemu-smoke-dom0less-arm64-gcc-staticheap.
> 
> Add property "xen,static-heap" under /chosen node to enable static-heap.
> If the domU can start successfully with static-heap enabled, then this
> test pass.
> 
> Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>

Hi Jiamei, thanks for the patch!


> ---
>  automation/gitlab-ci/test.yaml                 | 16 ++++++++++++++++
>  .../scripts/qemu-smoke-dom0less-arm64.sh       | 18 ++++++++++++++++++
>  2 files changed, 34 insertions(+)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 1c5f400b68..5a9b88477a 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -133,6 +133,22 @@ qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
>      - *arm64-test-needs
>      - alpine-3.12-gcc-debug-arm64-staticmem
>  
> +qemu-smoke-dom0less-arm64-gcc-staticheap:
> + extends: .qemu-arm64
> + script:
> +   - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-heap 2>&1 | tee ${LOGFILE}
> + needs:
> +   - *arm64-test-needs
> +   - alpine-3.12-gcc-arm64
> +
> +qemu-smoke-dom0less-arm64-gcc-debug-staticheap:
> + extends: .qemu-arm64
> + script:
> +   - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-heap 2>&1 | tee ${LOGFILE}
> + needs:
> +   - *arm64-test-needs
> +   - alpine-3.12-gcc-debug-arm64
> +
>  qemu-smoke-dom0less-arm64-gcc-boot-cpupools:
>    extends: .qemu-arm64
>    script:
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> index 182a4b6c18..4e73857199 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> @@ -27,6 +27,11 @@ fi
>  "
>  fi
>  
> +if [[ "${test_variant}" == "static-heap" ]]; then
> +    passed="${test_variant} test passed"
> +    domU_check="echo \"${passed}\""
> +fi
> +
>  if [[ "${test_variant}" == "boot-cpupools" ]]; then
>      # Check if domU0 (id=1) is assigned to Pool-1 with null scheduler
>      passed="${test_variant} test passed"
> @@ -128,6 +133,19 @@ if [[ "${test_variant}" == "static-mem" ]]; then
>      echo -e "\nDOMU_STATIC_MEM[0]=\"${domu_base} ${domu_size}\"" >> binaries/config
>  fi
>  
> +if [[ "${test_variant}" == "static-heap" ]]; then
> +    # ImageBuilder uses the config file to create the uboot script. Devicetree
> +    # will be set via the generated uboot script.
> +    # The valid memory range is 0x40000000 to 0x80000000 as defined before.
> +    # ImageBuillder sets the kernel and ramdisk range based on the file size.
> +    # It will use the memory range between 0x45600000 to 0x47AED1E8, so set
> +    # memory range between 0x50000000 and 0x80000000 as static heap.

I think this is OK. One suggestion to make things more reliable would be
to change MEMORY_END to be 0x50000000 so that you can be sure that
ImageBuilder won't go over the limit. You could do it just for this
test, which would be safer, but to be honest you could limit MEMORY_END
to 0x50000000 for all tests in qemu-smoke-dom0less-arm64.sh because it
shouldn't really cause any problems.


> +    echo  '
> +STATIC_HEAP="0x50000000 0x30000000"
> +# The size of static heap should be greater than the guest memory
> +DOMU_MEM[0]="128"' >> binaries/config
> +fi
> +
>  if [[ "${test_variant}" == "boot-cpupools" ]]; then
>      echo '
>  CPUPOOL[0]="cpu@1 null"
> -- 
> 2.25.1
> 

