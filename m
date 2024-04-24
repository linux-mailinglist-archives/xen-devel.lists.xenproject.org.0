Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEDA8B170F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 01:29:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711703.1111876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzm2W-0007Pr-8N; Wed, 24 Apr 2024 23:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711703.1111876; Wed, 24 Apr 2024 23:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzm2W-0007NQ-5G; Wed, 24 Apr 2024 23:28:36 +0000
Received: by outflank-mailman (input) for mailman id 711703;
 Wed, 24 Apr 2024 23:28:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nv0e=L5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rzm2U-0007NK-VC
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 23:28:35 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5be60ca3-0292-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 01:28:32 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 04D12CE16BB;
 Wed, 24 Apr 2024 23:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB4DC113CD;
 Wed, 24 Apr 2024 23:28:23 +0000 (UTC)
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
X-Inumbo-ID: 5be60ca3-0292-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714001304;
	bh=kXDE3jy3DUog0Nd03DFCRiMYCMsFBqcfR6n7vPbvOKg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SAZp5o7ch4uCRlcSn/4vXB4U8SOa+QAe6cxEO87BIU/ZIFzqVF8QwZmQSCDzjQgHd
	 SYVcn7lp/gTigBXtVIvsRJx56NB+prHUee/BN1J/Up+lsKvWroTPVPrvwMfuv5gQ7+
	 1idd6s5a7keqTegHr29S9tyDoRnpVFj9KbR0I21xQF2yeLMnkysx+Tl9P3nZvDAq+g
	 oGfYdSdZbhJuScQXL1044/+xdetUlLTWmqZeMR/0cKkFOW9NUXuOZvmYOxrtw8/DjL
	 ERx2lj36pvYkX3YW7HeUbpz9uqxjHTWrShimCnmopeJUxhbrnBlpCRagzGINAF0uue
	 dc9gSCID0WkAg==
Date: Wed, 24 Apr 2024 16:28:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/3] automation: Drop some of the non-debug variants of
 the same Arm jobs
In-Reply-To: <20240423161121.138536-2-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2404241627390.3940@ubuntu-linux-20-04-desktop>
References: <20240423161121.138536-1-michal.orzel@amd.com> <20240423161121.138536-2-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Apr 2024, Michal Orzel wrote:
> To save some bandwith that can be later on used to increase the test
> coverage by adding new tests, drop the following non-debug test/build
> jobs existing in both debug and non-debug variants:
>  - static memory (arm64, arm32)
>  - static shared memory (arm64)
>  - static heap (arm64)
>  - boot cpupools (arm64)
>  - gzip (arm32)
> 
> More generic tests existing in both variants were left unmodified.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/build.yaml | 38 --------------------------
>  automation/gitlab-ci/test.yaml  | 48 ---------------------------------
>  2 files changed, 86 deletions(-)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index aac29ee13ab6..f3c934471f32 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -392,16 +392,6 @@ debian-bookworm-gcc-arm32-debug-randconfig:
>      HYPERVISOR_ONLY: y
>      RANDCONFIG: y
>  
> -debian-bookworm-gcc-arm32-staticmem:
> -  extends: .gcc-arm32-cross-build
> -  variables:
> -    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
> -    HYPERVISOR_ONLY: y
> -    EXTRA_XEN_CONFIG: |
> -      CONFIG_EXPERT=y
> -      CONFIG_UNSUPPORTED=y
> -      CONFIG_STATIC_MEMORY=y
> -
>  debian-bookworm-gcc-arm32-debug-staticmem:
>    extends: .gcc-arm32-cross-build-debug
>    variables:
> @@ -458,15 +448,6 @@ alpine-3.18-gcc-debug-arm64-randconfig:
>      CONTAINER: alpine:3.18-arm64v8
>      RANDCONFIG: y
>  
> -alpine-3.18-gcc-arm64-staticmem:
> -  extends: .gcc-arm64-build
> -  variables:
> -    CONTAINER: alpine:3.18-arm64v8
> -    EXTRA_XEN_CONFIG: |
> -      CONFIG_EXPERT=y
> -      CONFIG_UNSUPPORTED=y
> -      CONFIG_STATIC_MEMORY=y
> -
>  alpine-3.18-gcc-debug-arm64-staticmem:
>    extends: .gcc-arm64-build-debug
>    variables:
> @@ -476,15 +457,6 @@ alpine-3.18-gcc-debug-arm64-staticmem:
>        CONFIG_UNSUPPORTED=y
>        CONFIG_STATIC_MEMORY=y
>  
> -alpine-3.18-gcc-arm64-static-shared-mem:
> -  extends: .gcc-arm64-build
> -  variables:
> -    CONTAINER: alpine:3.18-arm64v8
> -    EXTRA_XEN_CONFIG: |
> -      CONFIG_UNSUPPORTED=y
> -      CONFIG_STATIC_MEMORY=y
> -      CONFIG_STATIC_SHM=y
> -
>  alpine-3.18-gcc-debug-arm64-static-shared-mem:
>    extends: .gcc-arm64-build-debug
>    variables:
> @@ -494,16 +466,6 @@ alpine-3.18-gcc-debug-arm64-static-shared-mem:
>        CONFIG_STATIC_MEMORY=y
>        CONFIG_STATIC_SHM=y
>  
> -alpine-3.18-gcc-arm64-boot-cpupools:
> -  extends: .gcc-arm64-build
> -  variables:
> -    CONTAINER: alpine:3.18-arm64v8
> -    EXTRA_XEN_CONFIG: |
> -      CONFIG_EXPERT=y
> -      CONFIG_UNSUPPORTED=y
> -      CONFIG_SCHED_NULL=y
> -      CONFIG_BOOT_TIME_CPUPOOLS=y
> -
>  alpine-3.18-gcc-debug-arm64-boot-cpupools:
>    extends: .gcc-arm64-build-debug
>    variables:
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 8b7b2e4da92d..55a7831ad292 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -255,14 +255,6 @@ qemu-smoke-dom0less-arm64-gcc-debug:
>      - *arm64-test-needs
>      - alpine-3.18-gcc-debug-arm64
>  
> -qemu-smoke-dom0less-arm64-gcc-staticmem:
> -  extends: .qemu-arm64
> -  script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-mem 2>&1 | tee ${LOGFILE}
> -  needs:
> -    - *arm64-test-needs
> -    - alpine-3.18-gcc-arm64-staticmem
> -
>  qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
>    extends: .qemu-arm64
>    script:
> @@ -271,14 +263,6 @@ qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
>      - *arm64-test-needs
>      - alpine-3.18-gcc-debug-arm64-staticmem
>  
> -qemu-smoke-dom0less-arm64-gcc-staticheap:
> - extends: .qemu-arm64
> - script:
> -   - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-heap 2>&1 | tee ${LOGFILE}
> - needs:
> -   - *arm64-test-needs
> -   - alpine-3.18-gcc-arm64
> -
>  qemu-smoke-dom0less-arm64-gcc-debug-staticheap:
>   extends: .qemu-arm64
>   script:
> @@ -287,14 +271,6 @@ qemu-smoke-dom0less-arm64-gcc-debug-staticheap:
>     - *arm64-test-needs
>     - alpine-3.18-gcc-debug-arm64
>  
> -qemu-smoke-dom0less-arm64-gcc-static-shared-mem:
> -  extends: .qemu-arm64
> -  script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-shared-mem 2>&1 | tee ${LOGFILE}
> -  needs:
> -    - *arm64-test-needs
> -    - alpine-3.18-gcc-arm64-static-shared-mem
> -
>  qemu-smoke-dom0less-arm64-gcc-debug-static-shared-mem:
>    extends: .qemu-arm64
>    script:
> @@ -303,14 +279,6 @@ qemu-smoke-dom0less-arm64-gcc-debug-static-shared-mem:
>      - *arm64-test-needs
>      - alpine-3.18-gcc-debug-arm64-static-shared-mem
>  
> -qemu-smoke-dom0less-arm64-gcc-boot-cpupools:
> -  extends: .qemu-arm64
> -  script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh boot-cpupools 2>&1 | tee ${LOGFILE}
> -  needs:
> -    - *arm64-test-needs
> -    - alpine-3.18-gcc-arm64-boot-cpupools
> -
>  qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
>    extends: .qemu-arm64
>    script:
> @@ -359,14 +327,6 @@ qemu-smoke-dom0less-arm32-gcc-debug:
>      - *arm32-test-needs
>      - debian-bookworm-gcc-arm32-debug
>  
> -qemu-smoke-dom0less-arm32-gcc-staticmem:
> -  extends: .qemu-arm32
> -  script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh static-mem 2>&1 | tee ${LOGFILE}
> -  needs:
> -    - *arm32-test-needs
> -    - debian-bookworm-gcc-arm32-staticmem
> -
>  qemu-smoke-dom0less-arm32-gcc-debug-staticmem:
>    extends: .qemu-arm32
>    script:
> @@ -375,14 +335,6 @@ qemu-smoke-dom0less-arm32-gcc-debug-staticmem:
>      - *arm32-test-needs
>      - debian-bookworm-gcc-arm32-debug-staticmem
>  
> -qemu-smoke-dom0less-arm32-gcc-gzip:
> -  extends: .qemu-arm32
> -  script:
> -    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh gzip 2>&1 | tee ${LOGFILE}
> -  needs:
> -    - *arm32-test-needs
> -    - debian-bookworm-gcc-arm32
> -
>  qemu-smoke-dom0less-arm32-gcc-debug-gzip:
>    extends: .qemu-arm32
>    script:
> -- 
> 2.25.1
> 

