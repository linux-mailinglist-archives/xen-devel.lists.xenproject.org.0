Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DA07AE20B
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 01:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608192.946533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkudZ-0006Ge-Ua; Mon, 25 Sep 2023 23:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608192.946533; Mon, 25 Sep 2023 23:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkudZ-0006Cj-Rh; Mon, 25 Sep 2023 23:05:09 +0000
Received: by outflank-mailman (input) for mailman id 608192;
 Mon, 25 Sep 2023 23:05:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2iti=FJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qkudY-0005Z6-Fu
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 23:05:08 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f68067cb-5bf7-11ee-9b0d-b553b5be7939;
 Tue, 26 Sep 2023 01:05:06 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7070DCE1170;
 Mon, 25 Sep 2023 23:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70766C433C8;
 Mon, 25 Sep 2023 23:04:59 +0000 (UTC)
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
X-Inumbo-ID: f68067cb-5bf7-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695683100;
	bh=6OcRC5HCbr53WNPU+ciHzZDiuB1z9Gpd+5+g13ZxC3A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=u6ZvLVhK71OnSo1Rlbnr8WTF7nYSHnBaErax9NzwR14zkiE2Zn1YMpNU3fkPAcH64
	 ZM9tbkSJXmLQRpqiyCvxgiIjb2+ofT7JJXSB1HD5rClmbPoT/4vFmGWEDI/5Fa8UnM
	 ChtzfTOPcYWD2fulyhZHByiYcVNfGM3AOGCbTSbO2sHIsHwcXkfYMBSI5t6i5NDiui
	 sWbtV8dKU5fE1HP8fHKQFVViPVhUU9LEoe3cApsvJtLhPZmHWGUX17tzVVOR/SnSw2
	 W9Aoq+ZcTB3Y7QF7tGW5Z8wlGTm8UqU/ycd2GfCDDV6djJFgMZX8PcIsLRSga5yCTa
	 lqxTTDb09Xz0Q==
Date: Mon, 25 Sep 2023 16:04:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Shawn Anastasio <sanastasio@raptorengineering.com>
cc: xen-devel@lists.xenproject.org, 
    Timothy Pearson <tpearson@raptorengineering.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Henry.Wang@arm.com
Subject: Re: [PATCH 3/3] xen/common: Add NUMA node id bounds check to
 page_alloc.c/node_to_scrub
In-Reply-To: <a47962a573eab38991a8aa3e09ca6b8bd3193b6c.1695681330.git.sanastasio@raptorengineering.com>
Message-ID: <alpine.DEB.2.22.394.2309251601140.1403502@ubuntu-linux-20-04-desktop>
References: <cover.1695681330.git.sanastasio@raptorengineering.com> <a47962a573eab38991a8aa3e09ca6b8bd3193b6c.1695681330.git.sanastasio@raptorengineering.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Adding Henry as this issue is currently causing gitlab-ci failures. I
think we should fix it as soon as possible to get clearer results for
the 4.18 release. (This comment applies to the rest of the series as
well).


On Mon, 25 Sep 2023, Shawn Anastasio wrote:
> When building for Power with CONFIG_DEBUG unset, a compiler error gets
> raised inside page_alloc.c's node_to_scrub function, likely due to the
> increased optimization level:
> 
> common/page_alloc.c: In function 'node_to_scrub.part.0':
> common/page_alloc.c:1217:29: error: array subscript 1 is above array
>             bounds of 'long unsigned int[1]' [-Werror=array-bounds]
>  1217 |         if ( node_need_scrub[node] )
> 
> It appears that this is a false positive, given that in practice
> cycle_node should never return a node ID >= MAX_NUMNODES as long as the
> architecture's node_online_map is properly defined and initialized, so
> this additional bounds check is only to satisfy GCC.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/page_alloc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 35d9a26fa6..6df2a223e1 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1211,6 +1211,9 @@ static unsigned int node_to_scrub(bool get_node)
>          } while ( !cpumask_empty(&node_to_cpumask(node)) &&
>                    (node != local_node) );
> 
> +        if ( node >= MAX_NUMNODES )
> +            break;
> +
>          if ( node == local_node )
>              break;
> 
> --
> 2.30.2
> 

