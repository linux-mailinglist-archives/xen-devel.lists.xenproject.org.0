Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDD54EFD5F
	for <lists+xen-devel@lfdr.de>; Sat,  2 Apr 2022 02:12:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297672.507151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naRMw-0005JX-Ck; Sat, 02 Apr 2022 00:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297672.507151; Sat, 02 Apr 2022 00:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naRMw-0005Gk-9P; Sat, 02 Apr 2022 00:11:54 +0000
Received: by outflank-mailman (input) for mailman id 297672;
 Sat, 02 Apr 2022 00:11:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fP4x=UM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1naRMu-0005Ga-9S
 for xen-devel@lists.xenproject.org; Sat, 02 Apr 2022 00:11:52 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ed771ea-b219-11ec-8fbc-03012f2f19d4;
 Sat, 02 Apr 2022 02:11:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2C6CBB82546;
 Sat,  2 Apr 2022 00:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2E8C340F3;
 Sat,  2 Apr 2022 00:11:49 +0000 (UTC)
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
X-Inumbo-ID: 7ed771ea-b219-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648858310;
	bh=ZncpQXriffTsBcXDYEAF8w1S2EddhxC1L2df4BKu25s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iAF0xYhkJLW2fGDGi+zpywnkbCwO5CiVo5NpIxDjMLWHKet/EOT+uLJZTcaVHBlqs
	 ip6czu53WThm6+dZff3X88VRPKDhztPS0VRI6ZAHcH6QPWoAYviCmpp6PurGkcRdSn
	 qdX0Kag8y4Yl3pqZVOviwDzcW95tiAankPYmjJz6zCgKS4d0iP6XHxD3qVyQ/tMBIW
	 3H6jxM77V/FMz6beS2qQ2pbZCc0LJJ6vmmUdJFCtCrbiPqVPxmqBgDB+GCJgo2v25X
	 WqtQ2Xs6SwjJuIvF96kFwWMHXSfPQdJHJ0xX3e6FoLR8wYoVBq0vPcn0T44umPL9tu
	 OnsyVM34flf/w==
Date: Fri, 1 Apr 2022 17:11:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 10/19] xen/arm32: mm: Re-implement setup_xenheap_mappings()
 using map_pages_to_xen()
In-Reply-To: <20220221102218.33785-11-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204011711290.2910984@ubuntu-linux-20-04-desktop>
References: <20220221102218.33785-1-julien@xen.org> <20220221102218.33785-11-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Feb 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Now that map_pages_to_xen() has been extended to support 2MB mappings,
> we can replace the create_mappings() call by map_pages_to_xen() call.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>     Changes in v3:
>         - Fix build when CONFIG_DEBUG=y
> 
>     Changes in v2:
>         - New patch
> 
>     TODOs:
>         - add support for contiguous mapping
> ---
>  xen/arch/arm/mm.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index f18f65745595..1e5c2c45dcf9 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -809,7 +809,12 @@ void mmu_init_secondary_cpu(void)
>  void __init setup_xenheap_mappings(unsigned long base_mfn,
>                                     unsigned long nr_mfns)
>  {
> -    create_mappings(xen_second, XENHEAP_VIRT_START, base_mfn, nr_mfns, MB(32));
> +    int rc;
> +
> +    rc = map_pages_to_xen(XENHEAP_VIRT_START, _mfn(base_mfn), nr_mfns,
> +                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
> +    if ( rc )
> +        panic("Unable to setup the xenheap mappings.\n");
>  
>      /* Record where the xenheap is, for translation routines. */
>      xenheap_virt_end = XENHEAP_VIRT_START + nr_mfns * PAGE_SIZE;
> -- 
> 2.32.0
> 

