Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C09679B863A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 23:47:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828912.1244010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6dwW-0005xX-PF; Thu, 31 Oct 2024 22:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828912.1244010; Thu, 31 Oct 2024 22:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6dwW-0005vi-Li; Thu, 31 Oct 2024 22:47:04 +0000
Received: by outflank-mailman (input) for mailman id 828912;
 Thu, 31 Oct 2024 22:47:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XMx1=R3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1t6dwV-0005vc-Mn
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 22:47:03 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09123689-97da-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 23:46:59 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BDB315CA5CC;
 Thu, 31 Oct 2024 22:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45945C4CECF;
 Thu, 31 Oct 2024 22:46:56 +0000 (UTC)
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
X-Inumbo-ID: 09123689-97da-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjA5MTIzNjg5LTk3ZGEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNDE0ODE5LjQ5NTAwMSwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730414817;
	bh=3K2IQboHACs9WYyxjefiedhp9XVGZ7ypUXS66BGUTGs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=a8+8eoTPu2PMYs2TVZX+hFIJhon2FC72y5AdoO4/PCQ/OjaVDPvDZh5gPp3vmrr4/
	 g83b1kGSDkAAdlukVJ/0c4eNQ2mbQ40WzVgc48kpO+5muRvUA4i9IMJEgoNIF0foA7
	 z6Dh2hL2gXkeXGNXCF34zwSVReOTZ28TYC5Wjg/tGH88Wgym3U7uvuTD/BKmWuKfhl
	 dmwuIXD7+H10LyG9aUVZZRDvWJWxATqXKJ7OqdgJfkyDa0YQzmFDnxEnLaagHvnaU9
	 tsIOgWzf1NS7dSZPY87P0S0tgcyp0qUfbamYyzrGDKNSpybpoAesDSrSkjam1zjsIt
	 HECSbngpuFafA==
Date: Thu, 31 Oct 2024 15:46:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, 
    Victor Lira <victorm.lira@amd.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] CI: Drop alpine-3.18-rootfs-export and use
 test-artefacts
In-Reply-To: <20241031190043.3011299-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2410311546170.2525410@ubuntu-linux-20-04-desktop>
References: <20241031190043.3011299-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1718299478-1730414817=:2525410"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1718299478-1730414817=:2525410
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 31 Oct 2024, Andrew Cooper wrote:
> The Argo work already moved this artefact into the new form.  Reuse that, and
> drop one test job.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

This is good but should we also remove
automation/tests-artifacts/alpine/3.18.dockerfile since we are at it?


> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Victor Lira <victorm.lira@amd.com>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1522281815
> ---
>  automation/gitlab-ci/build.yaml | 11 -----------
>  automation/gitlab-ci/test.yaml  |  4 +++-
>  2 files changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index af2b1ceba3a4..b5ca2c3f1833 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -304,17 +304,6 @@ qemu-system-aarch64-6.0.0-arm32-export:
>  
>  # x86_64 test artifacts
>  
> -alpine-3.18-rootfs-export:
> -  extends: .test-jobs-artifact-common
> -  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.18
> -  script:
> -    - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
> -  artifacts:
> -    paths:
> -      - binaries/initrd.tar.gz
> -  tags:
> -    - x86_64
> -
>  kernel-6.1.19-export:
>    extends: .test-jobs-artifact-common
>    image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.1.19
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index e8f57e87bd19..fe023dae0d42 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -11,8 +11,10 @@
>    - qemu-system-aarch64-6.0.0-arm32-export
>  
>  .x86-64-test-needs: &x86-64-test-needs
> -  - alpine-3.18-rootfs-export
>    - kernel-6.1.19-export
> +  - project: xen-project/hardware/test-artifacts
> +    job: x86_64-rootfs-alpine-3.18
> +    ref: master
>  
>  .qemu-arm64:
>    extends: .test-jobs-common
> -- 
> 2.39.5
> 
--8323329-1718299478-1730414817=:2525410--

