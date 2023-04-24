Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BB06ECD00
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 15:19:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525366.816518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqw6F-0004hp-0x; Mon, 24 Apr 2023 13:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525366.816518; Mon, 24 Apr 2023 13:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqw6E-0004ez-Tr; Mon, 24 Apr 2023 13:19:22 +0000
Received: by outflank-mailman (input) for mailman id 525366;
 Mon, 24 Apr 2023 13:17:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZyYO=AP=tibco.com=tismith@srs-se1.protection.inumbo.net>)
 id 1pqw4r-0004Yd-B9
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 13:17:57 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c74ffe3-e2a2-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 15:17:55 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4ec81773d50so4646501e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Apr 2023 06:17:55 -0700 (PDT)
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
X-Inumbo-ID: 6c74ffe3-e2a2-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibco.com; s=googleworkspace; t=1682342275; x=1684934275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+WWeTT7yz9K2lWxU7Tm1CgnN360PHMug0vWEViBFWw=;
        b=BWPaFNEDCZlRCHN9dxkgh7qXzaciL8B83EKJJvifbFz249EAXpbyE4l385LM5Lf46p
         g/4PCXRt8s9Hyrn0+W/2NCn7NV2SRDLwlCp4EcsUJ7tbtNnMgqlH7aKHfB0+EtuwIPD+
         Yr+jsMTsN0XjaV7nju6TcI4Ns0mQ/TpZRXPVaBMHvlRP86X+IOfCiD0+cFxPPs1wCnSN
         1ZjWtVsl8MvvNN7+/PAn7d44zi5NRIQJ0EgEHkncBkHTgwGL5P92Qyx+PcgU3Uqmat0B
         hc4QudAiW731gsGmfJQzp4MiNblU2t3QiqLC0WQYGUDTU1blMo+4nCVT2vkOfSb5LtSI
         ElpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682342275; x=1684934275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+WWeTT7yz9K2lWxU7Tm1CgnN360PHMug0vWEViBFWw=;
        b=J15/VIEhvcY/J+WICrd2JMZK+HBTaAWhAWNFOdETQs6zOV+W59woy5cMEzw40NWQHf
         XC2VdUIc1m5K1qu6BZzeEYuZtLRYK/W7TSgz9JlGF4JaeKAcHqgw3+0nl4PEfT53N1sp
         cNlSPwwqkfo54eQgHInaRnPlwAhxHdTbeJ7SDuJVrM1S6w8s35adEXTvqca9f/tHGtZO
         Qu7k3V/1okBPgRwroCE5dnZySl1KR0WPnTsn64y1WF94HCZF+mVhDCWhMSquvChve17T
         oJ3cOTScAHhTUVocADgqIB/By9KyVB6YbQG3bNdzNBGu1CTGCMRqBOz/8q46Edregayx
         iOIw==
X-Gm-Message-State: AAQBX9d5s1d0wFibgBUwid/2MENCiYgHY9/Nv0/Y0ffqJMkWPkUP/ymB
	TWQ8AzpzPmva7hNiLhyHlNvhww6F5YQ60g8ArxKZ8i2nol5DuVsIhVo+Pg==
X-Google-Smtp-Source: AKy350Z5yeGOzzt/OX5fmCYzzKSIt9TlG3RtF2l52DUYcBpUWfco1vW/N8sQfd/z7NWRHPo/Sv2pc/RCFIU+fqWeMQk=
X-Received: by 2002:a19:f018:0:b0:4ef:f126:affc with SMTP id
 p24-20020a19f018000000b004eff126affcmr796788lfc.7.1682342274784; Mon, 24 Apr
 2023 06:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230420110205.688689-1-mark.syms@citrix.com> <54a37172-cad5-3b27-36fc-3b7768e39df8@xen.org>
 <CAPYKksVtGyfv3TbAjLH1G=N6=pH-pH2-FTX5c3+E5PsOKo2aOQ@mail.gmail.com>
In-Reply-To: <CAPYKksVtGyfv3TbAjLH1G=N6=pH-pH2-FTX5c3+E5PsOKo2aOQ@mail.gmail.com>
From: Tim Smith <tismith@tibco.com>
Date: Mon, 24 Apr 2023 14:17:43 +0100
Message-ID: <CALUK5G5T=8MkxaQxdeid_ypo1e4DJ-zBRAMb7D+dcHkVdJt2tQ@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] xen: Fix SEGV on domain disconnect
To: Mark Syms <mark.syms@cloud.com>
Cc: paul@xen.org, mark.syms@citrix.com, qemu-devel@nongnu.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, 
	xen-devel@lists.xenproject.org, tim.smith@citrix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 24, 2023 at 1:08=E2=80=AFPM Mark Syms <mark.syms@cloud.com> wro=
te:
>
> Copying in Tim who did the final phase of the changes.
>
> On Mon, 24 Apr 2023 at 11:32, Paul Durrant <xadimgnik@gmail.com> wrote:
> >
> > On 20/04/2023 12:02, mark.syms@citrix.com wrote:
> > > From: Mark Syms <mark.syms@citrix.com>
> > >
> > > Ensure the PV ring is drained on disconnect. Also ensure all pending
> > > AIO is complete, otherwise AIO tries to complete into a mapping of th=
e
> > > ring which has been torn down.
> > >
> > > Signed-off-by: Mark Syms <mark.syms@citrix.com>
> > > ---
> > > CC: Stefano Stabellini <sstabellini@kernel.org>
> > > CC: Anthony Perard <anthony.perard@citrix.com>
> > > CC: Paul Durrant <paul@xen.org>
> > > CC: xen-devel@lists.xenproject.org
> > >
> > > v2:
> > >   * Ensure all inflight requests are completed before teardown
> > >   * RESEND to fix formatting
> > > ---
> > >   hw/block/dataplane/xen-block.c | 31 +++++++++++++++++++++++++------
> > >   1 file changed, 25 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-=
block.c
> > > index 734da42ea7..d9da4090bf 100644
> > > --- a/hw/block/dataplane/xen-block.c
> > > +++ b/hw/block/dataplane/xen-block.c
> > > @@ -523,6 +523,10 @@ static bool xen_block_handle_requests(XenBlockDa=
taPlane *dataplane)
> > >
> > >       dataplane->more_work =3D 0;
> > >
> > > +    if (dataplane->sring =3D=3D 0) {
> > > +        return done_something;
> > > +    }
> > > +
> >
> > I think you could just return false here... Nothing is ever going to be
> > done if there's no ring :-)
> >
> > >       rc =3D dataplane->rings.common.req_cons;
> > >       rp =3D dataplane->rings.common.sring->req_prod;
> > >       xen_rmb(); /* Ensure we see queued requests up to 'rp'. */
> > > @@ -666,14 +670,35 @@ void xen_block_dataplane_destroy(XenBlockDataPl=
ane *dataplane >   void xen_block_dataplane_stop(XenBlockDataPlane *datapla=
ne)
> > >   {
> > >       XenDevice *xendev;
> > > +    XenBlockRequest *request, *next;
> > >
> > >       if (!dataplane) {
> > >           return;
> > >       }
> > >
> > > +    /* We're about to drain the ring. We can cancel the scheduling o=
f any
> > > +     * bottom half now */
> > > +    qemu_bh_cancel(dataplane->bh);
> > > +
> > > +    /* Ensure we have drained the ring */
> > > +    aio_context_acquire(dataplane->ctx);
> > > +    do {
> > > +        xen_block_handle_requests(dataplane);
> > > +    } while (dataplane->more_work);
> > > +    aio_context_release(dataplane->ctx);
> > > +
> >
> > I don't think we want to be taking new requests, do we?
> >

If we're in this situation and the guest has put something on the
ring, I think we should do our best with it.
We cannot just rely on the guest to be well-behaved, because they're
not :-( We're about to throw the
ring away, so whatever is there would otherwise be lost. This bit is
here to try to handle guests which are
less than diligent about their shutdown. We *should* always be past
this fast enough when the disconnect()/connect()
of XenbusStateConnected happens that all remains well (if not, we were
in a worse situation before).

> > > +    /* Now ensure that all inflight requests are complete */
> > > +    while (!QLIST_EMPTY(&dataplane->inflight)) {
> > > +        QLIST_FOREACH_SAFE(request, &dataplane->inflight, list, next=
) {
> > > +            blk_aio_flush(request->dataplane->blk, xen_block_complet=
e_aio,
> > > +                        request);
> > > +        }
> > > +    }
> > > +
> >
> > I think this could possibly be simplified by doing the drain after the
> > call to blk_set_aio_context(), as long as we set dataplane->ctx to
> > qemu_get_aio_context(). Alos, as long as more_work is not set then it
> > should still be safe to cancel the bh before the drain AFAICT.

I'm not sure what you mean by simpler? Possibly I'm not getting something.

We have to make sure that any "aio_bh_schedule_oneshot_full()" which
happens as a result of
"blk_aio_flush()" has finished before any change of AIO context,
because it tries to use the one which
was current at the time of being called (I have the SEGVs to prove it
:-)). Whether that happens before or after
"blk_set_aio_context(qemu_get_aio_context())" doesn't seem to be a
change in complexity to me.

Motivation was to get as much as possible to happen in the way it
"normally" would, so that future changes
are less likely to regress, but as mentioned maybe I'm missing something.

The BH needs to be prevented from firing ASAP, otherwise the
disconnect()/connect() which happens when
XenbusStateConnected can have the bh fire from what the guest does
next right in the middle of juggling
contexts for the disconnect() (I have the SEGVs from that too...).

> >    Paul
> >
> > >       xendev =3D dataplane->xendev;
> > >
> > >       aio_context_acquire(dataplane->ctx);
> > > +
> > >       if (dataplane->event_channel) {
> > >           /* Only reason for failure is a NULL channel */
> > >           xen_device_set_event_channel_context(xendev, dataplane->eve=
nt_channel,
> > > @@ -684,12 +709,6 @@ void xen_block_dataplane_stop(XenBlockDataPlane =
*dataplane)
> > >       blk_set_aio_context(dataplane->blk, qemu_get_aio_context(), &er=
ror_abort);
> > >       aio_context_release(dataplane->ctx);
> > >
> > > -    /*
> > > -     * Now that the context has been moved onto the main thread, can=
cel
> > > -     * further processing.
> > > -     */
> > > -    qemu_bh_cancel(dataplane->bh);
> > > -
> > >       if (dataplane->event_channel) {
> > >           Error *local_err =3D NULL;
> > >
> >

Tim (hoping GMail behaves itself with this message...)

