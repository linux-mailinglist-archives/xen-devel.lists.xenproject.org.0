Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C674168F3
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 02:32:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194669.346832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZ8D-0006yu-4d; Fri, 24 Sep 2021 00:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194669.346832; Fri, 24 Sep 2021 00:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZ8D-0006wd-1L; Fri, 24 Sep 2021 00:32:01 +0000
Received: by outflank-mailman (input) for mailman id 194669;
 Fri, 24 Sep 2021 00:31:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTZ8B-0006wX-F9
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 00:31:59 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9676547b-99b9-4c62-b74f-155eed083eec;
 Fri, 24 Sep 2021 00:31:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1D6F60E52;
 Fri, 24 Sep 2021 00:31:57 +0000 (UTC)
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
X-Inumbo-ID: 9676547b-99b9-4c62-b74f-155eed083eec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632443518;
	bh=glEVFsYw8Rwx27l7Pr4lyUMAEVW7nXCYix2FGmkWSQ8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=I4F6QhPv6s69OOXkc4LoZ/moFXp3J9bBM8DqallY8YZNfIe4Yjldqzp53+M0B5kJ5
	 pVvqWnog6VnqNSYK5zHYX74BFIcSujOrdWaQY/YkZv/vdQUjSRkPxdMRX8U/HOrJyi
	 zK4aR5HzV7BLyBPwEU5pssQvfgrFT/A8pCC3IyLpygO7btDYsbu21cvOUQgVAx1prN
	 oFQUL387JDJ5t2Ie8sRfHsSdNJshLmMaUBYCI69WiS/PlOjCu8NP3N7WU7zlqaCCOQ
	 PaNaPM5Zez1rqBCyrU1DEMOpMnuMHpMd9aBgOV7CYclaboCZi90iSLy4+3v9Pafwpu
	 r3eLo2btlRWyg==
Date: Thu, 23 Sep 2021 17:31:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, wl@xen.org
Subject: Re: [PATCH 10/37] xen/x86: use helpers to access/update
 mem_hotplug
In-Reply-To: <20210923120236.3692135-11-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231730580.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-11-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+x86 maintainers


On Thu, 23 Sep 2021, Wei Chen wrote:
> We want to abstract code from acpi_numa_memory_affinity_init.
> But mem_hotplug is coupled with x86. In this patch, we use
> helpers to repace mem_hotplug direct accessing. This will
             ^ replace

> allow most code can be common.
                  ^ to be

I think this patch could be merged with the previous patch


> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/x86/srat.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
> index 2f08fa4660..3334ede7a5 100644
> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -391,8 +391,8 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
>  	memblk_nodeid[num_node_memblks] = node;
>  	if (ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) {
>  		__set_bit(num_node_memblks, memblk_hotplug);
> -		if (end > mem_hotplug)
> -			mem_hotplug = end;
> +		if (end > mem_hotplug_boundary())
> +			mem_hotplug_update_boundary(end);
>  	}
>  	num_node_memblks++;
>  }
> -- 
> 2.25.1
> 

