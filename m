Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3A025247E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 01:55:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAima-0004Z2-P2; Tue, 25 Aug 2020 23:55:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZfe=CD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kAimZ-0004Yx-3C
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 23:55:15 +0000
X-Inumbo-ID: 54ab456c-8f88-4a03-a996-505c095bdd7c
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54ab456c-8f88-4a03-a996-505c095bdd7c;
 Tue, 25 Aug 2020 23:55:14 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 22A6120738;
 Tue, 25 Aug 2020 23:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598399713;
 bh=A1+LzHi+TzI7hyP4GUV4IExTpswOr0zHeDrlS7gJKAY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=e+KRF+CiCJL1rEtLtgMqXvG7QpalqZDNdOlTbGbOZzz9FT3E+rumByBTTOOAFcGFf
 aduv3OmJcKCKcFemsuN8r6eF8y41/eDQtibvm2f52RtKOq5rpN32fm8B6M+KAVQZr8
 eVyvJMkqUqO53BAwYWUiT7fRudi8MBdwDIslvRIY=
Date: Tue, 25 Aug 2020 16:55:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Simon Leiner <simon@leiner.me>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, jgross@suse.com, 
 julien@xen.org
Subject: Re: [PATCH 1/2] xen/xenbus: Fix granting of vmalloc'd memory
In-Reply-To: <20200825093153.35500-1-simon@leiner.me>
Message-ID: <alpine.DEB.2.21.2008251655020.24407@sstabellini-ThinkPad-T480s>
References: <Aw: [Linux] [ARM] Granting memory obtained from the DMA API>
 <20200825093153.35500-1-simon@leiner.me>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 25 Aug 2020, Simon Leiner wrote:
> On some architectures (like ARM), virt_to_gfn cannot be used for
> vmalloc'd memory because of its reliance on virt_to_phys. This patch
> introduces a check for vmalloc'd addresses and obtains the PFN using
> vmalloc_to_pfn in that case.
> 
> Signed-off-by: Simon Leiner <simon@leiner.me>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  drivers/xen/xenbus/xenbus_client.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
> index 786fbb7d8be0..907bcbb93afb 100644
> --- a/drivers/xen/xenbus/xenbus_client.c
> +++ b/drivers/xen/xenbus/xenbus_client.c
> @@ -379,8 +379,14 @@ int xenbus_grant_ring(struct xenbus_device *dev, void *vaddr,
>  	int i, j;
>  
>  	for (i = 0; i < nr_pages; i++) {
> -		err = gnttab_grant_foreign_access(dev->otherend_id,
> -						  virt_to_gfn(vaddr), 0);
> +		unsigned long gfn;
> +
> +		if (is_vmalloc_addr(vaddr))
> +			gfn = pfn_to_gfn(vmalloc_to_pfn(vaddr));
> +		else
> +			gfn = virt_to_gfn(vaddr);
> +
> +		err = gnttab_grant_foreign_access(dev->otherend_id, gfn, 0);
>  		if (err < 0) {
>  			xenbus_dev_fatal(dev, err,
>  					 "granting access to ring page");
> -- 
> 2.24.3 (Apple Git-128)
> 

