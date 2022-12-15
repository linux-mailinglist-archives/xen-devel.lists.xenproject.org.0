Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B11464E2C4
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 22:08:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463874.722152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5vSy-0005vU-IN; Thu, 15 Dec 2022 21:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463874.722152; Thu, 15 Dec 2022 21:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5vSy-0005tG-FP; Thu, 15 Dec 2022 21:08:32 +0000
Received: by outflank-mailman (input) for mailman id 463874;
 Thu, 15 Dec 2022 21:08:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+fpb=4N=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p5vSx-0005t8-0y
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 21:08:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f60f52d-7cbc-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 22:08:29 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5FA0461F21;
 Thu, 15 Dec 2022 21:08:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B30C433EF;
 Thu, 15 Dec 2022 21:08:27 +0000 (UTC)
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
X-Inumbo-ID: 9f60f52d-7cbc-11ed-8fd3-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671138507;
	bh=Ti/kw7yXnonMyAPgPcedJQqxjvL8St+atant37xoY1U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GajafKQEhGB5ogqrc5VAV5xdN6t3O0n+wNw6dVk7Q1x2O3tYclZ4VTCYJNe6/GqJ+
	 u/scUNz+8cQSlqOFdnoYcunHjNAVEp9Sm9wT64Y33z9DjMALPVoiCMgk3ESFUBiXVS
	 3TFnosPafHMROm90d1IAMPIPLVC0P78+fArbUFUyKUwlxKfLLj5lKGYiVzxhq4rEUw
	 1w+Oep3RQ+9Wa1GtYtuUBRZ93XTS0aZVEzoyVUuThTTMg7eT6Qc4Qglaa8yEert/VN
	 yS+qL8mviHgf/vdUCIr/2kHEd0HxPKACLj2yKbnq+33qLkja8z5VMpQmFCPEFcX2pQ
	 wpnrtDPF7v4bg==
Date: Thu, 15 Dec 2022 13:08:25 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] automation: Add test jobs to run XTF hypercall
 xen_version test
In-Reply-To: <20221215152538.10266-3-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2212151307390.315094@ubuntu-linux-20-04-desktop>
References: <20221215152538.10266-1-michal.orzel@amd.com> <20221215152538.10266-3-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Dec 2022, Michal Orzel wrote:
> Add test jobs in both debug and non-debug versions to run hyp-xen-version
> XTF test as a dom0less domU on arm64. The purpose of this test is to
> validate the functional behavior of xen_version hypercall.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  automation/gitlab-ci/test.yaml | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 2d57f4feb74a..9d4b5315e710 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -165,6 +165,22 @@ qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
>      - *arm64-test-needs
>      - alpine-3.12-gcc-debug-arm64-boot-cpupools
>  
> +qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
> +    extends: .qemu-arm64
> +    script:
> +      - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version 2>&1 | tee ${LOGFILE}
> +    needs:
> +      - *arm64-test-needs
> +      - alpine-3.12-gcc-arm64

I think this test only needs qemu-system-aarch64-6.0.0-arm64-export


> +qemu-xtf-dom0less-arm64-gcc-debug-hyp-xen-version:
> +  extends: .qemu-arm64
> +  script:
> +    - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *arm64-test-needs
> +    - alpine-3.12-gcc-debug-arm64
> +
>  qemu-smoke-dom0-arm32-gcc:
>    extends: .qemu-arm32
>    script:
> -- 
> 2.25.1
> 

