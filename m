Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7F87FC5AE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 21:43:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643473.1003744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r84uq-0007OA-4i; Tue, 28 Nov 2023 20:42:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643473.1003744; Tue, 28 Nov 2023 20:42:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r84uq-0007MG-10; Tue, 28 Nov 2023 20:42:44 +0000
Received: by outflank-mailman (input) for mailman id 643473;
 Tue, 28 Nov 2023 20:42:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zxdS=HJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r84uo-0007MA-5O
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 20:42:42 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aca177d4-8e2e-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 21:42:41 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5484ef5e3d2so7716464a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 12:42:41 -0800 (PST)
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
X-Inumbo-ID: aca177d4-8e2e-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701204161; x=1701808961; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Axr99m5OMh41+pjqYNsytW6h2Eb9sGMLEr3hs99VuRo=;
        b=nrAqZCorN0t5KtTEH+prYf0ReU5wLq6Vq6VfO4zetd2e8uwgaYws8YogbtelpvUD9Q
         YBmM5ulvTLrvF24PQ6A4guBUOzZQkvnoq4SuFg0DaSx2aSCLder2NrBy191TlPfx1qPV
         1/Vqk4bEaxc/bdad2jjlR66ibq/gxQqZVwBgOC+WDMLaBkD45AC4UBZFcGujT0axzoSc
         1R6ABBMyhjprO5N1UmOsj/QG9T9f1l5xDnLXJel9zoclPVGO7Pab1Cu+Vz8qj3WTSHc3
         C6oLyMCMFK4jBEK33v1jEA/lDEbPJ2ZRg5iuNhToxPNdt/Oev+M4R2Cufm2BKGhvEBUP
         +Ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701204161; x=1701808961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Axr99m5OMh41+pjqYNsytW6h2Eb9sGMLEr3hs99VuRo=;
        b=v3ooQtRKvbNX2JS09BOxl0RStbyOI7S37N2jLQThmh+poU8j/Yl6x44NPvgSjp9Rd3
         4r+GJUS/EsqlPe55gNV96mWjoXb3LKlLl/njcvcEFuUkgFb0Rxc6TBVoetrZIbVLgTpa
         4orTw7wTsW8RMe6+88O62nXVtJyevidnX8fzT9d1P2vVDinqQaEDU+RV2CmqGd4WGg6x
         vT+6HMwurApR0Wb7VZ5S6guZWvoGaw75qliE7E9G2gxmjww6oTlDfow9QeLZ3zj02GtW
         NsE6dqRUsEJVOfhqKaYc5CdyMrRqgAmt3lLr3yvwTURp4RGM/49XDDCrtPoFK7gbzDfo
         vWwQ==
X-Gm-Message-State: AOJu0Ywm2xUl+JAm7j+DCa5uB9s0AR4p7jLzO6sVKs7kdE8hqXzLhShP
	A5NsAd//kdlQMiaaJ4ZP92TdKFKOTNrQ6SAcima4b4Sw
X-Google-Smtp-Source: AGHT+IEGU6zyFI10wAgX6tYQEQe281CGyb8bR+49soQtdQSHHLfBJiL/bsXp/uqoyOcxnCZgGgOL8tr8NOlp0jj9y/E=
X-Received: by 2002:a50:8714:0:b0:54a:af21:f270 with SMTP id
 i20-20020a508714000000b0054aaf21f270mr11836692edb.28.1701204160541; Tue, 28
 Nov 2023 12:42:40 -0800 (PST)
MIME-Version: 1.0
References: <20231110160804.29021-1-jgross@suse.com> <20231110160804.29021-28-jgross@suse.com>
 <369145c5-0bcd-42e5-aff3-b2e58549674e@xen.org> <e3376d27-3b36-4290-8f7a-e99db1e2fbbf@suse.com>
 <2f024e6b-8f4b-4784-a1ef-1acb04c5a4dc@xen.org> <f15e5a60-e1b0-445b-9374-f8feda10f0b0@suse.com>
 <b18acbe0-b8f9-47d6-a85d-c4a7bd158809@xen.org> <34c2307e-f99d-41ab-b76c-948389c64bd0@suse.com>
In-Reply-To: <34c2307e-f99d-41ab-b76c-948389c64bd0@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 28 Nov 2023 15:42:28 -0500
Message-ID: <CAKf6xpsupA-eR_KLgncv-DPqNzLKxU=h_fxJfJ4F7kpfTgTQ3w@mail.gmail.com>
Subject: Re: [PATCH v2 27/29] tools/xenstored: add helpers for filename handling
To: Juergen Gross <jgross@suse.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 1:14=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
>
> On 14.11.23 21:53, Julien Grall wrote:
> > Hi Juergen,
> >
> > On 14/11/2023 09:26, Juergen Gross wrote:
> >> On 14.11.23 10:10, Julien Grall wrote:
> >>> Hi Juergen,
> >>>
> >>> On 14/11/2023 06:45, Juergen Gross wrote:
> >>>> On 13.11.23 23:25, Julien Grall wrote:
> >>>>> Hi Juergen,
> >>>>>
> >>>>> On 10/11/2023 16:08, Juergen Gross wrote:
> >>>>>> diff --git a/tools/xenstored/lu_daemon.c b/tools/xenstored/lu_daem=
on.c
> >>>>>> index 71bcabadd3..6351111ab0 100644
> >>>>>> --- a/tools/xenstored/lu_daemon.c
> >>>>>> +++ b/tools/xenstored/lu_daemon.c
> >>>>>> @@ -24,7 +24,7 @@ void lu_get_dump_state(struct lu_dump_state *sta=
te)
> >>>>>>       state->size =3D 0;
> >>>>>>       state->filename =3D talloc_asprintf(NULL, "%s/state_dump",
> >>>>>> -                      xenstore_daemon_rundir());
> >>>>>> +                      xenstore_rundir());
> >>>>>
> >>>>> ... call and ...
> >>>>>
> >>>>>>       if (!state->filename)
> >>>>>>           barf("Allocation failure");
> >>>>>> @@ -65,7 +65,7 @@ FILE *lu_dump_open(const void *ctx)
> >>>>>>       int fd;
> >>>>>>       filename =3D talloc_asprintf(ctx, "%s/state_dump",
> >>>>>> -                   xenstore_daemon_rundir());
> >>>>>> +                   xenstore_rundir());
> >>>>>
> >>>>> ... this one could be replaced with absolute_filename().
> >>>>
> >>>> No, I don't think this is a good idea.
> >>>>
> >>>> I don't want the daemon to store trace files specified as relative f=
iles
> >>>> to be stored in /var/run/xen, while I want all files of the stubdom =
to be
> >>>> stored under /var/lib/xen.
> >>>
> >>> Why? This is a bit odd to have a different behavior between stubdom a=
nd
> >>> daemon. It would be much easier for the user if they knew all the fil=
es would
> >>> be at the same place regardless the version used.
> >>
> >> The main difference is that stubdom has access to only _one_ directory=
 in dom0.
> >
> > Would you be able to explain why we can only give access to a single di=
rectory?
> > Is this because of the 9pfs protocol?
>
> Yes. I can mount a specific dom0 directory in the guest.

I'm fine with a single directory being used for stubdom.  Two
directories could be exported, and mini-os would need to use the "tag"
to differentiate the two.  That may not be worth the added code.  QEMU
can provide multiple 9pfs exports and Linux can mount them by tag
name.

Regards,
Jason

