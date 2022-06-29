Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DE255F26E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 02:32:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357448.585990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Lcw-0008B9-Gj; Wed, 29 Jun 2022 00:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357448.585990; Wed, 29 Jun 2022 00:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Lcw-00087z-Dg; Wed, 29 Jun 2022 00:32:18 +0000
Received: by outflank-mailman (input) for mailman id 357448;
 Wed, 29 Jun 2022 00:32:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6n86=XE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o6Lcu-00087t-Ot
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 00:32:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec5127a9-f742-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 02:32:15 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 05DAF61BEA;
 Wed, 29 Jun 2022 00:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33CEAC341C8;
 Wed, 29 Jun 2022 00:32:13 +0000 (UTC)
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
X-Inumbo-ID: ec5127a9-f742-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656462733;
	bh=kV3Xg2ZJrv/1vONNtAHMshda227zmNUQfAmIYro4lBg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Kih+yuhkNHHUaf/e+ZxwGSPlf5B8RNvHcuk/NbC1T+WUbGvqhKBWJAuFXSQOtNcXb
	 Ivq0Zegs1AoKFG95B5vloI6QzlDizV44PGEo6GmviCx9cZq01SB/gzZd6oE7/GeTYI
	 5qQczNTwDDL8b0Xn/cjW2vz//sysWhWwCzT0HHo9ESExMVprnqaJ1tXRz60ywmtzxU
	 EpaKIgbQ+nh7OE6D9DGIg2XcqjOD51ztpcFQXYXZtdrODZ+yzwJVHbXlC473gtSvnH
	 T1HddtvDTJCrXPMk9i4I52Nki+IhIJgtUnpI4OoNsqJOjJx5sfG2nCx0Ug+TJScgGj
	 AoePG2jRwtXWA==
Date: Tue, 28 Jun 2022 17:32:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, Tamas K Lengyel <tamas@tklengyel.com>, 
    Alexandru Isaila <aisaila@bitdefender.com>, 
    Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [PATCH 2/5] xen/common: vm_event: Fix MISRA C 2012 Rule 8.7
 violation
In-Reply-To: <20220626211131.678995-3-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2206281732060.4389@ubuntu-linux-20-04-desktop>
References: <20220626211131.678995-1-burzalodowa@gmail.com> <20220626211131.678995-3-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 27 Jun 2022, Xenia Ragiadakou wrote:
> The function vm_event_wake() is referenced only in vm_event.c.
> Change the linkage of the function from external to internal by adding
> the storage-class specifier static to the function definition.
> 
> This patch aims to resolve indirectly a MISRA C 2012 Rule 8.4 violation warning.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/vm_event.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
> index 0b99a6ea72..ecf49c38a9 100644
> --- a/xen/common/vm_event.c
> +++ b/xen/common/vm_event.c
> @@ -173,7 +173,7 @@ static void vm_event_wake_queued(struct domain *d, struct vm_event_domain *ved)
>   * call vm_event_wake() again, ensuring that any blocked vCPUs will get
>   * unpaused once all the queued vCPUs have made it through.
>   */
> -void vm_event_wake(struct domain *d, struct vm_event_domain *ved)
> +static void vm_event_wake(struct domain *d, struct vm_event_domain *ved)
>  {
>      if ( !list_empty(&ved->wq.list) )
>          vm_event_wake_queued(d, ved);
> -- 
> 2.34.1
> 
> 

