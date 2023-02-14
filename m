Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1425F6971C3
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 00:23:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495625.765995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS4dd-0005hS-Mr; Tue, 14 Feb 2023 23:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495625.765995; Tue, 14 Feb 2023 23:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS4dd-0005fl-Jt; Tue, 14 Feb 2023 23:23:05 +0000
Received: by outflank-mailman (input) for mailman id 495625;
 Tue, 14 Feb 2023 23:23:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nHuR=6K=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pS4dc-0004UA-U0
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 23:23:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86c6f12c-acbe-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 00:23:03 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 04AFB6194D;
 Tue, 14 Feb 2023 23:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2104C433D2;
 Tue, 14 Feb 2023 23:23:00 +0000 (UTC)
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
X-Inumbo-ID: 86c6f12c-acbe-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676416981;
	bh=s6wk/3seb66+sZc+hM/vwsMrMJYnfsQI8s3Yjk4sFb8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kH1B8RF9MlXuJ4sokl9aI21q9OZYG+ZxzSQai4+cV80ZryVnUXswYYr3aHd+YJvQK
	 bjWvlvgbdcZaUHmi06YSy1c2CFCj2bcfxRjgNTKj68mIA9O0HwWJEjqx6vSHaM8DhW
	 zH/HRElqzxoViCIqNhokVzdTI2buzdCcq4kIPnaJkEvJpLwDlxNwgYb1BbYNqZH/p7
	 wolMVmaRHpZDZG3+55cprA/ctPTo2DeSus6JpEDZtKk6xUomOwdvEoCHbdU8LRWrOu
	 SC24kjfubBFr39c/knBZupOSbHrw9k/c2x18MSF+ESAMN4aQw7EaqVYBjdR9RqUA8i
	 FqVsHQrXb+a8g==
Date: Tue, 14 Feb 2023 15:22:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 5/5] automation: Add a true dom0less test on arm32
In-Reply-To: <20230214153842.15637-6-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2302141522280.2025117@ubuntu-linux-20-04-desktop>
References: <20230214153842.15637-1-michal.orzel@amd.com> <20230214153842.15637-6-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Feb 2023, Michal Orzel wrote:
> Add a new test job qemu-smoke-dom0less-arm32-gcc-without-dom0 in debug
> and non-debug variant that will execute qemu-smoke-dom0less-arm32.sh
> script to test dom0less domU boot without dom0 (i.e. true dom0less
> configuration).
> 
> By passing "without-dom0" as a test variant, the test will clear the
> dom0 prompt that we grep for as a last step and remove all the DOM0
> related options in ImageBuilder configuration.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
>  - new patch created as a result of deciding to keep dom0 by default. We still
>    need to test true dom0less configuration, hence added a new test.
> ---
>  automation/gitlab-ci/test.yaml                  | 16 ++++++++++++++++
>  automation/scripts/qemu-smoke-dom0less-arm32.sh | 13 +++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index be7a55d89708..c0b4a90e0d29 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -258,6 +258,22 @@ qemu-smoke-dom0less-arm32-gcc-debug-gzip:
>      - *arm32-test-needs
>      - debian-unstable-gcc-arm32-debug
>  
> +qemu-smoke-dom0less-arm32-gcc-without-dom0:
> +  extends: .qemu-arm32
> +  script:
> +    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh without-dom0 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *arm32-test-needs
> +    - debian-unstable-gcc-arm32
> +
> +qemu-smoke-dom0less-arm32-gcc-debug-without-dom0:
> +  extends: .qemu-arm32
> +  script:
> +    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh without-dom0 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *arm32-test-needs
> +    - debian-unstable-gcc-arm32-debug
> +
>  qemu-alpine-x86_64-gcc:
>    extends: .qemu-x86-64
>    script:
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> index c2e331451d99..cc91238f4222 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> @@ -42,6 +42,15 @@ echo \"${passed}\"
>  "
>  fi
>  
> +if [[ "${test_variant}" == "without-dom0" ]]; then
> +    # Clear dom0 prompt
> +    dom0_prompt=""
> +    passed="${test_variant} test passed"
> +    domU_check="
> +echo \"${passed}\"
> +"
> +fi
> +
>  # dom0/domU rootfs
>  # We are using the same rootfs for dom0 and domU. The only difference is
>  # that for the former, we set explictly rdinit to /bin/sh, whereas for the
> @@ -102,6 +111,10 @@ if [[ "${test_variant}" == "gzip" ]]; then
>      sed -i 's/DOMU_KERNEL\[0\]=.*/DOMU_KERNEL\[0\]="vmlinuz.gz"/' config
>  fi
>  
> +if [[ "${test_variant}" == "without-dom0" ]]; then
> +    sed -i '/^DOM0/d' config
> +fi
> +
>  rm -rf imagebuilder
>  git clone https://gitlab.com/ViryaOS/imagebuilder
>  bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
> -- 
> 2.25.1
> 

