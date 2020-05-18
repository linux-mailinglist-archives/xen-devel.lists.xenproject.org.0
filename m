Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E29E71D7CD8
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 17:30:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jahii-0004WJ-L4; Mon, 18 May 2020 15:30:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLm=7A=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jahih-0004WE-HZ
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 15:30:23 +0000
X-Inumbo-ID: 7ce1bcfc-991c-11ea-b07b-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ce1bcfc-991c-11ea-b07b-bc764e2007e4;
 Mon, 18 May 2020 15:30:22 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id h188so8449435lfd.7
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 08:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RNVXcfewXqmsp+ezBCQMBAjKuoMluyNqSpecwaZ3Lv4=;
 b=Gn/vED0Gf9+nQjOCDkaMwgyUeH3+ftV7JzbGYrpkT1kGB2w5I2zG8UoF4sWKy2wJdM
 48MMyY76gUyjJSuCfnR+aAvp24Hfyg4uaTD6//tr5JXejea4ikNRpeWfuudpnQJBPpcL
 izDc6aARp/Dr9D0GNYWe/sEiQwAYuwllHwiv0hVUzbIqkAlva4PGUw3gnpIkP+kqj6hI
 I7bdy15mnpNfKJwqKF/X7BNmMKBAMucjgY5tX2arUVVwSnSS+YyQ8Kc40rYOj8dSyjdC
 4G1Ed7hmZpoCsG3zMU38bfcQTQpgB8DzssTawsqvFmOTpLKmaWHs1oBYdGNjErxjAezO
 gzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RNVXcfewXqmsp+ezBCQMBAjKuoMluyNqSpecwaZ3Lv4=;
 b=Ia46fBZnpOVrBQvqUItDmSait06D22ZocMhljan9D55e9qEgnBAP7TeR7h77g6TnfG
 xbplbxlmEVtNdk8AYwmND2wTD7GAho2Z1LiUBL8b1TlNtz4CMrIuy6z2JujR3f7KNDwH
 m8pm/Q+UW/4vFA9cvAAseIfGhm/ulavUgyPMGYHoKutUlkavMm6ovFFKpHLN3J+i7TVW
 /9whhk5XlDpkEW7E7SIdsN3OjT/BfKLYqTjkNS4A4ohlqbuxpuTdbJ28GeMqG3ZpeWjZ
 3ZEc/R3DVvcMshA1WF75BiN9gUMNlU3cIstCJHPjEZLgPAchkeJsYt0if8t+vkJwsARm
 MIzw==
X-Gm-Message-State: AOAM532o3hoLKJxQRoimpq/At/30aPlseq/3caWLuMt2qbOJxJyODfVy
 jRfM7ZdR+2AZZmdTq2FClCXFUoZ8ZfRbRLHASgQ=
X-Google-Smtp-Source: ABdhPJwkj6Nkoq5LPDS2Iwv0eBH8eyAMlCib8NYu+rS5P+pGBS+uGljxz+DfUjDo2qG7EBWwP5wDShzlUDvNdiA2grk=
X-Received: by 2002:a05:6512:31d1:: with SMTP id
 j17mr4845055lfe.148.1589815821575; 
 Mon, 18 May 2020 08:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200518011353.326287-1-jandryuk@gmail.com>
 <20200518011353.326287-10-jandryuk@gmail.com>
 <24258.39586.245004.804616@mariner.uk.xensource.com>
In-Reply-To: <24258.39586.245004.804616@mariner.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 18 May 2020 11:30:10 -0400
Message-ID: <CAKf6xpt-wBML1kFPOddaM8J8KbqSveN=Z0esvRN-O4UzidrTQg@mail.gmail.com>
Subject: Re: [PATCH v6 09/18] libxl: add save/restore support for qemu-xen in
 stubdomain
To: Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 18, 2020 at 10:24 AM Ian Jackson <ian.jackson@citrix.com> wrote=
:
>
> Jason Andryuk writes ("[PATCH v6 09/18] libxl: add save/restore support f=
or qemu-xen in stubdomain"):
> > From: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> ...
> >      if (state->saved_state) {
> > -        /* This file descriptor is meant to be used by QEMU */
> > -        *dm_state_fd =3D open(state->saved_state, O_RDONLY);
> > -        flexarray_append(dm_args, "-incoming");
> > -        flexarray_append(dm_args, GCSPRINTF("fd:%d",*dm_state_fd));
> > +        if (is_stubdom) {
> > +            /* Linux stubdomain must replace $STUBDOM_RESTORE_INCOMING=
_ARG
> > +             * with the approriate fd:$num argument for the
> > +             * STUBDOM_CONSOLE_RESTORE console 2.
> > +             */
> > +            flexarray_append(dm_args, "-incoming");
> > +            flexarray_append(dm_args, "$STUBDOM_RESTORE_INCOMING_ARG")=
;
> > +        } else {
> > +            /* This file descriptor is meant to be used by QEMU */
> > +            *dm_state_fd =3D open(state->saved_state, O_RDONLY);
> > +            flexarray_append(dm_args, "-incoming");
> > +            flexarray_append(dm_args, GCSPRINTF("fd:%d",*dm_state_fd))=
;
>
> Hrk.  The stubdom script is expected to spot this particular value in
> the dm_args array and seddery it.  OK.  This is, at leasst, sound.
> I'm happy with the code and the protocol.
>
> I think this needs a change to this doc:
>
>   Subject: [PATCH v6 01/18] Document ioemu MiniOS stubdomain protocol
>
>   +Toolstack to MiniOS ioemu stubdomain protocol
>   +---------------------------------------------
>
> Provided that you update the docs commit and take my ack off that,
> please add my ack to this code :-).

I updated "[PATCH v6 02/18] Document ioemu Linux stubdomain protocol"
to mention $STUBDOM_RESTORE_INCOMING_ARG as well as the xenstore
directory change to "dm-argv" in this v6, but I left your Ack on it.
Sorry about that.  I'll remove your Ack from 02/18 when I post v7,
but I'll add the Ack to this 09/18.

-Jason

