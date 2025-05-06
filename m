Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B72AAD1B7
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 01:51:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978074.1364945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCS3g-0008P1-Uy; Tue, 06 May 2025 23:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978074.1364945; Tue, 06 May 2025 23:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCS3g-0008Lt-RP; Tue, 06 May 2025 23:50:44 +0000
Received: by outflank-mailman (input) for mailman id 978074;
 Tue, 06 May 2025 23:50:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZXP=XW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uCS3e-0008H9-Og
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 23:50:42 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8d0fb82-2ad4-11f0-9ffb-bf95429c2676;
 Wed, 07 May 2025 01:50:38 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CED5444113;
 Tue,  6 May 2025 23:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5876C4CEE4;
 Tue,  6 May 2025 23:50:35 +0000 (UTC)
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
X-Inumbo-ID: e8d0fb82-2ad4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746575436;
	bh=K2EpZFZm5KmhUkaGNC7dpG3OXzxxMH7yltZGwwMxS2M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HU9q6mErzeytk8DcWlsZQatn9YR63FLL7AWA6n5+PNC+GxYihjLpwvKGnIXcwvwDU
	 lee5X5I3uXYHoemea/mDaZB5JH/C/cydo3u25nZWCjhNnExzUBtemZQVsGMf78ssKu
	 KbIl8t8vrCStdOnsvbbRtD/dhqzZZksS0eP3H1/NgNr6aE4QTqR0adJ0dzrbYi7EOL
	 a6kTMxnH8sHQYV1ugHQQcRDlzJU713upAbTwfnnZ8yWfhJ454mM4pzigPNKe9bZ6B4
	 7AIW1BM4uaSzKWXmUY14kTbgn1QqC8YfMf7k8mFWLpJxR84zWYoxV9s2GnEqmMJQH/
	 Py6YfMDvDHTYg==
Date: Tue, 6 May 2025 16:50:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xenbus: Allow PVH dom0 a non-local xenstore
In-Reply-To: <63d6ff3c-bed5-4a7f-bd3e-50b99b5a6f4b@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505061648590.3879245@ubuntu-linux-20-04-desktop>
References: <20250503131935.1885-1-jason.andryuk@amd.com> <alpine.DEB.2.22.394.2505051343080.3879245@ubuntu-linux-20-04-desktop> <63d6ff3c-bed5-4a7f-bd3e-50b99b5a6f4b@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 May 2025, Jason Andryuk wrote:
> On 2025-05-05 16:44, Stefano Stabellini wrote:
> > On Sat, 3 May 2025, Jason Andryuk wrote:
> > > Make xenbus_init() allow a non-local xenstore for a PVH dom0 - it is
> > > currently forced to XS_LOCAL.  With Hyperlaunch booting dom0 and a
> > > xenstore stubdom, dom0 can be handled as a regular XS_HVM following the
> > > late init path.
> > > 
> > > Drop the use of xen_initial_domain() and just check for the event
> > > channel instead.  This matches the PV case where there is no check for
> > > initial domain.
> > > 
> > > Check the full 64bit HVM_PARAM_STORE_EVTCHN value to catch the off
> > > chance that high bits are set for the 32bit event channel.
> > > 
> > > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > 
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Thanks, Stefano.  But I'm wondering if this might break ARM enhanced
> no-xenstore.
> 
> > 
> > > ---
> > >   drivers/xen/xenbus/xenbus_probe.c | 14 ++++++++------
> > >   1 file changed, 8 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/xen/xenbus/xenbus_probe.c
> > > b/drivers/xen/xenbus/xenbus_probe.c
> > > index 6d32ffb01136..7604f70ee108 100644
> > > --- a/drivers/xen/xenbus/xenbus_probe.c
> > > +++ b/drivers/xen/xenbus/xenbus_probe.c
> > > @@ -966,9 +966,15 @@ static int __init xenbus_init(void)
> > >   	if (xen_pv_domain())
> > >   		xen_store_domain_type = XS_PV;
> > >   	if (xen_hvm_domain())
> > > +	{
> > >   		xen_store_domain_type = XS_HVM;
> 
> ARM would have everything set to XS_HVM...
> 
> > > -	if (xen_hvm_domain() && xen_initial_domain())
> > > -		xen_store_domain_type = XS_LOCAL;
> 
> ...and only dom0 set to XS_LOCAL.
> 
> > > +		err = hvm_get_parameter(HVM_PARAM_STORE_EVTCHN, &v);
> > > +		if (err)
> > > +			goto out_error;
> > > +		xen_store_evtchn = (int)v;
> > > +		if (!v)
> > > +			xen_store_domain_type = XS_LOCAL;
> > > +	}
> > >   	if (xen_pv_domain() && !xen_start_info->store_evtchn)
> > >   		xen_store_domain_type = XS_LOCAL;
> > >   	if (xen_pv_domain() && xen_start_info->store_evtchn)
> > > @@ -987,10 +993,6 @@ static int __init xenbus_init(void)
> > >   		xen_store_interface = gfn_to_virt(xen_store_gfn);
> > >   		break;
> > >   	case XS_HVM:
> > > -		err = hvm_get_parameter(HVM_PARAM_STORE_EVTCHN, &v);
> > > -		if (err)
> > > -			goto out_error;
> > > -		xen_store_evtchn = (int)v;
> > >   		err = hvm_get_parameter(HVM_PARAM_STORE_PFN, &v);
> > >   		if (err)
> > >   			goto out_error;
>                 /*
>                  * Uninitialized hvm_params are zero and return no error.
>                  * Although it is theoretically possible to have
>                  * HVM_PARAM_STORE_PFN set to zero on purpose, in reality it
> is
>                  * not zero when valid. If zero, it means that Xenstore hasn't
>                  * been properly initialized. Instead of attempting to map a
>                  * wrong guest physical address return error.
>                  *
>                  * Also recognize all bits set as an invalid/uninitialized
> value.
>                  */
>                 if (!v) {
>                         err = -ENOENT;
>                         goto out_error;
>                 }
> 
> IIUC, this !v check is for enhanced no-xenstore to end up in XS_UNKNOWN.  I'll
> have to re-work to handle that case.

I was wondering about that when reviewing this patch, because the
removal of this check was the main change introduced I wasn't sure
about. Looking around I (wrongly) convinced myself that removing the
check was OK. Thank you for spotting this on your own.

