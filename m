Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FB16ECBD3
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 14:10:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525338.816489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqv0p-0004d8-H5; Mon, 24 Apr 2023 12:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525338.816489; Mon, 24 Apr 2023 12:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqv0p-0004Zo-E8; Mon, 24 Apr 2023 12:09:43 +0000
Received: by outflank-mailman (input) for mailman id 525338;
 Mon, 24 Apr 2023 12:07:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6ihU=AP=tibco.com=msyms@srs-se1.protection.inumbo.net>)
 id 1pquz6-0003yq-IS
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 12:07:56 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a514f091-e298-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 14:07:55 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e25fso2580305f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Apr 2023 05:07:55 -0700 (PDT)
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
X-Inumbo-ID: a514f091-e298-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682338075; x=1684930075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K/nk8/06PUIiEF4MTmCY2ffYz6LVNdA5FqcFP3h+JHE=;
        b=E/HqZX9LsREaDluM7cJjcYiaeEE/srWvsBzb31fs0CH00Nu768RWLMrUUQuDuYcGQJ
         yX7N1yUYRfWezOgunqHuu5v9jpf5UOheoeccCcIPEOM9rWw8t/q759zsvL3P7h1sBfaV
         AgnLwVzu/dqQWgIJJ1ECPPGufTa/GBT7ssQSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682338075; x=1684930075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/nk8/06PUIiEF4MTmCY2ffYz6LVNdA5FqcFP3h+JHE=;
        b=QPcB1wHwgYPBU9LYjZEPbgFC/UcppkjY6ZVuZk0jhpD3qnhme92aYSZN5K8ga3bQSD
         zjf4gZNB0cy6g2LzXHQGdo8lWgOtwhxHssJiJTIsJd6sQnAphaKLugJ3UvghcIbag6lF
         VhJrcOLjwyJG9O0EObPT/jQjhfUXTtvO+XrPbrlXBFZY09Hs2E1QszjR3n4A/6h3Hr9w
         j4auK7t1/R4zXLjfmz/y4nWWmVjq5FpHV5RELWOAE57bVqLvP8DzjpwG9I72Tw+W34ep
         4ciffxqWvot0NR4C2Z/iezSUmEdKuUfLT/lqvwB56qh0/MvoGLexRYWeiydFYv90DYsT
         UM4g==
X-Gm-Message-State: AC+VfDxLuiYfGyvMG4SneOU3AGZ1IrKc/HIN1fU5t/+ObOMs9x7/uUh6
	VEaF41v6niY+HI2jTlXy2OrskHFvsgxtgAQeDToTJA==
X-Google-Smtp-Source: ACHHUZ6u7WWEPIINNleWsZq9Pu/ASD8qrU9YsusjfMMTBjNblxYwTHQsh4UhCIhr4kycgtXT9iCpnCYDngowCfq8+Eg=
X-Received: by 2002:a5d:4b86:0:b0:304:8149:239b with SMTP id
 b6-20020a5d4b86000000b003048149239bmr1051205wrt.50.1682338074747; Mon, 24 Apr
 2023 05:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230420110205.688689-1-mark.syms@citrix.com> <54a37172-cad5-3b27-36fc-3b7768e39df8@xen.org>
In-Reply-To: <54a37172-cad5-3b27-36fc-3b7768e39df8@xen.org>
From: Mark Syms <mark.syms@cloud.com>
Date: Mon, 24 Apr 2023 13:07:44 +0100
Message-ID: <CAPYKksVtGyfv3TbAjLH1G=N6=pH-pH2-FTX5c3+E5PsOKo2aOQ@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] xen: Fix SEGV on domain disconnect
To: paul@xen.org
Cc: mark.syms@citrix.com, qemu-devel@nongnu.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, 
	xen-devel@lists.xenproject.org, tim.smith@citrix.com
Content-Type: multipart/alternative; boundary="000000000000567bf705fa13db30"

--000000000000567bf705fa13db30
Content-Type: text/plain; charset="UTF-8"

Copying in Tim who did the final phase of the changes.

On Mon, 24 Apr 2023 at 11:32, Paul Durrant <xadimgnik@gmail.com> wrote:
>
> On 20/04/2023 12:02, mark.syms@citrix.com wrote:
> > From: Mark Syms <mark.syms@citrix.com>
> >
> > Ensure the PV ring is drained on disconnect. Also ensure all pending
> > AIO is complete, otherwise AIO tries to complete into a mapping of the
> > ring which has been torn down.
> >
> > Signed-off-by: Mark Syms <mark.syms@citrix.com>
> > ---
> > CC: Stefano Stabellini <sstabellini@kernel.org>
> > CC: Anthony Perard <anthony.perard@citrix.com>
> > CC: Paul Durrant <paul@xen.org>
> > CC: xen-devel@lists.xenproject.org
> >
> > v2:
> >   * Ensure all inflight requests are completed before teardown
> >   * RESEND to fix formatting
> > ---
> >   hw/block/dataplane/xen-block.c | 31 +++++++++++++++++++++++++------
> >   1 file changed, 25 insertions(+), 6 deletions(-)
> >
> > diff --git a/hw/block/dataplane/xen-block.c
b/hw/block/dataplane/xen-block.c
> > index 734da42ea7..d9da4090bf 100644
> > --- a/hw/block/dataplane/xen-block.c
> > +++ b/hw/block/dataplane/xen-block.c
> > @@ -523,6 +523,10 @@ static bool
xen_block_handle_requests(XenBlockDataPlane *dataplane)
> >
> >       dataplane->more_work = 0;
> >
> > +    if (dataplane->sring == 0) {
> > +        return done_something;
> > +    }
> > +
>
> I think you could just return false here... Nothing is ever going to be
> done if there's no ring :-)
>
> >       rc = dataplane->rings.common.req_cons;
> >       rp = dataplane->rings.common.sring->req_prod;
> >       xen_rmb(); /* Ensure we see queued requests up to 'rp'. */
> > @@ -666,14 +670,35 @@ void
xen_block_dataplane_destroy(XenBlockDataPlane *dataplane >   void
xen_block_dataplane_stop(XenBlockDataPlane *dataplane)
> >   {
> >       XenDevice *xendev;
> > +    XenBlockRequest *request, *next;
> >
> >       if (!dataplane) {
> >           return;
> >       }
> >
> > +    /* We're about to drain the ring. We can cancel the scheduling of
any
> > +     * bottom half now */
> > +    qemu_bh_cancel(dataplane->bh);
> > +
> > +    /* Ensure we have drained the ring */
> > +    aio_context_acquire(dataplane->ctx);
> > +    do {
> > +        xen_block_handle_requests(dataplane);
> > +    } while (dataplane->more_work);
> > +    aio_context_release(dataplane->ctx);
> > +
>
> I don't think we want to be taking new requests, do we?
>
> > +    /* Now ensure that all inflight requests are complete */
> > +    while (!QLIST_EMPTY(&dataplane->inflight)) {
> > +        QLIST_FOREACH_SAFE(request, &dataplane->inflight, list, next) {
> > +            blk_aio_flush(request->dataplane->blk,
xen_block_complete_aio,
> > +                        request);
> > +        }
> > +    }
> > +
>
> I think this could possibly be simplified by doing the drain after the
> call to blk_set_aio_context(), as long as we set dataplane->ctx to
> qemu_get_aio_context(). Alos, as long as more_work is not set then it
> should still be safe to cancel the bh before the drain AFAICT.
>
>    Paul
>
> >       xendev = dataplane->xendev;
> >
> >       aio_context_acquire(dataplane->ctx);
> > +
> >       if (dataplane->event_channel) {
> >           /* Only reason for failure is a NULL channel */
> >           xen_device_set_event_channel_context(xendev,
dataplane->event_channel,
> > @@ -684,12 +709,6 @@ void xen_block_dataplane_stop(XenBlockDataPlane
*dataplane)
> >       blk_set_aio_context(dataplane->blk, qemu_get_aio_context(),
&error_abort);
> >       aio_context_release(dataplane->ctx);
> >
> > -    /*
> > -     * Now that the context has been moved onto the main thread, cancel
> > -     * further processing.
> > -     */
> > -    qemu_bh_cancel(dataplane->bh);
> > -
> >       if (dataplane->event_channel) {
> >           Error *local_err = NULL;
> >
>

--000000000000567bf705fa13db30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Copying in Tim who did the final phase of the changes=
.</div><div><br></div>On Mon, 24 Apr 2023 at 11:32, Paul Durrant &lt;<a hre=
f=3D"mailto:xadimgnik@gmail.com">xadimgnik@gmail.com</a>&gt; wrote:<br>&gt;=
<br>&gt; On 20/04/2023 12:02, <a href=3D"mailto:mark.syms@citrix.com">mark.=
syms@citrix.com</a> wrote:<br>&gt; &gt; From: Mark Syms &lt;<a href=3D"mail=
to:mark.syms@citrix.com">mark.syms@citrix.com</a>&gt;<br>&gt; &gt;<br>&gt; =
&gt; Ensure the PV ring is drained on disconnect. Also ensure all pending<b=
r>&gt; &gt; AIO is complete, otherwise AIO tries to complete into a mapping=
 of the<br>&gt; &gt; ring which has been torn down.<br>&gt; &gt;<br>&gt; &g=
t; Signed-off-by: Mark Syms &lt;<a href=3D"mailto:mark.syms@citrix.com">mar=
k.syms@citrix.com</a>&gt;<br>&gt; &gt; ---<br>&gt; &gt; CC: Stefano Stabell=
ini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a=
>&gt;<br>&gt; &gt; CC: Anthony Perard &lt;<a href=3D"mailto:anthony.perard@=
citrix.com">anthony.perard@citrix.com</a>&gt;<br>&gt; &gt; CC: Paul Durrant=
 &lt;<a href=3D"mailto:paul@xen.org">paul@xen.org</a>&gt;<br>&gt; &gt; CC: =
<a href=3D"mailto:xen-devel@lists.xenproject.org">xen-devel@lists.xenprojec=
t.org</a><br>&gt; &gt;<br>&gt; &gt; v2:<br>&gt; &gt; =C2=A0 * Ensure all in=
flight requests are completed before teardown<br>&gt; &gt; =C2=A0 * RESEND =
to fix formatting<br>&gt; &gt; ---<br>&gt; &gt; =C2=A0 hw/block/dataplane/x=
en-block.c | 31 +++++++++++++++++++++++++------<br>&gt; &gt; =C2=A0 1 file =
changed, 25 insertions(+), 6 deletions(-)<br>&gt; &gt;<br>&gt; &gt; diff --=
git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c<br>&g=
t; &gt; index 734da42ea7..d9da4090bf 100644<br>&gt; &gt; --- a/hw/block/dat=
aplane/xen-block.c<br>&gt; &gt; +++ b/hw/block/dataplane/xen-block.c<br>&gt=
; &gt; @@ -523,6 +523,10 @@ static bool xen_block_handle_requests(XenBlockD=
ataPlane *dataplane)<br>&gt; &gt; =C2=A0 <br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0=
 dataplane-&gt;more_work =3D 0;<br>&gt; &gt; =C2=A0 <br>&gt; &gt; + =C2=A0 =
=C2=A0if (dataplane-&gt;sring =3D=3D 0) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return done_something;<br>&gt; &gt; + =C2=A0 =C2=A0}<br>&gt; &gt;=
 +<br>&gt;<br>&gt; I think you could just return false here... Nothing is e=
ver going to be<br>&gt; done if there&#39;s no ring :-)<br>&gt;<br>&gt; &gt=
; =C2=A0 =C2=A0 =C2=A0 rc =3D dataplane-&gt;rings.common.req_cons;<br>&gt; =
&gt; =C2=A0 =C2=A0 =C2=A0 rp =3D dataplane-&gt;rings.common.sring-&gt;req_p=
rod;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 xen_rmb(); /* Ensure we see queued r=
equests up to &#39;rp&#39;. */<br>&gt; &gt; @@ -666,14 +670,35 @@ void xen_=
block_dataplane_destroy(XenBlockDataPlane *dataplane &gt; =C2=A0 void xen_b=
lock_dataplane_stop(XenBlockDataPlane *dataplane)<br>&gt; &gt; =C2=A0 {<br>=
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 XenDevice *xendev;<br>&gt; &gt; + =C2=A0 =C2=
=A0XenBlockRequest *request, *next;<br>&gt; &gt; =C2=A0 <br>&gt; &gt; =C2=
=A0 =C2=A0 =C2=A0 if (!dataplane) {<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 }<br>&gt; &gt; =C2=A0 =
<br>&gt; &gt; + =C2=A0 =C2=A0/* We&#39;re about to drain the ring. We can c=
ancel the scheduling of any<br>&gt; &gt; + =C2=A0 =C2=A0 * bottom half now =
*/<br>&gt; &gt; + =C2=A0 =C2=A0qemu_bh_cancel(dataplane-&gt;bh);<br>&gt; &g=
t; +<br>&gt; &gt; + =C2=A0 =C2=A0/* Ensure we have drained the ring */<br>&=
gt; &gt; + =C2=A0 =C2=A0aio_context_acquire(dataplane-&gt;ctx);<br>&gt; &gt=
; + =C2=A0 =C2=A0do {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0xen_block_h=
andle_requests(dataplane);<br>&gt; &gt; + =C2=A0 =C2=A0} while (dataplane-&=
gt;more_work);<br>&gt; &gt; + =C2=A0 =C2=A0aio_context_release(dataplane-&g=
t;ctx);<br>&gt; &gt; +<br>&gt;<br>&gt; I don&#39;t think we want to be taki=
ng new requests, do we?<br>&gt;<br>&gt; &gt; + =C2=A0 =C2=A0/* Now ensure t=
hat all inflight requests are complete */<br>&gt; &gt; + =C2=A0 =C2=A0while=
 (!QLIST_EMPTY(&amp;dataplane-&gt;inflight)) {<br>&gt; &gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0QLIST_FOREACH_SAFE(request, &amp;dataplane-&gt;inflight, list=
, next) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blk_aio_f=
lush(request-&gt;dataplane-&gt;blk, xen_block_complete_aio,<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0request);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>&gt; &gt=
; + =C2=A0 =C2=A0}<br>&gt; &gt; +<br>&gt;<br>&gt; I think this could possib=
ly be simplified by doing the drain after the<br>&gt; call to blk_set_aio_c=
ontext(), as long as we set dataplane-&gt;ctx to<br>&gt; qemu_get_aio_conte=
xt(). Alos, as long as more_work is not set then it<br>&gt; should still be=
 safe to cancel the bh before the drain AFAICT.<br>&gt;<br>&gt; =C2=A0 =C2=
=A0Paul<br>&gt;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 xendev =3D dataplane-&gt;=
xendev;<br>&gt; &gt; =C2=A0 <br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 aio_context_=
acquire(dataplane-&gt;ctx);<br>&gt; &gt; +<br>&gt; &gt; =C2=A0 =C2=A0 =C2=
=A0 if (dataplane-&gt;event_channel) {<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* Only reason for failure is a NULL channel */<br>&gt; &gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xen_device_set_event_channel_context(xen=
dev, dataplane-&gt;event_channel,<br>&gt; &gt; @@ -684,12 +709,6 @@ void xe=
n_block_dataplane_stop(XenBlockDataPlane *dataplane)<br>&gt; &gt; =C2=A0 =
=C2=A0 =C2=A0 blk_set_aio_context(dataplane-&gt;blk, qemu_get_aio_context()=
, &amp;error_abort);<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 aio_context_release(=
dataplane-&gt;ctx);<br>&gt; &gt; =C2=A0 <br>&gt; &gt; - =C2=A0 =C2=A0/*<br>=
&gt; &gt; - =C2=A0 =C2=A0 * Now that the context has been moved onto the ma=
in thread, cancel<br>&gt; &gt; - =C2=A0 =C2=A0 * further processing.<br>&gt=
; &gt; - =C2=A0 =C2=A0 */<br>&gt; &gt; - =C2=A0 =C2=A0qemu_bh_cancel(datapl=
ane-&gt;bh);<br>&gt; &gt; -<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 if (dataplane=
-&gt;event_channel) {<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error=
 *local_err =3D NULL;<br>&gt; &gt; =C2=A0 <br>&gt;<br></div>

--000000000000567bf705fa13db30--

