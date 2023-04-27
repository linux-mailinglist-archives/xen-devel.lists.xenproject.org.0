Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E210A6F0DDE
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 23:59:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527098.819343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps9eE-0004VG-97; Thu, 27 Apr 2023 21:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527098.819343; Thu, 27 Apr 2023 21:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps9eE-0004Sl-5O; Thu, 27 Apr 2023 21:59:30 +0000
Received: by outflank-mailman (input) for mailman id 527098;
 Thu, 27 Apr 2023 21:59:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JUcw=AS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ps9eD-0004SQ-7g
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 21:59:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6477c31-e546-11ed-8611-37d641c3527e;
 Thu, 27 Apr 2023 23:59:26 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 43E8D63FB5;
 Thu, 27 Apr 2023 21:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9FEC433D2;
 Thu, 27 Apr 2023 21:59:23 +0000 (UTC)
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
X-Inumbo-ID: c6477c31-e546-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682632764;
	bh=BUoSp+weCqvNgrY37BhxpEFM0kusq/eUBbrdMNJcRr0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nKJrybTSQiBriNRuUnAqCrYfAavb4RRqDgDnJP+8wUPS1I1Ah8oM42hQ7MNqKNiR8
	 AYqxkGSi4/E7ZOVRWhpUCUSykTv7xSsZWdxQ2RsBXURPRhOtRDbaiQZ64w3Qa2cfLT
	 vo7v9QaQtDzUw/6UKcg5jTGHL7ktDZiJWkdvlOGZf8HkuYRZwAGocKetpIC9lkBUah
	 Kcq3/aajkpRalS09RNpYCHDHPRKZDkrXXmcdfJ7RYwQxez0MJX4+q2eAWdVt5kdEXz
	 /sseWLO9POMsM/LvlzrLe6z1xk5eoA1D/fBrAbVc6xmdeykDGl3RSxcsc6Y39daBuU
	 /vXeOy2wrrzHA==
Date: Thu, 27 Apr 2023 14:59:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] automation: xilinx: Add GEM passthrough test
In-Reply-To: <20230427120553.18088-3-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2304271459140.3419@ubuntu-linux-20-04-desktop>
References: <20230427120553.18088-1-michal.orzel@amd.com> <20230427120553.18088-3-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Apr 2023, Michal Orzel wrote:
> Being able to access a real board with real resources gives a great
> opportunity to finally test passthroughing devices to guests. Therefore,
> create a new Xilinx job to test GEM (Gigabit Ethernet MAC) controller
> passthrough to a dom0less domU.
> 
> By passing "gem-passthrough" as a test variant, the test will instruct
> the ImageBuilder to use "eth0.dtb" (passthrough dtb stored under tftp
> server root) as a guest dtb and to add "xen,passthrough" dtb property to
> "/amba/ethernet@ff0e0000" node. The guest itself will try to bringup
> the network interface, obtain dynamically IP address and ping the default
> gateway.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Example job:
> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/4189922473
> ---
>  automation/gitlab-ci/test.yaml                |  8 ++++++
>  .../scripts/xilinx-smoke-dom0less-arm64.sh    | 25 +++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index d68c584269dd..3409d704a7eb 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -131,6 +131,14 @@ xilinx-smoke-dom0less-arm64-gcc:
>      - *arm64-test-needs
>      - alpine-3.12-gcc-arm64
>  
> +xilinx-smoke-dom0less-arm64-gcc-gem-passthrough:
> +  extends: .xilinx-arm64
> +  script:
> +    - ./automation/scripts/xilinx-smoke-dom0less-arm64.sh gem-passthrough 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *arm64-test-needs
> +    - alpine-3.12-gcc-arm64
> +
>  adl-smoke-x86-64-gcc-debug:
>    extends: .adl-x86-64
>    script:
> diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> index 73ba251f4cc1..075305241c8d 100755
> --- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> @@ -22,6 +22,22 @@ echo \"${passed}\"
>  "
>  fi
>  
> +if [[ "${test_variant}" == "gem-passthrough" ]]; then
> +    passed="${test_variant} test passed"
> +
> +    # For a passthroughed GEM:
> +    # - bring up the network interface
> +    # - dynamically assign IP
> +    # - ping the default gateway
> +    domU_check="
> +set -ex
> +ifconfig eth0 up
> +udhcpc -i eth0 -n
> +ping -c 10 \$(ip route | awk '/^default/ {print \$3}')
> +echo \"${passed}\"
> +"
> +fi
> +
>  # DomU
>  mkdir -p rootfs
>  cd rootfs
> @@ -96,6 +112,15 @@ cp -f binaries/domU-rootfs.cpio.gz $TFTP/
>  # export dtb to artifacts
>  cp $TFTP/mpsoc_smmu.dtb .
>  
> +if [[ "${test_variant}" == "gem-passthrough" ]]; then
> +    echo "
> +    DOMU_PASSTHROUGH_DTB[0]=\"eth0.dtb\"
> +    DOMU_PASSTHROUGH_PATHS[0]=\"/amba/ethernet@ff0e0000\"" >> $TFTP/config
> +
> +    # export passthrough dtb to artifacts
> +    cp $TFTP/eth0.dtb .
> +fi
> +
>  rm -rf imagebuilder
>  git clone https://gitlab.com/ViryaOS/imagebuilder
>  bash imagebuilder/scripts/uboot-script-gen -t tftp -d $TFTP/ -c $TFTP/config
> -- 
> 2.25.1
> 

