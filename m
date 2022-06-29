Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBB155F272
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 02:33:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357454.586001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6LeL-0000Mq-UJ; Wed, 29 Jun 2022 00:33:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357454.586001; Wed, 29 Jun 2022 00:33:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6LeL-0000KI-Rd; Wed, 29 Jun 2022 00:33:45 +0000
Received: by outflank-mailman (input) for mailman id 357454;
 Wed, 29 Jun 2022 00:33:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6n86=XE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o6LeJ-0000K8-TU
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 00:33:43 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 206265ee-f743-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 02:33:42 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DB2B8B81FAE;
 Wed, 29 Jun 2022 00:33:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EC7C341C8;
 Wed, 29 Jun 2022 00:33:40 +0000 (UTC)
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
X-Inumbo-ID: 206265ee-f743-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656462820;
	bh=kAcag4fVpVdnx2Peoj1azmGRfaFc0FdpCsNg81+VX0s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Vi6mBf2onL33kngnOhk+y7rYXGMtawOpcYvA5rckmKgOc/G7/iigqiiby/c1+ewXU
	 zMPfzeE2uzhQ+3sIhSpLtexwqoCzztYCQJtIQ63+LfpmlpCgl4JGhKw7gVMsc+fX+r
	 Wu5Fh5Y5ukRfRJ0qF0tr4kN9LhWAPKP/jBcfoWKHuw1TeF08wRLWX4bfmboS9Q5rv5
	 zYhIScTb2q8r3xKNqBzRRwILCZdO7Dw6TypBX0IjNs4t8kMArFLoQ/6dHVrIt5X7JA
	 feDetXs90NqFApW/9JCuUrlaTqKgZ2Hc9Vh9XfdDcWK/91DytMlchQKIZYBYnE7Bmb
	 x7snyOjczNtlw==
Date: Tue, 28 Jun 2022 17:33:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>, 
    Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 4/5] xen/sched: credit: Fix MISRA C 2012 Rule 8.7
 violation
In-Reply-To: <20220626211131.678995-5-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2206281733290.4389@ubuntu-linux-20-04-desktop>
References: <20220626211131.678995-1-burzalodowa@gmail.com> <20220626211131.678995-5-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 27 Jun 2022, Xenia Ragiadakou wrote:
> The per-cpu variable last_tickle_cpu is referenced only in credit.c.
> Change its linkage from external to internal by adding the storage-class
> specifier static to its definitions.
> 
> This patch aims to resolve indirectly a MISRA C 2012 Rule 8.4 violation warning.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
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

