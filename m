Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC2F41BEF6
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 08:09:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198625.352207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVSmE-0003BP-Ok; Wed, 29 Sep 2021 06:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198625.352207; Wed, 29 Sep 2021 06:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVSmE-00038D-KN; Wed, 29 Sep 2021 06:09:10 +0000
Received: by outflank-mailman (input) for mailman id 198625;
 Wed, 29 Sep 2021 06:09:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=arYX=OT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mVSmD-00037k-9O
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 06:09:09 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39b977f4-5401-44a2-b89b-097d376cf577;
 Wed, 29 Sep 2021 06:09:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B31D46124B;
 Wed, 29 Sep 2021 06:09:07 +0000 (UTC)
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
X-Inumbo-ID: 39b977f4-5401-44a2-b89b-097d376cf577
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632895747;
	bh=eb2qUmJqXqj9nrH6P/sXBPB9SqhnS3wPQqwTvxUa4yk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tqalPHkFnEAVfGaJXy14dSAMysoCU45POOYIg8ZwOOCo1inQKYQ0hhc94zglPW6Mi
	 fEOXH9Q9XPIPepjYSfm95K45N9aEinzNcexg4lNBidtEJh0fTff0jJBIp96aOWUBNk
	 hj4bxv1onOjz0Nqw93WK+U24e2yEUGLmwMaLUym8h+7VTuRAtgmcp9sS9LAkhYMaUr
	 zAyZvCaRj3gLZ9D+7pKR4TznHttkof6KevJoDJ/Cke9SgoBbmvc3SXripXwSd6cXRf
	 4NObRbzvhKdDS0aYZ997GT5+3l5i39XCEN7mnPQydevm8YcKkXKXaZGW9MQXigJfpA
	 Y0tPTAgeTdTug==
Date: Tue, 28 Sep 2021 23:09:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Andre.Przywara@arm.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 08/17] xen/device-tree: Add dt_get_pci_domain_nr
 helper
In-Reply-To: <f70ac215cd0c62d71231b8f61f12c1f8d801710e.1632847120.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109281621310.5022@sstabellini-ThinkPad-T480s>
References: <cover.1632847120.git.rahul.singh@arm.com> <f70ac215cd0c62d71231b8f61f12c1f8d801710e.1632847120.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Sep 2021, Rahul Singh wrote:
> Based Linux commit 41e5c0f81d3e676d671d96a0a1fafb27abfbd9d7
> 
> Import the Linux helper of_get_pci_domain_nr. This function will try to
> obtain the host bridge domain number by finding a property called
> "linux,pci-domain" of the given device node.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Change in v3:
> - Modify commit message to include upstream Linux commit-id not stable
>   Linux commit-id
> - Remove return value as those are not valid for XEN
> Change in v2: Patch introduced in v2
> ---
>  xen/common/device_tree.c      | 12 ++++++++++++
>  xen/include/xen/device_tree.h | 17 +++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 53160d61f8..ea93da1725 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -2183,6 +2183,18 @@ void __init dt_unflatten_host_device_tree(void)
>      dt_alias_scan();
>  }
>  
> +int dt_get_pci_domain_nr(struct dt_device_node *node)
> +{
> +    u32 domain;
> +    int error;
> +
> +    error = dt_property_read_u32(node, "linux,pci-domain", &domain);
> +    if ( !error )
> +        return -EINVAL;
> +
> +    return (u16)domain;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 3ffe3eb3d2..2297c59ce6 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -832,6 +832,23 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
>                                 const char *list_name,
>                                 const char *cells_name);
>  
> +/**
> + * dt_get_pci_domain_nr - Find the host bridge domain number
> + *            of the given device node.
> + * @node: Device tree node with the domain information.
> + *
> + * This function will try to obtain the host bridge domain number by finding
> + * a property called "linux,pci-domain" of the given device node.
> + *
> + * Return:
> + * * > 0    - On success, an associated domain number.
> + * * -EINVAL    - The property "linux,pci-domain" does not exist.
> + *
> + * Returns the associated domain number from DT in the range [0-0xffff], or
> + * a negative value if the required property is not found.
> + */
> +int dt_get_pci_domain_nr(struct dt_device_node *node);
> +
>  #ifdef CONFIG_DEVICE_TREE_DEBUG
>  #define dt_dprintk(fmt, args...)  \
>      printk(XENLOG_DEBUG fmt, ## args)
> -- 
> 2.17.1
> 

