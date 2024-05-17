Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B43F8C7F55
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 02:53:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723718.1128753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7lqF-0000C8-2Q; Fri, 17 May 2024 00:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723718.1128753; Fri, 17 May 2024 00:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7lqE-00009Z-Vn; Fri, 17 May 2024 00:52:58 +0000
Received: by outflank-mailman (input) for mailman id 723718;
 Fri, 17 May 2024 00:52:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ijk8=MU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7lqD-00009Q-N1
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 00:52:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbf43a37-13e7-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 02:52:56 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 545E56175C;
 Fri, 17 May 2024 00:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10DAFC113CC;
 Fri, 17 May 2024 00:52:52 +0000 (UTC)
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
X-Inumbo-ID: cbf43a37-13e7-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715907174;
	bh=TegGSMyB0JVbO6jlmENdPDoxx20cRA2GXqpfoyUXYVk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gvKGGnuyc4WhtBlCJuhbccSsXprf1zrb45rBV9rU6MXH0h7E4npLggND/8prIh3n5
	 K7JEMSUkE4XcEo4u9g1ewA+wlynihMT99qyPZB13/mfI4jbJbb9FRlpGFG5qLar9mc
	 xyhX1+h33s9YED2fgglcV3pZkRRlJ9Uah4wjuf+dTYijQwCtoLhvOkgEg1ijMcpHnU
	 Aw3eYvTbFutAx6hVWW6WSw3g5YI+m6riav9Jduf2VKXWM0FXSVKov2441NZOZc+FqV
	 d//YZdCaSdsze9BwKzw6StxG7qsrDLjUg5IC/eLX6DqsARE5O5dhDY2pSkfi2leVMu
	 YRWyR2ZHYrAqg==
Date: Thu, 16 May 2024 17:52:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <xin.wang2@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    Juergen Gross <jgross@suse.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] drivers/xen: Improve the late XenStore init protocol
In-Reply-To: <028f29be-0393-4a57-83e2-ea27fe0320d5@amd.com>
Message-ID: <alpine.DEB.2.22.394.2405161743170.2544314@ubuntu-linux-20-04-desktop>
References: <20240515014330.1044617-1-xin.wang2@amd.com> <alpine.DEB.2.22.394.2405151524270.2544314@ubuntu-linux-20-04-desktop> <028f29be-0393-4a57-83e2-ea27fe0320d5@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-217339045-1715907173=:2544314"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-217339045-1715907173=:2544314
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 16 May 2024, Henry Wang wrote:
> Hi Stefano,
> 
> On 5/16/2024 6:30 AM, Stefano Stabellini wrote:
> > On Wed, 15 May 2024, Henry Wang wrote:
> > > Currently, the late XenStore init protocol is only triggered properly
> > > for the case that HVM_PARAM_STORE_PFN is ~0ULL (invalid). For the
> > > case that XenStore interface is allocated but not ready (the connection
> > > status is not XENSTORE_CONNECTED), Linux should also wait until the
> > > XenStore is set up properly.
> > > 
> > > Introduce a macro to describe the XenStore interface is ready, use
> > > it in xenbus_probe_initcall() and xenbus_probe() to select the code
> > > path of doing the late XenStore init protocol or not.
> > > 
> > > Take the opportunity to enhance the check of the allocated XenStore
> > > interface can be properly mapped, and return error early if the
> > > memremap() fails.
> > > 
> > > Signed-off-by: Henry Wang <xin.wang2@amd.com>
> > > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > Please add a Fixes: tag
> 
> Sure. Will do.
> 
> > > ---
> > >   drivers/xen/xenbus/xenbus_probe.c | 21 ++++++++++++++++-----
> > >   1 file changed, 16 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/xen/xenbus/xenbus_probe.c
> > > b/drivers/xen/xenbus/xenbus_probe.c
> > > index 3205e5d724c8..8aec0ed1d047 100644
> > > --- a/drivers/xen/xenbus/xenbus_probe.c
> > > +++ b/drivers/xen/xenbus/xenbus_probe.c
> > > @@ -72,6 +72,10 @@ EXPORT_SYMBOL_GPL(xen_store_evtchn);
> > >   struct xenstore_domain_interface *xen_store_interface;
> > >   EXPORT_SYMBOL_GPL(xen_store_interface);
> > >   +#define XS_INTERFACE_READY \
> > > +	((xen_store_interface != NULL) && \
> > > +	 (xen_store_interface->connection == XENSTORE_CONNECTED))
> > > +
> > >   enum xenstore_init xen_store_domain_type;
> > >   EXPORT_SYMBOL_GPL(xen_store_domain_type);
> > >   @@ -751,9 +755,10 @@ static void xenbus_probe(void)
> > >   {
> > >   	xenstored_ready = 1;
> > >   -	if (!xen_store_interface) {
> > > -		xen_store_interface = memremap(xen_store_gfn <<
> > > XEN_PAGE_SHIFT,
> > > -					       XEN_PAGE_SIZE, MEMREMAP_WB);
> > > +	if (!xen_store_interface || XS_INTERFACE_READY) {
> > > +		if (!xen_store_interface)
> > These two nested if's don't make sense to me. If XS_INTERFACE_READY
> > succeeds, it means that  ((xen_store_interface != NULL) &&
> > (xen_store_interface->connection == XENSTORE_CONNECTED)).
> > 
> > So it is not possible that xen_store_interface == NULL immediately
> > after. Right?
> 
> I think this is because we want to free the irq for the late init case,
> otherwise the init-dom0less will fail. For the xenstore PFN allocated case,
> the connection is already set to CONNECTED when we execute init-dom0less. But
> I agree with you, would below diff makes more sense to you?
> 
> diff --git a/drivers/xen/xenbus/xenbus_probe.c
> b/drivers/xen/xenbus/xenbus_probe.c
> index 8aec0ed1d047..b8005b651a29 100644
> --- a/drivers/xen/xenbus/xenbus_probe.c
> +++ b/drivers/xen/xenbus/xenbus_probe.c
> @@ -76,6 +76,8 @@ EXPORT_SYMBOL_GPL(xen_store_interface);
>         ((xen_store_interface != NULL) && \
>          (xen_store_interface->connection == XENSTORE_CONNECTED))
> 
> +static bool xs_late_init = false;
> +
>  enum xenstore_init xen_store_domain_type;
>  EXPORT_SYMBOL_GPL(xen_store_domain_type);
> 
> @@ -755,7 +757,7 @@ static void xenbus_probe(void)
>  {
>         xenstored_ready = 1;
> 
> -       if (!xen_store_interface || XS_INTERFACE_READY) {
> +       if (xs_late_init) {
>                 if (!xen_store_interface)
>                         xen_store_interface = memremap(xen_store_gfn <<


I would just remove the outer 'if' and do this:


	if (!xen_store_interface)
		xen_store_interface = memremap(xen_store_gfn << XEN_PAGE_SHIFT,
				XEN_PAGE_SIZE, MEMREMAP_WB);
	/*
	 * Now it is safe to free the IRQ used for xenstore late
	 * initialization. No need to unbind: it is about to be
	 * bound again from xb_init_comms. Note that calling
	 * unbind_from_irqhandler now would result in xen_evtchn_close()
	 * being called and the event channel not being enabled again
	 * afterwards, resulting in missed event notifications.
	 */
	if (xs_init_irq > 0)
		free_irq(xs_init_irq, &xb_waitq);


I think this should work fine in all cases. I am unsure if
xs_init_irq==0 is possible valid value for xs_init_irq. If it is not,
then we are fine. If 0 is a possible valid irq number, then we should
initialize xs_init_irq to -1, and here check for xs_init_irq >= 0.
--8323329-217339045-1715907173=:2544314--

