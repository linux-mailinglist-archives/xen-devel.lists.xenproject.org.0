Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2304F3CC7
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 19:19:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299226.509754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbmog-0000ih-4E; Tue, 05 Apr 2022 17:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299226.509754; Tue, 05 Apr 2022 17:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbmog-0000gI-0e; Tue, 05 Apr 2022 17:18:06 +0000
Received: by outflank-mailman (input) for mailman id 299226;
 Tue, 05 Apr 2022 17:18:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HhHa=UP=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nbmof-0000gC-Bx
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 17:18:05 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59fdb57a-b504-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 19:18:04 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id s13so17995711ljd.5
 for <xen-devel@lists.xenproject.org>; Tue, 05 Apr 2022 10:18:03 -0700 (PDT)
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
X-Inumbo-ID: 59fdb57a-b504-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AXL8laU3wEEAbI++BDjPXXUxx4StltF6wiWvXLxExwU=;
        b=Us8z6T1S49RNit1Uf/8+cmNXlYlk4Sjx/3u7AXKSTefSqkpGg6FQOVzOW/YhL2PfDy
         CdVc5/nG4uzZ1lxw0LX073xVrwiyVEtOPWWvgIXrf/NPuLW0kK4TmvhAjuIig87O6T9O
         4ZV4SYRPLbO6m0nXu9G9hki5jTXymXuEIxpTGnWvyR+z9xVMNn2Tg+VVykVd/YiRnQoz
         EhY3ooyNqN2Ou36/SDgrzdJ1rcy5U1yGXzdcGMR/5uBuMW/gRsqDBQHeRD4GaGGbW4C4
         2bxpr+lhdUJTChDQZDRomR99M+Y5SBShybArQPnODIo2aSQZcqdb5h1iLJ23YMiDF5wk
         n+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AXL8laU3wEEAbI++BDjPXXUxx4StltF6wiWvXLxExwU=;
        b=tCRubkMVhnnmPNutLXizXBeZViRRnhY0rkSAYg7dQcEtJ7wrQOjXhkiZroxSHol7Dc
         NMj3K0EVphL5PqXopPP1lvHIDr0K3pgzqo6yjOeV+KgwyEFFeKM3gDJ8LTJ8q72qs8Dx
         c6AqkhoPZnY2bESJXSpeU19Nxk6IytfvjyReOVciFcMEAUD2hMtDIyYoOsfBZxBQDHSV
         ghxSAJal35Z0AyfEaGbgPlRiMqLb2EPO7PbDTxYdtWsc1PcF6ES8yJXihf6zYY67VlGY
         BoZo4o4U0Ncah6zRGmdi85jXDZYPyWh+9rtD9YhOWayaubz95Q4p3zxYPAHQFqRx20Y9
         JzDg==
X-Gm-Message-State: AOAM530fXEWeHkR8iLd53OqLraKiAp5XTxTa1Cm+vwGejx4pLfW9nUD7
	kNTtAR/8zSpnvS5OLg68ymfpwQGdNgZRNsoaqNQ=
X-Google-Smtp-Source: ABdhPJwRS0J2esXlO91msD8EhKYTRHPYZN4xW/DpMI/by6eVWW6ILYsUcGLR0BYJG6UQE/U53jqSt066QCFSu5WS18w=
X-Received: by 2002:a2e:b0c9:0:b0:24a:fb55:8661 with SMTP id
 g9-20020a2eb0c9000000b0024afb558661mr2878467ljl.168.1649179083076; Tue, 05
 Apr 2022 10:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-2-dpsmith@apertussolutions.com> <CAKf6xpuA4hQmPdBtmog1UFcSQQkXL2=+e5bmqeocesgNxqD27w@mail.gmail.com>
 <1eaf4555-5221-6cef-6c01-6aea3797e521@apertussolutions.com>
In-Reply-To: <1eaf4555-5221-6cef-6c01-6aea3797e521@apertussolutions.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 5 Apr 2022 13:17:51 -0400
Message-ID: <CAKf6xpv0LrmAa2A=dXXK2DSRh0j8ac9VM4aLBhTRK0MtnML0Aw@mail.gmail.com>
Subject: Re: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Scott Davis <scott.davis@starlab.io>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 4, 2022 at 11:34 AM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
>
> On 3/31/22 09:16, Jason Andryuk wrote:
> > On Wed, Mar 30, 2022 at 3:05 PM Daniel P. Smith
> > <dpsmith@apertussolutions.com> wrote:
> >>
> >> There are now instances where internal hypervisor logic needs to make resource
> >> allocation calls that are protected by XSM checks. The internal hypervisor logic
> >> is represented a number of system domains which by designed are represented by
> >> non-privileged struct domain instances. To enable these logic blocks to
> >> function correctly but in a controlled manner, this commit introduces a pair
> >> of privilege escalation and demotion functions that will make a system domain
> >> privileged and then remove that privilege.
> >>
> >> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> >> ---
> >>  xen/include/xsm/xsm.h | 22 ++++++++++++++++++++++
> >>  1 file changed, 22 insertions(+)
> >>
> >> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> >> index e22d6160b5..157e57151e 100644
> >> --- a/xen/include/xsm/xsm.h
> >> +++ b/xen/include/xsm/xsm.h
> >> @@ -189,6 +189,28 @@ struct xsm_operations {
> >>  #endif
> >>  };
> >>
> >> +static always_inline int xsm_elevate_priv(struct domain *d)
> >> +{
> >> +    if ( is_system_domain(d) )
> >> +    {
> >> +        d->is_privileged = true;
> >> +        return 0;
> >> +    }
> >> +
> >> +    return -EPERM;
> >> +}
> >
> > These look sufficient for the default policy, but they don't seem
> > sufficient for Flask.  I think you need to create a new XSM hook.  For
> > Flask, you would want the demote hook to transition xen_boot_t ->
> > xen_t.  That would start xen_boot_t with privileges that are dropped
> > in a one-way transition.  Does that require all policies to then have
> > xen_boot_t and xen_t?  I guess it does unless the hook code has some
> > logic to skip the transition.
>
> I am still thinking this through but my initial concern for Flask is
> that I don't think we want dedicated domain transitions directly in
> code. My current thinking would be to use a Kconfig to use xen_boot_t
> type as the initial sid for the idle domain which would then require the
> default policy to include an allowed transition from xen_boot_t to
> xen_t. Then rely upon a boot domain to issue an xsm_op to do a relabel
> transition for the idle domain with an assertion that the idle domain is
> no longer labeled with its initial sid before Xen transitions its state
> to SYS_STATE_active. The one wrinkle to this is whether I will be able
> to schedule the boot domain before allowing Xen to transition into
> SYS_STATE_active.

That is an interesting approach.  While it would work, I find it
unusual that a domain would relabel Xen.  I think Xen should be
responsible for itself and not rely on a domain for this operation.

> > For the default policy, you could start by creating the system domains
> > as privileged and just have a single hook to drop privs.  Then you
> > don't have to worry about the "elevate" hook existing.  The patch 2
> > asserts could instead become the location of xsm_drop_privs calls to
> > have a clear demarcation point.  That expands the window with
> > privileges though.  It's a little simpler, but maybe you don't want
> > that.  However, it seems like you can only depriv once for the Flask
> > case since you want it to be one-way.
>
> This does simplify the solution and since today we cannot differentiate
> between hypervisor setup and hypervisor initiated domain construction
> contexts, it does not run counter to what I have proposed. As for flask,
> again I do not believe codifying a domain transition bound to a new XSM
> op is the appropriate approach.

This hard coded domain transition does feel a little weird.  But it
seems like a natural consequence of trying to use Flask to
deprivilege.  I guess the transition could be behind a
dom0less/hyperlaunch Kconfig option.  I just don't see a way around it
in some fashion with Flask enforcing.

Another idea: Flask could start in permissive and only transition to
enforcing at the deprivilege point.  Kinda gross, but it works without
needing a transition.

To reiterate, XSM isn't really appropriate to enforce anything
internal to Xen.  We are working around the need to go through hook
points during correct operation.  Code exec in Xen means all bets are
off.  Memory writes to Xen data mean the XSM checks can be disabled
(flip Flask to permissive) or bypassed (set d->is_privileged or change
d->ssid).  We shouldn't lose sight of this when we talk about
deprivileging the idle domain.

Regards,
Jason

