Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F91D5E6EB6
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 23:43:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410469.653476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obTyL-00055S-RE; Thu, 22 Sep 2022 21:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410469.653476; Thu, 22 Sep 2022 21:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obTyL-00052R-Nf; Thu, 22 Sep 2022 21:43:05 +0000
Received: by outflank-mailman (input) for mailman id 410469;
 Thu, 22 Sep 2022 21:43:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2OXb=ZZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1obTyJ-00052L-Qj
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 21:43:03 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88d2ec11-3abf-11ed-9647-05401a9f4f97;
 Thu, 22 Sep 2022 23:43:02 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 633B2B815BA;
 Thu, 22 Sep 2022 21:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770F3C433C1;
 Thu, 22 Sep 2022 21:43:00 +0000 (UTC)
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
X-Inumbo-ID: 88d2ec11-3abf-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663882981;
	bh=x4jc0wnmwdJAwHaAgRT6iZPLBKuNELOVbUIBBE1eVQI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ouTWk6vdD/xbEfyuS7mDTRMTJpT3SHwaAxFAdgnbTnh6cRv2ag5GyjzIT2sBqQDdI
	 7OnyFKHhZNF5FUcWKQu5wwjQMrozXY0sD6owZo/G02GD3a612b2kahOiAXCx7Fh4Mr
	 cC7dkZm67BBiR7AWh1NdER9dlXO0dMyEKNPWPu/ZnUhIybm3KGcq3oAYezTFghV0sh
	 j/K4fpDW9+a2ttlXHCXgLfBzY5KJdfbBPilZ6FFp8gbgOLluJ1HCaN89Gns0OkUsDD
	 ytmDqmRAvr6ZLArbR5mC8dT0ZCP3lv6MW1ldPi06azRe1IBfhz1DuP6KuxrTVOUaVm
	 ZJsiCAE/IWvqQ==
Date: Thu, 22 Sep 2022 14:42:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/9] automation: Add randconfig build jobs for arm64
 alpine container
In-Reply-To: <20220922134058.1410-3-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209221442350.65421@ubuntu-linux-20-04-desktop>
References: <20220922134058.1410-1-michal.orzel@amd.com> <20220922134058.1410-3-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Sep 2022, Michal Orzel wrote:
> For arm64 we perform builds using debian and alpine containers.
> We are missing the randconfig build jobs for the latter, so add them.
> This way for each container we have 4 fundamental build jobs:
> - defconfig non-debug/debug
> - randconfig non-debug/debug

Should we have them also for Debian? The patch below looks fine.


> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
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

