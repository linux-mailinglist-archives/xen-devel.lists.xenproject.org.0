Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC744F4968
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 02:26:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299386.510059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbtUf-00081L-5v; Wed, 06 Apr 2022 00:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299386.510059; Wed, 06 Apr 2022 00:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbtUf-0007zD-2R; Wed, 06 Apr 2022 00:25:53 +0000
Received: by outflank-mailman (input) for mailman id 299386;
 Wed, 06 Apr 2022 00:25:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7cdP=UQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nbtUd-0007z7-JU
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 00:25:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b921ba8-b540-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 02:25:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 42AF66159A;
 Wed,  6 Apr 2022 00:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30424C385A1;
 Wed,  6 Apr 2022 00:25:47 +0000 (UTC)
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
X-Inumbo-ID: 1b921ba8-b540-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649204747;
	bh=O5nKSkNd807uEogC31BTplHLnny6bv478jRkQaBJIog=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oHBHdrTvwtJiRpPIt9D+PlSOG2ABnLK+s5HUw7mNYYzXP8i3L4xR4UtQVM6iMjQOu
	 BqfY8hjWq0FnKaH3ZnqHxBy0fE1V1diLv623ul1zyDDy/+qxj5lN87mJ7+oZau9gXv
	 FEv7U3CQu046JMEPpLYCMjFTY5X8Ac+vBNZit2b+lGSjvANkJBAy+rVhfDIZA7ircr
	 xcJVKg68cvFXHJNPWNLwciHG+Ha8hHT+clZqLIfuc0oBFF3om9c5VdvmHASzLP1dOr
	 ykF8bKnqG16wXEx2kcQPumaYcqKJ8bVkOeg2sZ6MQ0CfJBjBrrpM6Mz9GCOsL1VpLW
	 j+ebmvd+kFBMA==
Date: Tue, 5 Apr 2022 17:25:46 -0700 (PDT)
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
In-Reply-To: <94f37cdc-cce3-cd37-62bc-4310ca1b05ba@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204051723250.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop> <20220128213307.2822078-5-sstabellini@kernel.org> <395710eb-ba51-eb67-1519-2a949326f699@xen.org> <alpine.DEB.2.22.394.2203221821520.2910984@ubuntu-linux-20-04-desktop>
 <07fa2884-e497-250b-53ab-dd452b501920@xen.org> <alpine.DEB.2.22.394.2203311412490.2910984@ubuntu-linux-20-04-desktop> <94f37cdc-cce3-cd37-62bc-4310ca1b05ba@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 1 Apr 2022, Julien Grall wrote:
> On 01/04/2022 01:35, Stefano Stabellini wrote:
> > > > > > +
> > > > > > +    /* Alloc magic pages */
> > > > > > +    if (alloc_magic_pages(info, &dom) != 0) {
> > > > > > +        printf("Error on alloc magic pages\n");
> > > > > > +        return 1;
> > > > > > +    }
> > > > > > +
> > > > > > +    xc_dom_gnttab_init(&dom);
> > > > > 
> > > > > This call as the risk to break the guest if the dom0 Linux doesn't
> > > > > support
> > > > > the
> > > > > acquire interface. This is because it will punch a hole in the domain
> > > > > memory
> > > > > where the grant-table may have already been mapped.
> > > > > 
> > > > > Also, this function could fails.
> > > > 
> > > > I'll check for return errors. Dom0less is for fully static
> > > > configurations so I think it is OK to return error and abort if
> > > > something unexpected happens: dom0less' main reason for being is that
> > > > there is nothing unexpected :-)
> > > Does this mean the caller will have to reboot the system if there is an
> > > error?
> > > IOW, we don't expect them to call ./init-dom0less twice.
> > 
> > Yes, exactly. I think init-dom0less could even panic. My mental model is
> > that this is an "extension" of construct_domU. Over there we just panic
> > if something is wrong and here it would be similar. The user provided a
> > wrong config and should fix it.
> 
> Ok. I think we should make explicit how it can be used.
> 
> > > > > > +
> > > > > > +    libxl_uuid_generate(&uuid);
> > > > > > +    xc_domain_sethandle(dom.xch, info->domid,
> > > > > > libxl_uuid_bytearray(&uuid));
> > > > > > +
> > > > > > +    rc = gen_stub_json_config(info->domid, &uuid);
> > > > > > +    if (rc)
> > > > > > +        err(1, "gen_stub_json_config");
> > > > > > +
> > > > > > +    rc = restore_xenstore(xsh, info, uuid, dom.xenstore_evtchn);
> > > > > > +    if (rc)
> > > > > > +        err(1, "writing to xenstore");
> > > > > > +
> > > > > > +    xs_introduce_domain(xsh, info->domid,
> > > > > > +            (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) +
> > > > > > XENSTORE_PFN_OFFSET,
> > > > > > +            dom.xenstore_evtchn);
> > > > > 
> > > > > xs_introduce_domain() can technically fails.
> > > > 
> > > > OK
> > > > 
> > > > 
> > > > > > +    return 0;
> > > > > > +}
> > > > > > +
> > > > > > +/* Check if domain has been configured in XS */
> > > > > > +static bool domain_exists(struct xs_handle *xsh, int domid)
> > > > > > +{
> > > > > > +    return xs_is_domain_introduced(xsh, domid);
> > > > > > +}
> > > > > 
> > > > > Would not this lead to initialize a domain with PV driver disabled?
> > > > 
> > > > I am not sure I understood your question, but I'll try to answer anyway.
> > > > This check is purely to distinguish dom0less guests, which needs further
> > > > initializations, from regular guests (e.g. xl guests) that don't need
> > > > any actions taken here.
> > > 
> > > Dom0less domUs can be divided in two categories based on whether they are
> > > xen
> > > aware (e.g. xen,enhanced is set).
> > > 
> > > Looking at this script, it seems to assume that all dom0less domUs are Xen
> > > aware. So it will end up to allocate Xenstore ring and call
> > > xs_introduce_domain(). I suspect the call will end up to fail because the
> > > event channel would be 0.
> > > 
> > > So did you try to use this script on a platform where there only xen aware
> > > domU and/or a mix?
> > 
> > Good idea of asking for this test. I thought I already ran that test,
> > but I did it again to be sure. Everything works OK (although the
> > xenstore page allocation is unneeded). xs_introduce_domain does not
> > fail:
> 
> Are you sure? If I pass 0 as the 4th argument (event channel), the command
> will return EINVAL. However, looking at the code you are not checking the
> return for the call. So you will continue as if it were successful.

We are not passing 0 as the 4th argument, we are passing the event
channel previously set as HVM_PARAM_STORE_EVTCHN by Xen:

    rc = xc_hvm_param_get(xch, info->domid, HVM_PARAM_STORE_EVTCHN,
                          &xenstore_evtchn);

Also in my working version of the series I have a check for the return
value of xs_introduce_domain (as you requested in one of your previous
reviews). So xs_introduce_domain is actually working correctly and
returning success.

