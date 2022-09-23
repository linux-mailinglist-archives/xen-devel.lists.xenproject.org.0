Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB2D5E85A0
	for <lists+xen-devel@lfdr.de>; Sat, 24 Sep 2022 00:11:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410945.654114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obqsj-0002bs-9L; Fri, 23 Sep 2022 22:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410945.654114; Fri, 23 Sep 2022 22:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obqsj-0002ZN-6U; Fri, 23 Sep 2022 22:10:49 +0000
Received: by outflank-mailman (input) for mailman id 410945;
 Fri, 23 Sep 2022 22:10:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wNmR=Z2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1obqsh-0002ZG-5j
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 22:10:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9114aff0-3b8c-11ed-9374-c1cf23e5d27e;
 Sat, 24 Sep 2022 00:10:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E19F061E0D;
 Fri, 23 Sep 2022 22:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68484C433D6;
 Fri, 23 Sep 2022 22:10:41 +0000 (UTC)
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
X-Inumbo-ID: 9114aff0-3b8c-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663971042;
	bh=aRPszHBUEhM651GgpjnI0fH6rUnyJMrswFVK7JirL4Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IfL+W9hxJcJD2q9nkkN1Bx6U3f77Ak4f+467NNlbuUxqB7hzZyHbscCM6Idb5kCkb
	 Vvg1Lxs7JIYdKdrknLBQo+KWCddTcen7o+OUHYL9zs2/HlM1VrcFNWcyrT4uL1uC+1
	 5NPLxTkKuiXdOjuhfbogHzYn8K9qaFdDtLK/1n7J2L5ml3dnmHaNKzUfYjteGE6elt
	 TK55T0Mx+QsgrI2eoNChQ20LQd1UX1FiONrNwcY46W2jFlmsphoTWOFIFGUKPCugSY
	 6ZIqYHsW21Ko8hQ+pjPid0RI4bZTNyjwuMHreiE8nYxjkR3E8EY81PXHOq1GQsGTZm
	 VYRUZsP1ktBnA==
Date: Fri, 23 Sep 2022 15:10:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Henry.Wang@arm.com
Subject: Re: [PATCH 1/9] automation: Use custom build jobs when extra config
 options are needed
In-Reply-To: <a9f2d91f-3aa7-4578-5181-21341d87ee7d@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209231510330.65421@ubuntu-linux-20-04-desktop>
References: <20220922134058.1410-1-michal.orzel@amd.com> <20220922134058.1410-2-michal.orzel@amd.com> <alpine.DEB.2.22.394.2209221439550.65421@ubuntu-linux-20-04-desktop> <a9f2d91f-3aa7-4578-5181-21341d87ee7d@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Sep 2022, Michal Orzel wrote:
> Hi Stefano,
> 
> On 22/09/2022 23:40, Stefano Stabellini wrote:
> > 
> > 
> > On Thu, 22 Sep 2022, Michal Orzel wrote:
> >> Currently, all the arm64 defconfig build jobs, regardless of the
> >> container used, end up building Xen with the extra config options
> >> specified in the main build script (e.g. CONFIG_EXPERT,
> >> CONFIG_STATIC_MEMORY). Because these options are only needed for
> >> specific test jobs, the current behavior of the CI is incorrect
> >> as we add the extra options to all the defconfig builds. This means
> >> that on arm64 there is not a single job performing proper defconfig build.
> >>
> >> To fix this issue, add custom build jobs each time there is a need for
> >> building Xen with additional config options. Introduce EXTRA_XEN_CONFIG
> >> variable to be used by these jobs to store the required options. This
> >> variable will be then read by the main build script to modify the .config
> >> file. This will also help users to understand what is needed to run specific
> >> test.
> >>
> >> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> >> ---
> >> This patch could actually be consider to be taken for 4.17 release.
> >> The reason why is because currently our CI for arm64 does not even
> >> peform clean defconfig build which is quite crucial target to be tested.
> >> Performing builds always with EXPERT and UNSUPPORTED is not something so
> >> beneficial for release tests. This is up to the release manager.
> > 
> > + Henry
> > 
> > I agree this should go in 4.17, so that gitlab-ci can test non-DEBUG
> > builds on ARM.
> > 
> Do you mean the whole series should go in?
> I'm ok with that, even though I only marked this patch as the one that should go in
> as it can be seen as a fix. But I can also see the benefits of merging the whole series.

I think only this patch should go in. I like this series but it is best
to stay on the safe side and push to staging the rest of the series
later after the release.

 
> >> ---
> >>  automation/gitlab-ci/build.yaml | 15 +++++++++++++++
> >>  automation/gitlab-ci/test.yaml  |  4 ++--
> >>  automation/scripts/build        |  8 ++------
> >>  3 files changed, 19 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> >> index 720ce6e07ba0..a39ed72aac6d 100644
> >> --- a/automation/gitlab-ci/build.yaml
> >> +++ b/automation/gitlab-ci/build.yaml
> >> @@ -566,6 +566,21 @@ alpine-3.12-gcc-debug-arm64:
> >>    variables:
> >>      CONTAINER: alpine:3.12-arm64v8
> >>
> >> +alpine-3.12-gcc-arm64-staticmem:
> >> +  extends: .gcc-arm64-build
> >> +  variables:
> >> +    CONTAINER: alpine:3.12-arm64v8
> >> +    EXTRA_XEN_CONFIG: |
> > 
> > Why the "|" ?
> > 
> > I was trying to look for its documentation in the gitlab yaml docs but
> > couldn't find it.
> > 
> By default gitlab variables are one liners so that they can store one key:value pair.
> If you want to define a variable storing multiple values (in this case we want to
> store multi-line string because of .config format) you need to use |. You can check [1].

OK


> > 
> >> +      CONFIG_EXPERT=y
> >> +      CONFIG_UNSUPPORTED=y
> >> +      CONFIG_STATIC_MEMORY=y
> >> +
> >> +alpine-3.12-gcc-arm64-boot-cpupools:
> >> +  extends: .gcc-arm64-build
> >> +  variables:
> >> +    CONTAINER: alpine:3.12-arm64v8
> >> +    EXTRA_XEN_CONFIG: |
> >> +      CONFIG_BOOT_TIME_CPUPOOLS=y
> >>
> >>  ## Test artifacts common
> >>
> >> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> >> index d899b3bdbf7a..4f96e6e322de 100644
> >> --- a/automation/gitlab-ci/test.yaml
> >> +++ b/automation/gitlab-ci/test.yaml
> >> @@ -88,7 +88,7 @@ qemu-smoke-arm64-gcc-staticmem:
> >>    script:
> >>      - ./automation/scripts/qemu-smoke-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
> >>    needs:
> >> -    - alpine-3.12-gcc-arm64
> >> +    - alpine-3.12-gcc-arm64-staticmem
> >>      - alpine-3.12-arm64-rootfs-export
> >>      - kernel-5.19-arm64-export
> >>      - qemu-system-aarch64-6.0.0-arm64-export
> >> @@ -107,7 +107,7 @@ qemu-smoke-arm64-gcc-boot-cpupools:
> >>    script:
> >>      - ./automation/scripts/qemu-smoke-arm64.sh boot-cpupools 2>&1 | tee qemu-smoke-arm64.log
> >>    needs:
> >> -    - alpine-3.12-gcc-arm64
> >> +    - alpine-3.12-gcc-arm64-boot-cpupools
> >>      - alpine-3.12-arm64-rootfs-export
> >>      - kernel-5.19-arm64-export
> >>      - qemu-system-aarch64-6.0.0-arm64-export
> >> diff --git a/automation/scripts/build b/automation/scripts/build
> >> index 2f15ab3198e6..7d441cedb4ae 100755
> >> --- a/automation/scripts/build
> >> +++ b/automation/scripts/build
> >> @@ -15,12 +15,8 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
> >>      make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
> >>      hypervisor_only="y"
> >>  else
> >> -    if [[ "${XEN_TARGET_ARCH}" = "arm64" ]]; then
> >> -        echo "
> >> -CONFIG_EXPERT=y
> >> -CONFIG_UNSUPPORTED=y
> >> -CONFIG_STATIC_MEMORY=y
> >> -CONFIG_BOOT_TIME_CPUPOOLS=y" > xen/.config
> >> +    if [ -n "${EXTRA_XEN_CONFIG}" ]; then
> > 
> > NIT: for uniformity with rest of the file use
> > 
> >   if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
> > 
> Ok, will do in v2.
> 
> > 
> >> +        echo "${EXTRA_XEN_CONFIG}" > xen/.config
> >>          make -j$(nproc) -C xen olddefconfig
> >>      else
> >>          make -j$(nproc) -C xen defconfig
> >> --
> >> 2.25.1
> >>
> 
> ~Michal
> 
> [1] https://docs.gitlab.com/ee/ci/variables/#store-multiple-values-in-one-variable
> 

