Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA319417E6D
	for <lists+xen-devel@lfdr.de>; Sat, 25 Sep 2021 01:51:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195712.348537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTuyW-0006Zx-Ka; Fri, 24 Sep 2021 23:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195712.348537; Fri, 24 Sep 2021 23:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTuyW-0006Y9-G8; Fri, 24 Sep 2021 23:51:28 +0000
Received: by outflank-mailman (input) for mailman id 195712;
 Fri, 24 Sep 2021 23:51:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTuyU-0006Y3-M6
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 23:51:26 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81b02602-c84c-472e-8247-e0e2a2d6a9ea;
 Fri, 24 Sep 2021 23:51:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D43D161250;
 Fri, 24 Sep 2021 23:51:24 +0000 (UTC)
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
X-Inumbo-ID: 81b02602-c84c-472e-8247-e0e2a2d6a9ea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632527485;
	bh=Ack5/UqmxYXHPfI3KCJ5he7bOUsz5tmrXD9+cyyP6tg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NInlFZupMSFB4HG+w5qSVF5rQ4onuU73MBj6w5rFPjvyE4jzXkkaUwntDMVowlvOC
	 h8F+5UcZCfi3KD+uWQoFrWL1Il94BCebrsw9wiybtcRfGJFhP4IHiJgBPRGL+20TBW
	 Im2IYifGbjiTS0sYvw18EeXBgmfsfqTymg40h6DEPRoYPgg/JMPh54WFR30TPakkRo
	 Zodw4MTDX9sB2zhuSZ3aQEXvmjJiBtnA+causraesMyCM6m/7YM8XJuBiC0j8TBCoA
	 REwhUrqwaMEhc7nV21szgkGkA2whu2DDtK4Osh2PTKLZBjrz7AseMJ4zzAAfRMAYQD
	 RHXmExOjU3oaw==
Date: Fri, 24 Sep 2021 16:51:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v2 04/11] xen/device-tree: Make dt_find_node_by_phandle
 global
In-Reply-To: <20210923125438.234162-5-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109241649000.17979@sstabellini-ThinkPad-T480s>
References: <20210923125438.234162-1-andr2000@gmail.com> <20210923125438.234162-5-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Make dt_find_node_by_phandle globally visible, so it can be re-used by
> other frameworks.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/device_tree.c      | 2 +-
>  xen/include/xen/device_tree.h | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index ea93da1725f6..4aae281e89bf 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -1047,7 +1047,7 @@ int dt_for_each_range(const struct dt_device_node *dev,
>   *
>   * Returns a node pointer.
>   */
> -static struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle)
> +struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle)
>  {
>      struct dt_device_node *np;
>  
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 9069040ef7f7..3334048d3bb5 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -850,6 +850,8 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
>   */
>  int dt_get_pci_domain_nr(struct dt_device_node *node);
>  
> +struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
> +
>  #ifdef CONFIG_DEVICE_TREE_DEBUG
>  #define dt_dprintk(fmt, args...)  \
>      printk(XENLOG_DEBUG fmt, ## args)
> -- 
> 2.25.1
> 

