Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB88AE4E73
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 23:05:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022793.1398646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uToLR-0003IA-06; Mon, 23 Jun 2025 21:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022793.1398646; Mon, 23 Jun 2025 21:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uToLQ-0003FD-T6; Mon, 23 Jun 2025 21:04:48 +0000
Received: by outflank-mailman (input) for mailman id 1022793;
 Mon, 23 Jun 2025 21:04:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Rx=ZG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uToLP-0003Cs-JA
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 21:04:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b060f71e-5075-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 23:04:45 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 50E5D5C60A7;
 Mon, 23 Jun 2025 21:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE2D3C4CEEA;
 Mon, 23 Jun 2025 21:04:42 +0000 (UTC)
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
X-Inumbo-ID: b060f71e-5075-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750712683;
	bh=rVtQ+7ddAI6kxOwHm4oEsw9E8n8kJvwJDJRS9Pya++Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=axzmXxkTxEpmhY2p7sUpscStRgp3siMWefptcle9wRJ+LdKwTf2vEDoRc+gNzIVt4
	 +wA8lE//Gf55pWiFfQ67vUy37k1CYFhZwufoKWePF9n0ijh0D9RGsAFv33kYUNdQg5
	 xYco4rV2l7IeUKW7i2hPHa0dhuTmP0UuL1NoJ3MUoiJFos+s7y57Uz1rsSh7HDLRx7
	 mibC07EhEJe3dGDZenc/Neqb99ghZfDuRkEVWGRrdD83HrFaEHtTV+0i8oZphv8n3z
	 yeCnYLBnH2eMXLdYawJlL55hIpb/ZZ2/S9THSiQgUH8I4xqWkZqbsI/b1MAK1uoL2g
	 cBMp4tdO4iFzA==
Date: Mon, 23 Jun 2025 14:04:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 4/6] CI: make test-artifacts branch/job customizable
In-Reply-To: <7c032d51b6183888cb0fcb71662b452fd9cb5a20.1750686195.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2506231401090.8066@ubuntu-linux-20-04-desktop>
References: <cover.16ccd290bf95e314a4f23777f5564b3aa2417e57.1750686195.git-series.marmarek@invisiblethingslab.com> <7c032d51b6183888cb0fcb71662b452fd9cb5a20.1750686195.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1045390089-1750712508=:8066"
Content-ID: <alpine.DEB.2.22.394.2506231403260.862517@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1045390089-1750712508=:8066
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2506231403261.862517@ubuntu-linux-20-04-desktop>

On Mon, 23 Jun 2025, Marek Marczykowski-Górecki wrote:
> Allow choosing which artifacts branch and job to use for Linux. This
> allows running the same tests for different Linux versions, without
> duplicating a lot of yaml sections.

I just sent this reply:
https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2506231351060.8066@ubuntu-linux-20-04-desktop/

You are answering my question: the goal is to allow much wider Linux
versions testing? Because if not, I don't think there is much of a
benefit.

Do you envision a bunch of jobs in automation/gitlab-ci/test.yaml that
play with different LINUX_JOB_X86_64 / LINUX_JOB_ARM64 ? If so, we would
need the corresponding jobs in test-artifacts.


> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> I have considered common LINUX_JOB and then add architecture suffix, but
> even now X86 and ARM use different jobs, so I made them separate.
> ---
>  .gitlab-ci.yml                 |  9 +++++++++
>  automation/gitlab-ci/test.yaml |  8 ++++----
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 7974ac4e82bc..c1d92dc485e7 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -2,6 +2,15 @@ variables:
>    XEN_REGISTRY: registry.gitlab.com/xen-project/xen
>    SELECTED_JOBS_ONLY:
>      description: "Regex to select only some jobs, must be enclosed with /. For example /job1|job2/"
> +  LINUX_ARTIFACTS_BRANCH:
> +    description: "Branch in test-artifacts to use for Linux"
> +    value: master
> +  LINUX_JOB_X86_64:
> +    description: "Job name in test-artifacts to use for Linux x86_64"
> +    value: linux-6.12.34-x86_64
> +  LINUX_JOB_ARM64:
> +    description: "Job name in test-artifacts to use for Linux arm64"
> +    value: linux-6.6.86-arm64
>  
>  workflow:
>    name: "$CI_PIPELINE_SCHEDULE_DESCRIPTION"
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index dc08488e76f4..9fd66fb6138d 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -9,8 +9,8 @@
>  
>  .arm64-test-needs: &arm64-test-needs
>    - project: xen-project/hardware/test-artifacts
> -    job: linux-6.6.86-arm64
> -    ref: master
> +    job: $LINUX_JOB_ARM64
> +    ref: $LINUX_ARTIFACTS_BRANCH
>    - project: xen-project/hardware/test-artifacts
>      job: alpine-3.18-arm64-rootfs
>      ref: master
> @@ -21,8 +21,8 @@
>  
>  .x86-64-test-needs: &x86-64-test-needs
>    - project: xen-project/hardware/test-artifacts
> -    job: linux-6.12.34-x86_64
> -    ref: master
> +    job: $LINUX_JOB_X86_64
> +    ref: $LINUX_ARTIFACTS_BRANCH
>    - project: xen-project/hardware/test-artifacts
>      job: alpine-3.18-x86_64-rootfs
>      ref: master
> -- 
> git-series 0.9.1
> 
--8323329-1045390089-1750712508=:8066--

