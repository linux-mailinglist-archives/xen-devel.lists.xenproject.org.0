Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D42B975E08
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 02:35:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796924.1206657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soXo6-0007JN-Dv; Thu, 12 Sep 2024 00:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796924.1206657; Thu, 12 Sep 2024 00:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soXo6-0007Fx-B7; Thu, 12 Sep 2024 00:35:34 +0000
Received: by outflank-mailman (input) for mailman id 796924;
 Thu, 12 Sep 2024 00:35:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T9bO=QK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1soXo4-0007AU-To
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 00:35:32 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e91aab93-709e-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 02:35:29 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C3FA8A416FA;
 Thu, 12 Sep 2024 00:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F674C4CEC0;
 Thu, 12 Sep 2024 00:35:26 +0000 (UTC)
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
X-Inumbo-ID: e91aab93-709e-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726101328;
	bh=KDMRMbBnznmvgV8Zoir3KNckEwYjVZi0QYDzvdKQCU0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M6+XpEckaGtukIYds2yWmgJetYGGr6QXE/kr3lrZxJ01h8zb3ny0Bi3wvRpghCLCl
	 bknOftX7by+6fVweNd1/yGw/8rmuf/Dl9eEbJduB0oQGl72dJeGriek8Evz/LdHU2I
	 5cOJPztRXcU7gDSeOqkG72Ux64wjlRugk4BPt7R9OSkJDLvcqZz+TthGFovYEHaV2E
	 tz0R4nGXt+SpT+7tHJl5gRP0InsJHlVj+zdMmnPdaJeB5hTMc6VRLJ4isRNvqZXfXO
	 M+o9cn6x2cQslXxLcEs0eXjpMGyFDXnnVlTbFDXGY1yVvR+RW3TiRAwXwrMtvmxBN3
	 /+SlUQ5zEA07w==
Date: Wed, 11 Sep 2024 17:35:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 2/2] xen/bitmap: remove redundant deviations
In-Reply-To: <fd221f9c591844e1f684de45981a4f65ca49c72c.1725963889.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2409111735170.611587@ubuntu-linux-20-04-desktop>
References: <cover.1725963889.git.federico.serafini@bugseng.com> <fd221f9c591844e1f684de45981a4f65ca49c72c.1725963889.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Sep 2024, Federico Serafini wrote:
> Remove comment-based deviations since a project wide deviation that
> cover such cases is present.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes from v1:
> - split modifications in two patches.
> ---
>  xen/include/xen/bitmap.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/xen/include/xen/bitmap.h b/xen/include/xen/bitmap.h
> index 5d668053b0..4b642cd420 100644
> --- a/xen/include/xen/bitmap.h
> +++ b/xen/include/xen/bitmap.h
> @@ -103,13 +103,10 @@ extern int bitmap_allocate_region(unsigned long *bitmap, int pos, int order);
>  #define bitmap_switch(nbits, zero, small, large)			  \
>  	unsigned int n__ = (nbits);					  \
>  	if (__builtin_constant_p(nbits) && !n__) {			  \
> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>  		zero;							  \
>  	} else if (__builtin_constant_p(nbits) && n__ <= BITS_PER_LONG) { \
> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>  		small;							  \
>  	} else {							  \
> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>  		large;							  \
>  	}
>  
> -- 
> 2.34.1
> 

