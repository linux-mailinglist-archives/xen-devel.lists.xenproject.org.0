Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD61222826
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 18:17:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw6Zl-0005oA-0U; Thu, 16 Jul 2020 16:17:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7sX=A3=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jw6Zj-0005o5-GT
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 16:17:35 +0000
X-Inumbo-ID: db52c15a-c77f-11ea-b7bb-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db52c15a-c77f-11ea-b7bb-bc764e2007e4;
 Thu, 16 Jul 2020 16:17:34 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k6so7692336wrn.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2020 09:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xodYPEeS7dp1LUqF530uwFZaAtzHV5zb4yrnlJn6COQ=;
 b=P4VwAXAYTNHcTFoeQVwCBU1a3pmTveDh0+nzvoNHmPWPk8GCsw6TEfcf7Vxa6f0gtr
 WYd27HyPdNGQsxk3Qe+Fclcpe9156u/dyTvX4cP6GmMfMe7uVGw8IaJtUSblv0IyTttu
 /YfgP5U48h/N/24QtsAx+e0w7Ss6ViWWKBaxz2ZSgIw9CLg3ZgcINXDvSNkErlgo/fVf
 OViB41oizw5h9HZ+B1CL4YmnPp4m6X53VvtN7cc/s5ZdBBwCs60R4Msb+XFicG1YDAKi
 Ipy2Lk8mrF0wBDcVhlY87UvEKytW1mHx/qF219/lKsIPU2g0a9LOU0JvgflytvKAG79J
 deDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xodYPEeS7dp1LUqF530uwFZaAtzHV5zb4yrnlJn6COQ=;
 b=gaK1zcvPR1tsiYSzE56fXGbu8nxzfAZUDzDuAbGy6qmrXNnObVunQzKR2GjRNlTuIg
 tocXiPPVOSzNUEHCWyO0JCM3/LrhBG/fAzVU+yykP+s4t6QHnm2C+EbhhlSqCrbpVyfq
 qrocubY4xpZUvFxtZFallZ6IZdoiyPpnqLJEnCt3GtibXR4G6FlVVP9WEDvb/j+/EKHe
 pVf9HaP4f9TTAL2jX1YCl3BfLAxpIi1Cq2RwZX4wUvlan3+0AClMPrdM4le0rGsPe+Mp
 P948Vqkr2CB7pGRCJrcmZVxMY9DPuye25cxhvkvlZKJfrRILoL2ZZEjamKCqfnkfYpMN
 ErcA==
X-Gm-Message-State: AOAM532anAsnTlIKJ1vw2x/i8XQwT7ou+1GXOgG43CI31MkAonxuxpU2
 vkyqPyvzVYc6NI4ewshGX7Y6csGcOsbhUJiOZ9g=
X-Google-Smtp-Source: ABdhPJztXc0xYdj3Oqi1QD7Rcor//iwik1QLBcbFBF57O9TKPTyGJBqZsKXAzBug0mTgQLcUDZat1vmrpJGdsETbo+4=
X-Received: by 2002:adf:e88b:: with SMTP id d11mr5555855wrm.378.1594916253884; 
 Thu, 16 Jul 2020 09:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <fef45e49-bcb4-dc11-8f7f-b2f5e4bf1a73@suse.com>
 <2a0341c7-3836-a8c0-9516-b6a08e2720ec@suse.com>
 <20200716114128.GO7191@Air-de-Roger>
 <03a4d446-c26b-f171-57fd-a1eb13dad6c0@suse.com>
 <20200716144219.GQ7191@Air-de-Roger>
 <d64ee03f-4663-39ce-fd72-5702029e0182@suse.com>
In-Reply-To: <d64ee03f-4663-39ce-fd72-5702029e0182@suse.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 16 Jul 2020 18:17:21 +0200
Message-ID: <CAJ=z9a2gCm7LNOpJUO4nbwUExmtd8KH2TBvt4VXCaqiAeXuCcg@mail.gmail.com>
Subject: Re: [PATCH 1/2] common: map_vcpu_info() cosmetics
To: Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/alternative; boundary="000000000000c264d605aa9160f7"
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--000000000000c264d605aa9160f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Jul 2020, 17:01 Jan Beulich, <jbeulich@suse.com> wrote:

> On 16.07.2020 16:42, Roger Pau Monn=C3=A9 wrote:
> > On Thu, Jul 16, 2020 at 01:48:51PM +0200, Jan Beulich wrote:
> >> On 16.07.2020 13:41, Roger Pau Monn=C3=A9 wrote:
> >>> On Wed, Jul 15, 2020 at 12:15:10PM +0200, Jan Beulich wrote:
> >>>> Use ENXIO instead of EINVAL to cover the two cases of the address no=
t
> >>>> satisfying the requirements. This will make an issue here better sta=
nd
> >>>> out at the call site.
> >>>
> >>> Not sure whether I would use EFAULT instead of ENXIO, as the
> >>> description of it is 'bad address' which seems more inline with the
> >>> error that we are trying to report.
> >>
> >> The address isn't bad in the sense of causing a fault, it's just
> >> that we elect to not allow it. Hence I don't think EFAULT is
> >> suitable. I'm open to replacement suggestions for ENXIO, though.
> >
> > Well, using an address that's not properly aligned to the requirements
> > of an interface would cause a fault? (in this case it's a software
> > interface, but the concept applies equally).
>
> Not necessarily, see x86'es behavior. Also even on strict arches

it is typically possible to cover for the misalignment by using
> suitable instructions; it's still an implementation choice to not
> do so.


I am not sure about your argument here... Yes it might be possible, but at
what cost?


> > Anyway, not something worth arguing about I think, so unless someone
> > else disagrees I'm fine with using ENXIO.
>
> Good, thanks.
>

-EFAULT can be described as "Bad address". I think it makes more sense than
-ENXIO here even if it may not strictly result to a fault on some arch.


> Jan
>

--000000000000c264d605aa9160f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, 16 Jul 2020, 17:01 Jan Beulich, &lt;<a href=3D=
"mailto:jbeulich@suse.com" target=3D"_blank" rel=3D"noreferrer">jbeulich@su=
se.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 16.07.2020=
 16:42, Roger Pau Monn=C3=A9 wrote:<br>
&gt; On Thu, Jul 16, 2020 at 01:48:51PM +0200, Jan Beulich wrote:<br>
&gt;&gt; On 16.07.2020 13:41, Roger Pau Monn=C3=A9 wrote:<br>
&gt;&gt;&gt; On Wed, Jul 15, 2020 at 12:15:10PM +0200, Jan Beulich wrote:<b=
r>
&gt;&gt;&gt;&gt; Use ENXIO instead of EINVAL to cover the two cases of the =
address not<br>
&gt;&gt;&gt;&gt; satisfying the requirements. This will make an issue here =
better stand<br>
&gt;&gt;&gt;&gt; out at the call site.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Not sure whether I would use EFAULT instead of ENXIO, as the<b=
r>
&gt;&gt;&gt; description of it is &#39;bad address&#39; which seems more in=
line with the<br>
&gt;&gt;&gt; error that we are trying to report.<br>
&gt;&gt;<br>
&gt;&gt; The address isn&#39;t bad in the sense of causing a fault, it&#39;=
s just<br>
&gt;&gt; that we elect to not allow it. Hence I don&#39;t think EFAULT is<b=
r>
&gt;&gt; suitable. I&#39;m open to replacement suggestions for ENXIO, thoug=
h.<br>
&gt; <br>
&gt; Well, using an address that&#39;s not properly aligned to the requirem=
ents<br>
&gt; of an interface would cause a fault? (in this case it&#39;s a software=
<br>
&gt; interface, but the concept applies equally).<br>
<br>
Not necessarily, see x86&#39;es behavior. Also even on strict arches</block=
quote></div></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
it is typically possible to cover for the misalignment by using<br>
suitable instructions; it&#39;s still an implementation choice to not<br>
do so.</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto=
">I am not sure about your argument here... Yes it might be possible, but a=
t what cost?</div><div dir=3D"auto"><br></div><div dir=3D"auto"></div><div =
dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; Anyway, not something worth arguing about I think, so unless someone<b=
r>
&gt; else disagrees I&#39;m fine with using ENXIO.<br>
<br>
Good, thanks.<br></blockquote></div></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">-EFAULT can be described as &quot;Bad address&quot;. I think i=
t makes more sense than -ENXIO here even if it may not strictly result to a=
 fault on some arch.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Jan<br>
</blockquote></div></div></div>

--000000000000c264d605aa9160f7--

