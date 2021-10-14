Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1486E42E222
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 21:44:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209590.366088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb6cp-0007Rm-KM; Thu, 14 Oct 2021 19:42:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209590.366088; Thu, 14 Oct 2021 19:42:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb6cp-0007OJ-Gu; Thu, 14 Oct 2021 19:42:47 +0000
Received: by outflank-mailman (input) for mailman id 209590;
 Thu, 14 Oct 2021 19:42:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kGop=PC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mb6cn-0007OD-Rn
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 19:42:45 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b47d026-5986-4549-87dd-497263c02a48;
 Thu, 14 Oct 2021 19:42:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AEC83604E9;
 Thu, 14 Oct 2021 19:42:43 +0000 (UTC)
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
X-Inumbo-ID: 2b47d026-5986-4549-87dd-497263c02a48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634240564;
	bh=iIBZIhtkSWMQj1WgKcPeCr6QjVpWAQIm6lxiwng6KCY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rgqbekksfExbJEHdzFLOFsKIqA8ZbZjDH6BNQZsGElAUs82NMm2bly1+roOhodLbl
	 w+3Zf7f0N56dYq38pi+kEIebY7iMdINqvD4iA8+HwVdYisDtSVk1Mr6GFFr/nyS3lA
	 1Xvus4nFp7wprCBRh8RrX6qiq64URaagwqhWHzDzyWgVsVw1NjhEG1KOw8C4Wnc21R
	 nFJUkQWExuMS3G1js3L1NDpy0nqoX2mkt/hDyrmVQlO5/C6vkKuIAD8Fv1QKa+xPTD
	 7p0qpjrp5uhGgNG8Dvwrpybwrd36G0iw5FuMgh41eJprELL+WBpKa0WYwWmjMRbiQ7
	 qMA3MjPPXMA5A==
Date: Thu, 14 Oct 2021 12:42:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
cc: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] xen/pvcalls-back: Remove redundant 'flush_workqueue()'
 calls
In-Reply-To: <2d6c2e031e4aa2acf2ac4e0bbbc17cfdcc8dbee2.1634236560.git.christophe.jaillet@wanadoo.fr>
Message-ID: <alpine.DEB.2.21.2110141242320.9408@sstabellini-ThinkPad-T480s>
References: <2d6c2e031e4aa2acf2ac4e0bbbc17cfdcc8dbee2.1634236560.git.christophe.jaillet@wanadoo.fr>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Oct 2021, Christophe JAILLET wrote:
> 'destroy_workqueue()' already drains the queue before destroying it, so
> there is no need to flush it explicitly.
> 
> Remove the redundant 'flush_workqueue()' calls.
> 
> This was generated with coccinelle:
> 
> @@
> expression E;
> @@
> - 	flush_workqueue(E);
> 	destroy_workqueue(E);
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  drivers/xen/pvcalls-back.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/xen/pvcalls-back.c b/drivers/xen/pvcalls-back.c
> index b47fd8435061..d6f945fd4147 100644
> --- a/drivers/xen/pvcalls-back.c
> +++ b/drivers/xen/pvcalls-back.c
> @@ -465,7 +465,6 @@ static int pvcalls_back_release_passive(struct xenbus_device *dev,
>  		write_unlock_bh(&mappass->sock->sk->sk_callback_lock);
>  	}
>  	sock_release(mappass->sock);
> -	flush_workqueue(mappass->wq);
>  	destroy_workqueue(mappass->wq);
>  	kfree(mappass);
>  
> -- 
> 2.30.2
> 

