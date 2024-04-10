Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CCC89F074
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 13:14:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703021.1098811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruVuS-0004U6-Aa; Wed, 10 Apr 2024 11:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703021.1098811; Wed, 10 Apr 2024 11:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruVuS-0004RF-7W; Wed, 10 Apr 2024 11:14:32 +0000
Received: by outflank-mailman (input) for mailman id 703021;
 Wed, 10 Apr 2024 11:14:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5G6/=LP=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1ruVuQ-0004R9-SM
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 11:14:30 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f59133c-f72b-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 13:14:28 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56bdf81706aso8773432a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 04:14:28 -0700 (PDT)
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
X-Inumbo-ID: 7f59133c-f72b-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712747668; x=1713352468; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=94RVQwcYAG4eFmMmGTmocKdyi2FDWMMAMoG0R8BdJRo=;
        b=OsbrKEW2ST3XDmEA3Kt8U1Xp87ZB4Tfuc5aoUfaL112xNxYCEjjbbvl6PlLNdUc2Ig
         gKQy8GTFbPkngD+U3Ey9Fp7KdkD0iNtXN8rzqrVXr04zOX9DB0beSuoVLL7/gC5Uko9+
         hNz4brNfcGmc9iMXpiBybtkD5yMJ6XUqdVNcr9DErh3kD8WtUpDAp0z2xkp6ueh8Mp1e
         AJ5IG4D+v+8xgABByepe9FkqJmzd8Xo8TV6+C8QzAznXhVieOvvao/zaq9dnNsPwvMg5
         FQ6TolOzC935tJcCfD0nThtDVpjtWkOLX3tMXzeQ7mu0gMMcea0S7UbiW29jO5KnixH8
         KV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712747668; x=1713352468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94RVQwcYAG4eFmMmGTmocKdyi2FDWMMAMoG0R8BdJRo=;
        b=W5O6wkCARAN8c0rbWJHk3Esr6ydWPbjIVxfZNbzotF31LHc9sT4k615DGn4Ja3dfIT
         vKuVixliYMSOMXD2GzF1RaQTY6z7+iupU3endkkpcjKOzDflIE6UVeDM+00Q7XYEII2J
         jEEy41QlSzlLzsv9wbr93fHfHgL8HfKBewe0+8+VnmjYpnmh5RiJY3MdFNRLx13ppFdS
         wMT0Y/l8qRgiPQNrifcJM7qt0+h9h7h5Cotl4CbkXp4yUmZj6C9oY8Yf5gs2k2lwAZ5U
         USjm0RXkyAgle3Iqczypj3veJB6pNmA8+eYOUei7U6WPfJUSwJ3GeV/mgFwOOBliIHGA
         tf3A==
X-Forwarded-Encrypted: i=1; AJvYcCWram6vvTWQFC9YgxMD9QXNU7/pqVn46NhJzW5oBf+VzHJzg0XCPy9Tnaj69N0YO72t7oSa60NIpCV249/3dmR8TdqB+6t771InwiNVZQw=
X-Gm-Message-State: AOJu0YwFh0EjiNfMpSWtWlghqfgneaM/HWk7CjMycWJT4oYG7zKIby+2
	AdaQ2CO3Mu3xYC0v8LHA+ZgilOSzTR2PiXLi3UutTeCww59U54SZvS92kwEiG+iWR+4rEudUe6K
	xOtvGGlgbB44yjs8d+2w5XcgSd7Q=
X-Google-Smtp-Source: AGHT+IHZUo6Pt6cHPn2HE+zPZFOJvm6Ppz12wUMJIHfV1gr9Dy/wFeCvOTGykeUz1W16/FiVEwX1BlwUryFYMPLE4VE=
X-Received: by 2002:a50:d5d9:0:b0:568:8e22:4eff with SMTP id
 g25-20020a50d5d9000000b005688e224effmr1525770edj.37.1712747668168; Wed, 10
 Apr 2024 04:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240227223501.28475-1-vikram.garhwal@amd.com>
 <20240227223501.28475-5-vikram.garhwal@amd.com> <87o7bx5187.fsf@draig.linaro.org>
In-Reply-To: <87o7bx5187.fsf@draig.linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Wed, 10 Apr 2024 13:14:16 +0200
Message-ID: <CAJy5ezrG0m6_5hKD1axpOSYLp-jk14=E+XPo9=oThyY-TN-7TQ@mail.gmail.com>
Subject: Re: [QEMU][PATCH v3 4/7] xen: let xen_ram_addr_from_mapcache() return
 -1 in case of not found entry
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org, sstabellini@kernel.org, 
	jgross@suse.com, Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000059e8be0615bc2419"

--00000000000059e8be0615bc2419
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2024 at 6:08=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linaro=
.org> wrote:

> Vikram Garhwal <vikram.garhwal@amd.com> writes:
>
> > From: Juergen Gross <jgross@suse.com>
> >
> > Today xen_ram_addr_from_mapcache() will either abort() or return 0 in
> > case it can't find a matching entry for a pointer value. Both cases
> > are bad, so change that to return an invalid address instead.
> >
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > ---
> >  hw/xen/xen-mapcache.c | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> >
> > diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> > index dfc412d138..179b7e95b2 100644
> > --- a/hw/xen/xen-mapcache.c
> > +++ b/hw/xen/xen-mapcache.c
> > @@ -396,13 +396,8 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
> >          }
> >      }
> >      if (!found) {
> > -        trace_xen_ram_addr_from_mapcache_not_found(ptr);
> > -        QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
> > -
> trace_xen_ram_addr_from_mapcache_found(reventry->paddr_index,
> > -                                                   reventry->vaddr_req=
);
> > -        }
>
> If these tracepoints aren't useful they need removing from trace-events.
> However I suspect it would be better to keep them in as they are fairly
> cheap.
>
> Otherwise:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

--00000000000059e8be0615bc2419
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Mar 1, 2024 at 6:08=E2=80=AFPM Al=
ex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@li=
naro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Vikram Garhwal &lt;<a href=3D"mailto:vik=
ram.garhwal@amd.com" target=3D"_blank">vikram.garhwal@amd.com</a>&gt; write=
s:<br>
<br>
&gt; From: Juergen Gross &lt;<a href=3D"mailto:jgross@suse.com" target=3D"_=
blank">jgross@suse.com</a>&gt;<br>
&gt;<br>
&gt; Today xen_ram_addr_from_mapcache() will either abort() or return 0 in<=
br>
&gt; case it can&#39;t find a matching entry for a pointer value. Both case=
s<br>
&gt; are bad, so change that to return an invalid address instead.<br>
&gt;<br>
&gt; Signed-off-by: Juergen Gross &lt;<a href=3D"mailto:jgross@suse.com" ta=
rget=3D"_blank">jgross@suse.com</a>&gt;<br>
&gt; Reviewed-by: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kern=
el.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/xen/xen-mapcache.c | 11 +++--------<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 8 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c<br>
&gt; index dfc412d138..179b7e95b2 100644<br>
&gt; --- a/hw/xen/xen-mapcache.c<br>
&gt; +++ b/hw/xen/xen-mapcache.c<br>
&gt; @@ -396,13 +396,8 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!found) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_xen_ram_addr_from_mapcache_not_foun=
d(ptr);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 QTAILQ_FOREACH(reventry, &amp;mapcache-&g=
t;locked_entries, next) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_xen_ram_addr_from_map=
cache_found(reventry-&gt;paddr_index,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reventry-&gt;vaddr_req);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
If these tracepoints aren&#39;t useful they need removing from trace-events=
.<br>
However I suspect it would be better to keep them in as they are fairly<br>
cheap.<br>
<br>
Otherwise:<br>
<br>
Reviewed-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org"=
 target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
<br></blockquote><div><br></div><div>Reviewed-by: Edgar E. Iglesias &lt;<a =
href=3D"mailto:edgar.iglesias@amd.com">edgar.iglesias@amd.com</a>&gt;<br></=
div><div><br></div></div></div>

--00000000000059e8be0615bc2419--

