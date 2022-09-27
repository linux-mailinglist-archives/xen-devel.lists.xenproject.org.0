Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A00F5ED06A
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 00:48:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413012.656493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odJMr-0006qd-Hw; Tue, 27 Sep 2022 22:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413012.656493; Tue, 27 Sep 2022 22:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odJMr-0006o6-FC; Tue, 27 Sep 2022 22:47:57 +0000
Received: by outflank-mailman (input) for mailman id 413012;
 Tue, 27 Sep 2022 22:47:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R98P=Z6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1odJMp-0006o0-Ln
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 22:47:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bdca904-3eb6-11ed-9374-c1cf23e5d27e;
 Wed, 28 Sep 2022 00:47:54 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D7FDF61BBD;
 Tue, 27 Sep 2022 22:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7624CC433C1;
 Tue, 27 Sep 2022 22:47:51 +0000 (UTC)
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
X-Inumbo-ID: 6bdca904-3eb6-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664318872;
	bh=zeELk7xar18qPrqlqm4D+GPKvdAP7Bc4vG0Nu9Ixlj8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TVCr27eqennulMFbet5RzZVWaMg4BHEoFf0NJwF2VDjbFS2n6uxxzP55MsJ3GtIB6
	 dGwCPOQNvQrJoM8sMKhOh24UiBGnrBpaPtI5ymrw/KgLu90gwfXItpq3Rgnl/HxY7C
	 XYFwL0ZoJ/F1mF6650XAzj49OPv0f17NFZcg0gCmBqxeOMEESEv0DYfma4thK4qz6q
	 P8TVvBfhCEp7Z7i0IKgypmCGe+71laulTc7bq/bhg/AGXBrWefj6xgRDcVuCqqqFjP
	 Okwew2iVtASUEME9VpX6N91Bk2S7vMLa2mUH5jJutPfsADzOuNcW9MUEPBDWX9MEBg
	 Ksx72vjVktwpA==
Date: Tue, 27 Sep 2022 15:47:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.17] CI: Force CONFIG_XEN_IBT in the buster-gcc-ibt
 test
In-Reply-To: <20220926130213.28274-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2209271545110.922084@ubuntu-linux-20-04-desktop>
References: <20220926130213.28274-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Sep 2022, Andrew Cooper wrote:
> buster-gcc-ibt is a dedicated test to run a not-yet-upstreamed compiler patch
> which is relevant to CONFIG_XEN_IBT in 4.17 and later.
> 
> Force it on, rather than having 50% of the jobs not testing what they're
> supposed to be testing.
> 
> Fixes: 5d59421815d5 ("x86: Use control flow typechecking where possible")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Henry Wang <Henry.Wang@arm.com>
> 
> For 4.17: This is bugfix to CI only, to avoid it producing a false negative.
> Currently, the test intermittently fails to spot the error it was intended to
> identify.  It is very low risk as far as the 4.17 release goes.

Thanks for the patch! Very recently Michal has added a similar
EXTRA_XEN_CONFIG option. If you are OK with it, I'll rename
EXTRA_FIXED_RANDCONFIG to EXTRA_XEN_CONFIG in this patch for
consistency. I can do it on commit.


> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/3084774561#L373 for
> proof that CONFIG_XEN_IBT=y is being fed into allrandom.config
> ---
>  automation/gitlab-ci/build.yaml | 2 ++
>  automation/scripts/build        | 5 +++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 720ce6e07ba0..65e06c858ef3 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -299,6 +299,8 @@ debian-buster-gcc-ibt:
>    variables:
>      CONTAINER: debian:buster-gcc-ibt
>      RANDCONFIG: y
> +    EXTRA_FIXED_RANDCONFIG: |
> +      CONFIG_XEN_IBT=y
>  
>  debian-unstable-clang:
>    extends: .clang-x86-64-build
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 2f15ab3198e6..2d9dd86df904 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -12,6 +12,11 @@ cc-ver()
>  
>  # random config or default config
>  if [[ "${RANDCONFIG}" == "y" ]]; then
> +
> +    # Append job-specific fixed configuration
> +    [[ -n "${EXTRA_FIXED_RANDCONFIG}" ]] &&
> +        echo "${EXTRA_FIXED_RANDCONFIG}" >> xen/tools/kconfig/allrandom.config
> +
>      make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
>      hypervisor_only="y"
>  else
> -- 
> 2.11.0
> 

