Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C40A95768
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 22:39:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961444.1352875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6xve-0006O6-C2; Mon, 21 Apr 2025 20:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961444.1352875; Mon, 21 Apr 2025 20:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6xve-0006M0-7F; Mon, 21 Apr 2025 20:39:46 +0000
Received: by outflank-mailman (input) for mailman id 961444;
 Mon, 21 Apr 2025 20:39:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nRXx=XH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u6xvc-0005oc-3L
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 20:39:44 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0516620-1ef0-11f0-9ffb-bf95429c2676;
 Mon, 21 Apr 2025 22:39:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4A62AA4BE06;
 Mon, 21 Apr 2025 20:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33651C4CEE4;
 Mon, 21 Apr 2025 20:39:40 +0000 (UTC)
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
X-Inumbo-ID: c0516620-1ef0-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745267981;
	bh=cIrFY4mi3gt5JfhJgxVvgR0f8dlTZkXRBoOuVORCxkA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pL/hiug3wpumaOr1ZYIEBbIlGO+ULSvx5r3wGIagrTol2CIDW2tB5Ujy/g0/splQF
	 aHu6crh1kVtj4b0s6qUsNu3T5JHUgKmxGTBzdEHox0tPyhysoLA+yvzDwiaIH6UMO3
	 Nd01t/tQEuv4j9abDivzI8JF///ST2T2dE6JZpLmdVUybf+5A/y9wdoPP5Jvb6/xSe
	 j1crDP5H7lpKJjEllAg1mEtIZXUkSBY9SyF7Abu/gzk/XVeoFYuYNwsScEDvwNK9JL
	 Pc7cFUcsshlIp9nE+r37JVkhFRszQTaGV7+02nCl2KutgZ+hmF94ybcS5zntJO/nx8
	 VHkFOGNIyw4Fg==
Date: Mon, 21 Apr 2025 13:39:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    cardoe@cardoe.com, marmarek@invisiblethingslab.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v2 4/4] CI: add argo x86 XTF test
In-Reply-To: <20250419010319.2572518-5-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2504211338530.785180@ubuntu-linux-20-04-desktop>
References: <20250419010319.2572518-1-dmukhin@ford.com> <20250419010319.2572518-5-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 19 Apr 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Introduce new CI job to run x86 XTF argo test under QEMU to smoke test argo
> feature functionality in upstream CI.
> 
> The new job lead time is ~30s, limit max job duration to 60s.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Depends on
>    https://lore.kernel.org/xen-devel/20250416050443.919751-1-dmukhin@ford.com/
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
> index 320eb65dc8..b7fea52dad 100644
> --- a/automation/scripts/include/xtf-runner
> +++ b/automation/scripts/include/xtf-runner
> @@ -68,6 +68,9 @@ function xtf_build_cmdline()
>      local xtf_variant=$1
>      local xtf_name=$2
>      declare -a cmdline=()
> +    declare -A per_test_args=(
> +        [argo]="argo=1 mac-permissive=1"
> +    )
>  
>      cmdline+=("${XEN_CMDLINE}")
>  
> @@ -76,6 +79,10 @@ function xtf_build_cmdline()
>          cmdline+=("dom0-iommu=none dom0=pvh")
>      fi
>  
> +    if [[ -v per_test_args[${xtf_name}] ]]; then
> +        cmdline+=("${per_test_args[${xtf_name}]}")
> +    fi
> +
>      export XEN_CMDLINE="${cmdline[@]}"
>  }
>  
> -- 
> 2.34.1
> 
> 

