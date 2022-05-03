Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC53517B3F
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 02:37:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319115.539209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlgWb-0002RO-V3; Tue, 03 May 2022 00:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319115.539209; Tue, 03 May 2022 00:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlgWb-0002PZ-Rg; Tue, 03 May 2022 00:36:21 +0000
Received: by outflank-mailman (input) for mailman id 319115;
 Tue, 03 May 2022 00:36:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/j1Y=VL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nlgWa-0002PS-D9
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 00:36:20 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bdac6c5-ca79-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 02:36:18 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 567D9B81AEB;
 Tue,  3 May 2022 00:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C138DC385A4;
 Tue,  3 May 2022 00:36:15 +0000 (UTC)
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
X-Inumbo-ID: 0bdac6c5-ca79-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651538176;
	bh=8ExZoNEzyhAcwZ0cSJzhH9XGdXeQ6MMfKD5tj7Bb4ZY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KDX4xqpF35m7drFuTvjMYHfmX5RGer/dB18+lQSj7+OHJPy+up/yxha/A2A59WyHo
	 8khOs/zS7iZzWdv2fHDmro/YNSBKhA5RKKAoX/dRku7ZuEepph1pzBpAieHo6phs+7
	 5Z0bkiMfXSMaLDNwCabEIrWPiRArFFChm2w+xQ4wXggLr1KyMwcRAQ7oY08NBwv97j
	 PgkTgXXRh5TSiMmxzpa+UHfPb+OxmGV5VJj3q4g8oLwMxvLIsBqriqxp7C6Q/31tLX
	 83DhIhbzQFgbL6PadRAbxkX0qmgIit6ChW96uQPERspLjRPeeGXFIiJEuTz+tmYyn8
	 4L27+lYDCizzw==
Date: Mon, 2 May 2022 17:36:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, jgross@suse.com
Subject: Re: [LINUX PATCH v3] xen: add support for initializing xenstore
 later as HVM domain
In-Reply-To: <e9c87df2-3677-52a9-1a17-1314ee3d9950@oracle.com>
Message-ID: <alpine.DEB.2.22.394.2205021728520.2819275@ubuntu-linux-20-04-desktop>
References: <20220429211027.2034134-1-sstabellini@kernel.org> <e9c87df2-3677-52a9-1a17-1314ee3d9950@oracle.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 29 Apr 2022, Boris Ostrovsky wrote:
> On 4/29/22 5:10 PM, Stefano Stabellini wrote:
> > From: Luca Miccio <lucmiccio@gmail.com>
> > 
> > When running as dom0less guest (HVM domain on ARM) the xenstore event
> > channel is available at domain creation but the shared xenstore
> > interface page only becomes available later on.
> > 
> > In that case, wait for a notification on the xenstore event channel,
> > then complete the xenstore initialization later, when the shared page
> > is actually available.
> > 
> > The xenstore page has few extra field. Add them to the shared struct.
> > One of the field is "connection", when the connection is ready, it is
> > zero. If the connection is not-zero, wait for a notification.
> > 
> > Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > CC: jgross@suse.com
> > CC: boris.ostrovsky@oracle.com
> > ---
> > Changes in v3:
> > - check for the connection field, if it is not zero, wait for event
> > 
> > Changes in v2:
> > - remove XENFEAT_xenstore_late_init
> > ---
> >   drivers/xen/xenbus/xenbus_probe.c  | 86 +++++++++++++++++++++++-------
> >   include/xen/interface/io/xs_wire.h |  3 ++
> >   2 files changed, 70 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/xen/xenbus/xenbus_probe.c
> > b/drivers/xen/xenbus/xenbus_probe.c
> > index fe360c33ce71..dc046d25789e 100644
> > --- a/drivers/xen/xenbus/xenbus_probe.c
> > +++ b/drivers/xen/xenbus/xenbus_probe.c
> > @@ -65,6 +65,7 @@
> >   #include "xenbus.h"
> >     +static int xs_init_irq;
> >   int xen_store_evtchn;
> >   EXPORT_SYMBOL_GPL(xen_store_evtchn);
> >   @@ -750,6 +751,17 @@ static void xenbus_probe(void)
> >   {
> >   	xenstored_ready = 1;
> >   +	if (!xen_store_interface) {
> > +		xen_store_interface = xen_remap(xen_store_gfn <<
> > XEN_PAGE_SHIFT,
> > +						XEN_PAGE_SIZE);
> > +		/*
> > +		 * Now it is safe to free the IRQ used for xenstore late
> > +		 * initialization. No need to unbind: it is about to be
> > +		 * bound again.
> 
> 
> This assumes knowledge of bind/unbind internals. I think we should unbind.

I gave it a try and there is a problem with unbinding the IRQ here. If I
do that, later when xb_init_comms calls bind_evtchn_to_irqhandler, the
event channel doesn't fire anymore. I did some testing and debugging and
as far as I can tell the issue is that if we call unbind_from_irqhandler
here, we end up calling xen_evtchn_close. Then, when xb_init_comms calls
bind_evtchn_to_irqhandler on the same evtchn, it is not enough to
receive event notifications anymore because from Xen POV the evtchn is
"closed".

If I comment out xen_evtchn_close() in __unbind_from_irq, then yes, I
can call unbind_from_irqhandler here instead of free_irq and everything
works.

My suggestion is to keep the call to free_irq here (not
unbind_from_irqhandler) and improve the in-code comment.

 
> > +		 */
> > +		free_irq(xs_init_irq, &xb_waitq);
> > +	}
> > +
> 
> 
> 
> > @@ -959,23 +988,42 @@ static int __init xenbus_init(void)
> >   		 *
> >   		 * Also recognize all bits set as an invalid value.
> 
> 
> Is this comment still correct?

I can improve the comment

 
> >   		 */
> > -		if (!v || !~v) {
> > +		if (!v) {
> >   			err = -ENOENT;
> >   			goto out_error;
> >   		}
> > -		/* Avoid truncation on 32-bit. */
> > +		if (v == ~0ULL) {
> > +			wait = true;
> > +		} else {
> > +			/* Avoid truncation on 32-bit. */

