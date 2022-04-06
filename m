Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AF64F5084
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 04:22:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299439.510138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbvIx-0007w5-Bl; Wed, 06 Apr 2022 02:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299439.510138; Wed, 06 Apr 2022 02:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbvIx-0007tA-7q; Wed, 06 Apr 2022 02:21:55 +0000
Received: by outflank-mailman (input) for mailman id 299439;
 Wed, 06 Apr 2022 02:21:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7cdP=UQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nbvIu-0007t4-S3
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 02:21:53 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f8ec5ce-b550-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 04:21:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7E800B81FB5;
 Wed,  6 Apr 2022 02:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0CDEC385A1;
 Wed,  6 Apr 2022 02:21:44 +0000 (UTC)
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
X-Inumbo-ID: 4f8ec5ce-b550-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649211705;
	bh=XT4LCodSquSiT8Nb1uAr9T4Gh2L8Wl5+SXM7kZaAuNQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=vRp2DZTnocPfxbZEiP3caN0Q4fWrhzHFbsC4kkNsVPO3wv1b/gzlckFXGQ2v2mFLf
	 8ni0qMMVivWL2KBruCkN5mL++HeKpUIjbyiTV4Elt7Ca+S3L6BG2b9y3P/513C4kHk
	 v9VdI4lOWCjcZpLAVPNjmzFXKnOkmtsc7SVDfjPQOUDtWdc5MJTgiKu2GWTU8b4pa4
	 VyMPAjerh/mM6+JSL+K98iKhDPVR9CGVtRajKuFOjOQrcc6FV8OhP5lt0J7vpA9Qp4
	 JonyRFep6V3blea38x6Bp0rwk4ZyPITCp17ZpJ6jlt6fD4OMa5SL8f+y6SLRK5/NjB
	 5asYhACkiWcLg==
Date: Tue, 5 Apr 2022 19:21:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v4 8/9] tools: add example application to initialize
 dom0less PV drivers
In-Reply-To: <39fc312c-cf0b-d7ff-c560-7c6b96809416@suse.com>
Message-ID: <alpine.DEB.2.22.394.2204051758250.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop> <20220401003847.38393-8-sstabellini@kernel.org> <e71ad6f6-f920-1e7b-9f4b-dd2e133a23c5@xen.org> <39fc312c-cf0b-d7ff-c560-7c6b96809416@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1812572471-1649206970=:2910984"
Content-ID: <alpine.DEB.2.22.394.2204051802590.2910984@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1812572471-1649206970=:2910984
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2204051802591.2910984@ubuntu-linux-20-04-desktop>

On Fri, 1 Apr 2022, Juergen Gross wrote:
> On 01.04.22 12:21, Julien Grall wrote:
> > Hi,
> > 
> > I have posted some comments in v3 after you sent this version. Please have a
> > look.
> > 
> > On 01/04/2022 01:38, Stefano Stabellini wrote:
> > > +static int init_domain(struct xs_handle *xsh, libxl_dominfo *info)
> > > +{
> > > +    struct xc_interface_core *xch;
> > > +    libxl_uuid uuid;
> > > +    uint64_t xenstore_evtchn, xenstore_pfn;
> > > +    int rc;
> > > +
> > > +    printf("Init dom0less domain: %u\n", info->domid);
> > > +    xch = xc_interface_open(0, 0, 0);
> > > +
> > > +    rc = xc_hvm_param_get(xch, info->domid, HVM_PARAM_STORE_EVTCHN,
> > > +                          &xenstore_evtchn);
> > > +    if (rc != 0) {
> > > +        printf("Failed to get HVM_PARAM_STORE_EVTCHN\n");
> > > +        return 1;
> > > +    }
> > > +
> > > +    /* Alloc xenstore page */
> > > +    if (alloc_xs_page(xch, info, &xenstore_pfn) != 0) {
> > > +        printf("Error on alloc magic pages\n");
> > > +        return 1;
> > > +    }
> > > +
> > > +    rc = xc_dom_gnttab_seed(xch, info->domid, true,
> > > +                            (xen_pfn_t)-1, xenstore_pfn, 0, 0);
> > > +    if (rc)
> > > +        err(1, "xc_dom_gnttab_seed");
> > > +
> > > +    libxl_uuid_generate(&uuid);
> > > +    xc_domain_sethandle(xch, info->domid, libxl_uuid_bytearray(&uuid));
> > > +
> > > +    rc = gen_stub_json_config(info->domid, &uuid);
> > > +    if (rc)
> > > +        err(1, "gen_stub_json_config");
> > > +
> > > +    /* Now everything is ready: set HVM_PARAM_STORE_PFN */
> > > +    rc = xc_hvm_param_set(xch, info->domid, HVM_PARAM_STORE_PFN,
> > > +                          xenstore_pfn);
> > 
> > On patch #1, you told me you didn't want to allocate the page in Xen because
> > it wouldn't be initialized by Xenstored. But this is what we are doing here.
> 
> Xenstore (at least the C variant) is only using the fixed grant ref
> GNTTAB_RESERVED_XENSTORE, so it doesn't need the page to be advertised
> to the guest. And the mapping is done only when the domain is being
> introduced to Xenstore.
> 
> > 
> > This would be a problem if Linux is still booting and hasn't yet call
> > xenbus_probe_initcall().
> > 
> > I understand we need to have the page setup before raising the event
> > channel. I don't think we can allow Xenstored to set the HVM_PARAM (it may
> > run in a domain with less privilege). So I think we may need to create a
> > separate command to kick the client (not great).
> > 
> > Juergen, any thoughts?
> 
> I think it should work like that:
> 
> - setup the grant via xc_dom_gnttab_seed()
> - introduce the domain to Xenstore
> - call xc_hvm_param_set()
> 
> When the guest is receiving the event, it should wait for the xenstore
> page to appear.


I am OK with what you wrote above, and I understand Julien's concerns
about "waiting". Before discussing that, I would like to make sure I
understood why setting HVM_PARAM_STORE_PFN first (before
xs_introduce_domain) is not possible.

In a previous reply to Julien I wrote that it is not a good idea to
set HVM_PARAM_STORE_PFN in Xen before creating the domains because it
would cause Linux to hang at boot. That is true, Linux hangs on
drivers/xen/xenbus/xenbus_comms.c:xb_init_comms waiting on xb_waitq.
It could wait a very long time as domUs are typically a lot faster than
dom0 to boot.

However, if we set HVM_PARAM_STORE_PFN before calling
xs_introduce_domain in init-dom0less, for Linux to see it before
xs_introduce_domain is done, Linux would need to be racing against
init-dom0less. In that case, the wait in xb_init_comms would be minimal
anyway. It shouldn't be a problem. There would be no "hang", just a wait
a bit longer than usual.

Is that right?

--8323329-1812572471-1649206970=:2910984--

