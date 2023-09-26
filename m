Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4B27AF6FF
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 01:57:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608587.947178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlHvA-0006jr-MG; Tue, 26 Sep 2023 23:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608587.947178; Tue, 26 Sep 2023 23:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlHvA-0006i9-J7; Tue, 26 Sep 2023 23:56:52 +0000
Received: by outflank-mailman (input) for mailman id 608587;
 Tue, 26 Sep 2023 23:56:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MAuE=FK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qlHv9-0006i2-4Z
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 23:56:51 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59d73920-5cc8-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 01:56:48 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 62F3BCE1774;
 Tue, 26 Sep 2023 23:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E98C433C7;
 Tue, 26 Sep 2023 23:56:40 +0000 (UTC)
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
X-Inumbo-ID: 59d73920-5cc8-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695772601;
	bh=/vKbeZjucJ9ebTT7JCQWondLJx9twIzfz2Q6Gq2xCwo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TSGwKG8uxaNeUCXMCt7RWATFd+Hyb758nBWjeGvES4oeGniI6Z4ULO0/5yc+QutHo
	 nkd/lpwEJD44NIwNt2pEcJhF/E/DvBGXDl7dG0eEcqUHwVCvRA9z2kIgfOyAnkPt72
	 vFc5hkLDQ/Xc2eqZyk6cxTjpYXaFp4KCqStz0W3fk5dU3T7XPmbHrDA6egXmbaMYUr
	 VIu7D1cz8Ykw8noWKENS9jwXbxeJ+ChgngcjlHkD0LlHZJYeZZmef0m23PphIu374L
	 r1tsaWTaLCFoEYlIs2cUPfXqJUrlAsvIctVRfWAv0jQp7iuz2rrYqNHcX25/J5+RMs
	 PGEtKhZGGnP2A==
Date: Tue, 26 Sep 2023 16:56:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Shawn Anastasio <sanastasio@raptorengineering.com>
cc: xen-devel@lists.xenproject.org, 
    Timothy Pearson <tpearson@raptorengineering.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3 1/2] automation: Change build script to use arch
 defconfig
In-Reply-To: <5baa15904c5bb5f8d668c67519ad08293c32982d.1695767747.git.sanastasio@raptorengineering.com>
Message-ID: <alpine.DEB.2.22.394.2309261656320.1403502@ubuntu-linux-20-04-desktop>
References: <cover.1695767747.git.sanastasio@raptorengineering.com> <5baa15904c5bb5f8d668c67519ad08293c32982d.1695767747.git.sanastasio@raptorengineering.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 26 Sep 2023, Shawn Anastasio wrote:
> Change automation build script to call the make defconfig target before
> setting CONFIG_DEBUG and extra options. This fixes issues on Power where
> the build fails without using the ppc64_defconfig.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v3: Drop unnecessary sed.
> 
> v2: No changes.
> 
>  automation/scripts/build | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/scripts/build b/automation/scripts/build
> index b4edcf010e..b3c71fb6fb 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -22,7 +22,10 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
>      # RANDCONFIG implies HYPERVISOR_ONLY
>      HYPERVISOR_ONLY="y"
>  else
> -    echo "CONFIG_DEBUG=${debug}" > xen/.config
> +    # Start off with arch's defconfig
> +    make -C xen defconfig
> +
> +    echo "CONFIG_DEBUG=${debug}" >> xen/.config
> 
>      if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
>          echo "${EXTRA_XEN_CONFIG}" >> xen/.config
> --
> 2.30.2
> 

