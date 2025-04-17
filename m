Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ACEA91003
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 02:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956792.1350068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5CrK-0003r2-89; Thu, 17 Apr 2025 00:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956792.1350068; Thu, 17 Apr 2025 00:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5CrK-0003p0-4P; Thu, 17 Apr 2025 00:12:02 +0000
Received: by outflank-mailman (input) for mailman id 956792;
 Thu, 17 Apr 2025 00:12:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F/Gg=XD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u5CrI-0003ou-EB
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 00:12:00 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 916fbf9a-1b20-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 02:11:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6F11DA4B085;
 Thu, 17 Apr 2025 00:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBD4C4CEE2;
 Thu, 17 Apr 2025 00:11:52 +0000 (UTC)
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
X-Inumbo-ID: 916fbf9a-1b20-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744848713;
	bh=pKtKHqcMj8usVze2fZHLq3Sjag1oCksWXFLelRjfWus=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tj943qgNbc9TuZEU1Xc5HvUXufw/sxCS30oiclQ7d0WcLiW50Mi2Hwvtoy5zy9dqc
	 5pk57HTEcp1T2EeJEKJLNWjnkcg4bIkmgT+9UYx1n48/DoA04vfHHKusXsqGu0WdeV
	 75HWXsFs/mPAOKZIHYfuULh9vZgKCFIq2FsCy544hRZh5RJlwHIkeyRnMY7rvWnc/x
	 uojpTEli6AkPw0FjmwyQBMKYK0WsyMyDAMundSzF1dBNBvJiczC4s7qlnWMCkC+5gA
	 z9By2nKiFWcGUk9ZgGEQnUqgJW1H4aXJMcDRnZ4Y8jN/UaMBa245dD/UZVLXuVeG1S
	 mCPNGOsEMnMFg==
Date: Wed, 16 Apr 2025 17:11:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    cardoe@cardoe.com, marmarek@invisiblethingslab.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v1 4/4] CI: add argo x86 XTF test
In-Reply-To: <20250416053213.921444-5-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2504161708470.8008@ubuntu-linux-20-04-desktop>
References: <20250416053213.921444-1-dmukhin@ford.com> <20250416053213.921444-5-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Apr 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Introduce new CI job to run x86 XTF argo test under QEMU to smoke test argo
> feature functionality in upstream CI.
> 
> The new job lead time is ~30s, limit max job duration to 60s.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  automation/gitlab-ci/test.yaml        | 9 +++++++++
>  automation/scripts/include/xtf-runner | 7 +++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index d6e4a0a622..9001efb45c 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -691,6 +691,15 @@ qemu-smoke-x86-64-gcc-efi:
>    needs:
>      - debian-12-x86_64-gcc-debug
>  
> +qemu-xtf-argo-x86_64-gcc-debug:
> +  extends: .qemu-smoke-x86-64
> +  variables:
> +    TEST_TIMEOUT_OVERRIDE: 60
> +  script:
> +    - ./automation/scripts/qemu-xtf.sh x86-64 pv64 argo 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - alpine-3.18-gcc-debug
> +
>  qemu-smoke-riscv64-gcc:
>    extends: .qemu-riscv64
>    script:
> diff --git a/automation/scripts/include/xtf-runner b/automation/scripts/include/xtf-runner
> index 55b7b34b89..12470b3979 100644
> --- a/automation/scripts/include/xtf-runner
> +++ b/automation/scripts/include/xtf-runner
> @@ -70,6 +70,9 @@ function xtf_build_cmdline()
>      local xtf_variant=$1
>      local xtf_name=$2
>      declare -a cmdline=()
> +    declare -A per_test_args=(
> +        [argo]="argo=1 mac-permissive=1"
> +    )
> +
>      cmdline+=("loglvl=all noreboot console_timestamps=boot")
>      cmdline+=("console=${XEN_CONSOLE}")
> @@ -79,6 +82,10 @@ function xtf_build_cmdline()
>          cmdline+=("dom0-iommu=none dom0=pvh")
>      fi
>  
> +    if [[ -v per_test_args[${xtf_name}] ]]; then
> +        cmdline+=("${per_test_args[${xtf_name}]}")
> +    fi
> +

This is all within the same bash function so I think we could avoid
using the per_test_args array and just do:

if test "$xtf_name"
then
    cmdline+=("argo=1 mac-permissive=1")
fi

The indirection is not required as far as I can tell. I do realize it is
a matter of taste and it works either way so I wouldn't insist.



>      export XEN_CMDLINE="${cmdline[@]}"
>  }
>  
> -- 
> 2.34.1
> 
> 

