Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4987F9FF0
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 13:46:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642061.1001156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7b0T-0006A7-HX; Mon, 27 Nov 2023 12:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642061.1001156; Mon, 27 Nov 2023 12:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7b0T-00067Z-Dp; Mon, 27 Nov 2023 12:46:33 +0000
Received: by outflank-mailman (input) for mailman id 642061;
 Mon, 27 Nov 2023 12:46:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fJnr=HI=gmail.com=marietto2008@srs-se1.protection.inumbo.net>)
 id 1r7b0R-00065z-8D
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 12:46:31 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcaa5a25-8d22-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 13:46:30 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a02d12a2444so608924066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 04:46:30 -0800 (PST)
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
X-Inumbo-ID: fcaa5a25-8d22-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701089190; x=1701693990; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8Q4o9keE/0fbZA7BBj4pWJ+QZiZ7NWyv6VAZH8qWfpE=;
        b=jyRzLUNG4OaB1ymW7UjyQaSbzZ6QK/jyw+cdObPns6FWSg0wyXdv1uvC5ZGPNcVJrz
         I0PpBaMrmCHfwloImlHtz9zSSdMohnS55pYza4Po24wDRA75sdPzdfW+HqbF46P7nnar
         rLicit2VWz+Cfq1e6PhtVEqUamWsFXAJ6dBDYCMjt8a9OufsIH70Wa9MVROzk/54sW97
         Oa8Th2uhELCcHwyozZfnWMvMCrgn/S6pHJiG0XhQj0eL3WO5v/2CUfw5xIsfavm4yEj3
         wdVR25yjUayz+0KMD0S/kq8emCBs33xY6RW3Czueq3GcHTC75Bz/yVXHogxRgyHOiHVW
         e+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701089190; x=1701693990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Q4o9keE/0fbZA7BBj4pWJ+QZiZ7NWyv6VAZH8qWfpE=;
        b=KZthMJZJYNih8mx3lOMngdo2ZlykPaZ+aD+rLcHKvvU0/dc50Dq/KtsV5X7i1y3Z7l
         +RRgq2dJxL0REoSa4y2qa649X6wX2FUx+qqeME9RYx6aci/KNGLHSWA1EOu4wzn+FIHb
         RlMv23Jhk6V3ryf5Mhj1t2Hv4iAvAH3OEj5qx3iFCMjZEGKsPr464auGc+LDQL0/Iua7
         YUMODuoQrJHeXfsWIPkYzDBfCOLnjxike58gQ3NZwcv7Hs88nXNpoLojatWm71JVQmsO
         RXhRmI0CMUldisE0yESvX+inpmwqEnAhclonft3cAR06XCGi5QQc/4kte4EeczYlWQsA
         h3Ng==
X-Gm-Message-State: AOJu0YxC0NDVebJ56UVeFKguGqg8wM17I8FxMn16bL3AmVTvVQzn5BMd
	tOonFzo4SShsN8D9eGA8VSiuz5jWC7SyVsbByZg=
X-Google-Smtp-Source: AGHT+IHHlXuUmLXfKjruZT0DtP54n0+/9ZBqf0/ibsIR7gUDOmxJrQj5ywpFh5SuEMFcIzw/jwdPTB5dfnRcgg+b0Hw=
X-Received: by 2002:a17:906:9c87:b0:a0d:9ba9:6255 with SMTP id
 fj7-20020a1709069c8700b00a0d9ba96255mr3881142ejc.75.1701089189405; Mon, 27
 Nov 2023 04:46:29 -0800 (PST)
MIME-Version: 1.0
References: <CA+1FSiggg=XZmif6c3pY0+jz7i9caU-OTwFy80gwO7MVpXiwcA@mail.gmail.com>
 <CA+1FSigM1PZc4WfZNUJSMsZbNPPTyThRJ7MMQwQ9TWn6VnSUTg@mail.gmail.com>
 <C0A0E9FA-5AAB-4324-BBBD-D07412CD7F32@arm.com> <ZWR1v5Y3EpRK817B@macbook>
In-Reply-To: <ZWR1v5Y3EpRK817B@macbook>
From: Mario Marietto <marietto2008@gmail.com>
Date: Mon, 27 Nov 2023 13:45:53 +0100
Message-ID: <CA+1FSij2Q9f9Vj0A06HUYeUxTddrEyF=Q8X5fbs96CRr83_BPg@mail.gmail.com>
Subject: Re: We are not able to virtualize FreeBSD using xen 4.17 on Arm 32 bit
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Chuck Zmudzinski <brchuckz@netscape.net>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>, Anthony PERARD <anthony.perard@citrix.com>, 
	Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Elliott Mitchell <ehem+freebsd@m5p.com>
Content-Type: multipart/alternative; boundary="000000000000dda859060b21b09f"

--000000000000dda859060b21b09f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

@Chuck Zmudzinski <brchuckz@netscape.net> : Stay tuned. They want to help
us. The xen developers are great. Very good support for us. I'm sure that
you can give a good contribution to understand what's our problem and how
to implement a fix with the help of all those good guys.

On Mon, Nov 27, 2023 at 11:56=E2=80=AFAM Roger Pau Monn=C3=A9 <roger.pau@ci=
trix.com>
wrote:

> On Mon, Nov 27, 2023 at 10:28:13AM +0000, Henry Wang wrote:
> > +(xen-devel and Arm maintainers, including Julien)
> >
> > > On Nov 27, 2023, at 18:03, Mario Marietto <marietto2008@gmail.com>
> > > wrote:
> > >
> > > Hello.  We have just virtualized Debian 12 on our arm (32 bit)
> > > Chromebook model xe303c12 . As host / dom0 we have chosen Devuan
> > > 5,and for guest / domU,Debian 12. It works great. But our goal is
> > > different. We want to virtualize FreeBSD as domU. Can we have a
> > > working Xen PV network driver for a FreeBSD arm guest ?. I found
> > > that Julien Grall has ported the Xen drivers to FreeBSD on arm. I
> > > would like to know if Julien's work was accepted upstream by
> > > FreeBSD, in which case FreeBSD as a Xen guest on arm should work
> > > if we enable the Xen PV drivers in the FreeBSD on arm kernel. If
> > > Julien's work was not accepted upstream by FreeBSD, we will have
> > > to find his patches and apply them ourselves to the FreeBSD on arm
> > > kernel.
>
> I've added Elliot on Cc as he is working on upstreaming the patches to
> FreeBSD.  He will be able to provide a better update than myself.
>
> Regards, Roger.
>


--=20
Mario.

--000000000000dda859060b21b09f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a class=3D"gmail_plusreply" id=3D"plusReplyChip-0" href=
=3D"mailto:brchuckz@netscape.net" tabindex=3D"-1">@Chuck Zmudzinski</a> : S=
tay tuned. They want to help us. The xen developers are great. Very good su=
pport for us. I&#39;m sure that you can give a good contribution to underst=
and what&#39;s our problem and how to implement a fix with the help of all =
those good guys. <br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Nov 27, 2023 at 11:56=E2=80=AFAM Roger Pau Mon=
n=C3=A9 &lt;<a href=3D"mailto:roger.pau@citrix.com">roger.pau@citrix.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Mon, Nov 27, 2023 at 10:28:13AM +0000, Henry Wang wrote:<br>
&gt; +(xen-devel and Arm maintainers, including Julien)<br>
&gt; <br>
&gt; &gt; On Nov 27, 2023, at 18:03, Mario Marietto &lt;<a href=3D"mailto:m=
arietto2008@gmail.com" target=3D"_blank">marietto2008@gmail.com</a>&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; Hello.=C2=A0 We have just virtualized Debian 12 on our arm (32 bi=
t)<br>
&gt; &gt; Chromebook model xe303c12 . As host / dom0 we have chosen Devuan<=
br>
&gt; &gt; 5,and for guest / domU,Debian 12. It works great. But our goal is=
<br>
&gt; &gt; different. We want to virtualize FreeBSD as domU. Can we have a<b=
r>
&gt; &gt; working Xen PV network driver for a FreeBSD arm guest ?. I found<=
br>
&gt; &gt; that Julien Grall has ported the Xen drivers to FreeBSD on arm. I=
<br>
&gt; &gt; would like to know if Julien&#39;s work was accepted upstream by<=
br>
&gt; &gt; FreeBSD, in which case FreeBSD as a Xen guest on arm should work<=
br>
&gt; &gt; if we enable the Xen PV drivers in the FreeBSD on arm kernel. If<=
br>
&gt; &gt; Julien&#39;s work was not accepted upstream by FreeBSD, we will h=
ave<br>
&gt; &gt; to find his patches and apply them ourselves to the FreeBSD on ar=
m<br>
&gt; &gt; kernel.<br>
<br>
I&#39;ve added Elliot on Cc as he is working on upstreaming the patches to<=
br>
FreeBSD.=C2=A0 He will be able to provide a better update than myself.<br>
<br>
Regards, Roger.<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--000000000000dda859060b21b09f--

