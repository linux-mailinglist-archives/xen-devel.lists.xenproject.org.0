Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 057E95EB4C8
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 00:51:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412107.655285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocwva-0005dB-DS; Mon, 26 Sep 2022 22:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412107.655285; Mon, 26 Sep 2022 22:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocwva-0005bD-AG; Mon, 26 Sep 2022 22:50:18 +0000
Received: by outflank-mailman (input) for mailman id 412107;
 Mon, 26 Sep 2022 22:50:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/HAa=Z5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ocwvY-0005b7-BI
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 22:50:16 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 950097bc-3ded-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 00:50:13 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0DA79B81598;
 Mon, 26 Sep 2022 22:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9D3C433D6;
 Mon, 26 Sep 2022 22:50:10 +0000 (UTC)
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
X-Inumbo-ID: 950097bc-3ded-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664232611;
	bh=NZH//ZhmyRzkqcR7Vfm/ILuF8is8Qf4IrYi4B2cbzuQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=k1k9sZ4z0Oz5HV9ynVKfbiXqxomR5qmVbq0DIPH7/plr+pXd0Q9x/5gTAg3DVt0og
	 2jpcUgc1cS4aZ5sRMLjNgAwLRIR1FabCJd+SWLwN3kvfeol3OwSIqwEcVwGJj3gpn9
	 aMf4i9acVJobjDzJXPmqZEJn9ofkq0VFdNVkk443kXcejx9NLbZ3pI1e6P5A+1YMNR
	 4b0Wbi1AUv+qEcwcISve9jL5c2CAQxKcgAd6ni2EhK4pQmP0dk8L/4KQs3lT9I4iBQ
	 u/mdY12682RjN9vjct5ifrpKq2U7xTZO9MD4ezS8YhfssrZtD6go3jl9g3l0gmay/i
	 s1HerrZ+m+u7A==
Date: Mon, 26 Sep 2022 15:50:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 02/10] automation: Add randconfig build jobs for arm64
 alpine container
In-Reply-To: <20220926110423.26030-3-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209261538410.922084@ubuntu-linux-20-04-desktop>
References: <20220926110423.26030-1-michal.orzel@amd.com> <20220926110423.26030-3-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Sep 2022, Michal Orzel wrote:
> For arm64 we perform builds using debian and alpine containers.
> We are missing the randconfig build jobs for the latter, so add them.
> This way for each container we have 4 fundamental build jobs:
> - defconfig non-debug/debug
> - randconfig non-debug/debug
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - none
> ---
>  automation/gitlab-ci/build.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index a39ed72aac6d..d931441b910a 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -566,6 +566,18 @@ alpine-3.12-gcc-debug-arm64:
>    variables:
>      CONTAINER: alpine:3.12-arm64v8
>  
> +alpine-3.12-gcc-arm64-randconfig:
> +  extends: .gcc-arm64-build
> +  variables:
> +    CONTAINER: alpine:3.12-arm64v8
> +    RANDCONFIG: y
> +
> +alpine-3.12-gcc-debug-arm64-randconfig:
> +  extends: .gcc-arm64-build-debug
> +  variables:
> +    CONTAINER: alpine:3.12-arm64v8
> +    RANDCONFIG: y
> +
>  alpine-3.12-gcc-arm64-staticmem:
>    extends: .gcc-arm64-build
>    variables:
> -- 
> 2.25.1
> 

