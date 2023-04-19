Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5DB6E74DC
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 10:20:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523239.813106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp324-0007gC-Dd; Wed, 19 Apr 2023 08:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523239.813106; Wed, 19 Apr 2023 08:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp324-0007dq-Ag; Wed, 19 Apr 2023 08:19:16 +0000
Received: by outflank-mailman (input) for mailman id 523239;
 Wed, 19 Apr 2023 08:19:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=APhf=AK=gmail.com=oleshiiwood@srs-se1.protection.inumbo.net>)
 id 1pp323-0007dk-7l
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 08:19:15 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc904dc3-de8a-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 10:19:11 +0200 (CEST)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1a67d2601b3so22844245ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Apr 2023 01:19:11 -0700 (PDT)
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
X-Inumbo-ID: dc904dc3-de8a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681892350; x=1684484350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=898LiG4cD0xRXnDD3dm1nSi3ewVhnQ1xRqaQGdUc+K4=;
        b=WAMBzSo1vnOqxoK5sJJCXkXWPh7lZ80O9FV7SWu81OInFXqWL9cS+dtgXwHjSgEmAx
         ehNubphA8Ao0BZE5hZmBdJ0i+jaqdVSlsisoMtmrbvEd5HPPG9jFZiJ8As561g1mYxlE
         KVLYgWKGT0pRYuWJKECCVboJKdmlmk4YSGxgIUWHP7Fe0EK9cmW3eTA32iaG1sUlv94s
         Zguz0GF7AsYK0TeT7n4x5lbnbq0qEQPu/q/nDtddrUKBQFgpva62KWxkNe4rxDAAGuCI
         3rcrFF4gB+gR34tqij53LK0swQBY6wNQecGOYMN/l3ShDi81amfVQaT01OsbQHzuyNWs
         cZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681892350; x=1684484350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=898LiG4cD0xRXnDD3dm1nSi3ewVhnQ1xRqaQGdUc+K4=;
        b=bsOJ0WnzZb2ZpczDQdKo2cvL/euXqmw3/ZGashkjtyzC3KypLJNSOcpoHjyP9o4Vib
         bRuelpsXJSSWriBpkSjlyF++GUPxOdEIWdYbnMn5cqjB5k2Av7XkgTjrqMPpFdjp3r/g
         rrcpSo8y9wtQuU35uCyoGU4WAfjoafx9RrLWDRn49pQUJXAnCct+66KKRKvfnfYcsVw1
         kfrl3e/ehb1BtsQHXTkyg8kWw3vMoTRBWDgoZ10FwuEI0IO85WcJyT4/nAjZ/g4L7Mhp
         n/6ik8kvdZhoE6xveJQxOkJOBTJFZ+Rf2bJ4IVtl7OgCU+LPXjeJwRW+gvi3cZLPkMwX
         i6PQ==
X-Gm-Message-State: AAQBX9cYaGeg2Fj1Vesx8bYnDZjquB1UTShCQiDUD+u8+S4GR3hGAor1
	a+2kr/WbSYfNO8wyJtUKqgJXE7aSRbtGMNu+Fcc=
X-Google-Smtp-Source: AKy350aUAkho/f+/Tdphf/4xcf9DpnYKgk1KXiOob4kNzkZY903AjcexgBB8VST/U8a/GgqUcN7AuUCO3GASAcqxKJg=
X-Received: by 2002:a17:902:f550:b0:1a5:22a:165c with SMTP id
 h16-20020a170902f55000b001a5022a165cmr5567538plf.0.1681892350007; Wed, 19 Apr
 2023 01:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <CA+SAi2uwrKFYN1tkYJ1_LVC-f+b-xb46RWTUv6wDOUO41yx8zg@mail.gmail.com>
 <bad09a6f-d41e-ab8e-2291-7fde3b646710@xen.org> <CA+SAi2uPZ=Dq1GxF9Kj1zCO=nbb55ruVG31kH-TgdpR6bLznvA@mail.gmail.com>
 <CA+SAi2s4WLiMEVa3u8rJRNZDpCpLTvnDygpObSUKxau-Q8dfyA@mail.gmail.com>
 <64326e46-096e-0f86-2aa9-31a72d3cd004@xen.org> <CA+SAi2u2=7h=Lo=bTC8YzmzidOErYaQGi=hpoG3w7tdM4LUzFw@mail.gmail.com>
 <alpine.DEB.2.22.394.2304181044080.15580@ubuntu-linux-20-04-desktop>
 <CA+SAi2srSq5Vwq8KL4TGc-GC3OjsFf=d-yKLVPw=C0KfBW67eA@mail.gmail.com> <58cae772-dd3b-31f4-9849-9c2597f6eae6@amd.com>
In-Reply-To: <58cae772-dd3b-31f4-9849-9c2597f6eae6@amd.com>
From: Oleg Nikitenko <oleshiiwood@gmail.com>
Date: Wed, 19 Apr 2023 11:25:14 +0300
Message-ID: <CA+SAi2vU0i9trrdgCusB0WYJmYLqjXRk9qSGALjMbKYvmPGcvw@mail.gmail.com>
Subject: Re: xen cache colors in ARM
To: Michal Orzel <michal.orzel@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Carlo Nonato <carlo.nonato@minervasys.tech>
Content-Type: multipart/alternative; boundary="000000000000129f0405f9ac1448"

--000000000000129f0405f9ac1448
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

You put my nose into the problem. Thank you.
I am going to use your point.
Let's see what happens.

Regards,
Oleg


=D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 10:37, Mic=
hal Orzel <michal.orzel@amd.com>:

> Hi Oleg,
>
> On 19/04/2023 09:03, Oleg Nikitenko wrote:
> >
> >
> >
> > Hello Stefano,
> >
> > Thanks for the clarification.
> > My company uses yocto for image generation.
> > What kind of information do you need to consult me in this case ?
> >
> > Maybe modules sizes/addresses which were mentioned by @Julien Grall
> <mailto:julien@xen.org> ?
>
> Sorry for jumping into discussion, but FWICS the Xen command line you
> provided seems to be not the one
> Xen booted with. The error you are observing most likely is due to dom0
> colors configuration not being
> specified (i.e. lack of dom0_colors=3D<> parameter). Although in the comm=
and
> line you provided, this parameter
> is set, I strongly doubt that this is the actual command line in use.
>
> You wrote:
> xen,xen-bootargs =3D "console=3Ddtuart dtuart=3Dserial0 dom0_mem=3D1600M
> dom0_max_vcpus=3D2 dom0_vcpus_pin bootscrub=3D0 vwfi=3Dnative sched=3Dnul=
l
> timer_slop=3D0 way_szize=3D65536 xen_colors=3D0-3 dom0_colors=3D4-7";
>
> but:
> 1) way_szize has a typo
> 2) you specified 4 colors (0-3) for Xen, but the boot log says that Xen
> has only one:
> (XEN) Xen color(s): [ 0 ]
>
> This makes me believe that no colors configuration actually end up in
> command line that Xen booted with.
> Single color for Xen is a "default if not specified" and way size was
> probably calculated by asking HW.
>
> So I would suggest to first cross-check the command line in use.
>
> ~Michal
>
>
> >
> > Regards,
> > Oleg
> >
> > =D0=B2=D1=82, 18 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 20:44,=
 Stefano Stabellini <sstabellini@kernel.org
> <mailto:sstabellini@kernel.org>>:
> >
> >     On Tue, 18 Apr 2023, Oleg Nikitenko wrote:
> >     > Hi Julien,
> >     >
> >     > >> This feature has not been merged in Xen upstream yet
> >     >
> >     > > would assume that upstream + the series on the ML [1] work
> >     >
> >     > Please clarify this point.
> >     > Because the two thoughts are controversial.
> >
> >     Hi Oleg,
> >
> >     As Julien wrote, there is nothing controversial. As you are aware,
> >     Xilinx maintains a separate Xen tree specific for Xilinx here:
> >     https://github.com/xilinx/xen <https://github.com/xilinx/xen>
> >
> >     and the branch you are using (xlnx_rebase_4.16) comes from there.
> >
> >
> >     Instead, the upstream Xen tree lives here:
> >     https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>
> >
> >
> >     The Cache Coloring feature that you are trying to configure is
> present
> >     in xlnx_rebase_4.16, but not yet present upstream (there is an
> >     outstanding patch series to add cache coloring to Xen upstream but =
it
> >     hasn't been merged yet.)
> >
> >
> >     Anyway, if you are using xlnx_rebase_4.16 it doesn't matter too muc=
h
> for
> >     you as you already have Cache Coloring as a feature there.
> >
> >
> >     I take you are using ImageBuilder to generate the boot
> configuration? If
> >     so, please post the ImageBuilder config file that you are using.
> >
> >     But from the boot message, it looks like the colors configuration f=
or
> >     Dom0 is incorrect.
> >
>

--000000000000129f0405f9ac1448
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Michal,</div><div><br></div><div></div><div>You pu=
t my nose into the problem. Thank you.</div><div>I am going to use your poi=
nt.</div><div>Let&#39;s see what happens.</div><div><br></div><div>Regards,=
</div><div>Oleg<br></div><div><br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">=D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80=
. 2023=E2=80=AF=D0=B3. =D0=B2 10:37, Michal Orzel &lt;<a href=3D"mailto:mic=
hal.orzel@amd.com">michal.orzel@amd.com</a>&gt;:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Oleg,<br>
<br>
On 19/04/2023 09:03, Oleg Nikitenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; <br>
&gt; <br>
&gt; Hello Stefano,<br>
&gt; <br>
&gt; Thanks for the clarification.<br>
&gt; My company uses yocto for image generation.<br>
&gt; What kind of information do you need to consult me in this case ?<br>
&gt; <br>
&gt; Maybe modules sizes/addresses which were mentioned by @Julien Grall &l=
t;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org=
</a>&gt; ?<br>
<br>
Sorry for jumping into discussion, but FWICS the Xen command line you provi=
ded seems to be not the one<br>
Xen booted with. The error you are observing most likely is due to dom0 col=
ors configuration not being<br>
specified (i.e. lack of dom0_colors=3D&lt;&gt; parameter). Although in the =
command line you provided, this parameter<br>
is set, I strongly doubt that this is the actual command line in use.<br>
<br>
You wrote:<br>
xen,xen-bootargs =3D &quot;console=3Ddtuart dtuart=3Dserial0 dom0_mem=3D160=
0M dom0_max_vcpus=3D2 dom0_vcpus_pin bootscrub=3D0 vwfi=3Dnative sched=3Dnu=
ll timer_slop=3D0 way_szize=3D65536 xen_colors=3D0-3 dom0_colors=3D4-7&quot=
;;<br>
<br>
but:<br>
1) way_szize has a typo<br>
2) you specified 4 colors (0-3) for Xen, but the boot log says that Xen has=
 only one:<br>
(XEN) Xen color(s): [ 0 ]<br>
<br>
This makes me believe that no colors configuration actually end up in comma=
nd line that Xen booted with.<br>
Single color for Xen is a &quot;default if not specified&quot; and way size=
 was probably calculated by asking HW.<br>
<br>
So I would suggest to first cross-check the command line in use.<br>
<br>
~Michal<br>
<br>
<br>
&gt; <br>
&gt; Regards,<br>
&gt; Oleg<br>
&gt; <br>
&gt; =D0=B2=D1=82, 18 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 20:44=
, Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabel=
lini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Tue, 18 Apr 2023, Oleg Nikitenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi Julien,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; This feature has not been merged in X=
en upstream yet<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; would assume that upstream + the series o=
n the ML [1] work<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Please clarify this point.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Because the two thoughts are controversial.<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Oleg,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0As Julien wrote, there is nothing controversial. As=
 you are aware,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Xilinx maintains a separate Xen tree specific for X=
ilinx here:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/xilinx/xen" rel=3D"no=
referrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=
=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/xilinx/xen</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0and the branch you are using (xlnx_rebase_4.16) com=
es from there.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Instead, the upstream Xen tree lives here:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.=
git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.o=
rg/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.o=
rg/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">ht=
tps://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The Cache Coloring feature that you are trying to c=
onfigure is present<br>
&gt;=C2=A0 =C2=A0 =C2=A0in xlnx_rebase_4.16, but not yet present upstream (=
there is an<br>
&gt;=C2=A0 =C2=A0 =C2=A0outstanding patch series to add cache coloring to X=
en upstream but it<br>
&gt;=C2=A0 =C2=A0 =C2=A0hasn&#39;t been merged yet.)<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Anyway, if you are using xlnx_rebase_4.16 it doesn&=
#39;t matter too much for<br>
&gt;=C2=A0 =C2=A0 =C2=A0you as you already have Cache Coloring as a feature=
 there.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I take you are using ImageBuilder to generate the b=
oot configuration? If<br>
&gt;=C2=A0 =C2=A0 =C2=A0so, please post the ImageBuilder config file that y=
ou are using.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0But from the boot message, it looks like the colors=
 configuration for<br>
&gt;=C2=A0 =C2=A0 =C2=A0Dom0 is incorrect.<br>
&gt; <br>
</blockquote></div>

--000000000000129f0405f9ac1448--

