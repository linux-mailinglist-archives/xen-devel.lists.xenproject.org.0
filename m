Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFC721AEE4
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2020 07:44:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtlpp-0002wO-6k; Fri, 10 Jul 2020 05:44:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t5yY=AV=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jtlpn-0002wJ-SV
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2020 05:44:31 +0000
X-Inumbo-ID: 6cb03c96-c270-11ea-bb8b-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6cb03c96-c270-11ea-bb8b-bc764e2007e4;
 Fri, 10 Jul 2020 05:44:30 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g75so4579836wme.5
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2020 22:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4edQ0YselGGDwyfZkAcxeIabieLMJek3/TpD0WH/gAs=;
 b=UjYgshhZvEWQNEWUObMADwMsQSzjL+gWFhsuTHMIBcP61wwzte+xmJRtWR8zWDGM1P
 yKfTP3P5NlujAe6T7iRtODNObxBsAYGGvgIABKxUJZfLbKqzYgmWl5bMIYF1Ql+FrG4S
 DdD/RlugPLcc3Kq2x8OSi5flUDSIj8P4CP4QBOKjgrF44UTz1XCg4IdIH/aOPkYWd7Ve
 k4neig2NOv48t7nWgBuw2bNWouTRZEPOMF8P4Npcs9eVtIsITh1Yyow3ZFORSjnmEj85
 e0XNmYVkwFG4UJXCrZgEN3/22C+QJPciILXLA++u2I3UPPpdPAL0j6KIlzjcf5bCIfx/
 c3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4edQ0YselGGDwyfZkAcxeIabieLMJek3/TpD0WH/gAs=;
 b=AQkapJjTkgg8UU7ZletJuZD2U4KCEYt9/OtEipRTl87/5EP++8FzUaE6klYOqhZMDW
 JnzcQw3/g1F/oDK1Fxh6phoEBJk4UglX+aXov3EP9kMzqtMWgKWsnzB+LFreOkXPNlEt
 uT6JnxHo4dRH5vVtklNafuyXR7vd7Go9p3aYOKNAO/yx0wzZ2wsW28LAlGLvLQNmnMKn
 IL9gqju/YAQIvEo5319n/7jaJ6BCjNgGnRgtDza9Wop1/zgQ997kvRqZP9XPVGRAsRgp
 bz/YEOYnfXybfKPvdo6xhK7D51/FTk0Zwi+TwigSJ1WcLs74p8XB5jJ6rkyWgp/PINPm
 MaPQ==
X-Gm-Message-State: AOAM5311ka/6Vb2MMuCdV7+xHXuUO7cXLRP71UtDl/tKLD6tYlJ9Nyu+
 IWzqeu91zYolkAcviHTgsOEyYtylx3F9K3OdbnQ=
X-Google-Smtp-Source: ABdhPJxysuxRtR4lmGruhCGGljqm79dbNa6fBn3RLiqmrOitAMZFSVIoeNqahz4At2LsIVYfu/QWmGcO3Dq95awlOKM=
X-Received: by 2002:a05:600c:2058:: with SMTP id
 p24mr3399981wmg.74.1594359870011; 
 Thu, 09 Jul 2020 22:44:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200627095533.14145-1-julien@xen.org>
 <20200627095533.14145-3-julien@xen.org>
 <b7f41be0-f1d2-2c3b-c79f-5d9763dfb5df@xen.org>
 <2e0a451e-58be-eff1-0030-be489e5098f3@xen.org>
 <alpine.DEB.2.21.2007091443290.4124@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2007091443290.4124@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 10 Jul 2020 06:44:16 +0100
Message-ID: <CAJ=z9a0jTjnTd5OGJfXQcXBFRMY3T3dNFF=K0qcDzP8_Po-ZXQ@mail.gmail.com>
Subject: Re: [PATCH v4 for-4.14 2/2] pvcalls: Document correctly and
 explicitely the padding for all arches
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000b23c4d05aa0fd5ea"
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--000000000000b23c4d05aa0fd5ea
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Jul 2020, 22:43 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Thu, 9 Jul 2020, Julien Grall wrote:
> > Hi,
> >
> > Gentle ping.
> >
> > Is the new commit message fine?
> >
> > Cheers,
> >
> > On 04/07/2020 16:29, Julien Grall wrote:
> > > Hi,
> > >
> > > On 27/06/2020 10:55, Julien Grall wrote:
> > > > From: Julien Grall <jgrall@amazon.com>
> > > >
> > > > The specification of pvcalls suggests there is padding for 32-bit x86
> > > > at the end of most the structure. However, they are not described in
> > > > in the public header.
> > > >
> > > > Because of that all the structures would be 32-bit aligned and not
> > > > 64-bit aligned for 32-bit x86.
> > > >
> > > > For all the other architectures supported (Arm and 64-bit x86), the
> > > > structure are aligned to 64-bit because they contain uint64_t field.
> > > > Therefore all the structures contain implicit padding.
> > > >
> > > > Given the specification is authoriitative, the padding will the same
> for
> > > > the all architectures. The potential breakage of compatibility is
> ought
> > > > to be fine as pvcalls is still a tech preview.
> > > >
> > > > As an aside, the padding sadly cannot be mandated to be 0 as they are
> > > > already present. So it is not going to be possible to use the padding
> > > > for extending a command in the future.
> > > >
> > > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > >
> > > It looks like most of the comments are on the commit message. So
> rather than
> > > sending the series again, below a new version of the commit message:
> > >
> > > "
> > > The specification of pvcalls suggests there is padding for 32-bit x86
> > > at the end of most the structure. However, they are not described in
> > > in the public header.
> > >
> > > Because of that all the structures would have a different size between
> > > 32-bit x86 and 64-bit x86.
> > >
> > > For all the other architectures supported (Arm and 64-bit x86), the
> > > structure have the sames sizes because they contain implicit padding
> thanks
> > > to the 64-bit alinment of the field uint64_t field.
> > >
> > > Given the specification is authoritative, the padding will now be the
> same
> > > for all architectures. The potential breakage of compatibility is
> ought to
> > > be fine as pvcalls is still a tech preview.
> > > "
>
> Looks good to me
>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>


Thanks! I don't have access to my work laptop today. Can any of the
committers merge it so it doesn't miss 4.14?

Cheers,

>

--000000000000b23c4d05aa0fd5ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, 9 Jul 2020, 22:43 Stefano Stabellini, &lt;<a h=
ref=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">On Thu, 9 Jul 2020, Julien Grall w=
rote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; Gentle ping.<br>
&gt; <br>
&gt; Is the new commit message fine?<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; On 04/07/2020 16:29, Julien Grall wrote:<br>
&gt; &gt; Hi,<br>
&gt; &gt; <br>
&gt; &gt; On 27/06/2020 10:55, Julien Grall wrote:<br>
&gt; &gt; &gt; From: Julien Grall &lt;<a href=3D"mailto:jgrall@amazon.com" =
target=3D"_blank" rel=3D"noreferrer">jgrall@amazon.com</a>&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; The specification of pvcalls suggests there is padding for 3=
2-bit x86<br>
&gt; &gt; &gt; at the end of most the structure. However, they are not desc=
ribed in<br>
&gt; &gt; &gt; in the public header.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Because of that all the structures would be 32-bit aligned a=
nd not<br>
&gt; &gt; &gt; 64-bit aligned for 32-bit x86.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; For all the other architectures supported (Arm and 64-bit x8=
6), the<br>
&gt; &gt; &gt; structure are aligned to 64-bit because they contain uint64_=
t field.<br>
&gt; &gt; &gt; Therefore all the structures contain implicit padding.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Given the specification is authoriitative, the padding will =
the same for<br>
&gt; &gt; &gt; the all architectures. The potential breakage of compatibili=
ty is ought<br>
&gt; &gt; &gt; to be fine as pvcalls is still a tech preview.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; As an aside, the padding sadly cannot be mandated to be 0 as=
 they are<br>
&gt; &gt; &gt; already present. So it is not going to be possible to use th=
e padding<br>
&gt; &gt; &gt; for extending a command in the future.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Julien Grall &lt;<a href=3D"mailto:jgrall@ama=
zon.com" target=3D"_blank" rel=3D"noreferrer">jgrall@amazon.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; It looks like most of the comments are on the commit message. So =
rather than<br>
&gt; &gt; sending the series again, below a new version of the commit messa=
ge:<br>
&gt; &gt; <br>
&gt; &gt; &quot;<br>
&gt; &gt; The specification of pvcalls suggests there is padding for 32-bit=
 x86<br>
&gt; &gt; at the end of most the structure. However, they are not described=
 in<br>
&gt; &gt; in the public header.<br>
&gt; &gt; <br>
&gt; &gt; Because of that all the structures would have a different size be=
tween<br>
&gt; &gt; 32-bit x86 and 64-bit x86.<br>
&gt; &gt; <br>
&gt; &gt; For all the other architectures supported (Arm and 64-bit x86), t=
he<br>
&gt; &gt; structure have the sames sizes because they contain implicit padd=
ing thanks<br>
&gt; &gt; to the 64-bit alinment of the field uint64_t field.<br>
&gt; &gt; <br>
&gt; &gt; Given the specification is authoritative, the padding will now be=
 the same<br>
&gt; &gt; for all architectures. The potential breakage of compatibility is=
 ought to<br>
&gt; &gt; be fine as pvcalls is still a tech preview.<br>
&gt; &gt; &quot;<br>
<br>
Looks good to me<br>
<br>
Acked-by: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" =
target=3D"_blank" rel=3D"noreferrer">sstabellini@kernel.org</a>&gt;<br></bl=
ockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Thanks! I don&#39;t have access to my work laptop today=
. Can any of the committers merge it so it doesn&#39;t miss 4.14?</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000b23c4d05aa0fd5ea--

