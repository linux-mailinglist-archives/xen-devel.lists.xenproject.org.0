Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E35F4F5DDE
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 14:32:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299842.511075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc4pZ-0000gj-HM; Wed, 06 Apr 2022 12:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299842.511075; Wed, 06 Apr 2022 12:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc4pZ-0000eX-Dv; Wed, 06 Apr 2022 12:32:13 +0000
Received: by outflank-mailman (input) for mailman id 299842;
 Wed, 06 Apr 2022 12:32:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4vzw=UQ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nc4pY-0000eP-92
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 12:32:12 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94d5435e-b5a5-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 14:32:11 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id m3so3780404lfj.11
 for <xen-devel@lists.xenproject.org>; Wed, 06 Apr 2022 05:32:11 -0700 (PDT)
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
X-Inumbo-ID: 94d5435e-b5a5-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=seOkLjBsvBkN+jsUVXSFnkZHA1u0fzfaMNnmyD7lAeA=;
        b=gBDL+fKQebuO9JkmANB+9gcME6Ctk2MK3enrNYmRTFzHu/13ZOxVGgzfGCBMtrvSoI
         z0C9y3z2+Pc0YCLpYcvtb3bFTktB26KzR48S/91fhYTQKz7lFElaNnbIn8ws37bpENyO
         N2Aw72AByQutOe4O7M5biofLcBI8naUNZvNZuDmxOdTXA8kcioTJxE4HAXsZ74/s3Iu1
         NATV+mPaC19+LCU2yTYpXuRhfsUvhX9utpada1m8uxCJKZV98DXZ7KGjS4L9XnP1MWvs
         y4bWsyM2JPy8H4xKp2/MVG2kohCuCqm7ktVNp0ARXnJ5mW5rC0hvCTcWsG060OD/eOVb
         JcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=seOkLjBsvBkN+jsUVXSFnkZHA1u0fzfaMNnmyD7lAeA=;
        b=ow3x3oaZqS2nsVzHflnkGCGlvDnYLJvtdrOVwZ0FQg4VvZIqu9K2yyZ5c8HUHdzcuY
         HAM1n63DuosBzSNi+i0BUThhgxtIAYwFIXQ+27QjAIA6kf2JJt1tQbt5SfWKvQEWnHEo
         2mdKr3rOHdZTQQG9wEY6VnsdtGdss9yNMxQamhGEOisDMDI1DtzVKnzIJuHsis/aUvnx
         V8dDQLxExT2GLhjziB3GqJ6/NPQtIPI7/ZEf7uk8TVo+l6+zW5cIJe064NmTmorjQ3ae
         CRE9yls91YEqbFkiK4Xp2DjsvTiW5pDkXvnQLjN9nH7Z8rpWCqKUtFERiedaGD7jDlSk
         WNyg==
X-Gm-Message-State: AOAM530dWbO8Em1aF60MErY7JtlXZHlAiFC7wl9W7wtWBtL/ZN2XLKKo
	YgDfST0tJJUCyPfxEtILDtjW+ugZTcgJs6Shi+jWw/X/
X-Google-Smtp-Source: ABdhPJz/aOsg+VDdc1JI1Ma6/EZk3di/lqoseqdla+Z//CBgPq3a0iJsmrcMvTCVONXbL6WDv7nnoi02fyG4bjZqLxk=
X-Received: by 2002:a05:6512:11cc:b0:44a:5770:7425 with SMTP id
 h12-20020a05651211cc00b0044a57707425mr5613946lfr.406.1649248330780; Wed, 06
 Apr 2022 05:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-2-dpsmith@apertussolutions.com> <CAKf6xpuA4hQmPdBtmog1UFcSQQkXL2=+e5bmqeocesgNxqD27w@mail.gmail.com>
 <1eaf4555-5221-6cef-6c01-6aea3797e521@apertussolutions.com>
 <CAKf6xpv0LrmAa2A=dXXK2DSRh0j8ac9VM4aLBhTRK0MtnML0Aw@mail.gmail.com> <a4759948-d45c-df06-3130-f95aba05b555@suse.com>
In-Reply-To: <a4759948-d45c-df06-3130-f95aba05b555@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 6 Apr 2022 08:31:59 -0400
Message-ID: <CAKf6xpvRWcQEwL88YSMOmh=8K+TF0TD+GU9Y0s2P=t3-5f3KFg@mail.gmail.com>
Subject: Re: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Scott Davis <scott.davis@starlab.io>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 6, 2022 at 3:07 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 05.04.2022 19:17, Jason Andryuk wrote:
> > On Mon, Apr 4, 2022 at 11:34 AM Daniel P. Smith <dpsmith@apertussolutions.com> wrote:
> >> On 3/31/22 09:16, Jason Andryuk wrote:
> >>> For the default policy, you could start by creating the system domains
> >>> as privileged and just have a single hook to drop privs.  Then you
> >>> don't have to worry about the "elevate" hook existing.  The patch 2
> >>> asserts could instead become the location of xsm_drop_privs calls to
> >>> have a clear demarcation point.  That expands the window with
> >>> privileges though.  It's a little simpler, but maybe you don't want
> >>> that.  However, it seems like you can only depriv once for the Flask
> >>> case since you want it to be one-way.
> >>
> >> This does simplify the solution and since today we cannot differentiate
> >> between hypervisor setup and hypervisor initiated domain construction
> >> contexts, it does not run counter to what I have proposed. As for flask,
> >> again I do not believe codifying a domain transition bound to a new XSM
> >> op is the appropriate approach.
> >
> > This hard coded domain transition does feel a little weird.  But it
> > seems like a natural consequence of trying to use Flask to
> > deprivilege.  I guess the transition could be behind a
> > dom0less/hyperlaunch Kconfig option.  I just don't see a way around it
> > in some fashion with Flask enforcing.
> >
> > Another idea: Flask could start in permissive and only transition to
> > enforcing at the deprivilege point.  Kinda gross, but it works without
> > needing a transition.
>
> I don't think that would be right. Logically such behavior ought to be
> mirrored to SILO, and I'll take that for the example for being the
> simpler model: Suppose an admin wants to disallow communication
> between DomU-s created by Xen. Such would want enforcing when creating
> those DomU-s, despite the creator (Xen) being all powerful. If the
> device tree information said something different (e.g. directing for
> an event channel to be established between two such DomU-s), this
> should be flagged as an error, not be silently permitted.

Yes, you are right.  As you say, you want the policy enforced when
creating the DomU-s.

Regards,
Jason

