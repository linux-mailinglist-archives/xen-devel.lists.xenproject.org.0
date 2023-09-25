Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5045E7AE21D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 01:13:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608198.946544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkulA-0000am-Kr; Mon, 25 Sep 2023 23:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608198.946544; Mon, 25 Sep 2023 23:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkulA-0000Yk-Hi; Mon, 25 Sep 2023 23:13:00 +0000
Received: by outflank-mailman (input) for mailman id 608198;
 Mon, 25 Sep 2023 23:12:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2iti=FJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qkul8-0000Ye-TM
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 23:12:58 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 106b442a-5bf9-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 01:12:57 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 05088B80E80;
 Mon, 25 Sep 2023 23:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C67C433C7;
 Mon, 25 Sep 2023 23:12:55 +0000 (UTC)
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
X-Inumbo-ID: 106b442a-5bf9-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695683576;
	bh=Sxlsx41DxE9mm5pjVm7kGHCvDzwmkR/ToV/bOMDaBMs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oNuXp1xTqMUPLEX5ly5DhXFnNJxInBCZ3QHQ2/GVPPwPjhT/uRtHD+tF0qFLHaf1L
	 W7SLR9SIsEso8R1WEuPwxBIz8PkHKSqRFjqs08QJMPI8oRcT1j2MHmS3uS83N5DUn4
	 BQmK4CHgsm/UCb3pjH9vEZzIdhEz218jnH0UUFr24PVaQ8nhuGKt8y32NCKXXOLOc/
	 jdx5wX6M7ZR1qp9dhl5N0eV/qs5XFKSIgi6NpqIKtzW8n92bJlOkmBEOm3NdXD0d/i
	 2j30NKDTBuIlKnfMeOLkD9SpYFYH8PpuJUN3808h0CKRW10nl96ZIa0hj4TNDxYgOg
	 fbPTpQrFMOQ/Q==
Date: Mon, 25 Sep 2023 16:12:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Shawn Anastasio <sanastasio@raptorengineering.com>
cc: xen-devel@lists.xenproject.org, 
    Timothy Pearson <tpearson@raptorengineering.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 2/3] automation: Change build script to use arch
 defconfig
In-Reply-To: <beb83dd70b15ee6bd896fb26532f5debf955cd48.1695681330.git.sanastasio@raptorengineering.com>
Message-ID: <alpine.DEB.2.22.394.2309251609330.1403502@ubuntu-linux-20-04-desktop>
References: <cover.1695681330.git.sanastasio@raptorengineering.com> <beb83dd70b15ee6bd896fb26532f5debf955cd48.1695681330.git.sanastasio@raptorengineering.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 25 Sep 2023, Shawn Anastasio wrote:
> Change automation build script to call the make defconfig target before
> setting CONFIG_DEBUG and extra options. This fixes issues on Power where
> the build fails without using the ppc64_defconfig.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Reported-by: Jan Beulich <jbeulich@suse.com>

What is the problem specifically? Is the issue that CONFIG_DEBUG enabled
before make olddefconfig causes certain DEBUG options also to default to
yes, and these additional options don't work well on Power?

If that is the case, wouldn't it be better to remove the -debug jobs
until they work well on Power? Or make them allow_failure: true ?


> ---
>  automation/scripts/build | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/scripts/build b/automation/scripts/build
> index b4edcf010e..19dd9e8270 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -22,7 +22,12 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
>      # RANDCONFIG implies HYPERVISOR_ONLY
>      HYPERVISOR_ONLY="y"
>  else
> -    echo "CONFIG_DEBUG=${debug}" > xen/.config
> +    # Start off with arch's defconfig
> +    make -C xen defconfig
> +
> +    # Drop existing CONFIG_DEBUG and replace with value of ${debug}
> +    sed -i 's/^CONFIG_DEBUG=[yn]//g' xen/.config
> +    echo "CONFIG_DEBUG=${debug}" >> xen/.config
> 
>      if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
>          echo "${EXTRA_XEN_CONFIG}" >> xen/.config
> --
> 2.30.2
> 

