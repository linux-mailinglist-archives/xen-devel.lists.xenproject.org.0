Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45372708A3D
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 23:17:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536570.835021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzkzW-00088t-3g; Thu, 18 May 2023 21:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536570.835021; Thu, 18 May 2023 21:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzkzW-00087E-0w; Thu, 18 May 2023 21:16:54 +0000
Received: by outflank-mailman (input) for mailman id 536570;
 Thu, 18 May 2023 21:16:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o87v=BH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pzkzU-000878-4J
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 21:16:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d7aaf33-f5c1-11ed-b22d-6b7b168915f2;
 Thu, 18 May 2023 23:16:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 12F0F61546;
 Thu, 18 May 2023 21:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE954C433D2;
 Thu, 18 May 2023 21:16:47 +0000 (UTC)
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
X-Inumbo-ID: 4d7aaf33-f5c1-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684444608;
	bh=HoxGkgzFbxf63dORm+ogvEfSTinTLo9wBA1ezIhqqa8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AF/6hg6qgN+xM4xcYrFdHGdKeM5E1rRA4v7yqZhAO61m+c75ak/Zoje/CToS6hINQ
	 RW5ntP37VKKRgYwS6Lmt27+tJ9A0RM5ZPz8bAavwFGsLl/VPfsLmhyXYdYCUNmeAmU
	 iJQSV6p74JgiFyso36AUfuhfNIhnZjdhySUqkxAt2ZaB3qYoBbQ3gQLeK5KpDpBeiJ
	 JEvjDXgd+2csv/lkkNh3SFvQpMPKtU8/7dkqKGVT0wRfnpWo0KNxB3qCFWH2vEuX3s
	 Okm11oIYAuy5X6+Abium2paMC7gm2D58e+5iMfniKtZLIPk/GbrTrXYavE9AKef70J
	 ZcYb5uHuudFvg==
Date: Thu, 18 May 2023 14:16:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, luca.fancellu@arm.com
Subject: Re: [PATCH] automation: Enable parallel build with cppcheck
 analysis
In-Reply-To: <20230518122415.8698-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2305181416400.128889@ubuntu-linux-20-04-desktop>
References: <20230518122415.8698-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 18 May 2023, Michal Orzel wrote:
> The limitation was fixed by the commit:
> 45bfff651173d538239308648c6a6cd7cbe37172
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/scripts/build | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 9085cba35281..38c48ae6d826 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -39,10 +39,8 @@ cp xen/.config xen-config
>  mkdir -p binaries
>  
>  if [[ "${CPPCHECK}" == "y" ]] && [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
> -    # Cppcheck analysis invokes Xen-only build.
> -    # Known limitation: cppcheck generates inconsistent reports when running
> -    # in parallel mode, therefore do not specify -j<n>.
> -    xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra
> +    # Cppcheck analysis invokes Xen-only build
> +    xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra -- -j$(nproc)
>  
>      # Preserve artefacts
>      cp xen/xen binaries/xen
> -- 
> 2.25.1
> 

