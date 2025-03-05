Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A82EA53E77
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 00:28:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902910.1310846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpy9n-0002kj-3J; Wed, 05 Mar 2025 23:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902910.1310846; Wed, 05 Mar 2025 23:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpy9n-0002j3-0W; Wed, 05 Mar 2025 23:28:07 +0000
Received: by outflank-mailman (input) for mailman id 902910;
 Wed, 05 Mar 2025 23:28:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gbs/=VY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tpy9k-0002iv-Se
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 23:28:04 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b2c823c-fa19-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 00:28:02 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C41A7A467A0;
 Wed,  5 Mar 2025 23:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C9DC4CED1;
 Wed,  5 Mar 2025 23:28:00 +0000 (UTC)
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
X-Inumbo-ID: 7b2c823c-fa19-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741217281;
	bh=IcLEwY4YxrR6Vf5cl3DRfRALYRvOYZXUyJ2x7VxBu6I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hK0cdea6ZKX/syPtYfGlY95vXOsXyqd13c35JnUz1i33sdIA6LD3sXTFG/Adv9882
	 MZojVr4y73suqptyW2uN7JF8yEc6dGpOl+jBo6Fa0jryzKyUqN7XbnLjmrxvL92IN2
	 tZERSqucCatRdcEE8WTfXA7HD5K63k6+Oc5I/Gu4Cw44reA1FOn5VoCq9pAA2zDvz7
	 q2/gI2Qa3sLMVoBiNyadfiGdvilsUwX8Tu7EmuChZSg7DCM4JFnIo3/+SXs1lS3YeA
	 PSPb5oO09HHvnl89oRo0iZxVRRdU4c+fyddJD5WzD4h9AMnnnoeiMcagIWRj/TDi9G
	 kYafD21RaqNLg==
Date: Wed, 5 Mar 2025 15:27:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v8 2/6] automation: drop debian:11-riscv64 container
In-Reply-To: <184f15497204d1bb464bf871f70de105ce8851b2.1740764258.git.oleksii.kurochko@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2503051527520.1303386@ubuntu-linux-20-04-desktop>
References: <cover.1740764258.git.oleksii.kurochko@gmail.com> <184f15497204d1bb464bf871f70de105ce8851b2.1740764258.git.oleksii.kurochko@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 28 Feb 2025, Oleksii Kurochko wrote:
> There are two reasons for that:
> 1. In the README, GCC baseline is chosen to be 12.2, whereas Debian 11
>    uses GCC 10.2.1.
> 2. Xen requires mandatory some Z extensions, but GCC 10.2.1 does not
>    support Z extensions in -march, causing the compilation to fail.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in V8:
>  - Nothing changed except that now it has dependency from the
>    previous commit which adds information about GCC to README
>    and thereby clarify the commit message of the current commit.
> ---
> Changes in V7:
>  - new patch
> ---
>  automation/gitlab-ci/build.yaml | 14 --------------
>  automation/scripts/containerize |  1 -
>  2 files changed, 15 deletions(-)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 6a2e491534..b952a59c06 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -723,20 +723,6 @@ debian-12-ppc64le-gcc:
>      HYPERVISOR_ONLY: y
>  
>  # RISC-V 64 cross-build
> -debian-11-riscv64-gcc:
> -  extends: .gcc-riscv64-cross-build
> -  variables:
> -    CONTAINER: debian:11-riscv64
> -    KBUILD_DEFCONFIG: tiny64_defconfig
> -    HYPERVISOR_ONLY: y
> -
> -debian-11-riscv64-gcc-debug:
> -  extends: .gcc-riscv64-cross-build-debug
> -  variables:
> -    CONTAINER: debian:11-riscv64
> -    KBUILD_DEFCONFIG: tiny64_defconfig
> -    HYPERVISOR_ONLY: y
> -
>  debian-12-riscv64-gcc:
>    extends: .gcc-riscv64-cross-build
>    variables:
> diff --git a/automation/scripts/containerize b/automation/scripts/containerize
> index bc43136078..0953e0728c 100755
> --- a/automation/scripts/containerize
> +++ b/automation/scripts/containerize
> @@ -31,7 +31,6 @@ case "_${CONTAINER}" in
>      _fedora) CONTAINER="${BASE}/fedora:41-x86_64";;
>      _bullseye-ppc64le) CONTAINER="${BASE}/debian:11-ppc64le" ;;
>      _bookworm-ppc64le) CONTAINER="${BASE}/debian:12-ppc64le" ;;
> -    _bullseye-riscv64) CONTAINER="${BASE}/debian:11-riscv64" ;;
>      _bookworm-riscv64) CONTAINER="${BASE}/debian:12-riscv64" ;;
>      _bookworm-x86_64-gcc-ibt) CONTAINER="${BASE}/debian:12-x86_64-gcc-ibt" ;;
>      _bookworm|_bookworm-x86_64|_) CONTAINER="${BASE}/debian:12-x86_64" ;;
> -- 
> 2.48.1
> 

