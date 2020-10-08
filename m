Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5A8287710
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 17:25:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4501.11759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQXnb-0001bA-Gp; Thu, 08 Oct 2020 15:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4501.11759; Thu, 08 Oct 2020 15:25:43 +0000
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
	id 1kQXnb-0001al-DS; Thu, 08 Oct 2020 15:25:43 +0000
Received: by outflank-mailman (input) for mailman id 4501;
 Thu, 08 Oct 2020 15:25:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PeKH=DP=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kQXna-0001ab-3U
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 15:25:42 +0000
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bbdba12-1b0d-4bc8-8db6-ee0ffbb2756b;
 Thu, 08 Oct 2020 15:25:41 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id b22so6918678lfs.13
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2020 08:25:41 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PeKH=DP=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kQXna-0001ab-3U
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 15:25:42 +0000
X-Inumbo-ID: 1bbdba12-1b0d-4bc8-8db6-ee0ffbb2756b
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1bbdba12-1b0d-4bc8-8db6-ee0ffbb2756b;
	Thu, 08 Oct 2020 15:25:41 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id b22so6918678lfs.13
        for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2020 08:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o3vUyC3fPQjFS7Epr+zzwzy+oDiIhOKRhXq6Ne0vIDc=;
        b=vYnmZRqlDZvuIvxvsljC0dYALaxDtlevM+jnRRCQ/e+BFBpth7kHKkBixnjcH8w2JF
         wEncK+6UMDOzEfoOGC/amtHQKQDRQkVEjGlXQXm2LkMIvljkJeDp2VdBIzRiukpgameq
         VbZyjV1WPDWCGvKLrK+eNh4KXNM/ODUYFRWemHsQOogSlmmMQ+dzpImtV6cRfi3uwz3T
         Az0eJttRhqezfrMp6xuvnA3kaWmd2YCDbm7SPTWxobZlmQOauzP1iTuG8UiYyaGOvQd/
         MBf+7jYZ471cwo+uQeR/AcPFnYKsg0/V/RMayRbL96v0vpQBBzgZd2IZac7xDDjPGeP5
         G2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o3vUyC3fPQjFS7Epr+zzwzy+oDiIhOKRhXq6Ne0vIDc=;
        b=LVSXnkGl9ORL9WHB1hXB5hZhWfFWPbAH4baEh8YlT6oz35sO+Y6s+ihKA15xUKaysC
         aJPwGxKtsAPE6Oo2WprNb3Dygll1BTFlWdCRP0eHXNGYrlve0u3hGRn3oi9gg4TlIgtJ
         vyps/Mg9QdnJaQx4q/zm0RmPATM3g0rhs7rCOX2X3ByndqqwG0sUqUiRWYMZ2KfTHOOs
         kPkaTDDQwnwzQ7R8k/2YLMAj0SvpI272jxxV6ahXO/CSxjA5iSXNDQDZ3VQs2TeppWFX
         om+zc3PskwYOgVayeGCeDROoiHbgwUK6gVu0d1Zl9xFIJJOgXZaEBb6p3eBd8HxAQhAw
         ORrw==
X-Gm-Message-State: AOAM5309LAu5lHdfFrW2eB63EhLocJd5oGJvnJ/MZxoCXZ1TdjGuP96S
	8U1qfAfA8/o1P+owhlnaN02mtp1o1mxiHTRrjZDQCTZ+
X-Google-Smtp-Source: ABdhPJxdvEltAz8+Ft7SbyMeNtROB9GBoZanB+1ucQX5+Hc9rqXsB/E4FP7NGqep70w4X8crYifICgIUUxZRomfH0+8=
X-Received: by 2002:ac2:44a4:: with SMTP id c4mr3019120lfm.365.1602170739775;
 Thu, 08 Oct 2020 08:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201001235337.83948-1-jandryuk@gmail.com> <20201007105049.vfpunr4g62fqvijr@liuwe-devbox-debian-v2>
 <CAKf6xptt_r6_VuRSwRXQRUR4Q39c_619e4iNxi8uVxV7YOHDBw@mail.gmail.com>
In-Reply-To: <CAKf6xptt_r6_VuRSwRXQRUR4Q39c_619e4iNxi8uVxV7YOHDBw@mail.gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 8 Oct 2020 11:25:27 -0400
Message-ID: <CAKf6xpve+8uAbCYRW9n3cr+2tgNbT5UD9UhSkg5ZmLarQgCSXg@mail.gmail.com>
Subject: Re: [PATCH] libxl: only query VNC when enabled
To: Wei Liu <wl@xen.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 8, 2020 at 9:31 AM Jason Andryuk <jandryuk@gmail.com> wrote:
>
> On Wed, Oct 7, 2020 at 6:50 AM Wei Liu <wl@xen.org> wrote:
> >
> > On Thu, Oct 01, 2020 at 07:53:37PM -0400, Jason Andryuk wrote:
> > > QEMU without VNC support (configure --disable-vnc) will return an error
> > > when VNC is queried over QMP since it does not recognize the QMP
> > > command.  This will cause libxl to fail starting the domain even if VNC
> > > is not enabled.  Therefore only query QEMU for VNC support when using
> > > VNC, so a VNC-less QEMU will function in this configuration.
> > >
> > > 'goto out' jumps to the call to device_model_postconfig_done(), the
> > > final callback after the chain of vnc queries.  This bypasses all the
> > > QMP VNC queries.
> > >
> > > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > > ---
> > >  tools/libs/light/libxl_dm.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> > > index a944181781..d1ff35dda3 100644
> > > --- a/tools/libs/light/libxl_dm.c
> > > +++ b/tools/libs/light/libxl_dm.c
> > > @@ -3140,6 +3140,7 @@ static void device_model_postconfig_chardev(libxl__egc *egc,
> > >  {
> > >      EGC_GC;
> > >      libxl__dm_spawn_state *dmss = CONTAINER_OF(qmp, *dmss, qmp);
> > > +    const libxl_vnc_info *vnc = libxl__dm_vnc(dmss->guest_config);
> > >      const libxl__json_object *item = NULL;
> > >      const libxl__json_object *o = NULL;
> > >      int i = 0;
> > > @@ -3197,6 +3198,9 @@ static void device_model_postconfig_chardev(libxl__egc *egc,
> > >          if (rc) goto out;
> > >      }
> > >
> > > +    if (!vnc)
> > > +        goto out;
> > > +
> >
> > I would rather this check be done in device_model_postconfig_vnc.
> >
> > Does the following work for you?
>
> I like your version, but it doesn't work:
> libxl: debug: libxl_qmp.c:1883:libxl__ev_qmp_send: Domain 1: ev
> 0x55aa58417d88, cmd 'query-vnc'
> libxl: error: libxl_qmp.c:1836:qmp_ev_parse_error_messages: Domain
> 1:The command query-vnc has not been found
> libxl: error: libxl_dm.c:3321:device_model_postconfig_done: Domain
> 1:Post DM startup configs failed, rc=-29
>
> When QEMU has vnc disabled, it doesn't recognize query-vnc.  I looked
> at modifying qemu to support query-vnc even with --disable-vnc, but it
> was messy to untangle the QMP definitions.  Since we are telling libxl
> not to use VNC, it makes sense not to query about it.

Oh, I should add that QEMU needs a small patch to allow -vnc none in
ui/vnc-stub.c when vnc is disabled.  This is because libxl always
passes -vnc none to ensure a default vnc is not created.

Regards,
Jason

>
> > diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> > index a944181781bb..c5db755a65d7 100644
> > --- a/tools/libs/light/libxl_dm.c
> > +++ b/tools/libs/light/libxl_dm.c
> > @@ -3222,6 +3222,8 @@ static void device_model_postconfig_vnc(libxl__egc *egc,
> >
> >      if (rc) goto out;
> >
> > +    if (!vnc) goto out;
> > +
> >      /*
> >       * query-vnc response:
> >       * { 'enabled': 'bool', '*host': 'str', '*service': 'str' }
> > @@ -3255,7 +3257,8 @@ static void device_model_postconfig_vnc(libxl__egc *egc,
> >          if (rc) goto out;
> >      }
> >
> > -    if (vnc && vnc->passwd && vnc->passwd[0]) {
> > +    assert(vnc);
> > +    if (vnc->passwd && vnc->passwd[0]) {
> >          qmp->callback = device_model_postconfig_vnc_passwd;
> >          libxl__qmp_param_add_string(gc, &args, "password", vnc->passwd);
> >          rc = libxl__ev_qmp_send(egc, qmp, "change-vnc-password", args);
> >

