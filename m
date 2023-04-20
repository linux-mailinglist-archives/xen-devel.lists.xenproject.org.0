Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 339E66E8D26
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 10:51:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523969.814438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppQ01-0001GX-Mj; Thu, 20 Apr 2023 08:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523969.814438; Thu, 20 Apr 2023 08:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppQ01-0001E7-K0; Thu, 20 Apr 2023 08:50:41 +0000
Received: by outflank-mailman (input) for mailman id 523969;
 Thu, 20 Apr 2023 08:50:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7ocM=AL=gmail.com=oleshiiwood@srs-se1.protection.inumbo.net>)
 id 1ppPzz-0001Dz-R9
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 08:50:39 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b94d160-df58-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 10:50:38 +0200 (CEST)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1a50cb65c92so7733865ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Apr 2023 01:50:38 -0700 (PDT)
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
X-Inumbo-ID: 6b94d160-df58-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681980637; x=1684572637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C7UaJjs9bvBkYzqOF6kajdzJbTKr/ZiaP1QqK+7GkNI=;
        b=MkNb928H4ghrEc9c7ucgz55RSqcrf/k3Ei20sz/WOd8qmRbxXJ1pWO2T3FBEdpUwPF
         17McAedy9E+ISphvtc1wiUDoagGy263DShj2aiRPfmA0fCVOSg5or5BuX13IzrR7YtXP
         IDjg1N6d99/tZgJpHdFe1g2lq0xwU9wGFExYYRU0v4N2+kMrXuEBL3mchv+8tU6Qc90E
         hwErR/habZ5VcIFSXvbLpkHxXxcFG9HPQiX5UBsTvl7BWei94iFgLN8Npx8VCkbElgmy
         T9VEnIyiqaFtP66vun9ABtglvAldkcZBaoJ6QM4+bQeJt93Owba9mmDQN94NOPMYGKOc
         yUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681980637; x=1684572637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C7UaJjs9bvBkYzqOF6kajdzJbTKr/ZiaP1QqK+7GkNI=;
        b=R7LUv97+whl3yIQle8Ty/g1ZrzgNuieytcL3QHbIMPfeNoc+NkxaPzxRV2zffc8fxq
         aaPoEwRfSKlhn9de8fRU+ELQcgId1KAycRPI6gc5zWJYXY5uLwwPFGU/cONCO1/X0Rzp
         pPItBtFFNGn5bz9qqDgPP1CJndVG/nsLsSkk55Rjhv45NsZ23iffw6cNxDlSoodHvKa7
         8Z1kLbFKdcz09cXKb3pqkxFFrl06By4kwy9ktMcVYJyJvF4/Hhbf0/FjWClCLeEIgTgi
         /1cHbmgXMF2MY2zP3MDh1qLUesAcZRVffB6TWxdslqe3NaxgjOqWiw/RDokGvl4XhGW4
         1Nag==
X-Gm-Message-State: AAQBX9frSzLE9NkjS9LNkwM8nVXBLwpkFWdYePNe2qLzygDaWcJfWpAC
	qQUPhksCRD50+FJKHUGh2Pxc3BklkvNI2g+3kVI=
X-Google-Smtp-Source: AKy350YwvZ6FtJvtNFDa8S/UL7XlUjfB+hmqz13+mA3AvHBBZKIjAefrcjqh61EF2qtRWFqyFXmPiDi12FdfojPsxEo=
X-Received: by 2002:a17:903:8c7:b0:1a0:5349:6606 with SMTP id
 lk7-20020a17090308c700b001a053496606mr865597plb.56.1681980636533; Thu, 20 Apr
 2023 01:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <CA+SAi2uwrKFYN1tkYJ1_LVC-f+b-xb46RWTUv6wDOUO41yx8zg@mail.gmail.com>
 <bad09a6f-d41e-ab8e-2291-7fde3b646710@xen.org> <CA+SAi2uPZ=Dq1GxF9Kj1zCO=nbb55ruVG31kH-TgdpR6bLznvA@mail.gmail.com>
 <CA+SAi2s4WLiMEVa3u8rJRNZDpCpLTvnDygpObSUKxau-Q8dfyA@mail.gmail.com>
 <64326e46-096e-0f86-2aa9-31a72d3cd004@xen.org> <CA+SAi2u2=7h=Lo=bTC8YzmzidOErYaQGi=hpoG3w7tdM4LUzFw@mail.gmail.com>
 <alpine.DEB.2.22.394.2304181044080.15580@ubuntu-linux-20-04-desktop>
 <CA+SAi2srSq5Vwq8KL4TGc-GC3OjsFf=d-yKLVPw=C0KfBW67eA@mail.gmail.com>
 <58cae772-dd3b-31f4-9849-9c2597f6eae6@amd.com> <CA+SAi2vU0i9trrdgCusB0WYJmYLqjXRk9qSGALjMbKYvmPGcvw@mail.gmail.com>
 <CA+SAi2tc_3r3SAXVOmdbDJXvppaXkSdMH0iv-fG1zUwG3Ub_hQ@mail.gmail.com> <alpine.DEB.2.22.394.2304191304570.15580@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2304191304570.15580@ubuntu-linux-20-04-desktop>
From: Oleg Nikitenko <oleshiiwood@gmail.com>
Date: Thu, 20 Apr 2023 11:56:43 +0300
Message-ID: <CA+SAi2tEbV0Y=p=NhT_8H1SeBzqXxUTS5R9pZu3_UYn5zU952A@mail.gmail.com>
Subject: Re: xen cache colors in ARM
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Carlo Nonato <carlo.nonato@minervasys.tech>
Content-Type: multipart/alternative; boundary="0000000000005c1af205f9c0a284"

--0000000000005c1af205f9c0a284
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Stefano.

I am going to do it today.

Regards,
O.

=D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 23:05, Ste=
fano Stabellini <sstabellini@kernel.org>:

> On Wed, 19 Apr 2023, Oleg Nikitenko wrote:
> > Hi Michal,
> >
> > I corrected xen's command line.
> > Now it is
> > xen,xen-bootargs =3D "console=3Ddtuart dtuart=3Dserial0 dom0_mem=3D1600=
M
> dom0_max_vcpus=3D2 dom0_vcpus_pin bootscrub=3D0 vwfi=3Dnative sched=3Dnul=
l
> > timer_slop=3D0 way_size=3D65536 xen_colors=3D0-3 dom0_colors=3D4-7";
>
> 4 colors is way too many for xen, just do xen_colors=3D0-0. There is no
> advantage in using more than 1 color for Xen.
>
> 4 colors is too few for dom0, if you are giving 1600M of memory to Dom0.
> Each color is 256M. For 1600M you should give at least 7 colors. Try:
>
> xen_colors=3D0-0 dom0_colors=3D1-8
>
>
>
> > Unfortunately the result was the same.
> >
> > (XEN)  - Dom0 mode: Relaxed
> > (XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
> > (XEN) P2M: 3 levels with order-1 root, VTCR 0x0000000080023558
> > (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
> > (XEN) Coloring general information
> > (XEN) Way size: 64kB
> > (XEN) Max. number of colors available: 16
> > (XEN) Xen color(s): [ 0 ]
> > (XEN) alternatives: Patching with alt table 00000000002cc690 ->
> 00000000002ccc0c
> > (XEN) Color array allocation failed for dom0
> > (XEN)
> > (XEN) ****************************************
> > (XEN) Panic on CPU 0:
> > (XEN) Error creating domain 0
> > (XEN) ****************************************
> > (XEN)
> > (XEN) Reboot in five seconds...
> >
> > I am going to find out how command line arguments passed and parsed.
> >
> > Regards,
> > Oleg
> >
> > =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 11:25,=
 Oleg Nikitenko <oleshiiwood@gmail.com>:
> >       Hi Michal,
> >
> > You put my nose into the problem. Thank you.
> > I am going to use your point.
> > Let's see what happens.
> >
> > Regards,
> > Oleg
> >
> >
> > =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 10:37,=
 Michal Orzel <michal.orzel@amd.com>:
> >       Hi Oleg,
> >
> >       On 19/04/2023 09:03, Oleg Nikitenko wrote:
> >       >
> >       >
> >       >
> >       > Hello Stefano,
> >       >
> >       > Thanks for the clarification.
> >       > My company uses yocto for image generation.
> >       > What kind of information do you need to consult me in this case=
 ?
> >       >
> >       > Maybe modules sizes/addresses which were mentioned by @Julien
> Grall <mailto:julien@xen.org> ?
> >
> >       Sorry for jumping into discussion, but FWICS the Xen command line
> you provided seems to be not the one
> >       Xen booted with. The error you are observing most likely is due t=
o
> dom0 colors configuration not being
> >       specified (i.e. lack of dom0_colors=3D<> parameter). Although in =
the
> command line you provided, this parameter
> >       is set, I strongly doubt that this is the actual command line in
> use.
> >
> >       You wrote:
> >       xen,xen-bootargs =3D "console=3Ddtuart dtuart=3Dserial0 dom0_mem=
=3D1600M
> dom0_max_vcpus=3D2 dom0_vcpus_pin bootscrub=3D0 vwfi=3Dnative
> >       sched=3Dnull timer_slop=3D0 way_szize=3D65536 xen_colors=3D0-3
> dom0_colors=3D4-7";
> >
> >       but:
> >       1) way_szize has a typo
> >       2) you specified 4 colors (0-3) for Xen, but the boot log says
> that Xen has only one:
> >       (XEN) Xen color(s): [ 0 ]
> >
> >       This makes me believe that no colors configuration actually end u=
p
> in command line that Xen booted with.
> >       Single color for Xen is a "default if not specified" and way size
> was probably calculated by asking HW.
> >
> >       So I would suggest to first cross-check the command line in use.
> >
> >       ~Michal
> >
> >
> >       >
> >       > Regards,
> >       > Oleg
> >       >
> >       > =D0=B2=D1=82, 18 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=
=B2 20:44, Stefano Stabellini <
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>:
> >       >
> >       >     On Tue, 18 Apr 2023, Oleg Nikitenko wrote:
> >       >     > Hi Julien,
> >       >     >
> >       >     > >> This feature has not been merged in Xen upstream yet
> >       >     >
> >       >     > > would assume that upstream + the series on the ML [1]
> work
> >       >     >
> >       >     > Please clarify this point.
> >       >     > Because the two thoughts are controversial.
> >       >
> >       >     Hi Oleg,
> >       >
> >       >     As Julien wrote, there is nothing controversial. As you are
> aware,
> >       >     Xilinx maintains a separate Xen tree specific for Xilinx
> here:
> >       >     https://github.com/xilinx/xen <https://github.com/xilinx/xe=
n
> >
> >       >
> >       >     and the branch you are using (xlnx_rebase_4.16) comes from
> there.
> >       >
> >       >
> >       >     Instead, the upstream Xen tree lives here:
> >       >     https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>
> >       >
> >       >
> >       >     The Cache Coloring feature that you are trying to configure
> is present
> >       >     in xlnx_rebase_4.16, but not yet present upstream (there is
> an
> >       >     outstanding patch series to add cache coloring to Xen
> upstream but it
> >       >     hasn't been merged yet.)
> >       >
> >       >
> >       >     Anyway, if you are using xlnx_rebase_4.16 it doesn't matter
> too much for
> >       >     you as you already have Cache Coloring as a feature there.
> >       >
> >       >
> >       >     I take you are using ImageBuilder to generate the boot
> configuration? If
> >       >     so, please post the ImageBuilder config file that you are
> using.
> >       >
> >       >     But from the boot message, it looks like the colors
> configuration for
> >       >     Dom0 is incorrect.
> >       >
> >
> >
> >

--0000000000005c1af205f9c0a284
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Stefano.</div><div><br></div><div>I am going t=
o do it today.</div><div><br></div><div>Regards,</div><div>O.<br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D1=
=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 23:05, Stefan=
o Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kern=
el.org</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Wed, 19 Apr 2023, Oleg Nikitenko wrote:<br>
&gt; Hi Michal,<br>
&gt; <br>
&gt; I corrected xen&#39;s command line.<br>
&gt; Now it is<br>
&gt; xen,xen-bootargs =3D &quot;console=3Ddtuart dtuart=3Dserial0 dom0_mem=
=3D1600M dom0_max_vcpus=3D2 dom0_vcpus_pin bootscrub=3D0 vwfi=3Dnative sche=
d=3Dnull<br>
&gt; timer_slop=3D0 way_size=3D65536 xen_colors=3D0-3 dom0_colors=3D4-7&quo=
t;;<br>
<br>
4 colors is way too many for xen, just do xen_colors=3D0-0. There is no<br>
advantage in using more than 1 color for Xen.<br>
<br>
4 colors is too few for dom0, if you are giving 1600M of memory to Dom0.<br=
>
Each color is 256M. For 1600M you should give at least 7 colors. Try:<br>
<br>
xen_colors=3D0-0 dom0_colors=3D1-8<br>
<br>
<br>
<br>
&gt; Unfortunately the result was the same.<br>
&gt; <br>
&gt; (XEN) =C2=A0- Dom0 mode: Relaxed<br>
&gt; (XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID<br>
&gt; (XEN) P2M: 3 levels with order-1 root, VTCR 0x0000000080023558<br>
&gt; (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource<br>
&gt; (XEN) Coloring general information<br>
&gt; (XEN) Way size: 64kB<br>
&gt; (XEN) Max. number of colors available: 16<br>
&gt; (XEN) Xen color(s): [ 0 ]<br>
&gt; (XEN) alternatives: Patching with alt table 00000000002cc690 -&gt; 000=
00000002ccc0c<br>
&gt; (XEN) Color array allocation failed for dom0<br>
&gt; (XEN)<br>
&gt; (XEN) ****************************************<br>
&gt; (XEN) Panic on CPU 0:<br>
&gt; (XEN) Error creating domain 0<br>
&gt; (XEN) ****************************************<br>
&gt; (XEN)<br>
&gt; (XEN) Reboot in five seconds...<br>
&gt; <br>
&gt; I am going to find out how command line arguments passed and parsed.<b=
r>
&gt; <br>
&gt; Regards,<br>
&gt; Oleg<br>
&gt; <br>
&gt; =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 11:25=
, Oleg Nikitenko &lt;<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bl=
ank">oleshiiwood@gmail.com</a>&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Michal,<br>
&gt; <br>
&gt; You put my nose into the problem. Thank you.<br>
&gt; I am going to use your point.<br>
&gt; Let&#39;s see what happens.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Oleg<br>
&gt; <br>
&gt; <br>
&gt; =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 10:37=
, Michal Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank=
">michal.orzel@amd.com</a>&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Oleg,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On 19/04/2023 09:03, Oleg Nikitenko wrote:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hello Stefano,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thanks for the clarification.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; My company uses yocto for image generat=
ion.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; What kind of information do you need to=
 consult me in this case ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Maybe modules sizes/addresses which wer=
e mentioned by @Julien Grall &lt;mailto:<a href=3D"mailto:julien@xen.org" t=
arget=3D"_blank">julien@xen.org</a>&gt; ?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Sorry for jumping into discussion, but FWICS=
 the Xen command line you provided seems to be not the one<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Xen booted with. The error you are observing=
 most likely is due to dom0 colors configuration not being<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0specified (i.e. lack of dom0_colors=3D&lt;&g=
t; parameter). Although in the command line you provided, this parameter<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0is set, I strongly doubt that this is the ac=
tual command line in use.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0You wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xen,xen-bootargs =3D &quot;console=3Ddtuart =
dtuart=3Dserial0 dom0_mem=3D1600M dom0_max_vcpus=3D2 dom0_vcpus_pin bootscr=
ub=3D0 vwfi=3Dnative<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sched=3Dnull timer_slop=3D0 way_szize=3D6553=
6 xen_colors=3D0-3 dom0_colors=3D4-7&quot;;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0but:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01) way_szize has a typo<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A02) you specified 4 colors (0-3) for Xen, but=
 the boot log says that Xen has only one:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(XEN) Xen color(s): [ 0 ]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0This makes me believe that no colors configu=
ration actually end up in command line that Xen booted with.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Single color for Xen is a &quot;default if n=
ot specified&quot; and way size was probably calculated by asking HW.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0So I would suggest to first cross-check the =
command line in use.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0~Michal<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Oleg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =D0=B2=D1=82, 18 =D0=B0=D0=BF=D1=80. 20=
23=E2=80=AF=D0=B3. =D0=B2 20:44, Stefano Stabellini &lt;<a href=3D"mailto:s=
stabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mai=
lto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini=
@kernel.org</a>&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0On Tue, 18 Apr 2023,=
 Oleg Nikitenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi Julien,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; This f=
eature has not been merged in Xen upstream yet<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; would assu=
me that upstream + the series on the ML [1] work<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Please clarify =
this point.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Because the two=
 thoughts are controversial.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Hi Oleg,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0As Julien wrote, the=
re is nothing controversial. As you are aware,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Xilinx maintains a s=
eparate Xen tree specific for Xilinx here:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://g=
ithub.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0and the branch you a=
re using (xlnx_rebase_4.16) comes from there.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Instead, the upstrea=
m Xen tree lives here:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://x=
enbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=
=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt=
;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D=
"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;=
a=3Dsummary</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0The Cache Coloring f=
eature that you are trying to configure is present<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0in xlnx_rebase_4.16,=
 but not yet present upstream (there is an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0outstanding patch se=
ries to add cache coloring to Xen upstream but it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0hasn&#39;t been merg=
ed yet.)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Anyway, if you are u=
sing xlnx_rebase_4.16 it doesn&#39;t matter too much for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0you as you already h=
ave Cache Coloring as a feature there.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0I take you are using=
 ImageBuilder to generate the boot configuration? If<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0so, please post the =
ImageBuilder config file that you are using.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0But from the boot me=
ssage, it looks like the colors configuration for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Dom0 is incorrect.<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt; <br>
&gt; </blockquote></div>

--0000000000005c1af205f9c0a284--

