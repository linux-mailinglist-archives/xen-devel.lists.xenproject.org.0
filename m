Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C01A728A3
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 03:11:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928420.1331133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txchv-0000HV-NF; Thu, 27 Mar 2025 02:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928420.1331133; Thu, 27 Mar 2025 02:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txchv-0000FJ-Ji; Thu, 27 Mar 2025 02:10:59 +0000
Received: by outflank-mailman (input) for mailman id 928420;
 Thu, 27 Mar 2025 02:10:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SxjK=WO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1txchu-0000FB-FU
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 02:10:58 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b74623c5-0ab0-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 03:10:56 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0DC8F61161;
 Thu, 27 Mar 2025 02:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D8BC4CEE2;
 Thu, 27 Mar 2025 02:10:53 +0000 (UTC)
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
X-Inumbo-ID: b74623c5-0ab0-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743041454;
	bh=n8nunGwFKW2BRd716thzDPCmgW4xhACIDhXx6ZW6sYU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sxJloY8360ZyQfGOnhW0ZP1vW85cH7j3xM42d/HKA3BH06agcMG30NtyK85pKEcum
	 FDUWm63GwkxvMFGlzNMrCvhph2jhogfhEfGUFoGrigA6q+dt1VnDdCewaqfzdsD4E6
	 m7QzQls2p8W8+1RxF4ARkvV7hHVnysUD/tYxpVWbQB6eWu0yeaQkV5obMVm8ZAKuxL
	 ilL0bwMqdXhYiZGUPKFtZx1hHEHj8ReICxg4RCjq3zpN9oiO53JHSOFmudkrLIWwlN
	 x/OVLNkxwoIDItZE60DfdiJX4tQLeR5oUBuivU/E9UxuUNIhNovk1F5xp07igroELM
	 ZzXZqWwAX18GQ==
Date: Wed, 26 Mar 2025 19:10:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@vates.tech>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] automation: Avoid changing source files for randconfig
 tests
In-Reply-To: <20250326142754.5441-1-anthony.perard@vates.tech>
Message-ID: <alpine.DEB.2.22.394.2503261910100.563920@ubuntu-linux-20-04-desktop>
References: <20250326142754.5441-1-anthony.perard@vates.tech>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Mar 2025, Anthony PERARD wrote:
> We should avoid changing files from the source tree if we don't intend
> to commit the result.
> 
> We don't really need to check if $EXTRA_FIXED_RANDCONFIG is empty so
> add it to the temporary file in all cases.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> ---
>  automation/scripts/build | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 522efe774e..8a3b8fb6b2 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -12,12 +12,12 @@ $cc --version
>  # random config or default config
>  if [[ "${RANDCONFIG}" == "y" ]]; then
>  
> -    # Append job-specific fixed configuration
> -    if [[ -n "${EXTRA_FIXED_RANDCONFIG}" ]]; then
> -        echo "${EXTRA_FIXED_RANDCONFIG}" >> xen/tools/kconfig/allrandom.config
> -    fi
> +    cp -f xen/tools/kconfig/allrandom.config xen/allrandom.config.tmp

Wouldn't it be better to use mktemp?

local tmpconfig=$(mktemp)
cp -f xen/tools/kconfig/allrandom.config $tmpconfig


> -    make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
> +    # Append job-specific fixed configuration
> +    echo "${EXTRA_FIXED_RANDCONFIG}" >> xen/allrandom.config.tmp
> +
> +    make -j$(nproc) -C xen KCONFIG_ALLCONFIG=allrandom.config.tmp randconfig
>  
>      # RANDCONFIG implies HYPERVISOR_ONLY
>      HYPERVISOR_ONLY="y"
> -- 
> 
> 
> Anthony Perard | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech
> 

