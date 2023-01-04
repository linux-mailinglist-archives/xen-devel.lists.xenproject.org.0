Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0441165E117
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 00:47:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471544.731431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDDTX-0007Xr-CD; Wed, 04 Jan 2023 23:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471544.731431; Wed, 04 Jan 2023 23:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDDTX-0007VC-9Q; Wed, 04 Jan 2023 23:47:15 +0000
Received: by outflank-mailman (input) for mailman id 471544;
 Wed, 04 Jan 2023 23:47:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eMRm=5B=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pDDTV-0007SD-Lv
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 23:47:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b2d6673-8c8a-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 00:47:11 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4EF6A6187C;
 Wed,  4 Jan 2023 23:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FBF5C433D2;
 Wed,  4 Jan 2023 23:47:08 +0000 (UTC)
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
X-Inumbo-ID: 1b2d6673-8c8a-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672876029;
	bh=AZmbvsghGNSym+NrkscJbs9ahmzLtFbFNacMjbGYpbo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MOaeIY2A/RZ7PfRSiRQV+AgR6jgq7o7btLpGBsmnc/L7qfU/t3Amws5Vryaxdg15l
	 cjgKdLMT9T1HLTr1UdmdX8LshhkFY49kSRUO1zIRcsh1S93223IqS+YxsMIkODOxOo
	 CuBz0UknlgLr38DRhFIeoz3HrJm8nG/DXMOFbIXbPmqGbH3qLfwutEtTtn1pVfvKOC
	 +awgPZLeVQD2Q775dnbPoEIiwa3rd9hvTWLSDKtuMnwHCzQPPY/6SXT3bcKi/d/pHU
	 aKKHnTrUtCPKevWKNr5dn8Pc891tlOmpxl/7SG9mkZZeOn6b1aRWgXudMgetsfqqmS
	 FEqYEkBl5IyZg==
Date: Wed, 4 Jan 2023 15:47:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: Add 0x prefix when printing memory size in
 construct_domU
In-Reply-To: <20230103102519.26224-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301041546230.4079@ubuntu-linux-20-04-desktop>
References: <20230103102519.26224-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Jan 2023, Michal Orzel wrote:
> Printing memory size in hex without 0x prefix can be misleading, so
> add it. Also, take the opportunity to adhere to 80 chars line length
> limit by moving the printk arguments to the next line.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Changes in v2:
>  - was: "Print memory size in decimal in construct_domU"
>  - stick to hex but add a 0x prefix
>  - adhere to 80 chars line length limit

Honestly I prefer decimal but also hex is fine. I'll let Julien pick the
version of this patch that he prefers.


> ---
>  xen/arch/arm/domain_build.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 829cea8de84f..f35f4d24569c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3774,7 +3774,8 @@ static int __init construct_domU(struct domain *d,
>      if ( rc != 0 )
>          return rc;
>  
> -    printk("*** LOADING DOMU cpus=%u memory=%"PRIx64"KB ***\n", d->max_vcpus, mem);
> +    printk("*** LOADING DOMU cpus=%u memory=%#"PRIx64"KB ***\n",
> +           d->max_vcpus, mem);
>  
>      kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
>  
> -- 
> 2.25.1
> 

