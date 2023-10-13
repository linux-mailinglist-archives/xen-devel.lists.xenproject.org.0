Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C33AC7C86D7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 15:31:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616569.958678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrIFX-0006GQ-GK; Fri, 13 Oct 2023 13:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616569.958678; Fri, 13 Oct 2023 13:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrIFX-0006EQ-Dm; Fri, 13 Oct 2023 13:30:43 +0000
Received: by outflank-mailman (input) for mailman id 616569;
 Fri, 13 Oct 2023 13:30:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=36VQ=F3=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qrIFV-0006EK-Ni
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 13:30:41 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3d4328a-69cc-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 15:30:40 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c5071165d5so9373701fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 06:30:40 -0700 (PDT)
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
X-Inumbo-ID: b3d4328a-69cc-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1697203840; x=1697808640; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzSat+oeKuBgLVqZInaoLkxyZPP8RM1UbxTnmNQOsbU=;
        b=XtdmzWGjgg/zCw0BbUthiQMvwhfHmbdt1rs5YOETmtFmEIZgYvjaBy2IeloBLj4nK+
         Ue0+68Bs6JsvbQFgsrpVyJHCAyLyoBctcwn9bJRRc5pl8K19rJVZyUlRJ2XX28HPP/I7
         7vDnvp6Qp6Kn5tl2XSwTZTmVeH3euVzdHNJVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697203840; x=1697808640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JzSat+oeKuBgLVqZInaoLkxyZPP8RM1UbxTnmNQOsbU=;
        b=I6MOHerH9WiU5irMIHcpUxwxUKwgJ5Rd8w1i2y8vF8OZ+c8lGhsSYefJRGWW97NoKZ
         sVlDBOp4k+M/EbqZ1kCvak2BpiQUsyuQ9QWbZxec9Oqoh2SOciJa2pb5n6sntgWT+KqQ
         XVV2elIoLt/BEc7w85pU89u5EP1foyiYtxY29IMRm+LrmQ25dmC34yNNA2PpIfxvZP6e
         7TZhmlkl44W9MxRofLW1wzVETSZMMzPo211RngQ6D8JUzaPyBJUslsuX1/Q/LISzMfOW
         zGnbfdbQJ271pfJ9WvDUBydYpLeMWXmK+tQisxZK1KPAEFfy8GtbIlCeEE/+UiIWVy6G
         yz2Q==
X-Gm-Message-State: AOJu0YyciLrA4lmsUIIlLHSPS4/t99WFQf9CrteL3hY/BlyZu781/kF7
	DmOs7Fwm5npgXmSi/w939k1w2vC7tKfPVx/PqqIZhQ==
X-Google-Smtp-Source: AGHT+IHf3UB/XnGTtJbyXHkP+f2JXkNQJjAPMb9/21ggwVn1tSeK0Eem4YB33Hb+8UExPnFgtfkI58qTrFjpnqvI6tE=
X-Received: by 2002:a2e:bc21:0:b0:2c5:38d:f80b with SMTP id
 b33-20020a2ebc21000000b002c5038df80bmr2993721ljf.6.1697203840182; Fri, 13 Oct
 2023 06:30:40 -0700 (PDT)
MIME-Version: 1.0
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2309271603590.1403502@ubuntu-linux-20-04-desktop>
 <a31ce6cb-6234-5e7f-5cd4-ed190f029811@citrix.com> <alpine.DEB.2.22.394.2309271658500.1403502@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZbeUFrfAUJShooJFJ+d89f4xdXfJJ9HoJKRh4UStkTFQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2310121535580.3431292@ubuntu-linux-20-04-desktop>
 <CA+zSX=Y5dMVFM6dVNgBRHxKc0C1e5WGgweQ0FaXXCfAFGH1aPA@mail.gmail.com>
 <a93839b8-932a-4634-9549-081df950afb2@xen.org> <CA+zSX=a972GC=_FKK2eGkArPb6RszCHDN0+6JKFJiMjoMpAySQ@mail.gmail.com>
 <f973db5f-da72-4aa2-a35e-1e6652b181bf@xen.org>
In-Reply-To: <f973db5f-da72-4aa2-a35e-1e6652b181bf@xen.org>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 13 Oct 2023 14:30:28 +0100
Message-ID: <CA+zSX=bpq6sJmP7TzC+3vgTJyZcCdZc5M-BGEaOkkXt7BoQZJg@mail.gmail.com>
Subject: Re: Xen 4.18 release: Reminder about code freeze
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Henry Wang <Henry.Wang@arm.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, 
	"jgross@suse.com" <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, 
	"community.manager@xenproject.org" <community.manager@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 2:00=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
> >>> If the problem is the delay between the xenevtchn_notify() in
> >>> introduce_domain() and the domain_conn_reset() afterwards in
> >>> do_domain(), would it make sense instead to move the notification int=
o
> >>> do_introduce(), after the domain_conn_reset()?  It is, after all, in
> >>> response to XS_INTRODUCE that we want to send the notification, not i=
n
> >>> dom0_init() or read_state_connection() (which seems to be more about
> >>> restoring a domain).
> >>
> >> I understand that the event channel notification was specifically adde=
d
> >> for dom0less. But I don't see why we don't want to send it to dom0 as =
well.
> >>
> >> Technically, dom0 has exactly the same problem as dom0less domains it
> >> boots before Xenstored is running and therefore it may need to know wh=
en
> >> it is ready to receive commands.
> >
> > It seemed to work fine before 2022, when the notification was
> > introduced.
>
> Indeed. But my point is that in theory the behavior between dom0 and
> dom0less domain should not be different. With your proposal we would
> continue to diverge with seems rather strange.
>
> Do you at least agree that on the paper, Xenstored should notify it is
> ready to accept commands the same way for every domain?

I don't know enough about the start-of-day to know why dom0 did fine
without a notification for nearly 20 years, but dom0less domUs don't.
To answer your question I'd need the documentation that Andrew wants;
or at least the answers to the two questions which you deferred to
Juergen.  I assume that dom0 doesn't really need it, because it did
fine without it; I assume that dom0less domUs do really need it,
because otherwise people wouldn't have spent the effort to introduce
it.

> > Personally I'd just take the patch as I wrote it, restoring dom0's
> > pre-2022 behavior (after review and testing of course); but if you
> > wanted to test & resubmit with a similar notification inside
> > dom0_init(), I wouldn't object to it.
>
> Just to clarify, you suggest the revert because you are concerned that
> it could break dom0. Is that correct?

I'm not sure why you're calling it a revert.  The initial patch that
introduced it didn't mention wanting to include dom0 specifically; on
the contrary it said:

"The extra notification is harmless for domains that don't require it."

My reasons for leaving dom0 notification out of my patch were:

1. It's awkward to keep the dom0 notification without doing a lot of
refactoring (which should be avoided at this point in the release) or
making things kind of ugly and difficult to maintain (lots of specific
if statements)

2. Since dom0 did fine for 20 years without it, it seemed that it
wasn't necessary

3. Since nobody seems to actually know what's going on, there's a
chance it's actually harmful (although that chance is relatively
small, given the amount of time the extra notification has been in the
tree).

> > Naturally it would be ideal if we could avoid the code duplication;
> > but that's not possible without a lot more refactoring, which I don't
> > think we should be doing at this stage in the release.
>
> You can by moving the code just at the end of introduce_domain().

At the end of introduce_domain(), your if statement would have to look
like this:

if (!restore) {
   if (!is_master_domain)
    domain_conn_reset():
  interface->connection =3D XENSTORE_CONNECTED;
  xenevtchn_notify(...);
}

This is all not terribly maintainable; you're hoisting the
domain_conn_reset() thing into a shared codepath, where the other two
callers don't need it, just to avoid potentially duplicating two
probably unnecessary lines in dom0_init().  Given the kinds of bugs
that have already arisen because of putting things into this
multiplexed function (the current one we're trying to fix, as well as
49dd52fb131), I'd prefer to keep things simple.

I wouldn't nack such a patch.  But I would have a harder time arguing
in favor of such a patch, than a patch like the one I've written
(perhaps with a duplicated notification in dom0_init() if you really
think it's necessary).

 -George

