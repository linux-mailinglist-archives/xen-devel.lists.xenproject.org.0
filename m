Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037AB5031D5
	for <lists+xen-devel@lfdr.de>; Sat, 16 Apr 2022 01:11:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305951.521094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfV5A-0003Co-1Y; Fri, 15 Apr 2022 23:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305951.521094; Fri, 15 Apr 2022 23:10:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfV59-0003Ax-Uv; Fri, 15 Apr 2022 23:10:27 +0000
Received: by outflank-mailman (input) for mailman id 305951;
 Fri, 15 Apr 2022 23:10:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nfV58-0003Ar-Cg
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 23:10:26 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b08c5ef-bd11-11ec-a405-831a346695d4;
 Sat, 16 Apr 2022 01:10:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0E395B831B8;
 Fri, 15 Apr 2022 23:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB6AC385A4;
 Fri, 15 Apr 2022 23:10:22 +0000 (UTC)
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
X-Inumbo-ID: 3b08c5ef-bd11-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650064222;
	bh=A0u2cdRoH5YJkFMFzhOSuqQn+v7uguDxOgX08aD0OkA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XALcqqZEix5pd5JP/seGq02aBaIzPalksoATaduJHVL3YuSrcAQWy4qKD593yP7lB
	 Ih8PVm1ZjG1JolNnj60XWRF/Xsr5ctiwzYKeXp1lLJ/hdmi7pncwKj+y58y7wCXn2G
	 QXERrMdeEIIhLt2ESMTFtf5M4hRRyZCJqPMDV3vlk0gcKia+CezDpZvMsn1HThxZFV
	 mIwIFZ+ULpqgfkHy8y7sVXshlA2equRnq7nGu7ydNDNCSStH2Lb207ietC6UWkHnbY
	 rdpVGZkmQcrhJqEJFrra/5HmbtW3jACZ7wE4XXAT8iiPsUjWG7mko6rXgOJU/YIKRW
	 /1mm9icoYmzYQ==
Date: Fri, 15 Apr 2022 16:10:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Make use of DT_MATCH_TIMER in make_timer_node
In-Reply-To: <20220414095843.102305-1-michal.orzel@arm.com>
Message-ID: <alpine.DEB.2.22.394.2204151609140.915916@ubuntu-linux-20-04-desktop>
References: <20220414095843.102305-1-michal.orzel@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Apr 2022, Michal Orzel wrote:
> DT_MATCH_TIMER stores the compatible timer ids and as such should be
> used in all the places where we need to refer to them. make_timer_node
> explicitly lists the same ids as the ones defined in DT_MATCH_TIMER so
> make use of this macro instead.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

This is a good cleanup, thanks! time.h is not currently included by
domain_build.c, I think we should add:

#include <asm/time.h>

to domain_build.c 


> ---
>  xen/arch/arm/domain_build.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 8be01678de..1472ca4972 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1672,8 +1672,7 @@ static int __init make_timer_node(const struct kernel_info *kinfo)
>      void *fdt = kinfo->fdt;
>      static const struct dt_device_match timer_ids[] __initconst =
>      {
> -        DT_MATCH_COMPATIBLE("arm,armv7-timer"),
> -        DT_MATCH_COMPATIBLE("arm,armv8-timer"),
> +        DT_MATCH_TIMER,
>          { /* sentinel */ },
>      };
>      struct dt_device_node *dev;
> -- 
> 2.25.1
> 

