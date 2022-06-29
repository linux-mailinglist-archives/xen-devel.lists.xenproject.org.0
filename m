Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DE955F278
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 02:39:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357461.586023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6LjG-0001Sk-Oy; Wed, 29 Jun 2022 00:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357461.586023; Wed, 29 Jun 2022 00:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6LjG-0001Pp-MF; Wed, 29 Jun 2022 00:38:50 +0000
Received: by outflank-mailman (input) for mailman id 357461;
 Wed, 29 Jun 2022 00:38:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6n86=XE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o6LjG-00015a-3T
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 00:38:50 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d78acded-f743-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 02:38:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BD635B81E04;
 Wed, 29 Jun 2022 00:38:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 343B1C341C8;
 Wed, 29 Jun 2022 00:38:47 +0000 (UTC)
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
X-Inumbo-ID: d78acded-f743-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656463127;
	bh=O0NqIp879v6Y64z8RHuI9sAdYl28wsDo45fN6FatBaI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=m6UVXtsnh9Ckog6KnoTj3Cu5jLMK4mYqbpOBtATE2xhdb7HcN4SHeQmhhBz3sHYo+
	 USCzSQGYleCz+VtXxIuoH8Zkb+8YPFdQwNccen22R2WcPacnZla8L+GASUgqHqplR6
	 1jW55A0zlcuYnnzHLhkoD2EfGtAjOQ3cqqg3gjaVyinQ9Gb/NJcing0P2KUwFBRKF+
	 Cyw6qkFz5/hOWXHRg4NTf/NRVQ9GVPiq6/MvhhQFgsX+OAmnJ0fFP/NnQ8VA78w6TI
	 istSXTS941SDodWWJIYAQGQkjbFvooiYrfwlFAJien4gcdEWB4G/3nP9GgikkhBRhs
	 JZbDrNWPcRS+A==
Date: Tue, 28 Jun 2022 17:38:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>, 
    Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 4/5] xen/sched: credit: Fix MISRA C 2012 Rule 8.7
 violation
In-Reply-To: <20220628150337.8520-5-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2206281738390.4389@ubuntu-linux-20-04-desktop>
References: <20220628150337.8520-1-burzalodowa@gmail.com> <20220628150337.8520-5-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Jun 2022, Xenia Ragiadakou wrote:
> The per-cpu variable last_tickle_cpu is referenced only in credit.c.
> Change its linkage from external to internal by adding the storage-class
> specifier static to its definitions.
> 
> Also, this patch aims to resolve indirectly a MISRA C 2012 Rule 8.4 violation
> warning.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> Changes in v2:
> - replace the phrase "This patch aims to resolve indirectly a MISRA C 2012
>   Rule 8.4 violation warning." with "Also, this patch aims to resolve
>   indirectly a MISRA C 2012 Rule 8.4 violation warning."
> 
>  xen/common/sched/credit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
> index 4d3bd8cba6..47945c2834 100644
> --- a/xen/common/sched/credit.c
> +++ b/xen/common/sched/credit.c
> @@ -348,7 +348,7 @@ static void burn_credits(struct csched_unit *svc, s_time_t now)
>  static bool __read_mostly opt_tickle_one_idle = true;
>  boolean_param("tickle_one_idle_cpu", opt_tickle_one_idle);
>  
> -DEFINE_PER_CPU(unsigned int, last_tickle_cpu);
> +static DEFINE_PER_CPU(unsigned int, last_tickle_cpu);
>  
>  static inline void __runq_tickle(const struct csched_unit *new)
>  {
> -- 
> 2.34.1
> 
> 

