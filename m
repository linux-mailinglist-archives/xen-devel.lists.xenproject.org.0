Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A059410078
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 23:03:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189710.339565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRKzd-0003b5-DX; Fri, 17 Sep 2021 21:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189710.339565; Fri, 17 Sep 2021 21:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRKzd-0003Z7-AU; Fri, 17 Sep 2021 21:01:57 +0000
Received: by outflank-mailman (input) for mailman id 189710;
 Fri, 17 Sep 2021 21:01:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+WA1=OH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mRKzc-0003Z1-Ah
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 21:01:56 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7cf1d6f7-17fa-11ec-b72f-12813bfff9fa;
 Fri, 17 Sep 2021 21:01:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2158761041;
 Fri, 17 Sep 2021 21:01:54 +0000 (UTC)
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
X-Inumbo-ID: 7cf1d6f7-17fa-11ec-b72f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631912514;
	bh=Ndurqa6Butxfy9Dwbs+bYXWInRArT/CnntG/OJC22e4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YNQsVuLdqg20Wv3H41tUq4bScWLDV31+2M+AHwEOG5TuJ1VKAtFmst8LhW4YZwCSO
	 TLn7iThn/F0Dhunm92S+DbWGxiFalSGpbdSwpb0RP5DkK3jGik30OWaDVG5M2VTbWR
	 XxzgmryWm4Sl8Y+cTX0DruFOFTbiV3P0zXoagpe1W9t95zMPCcx4/zURTO7QNNnVqb
	 5j7vzgan1shzEvnnCnUYKfN3TnmoUszeZBS4eeTknS+J5+cj11lKyjs9oiTN0mucaZ
	 BK6bH8ShdBpGAy5TFcxzFzJ4/I1T6tU+nXSiL+bhRtK4yqxjgi4qgFpjnn7rHsZ9ME
	 41/o4jmBk5FTA==
Date: Fri, 17 Sep 2021 14:01:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] page-alloc: further adjust assign_page{,s}()
In-Reply-To: <90df9041-4f1f-9911-d64e-f8d7b2a99534@suse.com>
Message-ID: <alpine.DEB.2.21.2109171401450.21985@sstabellini-ThinkPad-T480s>
References: <90df9041-4f1f-9911-d64e-f8d7b2a99534@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 17 Sep 2021, Jan Beulich wrote:
> The on-commit editing of 5260e8fb93f0 ("xen: re-define assign_pages and
> introduce a new function assign_page") didn't go quite far enough: A
> local variable and a function argument also would have wanted adjusting.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2269,7 +2269,7 @@ int assign_pages(
>      unsigned int memflags)
>  {
>      int rc = 0;
> -    unsigned long i;
> +    unsigned int i;
>  
>      spin_lock(&d->page_alloc_lock);
>  
> @@ -2339,7 +2339,7 @@ int assign_pages(
>  int assign_page(struct page_info *pg, unsigned int order, struct domain *d,
>                  unsigned int memflags)
>  {
> -    return assign_pages(pg, 1UL << order, d, memflags);
> +    return assign_pages(pg, 1U << order, d, memflags);
>  }
>  
>  struct page_info *alloc_domheap_pages(
> 

