Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C96864073D5
	for <lists+xen-devel@lfdr.de>; Sat, 11 Sep 2021 01:25:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184857.333642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOpt8-0007yY-9m; Fri, 10 Sep 2021 23:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184857.333642; Fri, 10 Sep 2021 23:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOpt8-0007vY-5l; Fri, 10 Sep 2021 23:24:54 +0000
Received: by outflank-mailman (input) for mailman id 184857;
 Fri, 10 Sep 2021 23:24:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGUI=OA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOpt6-0007vS-Am
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 23:24:52 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a4bbb8e-2ce2-43b6-bc67-2d47e65c4c97;
 Fri, 10 Sep 2021 23:24:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CFE1D61167;
 Fri, 10 Sep 2021 23:24:50 +0000 (UTC)
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
X-Inumbo-ID: 8a4bbb8e-2ce2-43b6-bc67-2d47e65c4c97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631316291;
	bh=EH4b4wOqgmR5fMb5cwT0NEac+L5t0raAiWP84suO8JA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=smsy9tlu9CPSDn4fKjl46u3jjfq2R3njFi5e6jxWnldXvJHvGzQuMXnKBS5huhkpu
	 UH0VszBrYKYtR7yu7SoXbE03cDE9F2V8w96d535j2SuQBcWf+r5Jy3JubwD53wYzh7
	 YZyBepcZw2vZH+dRSiTXJDf7UKR4l3IpTt8R9MOwWQlAPVkfb+tSEe9+v+bceD06qx
	 M63ZxeL+/06x2IfWAJXY5tYhUtpERojIx+a5wncFAAkDjMFUZY5XrzJtbrtecUwPrH
	 0LbIow+aLPOKBEZ+gHjKyAbQGzjor6Pmm7diWflLvgc6aDn6EoCCtPAGtOzVMBoZ51
	 68yjfbrauu0/w==
Date: Fri, 10 Sep 2021 16:24:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Juergen Gross <jgross@suse.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    lkml <linux-kernel@vger.kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 07/12] swiotlb-xen: drop leftover __ref
In-Reply-To: <7cd163e1-fe13-270b-384c-2708e8273d34@suse.com>
Message-ID: <alpine.DEB.2.21.2109101624431.10523@sstabellini-ThinkPad-T480s>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com> <7cd163e1-fe13-270b-384c-2708e8273d34@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Sep 2021, Jan Beulich wrote:
> Commit a98f565462f0 ("xen-swiotlb: split xen_swiotlb_init") should not
> only have added __init to the split off function, but also should have
> dropped __ref from the one left.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -154,7 +154,7 @@ static const char *xen_swiotlb_error(enu
>  
>  #define DEFAULT_NSLABS		ALIGN(SZ_64M >> IO_TLB_SHIFT, IO_TLB_SEGSIZE)
>  
> -int __ref xen_swiotlb_init(void)
> +int xen_swiotlb_init(void)
>  {
>  	enum xen_swiotlb_err m_ret = XEN_SWIOTLB_UNKNOWN;
>  	unsigned long bytes = swiotlb_size_or_default();
> 

