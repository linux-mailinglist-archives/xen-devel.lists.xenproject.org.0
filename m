Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491C26080E4
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 23:42:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428003.677709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olzmX-0002XS-KY; Fri, 21 Oct 2022 21:42:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428003.677709; Fri, 21 Oct 2022 21:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olzmX-0002UI-GS; Fri, 21 Oct 2022 21:42:21 +0000
Received: by outflank-mailman (input) for mailman id 428003;
 Fri, 21 Oct 2022 21:42:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QljK=2W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1olzmW-0002UC-AM
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 21:42:20 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3be3d2d0-5189-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 23:42:17 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D5172B80D41;
 Fri, 21 Oct 2022 21:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B12EC433C1;
 Fri, 21 Oct 2022 21:42:15 +0000 (UTC)
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
X-Inumbo-ID: 3be3d2d0-5189-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666388536;
	bh=VDT5xpjT8drmZJ4No67YEEeavjHtQyhNdIGj00yOoOg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EvU+R5fVEhflETGpyw3PqyJOye73pk4cqaLIYYt5MHGjCOZpnx7bMoDY9snounZnr
	 2PnLDoKCJ70YlQ8V2ZPP92BBIDQbi67fqwk1qxplRfuvGGYOOWrqoPmdA98mbAeJbZ
	 YNZ1Y3E4TT+BkBYe965oD4ztiJ8Tad+ma5RdW38nmypUzz1Empgv23+HvOkIrgpfjk
	 7ePf3US3eu9hZYkPtkNkyM94uOFyHDO/nH4wXeZbrlb9nU5OjqIMHIJOtOgEPRW1yv
	 8Rtsz/f3FzjHtIUUl+EVQ1qKHILcZsKHxkdJNTXp+pvJ7ppBYmqBnlnBKvvCE2sGNO
	 vvijhvBFTrrLQ==
Date: Fri, 21 Oct 2022 14:42:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation: test.yaml: Introduce templates to reduce
 the overhead
In-Reply-To: <20221019164246.5487-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2210211423560.3873@ubuntu-linux-20-04-desktop>
References: <20221019164246.5487-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Oct 2022, Michal Orzel wrote:
> At the moment, we define lots of test jobs in test.yaml, that make use
> of the same configuration sections like variables, tags, artifacts.
> Introduce templates (hidden jobs whose names start with a dot) to
> reduce the overhead and simplify the file (more than 100 lines saved).
> This way, the actual jobs can only specify sections that are unique
> to them.
> 
> Most of the test jobs specify the same set of prerequisite jobs under needs
> property with just one additional being unique to the job itself. Introduce
> YAML anchors for that purpose, because when using extends, the needs property
> is not being merged (the parent property overwrites the child one).

I like the patch. Replying here on top because the diff below is not
very helpful.

When you say that "extends" overwrites the properties, do you mean that
"needs" in qemu-smoke-dom0-arm64-gcc overwrites "needs" in .qemu-arm64,
when qemu-smoke-dom0-arm64-gcc includes .qemu-arm64?


If there is no way to solve the overwrite problem then it is OK to use
YAML achors but is it possible to define the anchors outside of
.qemu-arm64/.qemu-arm32 ? It would make things a lot clearer in the
code. Maybe under a top level "definitions" key? The point is that
.qemu-arm64 and .qemu-arm32 should use the anchor rather than define the
anchor.

I wouldn't call it qemu-arm64-needs because it has things
like alpine-3.12-arm64-rootfs-export and kernel-5.19-arm64-export that
are not required by qemu-system-aarch64-6.0.0-arm64-export. If anything
qemu-system-aarch64-6.0.0-arm64-export needs CONTAINER:
debian:unstable-arm64v8.

So I would call the anchor something like "arm64-test-needs". Same
comment for the arm32 anchor.


> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> This patch is based on the CI next branch where we already have several
> patches (already acked) to be merged into staging after the release:
> https://gitlab.com/xen-project/people/sstabellini/xen/-/tree/next
> 
> Tested pipeline:
> https://gitlab.com/xen-project/people/morzel/xen-orzelmichal/-/pipelines/671114820
> ---
>  automation/gitlab-ci/test.yaml | 266 ++++++++++-----------------------
>  1 file changed, 80 insertions(+), 186 deletions(-)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 92e0a1f7c510..fc0884b12082 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -7,32 +7,12 @@
>      - /^coverity-tested\/.*/
>      - /^stable-.*/
>  
> -# Test jobs
> -build-each-commit-gcc:
> -  extends: .test-jobs-common
> -  variables:
> -    CONTAINER: debian:stretch
> -    XEN_TARGET_ARCH: x86_64
> -    CC: gcc
> -  script:
> -    - BASE=${BASE_SHA:-${CI_COMMIT_BEFORE_SHA}} TIP=${TIP_SHA:-${CI_COMMIT_SHA}} ./automation/gitlab-ci/build-each-commit.sh 2>&1 | tee ../build-each-commit-gcc.log
> -    - mv ../build-each-commit-gcc.log .
> -  artifacts:
> -    paths:
> -      - '*.log'
> -    when: always
> -  needs: []
> -  tags:
> -    - x86_64
> -
> -qemu-smoke-dom0-arm64-gcc:
> +.qemu-arm64:
>    extends: .test-jobs-common
>    variables:
>      CONTAINER: debian:unstable-arm64v8
> -  script:
> -    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
> -  needs:
> -    - alpine-3.12-gcc-arm64
> +    LOGFILE: qemu-smoke-arm64.log
> +  needs: &qemu-arm64-needs
>      - alpine-3.12-arm64-rootfs-export
>      - kernel-5.19-arm64-export
>      - qemu-system-aarch64-6.0.0-arm64-export

LOGFILE should be listed among the artifacts (and maybe we can remove
*.log if it has become redundant?)


> @@ -44,17 +24,13 @@ qemu-smoke-dom0-arm64-gcc:
>    tags:
>      - arm64
>  
> -qemu-smoke-dom0-arm64-gcc-debug:
> +.qemu-arm32:
>    extends: .test-jobs-common
>    variables:
>      CONTAINER: debian:unstable-arm64v8
> -  script:
> -    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
> -  needs:
> -    - alpine-3.12-gcc-debug-arm64
> -    - alpine-3.12-arm64-rootfs-export
> -    - kernel-5.19-arm64-export
> -    - qemu-system-aarch64-6.0.0-arm64-export
> +    LOGFILE: qemu-smoke-arm32.log
> +  needs: &qemu-arm32-needs
> +    - qemu-system-aarch64-6.0.0-arm32-export
>    artifacts:
>      paths:
>        - smoke.serial
> @@ -63,16 +39,11 @@ qemu-smoke-dom0-arm64-gcc-debug:
>    tags:
>      - arm64
>  
> -qemu-alpine-x86_64-gcc:
> +.qemu-x86-64:
>    extends: .test-jobs-common
>    variables:
>      CONTAINER: debian:stretch
> -  script:
> -    - ./automation/scripts/qemu-alpine-x86_64.sh 2>&1 | tee qemu-smoke-x86_64.log
> -  needs:
> -    - alpine-3.12-gcc
> -    - alpine-3.12-rootfs-export
> -    - kernel-5.10.74-export
> +    LOGFILE: qemu-smoke-x86-64.log
>    artifacts:
>      paths:
>        - smoke.serial
> @@ -81,214 +52,137 @@ qemu-alpine-x86_64-gcc:
>    tags:
>      - x86_64
>  
> -qemu-smoke-dom0less-arm64-gcc:
> +# Test jobs
> +build-each-commit-gcc:
>    extends: .test-jobs-common
>    variables:
> -    CONTAINER: debian:unstable-arm64v8
> +    CONTAINER: debian:stretch
> +    XEN_TARGET_ARCH: x86_64
> +    CC: gcc
>    script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
> -  needs:
> -    - alpine-3.12-gcc-arm64
> -    - alpine-3.12-arm64-rootfs-export
> -    - kernel-5.19-arm64-export
> -    - qemu-system-aarch64-6.0.0-arm64-export
> +    - BASE=${BASE_SHA:-${CI_COMMIT_BEFORE_SHA}} TIP=${TIP_SHA:-${CI_COMMIT_SHA}} ./automation/gitlab-ci/build-each-commit.sh 2>&1 | tee ../build-each-commit-gcc.log
> +    - mv ../build-each-commit-gcc.log .
>    artifacts:
>      paths:
> -      - smoke.serial
>        - '*.log'
>      when: always
> +  needs: []
>    tags:
> -    - arm64
> +    - x86_64
> +
> +qemu-smoke-dom0-arm64-gcc:
> +  extends: .qemu-arm64
> +  script:
> +    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *qemu-arm64-needs
> +    - alpine-3.12-gcc-arm64
> +
> +qemu-smoke-dom0-arm64-gcc-debug:
> +  extends: .qemu-arm64
> +  script:
> +    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *qemu-arm64-needs
> +    - alpine-3.12-gcc-debug-arm64
> +
> +qemu-smoke-dom0less-arm64-gcc:
> +  extends: .qemu-arm64
> +  script:
> +    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *qemu-arm64-needs
> +    - alpine-3.12-gcc-arm64
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
> +    - *qemu-arm64-needs
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
> +    - *qemu-arm64-needs
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
> +    - *qemu-arm64-needs
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
> +    - *qemu-arm64-needs
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
> +    - *qemu-arm64-needs
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
> +    - *qemu-arm32-needs
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
> +    - *qemu-arm32-needs
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

