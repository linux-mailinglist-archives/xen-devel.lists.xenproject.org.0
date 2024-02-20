Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9179D85CA47
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 22:57:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683735.1063312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcY65-0004pp-UV; Tue, 20 Feb 2024 21:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683735.1063312; Tue, 20 Feb 2024 21:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcY65-0004n3-R6; Tue, 20 Feb 2024 21:56:17 +0000
Received: by outflank-mailman (input) for mailman id 683735;
 Tue, 20 Feb 2024 21:56:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C80L=J5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rcY63-0004mh-Ue
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 21:56:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc58171a-d03a-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 22:56:12 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7BCAE61210;
 Tue, 20 Feb 2024 21:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F91FC433C7;
 Tue, 20 Feb 2024 21:56:10 +0000 (UTC)
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
X-Inumbo-ID: dc58171a-d03a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708466171;
	bh=SxhF36u+/ccAB7bpf8YCfKxFTOxe0Qb+HUoXZTCXu1E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ItVhe2bQ3ZOghNzHV/HmNqPSIXfQgbn+70Z+DRnafE5akK94FNh+waKObFT/+WKet
	 f91lTV8XfvZ7bgZIjHhsC3HZh6EixmK4E34ABJs5AV49SHsQ64p+1JyjiRsEE29bog
	 dZW9PDDeAfxUubFTJgv9alF4jhmZO/ic0AqrAvOMllwoqmOvQn+ipzSAaeAjxjBh18
	 jNTl8+WJhDyumZxSejXwqGs4VH3ei+Xub0iHMsNlU4IPWywieclfuhjALuvD7vAzZR
	 VyhFvRIxhPD5Cf+WUlI8+RuyU8RrO+Z47IOAEi2krDF+cSWzvK9OQRjujO9qcfNWIq
	 496Ta0eJQCMWg==
Date: Tue, 20 Feb 2024 13:56:08 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@citrix.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [OSSTEST PATCH] ap-common: Switch to Linux 6.1 by default on
 Arm
In-Reply-To: <20240220145352.26264-1-anthony.perard@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2402201355410.754277@ubuntu-linux-20-04-desktop>
References: <20240220145352.26264-1-anthony.perard@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Feb 2024, Anthony PERARD wrote:
> The "linux-arm-xen" tree currently point to Linux 5.4.17 + 3 commits:
>   69117aaf07f7 ("xen/privcmd: replace kcalloc() by kvcalloc() when allocating empty pages")
>   bca5bc0229a6 ("xen/privcmd: fix error handling in mmap-resource processing")
>   f0f0e602f7c9 ("xen/privcmd: drop "pages" parameter from xen_remap_pfn()")
> 
> This stable version is old and doesn't build on Debian Bookworm.
> 
> The 3 extra commits are present in at least Linux 5.15, so there's
> currently no reason to have a separate tree when we could use a stable
> tree that osstest can update regulary.
> 
> So switch to 6.1. This will change the default Linux tree for all Arm
> jobs that aren't on "linux-*" osstest branches.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

I think that's fine. Assuming that you tested it and it works with
OSSTest as expected:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> Notes:
>     I plan to also change to use Linux 6.1 on X86 a bit later.
> 
>  ap-common | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/ap-common b/ap-common
> index 292553ed..48a95a22 100644
> --- a/ap-common
> +++ b/ap-common
> @@ -60,7 +60,7 @@
>  : ${PUSH_TREE_LINUX:=$XENBITS:/home/xen/git/linux-pvops.git}
>  : ${BASE_TREE_LINUX:=git://xenbits.xen.org/linux-pvops.git}
>  : ${BASE_TAG_LINUX:=tested/linux-4.19}
> -: ${BASE_TAG_LINUX_ARM:=tested/linux-arm-xen}
> +: ${BASE_TAG_LINUX_ARM:=tested/linux-6.1}
>  
>  if [ "x${TREE_LINUX}" = x ]; then
>  	: ${TREE_LINUX:=${BASE_TREE_LINUX}}
> -- 
> Anthony PERARD
> 

