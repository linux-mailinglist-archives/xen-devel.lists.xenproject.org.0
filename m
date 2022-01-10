Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0BB48A33B
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 23:55:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255564.437959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n73ZI-00069l-32; Mon, 10 Jan 2022 22:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255564.437959; Mon, 10 Jan 2022 22:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n73ZH-00066V-VP; Mon, 10 Jan 2022 22:55:11 +0000
Received: by outflank-mailman (input) for mailman id 255564;
 Mon, 10 Jan 2022 22:55:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O59d=R2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n73ZG-00066P-ES
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 22:55:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5af3b620-7268-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 23:55:08 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B40B46143D;
 Mon, 10 Jan 2022 22:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A307BC36AE3;
 Mon, 10 Jan 2022 22:55:05 +0000 (UTC)
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
X-Inumbo-ID: 5af3b620-7268-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641855306;
	bh=l1n8nwkRZfhik3lbiAeTIkqrZ7dDGs2+s1kQRrZaaJo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tZK9nqcEUBA+sRRu6qBSGPy6tAn858zHJ5Jl9N/0cO0npd0S69QYs9gQaisG1M12h
	 507bHIpVaX+/sd3mnOvN4tcVAgGxEnsDeZ2rs21uQBG7FZjJwzR+afgsFMFSpeoukU
	 Y73IXEgT+jQTCvC+0IS6NCy9h+AaDxvOHRGRmtlx97eIA/H251Ic3zsc7g0QtSMPpO
	 7PIn21iT77CbY69BMCjgYUk507kU9dImwG9qWjo4V5Xm8CLJCqkrUD0npVnq4+5gWD
	 a2m9bFc+FVylM3pFQjQXPByTvZxnci/hxD1VvXRRSZXy4VvcyEZzHssW06lo75mpvf
	 e+hADtBWeruQg==
Date: Mon, 10 Jan 2022 14:55:04 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
    Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH 1/7] xen: introduce XENFEAT_xenstore_late_init
In-Reply-To: <580a888e-24c4-5d16-8c70-f3d7b34ac2c9@xen.org>
Message-ID: <alpine.DEB.2.22.394.2201101340550.2060010@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop> <20220108004912.3820176-1-sstabellini@kernel.org> <580a888e-24c4-5d16-8c70-f3d7b34ac2c9@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 8 Jan 2022, Julien Grall wrote:
> On 08/01/2022 00:49, Stefano Stabellini wrote:
> > From: Luca Miccio <lucmiccio@gmail.com>
> > 
> > Introduce a new feature flag to signal that xenstore will not be
> > immediately available at boot time. Instead, xenstore will become
> > available later, and a notification of xenstore readiness will be
> > signalled to the guest using the xenstore event channel.
> 
> Hmmm... On the thread [1], you semmed to imply that new Linux version (I am
> assuming master) are ready to be used in dom0less with the node xen. So I am
> bit confused why this is necessary?

Today Linux/master can boot on Xen with this patch series applied and
with the hypervisor node in device tree. Linux boots fine but it is not
able to make use of the PV interfaces. During xenstore initialization,
Linux sees that HVM_PARAM_STORE_PFN has an invalid value, so it returns
error and continues without xenstore.

I have a patch for Linux that if XENFEAT_xenstore_late_init is present
makes Linux wait for an event notification before initializing xenstore:
https://marc.info/?l=xen-devel&m=164160299315589

So with v1 of the Xen and Linux patches series:
- Xen allocates the event channel at domain creation
- Linux boots, sees XENFEAT_xenstore_late_init and wait for an event
- init-dom0less later allocates the xenstore page
- init-dom0less triggers the xenstore event channel
- Linux receives the event and finishes the initialization, including
  mapping the xenstore page

With the Xen patches applies but no Linux patches, Linux would:
- try to initialize xenstore
- see an invalid HVM_PARAM_STORE_PFN and return error
- continue without xenstore



> > diff --git a/xen/include/public/features.h b/xen/include/public/features.h
> > index 9ee2f760ef..18f32b1a98 100644
> > --- a/xen/include/public/features.h
> > +++ b/xen/include/public/features.h
> > @@ -128,6 +128,12 @@
> >   #define XENFEAT_not_direct_mapped         16
> >   #define XENFEAT_direct_mapped             17
> >   +/*
> > + * The xenstore interface should be initialized only after receiving a
> > + * xenstore event channel notification.
> > + */
> > +#define XENFEAT_xenstore_late_init 18
> 
> You are assuming that there will be no event until Xenstored has discovered
> the domain. If I am not mistaken, this works because when you allocate an
> unbound port, we will not raise the event.
> 
> But I am not sure this is a guarantee for the event channel ABI. For instance,
> when using bind interdomain an event will be raised on the local port.
> 
> Looking at the Xenstore interface, there are a field connection. Could we use
> it (maybe a flag) to tell when the connection was fully initiated?

If we allocate HVM_PARAM_STORE_PFN directly from Xen, that would work
but the Linux xenbus driver will try to initialize the xenstore
interface immediately and it will get stuck in xenbus_thread. In my
tests wait_event_interruptible is the last thing that is called before
Linux getting stuck. Also note that functions like xb_init_comms looks
like they expect xenstored to be already up and running; xb_init_comms
is called unconditionally if the xenstore page and evtchn are
initialized successfully.

I liked your suggestion of adding a flag to struct
xenstore_domain_interface and I prototyped it. For instance, I added:

+#define XENSTORE_NOTREADY  2 /* xenstored not ready */

intf->connection is set to 2 by Xen at domain creation and later it is
set to 0 by init-dom0less.c to signal that the interface is now ready to
use. I think that would work fine but unfortunately it would break Linux
compatibility, because Linux/master of today doesn't know that it needs
to check for intf->connection to be 0 before continuing. It would get
stuck again because instead of waiting it would proceed with the
initialization.

Thus, I think we need to keep the allocation of HVM_PARAM_STORE_PFN
in init-dom0less.c not to break compatibility.

But we could get rid of XENFEAT_xenstore_late_init. The invalid value of
HVM_PARAM_STORE_PFN could be enough to tell Linux that it needs to
wait before it can continue with the initialization. There is no need
for XENFEAT_xenstore_late_init if we check that HVM_PARAM_STORE_EVTCHN
is valid but HVM_PARAM_STORE_PFN is zero.

If we do that, Linux/master keeps working (without PV drivers) because it
considers HVM_PARAM_STORE_PFN == 0 an error.

Linux with a new TBD patch would wait for an event notification and
check again HVM_PARAM_STORE_PFN when it receives the notification.

It is similar to what you suggested but instead of using a flag on the
Xenstore interface we would use the xen_param HVM_PARAM_STORE_PFN for
the same purpose. (FYI note that I'd be fine with using a flag on the
Xenstore shared interface page as well, but I cannot see how to make it
work without breaking compatibility with Linux/master.)

