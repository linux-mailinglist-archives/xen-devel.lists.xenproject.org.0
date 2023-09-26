Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F357AF5A1
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 23:15:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608533.947070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlFOK-0008TW-2r; Tue, 26 Sep 2023 21:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608533.947070; Tue, 26 Sep 2023 21:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlFOJ-0008Qq-Uj; Tue, 26 Sep 2023 21:14:47 +0000
Received: by outflank-mailman (input) for mailman id 608533;
 Tue, 26 Sep 2023 21:14:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MAuE=FK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qlFOI-0008Qk-EE
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 21:14:46 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b692f1b6-5cb1-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 23:14:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 6A847B8122A;
 Tue, 26 Sep 2023 21:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72834C433BF;
 Tue, 26 Sep 2023 21:14:41 +0000 (UTC)
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
X-Inumbo-ID: b692f1b6-5cb1-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695762882;
	bh=vo2Im/iz+wh85Pl4S3lBcx8aJzPZPulU4z36GHMBHzU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iIggtdISM8DlV5y/b3qL68kOMipsgLSGiHqKv3C8N/J1vnNQyCsxu6emZu4tB4bJV
	 aeMnYDTSxKUyOr5K2mTsD1eeyP2N0tWsb3lcJ+OyiwCyqSvPtDjYX84g32p9as+Lmd
	 rB1IkzGdAZDftp9gLN2hu/4fHy4bOGH7GPcVx/nfCmFInh6neHdIajSna8SsDoJL48
	 CUsl6BFewvXK+8BA8rm+ILDLFUZXmXgKFN2MXMWANO7NXnxndC6XJGtOtrsNPVOWPJ
	 A/q4HDGcvWAj+GPM8wBb0P1y6E6adu6yA6OdtmjkSkK6Kw/vSRHm5DIxlekdRmwV43
	 B/EWvnGpfaFlQ==
Date: Tue, 26 Sep 2023 14:14:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Shawn Anastasio <sanastasio@raptorengineering.com>
cc: xen-devel@lists.xenproject.org, 
    Timothy Pearson <tpearson@raptorengineering.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/2] xen/common: Add NUMA node id bounds check to
 page_alloc.c/node_to_scrub
In-Reply-To: <cbecf35392441b03dc3ccd2a119b6fbdbf13b855.1695754185.git.sanastasio@raptorengineering.com>
Message-ID: <alpine.DEB.2.22.394.2309261414310.1403502@ubuntu-linux-20-04-desktop>
References: <cover.1695754185.git.sanastasio@raptorengineering.com> <cbecf35392441b03dc3ccd2a119b6fbdbf13b855.1695754185.git.sanastasio@raptorengineering.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 26 Sep 2023, Shawn Anastasio wrote:
> When building for Power with CONFIG_DEBUG unset, a compiler error gets
> raised inside page_alloc.c's node_to_scrub function:
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

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v2: Add comment to explain the bounds check.
> 
>  xen/common/page_alloc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 35d9a26fa6..c53f917dbc 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1211,6 +1211,14 @@ static unsigned int node_to_scrub(bool get_node)
>          } while ( !cpumask_empty(&node_to_cpumask(node)) &&
>                    (node != local_node) );
> 
> +        /*
> +         * In practice `node` will always be within MAX_NUMNODES, but GCC can't
> +         * always see that, so an explicit check is necessary to avoid tripping
> +         * its out-of-bounds array access warning (-Warray-bounds).
> +         */
> +        if ( node >= MAX_NUMNODES )
> +            break;
> +
>          if ( node == local_node )
>              break;
> 
> --
> 2.30.2
> 

