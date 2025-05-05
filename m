Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A589DAA9D83
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 22:45:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976429.1363583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC2gT-0002JB-4H; Mon, 05 May 2025 20:45:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976429.1363583; Mon, 05 May 2025 20:45:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC2gT-0002Hx-1V; Mon, 05 May 2025 20:45:05 +0000
Received: by outflank-mailman (input) for mailman id 976429;
 Mon, 05 May 2025 20:45:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9/1y=XV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uC2gR-0002Hr-MM
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 20:45:03 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf4cbdd1-29f1-11f0-9ffb-bf95429c2676;
 Mon, 05 May 2025 22:44:59 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9BF6061129;
 Mon,  5 May 2025 20:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D746C4CEE4;
 Mon,  5 May 2025 20:44:57 +0000 (UTC)
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
X-Inumbo-ID: cf4cbdd1-29f1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746477898;
	bh=ubdBjhQyfvrlKkg+rzmLXqPA/dVljltrJ12y21NRBts=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jpT1K7p+AEBP+oiObyE85RAqOoZ8tHiEgeiYpmZYZJ3hzPrs3CaZ5A1xu0+zboUIa
	 NzIEkxm6GdfknuSmd6WmiRM47EuEbSlQFL+FCTFjtxPD8szjXg8iE/87bK00HjP5zq
	 43W2pRMGkb1sPdACK4xn4gyda55fQ5/nd4Rd/3ikfjc+eogKbil4jR8KMiZ4WrL59i
	 pe8M1Ipz+e68Gj727wssLS1MWG4iEgSZOkofJULqkYKStbDrNPNci+4nUtU9LJ36r1
	 W/sdzh4H19Y+usS0xxWihYuowfIp+gVK6737RDp841QaZ+BIjklthDB9bWUTklzhoB
	 kjKHcfLDENSKQ==
Date: Mon, 5 May 2025 13:44:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xenbus: Allow PVH dom0 a non-local xenstore
In-Reply-To: <20250503131935.1885-1-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505051343080.3879245@ubuntu-linux-20-04-desktop>
References: <20250503131935.1885-1-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 3 May 2025, Jason Andryuk wrote:
> Make xenbus_init() allow a non-local xenstore for a PVH dom0 - it is
> currently forced to XS_LOCAL.  With Hyperlaunch booting dom0 and a
> xenstore stubdom, dom0 can be handled as a regular XS_HVM following the
> late init path.
> 
> Drop the use of xen_initial_domain() and just check for the event
> channel instead.  This matches the PV case where there is no check for
> initial domain.
> 
> Check the full 64bit HVM_PARAM_STORE_EVTCHN value to catch the off
> chance that high bits are set for the 32bit event channel.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  drivers/xen/xenbus/xenbus_probe.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
> index 6d32ffb01136..7604f70ee108 100644
> --- a/drivers/xen/xenbus/xenbus_probe.c
> +++ b/drivers/xen/xenbus/xenbus_probe.c
> @@ -966,9 +966,15 @@ static int __init xenbus_init(void)
>  	if (xen_pv_domain())
>  		xen_store_domain_type = XS_PV;
>  	if (xen_hvm_domain())
> +	{
>  		xen_store_domain_type = XS_HVM;
> -	if (xen_hvm_domain() && xen_initial_domain())
> -		xen_store_domain_type = XS_LOCAL;
> +		err = hvm_get_parameter(HVM_PARAM_STORE_EVTCHN, &v);
> +		if (err)
> +			goto out_error;
> +		xen_store_evtchn = (int)v;
> +		if (!v)
> +			xen_store_domain_type = XS_LOCAL;
> +	}
>  	if (xen_pv_domain() && !xen_start_info->store_evtchn)
>  		xen_store_domain_type = XS_LOCAL;
>  	if (xen_pv_domain() && xen_start_info->store_evtchn)
> @@ -987,10 +993,6 @@ static int __init xenbus_init(void)
>  		xen_store_interface = gfn_to_virt(xen_store_gfn);
>  		break;
>  	case XS_HVM:
> -		err = hvm_get_parameter(HVM_PARAM_STORE_EVTCHN, &v);
> -		if (err)
> -			goto out_error;
> -		xen_store_evtchn = (int)v;
>  		err = hvm_get_parameter(HVM_PARAM_STORE_PFN, &v);
>  		if (err)
>  			goto out_error;
> -- 
> 2.34.1
> 

