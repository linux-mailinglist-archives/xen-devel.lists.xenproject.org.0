Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA2F4F49A6
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 02:28:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299391.510070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbtXH-0000G9-N1; Wed, 06 Apr 2022 00:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299391.510070; Wed, 06 Apr 2022 00:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbtXH-0000DR-Jr; Wed, 06 Apr 2022 00:28:35 +0000
Received: by outflank-mailman (input) for mailman id 299391;
 Wed, 06 Apr 2022 00:28:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7cdP=UQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nbtXG-0000DL-Nv
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 00:28:34 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7daf8555-b540-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 02:28:33 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 09D91B81C86;
 Wed,  6 Apr 2022 00:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34359C385A0;
 Wed,  6 Apr 2022 00:28:31 +0000 (UTC)
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
X-Inumbo-ID: 7daf8555-b540-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649204911;
	bh=NxEI9ahtAvw5lxkicNuUVV3EoYSVUirGs4xAH+5ZBl4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FVOYkFoKTZ7L0Vac4Stqx50IeoCIfXTD2YqD0HiKDVlTETq9nYmN7i3wKG2158IqJ
	 +PaB8PNNV/CZI6VtaA/p/YtH0IBjn8GJDVPaSuXLqRnJeakETo9/Nra7/41XhH3ERe
	 G0r5IEaoZn/fRh07geAY9DHjKWkZB/AMtxivYeWR+wHxeyexeXTYnTuZLh8a4AFdbM
	 f+MrXU7sFvu96WrwUFz1B12jpbqO2hJD77lx5HhnyNU8DQ/wOGbgPAm9p3+aULmGXb
	 kWm/vJ4rk3KhzQrpFuENZ+XHygv/+lXOXWa9eGKjc5xqYkelTsx/XmiQ4q6VyufLb2
	 397SChXkVX5dA==
Date: Tue, 5 Apr 2022 17:28:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 5/5] tools: add example application to initialize
 dom0less PV drivers
In-Reply-To: <2b5ef30a-5164-c685-e3bb-24dd29ad4236@suse.com>
Message-ID: <alpine.DEB.2.22.394.2204051726310.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop> <20220128213307.2822078-5-sstabellini@kernel.org> <395710eb-ba51-eb67-1519-2a949326f699@xen.org> <alpine.DEB.2.22.394.2203221821520.2910984@ubuntu-linux-20-04-desktop>
 <07fa2884-e497-250b-53ab-dd452b501920@xen.org> <alpine.DEB.2.22.394.2203311412490.2910984@ubuntu-linux-20-04-desktop> <94f37cdc-cce3-cd37-62bc-4310ca1b05ba@xen.org> <2b5ef30a-5164-c685-e3bb-24dd29ad4236@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-878572871-1649204911=:2910984"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-878572871-1649204911=:2910984
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 1 Apr 2022, Juergen Gross wrote:
> On 01.04.22 12:02, Julien Grall wrote:
> > Hi Stefano,
> > 
> > On 01/04/2022 01:35, Stefano Stabellini wrote:
> > > > > > > +
> > > > > > > +    /* Alloc magic pages */
> > > > > > > +    if (alloc_magic_pages(info, &dom) != 0) {
> > > > > > > +        printf("Error on alloc magic pages\n");
> > > > > > > +        return 1;
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    xc_dom_gnttab_init(&dom);
> > > > > > 
> > > > > > This call as the risk to break the guest if the dom0 Linux doesn't
> > > > > > support
> > > > > > the
> > > > > > acquire interface. This is because it will punch a hole in the
> > > > > > domain
> > > > > > memory
> > > > > > where the grant-table may have already been mapped.
> > > > > > 
> > > > > > Also, this function could fails.
> > > > > 
> > > > > I'll check for return errors. Dom0less is for fully static
> > > > > configurations so I think it is OK to return error and abort if
> > > > > something unexpected happens: dom0less' main reason for being is that
> > > > > there is nothing unexpected :-)
> > > > Does this mean the caller will have to reboot the system if there is an
> > > > error?
> > > > IOW, we don't expect them to call ./init-dom0less twice.
> > > 
> > > Yes, exactly. I think init-dom0less could even panic. My mental model is
> > > that this is an "extension" of construct_domU. Over there we just panic
> > > if something is wrong and here it would be similar. The user provided a
> > > wrong config and should fix it.
> > 
> > Ok. I think we should make explicit how it can be used.
> > 
> > > > > > > +
> > > > > > > +    libxl_uuid_generate(&uuid);
> > > > > > > +    xc_domain_sethandle(dom.xch, info->domid,
> > > > > > > libxl_uuid_bytearray(&uuid));
> > > > > > > +
> > > > > > > +    rc = gen_stub_json_config(info->domid, &uuid);
> > > > > > > +    if (rc)
> > > > > > > +        err(1, "gen_stub_json_config");
> > > > > > > +
> > > > > > > +    rc = restore_xenstore(xsh, info, uuid, dom.xenstore_evtchn);
> > > > > > > +    if (rc)
> > > > > > > +        err(1, "writing to xenstore");
> > > > > > > +
> > > > > > > +    xs_introduce_domain(xsh, info->domid,
> > > > > > > +            (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) +
> > > > > > > XENSTORE_PFN_OFFSET,
> > > > > > > +            dom.xenstore_evtchn);
> > > > > > 
> > > > > > xs_introduce_domain() can technically fails.
> > > > > 
> > > > > OK
> > > > > 
> > > > > 
> > > > > > > +    return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +/* Check if domain has been configured in XS */
> > > > > > > +static bool domain_exists(struct xs_handle *xsh, int domid)
> > > > > > > +{
> > > > > > > +    return xs_is_domain_introduced(xsh, domid);
> > > > > > > +}
> > > > > > 
> > > > > > Would not this lead to initialize a domain with PV driver disabled?
> > > > > 
> > > > > I am not sure I understood your question, but I'll try to answer
> > > > > anyway.
> > > > > This check is purely to distinguish dom0less guests, which needs
> > > > > further
> > > > > initializations, from regular guests (e.g. xl guests) that don't need
> > > > > any actions taken here.
> > > > 
> > > > Dom0less domUs can be divided in two categories based on whether they
> > > > are xen
> > > > aware (e.g. xen,enhanced is set).
> > > > 
> > > > Looking at this script, it seems to assume that all dom0less domUs are
> > > > Xen
> > > > aware. So it will end up to allocate Xenstore ring and call
> > > > xs_introduce_domain(). I suspect the call will end up to fail because
> > > > the
> > > > event channel would be 0.
> > > > 
> > > > So did you try to use this script on a platform where there only xen
> > > > aware
> > > > domU and/or a mix?
> > > 
> > > Good idea of asking for this test. I thought I already ran that test,
> > > but I did it again to be sure. Everything works OK (although the
> > > xenstore page allocation is unneeded). xs_introduce_domain does not
> >  > fail:
> > 
> > Are you sure? If I pass 0 as the 4th argument (event channel), the command
> > will return EINVAL. However, looking at the code you are not checking the
> > return for the call. So you will continue as if it were successful.
> > 
> > So you will end up to write nodes for a domain Xenstored is not aware and
> > also set HVM_PARAM_STORE_PFN which may further confuse the guest as it may
> > try to initialize Xenstored it discovers the page.
> > 
> > > I think that's because it is usually called on all domains by the
> > > toolstack, even the ones without xenstore support in the kernel.
> > 
> > The toolstack will always allocate the event channel irrespective to whether
> > the guest will use Xenstore. So both the shared page and the event channel
> > are always valid today.
> > 
> > With your series, this will change as the event channel will not be
> > allocated when "xen,enhanced" is not set.
> > 
> > In your case, I think we may want to register the domain to xenstore but say
> > there are no connection available for the domain. Juergen, what do you
> > think?
> 
> In my opinion such a domain should not be registered with Xenstore.
> 
> At least C-xenstored should work mostly correctly. I think the
> "introduced" status is tested everywhere it should be tested.
> 
> Basically this is similar to today's status of xenstore-stubdom: it
> is never introduced, but Xenstore itself is happy with it existing. :-)
> 
> And even today the first nodes for a new domain are being created
> before the domain is officially introduced.

We could skip introducing dom0less domains that don't have
"xen,enhanced" without issues. It is easy to distinguish dom0less
domains that have "xen,enhanced" from the ones that don't have it
because only the one with "xen,enhanced" have a valid event channel set
as HVM_PARAM_STORE_EVTCHN.

So if the event channel is not valid, we can simply skip the
xs_introduce_domain call (which would probably fail anyway as Julien
pointed out).
--8323329-878572871-1649204911=:2910984--

