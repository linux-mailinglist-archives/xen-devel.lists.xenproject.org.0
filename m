Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 563A11A3885
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 19:00:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMaXb-0002Ml-9j; Thu, 09 Apr 2020 17:00:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tj/S=5Z=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jMaXa-0002Mf-3W
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 17:00:34 +0000
X-Inumbo-ID: 9f9ab882-7a83-11ea-83d8-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f9ab882-7a83-11ea-83d8-bc764e2007e4;
 Thu, 09 Apr 2020 17:00:33 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 31so12752502wre.5
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2020 10:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3IBPIWUiLj5pDwqbXqjaiDM2AWTTIB3K7o5/BNKahDk=;
 b=YzBMxcQtLtseF08kd1LuMQ/f9WyQ+9AVyyHKcZrh9eX7LaALst8mtjF3NI7hVD2R7B
 rpRKOovVA6U85DAvFJYrzCEHd9D8E3Ps+OCqI1jK7rbxWThwZy1nEuI5PKdvIbGintoA
 sI+D46Q3p3T89mrvGR+29SX7njSqVRMzg4s8EwZa1gZVGXRJREXBiG+i+6BrpQeNAReb
 VaqKVxPSURzNkCzHq4Y8GctKPcmb4q3T+ptBJ/+taYYRNguGg58p/Aot+2BnHu0vpg1s
 haoVPs2rLd9+sI+q/C6Wp2rHNVtrt+0TRogFpjBkWGHvs+EfoHa4udUnLWg5D76r6X9i
 6oXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3IBPIWUiLj5pDwqbXqjaiDM2AWTTIB3K7o5/BNKahDk=;
 b=UYatsiKJ+IjZ6T6pMaQA+IqaeA8MtUQANI57ZOUMIY4y1ze/RYAv/qsvraDKzYZcda
 Nn3ejqNMfVM5rq3ku6JlYk3zsfKO+diFUFZzH4DLCOAhTfoEwD0O+SWHWYPTbDISLnS1
 EV7L93p2TwoYXjbIAnY7+Q3ypwR59CFEwo00+oYgHy832TjJ3nKSM6IeMhoH/2YQhdye
 RceEVg+IGgkIDghSlwP7vuP1oRySoKZp1A2SohvxqerimfE2nqmJZ0WGcige6mvfQl+s
 Q+Olux4wP++AT5Gsz/pD1hPWTSCoVFVPLXgoFR1YTE1kWcHyPqfnS/wUXcjZR3UgdGI1
 x1UQ==
X-Gm-Message-State: AGi0PuZjpAQ0nDO9nJUqTcR14uHoW89BmwXDfMV8umxQevzNxXW9kbcz
 k+x20nzEqzSiapb+lxMndCS/0Eh+qnD+31/AO3k/y8B3
X-Google-Smtp-Source: APiQypI6RrfOA0psMIS6YNgqDStmYdSCR/ADXG8GxfBHOY//acTZ+pGKcyeeOIBLDMP0jeL+Qe6DSjna6UQCuO95P7A=
X-Received: by 2002:adf:e811:: with SMTP id o17mr111989wrm.390.1586451631922; 
 Thu, 09 Apr 2020 10:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586186121.git.tamas.lengyel@intel.com>
 <6d63f89124c7445be3185ab6722992b707dab72b.1586186121.git.tamas.lengyel@intel.com>
 <20200409154243.6ouh7r37fwm32mjg@debian>
 <CABfawhndtUA3hVyq9ObbuGRJOVg84qxPgEpc-HsEMxn7A7j_jA@mail.gmail.com>
 <20200409162159.cb2h7a6tmkbaduay@debian>
In-Reply-To: <20200409162159.cb2h7a6tmkbaduay@debian>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 9 Apr 2020 10:59:55 -0600
Message-ID: <CABfawhnaDS=nGn3+NqoY_nWXvu0cfsAmpYjiv9VqkT6C0Ow1FA@mail.gmail.com>
Subject: Re: [PATCH v14 3/3] xen/tools: VM forking toolstack side
To: Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
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
 Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 9, 2020 at 10:22 AM Wei Liu <wl@xen.org> wrote:
>
> On Thu, Apr 09, 2020 at 09:51:35AM -0600, Tamas K Lengyel wrote:
> > On Thu, Apr 9, 2020 at 9:43 AM Wei Liu <wl@xen.org> wrote:
> > >
> > > On Mon, Apr 06, 2020 at 08:20:05AM -0700, Tamas K Lengyel wrote:
> > > > Add necessary bits to implement "xl fork-vm" commands. The command allows the
> > > > user to specify how to launch the device model allowing for a late-launch model
> > > > in which the user can execute the fork without the device model and decide to
> > > > only later launch it.
> > > >
> > > > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > > > ---
> > > [...]
> > > >
> > > > +int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
> > > > +                       libxl__domain_build_state *state,
> > > > +                       uint32_t *domid, bool soft_reset)
> > >
> > > It would have been nice if you could split the refactoring out to a
> > > separate patch.
> >
> > I found the toolstack to be way harder to work with then the
> > hypervisor code-base. Splitting the patches would have been nice but I
> > don't even know how to begin that since it's all such a spaghetti.
>
> In this case you've split out some code from a function to make a new
> function. That is a self-contained task, which can be in its own patch.
>
> >
> > >
> > > >  static int store_libxl_entry(libxl__gc *gc, uint32_t domid,
> > > >                               libxl_domain_build_info *b_info)
> > > >  {
> > > > @@ -1191,16 +1207,32 @@ static void initiate_domain_create(libxl__egc *egc,
> > > >      ret = libxl__domain_config_setdefault(gc,d_config,domid);
> > > >      if (ret) goto error_out;
> > > >
> > > > -    ret = libxl__domain_make(gc, d_config, &dcs->build_state, &domid,
> > > > -                             dcs->soft_reset);
> > > > -    if (ret) {
> > > > -        LOGD(ERROR, domid, "cannot make domain: %d", ret);
> > > > +    if ( !d_config->dm_restore_file )
> > > > +    {
> > > > +        ret = libxl__domain_make(gc, d_config, &dcs->build_state, &domid,
> > > > +                                 dcs->soft_reset);
> > > >          dcs->guest_domid = domid;
> > > > +
> > > > +        if (ret) {
> > > > +            LOGD(ERROR, domid, "cannot make domain: %d", ret);
> > > > +            ret = ERROR_FAIL;
> > > > +            goto error_out;
> > > > +        }
> > > > +    } else if ( dcs->guest_domid != INVALID_DOMID ) {
> > >
> > > Coding style issue here.
> > >
> > > There are quite a few of them.  I won't point them out one by one
> > > though. Let's focus on the interface first.
> >
> > Do we have an automatic formatter we could just run on this code-base?
> > I don't know what style issue you are referring to and given that the
> > coding style here is different here compared to the hypervisor I find
> > it very hard to figure it out what other issues you spotted. Please
> > report them because I won't be able to spot them manually. To me it
> > all looks fine as-is.
>
> I feel your pain. There was work in progress to provide a style checker,
> but we're not there yet.
>
> Xen and libxc share one coding style while libxl and xl share another.
> There is a CODING_STYLE file under libxl directory.  The problem here is
> you should not have spaces inside ().
>
> Generally I think pointing out coding style issues tend to distract
> people from discussing more important things, so I would leave them last
> to fix.

I agree. I would highly prefer if we would get to a spot where they
wouldn't even have to be pointed out other then "run this command to
fix up the style". I submitted an astyle template already for Xen,
others prefer clang to do it, yet it's been like a year and doesn't
look like we will go anywhere with either. Just a waste of time IMHO.

>
> >
> > > >
> > > > +/*
> > > > + * The parent domain is expected to be created with default settings for
> > > > + * - max_evtch_port
> > > > + * - max_grant_frames
> > > > + * - max_maptrack_frames
> > > > + */
> > > > +int libxl_domain_fork_vm(libxl_ctx *ctx, uint32_t pdomid, uint32_t max_vcpus, uint32_t *domid)
> > > > +{
> > > > +    int rc;
> > > > +    struct xen_domctl_createdomain create = {0};
> > > > +    create.flags |= XEN_DOMCTL_CDF_hvm;
> > > > +    create.flags |= XEN_DOMCTL_CDF_hap;
> > > > +    create.flags |= XEN_DOMCTL_CDF_oos_off;
> > > > +    create.arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
> > > > +    create.ssidref = SECINITSID_DOMU;
> > > > +    create.max_vcpus = max_vcpus;
> > >
> > >
> > > Some questions:
> > >
> > > Why does the caller need to specify the number of vcpus?
> > >
> > > Since the parent (source) domain is around, can you retrieve its domain
> > > configuration such that you know its max_vcpus and other information
> > > including max_evtchn_port and maptrack frames?
> >
> > Because we want to avoid having to issue an extra hypercall for these.
> > Normally these pieces of information will be available for the user
> > and won't change, so we save time by not querying for it every time a
> > fork is created. Remember, we might be creating thousands of forks in
> > a very short time, so those extra hypercalls add up.
>
> I see. Speed is a big concern to you.
>
> What I was referring to doesn't require issuing hypercalls but requires
> calling libxl_retrieve_domain_configuration. That's likely to be even
> slower than making a hypercall.

Right. We only want to parse the domain config if the device model is
being launched.

>
> I'm afraid the current incarnation of libxl_domain_fork_vm cannot become
> supported (as in Xen's support statement) going forward, because it is
> leaky.

What do you mean by leaky?

>
> I can see two solutions: 1. batch forking to reduce the number of
> queries needed; 2. make a proper domctl which duplicates the source
> domain structure inside Xen.

I've attempted to do that by extending the domain create hypercall so
that this information can be copied in the hypervisor. That approach
was very unpopular.

>
> Both of these require extra work. I think option 2 is better. But this
> is not asking you to do the work now. See below.
>
> While we want to make libxl APIs stable, we've had cases like COLO which
> we explicitly declared unstable.  Seeing this is a niche feature, this
> probably falls into the same category. In that case we reserve the right
> to rework the interface when necessary.

I'm fine with making this declared unstable. The hypervisor side bits
are also declared experimental and aren't even compiled in the normal
case.

Thanks,
Tamas

