Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AD1AAD1C0
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 01:57:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978090.1364953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCSAB-0000e0-Mj; Tue, 06 May 2025 23:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978090.1364953; Tue, 06 May 2025 23:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCSAB-0000bi-K4; Tue, 06 May 2025 23:57:27 +0000
Received: by outflank-mailman (input) for mailman id 978090;
 Tue, 06 May 2025 23:57:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZXP=XW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uCSAA-0000bc-Gk
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 23:57:26 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db3e7861-2ad5-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 01:57:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9957261165;
 Tue,  6 May 2025 23:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630FFC4CEE4;
 Tue,  6 May 2025 23:57:22 +0000 (UTC)
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
X-Inumbo-ID: db3e7861-2ad5-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746575843;
	bh=yxSEOOrKIkvEzMKukyHAhQPQyFWYQHJ/8Utird1u5bU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JVYJz8oNyKONT9+TOS6KyHKoWQjF7wfPUuYUryFI+j3cj7KUTD2WcFnIwXu97KDjW
	 3wti9Pkvrm9RPyaLMMR3/kBorRBltIwgDy8FbIKVwa5ce+cGxZGojuJmgwSAe/xhY/
	 q6bmhV6AGQbA08ocA5xJPlbhyFXGn0NjgxqrLmL4LLnX7dHwQhK2JYdwZwZgM89YfU
	 LY3LXL/psSODAFl4P0+DxsBrKQHnQuYLmHEn8zqEvRjKY7p+I6ZDj2B9PtIFaqcyLW
	 o/cLWkYAg4QHE1QeZnhQWUblcEK9x0GuXfuAFRsedb1Oesz/tJthqXgWXMmgjAbzjb
	 ZUSz2W3tbkVSA==
Date: Tue, 6 May 2025 16:57:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] xenbus: Allow PVH dom0 a non-local xenstore
In-Reply-To: <20250506204456.5220-1-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505061657080.3879245@ubuntu-linux-20-04-desktop>
References: <20250506204456.5220-1-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 May 2025, Jason Andryuk wrote:
> Make xenbus_init() allow a non-local xenstore for a PVH dom0 - it is
> currently forced to XS_LOCAL.  With Hyperlaunch booting dom0 and a
> xenstore stubdom, dom0 can be handled as a regular XS_HVM following the
> late init path.
> 
> Ideally we'd drop the use of xen_initial_domain() and just check for the
> event channel instead.  However, ARM has a xen,enhanced no-xenstore
> mode, where the event channel and PFN would both be 0.  Retain the
> xen_initial_domain() check, and use that for an additional check when
> the event channel is 0.
> 
> Check the full 64bit HVM_PARAM_STORE_EVTCHN value to catch the off
> chance that high bits are set for the 32bit event channel.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Change-Id: I5506da42e4c6b8e85079fefb2f193c8de17c7437
> ---
> v2:
> Re-add xen_initial_domain() check to avoid breaking ARM's xen,enhanced
> no-xenstore mode where event channel and PFN are both 0.

Thanks for the catch!

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


>  drivers/xen/xenbus/xenbus_probe.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
> index 22d3f90ee205..b12cbd9663e3 100644
> --- a/drivers/xen/xenbus/xenbus_probe.c
> +++ b/drivers/xen/xenbus/xenbus_probe.c
> @@ -969,9 +969,15 @@ static int __init xenbus_init(void)
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
> +		if (!v && xen_initial_domain())
> +			xen_store_domain_type = XS_LOCAL;
> +	}
>  	if (xen_pv_domain() && !xen_start_info->store_evtchn)
>  		xen_store_domain_type = XS_LOCAL;
>  	if (xen_pv_domain() && xen_start_info->store_evtchn)
> @@ -990,10 +996,6 @@ static int __init xenbus_init(void)
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

