Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1266059A840
	for <lists+xen-devel@lfdr.de>; Sat, 20 Aug 2022 00:18:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390513.628013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPAKA-0001EW-M7; Fri, 19 Aug 2022 22:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390513.628013; Fri, 19 Aug 2022 22:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPAKA-0001Bv-Iw; Fri, 19 Aug 2022 22:18:42 +0000
Received: by outflank-mailman (input) for mailman id 390513;
 Fri, 19 Aug 2022 22:18:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1Kg=YX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oPAK9-0001Bn-9z
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 22:18:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0713810-200c-11ed-9250-1f966e50362f;
 Sat, 20 Aug 2022 00:18:40 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 42A35617D0;
 Fri, 19 Aug 2022 22:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2CBC433B5;
 Fri, 19 Aug 2022 22:18:37 +0000 (UTC)
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
X-Inumbo-ID: e0713810-200c-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660947517;
	bh=giFTNBRCN8N0RwSfhwcMP/DCeImi1X46c2STxFkwiTM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VxoT9hwTRsGscfpQJkvd++QvtOl+Th9yCkYUQvmr440/uPEkd1Bh9WSX2yxn6iWEP
	 MRLVNiTwQSQykc3kcd3CgQwWuFApGzXvCyIzemOpr9Wls+io2q5VWuLg1CZo9O6v9b
	 jYrH2qiL72z5+jCy0Dc70AckTHN2xMbA98uFJyanv7z8IBck9psGSZolQTV/Q+DmHL
	 PgwdB0PdKn6Ash1fy/dhH6F45SeubN1+LJsSG8yQKOoiFrYz95vSLSd1fAdnoZrdTr
	 wTK4ljaXwaXsbJ0yEmDN1MejvgrJPsP6XbGiAu2xrBHsRHeI1Iz2Q3peYvnrym96UF
	 bm3p9IAYCODog==
Date: Fri, 19 Aug 2022 15:18:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 6/7] xen/arm: processor: Fix MISRA C 2012 Rule 20.7
 violations
In-Reply-To: <20220819194359.1196539-7-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2208191517520.3790@ubuntu-linux-20-04-desktop>
References: <20220819194359.1196539-1-burzalodowa@gmail.com> <20220819194359.1196539-7-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Aug 2022, Xenia Ragiadakou wrote:
> In macros MPIDR_LEVEL_SHIFT() and MPIDR_AFFINITY_LEVEL(), add parentheses
> around the macro parameters 'level' and 'mpidr', respectively, to prevent
> against unintended expansions.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/include/asm/processor.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index 55f56b33bc..1dd81d7d52 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -127,10 +127,10 @@
>  #define MPIDR_LEVEL_MASK        ((1 << MPIDR_LEVEL_BITS) - 1)
>  
>  #define MPIDR_LEVEL_SHIFT(level) \
> -         (((1 << level) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
> +         (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
>  
>  #define MPIDR_AFFINITY_LEVEL(mpidr, level) \
> -         ((mpidr >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
> +         (((mpidr) >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
>  
>  #define AFFINITY_MASK(level)    ~((_AC(0x1,UL) << MPIDR_LEVEL_SHIFT(level)) - 1)
>  
> -- 
> 2.34.1
> 

