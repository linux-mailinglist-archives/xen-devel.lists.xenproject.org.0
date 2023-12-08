Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1E08098B2
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 02:43:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650316.1015746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBPtL-0003M4-3O; Fri, 08 Dec 2023 01:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650316.1015746; Fri, 08 Dec 2023 01:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBPtK-0003Jw-W5; Fri, 08 Dec 2023 01:42:58 +0000
Received: by outflank-mailman (input) for mailman id 650316;
 Fri, 08 Dec 2023 01:42:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBPtJ-0003Jm-Cb
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 01:42:57 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1afbdd35-956b-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 02:42:56 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5B5B2CE25D7;
 Fri,  8 Dec 2023 01:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A3AC433C9;
 Fri,  8 Dec 2023 01:42:49 +0000 (UTC)
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
X-Inumbo-ID: 1afbdd35-956b-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701999770;
	bh=lzPDqEfWco1SI3FujK3rSfQ7ZlhLtamE/+1S1PtStDk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CANGD9GrrODsYg+dSuVnQZD3hjQJoPEW60BzGV8TWQ4PYyUoGPSzBCWqdMM2dOROp
	 BIzcii6wbovF6DvJverfw3mKcOszymRwxBRFzcBUYRMec7CeLf9+FYZTLBiFFm/7a1
	 VOReKnjafXYIjhA6i2XWSI7W9PlybWHuvtgUc0CfAOixkGVp9asN96UdMTGMq/x6TR
	 QFJ9d/TTOI/aUbIbGEwm3qIe2mY1kUpscV8YObR00enI9sqwWu5etTpK20UbcpHWc3
	 qRPmH3E86O8mBsXb4n7mciZyt2Gyl5vfGXuEES8sGj4ZxDeXFj/VOP1FUPgwP5b0KJ
	 Ymr4y6c9zTTFQ==
Date: Thu, 7 Dec 2023 17:42:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>
Subject: Re: [PATCH 5/5] automation: Add the arm64 FVP build and Dom0 smoke
 test jobs
In-Reply-To: <20231207135318.1912846-6-Henry.Wang@arm.com>
Message-ID: <alpine.DEB.2.22.394.2312071741410.1265976@ubuntu-linux-20-04-desktop>
References: <20231207135318.1912846-1-Henry.Wang@arm.com> <20231207135318.1912846-6-Henry.Wang@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Dec 2023, Henry Wang wrote:
> Add a job in the build stage to export the TF-A, U-Boot and the
> device tree for the FVP platform from the test artifact container.
> 
> Add a FVP smoke test job in the test stage to do the same test as
> the `qemu-smoke-dom0-arm64-gcc` job.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Although it does not affect the functionality, I am still quite
> confused about why the logs displayed by GitLab UI, for
> example [1], is much less than the actual output (saved in the
> artifacts, see [2]). Had a discussion with Michal on Matrix
> and we agree that the log in gitlab UI is usually capped.
> 
> [1] https://gitlab.com/xen-project/people/henryw/xen/-/jobs/5700569676
> [2] https://gitlab.com/xen-project/people/henryw/xen/-/jobs/5700569676/artifacts/file/smoke.serial
> ---
>  automation/gitlab-ci/build.yaml | 17 +++++++++++++++++
>  automation/gitlab-ci/test.yaml  | 22 ++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 32af30cced..89d2f01302 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -344,6 +344,23 @@ kernel-6.1.19-export:
>    tags:
>      - x86_64
>  
> +armfvp-uboot-tfa-2023.10-2.9.0-arm64-export:
> +  extends: .test-jobs-artifact-common
> +  image: registry.gitlab.com/xen-project/xen/tests-artifacts/armfvp-uboot-tfa:2023.10-2.9.0-arm64v8
> +  script:
> +    - |
> +       mkdir binaries && \
> +       cp /bl1.bin binaries/bl1.bin && \
> +       cp /fip.bin binaries/fip.bin && \
> +       cp /fvp-base-gicv3-psci-1t.dtb binaries/fvp-base-gicv3-psci-1t.dtb
> +  artifacts:
> +    paths:
> +      - binaries/bl1.bin
> +      - binaries/fip.bin
> +      - binaries/fvp-base-gicv3-psci-1t.dtb
> +  tags:
> +    - arm64
> +
>  # Jobs below this line
>  
>  # Build jobs needed for tests
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 6aabdb9d15..47e00d0a0b 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -96,6 +96,19 @@
>    tags:
>      - xilinx
>  
> +.fvp-arm64:
> +  extends: .test-jobs-common
> +  variables:
> +    CONTAINER: debian:bookworm-arm64v8-fvp
> +    LOGFILE: fvp-smoke-arm64.log
> +  artifacts:
> +    paths:
> +      - smoke.serial
> +      - '*.log'
> +    when: always
> +  tags:
> +    - arm64
> +
>  .adl-x86-64:
>    extends: .test-jobs-common
>    variables:
> @@ -459,3 +472,12 @@ qemu-smoke-ppc64le-powernv9-gcc:
>    needs:
>      - qemu-system-ppc64-8.1.0-ppc64-export
>      - debian-bullseye-gcc-ppc64le-debug
> +
> +fvp-smoke-dom0-arm64-gcc-debug:
> +  extends: .fvp-arm64
> +  script:
> +    - ./automation/scripts/fvp-base-smoke-dom0-arm64.sh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *arm64-test-needs
> +    - armfvp-uboot-tfa-2023.10-2.9.0-arm64-export
> +    - alpine-3.18-gcc-debug-arm64
> -- 
> 2.25.1
> 

