Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5BD4EE568
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 02:35:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297146.506078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5GC-00070W-Ts; Fri, 01 Apr 2022 00:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297146.506078; Fri, 01 Apr 2022 00:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5GC-0006yi-PX; Fri, 01 Apr 2022 00:35:28 +0000
Received: by outflank-mailman (input) for mailman id 297146;
 Fri, 01 Apr 2022 00:35:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yIha=UL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1na5GA-0006no-AQ
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 00:35:26 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f1c30de-b153-11ec-a405-831a346695d4;
 Fri, 01 Apr 2022 02:35:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E782EB822B3;
 Fri,  1 Apr 2022 00:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 462D7C340F2;
 Fri,  1 Apr 2022 00:35:23 +0000 (UTC)
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
X-Inumbo-ID: 9f1c30de-b153-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648773323;
	bh=8PbnGsilja+yuut14P2stMTcQd6UuYjlv35HDSwoKA8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JlWRS7vVrHJNK/vgMdJM/3rpFSu4SteUlohobtJnip+HQKbqmJEpUST/+/ByXVT1I
	 aFIqgzWJ46lh4QMpb1GgORdnZjI20CWX0jipgFl4CP1j292tT8Ok4LV5GdBaf+Azk6
	 lH/f7vXAokpqyuV+mw/binjyLWlswiMFDLVnN66aGNdiDdxDXJdElQrvkZEXJejTds
	 c+kD6cg8rTEQcXirl5+6Y3S9LzXzathKRESvsb/jmvxpgA2iVLDUi7/Xw1vj2+aeOu
	 OgMOKZUu5cJjjA1WCVYAy3LCii2ZNDn1zt1TQUZBBOQs8vVM3C27DQX8M8ZP0gA2JZ
	 AHQqwLfevJ6Kw==
Date: Thu, 31 Mar 2022 17:35:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, jgross@suse.com, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 5/5] tools: add example application to initialize
 dom0less PV drivers
In-Reply-To: <07fa2884-e497-250b-53ab-dd452b501920@xen.org>
Message-ID: <alpine.DEB.2.22.394.2203311412490.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop> <20220128213307.2822078-5-sstabellini@kernel.org> <395710eb-ba51-eb67-1519-2a949326f699@xen.org> <alpine.DEB.2.22.394.2203221821520.2910984@ubuntu-linux-20-04-desktop>
 <07fa2884-e497-250b-53ab-dd452b501920@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Mar 2022, Julien Grall wrote:
> On 23/03/2022 02:50, Stefano Stabellini wrote:
> > On Sat, 29 Jan 2022, Julien Grall wrote:
> > > On 28/01/2022 21:33, Stefano Stabellini wrote:
> > > > +    libxl_uuid uuid;
> > > > +    uint64_t v;
> > > > +    int rc;
> > > > +
> > > > +    printf("Init dom0less domain: %d\n", info->domid);
> > > > +    dom.guest_domid = info->domid;
> > > > +    dom.xenstore_domid = 0;
> > > > +    dom.xch = xc_interface_open(0, 0, 0);
> > > > +
> > > > +    rc = xc_hvm_param_get(dom.xch, info->domid, HVM_PARAM_STORE_EVTCHN,
> > > > &v);
> > > > +    if (rc != 0) {
> > > > +        printf("Failed to get HVM_PARAM_STORE_EVTCHN\n");
> > > > +        return 1;
> > > > +    }
> > > > +    dom.xenstore_evtchn = v;
> > > > +
> > > > +    /* Console won't be initialized but set its data for completeness
> > > > */
> > > > +    dom.console_domid = 0;
> > > 
> > > I find a bit odd you set the domid but not the event channel, page. Can
> > > you
> > > explain?
> > > 
> > > Actually, can you explain why only half of the structure is initialized?
> >   We are only using the struct xc_dom_image parameter for
> > xc_dom_gnttab_init, and nothing else. We only need very few fields in
> > it. Basically we could call xc_dom_gnttab_seed directly and then we
> > wouldn't need struct xc_dom_image at all. Only the needed fields are
> > currently populated.
> 
> I would prefer if we don't use xc_dom_image and call xc_dom_gnttab_seed().
> This would:
>   1) reduce the risk that one of the unitialized field is will be mistakenly
> use
>   2) extra documentation (currently missing) to explain which fields is used.

I have done that, it is in v4


> > > > +
> > > > +    /* Alloc magic pages */
> > > > +    if (alloc_magic_pages(info, &dom) != 0) {
> > > > +        printf("Error on alloc magic pages\n");
> > > > +        return 1;
> > > > +    }
> > > > +
> > > > +    xc_dom_gnttab_init(&dom);
> > > 
> > > This call as the risk to break the guest if the dom0 Linux doesn't support
> > > the
> > > acquire interface. This is because it will punch a hole in the domain
> > > memory
> > > where the grant-table may have already been mapped.
> > > 
> > > Also, this function could fails.
> > 
> > I'll check for return errors. Dom0less is for fully static
> > configurations so I think it is OK to return error and abort if
> > something unexpected happens: dom0less' main reason for being is that
> > there is nothing unexpected :-)
> Does this mean the caller will have to reboot the system if there is an error?
> IOW, we don't expect them to call ./init-dom0less twice.

Yes, exactly. I think init-dom0less could even panic. My mental model is
that this is an "extension" of construct_domU. Over there we just panic
if something is wrong and here it would be similar. The user provided a
wrong config and should fix it.


> > > > +
> > > > +    libxl_uuid_generate(&uuid);
> > > > +    xc_domain_sethandle(dom.xch, info->domid,
> > > > libxl_uuid_bytearray(&uuid));
> > > > +
> > > > +    rc = gen_stub_json_config(info->domid, &uuid);
> > > > +    if (rc)
> > > > +        err(1, "gen_stub_json_config");
> > > > +
> > > > +    rc = restore_xenstore(xsh, info, uuid, dom.xenstore_evtchn);
> > > > +    if (rc)
> > > > +        err(1, "writing to xenstore");
> > > > +
> > > > +    xs_introduce_domain(xsh, info->domid,
> > > > +            (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET,
> > > > +            dom.xenstore_evtchn);
> > > 
> > > xs_introduce_domain() can technically fails.
> > 
> > OK
> > 
> > 
> > > > +    return 0;
> > > > +}
> > > > +
> > > > +/* Check if domain has been configured in XS */
> > > > +static bool domain_exists(struct xs_handle *xsh, int domid)
> > > > +{
> > > > +    return xs_is_domain_introduced(xsh, domid);
> > > > +}
> > > 
> > > Would not this lead to initialize a domain with PV driver disabled?
> > 
> > I am not sure I understood your question, but I'll try to answer anyway.
> > This check is purely to distinguish dom0less guests, which needs further
> > initializations, from regular guests (e.g. xl guests) that don't need
> > any actions taken here.
> 
> Dom0less domUs can be divided in two categories based on whether they are xen
> aware (e.g. xen,enhanced is set).
> 
> Looking at this script, it seems to assume that all dom0less domUs are Xen
> aware. So it will end up to allocate Xenstore ring and call
> xs_introduce_domain(). I suspect the call will end up to fail because the
> event channel would be 0.
> 
> So did you try to use this script on a platform where there only xen aware
> domU and/or a mix?

Good idea of asking for this test. I thought I already ran that test,
but I did it again to be sure. Everything works OK (although the
xenstore page allocation is unneeded). xs_introduce_domain does not
fail: I think that's because it is usually called on all domains by the
toolstack, even the ones without xenstore support in the kernel.

