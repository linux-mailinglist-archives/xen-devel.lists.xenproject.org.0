Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D10765E110
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 00:43:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471529.731410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDDOI-0006N4-I2; Wed, 04 Jan 2023 23:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471529.731410; Wed, 04 Jan 2023 23:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDDOI-0006LG-FL; Wed, 04 Jan 2023 23:41:50 +0000
Received: by outflank-mailman (input) for mailman id 471529;
 Wed, 04 Jan 2023 23:41:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eMRm=5B=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pDDOG-0006LA-LP
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 23:41:48 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5962f51e-8c89-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 00:41:46 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 21156B81916;
 Wed,  4 Jan 2023 23:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2924C433F0;
 Wed,  4 Jan 2023 23:41:42 +0000 (UTC)
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
X-Inumbo-ID: 5962f51e-8c89-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672875703;
	bh=Pn1GRpPj68jTuNTIPUm9liY//bIbQe9ac+YPKX51frY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T87xF5b90qc4fUXNB01GaoNNftjiBJ3x9vHzXdC4jCkZfY/k7PJO77JC7V/Umjvpl
	 dm+JFEQJaCu9bKiQIMw9p0ZZo/+XUZ69O9Ij2vfnSkXMfw+z6TIQIf6xY9C5dH+ifa
	 lLn/h5uHFR5Xgu1GgNDxiYFukww0nFVOHJ4Jir4/pTpApIUCOTjW2nL2r1x8ihTMhU
	 5kZQAVsBYppF1PXUtd73QgYMQfyETCzean+EFaKuc1nYOibbod5xSAwTx5zX0ASg2c
	 1htKIFymfFYeMwC7BtsPfvuSsk6D03fnJw12Eu0OnUMDWkKdUrCqwpIohYb9HGyYkN
	 plqc0LDzl48iQ==
Date: Wed, 4 Jan 2023 15:41:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Print memory size in decimal in
 construct_domU
In-Reply-To: <20230102144904.17619-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301041541260.4079@ubuntu-linux-20-04-desktop>
References: <20230102144904.17619-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 2 Jan 2023, Michal Orzel wrote:
> Printing domain's memory size in hex without even prepending it
> with 0x is not very useful and can be misleading. Switch to decimal
> notation.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/domain_build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 829cea8de84f..7e204372368c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3774,7 +3774,7 @@ static int __init construct_domU(struct domain *d,
>      if ( rc != 0 )
>          return rc;
>  
> -    printk("*** LOADING DOMU cpus=%u memory=%"PRIx64"KB ***\n", d->max_vcpus, mem);
> +    printk("*** LOADING DOMU cpus=%u memory=%"PRIu64"KB ***\n", d->max_vcpus, mem);
>  
>      kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
>  
> -- 
> 2.25.1
> 

