Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD501A3789
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 17:52:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMZTT-00043B-Hc; Thu, 09 Apr 2020 15:52:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tj/S=5Z=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jMZTR-000436-JD
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 15:52:13 +0000
X-Inumbo-ID: 13b64722-7a7a-11ea-83d8-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13b64722-7a7a-11ea-83d8-bc764e2007e4;
 Thu, 09 Apr 2020 15:52:12 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c15so12432097wro.11
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2020 08:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QMi/kgXe+kpH7J8/wvBqGD8s0I8/bpxLewJ9YdGEXSw=;
 b=Dgc4iuvXF5iqeWJOx2Mn0elICKzTD/R7SL4OiqNd9/vt94gFF6HmLb0qbIG/YUfUV/
 aDKMPKp78X6Tsw3/+z890PrDBEqYgUCE5EuNcDIV/MG8GmhMmsM+1GEyg/XrHMqXyioi
 C2uPg8QIl3fYKmF+CTW+nw3NTiNATsESmcutfkVBFaLkKXALi4dl8YKMI+Zv/TTO8Ltj
 UAMz7wZybg7X8acWzZjOMQwQ/80Q8IxD+/3XVTzi0AJ7Y0cJuapUjhUczzAqcBjpndGI
 TE4RFNJI77c45e96tjzNkNz8BWwyxL+Ya1QyjkptcrFGqJ51Ta6nT2nAVFU5qKMxNYqe
 98Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QMi/kgXe+kpH7J8/wvBqGD8s0I8/bpxLewJ9YdGEXSw=;
 b=jvv+yrMNpINqUBIHObdEPmvzHNO/vP3eMuTlDypFeKP7z17v+uTRGF2W5yszDMaxhU
 U+WZ+2Hxql74AXVXZs8oLNpK08YAgXGYc9wS732WWL3soIbybTCdYMkxhOk8T/fMO8h3
 n1uWHyqzRDFd1xP8FanAtbyLCwZ12H3i8LqqKXAh/c0MujIrhLviyMB6eSthPXyiTBp1
 fmh9Xq3OgLJ3TNOCViicuVDV8PKPKbOFdbKAZVR+Y2g7NYMye9di0WL4OQLid4K2dg7p
 7czMLBsHGjvoklWC82MnQBdhKT2eKKvBrpq4UKQPJ6GxJg9Fo1UaxnCJ/eT+o865e7/1
 t+6w==
X-Gm-Message-State: AGi0Pua/X9D1dlaQddYuhUyC7By/3mbgTS8ldhBPL7ivAjOr0Lrrc61F
 gxkRXGmxPB1FP7vFDjqBAOOeU+0S8ano3LSEmxY=
X-Google-Smtp-Source: APiQypLSJTcB/83afBzptjsEIeRNSVdaCp6IIx1l6CT3r/gPgrK0sYYsZvfUjhCyguCOMkQqUdzfFIMbVYPzmPnloKY=
X-Received: by 2002:adf:e811:: with SMTP id o17mr6573940wrm.390.1586447531921; 
 Thu, 09 Apr 2020 08:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586186121.git.tamas.lengyel@intel.com>
 <6d63f89124c7445be3185ab6722992b707dab72b.1586186121.git.tamas.lengyel@intel.com>
 <20200409154243.6ouh7r37fwm32mjg@debian>
In-Reply-To: <20200409154243.6ouh7r37fwm32mjg@debian>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 9 Apr 2020 09:51:35 -0600
Message-ID: <CABfawhndtUA3hVyq9ObbuGRJOVg84qxPgEpc-HsEMxn7A7j_jA@mail.gmail.com>
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

On Thu, Apr 9, 2020 at 9:43 AM Wei Liu <wl@xen.org> wrote:
>
> On Mon, Apr 06, 2020 at 08:20:05AM -0700, Tamas K Lengyel wrote:
> > Add necessary bits to implement "xl fork-vm" commands. The command allows the
> > user to specify how to launch the device model allowing for a late-launch model
> > in which the user can execute the fork without the device model and decide to
> > only later launch it.
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > ---
> [...]
> >
> > +int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
> > +                       libxl__domain_build_state *state,
> > +                       uint32_t *domid, bool soft_reset)
>
> It would have been nice if you could split the refactoring out to a
> separate patch.

I found the toolstack to be way harder to work with then the
hypervisor code-base. Splitting the patches would have been nice but I
don't even know how to begin that since it's all such a spaghetti.

>
> >  static int store_libxl_entry(libxl__gc *gc, uint32_t domid,
> >                               libxl_domain_build_info *b_info)
> >  {
> > @@ -1191,16 +1207,32 @@ static void initiate_domain_create(libxl__egc *egc,
> >      ret = libxl__domain_config_setdefault(gc,d_config,domid);
> >      if (ret) goto error_out;
> >
> > -    ret = libxl__domain_make(gc, d_config, &dcs->build_state, &domid,
> > -                             dcs->soft_reset);
> > -    if (ret) {
> > -        LOGD(ERROR, domid, "cannot make domain: %d", ret);
> > +    if ( !d_config->dm_restore_file )
> > +    {
> > +        ret = libxl__domain_make(gc, d_config, &dcs->build_state, &domid,
> > +                                 dcs->soft_reset);
> >          dcs->guest_domid = domid;
> > +
> > +        if (ret) {
> > +            LOGD(ERROR, domid, "cannot make domain: %d", ret);
> > +            ret = ERROR_FAIL;
> > +            goto error_out;
> > +        }
> > +    } else if ( dcs->guest_domid != INVALID_DOMID ) {
>
> Coding style issue here.
>
> There are quite a few of them.  I won't point them out one by one
> though. Let's focus on the interface first.

Do we have an automatic formatter we could just run on this code-base?
I don't know what style issue you are referring to and given that the
coding style here is different here compared to the hypervisor I find
it very hard to figure it out what other issues you spotted. Please
report them because I won't be able to spot them manually. To me it
all looks fine as-is.

> >
> > +/*
> > + * The parent domain is expected to be created with default settings for
> > + * - max_evtch_port
> > + * - max_grant_frames
> > + * - max_maptrack_frames
> > + */
> > +int libxl_domain_fork_vm(libxl_ctx *ctx, uint32_t pdomid, uint32_t max_vcpus, uint32_t *domid)
> > +{
> > +    int rc;
> > +    struct xen_domctl_createdomain create = {0};
> > +    create.flags |= XEN_DOMCTL_CDF_hvm;
> > +    create.flags |= XEN_DOMCTL_CDF_hap;
> > +    create.flags |= XEN_DOMCTL_CDF_oos_off;
> > +    create.arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
> > +    create.ssidref = SECINITSID_DOMU;
> > +    create.max_vcpus = max_vcpus;
>
>
> Some questions:
>
> Why does the caller need to specify the number of vcpus?
>
> Since the parent (source) domain is around, can you retrieve its domain
> configuration such that you know its max_vcpus and other information
> including max_evtchn_port and maptrack frames?

Because we want to avoid having to issue an extra hypercall for these.
Normally these pieces of information will be available for the user
and won't change, so we save time by not querying for it every time a
fork is created. Remember, we might be creating thousands of forks in
a very short time, so those extra hypercalls add up.

Tamas

