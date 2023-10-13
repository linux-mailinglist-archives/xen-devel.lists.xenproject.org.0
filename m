Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 751707C846E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 13:33:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616493.958546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrGOx-00030B-Ve; Fri, 13 Oct 2023 11:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616493.958546; Fri, 13 Oct 2023 11:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrGOx-0002xp-S3; Fri, 13 Oct 2023 11:32:19 +0000
Received: by outflank-mailman (input) for mailman id 616493;
 Fri, 13 Oct 2023 11:32:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=36VQ=F3=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qrGOw-0002xL-On
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 11:32:18 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a595eb3-69bc-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 13:32:18 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50435ad51bbso2549243e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 04:32:18 -0700 (PDT)
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
X-Inumbo-ID: 2a595eb3-69bc-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1697196737; x=1697801537; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pW86jlUTx8cCMrLQcKXX0OlC8YQUMxXqtsokrB/e68=;
        b=PuQMBxn+xZr3gO7hQqBoRpu4fsDb7gc5zr4LYZqRH1G0gG4FdL2ZP51MZdoj3VwSdc
         +PA4xxUBxabak5AVtdM4wbBlJuVw2KPaMR8O8/ySklUn/qLrogdHNoSxhvrzZEUHu+ED
         BnoqXUhIybQrtvNmsWp1GbwCsc8oNYuoFMb8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697196737; x=1697801537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pW86jlUTx8cCMrLQcKXX0OlC8YQUMxXqtsokrB/e68=;
        b=hchjigqjPwembdQNHG7mjP9yEs+zsZPVlb2CkxjUuFGuW+flaY8rQO0Z9pie3KWRlu
         3Bzd1PGp7gU8NzF7IcO0/S6EOdXJN3ISSqgdIlna5JtfgOPJgrjDasynq2WXVm+UC/dh
         PzFhlXSb9Gik9Uwd0cKIq91Gz+CKaBfAKfsiTTuSDtSdZ1GpLrTlPQn1xiOquExXnjsn
         Wkoh7y8Ue8VG0gJ2eYUavwr4jbXfouEBpLHSC9udg8le1GO2XzVyxeAN7a3WK/ab8jLf
         r7GWjLqTpAmg7lKkM9oztMvzXT3KfO3WIYRv/gKm6slzxPjNcq8OcLmrbRIBrwe031ES
         zzrA==
X-Gm-Message-State: AOJu0YxJENKuszRZNxPwOKkOra+cCXmOXmwx8hQ/C4HDQ5dxF18WqJl7
	1eXPBAKAkjLEry18Sjekk/r8XcavisZx/c2qc+UhOw==
X-Google-Smtp-Source: AGHT+IFV34IEQ9A1+hR28F7cvHgAv76ARgCAfplLLz2VVvb+5sD2H+uLumQ139oG6pBz6Ip9/mstonICMjK50kV99Lc=
X-Received: by 2002:a19:a407:0:b0:507:9702:c11d with SMTP id
 q7-20020a19a407000000b005079702c11dmr2063960lfc.64.1697196737556; Fri, 13 Oct
 2023 04:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2309271603590.1403502@ubuntu-linux-20-04-desktop>
 <a31ce6cb-6234-5e7f-5cd4-ed190f029811@citrix.com> <alpine.DEB.2.22.394.2309271658500.1403502@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZbeUFrfAUJShooJFJ+d89f4xdXfJJ9HoJKRh4UStkTFQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2310121535580.3431292@ubuntu-linux-20-04-desktop>
 <CA+zSX=Y5dMVFM6dVNgBRHxKc0C1e5WGgweQ0FaXXCfAFGH1aPA@mail.gmail.com> <a93839b8-932a-4634-9549-081df950afb2@xen.org>
In-Reply-To: <a93839b8-932a-4634-9549-081df950afb2@xen.org>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 13 Oct 2023 12:32:06 +0100
Message-ID: <CA+zSX=a972GC=_FKK2eGkArPb6RszCHDN0+6JKFJiMjoMpAySQ@mail.gmail.com>
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

On Fri, Oct 13, 2023 at 12:22=E2=80=AFPM Julien Grall <julien@xen.org> wrot=
e:
>
> Hi George,
>
> On 13/10/2023 11:16, George Dunlap wrote:
> > On Thu, Oct 12, 2023 at 11:36=E2=80=AFPM Stefano Stabellini
> > <sstabellini@kernel.org> wrote:
> >>
> >> On Thu, 12 Oct 2023, George Dunlap wrote:
> >>>>> Stop tinkering in the hope that it hides the problem.  You're only
> >>>>> making it harder to fix properly.
> >>>>
> >>>> Making it harder to fix properly would be a valid reason not to comm=
it
> >>>> the (maybe partial) fix. But looking at the fix again:
> >>>>
> >>>> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
> >>>> index a6cd199fdc..9cd6678015 100644
> >>>> --- a/tools/xenstored/domain.c
> >>>> +++ b/tools/xenstored/domain.c
> >>>> @@ -989,6 +989,7 @@ static struct domain *introduce_domain(const voi=
d *ctx,
> >>>>                  talloc_steal(domain->conn, domain);
> >>>>
> >>>>                  if (!restore) {
> >>>> +                       domain_conn_reset(domain);
> >>>>                          /* Notify the domain that xenstore is avail=
able */
> >>>>                          interface->connection =3D XENSTORE_CONNECTE=
D;
> >>>>                          xenevtchn_notify(xce_handle, domain->port);
> >>>> @@ -1031,8 +1032,6 @@ int do_introduce(const void *ctx, struct conne=
ction *conn,
> >>>>          if (!domain)
> >>>>                  return errno;
> >>>>
> >>>> -       domain_conn_reset(domain);
> >>>> -
> >>>>          send_ack(conn, XS_INTRODUCE);
> >>>>
> >>>> It is a 1-line movement. Textually small. Easy to understand and to
> >>>> revert. It doesn't seem to be making things harder to fix? We could
> >>>> revert it any time if a better fix is offered.
> >>>>
> >>>> Maybe we could have a XXX note in the commit message or in-code
> >>>> comment?
> >>>
> >>> It moves a line from one function (do_domain_introduce()) into a
> >>> completely different function (introduce_domain()), nested inside two
> >>> if() statements; with no analysis on how the change will impact
> >>> things.
> >>
> >> I am not the original author of the patch, and I am not the maintainer
> >> of the code, so I don't feel I have the qualifications to give you the
> >> answers you are seeking. Julien as author of the patch and xenstore
> >> reviewer might be in a better position to answer. Or Juergen as xensto=
re
> >> maintainer.
> >
> > I understand that; my main point is that the change is more complex
> > than you're characterizing it.  This is information necessary to
> > understand whether the patch is correct, but it's not in the patch
> > description, nor in the subsequent thread back in May.
> >
> >>> Are there any paths through do_domain_introduce() that now *won't* ge=
t
> >>> a domain_conn_reset() call?  Is that OK?
> >>
> >> Yes, the already-introduced and the restore code paths. The operations=
 in
> >> the already-introduced or the restore code paths seem simple enough no=
t
> >> to require a domain_conn_reset. Julien and Juergen should confirm.
> >
> > There is no "restore" codepath through do_domain_introduce(); it
> > passes "false" for the "restore" argument.  So we  only have two paths
> > to consider through do_domain_introduce(): The "not introduced and not
> > restoring" path, and the "already-introduced" path.
> >
> > I'm not sure what the "simple" elements on the branch in
> > introduce_domain() have to do with whether the content of the page
> > needs to be cleaned up.  As I said, I don't 100% understand this code,
> > but it seems like if anything, the reset would be *more* important to
> > have in the "reintroduce" case than in the "initial introduction"
> > case, since I'd expect the "initial introduction" case to be empty
> > already.
> Indeed, there should be no watches/transactions/buffered I/O for the
> initial introduction. However, the function is also clear part of the
> interface because we can't guaranteed it was zeroed.
>
> The latter matter for the initial introduction. I believe the rest is
> just called for simplicity.
>
> >
> >> Doesn't it seem weird to you that we set a connection to CONNECTED,
> >> notify the domain that it is ready to go, and only *after* that we res=
et
> >> the connection to zero?
> >>
> >> What happens if a domain starts using the connection as soon as it
> >> receives the event channel notification and before domain_conn_reset i=
s
> >> called?
> >
> > Yes, it does seem weird, which is why I said the following. :-)
> >
> >>> I mean, it certainly seems strange to set the state to CONNECTED, sen=
d
> >>> off an event channel, and then after that delete all watches /
> >>> transactions / buffered data and so on;
> >
> > But just because the current code is probably wrong, doesn't mean that
> > the modified code is probably correct.
> >
> > If the problem is the delay between the xenevtchn_notify() in
> > introduce_domain() and the domain_conn_reset() afterwards in
> > do_domain(), would it make sense instead to move the notification into
> > do_introduce(), after the domain_conn_reset()?  It is, after all, in
> > response to XS_INTRODUCE that we want to send the notification, not in
> > dom0_init() or read_state_connection() (which seems to be more about
> > restoring a domain).
>
> I understand that the event channel notification was specifically added
> for dom0less. But I don't see why we don't want to send it to dom0 as wel=
l.
>
> Technically, dom0 has exactly the same problem as dom0less domains it
> boots before Xenstored is running and therefore it may need to know when
> it is ready to receive commands.

It seemed to work fine before 2022, when the notification was
introduced.  How was that coordination done?  Will dom0 honor the
"XENSTORE_RECONNECT" state during bring-up as described in
xenstore-ring.txt?

Personally I'd just take the patch as I wrote it, restoring dom0's
pre-2022 behavior (after review and testing of course); but if you
wanted to test & resubmit with a similar notification inside
dom0_init(), I wouldn't object to it.

Naturally it would be ideal if we could avoid the code duplication;
but that's not possible without a lot more refactoring, which I don't
think we should be doing at this stage in the release.

 -George

