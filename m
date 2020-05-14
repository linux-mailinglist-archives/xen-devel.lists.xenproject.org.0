Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 750A61D34BA
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 17:14:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZFY3-0005EL-9M; Thu, 14 May 2020 15:13:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lICV=64=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jZFY1-0005EG-QL
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 15:13:21 +0000
X-Inumbo-ID: 7200d838-95f5-11ea-b9cf-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7200d838-95f5-11ea-b9cf-bc764e2007e4;
 Thu, 14 May 2020 15:13:20 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l11so4686858wru.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2020 08:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jenYmo923njm2GR8Qf+VdNJ4UtHrNZ8SRfJaSixVhk0=;
 b=MYgw5BUwHF1fWCyks6ncvEWUE8VlxsQFhQxYLj3NnoXHp0BfnV4H5r6i/UxafvoxlK
 hVLx+HyOmpy28qxeuwNWgvqK4GUdr3TFrFVU9q+17TsshYVTE2HAd6pZcWSy0uTIVDDF
 gTUYRrLG7Q0e+dnCXUJ6yBeI4mYxWYsZWFH+aD3DvkujkFArbc6q0BYKfvAuMdyd800i
 KW3QRtd4s1foOLgVhMVThtqpo3f1dTBfW3NuSkcLSM1EfrLIDvUjp4Ti9VoNkgW+b9OF
 ++xEdPkTf7IxjmdS79SwMFPm0uGRCjnOe67ABkCQR9CiSbuFFAY5X6SvWL2J+PlxX9/1
 tmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jenYmo923njm2GR8Qf+VdNJ4UtHrNZ8SRfJaSixVhk0=;
 b=hQ4Pp5VSAg4kZGgTqhu6jUyofP1JeV4oLJjpL3OWeXnz8sXf9LrsDTtI8vk+FXAXuM
 PPhCmoWKzaTHg95YMNE9N3zHD/m3Wg1OTlMRToJZviYfU8okq5kMZJImUfjNiilDHX9s
 q7IC9ADDjugWnYRQ/F7sZFTbjWVCKumB2YVNGebgJH0M3PtpnzbcduSBjLOcPGz+vBq7
 o99Vp+vKH00IiIcrPHNANHcg/qW4j5MWO5WLxMZOQiaRV0HfXrwF3I2K5k4U/+wm2foZ
 hWxyeqcpvcZYwBcRt71qrfU31srwFu1mj25j11lCd4wJVtimiotqLLnL1aoZdNhA9MZR
 v7HQ==
X-Gm-Message-State: AOAM532h2rbyUYv3oAmP0KNFL9OMOGFDGwp7WJumKXwyAAUBLOFc7yT0
 V9wcEXMG4cjUMAS1+E1WGxtoCfoJWJSe7mNR370=
X-Google-Smtp-Source: ABdhPJxC9nH3Y5w2qHEWJl4W+ZNmvsIPznD6lG8O79Mwfajn0EzFXlRYTnQVl4L9rwt7syiCyVZAMq4imhlSIH6MOjs=
X-Received: by 2002:adf:fe07:: with SMTP id n7mr5870911wrr.259.1589469199479; 
 Thu, 14 May 2020 08:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <a59dabe3a40d4f3709d3ad6ca605523f180c2dc5.1588772376.git.tamas.lengyel@intel.com>
 <b91c338ab8165b6e228b46bbd1853eb140ab69c7.1588772376.git.tamas.lengyel@intel.com>
 <24253.23212.178710.524294@mariner.uk.xensource.com>
In-Reply-To: <24253.23212.178710.524294@mariner.uk.xensource.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 14 May 2020 09:12:44 -0600
Message-ID: <CABfawhkQtxd1NX7Gx9e2Eefc=tHwgDzPp8TEYZBc8B2xtE4rmQ@mail.gmail.com>
Subject: Re: [PATCH v18 2/2] tools/libxl: VM forking toolstack side
To: Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, May 14, 2020 at 8:52 AM Ian Jackson <ian.jackson@citrix.com> wrote:
>
> Tamas K Lengyel writes ("[PATCH v18 2/2] tools/libxl: VM forking toolstack side"):
> > Add necessary bits to implement "xl fork-vm" commands. The command allows the
> > user to specify how to launch the device model allowing for a late-launch model
> > in which the user can execute the fork without the device model and decide to
> > only later launch it.
>
> Hi.
>
> Sorry to be so late in reviewing this.  I will divert my main
> attention to the API elements...
>
> > +=item B<fork-vm> [I<OPTIONS>] I<domain-id>
> > +
> > +Create a fork of a running VM.  The domain will be paused after the operation
> > +and remains paused while forks of it exist.
>
> Do you mean "must remain paused" ?  And "The original domain" rather
> than "The domain" ?

Yes, I mean the original domain.

>
> > +B<OPTIONS>
> > +
> > +=over 4
> > +
> > +=item B<-p>
> > +
> > +Leave the fork paused after creating it.
>
> By default the fork runs right away, then, I take it.

Same route is taken as when you run "xl restore" so yes. This applies
if you are launching the device model. Without the device model launch
we are not going down the same path as "xl restore" so the fork is
paused in that case.

>
> > +=item B<--launch-dm>
> > +
> > +Specify whether the device model (QEMU) should be launched for the fork. Late
> > +launch allows to start the device model for an already running fork.
>
> It's not clear to me whether this launches the DM for an existing
> fork, or specify when forking that the DM should be run ?

It's possible to do both. You can create a fork and launch the device
model for it right away, or you can create a fork, unpause it, and
only launch the device model when its actually necessary.

>
> Do you really mean that you can run a fork for a while with no DM ?
> How does that work ?
>
> Also you seem to have not documented the launch-dm operation ?

It's possible I missed it.

>
> > +=item B<-C>
> > +
> > +The config file to use when launching the device model.  Currently required when
> > +launching the device model.  Most config settings MUST match the parent domain
> > +exactly, only change VM name, disk path and network configurations.
>
> This is a libxl config file, right ?

Yes.

>
> > +=item B<-Q>
> > +
> > +The path to the qemu save file to use when launching the device model.  Currently
> > +required when launching the device model.
>
> Where would the user get one of these ?

Generate it by connecting to the qmp socket of the parent domain and
issuing the command saves it. See the cover letter to the series. I
stopped sending the cover letter since there is only this one
outstanding patch now.

>
> I think this question has no good answer and this reveals a problem
> with the API...

I don't know what "problem" you are referring to. We deliberately
chose not to include saving the qemu save file every time a fork is
made because for our usecase you only need to generate the qemu save
file once. Doing it for every fork is huge waste of time since we are
spinning off forks from the same state hundreds of thousands of time.
No need to regenerate the same save file for each.

>
> > +=item B<--fork-reset>
> > +
> > +Perform a reset operation of an already running fork.  Note that resetting may
> > +be less performant then creating a new fork depending on how much memory the
> > +fork has deduplicated during its runtime.
>
> What is the semantic effect of a reset ?

I don't understand the question.

>
> > +=item B<--max-vcpus>
> > +
> > +Specify the max-vcpus matching the parent domain when not launching the dm.
>
> What ?  This makes little sense to me.  You specify vm-fork
> --max-vcpus and it changes the parent's max-vcpus ??

No. You need the max-vcpus value when you create a fork. The domain
create hypercall needs it to set the domain up. I originally wanted to
extend the domain create hypercall so this could be copied by the
hypervisor but the hypervisor maintainers were against changing that
hypercall. So we are left with having to pass it manually.

>
> > +=item B<--allow-iommu>
> > +
> > +Specify to allow forking a domain that has IOMMU enabled. Only compatible with
> > +forks using --launch-dm no.
>
> Are there no some complex implications here ?  Maybe this doc needs a
> caveat.

Only caveat is that this option is only available for forks that have
no device models launched for them. We use it for fuzzing the device
driver of the IOMMU device in the forks.

>
> > +int libxl_domain_fork_launch_dm(libxl_ctx *ctx, libxl_domain_config *d_config,
> > +                                uint32_t domid,
> > +                                const libxl_asyncprogress_how *aop_console_how)
> > +                                LIBXL_EXTERNAL_CALLERS_ONLY;
> > +
> > +int libxl_domain_fork_reset(libxl_ctx *ctx, uint32_t domid)
> > +                            LIBXL_EXTERNAL_CALLERS_ONLY;
> >  #endif
>
> I'm afraid I found the code very hard to review.  In particular:
>
> > -    if (!soft_reset) {
> > -        struct xen_domctl_createdomain create = {
> > -            .ssidref = info->ssidref,
> > -            .max_vcpus = b_info->max_vcpus,
> > -            .max_evtchn_port = b_info->event_channels,
> > -            .max_grant_frames = b_info->max_grant_frames,
> > -            .max_maptrack_frames = b_info->max_maptrack_frames,
>
> I think this containsw a lot of code motion.  There is probably some
> other refactoring.
>
>
> Can you please split this up into several patches ?  Code motion
> should cocur in patches that do nothing else.  Refactoring should be
> broken down into pieces as small as possible, and separated from the
> addition of new functionality.  So most of the patches should be
> annotated "no functional change".

I understand that this patch mixes code-movement and new functionality
which makes it harder for review. The code movement involves no
functional changes to existing code, only splitting some existing
functions to have parts of them reusable for the fork case and skip
the parts that are not relevant. Unfortunately I won't be able to
split this up into multiple patches as I found this codebase
impossibly hard to work with to begin with. It's callback hell with
like 15 different structures being created and freed left and right.
Add to it that it constantly changes even just in the last couple
months, so just rebasing it has been a massive pain. Forget about
backporting this patch too, everything else I was able to easily apply
to Xen 4.13, libxl is just an absolute no go since it has so much code
churn. So since this feature is not required for any of our use-cases
- this is only to make it possible for other potential users to use
forks where they need them to be more fully featured - I won't be able
to assign the time it would require to split this up further. It
probably would take me weeks which I can't justify at the moment.

Tamas

