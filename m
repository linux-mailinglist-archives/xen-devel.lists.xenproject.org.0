Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CB02509BD
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 22:02:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAIfV-00058U-6x; Mon, 24 Aug 2020 20:02:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/4vD=CC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kAIfU-00058P-IZ
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 20:02:12 +0000
X-Inumbo-ID: 1eb29a85-6a5e-4f11-97f3-1c29390ec7a7
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1eb29a85-6a5e-4f11-97f3-1c29390ec7a7;
 Mon, 24 Aug 2020 20:02:11 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A7A020656;
 Mon, 24 Aug 2020 20:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598299330;
 bh=Y4iNfqWqUQypFEuXsERru34yUTJusnvzChY5XfuXmL0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=jQmq4pGPruR6Gbg/To8FZvaBpksW9KrltnHROLUun+l7tUkyowKQjv9QgLnVNvUpt
 asi08+zwI4IzJXQ8CC/jf23K7rNsA0PVFyduefQZwurP6BQuB1018WgRUhYarmpx/h
 1JkO9gXEZurDDqR3o/6PZhbHq8Prw4x4NdWdMoAg=
Date: Mon, 24 Aug 2020 13:02:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Simon Leiner <simon@leiner.me>, jgross@suse.com
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [Linux] [ARM] Granting memory obtained from the DMA API
In-Reply-To: <025BF4BE-5932-4589-8083-874AE9B1F112@leiner.me>
Message-ID: <alpine.DEB.2.21.2008241257150.24407@sstabellini-ThinkPad-T480s>
References: <32922E87-9F50-41B3-A321-3212697CF7DB@leiner.me>
 <b45a40e3-ea9d-0eef-ea99-88201be83511@xen.org>
 <alpine.DEB.2.21.2008201120260.6005@sstabellini-ThinkPad-T480s>
 <025BF4BE-5932-4589-8083-874AE9B1F112@leiner.me>
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

On Fri, 21 Aug 2020, Simon Leiner wrote:
> On 20.08.20 20:35, Stefano Stabellini wrote:
> > Thank for the well-written analysis of the problem. The following 
> should
> > work to translate the virtual address properly in xenbus_grant_ring:
> > 
> > 	if (is_vmalloc_addr(vaddr))
> > 		page = vmalloc_to_page(vaddr);
> > 	else
> > 		page = virt_to_page(vaddr);
> 
> Great idea, thanks! I modified it lightly (see below) and it did indeed 
> work! I'm wondering though whether the check for vmalloc'd addresses 
> should be included directly in the ARM implementation of virt_to_gfn. 
> As far as I see, this should not break anything, but might impose a 
> small performance overhead in cases where it is known for sure that we 
> are dealing with directly mapped memory. What do you think?

Thanks for testing!

We could ask the relevant maintainers for feedback, but I think it is
probably intended that virt_to_gfn doesn't work on vmalloc addresses.
That's because vmalloc addresses are not typically supposed to be used
like that.



> diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
> index e17ca8156171..d7a97f946f2f 100644
> --- a/drivers/xen/xenbus/xenbus_client.c
> +++ b/drivers/xen/xenbus/xenbus_client.c
> @@ -344,6 +344,21 @@ static void xenbus_switch_fatal(struct xenbus_device *dev, int depth, int err,
>         __xenbus_switch_state(dev, XenbusStateClosing, 1);
>  }
>  
> +/**
> + * vaddr_to_gfn
> + * @vaddr: any virtual address
> + * 
> + * Returns the guest frame number (GFN) corresponding to vaddr.
> + */
> +static inline unsigned long vaddr_to_gfn(void *vaddr)
> +{
> +   if (is_vmalloc_addr(vaddr)) {
> +       return pfn_to_gfn(vmalloc_to_pfn(vaddr));
> +   } else {
> +       return virt_to_gfn(vaddr);
> +   }
> +}
> +

For the same reason as above, I would rather have the check inside
xenbus_grant_ring, rather than above in a generic function:

- if this is a special case the check should be inside xenbus_grant_ring
- if this is not a special case, then the fix should be in virt_to_gfn
  as you mentioned

either way, I wouldn't introduce this function here

Juergen, do you agree with this?


>  /**
>   * xenbus_grant_ring
>   * @dev: xenbus device
> @@ -364,7 +379,7 @@ int xenbus_grant_ring(struct xenbus_device *dev, void *vaddr,
>  
>     for (i = 0; i < nr_pages; i++) {
>         err = gnttab_grant_foreign_access(dev->otherend_id,
> -                         virt_to_gfn(vaddr), 0);
> +                         vaddr_to_gfn(vaddr), 0);
>         if (err < 0) {
>             xenbus_dev_fatal(dev, err,
>                      "granting access to ring page");

