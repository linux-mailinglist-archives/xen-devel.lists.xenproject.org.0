Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F5194389B
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 00:08:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769147.1180037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZHU4-0001mu-8p; Wed, 31 Jul 2024 22:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769147.1180037; Wed, 31 Jul 2024 22:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZHU4-0001lD-5L; Wed, 31 Jul 2024 22:07:48 +0000
Received: by outflank-mailman (input) for mailman id 769147;
 Wed, 31 Jul 2024 22:07:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gQnf=O7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sZHU2-0001l7-Rp
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 22:07:46 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fb55370-4f89-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 00:07:45 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DA4B4CE16B7;
 Wed, 31 Jul 2024 22:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 876A6C116B1;
 Wed, 31 Jul 2024 22:07:41 +0000 (UTC)
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
X-Inumbo-ID: 4fb55370-4f89-11ef-bc02-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722463662;
	bh=lPcHPtCyt/+swhJML+l071bNUYE+IlYVfGp36N9DWN4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tG8fCcdvWStSHmOgY3X0q5CiF1SLqP50eDCNknrlPdujwYoJEp/O7tdyi04OjQh8v
	 CHRe9H6hXzoxO2HHEz8X8QLBotSlXP6BX6YZWCh5D1pF93W6vY7y3E9WXY5wbjwD1a
	 e0bW1j2JkvpIT7IYHVibKY8uRFgDpUEX7CMdbnGMq+y173NozuBLYbWJVQ4v/dfSca
	 eY/L0N3fCNk8Zbtt6fTipRZ1DBdqfu3k0FwaKaCVl25D7wGr33ehmal7v17HB9Jgu0
	 y+AGwSxQejlrdqOGzOFK95ZWO4HGsKDsDQ8MQwgl3sUakflQQYiDumi7a2+fULPJQL
	 rO6/a4CQrKO3A==
Date: Wed, 31 Jul 2024 15:07:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH] x86/domain: Fix domlist_insert() updating the domain
 hash
In-Reply-To: <20240731203355.3652182-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2407311507240.4857@ubuntu-linux-20-04-desktop>
References: <20240731203355.3652182-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 31 Jul 2024, Andrew Cooper wrote:
> A last minute review request was to dedup the expression calculating the
> domain hash bucket.
> 
> While the code reads correctly, it is buggy because rcu_assign_pointer() is a
> criminally stupid API assigning by name not value, and - contrary to it's name
> - does not hide an indirection.
> 
> Therefore, rcu_assign_pointer(bucket, d); updates the local bucket variable on
> the stack, not domain_hash[], causing all subsequent domid lookups to fail.
> 
> Rework the logic to use pd in the same way that domlist_remove() does.
> 
> Fixes: 19995bc70cc6 ("xen/domain: Factor domlist_{insert,remove}() out of domain_{create,destroy}()")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1395978459
> ---
>  xen/common/domain.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 8d8f40ccb245..92263a4fbdc5 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -70,7 +70,7 @@ struct domain *domain_list;
>   */
>  static void domlist_insert(struct domain *d)
>  {
> -    struct domain **pd, *bucket;
> +    struct domain **pd;
>  
>      spin_lock(&domlist_update_lock);
>  
> @@ -79,12 +79,12 @@ static void domlist_insert(struct domain *d)
>          if ( (*pd)->domain_id > d->domain_id )
>              break;
>  
> -    bucket = domain_hash[DOMAIN_HASH(d->domain_id)];
> -
>      d->next_in_list = *pd;
> -    d->next_in_hashbucket = bucket;
>      rcu_assign_pointer(*pd, d);
> -    rcu_assign_pointer(bucket, d);
> +
> +    pd = &domain_hash[DOMAIN_HASH(d->domain_id)];
> +    d->next_in_hashbucket = *pd;
> +    rcu_assign_pointer(*pd, d);
>  
>      spin_unlock(&domlist_update_lock);
>  }
> -- 
> 2.39.2
> 

