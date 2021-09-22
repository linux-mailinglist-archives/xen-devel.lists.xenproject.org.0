Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEAB415438
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 01:50:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193193.344104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTC0J-0005r2-Kc; Wed, 22 Sep 2021 23:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193193.344104; Wed, 22 Sep 2021 23:50:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTC0J-0005oz-HY; Wed, 22 Sep 2021 23:50:19 +0000
Received: by outflank-mailman (input) for mailman id 193193;
 Wed, 22 Sep 2021 23:50:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTC0I-0005ot-5u
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 23:50:18 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6409e82-1bff-11ec-b9f3-12813bfff9fa;
 Wed, 22 Sep 2021 23:50:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2EECE61131;
 Wed, 22 Sep 2021 23:50:16 +0000 (UTC)
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
X-Inumbo-ID: d6409e82-1bff-11ec-b9f3-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632354616;
	bh=zJ3WjaxN2JEd2pJJPs4Gnnct7HIdWR52lI2GSPP+WLE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oJSmAMxa7gzi9zCa0oLEOKeUvFaJRnGSedKeD8Wwl6kMSUv6FadQZrM1J3iL5YGU4
	 hM4/iLN+I/JWkYBJ46Lig3jnskWa84rKnquadlZildMSG7RnvKEqqnEGWJwmAYwjjt
	 /o69tZt09JZIhh7qLVRfoqDpz7n2KdAquzTDvGZ6cPU+KN9SSBoUTbib0jZI+pOyFn
	 7E+Bj/6yzMa2vDcGIy3uLyAugoqNOzk4I0bH+Flg8lHVca0T4m/qJq5uU68C+aXPrP
	 Y12ujGBaFb/a0h1D8Iaqe3V4jyPj3cLI5IInKw/B9+dSeaDndmO6/hw4eako76baJM
	 xB+WSnUH5EMLg==
Date: Wed, 22 Sep 2021 16:50:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    andre.przywara@arm.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 08/17] xen/device-tree: Add dt_get_pci_domain_nr
 helper
In-Reply-To: <b649f9f978ed38f05927573381e23f9b3c6c24b8.1632307952.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109221649260.17979@sstabellini-ThinkPad-T480s>
References: <cover.1632307952.git.rahul.singh@arm.com> <b649f9f978ed38f05927573381e23f9b3c6c24b8.1632307952.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Sep 2021, Rahul Singh wrote:
> Based on tag Linux v5.14.2 commit bbdd3de144fc142f2f4b9834c9241cc4e7f3d3fc

Please use an upstream commit id


> Import the Linux helper of_get_pci_domain_nr. This function will try to
> obtain the host bridge domain number by finding a property called
> "linux,pci-domain" of the given device node.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Change in v2: Patch introduced in v2
> ---
>  xen/common/device_tree.c      | 12 ++++++++++++
>  xen/include/xen/device_tree.h | 19 +++++++++++++++++++
>  2 files changed, 31 insertions(+)
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
> index 497144b8a7..9069040ef7 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -831,6 +831,25 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
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
> + * * -ENODATA   - The linux,pci-domain" property does not have value.
> + * * -EOVERFLOW - Invalid "linux,pci-domain" property value.

This doesn't match reality for us because it can only return EINVAL


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

