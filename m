Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9B24552CD
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 03:38:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227069.392616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnXIv-0000tz-Cz; Thu, 18 Nov 2021 02:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227069.392616; Thu, 18 Nov 2021 02:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnXIv-0000rP-9r; Thu, 18 Nov 2021 02:37:37 +0000
Received: by outflank-mailman (input) for mailman id 227069;
 Thu, 18 Nov 2021 02:37:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl7d=QF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mnXIu-0000rJ-09
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 02:37:36 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b50bf70-4818-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 03:37:34 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E94DD61ABF;
 Thu, 18 Nov 2021 02:37:31 +0000 (UTC)
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
X-Inumbo-ID: 7b50bf70-4818-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637203052;
	bh=wPjXsYR+kvoDOxY3F8/OcBtzPdH/YiJv/4y80ZmPSDU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=R9H9zDv9ZDIXa9Pm5x57YwM/p+E7zA+AOFpGIT3/Vt+Sx0onRKzie3rYsDUX5mYQl
	 eAQw4BV906a3Hn9O23btPQHkBsdhAkhU+cfOwevieccV38z3ui9RegNWtaS+rtDvoL
	 n7s+LFfCJDQMqCPp+M3wsGjbXxNLeRlqzpsRVTVjeMli18E1vResHenwylLcX/IC8/
	 G2d7358E4Nc1PHnWycznMttgGWiUHJS4QCpLywez8wXuYKHW1S8JGSWlUBoSglWgH+
	 upSNi1QAgxw6jWKPm/Xbs3cJxjwd/w6XOMDCJvtIsDr4dFrHSrvcPJ/QmQNSPw0gZK
	 Kc84YxY2qOMUA==
Date: Wed, 17 Nov 2021 18:37:30 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, stable@vger.kernel.org, 
    jgross@suse.com
Subject: Re: [PATCH] xen: detect uninitialized xenbus in xenbus_init
In-Reply-To: <2592121c-ed62-c346-5aeb-37adb6bb1982@suse.com>
Message-ID: <alpine.DEB.2.22.394.2111171823160.1412361@ubuntu-linux-20-04-desktop>
References: <20211117021145.3105042-1-sstabellini@kernel.org> <2592121c-ed62-c346-5aeb-37adb6bb1982@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 17 Nov 2021, Jan Beulich wrote:
> On 17.11.2021 03:11, Stefano Stabellini wrote:
> > --- a/drivers/xen/xenbus/xenbus_probe.c
> > +++ b/drivers/xen/xenbus/xenbus_probe.c
> > @@ -951,6 +951,18 @@ static int __init xenbus_init(void)
> >  		err = hvm_get_parameter(HVM_PARAM_STORE_PFN, &v);
> >  		if (err)
> >  			goto out_error;
> > +		/*
> > +		 * Uninitialized hvm_params are zero and return no error.
> > +		 * Although it is theoretically possible to have
> > +		 * HVM_PARAM_STORE_PFN set to zero on purpose, in reality it is
> > +		 * not zero when valid. If zero, it means that Xenstore hasn't
> > +		 * been properly initialized. Instead of attempting to map a
> > +		 * wrong guest physical address return error.
> > +		 */
> > +		if (v == 0) {
> > +			err = -ENOENT;
> > +			goto out_error;
> > +		}
> 
> If such a check gets added, then I think known-invalid frame numbers
> should be covered at even higher a priority than zero.

Uhm, that's a good point. We could check for 0 and also ULONG_MAX


> This would, for example, also mean to ...
>
> >  		xen_store_gfn = (unsigned long)v;
> 
> ... stop silently truncating a value here.

Yeah, it can only happen on 32-bit but you have a point.


> By covering them we would then have the option to pre-fill PFN params
> with, say, ~0 in the hypervisor (to clearly identify them as invalid,
> rather than having to guess at the validity of 0). I haven't really
> checked yet whether such a change would be compatible with existing
> software ...

I had the same idea. I think the hvm_params should be initialized to an
invalid value in Xen. But here in Linux we need to be able to cope with
older Xen versions too so it still makes sense to check for zero in
places where it is very obviously incorrect (HVM_PARAM_STORE_PFN).


What do you think of the appended?



diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 94405bb3829e..04558d3a5562 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -951,6 +951,28 @@ static int __init xenbus_init(void)
 		err = hvm_get_parameter(HVM_PARAM_STORE_PFN, &v);
 		if (err)
 			goto out_error;
+		/*
+		 * Return error on an invalid value.
+		 *
+		 * Uninitialized hvm_params are zero and return no error.
+		 * Although it is theoretically possible to have
+		 * HVM_PARAM_STORE_PFN set to zero on purpose, in reality it is
+		 * not zero when valid. If zero, it means that Xenstore hasn't
+		 * been properly initialized. Instead of attempting to map a
+		 * wrong guest physical address return error.
+		 */
+		if (v == 0) {
+			err = -ENOENT;
+			goto out_error;
+		}
+		/*
+		 * ULONG_MAX is invalid on 64-bit because is INVALID_PFN.
+		 * On 32-bit return error to avoid truncation.
+		 */
+		if (v >= ULONG_MAX) {
+			err = -EINVAL;
+			goto out_error;
+		}
 		xen_store_gfn = (unsigned long)v;
 		xen_store_interface =
 			xen_remap(xen_store_gfn << XEN_PAGE_SHIFT,

