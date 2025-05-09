Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D44E7AB1F6A
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 23:52:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980401.1366863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDVdg-0004o1-9h; Fri, 09 May 2025 21:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980401.1366863; Fri, 09 May 2025 21:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDVdg-0004lF-70; Fri, 09 May 2025 21:52:16 +0000
Received: by outflank-mailman (input) for mailman id 980401;
 Fri, 09 May 2025 21:52:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/D4s=XZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uDVdf-0004A0-DH
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 21:52:15 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dde6cb1b-2d1f-11f0-9eb5-5ba50f476ded;
 Fri, 09 May 2025 23:52:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 262CC61120;
 Fri,  9 May 2025 21:52:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37DDCC4CEE4;
 Fri,  9 May 2025 21:52:12 +0000 (UTC)
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
X-Inumbo-ID: dde6cb1b-2d1f-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746827532;
	bh=4cDagZ6co7gf9XQXmHVQAuwDyhBCdZTU2fVWqGbBjVU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=shKQJaPpCpIYt5tN+oFsdnsr4mZliX7iwkSgEEcO27UFYVfutwkOL04pjQTpczykG
	 omZAstfpcBQpqsesHARupPvZEcv8lwpllUL9lU1jPuKpdgDNn9Gp+kmYwgpGEP9+Xn
	 SlObGPzcEUmBEIJ1ew3GUVWfBXRh7yLOAiTAg6jFEtw/p5aiViTIu6VLgaOsxq/kNV
	 1ZFvnDsv3RuEpQwM3OebDPc1eNSEOWfIBkwbi6gB7VW14gDyp6OZYK2tH9Akvwn7HA
	 YyLCv4J29+7kyWO24lA/p+VRGTNK/8xE5hbHpu6SkNeOMpX4DhuWHWKom5fAiDiRzQ
	 nzSkRJ2kx9PMw==
Date: Fri, 9 May 2025 14:52:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH v3 2/2] ci: enable fuzzing for arm64
In-Reply-To: <20250507095338.735228-3-volodymyr_babchuk@epam.com>
Message-ID: <alpine.DEB.2.22.394.2505091445030.3879245@ubuntu-linux-20-04-desktop>
References: <20250507095338.735228-1-volodymyr_babchuk@epam.com> <20250507095338.735228-3-volodymyr_babchuk@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 May 2025, Volodymyr Babchuk wrote:
> Add new alpine-based build that enables LibAFL-based fuzzer.
> 
> Use this new build to run two fuzzing sessions: hypercall fuzzing and
> gicv2 fuzzing. Currently, this is all the fuzzing modes supported by
> xen fuzzer. Every fuzzing session will run approximately 10 minutes.
> 
> Fuzzing session will provide fuzzer log and any crash input data as
> artifacts. This crash data can be used later to replay the input to
> reproduce the crash.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> 
> This patch is demonstration on how xen fuzzer can be integrated in
> CI. With this setup, it can serve as smoke test, because 10 minute
> fuzzing session is not enough. While there is no strict rule on now
> long fuzzing session should run, most widely accepted time is 24
> hours. This will require additional rules (weekly tests?) and separate
> runners (probably).

Thank you, this is great as a smoke test. It serves as documentation on
how to run this too.

Yes, it could be a weekly test in the weekend or even better simply
manually triggered.

We need to investigate what is the longest time we can run this without
break Gitlab.


> Right now this patch uses docker container build by me that is hosted
> on docker hub. Of course, in the final version, this container should
> hosted together with other Xen CI containers.

Yes, agreed


> Also, that container is built based on xen-fuzzer-rs project that is
> also hosted on Xen-Troops GitHub repo, along with custom XTF
> fork. These components also should be moved to gitlab/xen.

Agreed as well


> ---
>  automation/gitlab-ci/build.yaml | 11 +++++++++++
>  automation/gitlab-ci/test.yaml  | 34 +++++++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index ab5211f77e..6fc11fffe6 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -407,12 +407,23 @@ alpine-3.18-gcc-arm64:
>      CONTAINER: alpine:3.18-arm64v8
>  
>  alpine-3.18-gcc-debug-arm64:
> +  extends: .gcc-arm64-build-debug
> +  variables:
> +    CONTAINER: alpine:3.18-arm64v8
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_UBSAN=y
> +      CONFIG_UBSAN_FATAL=

The diff is strange and I might be wrong, but it looks like this should
be CONFIG_UBSAN_FATAL=y


> +alpine-3.18-gcc-fuzzing-arm64:
>    extends: .gcc-arm64-build-debug
>    variables:
>      CONTAINER: alpine:3.18-arm64v8
>      EXTRA_XEN_CONFIG: |
>        CONFIG_UBSAN=y
>        CONFIG_UBSAN_FATAL=y
> +      CONFIG_FUZZING=y
> +      CONFIG_FUZZER_LIBAFL_QEMU=y
> +      CONFIG_FUZZER_PASS_BLOCKING=y
>  
>  alpine-3.18-gcc-arm64-randconfig:
>    extends: .gcc-arm64-build
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index a603d4039a..bb8670026f 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -197,6 +197,30 @@
>    tags:
>      - qubes-hw11
>  
> +.fuzzer-arm:
> +  stage: test
> +  image: xentroops/xen-fuzzer:v1
> +  variables:
> +    HARNESS: hypercall
> +    FUZZING_TIME: 600
> +  rules:
> +  - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> +  - if: $SELECTED_JOBS_ONLY
> +    when: never
> +  - when: on_success
> +  script:
> +    - cd /root/
> +    - ./xen_fuzzer -t ${FUZZING_TIME} run ${CI_PROJECT_DIR}/binaries/xen test-mmu64le-arm-${HARNESS}-fuzzer 2>&1 | tee ${CI_PROJECT_DIR}/fuzzer-${HARNESS}.log

Can you run it from outside the directory, like this?

/root/xen_fuzzer -t ...


> +  after_script:
> +    - cd ${CI_PROJECT_DIR}
> +    - mv /root/crashes .

Also here you could probably do:

mv /root/crashes ${CI_PROJECT_DIR}


> +  artifacts:
> +    paths:
> +      - fuzzer-${HARNESS}.log
> +      - crashes/
> +  needs:
> +    - alpine-3.18-gcc-fuzzing-arm64
> +
>  # Test jobs
>  build-each-commit-gcc:
>    extends: .test-jobs-common
> @@ -704,3 +728,13 @@ qemu-smoke-ppc64le-powernv9-gcc:
>      - ./automation/scripts/qemu-smoke-ppc64le.sh powernv9 2>&1 | tee ${LOGFILE}
>    needs:
>      - debian-12-ppc64le-gcc-debug
> +
> +arm-hypercall-fuzzer:
> +  extends: .fuzzer-arm
> +  variables:
> +    HARNESS: hypercall
> +
> +arm-vgic-fuzzer:
> +  extends: .fuzzer-arm
> +  variables:
> +    HARNESS: vgic
> -- 
> 2.48.1
> 

