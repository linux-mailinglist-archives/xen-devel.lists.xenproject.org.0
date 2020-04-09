Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 550611A37E7
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 18:22:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMZwP-000723-5s; Thu, 09 Apr 2020 16:22:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VOqT=5Z=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jMZwN-00071y-VV
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 16:22:08 +0000
X-Inumbo-ID: 41574146-7a7e-11ea-82fc-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41574146-7a7e-11ea-82fc-12813bfff9fa;
 Thu, 09 Apr 2020 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=AwqjL1FahRghq/bC8cpaviKJV0RDfIDk/SyOyf4MbwM=; b=yapafI3v6kUtG8LW1RY/jG+K+s
 SE2VXB9JPQmRcObwcbLy7bjPmgfSBuOMPn4yLWf6vw24hRgBpy5dnS3dC132er0uStXElfoXnYT2Y
 kaUeuAF2b3dvSMaD8o6ymE3fqpjTsKSuKiXdLlkDL64aeHeJxXik6etpNkyZgQKP6/5M=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jMZwI-0001W8-B6; Thu, 09 Apr 2020 16:22:02 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jMZwI-0003k7-1W; Thu, 09 Apr 2020 16:22:02 +0000
Date: Thu, 9 Apr 2020 17:21:59 +0100
From: Wei Liu <wl@xen.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: [PATCH v14 3/3] xen/tools: VM forking toolstack side
Message-ID: <20200409162159.cb2h7a6tmkbaduay@debian>
References: <cover.1586186121.git.tamas.lengyel@intel.com>
 <6d63f89124c7445be3185ab6722992b707dab72b.1586186121.git.tamas.lengyel@intel.com>
 <20200409154243.6ouh7r37fwm32mjg@debian>
 <CABfawhndtUA3hVyq9ObbuGRJOVg84qxPgEpc-HsEMxn7A7j_jA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABfawhndtUA3hVyq9ObbuGRJOVg84qxPgEpc-HsEMxn7A7j_jA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 09, 2020 at 09:51:35AM -0600, Tamas K Lengyel wrote:
> On Thu, Apr 9, 2020 at 9:43 AM Wei Liu <wl@xen.org> wrote:
> >
> > On Mon, Apr 06, 2020 at 08:20:05AM -0700, Tamas K Lengyel wrote:
> > > Add necessary bits to implement "xl fork-vm" commands. The command allows the
> > > user to specify how to launch the device model allowing for a late-launch model
> > > in which the user can execute the fork without the device model and decide to
> > > only later launch it.
> > >
> > > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > > ---
> > [...]
> > >
> > > +int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
> > > +                       libxl__domain_build_state *state,
> > > +                       uint32_t *domid, bool soft_reset)
> >
> > It would have been nice if you could split the refactoring out to a
> > separate patch.
> 
> I found the toolstack to be way harder to work with then the
> hypervisor code-base. Splitting the patches would have been nice but I
> don't even know how to begin that since it's all such a spaghetti.

In this case you've split out some code from a function to make a new
function. That is a self-contained task, which can be in its own patch.

> 
> >
> > >  static int store_libxl_entry(libxl__gc *gc, uint32_t domid,
> > >                               libxl_domain_build_info *b_info)
> > >  {
> > > @@ -1191,16 +1207,32 @@ static void initiate_domain_create(libxl__egc *egc,
> > >      ret = libxl__domain_config_setdefault(gc,d_config,domid);
> > >      if (ret) goto error_out;
> > >
> > > -    ret = libxl__domain_make(gc, d_config, &dcs->build_state, &domid,
> > > -                             dcs->soft_reset);
> > > -    if (ret) {
> > > -        LOGD(ERROR, domid, "cannot make domain: %d", ret);
> > > +    if ( !d_config->dm_restore_file )
> > > +    {
> > > +        ret = libxl__domain_make(gc, d_config, &dcs->build_state, &domid,
> > > +                                 dcs->soft_reset);
> > >          dcs->guest_domid = domid;
> > > +
> > > +        if (ret) {
> > > +            LOGD(ERROR, domid, "cannot make domain: %d", ret);
> > > +            ret = ERROR_FAIL;
> > > +            goto error_out;
> > > +        }
> > > +    } else if ( dcs->guest_domid != INVALID_DOMID ) {
> >
> > Coding style issue here.
> >
> > There are quite a few of them.  I won't point them out one by one
> > though. Let's focus on the interface first.
> 
> Do we have an automatic formatter we could just run on this code-base?
> I don't know what style issue you are referring to and given that the
> coding style here is different here compared to the hypervisor I find
> it very hard to figure it out what other issues you spotted. Please
> report them because I won't be able to spot them manually. To me it
> all looks fine as-is.

I feel your pain. There was work in progress to provide a style checker,
but we're not there yet.

Xen and libxc share one coding style while libxl and xl share another.
There is a CODING_STYLE file under libxl directory.  The problem here is
you should not have spaces inside ().

Generally I think pointing out coding style issues tend to distract
people from discussing more important things, so I would leave them last
to fix.

> 
> > >
> > > +/*
> > > + * The parent domain is expected to be created with default settings for
> > > + * - max_evtch_port
> > > + * - max_grant_frames
> > > + * - max_maptrack_frames
> > > + */
> > > +int libxl_domain_fork_vm(libxl_ctx *ctx, uint32_t pdomid, uint32_t max_vcpus, uint32_t *domid)
> > > +{
> > > +    int rc;
> > > +    struct xen_domctl_createdomain create = {0};
> > > +    create.flags |= XEN_DOMCTL_CDF_hvm;
> > > +    create.flags |= XEN_DOMCTL_CDF_hap;
> > > +    create.flags |= XEN_DOMCTL_CDF_oos_off;
> > > +    create.arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
> > > +    create.ssidref = SECINITSID_DOMU;
> > > +    create.max_vcpus = max_vcpus;
> >
> >
> > Some questions:
> >
> > Why does the caller need to specify the number of vcpus?
> >
> > Since the parent (source) domain is around, can you retrieve its domain
> > configuration such that you know its max_vcpus and other information
> > including max_evtchn_port and maptrack frames?
> 
> Because we want to avoid having to issue an extra hypercall for these.
> Normally these pieces of information will be available for the user
> and won't change, so we save time by not querying for it every time a
> fork is created. Remember, we might be creating thousands of forks in
> a very short time, so those extra hypercalls add up.

I see. Speed is a big concern to you.

What I was referring to doesn't require issuing hypercalls but requires
calling libxl_retrieve_domain_configuration. That's likely to be even
slower than making a hypercall.

I'm afraid the current incarnation of libxl_domain_fork_vm cannot become
supported (as in Xen's support statement) going forward, because it is
leaky.

I can see two solutions: 1. batch forking to reduce the number of
queries needed; 2. make a proper domctl which duplicates the source
domain structure inside Xen.

Both of these require extra work. I think option 2 is better. But this
is not asking you to do the work now. See below.

While we want to make libxl APIs stable, we've had cases like COLO which
we explicitly declared unstable.  Seeing this is a niche feature, this
probably falls into the same category. In that case we reserve the right
to rework the interface when necessary.

Ian and Anthony, your opinions?

Wei.


> 
> Tamas

