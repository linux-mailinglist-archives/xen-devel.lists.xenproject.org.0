Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2912992A1
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 17:40:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12455.32430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX5XL-0007cn-R6; Mon, 26 Oct 2020 16:39:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12455.32430; Mon, 26 Oct 2020 16:39:59 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX5XL-0007cO-No; Mon, 26 Oct 2020 16:39:59 +0000
Received: by outflank-mailman (input) for mailman id 12455;
 Mon, 26 Oct 2020 16:39:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZY59=EB=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kX5XK-0007cJ-NU
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 16:39:58 +0000
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fa74700-e853-459b-b9c4-629e31d20fa4;
 Mon, 26 Oct 2020 16:39:57 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id d24so10900796ljg.10
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2020 09:39:57 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ZY59=EB=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kX5XK-0007cJ-NU
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 16:39:58 +0000
X-Inumbo-ID: 1fa74700-e853-459b-b9c4-629e31d20fa4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1fa74700-e853-459b-b9c4-629e31d20fa4;
	Mon, 26 Oct 2020 16:39:57 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id d24so10900796ljg.10
        for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2020 09:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/ba3eye2nqN8R+jvaoMR7ipQ8F80RQhtFXVvQeivpDY=;
        b=ps0PSrOqcLnGdRrDek4lPX/T9vvQMqbZHsAHfldbr/fu8UeMiUijsvohIo0uA0sWKc
         HcPETn2yA1ox1CSf8OFnEJCw/+PGKj/IChhsb8Qp6mU9erBTqrpi0oN6+yI4XLgFr+vn
         wyXJPzD88YAzYVQc3m0YhcOHVObRBbRSgdqVDiEeNoEizBZfenddWBP4gBeVk9HOU3Mr
         WSUPIZWgR4OJQq/38SzQdts3kEWvpziP7Dkzx+zSWco8/juiBz0nYMasOEvGp93kzCIv
         odS3gDCLVqjzjBfnY9/VJjjOB2dgoOORTnsfUWBqMt+LUa0Ny0IMyImLviBNxzDgIM+g
         eMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/ba3eye2nqN8R+jvaoMR7ipQ8F80RQhtFXVvQeivpDY=;
        b=Z1gmH2rW+qxE+sQbsoAqo30JvXnkvXR7RGJg3fXSDRY6cCjW1KQXZ66F39L0jqRph9
         DHWjX0Kpbs8WZhVgjRwtCB5naqyhwCMAlkDzd+BtuIcyT9ApBPhfnvjAbrVzYT17FAPs
         7RHVZyb4lccXwXvaWddu1ZMpBd5sSQ4KNVPLHbgoc+QetND8GMbC2Suq9ryDT1d3Igim
         zDtwQaI53SkhvPU3q4f2jo2invfvJNGKHo9CX16Umu2Hs+Vw8IZVp4WqFijjYtXMpYki
         hQKpvIIFlV+vTsR1eGs8iS+vg0/uu304V8TR3nnu9oYzvnGEJNMmmxDw6gOodRCOLZJC
         yU0g==
X-Gm-Message-State: AOAM531s4rQjB1rxcbtXSWlDMB36IrM9igPoiEvhmN4ZP7K25pmE4Iw1
	8fOhP4/icG/bfzwrqsyUKEL5+eygZ12EA0Q+gu8=
X-Google-Smtp-Source: ABdhPJx2nuqBQQV4qbIIS7PsS+gPnxb0ieBxk7rT5PJVs+O3pjFY4uXoO/vVlPHHcSloMLrH2hF8aPuWaN/6Mw6lFbs=
X-Received: by 2002:a2e:b0c7:: with SMTP id g7mr5945690ljl.433.1603730396567;
 Mon, 26 Oct 2020 09:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAKf6xpt0Kpi2ST4gfPnLrqUHE+3hHkRYpQAHPjp2vW=cHpqPAA@mail.gmail.com>
 <20201026134651.8162-1-jandryuk@gmail.com> <17565b8d546.eaf68ba048834.6199377730744210517@apertussolutions.com>
In-Reply-To: <17565b8d546.eaf68ba048834.6199377730744210517@apertussolutions.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 26 Oct 2020 12:39:44 -0400
Message-ID: <CAKf6xpvXuo8bS5VT1gSbx=57tWdtGEnLKZcJGjRo2QOoKREMsw@mail.gmail.com>
Subject: Re: [RFC PATCH] xsm: Re-work domain_create and domain_alloc_security
To: Daniel Smith <dpsmith@apertussolutions.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, hx242 <hx242@xen.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 26, 2020 at 12:23 PM Daniel Smith
<dpsmith@apertussolutions.com> wrote:
>
> ---- On Mon, 26 Oct 2020 09:46:51 -0400 Jason Andryuk <jandryuk@gmail.com> wrote ----
>
>  > Untested!
>  >
>  > This only really matters for flask, but all of xsm is updated.
>  >
>  > flask_domain_create() and flask_domain_alloc_security() are a strange
>  > pair.
>  >
>  > flask_domain_create() serves double duty.  It both assigns sid and
>  > self_sid values and checks if the calling domain has permission to
>  > create the target domain.  It also has special casing for handling dom0.
>  > Meanwhile flask_domain_alloc_security() assigns some special sids, but
>  > waits for others to be assigned in flask_domain_create.  This split
>  > seems to have come about so that the structures are allocated before
>  > calling flask_domain_create().  It also means flask_domain_create is
>  > called in the middle of domain_create.
>  >
>  > Re-arrange the two calls.  Let flask_domain_create just check if current
>  > has permission to create ssidref.  Then it can be moved out to do_domctl
>  > and gate entry into domain_create.  This avoids doing partial domain
>  > creation before the permission check.
>  >
>  > Have flask_domain_alloc_security() take a ssidref argument.  The ssidref
>  > was already permission checked earlier, so it can just be assigned.
>  > Then the self_sid can be calculated here as well rather than in
>  > flask_domain_create().
>  >
>  > The dom0 special casing is moved into flask_domain_alloc_security().
>  > Maybe this should be just a fall-through for the dom0 already created
>  > case.  This code may not be needed any longer.
>  >
>  > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>  > ---

<snip>

>  > -static int flask_domain_alloc_security(struct domain *d)
>  > +static int flask_domain_alloc_security(struct domain *d, u32 ssidref)
>  >  {
>  >  struct domain_security_struct *dsec;
>  > +    static int dom0_created = 0;
>  > +    int rc;
>  >
>  >  dsec = xzalloc(struct domain_security_struct);
>  >  if ( !dsec )
>  > @@ -175,14 +177,24 @@ static int flask_domain_alloc_security(struct domain *d)
>  >  case DOMID_IO:
>  >  dsec->sid = SECINITSID_DOMIO;
>  >  break;
>  > +    case 0:
>  > +        if ( !dom0_created ) {
>  > +            dsec->sid = SECINITSID_DOM0;
>  > +            dom0_created = 1;
>  > +        } else {
>  > +            dsec->sid = SECINITSID_UNLABELED;
>  > +        }
>
> While the handling of this case is not wrong, I have to wonder if there is a better way to handle the dom0 creation case.

dom0_cfg.ssidref could be set to SECINITSID_DOM0.  I guess that would
need some xsm_ssid_dom0 wrapper.  Then maybe this logic can go away
and the default case used.

pv-shim doesn't necessarily use domid 0, so this may be broken there.
dom0_cfg.ssidref would fix that, I think.  But I'm not familiar with
pv-shim.

>  > +        break;
>  >  default:
>  > -        dsec->sid = SECINITSID_UNLABELED;
>  > +        dsec->sid = ssidref;
>  >  }
>  >
>  >  dsec->self_sid = dsec->sid;
>  > -    d->ssid = dsec;
>
> I don't think you meant to deleted that, without it domains will have no ssid assigned to them.

Yes, this should be retained.

Thanks for looking.

-Jason

