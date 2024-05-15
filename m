Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5DE8C6EAA
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 00:31:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722632.1126766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7N90-00065g-KW; Wed, 15 May 2024 22:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722632.1126766; Wed, 15 May 2024 22:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7N90-00063c-HW; Wed, 15 May 2024 22:30:42 +0000
Received: by outflank-mailman (input) for mailman id 722632;
 Wed, 15 May 2024 22:30:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kF2M=MS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7N8z-00063W-7a
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 22:30:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0fe8f32-130a-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 00:30:38 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5A58A615F7;
 Wed, 15 May 2024 22:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D22C116B1;
 Wed, 15 May 2024 22:30:35 +0000 (UTC)
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
X-Inumbo-ID: c0fe8f32-130a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715812237;
	bh=BhaxKrSJ2V074gHXzgPwRKtFyji5OeLt5R3Sl21D4t0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DC2NxJVEy31yOLjZq9huooHYPwBBmjBjscRNb0ZIy3x6OEpnlOzGNuQT92ALOTRRV
	 1NNhrZjfbKC0lEtLDZOmnnkdgi080nHff9IsAxUVb/vA1ieHqy5fJddxyiP7BlRu07
	 HG78AuDwrZh9dO0iHbi3gN/jF1hi1vGY/F/9TLhql3jUuWpIr9rRHNB99sBSVcfHte
	 0joH++aTxyWzb7rwjAJ0PSCxJrYrGnt6ObW8dQm/61+/4UlfEcEzW7mcCJgjOv2vxt
	 OcBtySvKnw9a3yyXI8RbwBEuusgl/lGV/8pqUE8U0okm/NYcsTjYEWnd+a8Bzvuj3M
	 kdb3NJxOwTmtg==
Date: Wed, 15 May 2024 15:30:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <xin.wang2@amd.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] drivers/xen: Improve the late XenStore init protocol
In-Reply-To: <20240515014330.1044617-1-xin.wang2@amd.com>
Message-ID: <alpine.DEB.2.22.394.2405151524270.2544314@ubuntu-linux-20-04-desktop>
References: <20240515014330.1044617-1-xin.wang2@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Henry Wang wrote:
> Currently, the late XenStore init protocol is only triggered properly
> for the case that HVM_PARAM_STORE_PFN is ~0ULL (invalid). For the
> case that XenStore interface is allocated but not ready (the connection
> status is not XENSTORE_CONNECTED), Linux should also wait until the
> XenStore is set up properly.
> 
> Introduce a macro to describe the XenStore interface is ready, use
> it in xenbus_probe_initcall() and xenbus_probe() to select the code
> path of doing the late XenStore init protocol or not.
> 
> Take the opportunity to enhance the check of the allocated XenStore
> interface can be properly mapped, and return error early if the
> memremap() fails.
> 
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Please add a Fixes: tag


> ---
>  drivers/xen/xenbus/xenbus_probe.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
> index 3205e5d724c8..8aec0ed1d047 100644
> --- a/drivers/xen/xenbus/xenbus_probe.c
> +++ b/drivers/xen/xenbus/xenbus_probe.c
> @@ -72,6 +72,10 @@ EXPORT_SYMBOL_GPL(xen_store_evtchn);
>  struct xenstore_domain_interface *xen_store_interface;
>  EXPORT_SYMBOL_GPL(xen_store_interface);
>  
> +#define XS_INTERFACE_READY \
> +	((xen_store_interface != NULL) && \
> +	 (xen_store_interface->connection == XENSTORE_CONNECTED))
> +
>  enum xenstore_init xen_store_domain_type;
>  EXPORT_SYMBOL_GPL(xen_store_domain_type);
>  
> @@ -751,9 +755,10 @@ static void xenbus_probe(void)
>  {
>  	xenstored_ready = 1;
>  
> -	if (!xen_store_interface) {
> -		xen_store_interface = memremap(xen_store_gfn << XEN_PAGE_SHIFT,
> -					       XEN_PAGE_SIZE, MEMREMAP_WB);
> +	if (!xen_store_interface || XS_INTERFACE_READY) {
> +		if (!xen_store_interface)

These two nested if's don't make sense to me. If XS_INTERFACE_READY
succeeds, it means that  ((xen_store_interface != NULL) &&
(xen_store_interface->connection == XENSTORE_CONNECTED)).

So it is not possible that xen_store_interface == NULL immediately
after. Right?


> +			xen_store_interface = memremap(xen_store_gfn << XEN_PAGE_SHIFT,
> +						       XEN_PAGE_SIZE, MEMREMAP_WB);
>  		/*
>  		 * Now it is safe to free the IRQ used for xenstore late
>  		 * initialization. No need to unbind: it is about to be
> @@ -822,7 +827,7 @@ static int __init xenbus_probe_initcall(void)
>  	if (xen_store_domain_type == XS_PV ||
>  	    (xen_store_domain_type == XS_HVM &&
>  	     !xs_hvm_defer_init_for_callback() &&
> -	     xen_store_interface != NULL))
> +	     XS_INTERFACE_READY))
>  		xenbus_probe();
>  
>  	/*
> @@ -831,7 +836,7 @@ static int __init xenbus_probe_initcall(void)
>  	 * started, then probe.  It will be triggered when communication
>  	 * starts happening, by waiting on xb_waitq.
>  	 */
> -	if (xen_store_domain_type == XS_LOCAL || xen_store_interface == NULL) {
> +	if (xen_store_domain_type == XS_LOCAL || !XS_INTERFACE_READY) {
>  		struct task_struct *probe_task;
>  
>  		probe_task = kthread_run(xenbus_probe_thread, NULL,
> @@ -1014,6 +1019,12 @@ static int __init xenbus_init(void)
>  			xen_store_interface =
>  				memremap(xen_store_gfn << XEN_PAGE_SHIFT,
>  					 XEN_PAGE_SIZE, MEMREMAP_WB);
> +			if (!xen_store_interface) {
> +				pr_err("%s: cannot map HVM_PARAM_STORE_PFN=%llx\n",
> +				       __func__, v);
> +				err = -ENOMEM;

I think this should -EINVAL


> +				goto out_error;
> +			}
>  			if (xen_store_interface->connection != XENSTORE_CONNECTED)
>  				wait = true;
>  		}
> -- 
> 2.34.1
> 

