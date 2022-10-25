Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3318960D797
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 01:00:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430243.681690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onStA-00075i-NF; Tue, 25 Oct 2022 22:59:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430243.681690; Tue, 25 Oct 2022 22:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onStA-00073i-KK; Tue, 25 Oct 2022 22:59:16 +0000
Received: by outflank-mailman (input) for mailman id 430243;
 Tue, 25 Oct 2022 22:59:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qfDD=22=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1onSt8-00073c-On
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 22:59:14 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4836d37-54b8-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 00:59:13 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5B931B81F83;
 Tue, 25 Oct 2022 22:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3DBC433D6;
 Tue, 25 Oct 2022 22:59:10 +0000 (UTC)
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
X-Inumbo-ID: a4836d37-54b8-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666738751;
	bh=9+KGN8zzncCSWU6QUT4wouOLxqWKGwJ/QsaEoWoIeic=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EwfbUR19cSYcW7isJiAfEScjG3rKAl18qLGhBTXTnYKL9J2/sPT/RfqF+tJb4cZ1C
	 b9qO4fIt4T8KjaDCPGLSoPDYPx5xpGezUsPp2Bkwx+CyHQluSblsVckZbPghe9+yDO
	 gjKOmBHr+IvzCGOD5HT0C1nn4CUfUDfQgIDUbu6sMuBAuDLa3eKbMRLLJenp1s7RK2
	 s5+R5slmapy7v4LHJqC60H3RBoK+j7QMHCEguEXzHToXGjmB7XeC69HO/9+SQE78M2
	 JNUF/eEjz4LB5t/bmmPwvLQ6BkSKxqiSgIPZ4N4cZLQa2dWlrZ1Ol61QOQuSRtwMfD
	 ThywQH8zYQQwg==
Date: Tue, 25 Oct 2022 15:59:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] automation: test.yaml: Introduce templates to reduce
 the overhead
In-Reply-To: <20221025095952.21980-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2210251547250.1397955@ubuntu-linux-20-04-desktop>
References: <20221025095952.21980-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Oct 2022, Michal Orzel wrote:
> At the moment, we define lots of test jobs in test.yaml, that make use
> of the same configuration sections like variables, tags, artifacts.
> Introduce templates (hidden jobs whose names start with a dot) to
> reduce the overhead and simplify the file (more than 100 lines saved).
> This way, the actual jobs can only specify sections that are unique
> to them.
> 
> Most of the test jobs specify the same set of prerequisite jobs under
> needs property with just one additional being unique to the job itself.
> Introduce YAML anchors for that purpose, because when using extends, the
> needs property is not being merged (the parent property overwrites the
> child one).
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
>  - carve out anchors from extend jobs and use better naming
> 
> This patch is based on the CI next branch where we already have several
> patches (already acked) to be merged into staging after the release:
> https://gitlab.com/xen-project/people/sstabellini/xen/-/tree/next
> ---
>  automation/gitlab-ci/test.yaml | 270 ++++++++++-----------------------
>  1 file changed, 83 insertions(+), 187 deletions(-)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 92e0a1f7c510..c7e0078e04f1 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -7,35 +7,32 @@
>      - /^coverity-tested\/.*/
>      - /^stable-.*/
>  
> -# Test jobs
> -build-each-commit-gcc:
> +.arm64-test-needs: &arm64-test-needs
> +  - alpine-3.12-arm64-rootfs-export
> +  - kernel-5.19-arm64-export
> +  - qemu-system-aarch64-6.0.0-arm64-export
> +
> +.arm32-test-needs: &arm32-test-needs
> +  - qemu-system-aarch64-6.0.0-arm32-export
> +
> +.qemu-arm64:
>    extends: .test-jobs-common
>    variables:
> -    CONTAINER: debian:stretch
> -    XEN_TARGET_ARCH: x86_64
> -    CC: gcc
> -  script:
> -    - BASE=${BASE_SHA:-${CI_COMMIT_BEFORE_SHA}} TIP=${TIP_SHA:-${CI_COMMIT_SHA}} ./automation/gitlab-ci/build-each-commit.sh 2>&1 | tee ../build-each-commit-gcc.log
> -    - mv ../build-each-commit-gcc.log .
> +    CONTAINER: debian:unstable-arm64v8
> +    LOGFILE: qemu-smoke-arm64.log
>    artifacts:
>      paths:
> +      - smoke.serial
>        - '*.log'
>      when: always
> -  needs: []
>    tags:
> -    - x86_64
> +    - arm64
>  
> -qemu-smoke-dom0-arm64-gcc:
> +.qemu-arm32:
>    extends: .test-jobs-common
>    variables:
>      CONTAINER: debian:unstable-arm64v8
> -  script:
> -    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
> -  needs:
> -    - alpine-3.12-gcc-arm64
> -    - alpine-3.12-arm64-rootfs-export
> -    - kernel-5.19-arm64-export
> -    - qemu-system-aarch64-6.0.0-arm64-export
> +    LOGFILE: qemu-smoke-arm32.log
>    artifacts:
>      paths:
>        - smoke.serial
> @@ -44,251 +41,150 @@ qemu-smoke-dom0-arm64-gcc:
>    tags:
>      - arm64
>  
> -qemu-smoke-dom0-arm64-gcc-debug:
> +.qemu-x86-64:
>    extends: .test-jobs-common
>    variables:
> -    CONTAINER: debian:unstable-arm64v8
> -  script:
> -    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
> -  needs:
> -    - alpine-3.12-gcc-debug-arm64
> -    - alpine-3.12-arm64-rootfs-export
> -    - kernel-5.19-arm64-export
> -    - qemu-system-aarch64-6.0.0-arm64-export
> +    CONTAINER: debian:stretch
> +    LOGFILE: qemu-smoke-x86-64.log
>    artifacts:
>      paths:
>        - smoke.serial
>        - '*.log'
>      when: always
>    tags:
> -    - arm64
> +    - x86_64
>  
> -qemu-alpine-x86_64-gcc:
> +# Test jobs
> +build-each-commit-gcc:
>    extends: .test-jobs-common
>    variables:
>      CONTAINER: debian:stretch
> +    XEN_TARGET_ARCH: x86_64
> +    CC: gcc
>    script:
> -    - ./automation/scripts/qemu-alpine-x86_64.sh 2>&1 | tee qemu-smoke-x86_64.log
> -  needs:
> -    - alpine-3.12-gcc
> -    - alpine-3.12-rootfs-export
> -    - kernel-5.10.74-export
> +    - BASE=${BASE_SHA:-${CI_COMMIT_BEFORE_SHA}} TIP=${TIP_SHA:-${CI_COMMIT_SHA}} ./automation/gitlab-ci/build-each-commit.sh 2>&1 | tee ../build-each-commit-gcc.log
> +    - mv ../build-each-commit-gcc.log .
>    artifacts:
>      paths:
> -      - smoke.serial
>        - '*.log'
>      when: always
> +  needs: []
>    tags:
>      - x86_64
>  
> +qemu-smoke-dom0-arm64-gcc:
> +  extends: .qemu-arm64
> +  script:
> +    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *arm64-test-needs
> +    - alpine-3.12-gcc-arm64
> +
> +qemu-smoke-dom0-arm64-gcc-debug:
> +  extends: .qemu-arm64
> +  script:
> +    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *arm64-test-needs
> +    - alpine-3.12-gcc-debug-arm64
> +
>  qemu-smoke-dom0less-arm64-gcc:
> -  extends: .test-jobs-common
> -  variables:
> -    CONTAINER: debian:unstable-arm64v8
> +  extends: .qemu-arm64
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
> +    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
>    needs:
> +    - *arm64-test-needs
>      - alpine-3.12-gcc-arm64
> -    - alpine-3.12-arm64-rootfs-export
> -    - kernel-5.19-arm64-export
> -    - qemu-system-aarch64-6.0.0-arm64-export
> -  artifacts:
> -    paths:
> -      - smoke.serial
> -      - '*.log'
> -    when: always
> -  tags:
> -    - arm64
>  
>  qemu-smoke-dom0less-arm64-gcc-debug:
> -  extends: .test-jobs-common
> -  variables:
> -    CONTAINER: debian:unstable-arm64v8
> +  extends: .qemu-arm64
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
> +    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
>    needs:
> +    - *arm64-test-needs
>      - alpine-3.12-gcc-debug-arm64
> -    - alpine-3.12-arm64-rootfs-export
> -    - kernel-5.19-arm64-export
> -    - qemu-system-aarch64-6.0.0-arm64-export
> -  artifacts:
> -    paths:
> -      - smoke.serial
> -      - '*.log'
> -    when: always
> -  tags:
> -    - arm64
>  
>  qemu-smoke-dom0less-arm64-gcc-staticmem:
> -  extends: .test-jobs-common
> -  variables:
> -    CONTAINER: debian:unstable-arm64v8
> +  extends: .qemu-arm64
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
> +    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-mem 2>&1 | tee ${LOGFILE}
>    needs:
> +    - *arm64-test-needs
>      - alpine-3.12-gcc-arm64-staticmem
> -    - alpine-3.12-arm64-rootfs-export
> -    - kernel-5.19-arm64-export
> -    - qemu-system-aarch64-6.0.0-arm64-export
> -  artifacts:
> -    paths:
> -      - smoke.serial
> -      - '*.log'
> -    when: always
> -  tags:
> -    - arm64
>  
>  qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
> -  extends: .test-jobs-common
> -  variables:
> -    CONTAINER: debian:unstable-arm64v8
> +  extends: .qemu-arm64
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
> +    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-mem 2>&1 | tee ${LOGFILE}
>    needs:
> +    - *arm64-test-needs
>      - alpine-3.12-gcc-debug-arm64-staticmem
> -    - alpine-3.12-arm64-rootfs-export
> -    - kernel-5.19-arm64-export
> -    - qemu-system-aarch64-6.0.0-arm64-export
> -  artifacts:
> -    paths:
> -      - smoke.serial
> -      - '*.log'
> -    when: always
> -  tags:
> -    - arm64
>  
>  qemu-smoke-dom0less-arm64-gcc-boot-cpupools:
> -  extends: .test-jobs-common
> -  variables:
> -    CONTAINER: debian:unstable-arm64v8
> +  extends: .qemu-arm64
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh boot-cpupools 2>&1 | tee qemu-smoke-arm64.log
> +    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh boot-cpupools 2>&1 | tee ${LOGFILE}
>    needs:
> +    - *arm64-test-needs
>      - alpine-3.12-gcc-arm64-boot-cpupools
> -    - alpine-3.12-arm64-rootfs-export
> -    - kernel-5.19-arm64-export
> -    - qemu-system-aarch64-6.0.0-arm64-export
> -  artifacts:
> -    paths:
> -      - smoke.serial
> -      - '*.log'
> -    when: always
> -  tags:
> -    - arm64
>  
>  qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
> -  extends: .test-jobs-common
> -  variables:
> -    CONTAINER: debian:unstable-arm64v8
> +  extends: .qemu-arm64
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh boot-cpupools 2>&1 | tee qemu-smoke-arm64.log
> +    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh boot-cpupools 2>&1 | tee ${LOGFILE}
>    needs:
> +    - *arm64-test-needs
>      - alpine-3.12-gcc-debug-arm64-boot-cpupools
> -    - alpine-3.12-arm64-rootfs-export
> -    - kernel-5.19-arm64-export
> -    - qemu-system-aarch64-6.0.0-arm64-export
> -  artifacts:
> -    paths:
> -      - smoke.serial
> -      - '*.log'
> -    when: always
> -  tags:
> -    - arm64
>  
>  qemu-smoke-dom0-arm32-gcc:
> -  extends: .test-jobs-common
> -  variables:
> -    CONTAINER: debian:unstable-arm64v8
> +  extends: .qemu-arm32
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
> +    - ./automation/scripts/qemu-smoke-dom0-arm32.sh 2>&1 | tee ${LOGFILE}
>    needs:
> +    - *arm32-test-needs
>      - debian-unstable-gcc-arm32
> -    - qemu-system-aarch64-6.0.0-arm32-export
> -  artifacts:
> -    paths:
> -      - smoke.serial
> -      - '*.log'
> -    when: always
> -  tags:
> -    - arm64
>  
>  qemu-smoke-dom0-arm32-gcc-debug:
> -  extends: .test-jobs-common
> -  variables:
> -    CONTAINER: debian:unstable-arm64v8
> +  extends: .qemu-arm32
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
> +    - ./automation/scripts/qemu-smoke-dom0-arm32.sh 2>&1 | tee ${LOGFILE}
>    needs:
> +    - *arm32-test-needs
>      - debian-unstable-gcc-arm32-debug
> -    - qemu-system-aarch64-6.0.0-arm32-export
> -  artifacts:
> -    paths:
> -      - smoke.serial
> -      - '*.log'
> -    when: always
> -  tags:
> -    - arm64
> +
> +qemu-alpine-x86_64-gcc:
> +  extends: .qemu-x86-64
> +  script:
> +    - ./automation/scripts/qemu-alpine-x86_64.sh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - alpine-3.12-gcc
> +    - alpine-3.12-rootfs-export
> +    - kernel-5.10.74-export
>  
>  qemu-smoke-x86-64-gcc:
> -  extends: .test-jobs-common
> -  variables:
> -    CONTAINER: debian:stretch
> +  extends: .qemu-x86-64
>    script:
> -    - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee qemu-smoke-x86-64.log
> -  artifacts:
> -    paths:
> -      - smoke.serial
> -      - '*.log'
> -    when: always
> +    - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee ${LOGFILE}
>    needs:
>      - debian-stretch-gcc-debug
> -  tags:
> -    - x86_64
>  
>  qemu-smoke-x86-64-clang:
> -  extends: .test-jobs-common
> -  variables:
> -    CONTAINER: debian:stretch
> +  extends: .qemu-x86-64
>    script:
> -    - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee qemu-smoke-x86-64.log
> -  artifacts:
> -    paths:
> -      - smoke.serial
> -      - '*.log'
> -    when: always
> +    - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee ${LOGFILE}
>    needs:
>      - debian-unstable-clang-debug
> -  tags:
> -    - x86_64
>  
>  qemu-smoke-x86-64-gcc-pvh:
> -  extends: .test-jobs-common
> -  variables:
> -    CONTAINER: debian:stretch
> +  extends: .qemu-x86-64
>    script:
> -    - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee qemu-smoke-x86-64.log
> -  artifacts:
> -    paths:
> -      - smoke.serial
> -      - '*.log'
> -    when: always
> +    - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFILE}
>    needs:
>      - debian-stretch-gcc-debug
> -  tags:
> -    - x86_64
>  
>  qemu-smoke-x86-64-clang-pvh:
> -  extends: .test-jobs-common
> -  variables:
> -    CONTAINER: debian:stretch
> +  extends: .qemu-x86-64
>    script:
> -    - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee qemu-smoke-x86-64.log
> -  artifacts:
> -    paths:
> -      - smoke.serial
> -      - '*.log'
> -    when: always
> +    - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFILE}
>    needs:
>      - debian-unstable-clang-debug
> -  tags:
> -    - x86_64
> -- 
> 2.25.1
> 

